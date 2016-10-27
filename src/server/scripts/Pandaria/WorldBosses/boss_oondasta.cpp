/*
 * Copyright (C) 2016 DeathCore <http://www.noffearrdeathproject.org/>
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
 
#include "SpellScript.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"

/*
    todo: Correct timings??
*/

enum Bosove
{
    BOSS_OONDASTA,
};

enum Magii
{
    SPELL_CRUSH                 = 137504,
    SPELL_FRILL_BLAST           = 137505,
    SPELL_GROWING_FURY          = 137502,
    SPELL_PIERCING_ROAR         = 137458,
    SPELL_SPIRITFIRE_BEAM_1     = 137511,
    SPELL_SPIRITFIRE_BEAM_2     = 137508,
    SPELL_ALPHA_MALE            = 138931,
};

enum Eventi
{
    EVENT_CRUSH                 = 0,
    EVENT_ALPHA_MALE            = 1,
    EVENT_FRILL_BLAST           = 2,
    EVENT_GROWING_FURY          = 3,
    EVENT_PIERCING_ROAR         = 4,
    EVENT_SPIRITFIRE_BEAM       = 5,
};

enum Taimeri // v milisekundi (1000milisekundi = 1sekunda)
{
	TIMER_ALPHA_MALE = 1000, // moje da ne e blizzlike (prez 1s proverqva dali main tanka ima aurata), sluji za tank swap fazata
	TIMER_CRUSH = 15000, // ???
	TIMER_FRILL_BLAST = 19000, // ???
	TIMER_GROWING_FURY = 30000, // 30 sek
	TIMER_PIERCING_ROAR = 30000, // ???
	TIMER_SPIRITFIRE_BEAM = 45000, // ??? 
};

class boss_oondasta : public CreatureScript
{
public:
    boss_oondasta() : CreatureScript("boss_oondasta") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_oondasta_AI(creature);
    }

    struct boss_oondasta_AI : public BossAI
    {
        boss_oondasta_AI(Creature* creature) : BossAI(creature, BOSS_OONDASTA) { }

        void Reset()
        {
            events.Reset();
            _Reset();
        }

        void KilledUnit(Unit* u) { /* za sega nqma da trqbva */ }

        void EnterCombat(Unit* unit)
        {
        	events.ScheduleEvent(EVENT_ALPHA_MALE,       TIMER_ALPHA_MALE); // da proverqva vsqka sekunda dali tanka ima aurata i ako q nqma da q sloji
            events.ScheduleEvent(EVENT_CRUSH,            TIMER_CRUSH); // nikakva ideq kolko e
            events.ScheduleEvent(EVENT_FRILL_BLAST,      TIMER_FRILL_BLAST); // nikakva ideq kolko e
            events.ScheduleEvent(EVENT_PIERCING_ROAR,    TIMER_PIERCING_ROAR); // nikakva ideq kolko e
            events.ScheduleEvent(EVENT_GROWING_FURY, 	 TIMER_GROWING_FURY); // 30 sekundi (ot sniffera i klipove)
        }

        void EligibleForAlphaMale()
        {
           if(Unit* tanka = me->GetVictim())
           {
                if(!tanka->HasAura(SPELL_ALPHA_MALE)) // tui kato swap-vat aggroto moje da izgubqt aurata (explit)
        			DoCastVictim(SPELL_ALPHA_MALE); // castni alpha male v-u main tanka

        		if(tanka->HasAura(SPELL_CRUSH) && tanka->HasAura(SPELL_ALPHA_MALE)) // tank switch, mahane na aura tui kato ima crush-a i e "slab", ne e "alfa mujkara"
        			tanka->RemoveAura(SPELL_ALPHA_MALE);
        	} else return;
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);
            while (uint32 eventId = events.ExecuteEvent())
                switch (eventId)
                {
                	case EVENT_ALPHA_MALE:
                	{
                		// tva moje bi da trqbva da se prenapishe
                		EligibleForAlphaMale();
        				events.ScheduleEvent(EVENT_ALPHA_MALE, TIMER_ALPHA_MALE);
        				break;
                	}
                    case EVENT_CRUSH:
                    {
                        me->CastSpell(me, SPELL_CRUSH, true);
                        events.ScheduleEvent(EVENT_CRUSH, TIMER_CRUSH);
                        break;
                    }
                    case EVENT_FRILL_BLAST:
                    {
                        me->CastSpell(me, SPELL_FRILL_BLAST, true);
                        events.ScheduleEvent(EVENT_PIERCING_ROAR, TIMER_FRILL_BLAST);
                        break;
                    }
                    case EVENT_PIERCING_ROAR:
                    {
                        me->CastSpell(me, SPELL_PIERCING_ROAR, true);
                        events.ScheduleEvent(EVENT_PIERCING_ROAR, TIMER_PIERCING_ROAR);
                        break;
                    }
                    case EVENT_GROWING_FURY: // castva go prez 30 sek, 10% damage buff
                    {
                        me->CastSpell(me, SPELL_GROWING_FURY, false);
						events.ScheduleEvent(EVENT_GROWING_FURY, TIMER_GROWING_FURY);
                        break;
                    }
                }
            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_oondasta()
{
	new boss_oondasta();
}
