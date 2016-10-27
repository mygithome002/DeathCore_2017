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
	Todo: 
		   - missing texts in db
		   - rewrite him with phases to fix the first 2 yells
		   - timers
*/

enum Bosses
{
	BOSS_NALAK,
};

enum Yells
{
	// #At Pull
	SAY_AGGRO_01 = 0, // "I am born of thunder!" 
	SAY_AGGRO_02 = 2, // "Can you feel the chill windblow? The storm is comming."
	// #In Combat
	SAY_COMBAT_01 = 3, // "The air crackles with anger!" -- STORMCLOUD
	SAY_COMBAT_02 = 4, // "The clouds arc with vengeance!" -#- ARC NOVA
	SAY_COMBAT_03 = 5, // "The sky weeps for your demise!" -#- LIGHTNING TETHER
	// #Death
	SAY_DEATH_01 = 6, // "I am but... The darkness... Before the storm..."

};

enum Timers
{
	TIMER_ARC_NOVA = 30000,
	TIMER_LIGHTNING_TETHER = 30000,
	TIMER_STORMCLOUD = 30000,
};

enum Spells
{
	SPELL_ARC_NOVA = 136338,
	SPELL_LIGHTNING_TETHER = 136339,
	SPELL_STORMCLOUD = 136340,
};

enum Events
{
	EVENT_ARC_NOVA = 1,
	EVENT_LIGHTNING_TETHER = 2,
	EVENT_STORMCLOUD = 3,
};

class npc_boss_nalak : public CreatureScript
{
public:
    npc_boss_nalak() : CreatureScript("npc_boss_nalak") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_boss_nalakAI(creature);
    }

    struct npc_boss_nalakAI : public BossAI
    {
        npc_boss_nalakAI(Creature* creature) : BossAI(creature, BOSS_NALAK) { }

        void Reset()
        {
            events.Reset();
            _Reset();
        }

        void JustDied(Unit* u)
        {
        	Talk(SAY_DEATH_01);
        }

        void EnterCombat(Unit* unit)
        {
        	Talk(SAY_AGGRO_01);
        	Talk(SAY_AGGRO_02);

        	events.ScheduleEvent(EVENT_STORMCLOUD,      	TIMER_STORMCLOUD); 
            events.ScheduleEvent(EVENT_LIGHTNING_TETHER,    TIMER_LIGHTNING_TETHER);
            events.ScheduleEvent(EVENT_ARC_NOVA, 			TIMER_ARC_NOVA);
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);
            while (uint32 eventId = events.ExecuteEvent())
                switch (eventId)
                {
                    case EVENT_LIGHTNING_TETHER:
                    {
                    	Talk(SAY_COMBAT_03);
                        me->CastSpell(me, SPELL_LIGHTNING_TETHER, true);
                        events.ScheduleEvent(EVENT_LIGHTNING_TETHER, TIMER_LIGHTNING_TETHER);
                        break;
                    }
                    case EVENT_STORMCLOUD:
                    {
                    	Talk(SAY_COMBAT_01);
                        me->CastSpell(me, SPELL_STORMCLOUD, true);
                        events.ScheduleEvent(EVENT_STORMCLOUD, TIMER_STORMCLOUD);
                        break;
                    }
                    case EVENT_ARC_NOVA:
                    {
                    	Talk(SAY_COMBAT_02);
                        me->CastSpell(me, SPELL_ARC_NOVA, true);
                        events.ScheduleEvent(EVENT_ARC_NOVA, TIMER_ARC_NOVA);
                        break;
                    }
                    default:
                    	break;
                }
            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_nalak_the_storm_lord()
{
	new npc_boss_nalak();
}
