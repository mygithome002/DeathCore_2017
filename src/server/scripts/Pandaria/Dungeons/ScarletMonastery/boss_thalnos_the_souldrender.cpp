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
	TALK_AGGRO             = 0, // We hunger for vengeance!                    27829
	TALK_DEATH             = 1, // Can this be... the end, at last...?         27830
	TALK_KILL_PLAYER       = 2, // More... More souls!                         27833
	TALK_FALLEN_CRUSADER   = 3, // No rest...for the angry dead!               27831
	TALK_EVICTED_SOUL      = 4, // Seek out a vessel...and return!             27834
	TALK_EMPOWERING_SPIRIT = 5, // Claim a body, and wreak terrible vengeance! 27835
	TALK_INTRO             = 6, // My endless agony shall be yours, as well!   27832
};

enum Spells
{
	SPELL_EVICT_SOUL               = 115297,
	SPELL_RAISE_FALLEN_CRUSADER    = 115139,
	SPELL_SPIRIT_GALE              = 115289,
	SPELL_SPIRIT_GALE_DOT          = 115291,
	SPELL_SUMMON_EMPOWERING_SPIRIT = 115147,
	SPELL_EMPOWER_ZOMBIE           = 115157,
	SPELL_MIND_ROT                 = 115143,
	SPELL_MIND_ROT_AURA            = 115144,
	SPELL_EVICTED_SOUL_FIND_TARGET = 115309,
};

enum Events
{
	EVENT_EVICT_SOUL               = 1,
	EVENT_RAISE_FALLEN_CRUSADER    = 2,
	EVENT_SPIRIT_GALE              = 3,
	EVENT_SUMMON_EMPOWERING_SPIRIT = 4,
};

enum eCreatures
{
	CREATURE_EVICTED_SOUL     = 59974,
	CREATURE_FALLEN_CRUSADER  = 59884,
	CREATURE_EMPOWERED_SPIRIT = 59893,
	CREATURE_EMPOWERED_ZOMBIE = 59930,
};

enum Achievement
{
	ACHIEVEMENT_EMPOWERED_SPIRITUALIST = 6946,
};

// Thalnos the Soulrender - 59789
class boss_thalnos_the_soulrender : public CreatureScript
{
    public:
        boss_thalnos_the_soulrender() : CreatureScript("boss_thalnos_the_soulrender") { }

        struct boss_thalnos_the_soulrenderAI : public BossAI
        {
            boss_thalnos_the_soulrenderAI(Creature* creature) : BossAI(creature, DATA_THALNOS_THE_SOULRENDER)
            {
				pInstance = creature->GetInstanceScript();
            }

			InstanceScript* pInstance;
			bool intro = false;

			void MoveInLineOfSight(Unit* who)
			{
				if (who && who->GetTypeId() == TYPEID_PLAYER && me->IsValidAttackTarget(who))
					if (intro == false && me->IsWithinDistInMap(who, 30.0f))
					{
						intro = true;
						Talk(TALK_INTRO);
						ScriptedAI::MoveInLineOfSight(who);
					}
			}

            void Reset() override
            {
				me->setFaction(16);
				switch (me->GetMap()->GetDifficulty())
				{
					case DUNGEON_DIFFICULTY_NORMAL:
						me->SetMaxHealth(27750);
						me->SetFullHealth();
						me->SetLevel(33);
						break;
					case DUNGEON_DIFFICULTY_HEROIC:
						me->SetMaxHealth(12647760);
						me->SetFullHealth();
						me->SetLevel(92);
						break;
				}
            }

            void KilledUnit(Unit* victim)
            {
				if (victim->GetTypeId() == TYPEID_PLAYER)
					Talk(TALK_KILL_PLAYER);
            }

            void JustDied(Unit* killer)
            {
				if (killer->GetTypeId() == TYPEID_PLAYER)
					Talk(TALK_DEATH);
            }

