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
 
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "dragon_soul.h"

class npc_twilight_siege_breaker_57259 : public CreatureScript
{
public:
    npc_twilight_siege_breaker_57259() : CreatureScript("npc_twilight_siege_breaker_57259") { }

    struct npc_twilight_siege_breaker_57259AI : public ScriptedAI
    {
        npc_twilight_siege_breaker_57259AI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

        InstanceScript* _instance;
        uint32 m_CharmerGuidLow;

        void Reset()
        {
            m_CharmerGuidLow = 0;
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != WAYPOINT_MOTION_TYPE)
                return;

            bool att = false;
            if (m_CharmerGuidLow == 268530)
            {
                if (id == 7)
                    att = true;
            }
            else
            {
                if (id == 4)
                    att = true;
            }
            if (att)
            {
                if (Creature* npc = me->FindNearestCreature(57261, 10.0f, true))
                {
                    me->Attack(npc, true);
                    npc->Attack(me, true);
                    me->CastSpell(me, 108062);
                }
            }
        }

        void StartAnim(uint32 guid)
        {
            m_CharmerGuidLow = guid;
            switch (m_CharmerGuidLow)
            {
            case 268530:
                me->GetMotionMaster()->MovePath(5725901, false);
                break;
            case 268443:
                me->GetMotionMaster()->MovePath(5725902, false);
                break;
            case 268450:
                me->GetMotionMaster()->MovePath(5725903, false);
                break;
            case 268431:
                me->GetMotionMaster()->MovePath(5725904, false);
                break;
            }
            me->CastSpell(me, 108024);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetDragonSoulAI<npc_twilight_siege_breaker_57259AI>(creature);
    }
};

class npc_twilight_portal_57231 : public CreatureScript
{
public:
    npc_twilight_portal_57231() : CreatureScript("npc_twilight_portal_57231") { }

    enum eEvents
    {
        SUMMON_SIEGE_BREAKER = 1,
    };

    struct npc_twilight_portal_57231AI : public ScriptedAI
    {
        npc_twilight_portal_57231AI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

        EventMap _events;
        InstanceScript* _instance;

        void Reset()
        {
            _events.Reset();
            _events.ScheduleEvent(SUMMON_SIEGE_BREAKER, 2500);
        }

        void JustSummoned(Creature* summon) 
        { 
            CAST_AI(npc_twilight_siege_breaker_57259::npc_twilight_siege_breaker_57259AI, summon->GetAI())->StartAnim(me->GetDBTableGUIDLow());
        }

        void UpdateAI(const uint32 diff)
        {
            _events.Update(diff);

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                case SUMMON_SIEGE_BREAKER:
                    DoSummonSiegeBreaker();
                    _events.ScheduleEvent(SUMMON_SIEGE_BREAKER, urand(1000, 10000));
                    break;
                }
            }

            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

        void DoSummonSiegeBreaker()
        {
            me->CastSpell(me, 108013);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetDragonSoulAI<npc_twilight_portal_57231AI>(creature);
    }
};

class npc_siege_breaker_stalker_57261 : public CreatureScript
{
public:
    npc_siege_breaker_stalker_57261() : CreatureScript("npc_siege_breaker_stalker_57261") { }

    struct npc_siege_breaker_stalker_57261AI : public ScriptedAI
    {
        npc_siege_breaker_stalker_57261AI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

        InstanceScript* _instance;
        void DamageTaken(Unit* attacker, uint32& damage) 
        { 
            if (attacker->GetEntry() == 57259)
                damage = 0;
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return GetDragonSoulAI<npc_siege_breaker_stalker_57261AI>(creature);
    }
};



void AddSC_dragon_soul()
{
    new npc_twilight_portal_57231();
    new npc_twilight_siege_breaker_57259();
    new npc_siege_breaker_stalker_57261();
}
