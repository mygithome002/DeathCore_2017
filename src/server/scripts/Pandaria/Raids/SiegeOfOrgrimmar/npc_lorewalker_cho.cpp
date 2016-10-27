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
#include "siege_of_orgrimmar.h"

enum eTalks
{
    TALK_1 = 0, // Ah.. we adventure together again, except this time.. I'm afraid circumstances are much.. more die (38120)
    TALK_2 = 1, // Oh.. what has become of the vale? (38121)
    TALK_3 = 2, // The land is scarred.. the everblooming trees and plants wither and die.. as the water from the pools drains away. (38122)
    TALK_4 = 3, // Come.. let us see what other horrors Garrosh has unleashed upon our land. (38123)
    TALK_5 = 4, // Once the Titans used these life-giving waters, to create and shape all life in Pandaria (38124)
    TALK_6 = 5, // It is these waters that kept the water in bloom, they run off into the the Valley of Four Winds.. created the most furtile farms in the whole world! (38125)
    TALK_7 = 6, // And now.. the Melignants of the old gods has menifested themselves into this old waters (38126)
    TALK_8 = 7, // Such a foul.. foul.. thing.. destroy it, before it seeps deep into the soil, and corrupt all of Pandaria! (38127)
    TALK_9 = 8, // Ah.. you have done it, the waters are pure once more. (38128)
};

enum eEvents
{
    EVENT_TALK_1 = 1, // TALK_1
    EVENT_TALK_2 = 2, // TALK_2
    EVENT_TALK_3 = 3, // TALK_3
    EVENT_TALK_4 = 4, // TALK_4
    EVENT_TALK_5 = 5, // TALK_5
    EVENT_TALK_6 = 6, // TALK_6
    EVENT_TALK_7 = 7, // TALK_7
};

enum eActions
{
    ACTION_TALK_BEFORE_IMMERSEUS = 1, // TALK_8
};

class npc_lorewalker_cho_SoO : public CreatureScript
{
    public:
        npc_lorewalker_cho_SoO() : CreatureScript("npc_lorewalker_cho_SoO") { }
        
        struct npc_lorewalker_cho_SoO_AI : public BossAI
        {
            npc_lorewalker_cho_SoO_AI(Creature* creature) : BossAI(creature, DATA_LOREWALKER_CHO)
            {
                pInstance = creature->GetInstanceScript();
            }

            bool introBoss = false;
            bool introPlayer = false;
            InstanceScript* pInstance;

            void Reset() override
            {
                me->setFaction(35);
                me->SetMaxHealth(738060);

                me->SetSpeed(MOVE_RUN, 1.6f);
                me->SetReactState(REACT_PASSIVE);

                events.ScheduleEvent(EVENT_TALK_1, 1000);

                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC | UNIT_FLAG_NON_ATTACKABLE);
            }

            void DamageTaken(Unit* /*attacker*/, uint32& damage)
            {
                damage = 0;
            }

            void MoveInLineOfSight(Unit* who)
            {
                if (who && who->IsInWorld() && who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 40.0f) && !introBoss)
                {
                    if (Creature* Immersus = pInstance->instance->GetCreature(pInstance->GetData64((DATA_IMMERSEUS))))
                    {
                        if (Immersus->IsWithinDistInMap(who, 60.0f))
                        {
                            introBoss = true;
                            Immersus->GetAI()->DoAction(ACTION_TALK_BEFORE_IMMERSEUS);
                        }
                    }
                }

                if (who && who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 40.0f) && !introPlayer)
                    events.ScheduleEvent(EVENT_TALK_1, 2000);
            }
            
            void DoAction(int32 action)
            {
                switch (action)
                {
                    case ACTION_TALK_BEFORE_IMMERSEUS:
                    {
                        Talk(TALK_7);
                        break;
                    }

                    case ACTION_TALK_AFTER_IMMERSEUS:
                    {
                        Talk(TALK_8);
                        break;
                    }
                }
            }
            
            void UpdateAI(uint32 diff) override
            {
                if (!me->GetMotionMaster()->GetMotionSlot(MOTION_SLOT_ACTIVE))
                    if (Player* nearest = me->FindNearestPlayer(60.0f, true))
                        me->GetMotionMaster()->MovePoint(0, nearest->GetPositionX() + 3, nearest->GetPositionY() + 5, nearest->GetPositionZ());

                events.Update(diff);

                while (uint8 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_TALK_1:
                        {
                            Talk(TALK_1);
                            events.ScheduleEvent(EVENT_TALK_2, 12000);
                            break;
                        }

                        case EVENT_TALK_2:
                        {
                            Talk(TALK_2);
                            events.ScheduleEvent(EVENT_TALK_3, 6000);
                            break;
                        }

                        case EVENT_TALK_3:
                        {
                            Talk(TALK_3);
                            events.ScheduleEvent(EVENT_TALK_4, 12000);
                            break;
                        }

                        case EVENT_TALK_4:
                        {
                            Talk(TALK_4);
                            events.ScheduleEvent(EVENT_TALK_5, 6500);
                            break;
                        }

                        case EVENT_TALK_5:
                        {
                            Talk(TALK_5);
                            events.ScheduleEvent(EVENT_TALK_6, 8500);
                            break;
                        }

                        case EVENT_TALK_6:
                        {
                            Talk(TALK_6);
                            events.ScheduleEvent(EVENT_TALK_7, 12000);
                            break;
                        }

                        case EVENT_TALK_7:
                        {
                            Talk(TALK_7);
                            break;
                        }
                    }
                }
            }
        };
        
        CreatureAI* GetAI(Creature* creature) const override
        {
            return new npc_lorewalker_cho_SoO_AI(creature);
        }
};

void AddSC_npc_lorewalker_cho()
{
    // Lorewalker Cho
    new npc_lorewalker_cho_SoO();
}