            void EnterCombat(Unit* who)
            {
				events.ScheduleEvent(EVENT_EVICT_SOUL, 10000);
				events.ScheduleEvent(EVENT_RAISE_FALLEN_CRUSADER, 4500);
				events.ScheduleEvent(EVENT_SPIRIT_GALE, 10000);
				events.ScheduleEvent(EVENT_SUMMON_EMPOWERING_SPIRIT, 30000);

				if (who->GetTypeId() == TYPEID_PLAYER)
					Talk(TALK_AGGRO);
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
						case EVENT_EVICT_SOUL:
						{
							Talk(TALK_EVICTED_SOUL);
							if (Unit* target = SelectTarget(SelectAggroTarget::SELECT_TARGET_RANDOM, 0, 40.0f, true))
							{
								DoCast(target, SPELL_EVICT_SOUL);
							}
							events.ScheduleEvent(EVENT_EVICT_SOUL, 10000);
							break;
						}

						case EVENT_RAISE_FALLEN_CRUSADER:
						{
							Talk(TALK_FALLEN_CRUSADER);
							DoCast(SPELL_RAISE_FALLEN_CRUSADER);
							events.ScheduleEvent(EVENT_RAISE_FALLEN_CRUSADER, 25000);
							break;
						}

						case EVENT_SPIRIT_GALE:
						{
							if (Unit* target = SelectTarget(SelectAggroTarget::SELECT_TARGET_RANDOM, 0, 40.0f, true))
							{
								DoCast(SPELL_SPIRIT_GALE);
							}
							events.ScheduleEvent(EVENT_SPIRIT_GALE, 10000);
							break;
						}

						case EVENT_SUMMON_EMPOWERING_SPIRIT:
						{
							Talk(TALK_EMPOWERING_SPIRIT);
							DoCast(SPELL_SUMMON_EMPOWERING_SPIRIT);
							events.ScheduleEvent(EVENT_SUMMON_EMPOWERING_SPIRIT, 30000);
							break;
						}
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_thalnos_the_soulrenderAI(creature);
        }
};

// Evicted Soul - 59974
class mob_evicted_soul : public CreatureScript
{
	public:
		mob_evicted_soul() : CreatureScript("mob_evicted_soul") { }

		struct mob_evicted_soulAI : public ScriptedAI
		{
			mob_evicted_soulAI(Creature* creature) : ScriptedAI(creature)
			{
				pInstance = creature->GetInstanceScript();
			}

			InstanceScript* pInstance;

			void Reset() override
			{
				me->setFaction(16);
				switch (me->GetMap()->GetDifficulty())
				{
					case DUNGEON_DIFFICULTY_NORMAL:
						me->SetMaxHealth(1057);
						me->SetFullHealth();
						me->SetLevel(33);
						break;
					case DUNGEON_DIFFICULTY_HEROIC:
						me->SetMaxHealth(196970);
						me->SetFullHealth();
						me->SetLevel(92);
						break;
				}

				DoCast(SPELL_EVICTED_SOUL_FIND_TARGET);
			}

			void UpdateAI(uint32 diff) override
			{
				if (!UpdateVictim())
					return;

				DoMeleeAttackIfReady();
			}
		};

		CreatureAI* GetAI(Creature* creature) const override
		{
			return new mob_evicted_soulAI(creature);
		}
};

// Fallen Crusader - 59884
class mob_fallen_crusader : public CreatureScript
{
	public:
		mob_fallen_crusader() : CreatureScript("mob_fallen_crusader") { }

		struct mob_fallen_crusaderAI : public ScriptedAI
		{
			mob_fallen_crusaderAI(Creature* creature) : ScriptedAI(creature)
			{
				pInstance = creature->GetInstanceScript();
			}

			InstanceScript* pInstance;

			void Reset() override
			{
				me->setFaction(16);
				switch (me->GetMap()->GetDifficulty())
				{
					case DUNGEON_DIFFICULTY_NORMAL:
						me->SetMaxHealth(1057);
						me->SetFullHealth();
						me->SetLevel(33);
						break;
					case DUNGEON_DIFFICULTY_HEROIC:
						me->SetMaxHealth(196970);
						me->SetFullHealth();
						me->SetLevel(92);
						break;
				}

				DoCast(me, SPELL_MIND_ROT);
			}

			void UpdateAI(uint32 diff) override
			{
				if (!UpdateVictim())
					return;

				DoMeleeAttackIfReady();
			}
		};

