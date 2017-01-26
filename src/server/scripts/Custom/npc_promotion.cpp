/*
 * Copyright (C) 2016-2017 DeathCore <http://www.noffearrdeathproject.org/>
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

#include "ScriptPCH.h"

class npc_promo : public CreatureScript 

{
public:
    npc_promo() : CreatureScript("npc_promo") { } 
 
    bool OnGossipHello(Player* player, Creature* creature) 
    {
        AddGossipItemFor(player, 7, "Escolher promoção: ", GOSSIP_SENDER_MAIN, 99);
		switch (player->getClass())
		{
				case CLASS_DRUID: AddGossipItemFor(player, 10, "Druid Balance", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+30); AddGossipItemFor(player, 10, "Druid Feral", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+44); AddGossipItemFor(player, 10, "Druida Restoration", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+45); break;
				case CLASS_SHAMAN: AddGossipItemFor(player, 10, "Shaman Elemental", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+31); AddGossipItemFor(player, 10, "Shaman Enhancement", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+46); AddGossipItemFor(player, 10, "Shaman Restoration", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+47); break;
				case CLASS_PALADIN: AddGossipItemFor(player, 10, "Paladin Retribution", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+32); AddGossipItemFor(player, 10, "Paladin Holy", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+40); AddGossipItemFor(player, 10, "Paladin Protection", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+41); break;
				case CLASS_WARRIOR: AddGossipItemFor(player, 10, "Warrior Fury", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+33); AddGossipItemFor(player, 10, "Warrior Arms", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+48); AddGossipItemFor(player, 10, "Warrior Protection", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+50); break;
				case CLASS_PRIEST: AddGossipItemFor(player, 10, "Priest Shadow", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+34); AddGossipItemFor(player, 10, "Priest Holy", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+42); AddGossipItemFor(player, 10, "Priest Dicipline", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+49); break;
				case CLASS_DEATH_KNIGHT: AddGossipItemFor(player, 10, "Death Knight DPS", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+35); AddGossipItemFor(player, 10, "Death Knight Tank", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+43); break;
				case CLASS_ROGUE: AddGossipItemFor(player, 10, "Rogue", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+36); break;
				case CLASS_HUNTER: AddGossipItemFor(player, 10, "Hunter", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+37); break;
				case CLASS_MAGE: AddGossipItemFor(player, 10, "Mage", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+38); break;
				case CLASS_WARLOCK: AddGossipItemFor(player, 10, "Warlock", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+39); break;
		}
        SendGossipMenuFor(player, 1, creature->GetGUID()); 
        return true;
    }
 
    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 actions)
    {
	    
		if (player->getLevel() == 80) 
		{
            player->GetSession()->SendAreaTriggerMessage("Você não pode receber a promoção mais de uma vez.");
			CloseGossipMenuFor(player);
			return true;
        }
		
        if (player->getLevel() > 1) 
        {
            uint32 accountID = player->GetSession()->GetAccountId();
            QueryResult result = CharacterDatabase.PQuery("SELECT COUNT(`guid`) FROM `characters` WHERE `account`=%u", accountID);
            Field *fields = result->Fetch();
            uint32 personagem = fields[0].GetUInt32();

            if (personagem == 1)		
                    {
					    if (actions == 99)
						{
						    CloseGossipMenuFor(player);
						    return false;
						}
						player->GetSession()->SendAreaTriggerMessage("Você recebeu a promoção com sucesso.");
                        player->GiveLevel(80);
						player->SetMoney(800000000);
						switch(actions)
                              {								  
								  case GOSSIP_ACTION_INFO_DEF+30: // Druid Balance
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+44: // Druid Feral
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+45: // Druid Restoration
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;

								  case GOSSIP_ACTION_INFO_DEF+31: // Shaman Elemental
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+46: // Shaman Enhancement
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+47: // Shaman Restoration
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;

								  case GOSSIP_ACTION_INFO_DEF+32: // Paladin Retribution
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+40: // Paladin Holy
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+41: // Paladin Protection
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;

								  case GOSSIP_ACTION_INFO_DEF+33: // Warrior Fury
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+48: // Warrior Arms
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+50: // Warrior Protection
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+49: // Priest Dicipline
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;

								  case GOSSIP_ACTION_INFO_DEF+34: // Priest Shadow
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+42: // Priest Holy
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;

								  case GOSSIP_ACTION_INFO_DEF+35: // Death Knight DPS
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
								  
								  case GOSSIP_ACTION_INFO_DEF+43: // Death Knight Tank
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;								  

								  case GOSSIP_ACTION_INFO_DEF+36: // Rogue
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;

								  case GOSSIP_ACTION_INFO_DEF+37: // Hunter
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  player->AddItem(800058, 1);
								  CloseGossipMenuFor(player);
								  break;

								  case GOSSIP_ACTION_INFO_DEF+38: // Mage
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;

								  case GOSSIP_ACTION_INFO_DEF+39: // Warlock
								  player->AddItem(49284, 1);
								  player->AddItem(800049, 1);
								  player->AddItem(800059, 1);
								  player->AddItem(800034, 1);
								  CloseGossipMenuFor(player);
								  break;
	                          }
                    }			
			
			if (personagem > 1)
                    {
                        player->GetSession()->SendAreaTriggerMessage("Você só pode usar essa promoção em apenas 01 pernagem de sua conta.");
						CloseGossipMenuFor(player);
						return true;
                    }
			
		    CloseGossipMenuFor(player);
        }
        return true;
    }
};
 
void AddSC_npc_promo() 
{
    new npc_promo(); 
}