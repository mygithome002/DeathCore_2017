/*
* Copyright (C) 2016 DeathCore <http://www.noffearrdeathproject.org/>
* Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
* Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "scarlet_monastery.h"

enum Texts
{
	TALK_AGGRO = 0,
	TALK_DEATH = 1,
	TALK_WIPE  = 2,
	TALK_KILL1 = 3,
	TALK_KILL2 = 4,
};

enum Spells
{
	SPELL_BLAZING_FISTS         = 114807,
	SPELL_FIRESTORM_KICK        = 113764,
	SPELL_FIRESTORM_CHARGE      = 114487,
	SPELL_RISING_FLAME          = 114410,
	SPELL_SCORCHED_EARTH        = 114460,
	SPELL_SCORCHED_EARTH_SUMMON = 114463,
	SPELL_SCORCHED_EARTH_VISUAL = 114464,
};

enum Events
{
	EVENT_BLAZING_FISTS    = 1,
	EVENT_FIRESTORM_KICK   = 2,
	EVENT_FIRESTORM_CHARGE = 3,
	EVENT_SCORCHED_EARTH   = 4,
};

class boss_brother_korloff : public CreatureScript
{
    public:
        boss_brother_korloff() : CreatureScript("boss_brother_korloff") { }

        struct boss_brother_korloffAI : public BossAI
        {
            boss_brother_korloffAI(Creature* creature) : BossAI(creature, DATA_BROTHER_KORLOFF)
            {
				pInstance = creature->GetInstanceScript();
            }

			InstanceScript* pInstance;
			bool risingFlameTrigger = false;

            void Reset() override
            {
				
            }

            void KilledUnit(Unit* victim)
            {
				if (victim->GetTypeId() == TYPEID_PLAYER)
				{
					switch (urand(1, 2))
					{
						case 1:
							Talk(TALK_KILL1);
							break;
						case 2:
							Talk(TALK_KILL2);
							break;
					}
				}
            }

            void JustDied(Unit* killer)
            {
				if (killer->GetTypeId() == TYPEID_PLAYER)
					Talk(TALK_DEATH);
            }

            void EnterCombat(Unit* who)
            {
				events.ScheduleEvent(EVENT_BLAZING_FISTS, urand(7000, 10000));
				events.ScheduleEvent(EVENT_FIRESTORM_CHARGE, 20000);

				if (who->GetTypeId() == TYPEID_PLAYER)
					Talk(TALK_AGGRO);
            }

			void JustReachedHome()
			{
				_JustReachedHome();
				Talk(TALK_WIPE);
			}

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
						case EVENT_BLAZING_FISTS:
						{
							DoCastVictim(SPELL_BLAZING_FISTS);
							events.ScheduleEvent(EVENT_BLAZING_FISTS, urand(7000, 10000));
							break;
						}

						case EVENT_FIRESTORM_CHARGE:
						{
							if (Unit* target = SelectTarget(SelectAggroTarget::SELECT_TARGET_RANDOM, 0, 50.0f, true))
							{
								DoCast(target, SPELL_FIRESTORM_CHARGE);
								events.ScheduleEvent(EVENT_FIRESTORM_KICK, 1500);
							}

							break;
						}

						case EVENT_FIRESTORM_KICK:
						{
							DoCast(SPELL_FIRESTORM_KICK);
							events.ScheduleEvent(EVENT_FIRESTORM_KICK, 20000);
							break;
						}

						case EVENT_SCORCHED_EARTH:
						{
							DoCast(me, SPELL_SCORCHED_EARTH);
							break;
						}
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_brother_korloffAI(creature);
        }
};

class mob_scorched_earth : public CreatureScript
{
	public:
		mob_scorched_earth() : CreatureScript("mob_scorched_earth") { }

		struct mob_scorched_earthAI : public ScriptedAI
		{
			mob_scorched_earthAI(Creature* creature) : ScriptedAI(creature)
			{
				pInstance = creature->GetInstanceScript();
			}

			InstanceScript* pInstance;

			void Reset() override
			{
				me->AddAura(SPELL_SCORCHED_EARTH_VISUAL, me);
				me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);
				me->setFaction(16);
				me->SetInCombatWithZone();
			}
		};

		CreatureAI* GetAI(Creature* creature) const override
		{
			return new mob_scorched_earthAI(creature);
		}
};

class spell_scorched_earth : public SpellScriptLoader
{
	public:
		spell_scorched_earth() : SpellScriptLoader("spell_scorched_earth") { }

		class spell_scorched_earth_AuraScript : public AuraScript
		{
			PrepareAuraScript(spell_scorched_earth_AuraScript);

			void OnTick(AuraEffect const* /*aurEff*/)
			{
				if (Unit* caster = GetCaster())
					caster->CastSpell(caster, SPELL_SCORCHED_EARTH_SUMMON);
			}

			void Register() override
			{
				OnEffectPeriodic += AuraEffectPeriodicFn(spell_scorched_earth_AuraScript::OnTick, EFFECT_1, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
			}
		};

		AuraScript* GetAuraScript() const override
		{
			return new spell_scorched_earth_AuraScript();
		}
};

void AddSC_boss_brother_korloff()
{
    new boss_brother_korloff();
	new mob_scorched_earth();
	new spell_scorched_earth();
}
