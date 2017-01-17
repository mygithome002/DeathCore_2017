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

#include "ScriptPCH.h"
#include "ScriptedGossip.h"

class item_npc_trainerspawn : public CreatureScript
{
public:
	item_npc_trainerspawn() : CreatureScript("item_npc_trainerspawn") { }

	bool OnGossipHello(Player *player, Creature *_Creature)
	{
		ClearGossipMenuFor(player);

		if (player->IsInCombat())
		{
			player->PlayerTalkClass->SendCloseGossip();
			_Creature->Whisper("Você esta em combate!", LANG_UNIVERSAL, NULL);
			return true;
		}
		if (player->GetMap()->IsBattlegroundOrArena())
		{
			player->PlayerTalkClass->SendCloseGossip();
			_Creature->Whisper("Você não poder chamar os trainers enquanto estiver em uma Battleground ou Arena!", LANG_UNIVERSAL, NULL);
			return true;
		}

		_Creature->Whisper("Bem vindo querido jogador, por favor escolha o que quiser.", LANG_UNIVERSAL, player);

		AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Chamar o seu treinador de Classe." 	 , GOSSIP_SENDER_MAIN, 1);
		AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Chamar o Max Stell." 	 	 	 , GOSSIP_SENDER_MAIN, 7);
		AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Talvez mais tarde."               	 , GOSSIP_SENDER_MAIN, 2);
		player->PlayerTalkClass->SendGossipMenu(85004, _Creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player *player, Creature *_Creature, uint32 /*sender*/, uint32 action)
	{

		switch(action)
		{
		case 1:
			switch(player->getClass())
			{
			case CLASS_DEATH_KNIGHT:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(28474,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_DRUID:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(12042,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_HUNTER:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(3406,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_MAGE:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(5882,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_PALADIN:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(20406,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_PRIEST:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(6018,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_ROGUE:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(3327,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_SHAMAN:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(3344,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_WARLOCK:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(3325,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			case CLASS_WARRIOR:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(4593,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Você já tem o seu trainer! Eu devo dizer adeus...", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;

			default: break;
			}
			break;
		case 7:
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(77777,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,45000);
				_Creature->Whisper("Max Stell está aqui, devo dizer adeus..", LANG_UNIVERSAL, player);
				_Creature->DisappearAndDie();
				break;
		case 2:
			_Creature->Whisper("Por favor, volte de novo!", LANG_UNIVERSAL, player);
			player->PlayerTalkClass->SendCloseGossip();
			_Creature->DisappearAndDie();
			break;

		}

		return true;
	}

};

void AddSC_item_npc_trainerspawn()
{
	new item_npc_trainerspawn();
}
