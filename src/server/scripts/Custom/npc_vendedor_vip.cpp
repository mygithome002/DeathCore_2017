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

#include "../../../scripts/ScriptPCH.h"

    class VIP_NPC : public CreatureScript 
    {
            public:
            VIP_NPC() : CreatureScript("VIP_NPC") { }
     
            bool OnGossipHello(Player * me, Creature * pCreature)
            {
                                       if (me->GetSession()->GetSecurity() >= 1)
                    {
                                        AddGossipItemFor(me, 6, "Vendedor V.I.P", GOSSIP_SENDER_MAIN, GOSSIP_OPTION_VENDOR);
                                        }
                                        else
                                        { 
                                        AddGossipItemFor(me, 6, "Até Mais", GOSSIP_SENDER_MAIN,1);
                                        }
                    me->PlayerTalkClass->SendGossipMenu(9452, pCreature->GetGUID());
                    return true;
                                    }
           
            bool OnGossipSelect(Player *player, Creature * m_creature, uint32 /*sender*/, uint32 action)
    {
                player->PlayerTalkClass->ClearMenus();
                                switch (action)
                                {
                                case GOSSIP_OPTION_VENDOR:
                player->GetSession()->SendListInventory(m_creature->GetGUID());
                                break;
                                case 1:
                                    //m_creature->MonsterSay("Por que você está aqui? Você não é um Personagem VIP! Volte já para Dalaran!", player->GetGUID());
                                player->TeleportTo(0, -1818.969971f, -4149.790039f, 31.984400f, 3.091680f); // Where you get teleported.
                                CloseGossipMenuFor(player);
                                break;
                        }
        return true;
    }
};
 
void AddSC_VIP_NPC()
{
    new VIP_NPC();
}