		CreatureAI* GetAI(Creature* creature) const override
		{
			return new mob_fallen_crusaderAI(creature);
		}
};

// Empowered Spirit - 59893
class mob_empowered_spirit : public CreatureScript
{
	public:
		mob_empowered_spirit() : CreatureScript("mob_empowered_spirit") { }

		struct mob_empowered_spiritAI : public ScriptedAI
		{
			mob_empowered_spiritAI(Creature* creature) : ScriptedAI(creature)
			{
				pInstance = creature->GetInstanceScript();
			}

			InstanceScript* pInstance;

			void Reset() override
			{
				me->setFaction(16);
				switch (me->GetMap()->GetDifficulty())
				{
					case DUNGEON_DIFFICULTY_NORMAL:
						me->SetMaxHealth(2114);
						me->SetFullHealth();
						me->SetLevel(33);
						break;
					case DUNGEON_DIFFICULTY_HEROIC:
						me->SetMaxHealth(421592);
						me->SetFullHealth();
						me->SetLevel(92);
						break;
				}

				DoCast(SPELL_EMPOWER_ZOMBIE);
			}

			void UpdateAI(uint32 diff) override
			{
				if (!UpdateVictim())
					return;

				DoMeleeAttackIfReady();
			}
		};

		CreatureAI* GetAI(Creature* creature) const override
		{
			return new mob_empowered_spiritAI(creature);
		}
};

// Empowered Zombie - 59930
class mob_empowered_zombie : public CreatureScript
{
	public:
		mob_empowered_zombie() : CreatureScript("mob_empowered_zombie") { }

		struct mob_empowered_zombieAI : public ScriptedAI
		{
			mob_empowered_zombieAI(Creature* creature) : ScriptedAI(creature)
			{
				pInstance = creature->GetInstanceScript();
			}

			InstanceScript* pInstance;

			void Reset() override
			{
				me->setFaction(16);
				switch (me->GetMap()->GetDifficulty())
				{
					case DUNGEON_DIFFICULTY_NORMAL:
						me->SetMaxHealth(52850);
						me->SetFullHealth();
						me->SetLevel(33);
						break;
					case DUNGEON_DIFFICULTY_HEROIC:
						me->SetMaxHealth(19697050);
						me->SetFullHealth();
						me->SetLevel(92);
						break;
				}
			}

			void UpdateAI(uint32 diff) override
			{
				if (!UpdateVictim())
					return;

				DoMeleeAttackIfReady();
			}
		};

		CreatureAI* GetAI(Creature* creature) const override
		{
			return new mob_empowered_zombieAI(creature);
		}
};

// Spirit Gale - 115289
class spell_spirit_gale : public SpellScriptLoader
{
	public:
		spell_spirit_gale() : SpellScriptLoader("spell_spirit_gale") { }

		class spell_spirit_gale_SpellScript : public SpellScript
		{
			PrepareSpellScript(spell_spirit_gale_SpellScript);

			void HandleAfterHit()
			{
				if (Unit* target = GetHitUnit())
					if (Unit* caster = GetCaster())
						caster->CastSpell(target, SPELL_SPIRIT_GALE_DOT);
			}

			void HandleDamage(SpellEffIndex /*effIndex*/)
			{
				if (Unit* target = GetHitUnit())
				{
					uint8 getDifficulty = target->GetMap()->GetDifficulty();
					if (getDifficulty == DUNGEON_DIFFICULTY_NORMAL)
						SetHitDamage(400);

					if (getDifficulty == DUNGEON_DIFFICULTY_HEROIC)
						SetHitDamage(40000);
				}
			}

			void Register() override
			{
				// AfterHit += SpellHitFn(spell_spirit_gale_SpellScript::HandleAfterHit);
				OnEffectHitTarget += SpellEffectFn(spell_spirit_gale_SpellScript::HandleDamage, EFFECT_1, SPELL_EFFECT_SCHOOL_DAMAGE);
			}
		};

		SpellScript* GetSpellScript() const override
		{
			return new spell_spirit_gale_SpellScript();
		}
};

// Spirit Gale Dot - 115291
class spell_spirit_gale_dot_damage : public SpellScriptLoader
{
	public:
		spell_spirit_gale_dot_damage() : SpellScriptLoader("spell_spirit_gale_dot_damage") { }

