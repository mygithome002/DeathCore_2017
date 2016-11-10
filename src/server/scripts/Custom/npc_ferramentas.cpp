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

#include "Player.h"
#include "Define.h"
#include "Creature.h"
#include "ScriptMgr.h"
#include "WorldSession.h"
#include "ScriptedGossip.h"
#include "Language.h"

class Tools_NPC : public CreatureScript
{
public:
        Tools_NPC() : CreatureScript("Tools_NPC") { }
 
	bool OnGossipHello(Player * player, Creature * creature)
        {
		AddGossipItemFor(player, GOSSIP_ICON_DOT, "|TInterface\\icons\\Spell_Nature_Regenerate:30:30:-15|t Restaurar Vida e Mana", GOSSIP_SENDER_MAIN, 1);
		AddGossipItemFor(player, GOSSIP_ICON_DOT, "|TInterface\\icons\\Spell_Shadow_UnstableAffliction_1:30:30:-15|t Resetar Instances", GOSSIP_SENDER_MAIN, 2);
		AddGossipItemFor(player, GOSSIP_ICON_DOT, "|TInterface\\icons\\SPELL_HOLY_BORROWEDTIME:30:30:-15|t Resetar Cooldowns", GOSSIP_SENDER_MAIN, 3);
		AddGossipItemFor(player, GOSSIP_ICON_DOT, "|TInterface\\icons\\Achievement_BG_AB_defendflags:30:30:-15|t Resetar Combate", GOSSIP_SENDER_MAIN, 4);
		AddGossipItemFor(player, GOSSIP_ICON_DOT, "|TInterface\\icons\\Spell_Shadow_DeathScream:30:30:-15|t Remover Sickness", GOSSIP_SENDER_MAIN, 5);
		AddGossipItemFor(player, GOSSIP_ICON_DOT, "|TInterface\\icons\\INV_Hammer_24:30:30:-15|t Reparar Items", GOSSIP_SENDER_MAIN, 6);
		AddGossipItemFor(player, GOSSIP_ICON_DOT, "|TInterface\\icons\\Achievement_WorldEvent_Lunar:30:30:-15|t Resetar Talents", GOSSIP_SENDER_MAIN, 7);
		AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, "|TInterface\\icons\\Achievement_WorldEvent_Lunar:30:30:-15|t Sair", GOSSIP_SENDER_MAIN, 8);
		SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
                return true;
        }
	bool OnGossipSelect(Player * player, Creature /*creature*/, uint32 /*sender*/, uint32 actions)
        {
		player->PlayerTalkClass->ClearMenus();

		switch (actions)
                {
                case 1: // Restaurar HP e MP
                        if(player->IsInCombat())
                        {
                            player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFVocê está em combate!");
							player->PlayerTalkClass->SendCloseGossip();
                                return false;
                        }
                        else if(player->getPowerType() == POWER_MANA)
                                player->SetPower(POWER_MANA, player->GetMaxPower(POWER_MANA));
 
							player->SetHealth(player->GetMaxHealth());
							player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFVida e Mana Resetados com Sucesso!");
							player->CastSpell(player, 36400);
							CloseGossipMenuFor(player);
                        break;

                case 2: // Resetar Instances
                        for (uint8 i = 0; i < MAX_DIFFICULTY; ++i)
                        {
                                Player::BoundInstancesMap &binds = player->GetBoundInstances(Difficulty(i));
                                for (Player::BoundInstancesMap::iterator itr = binds.begin(); itr != binds.end();)
                                {
                                        player->UnbindInstance(itr, Difficulty(i));
                                }
                        }
						player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFInstances Resetados com Sucesso!");
						player->CastSpell(player, 59908);
                        CloseGossipMenuFor(player);
                        break;

                case 3: // Resetar Cooldowns
                        if(player->IsInCombat())
                        {
                            player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFVocê está em combate!");
							player->PlayerTalkClass->SendCloseGossip();
                                return false;
                        }
 
						player->GetSpellHistory()->ResetAllCooldowns();
						player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFCooldowns Resetados com Sucesso!");
						player->CastSpell(player, 463);
                        CloseGossipMenuFor(player);
                        break;

                case 4: // Resetar Combat
                        player->CombatStop();
						player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFCombate Removido com Sucesso!");
						player->CastSpell(player, 24222);
                        CloseGossipMenuFor(player);
                        break;

                case 5: // Remover Sickness
                        if(player->HasAura(15007))
                        player->RemoveAura(15007);
						player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFSickness Removido com Sucesso!");
						player->CastSpell(player, 41300);
                        CloseGossipMenuFor(player);
                        break;

                case 6: // Reparar Items
                        player->DurabilityRepairAll(false, 0, false);
						player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFEquipamentos Reparados com Sucesso!");
						player->CastSpell(player, 29541);
                        CloseGossipMenuFor(player);
                        break;

               case 7: // Resetar Talents
                        player->ResetTalents(true);
                        player->SendTalentsInfoData(false);
						player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFTalentos Resetados com Sucesso!");
						player->CastSpell(player, 19484);
                        CloseGossipMenuFor(player);
                        break;

				case 8: // Fechar Menu
						player->GetSession()->SendNotification("|cffFFFF00Ferramentas \n |cffFFFFFFObrigado, Utilize sempre esta ferramenta assim que precisar!");
						CloseGossipMenuFor(player);
						break;
             }
                return true;
        }
};
 
void AddSC_Tools_NPC()
{
        new Tools_NPC();
}