		class spell_spirit_gale_dot_damage_SpellScript : public SpellScript
		{
			PrepareSpellScript(spell_spirit_gale_dot_damage_SpellScript);

			void HandleDamage(SpellEffIndex /*effIndex*/)
			{
				if (Unit* target = GetHitUnit())
				{
					uint8 getDifficulty = target->GetMap()->GetDifficulty();
					if (getDifficulty == DUNGEON_DIFFICULTY_NORMAL)
						SetHitDamage(150);
					
					if (getDifficulty == DUNGEON_DIFFICULTY_HEROIC)
						SetHitDamage(15000);
				}
			}

			void Register() override
			{
				OnEffectHitTarget += SpellEffectFn(spell_spirit_gale_dot_damage_SpellScript::HandleDamage, EFFECT_1, SPELL_EFFECT_SCHOOL_DAMAGE);
			}
		};

		SpellScript* GetSpellScript() const override
		{
			return new spell_spirit_gale_dot_damage_SpellScript();
		}
};

// Evict Soul - 115297
class spell_evict_soul : public SpellScriptLoader
{
	public:
		spell_evict_soul() : SpellScriptLoader("spell_evict_soul") { }

		class spell_evict_soul_SpellScript : public SpellScript
		{
			PrepareSpellScript(spell_evict_soul_SpellScript);

			void HandleDamage(SpellEffIndex /*effIndex*/)
			{
				if (Unit* target = GetHitUnit())
				{
					uint8 getDifficulty = target->GetMap()->GetDifficulty();
					if (getDifficulty == DUNGEON_DIFFICULTY_NORMAL)
						SetHitDamage(500);
					
					if (getDifficulty == DUNGEON_DIFFICULTY_HEROIC)
						SetHitDamage(30000);
				}
			}

			void Register() override
			{
				OnEffectHitTarget += SpellEffectFn(spell_evict_soul_SpellScript::HandleDamage, EFFECT_1, SPELL_EFFECT_SCHOOL_DAMAGE);
			}
		};

		SpellScript* GetSpellScript() const override
		{
			return new spell_evict_soul_SpellScript();
		}

		class spell_evict_soul_AuraScript : public AuraScript
		{
			PrepareAuraScript(spell_evict_soul_AuraScript);

			void OnApplyAndRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
			{
				if (Unit* caster = GetCaster())
					if (Unit* target = GetTarget())
					{
						float posX = target->GetPositionX();
						float posY = target->GetPositionY();
						float posZ = target->GetPositionZ();
						float posO = target->GetOrientation();
						Position pos = { posX, posY, posZ, posO };

						caster->SummonCreature(CREATURE_EVICTED_SOUL, pos, TEMPSUMMON_MANUAL_DESPAWN);
					}
			}

			void Register() override
			{
				OnEffectApply += AuraEffectApplyFn(spell_evict_soul_AuraScript::OnApplyAndRemove, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
				OnEffectRemove += AuraEffectRemoveFn(spell_evict_soul_AuraScript::OnApplyAndRemove, EFFECT_2, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
			}
		};

		AuraScript* GetAuraScript() const override
		{
			return new spell_evict_soul_AuraScript();
		}
};

// Empowered Spiritualist - 6946
class achievement_empowered_spiritualist : public AchievementCriteriaScript
{
	public:
		achievement_empowered_spiritualist() : AchievementCriteriaScript("achievement_empowered_spiritualist") { }

		bool OnCheck(Player* /*source*/, Unit* target)
		{
			if (target && target->GetAI()->GetData(ACHIEVEMENT_EMPOWERED_SPIRITUALIST))
				return true;
			return false;
		}
};

void AddSC_boss_thalnos_the_soulrender()
{
	// Boss
    new boss_thalnos_the_soulrender();

	// Mobs
	new mob_evicted_soul();
	new mob_fallen_crusader();
	new mob_empowered_spirit();
	new mob_empowered_zombie();

	// Spells
	new spell_spirit_gale();
	new spell_spirit_gale_dot_damage();
	new spell_evict_soul();

	// Achievements
	new achievement_empowered_spiritualist();
}
