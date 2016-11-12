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
#include "Language.h"

class skill_npc : public CreatureScript

	{
public:

skill_npc() : CreatureScript("skill_npc") {}

struct skill_npcAI : public ScriptedAI
	{
		skill_npcAI(Creature *c) : ScriptedAI(c)
		{
		}

		
	};

	CreatureAI* GetAI(Creature* _creature) const
    {
		return new skill_npcAI(_creature);
    }

	void CreatureWhisperBasedOnBool(const char *text, Creature *_creature, Player *pPlayer, bool value)
	{
		if (value)
			_creature->MonsterWhisper(text, pPlayer->GetGUID());
	}

	uint32 PlayerMaxLevel() const
	{
		return sWorld->getIntConfig(CONFIG_MAX_PLAYER_LEVEL);
	}


void MainMenu(Player *pPlayer, Creature* _creature)
{
			pPlayer->ADD_GOSSIP_ITEM(9, "[Profissões] ->", GOSSIP_SENDER_MAIN, 196);
			pPlayer->PlayerTalkClass->SendGossipMenu(907, _creature->GetGUID());
       
}

	bool PlayerHasItemOrSpell(const Player *plr, uint32 itemId, uint32 spellId) const
	{
		return plr->HasItemCount(itemId, 1, true) || plr->HasSpell(spellId);
	}
    
	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
		MainMenu(pPlayer, pCreature);

        return true;
    }

bool PlayerAlreadyHasTwoProfessions(const Player *pPlayer) const
	{
		uint32 skillCount = 0;

		if (pPlayer->HasSkill(SKILL_MINING))
			skillCount++;
		if (pPlayer->HasSkill(SKILL_SKINNING))
			skillCount++;
		if (pPlayer->HasSkill(SKILL_HERBALISM))
			skillCount++;

		if (skillCount >= 2)
			return true;

		for (uint32 i = 1; i < sSkillLineStore.GetNumRows(); ++i)
		{
			SkillLineEntry const *SkillInfo = sSkillLineStore.LookupEntry(i);
			if (!SkillInfo)
				continue;

			if (SkillInfo->categoryId == SKILL_CATEGORY_SECONDARY)
				continue;

			if ((SkillInfo->categoryId != SKILL_CATEGORY_PROFESSION) || !SkillInfo->canLink)
				continue;

			const uint32 skillID = SkillInfo->id;
			if (pPlayer->HasSkill(skillID))
				skillCount++;

			if (skillCount >= 2)
				return true;
		}

		return false;
	}

	bool LearnAllRecipesInProfession(Player *pPlayer, SkillType skill)
	{
		ChatHandler handler(pPlayer->GetSession());
        std::string skill_name;

        SkillLineEntry const *SkillInfo = sSkillLineStore.LookupEntry(skill);
		skill_name, SkillInfo->name[handler.GetSessionDbcLocale()];

        if (!SkillInfo)
		{
			sLog->outError(LOG_FILTER_GENERAL, "MENSAGEM: Invalido Skill ID (LearnAllRecipesInProfession)");
            return false;
		}

        LearnSkillRecipesHelper(pPlayer, SkillInfo->id);

        uint16 maxLevel = pPlayer->GetPureMaxSkillValue(SkillInfo->id);
        pPlayer->SetSkill(SkillInfo->id, pPlayer->GetSkillStep(SkillInfo->id), maxLevel, maxLevel);
        handler.PSendSysMessage(LANG_COMMAND_LEARN_ALL_RECIPES, skill_name.c_str());		
		return true;
	}
	
	void LearnSkillRecipesHelper(Player *player, uint32 skill_id)
	{
		uint32 classmask = player->getClassMask();

        for (uint32 j = 0; j < sSkillLineAbilityStore.GetNumRows(); ++j)
        {
            SkillLineAbilityEntry const *skillLine = sSkillLineAbilityStore.LookupEntry(j);
            if (!skillLine)
                continue;

            // wrong skill
            if (skillLine->skillId != skill_id)
                continue;

            // not high rank
            if (skillLine->forward_spellid)
                continue;

            // skip racial skills
            if (skillLine->racemask != 0)
                continue;

            // skip wrong class skills
            if (skillLine->classmask && (skillLine->classmask & classmask) == 0)
                continue;

        
            player->learnSpell(skillLine->spellId, false);
        }
	}

	bool IsSecondarySkill(SkillType skill) const
	{
		return skill == SKILL_COOKING || skill == SKILL_FIRST_AID;
	}

	void CompleteLearnProfession(Player *pPlayer, Creature *pCreature, SkillType skill)
	{
		if (PlayerAlreadyHasTwoProfessions(pPlayer) && !IsSecondarySkill(skill))
			pCreature->MonsterWhisper("Você já sabe duas profissões!", pPlayer->GetGUID());
		else
		{
			if (!LearnAllRecipesInProfession(pPlayer, skill))
				pCreature->MonsterWhisper("Ocorreu um erro interno. Por favor, contacte um Administrador.", pPlayer->GetGUID());
		}
	}
	
     bool OnGossipSelect(Player* pPlayer, Creature* _creature, uint32 uiSender, uint32 uiAction)
{ 
        pPlayer->PlayerTalkClass->ClearMenus();
        
        if (uiSender == GOSSIP_SENDER_MAIN)
        {
                
		switch (uiAction)
		{
				case 196:
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\trade_alchemy:30|t  Alchemy", GOSSIP_SENDER_MAIN, 1);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\trade_blacksmithing:30|t  Blacksmithing", GOSSIP_SENDER_MAIN, 2);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\inv_misc_armorkit_17:30|t  Leatherworking", GOSSIP_SENDER_MAIN, 3);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\trade_tailoring:30|t  Tailoring", GOSSIP_SENDER_MAIN, 4);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\trade_engineering:30|t  Engineering", GOSSIP_SENDER_MAIN, 5);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\trade_engraving:30|t  Enchanting", GOSSIP_SENDER_MAIN, 6);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\inv_misc_gem_01:30|t  Jewelcrafting", GOSSIP_SENDER_MAIN, 7);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\inv_inscription_tradeskill01:30|t  Inscription", GOSSIP_SENDER_MAIN, 8);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\inv_misc_food_15:30|t  Cooking", GOSSIP_SENDER_MAIN, 9);
				pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "|TInterface\\icons\\spell_holy_sealofsacrifice:30|t  First Aid", GOSSIP_SENDER_MAIN, 10);

				pPlayer->PlayerTalkClass->SendGossipMenu(907, _creature->GetGUID());
				break;
			case 1:
				CompleteLearnProfession(pPlayer, _creature, SKILL_ALCHEMY);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 2:
				CompleteLearnProfession(pPlayer, _creature, SKILL_BLACKSMITHING);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 3:
				CompleteLearnProfession(pPlayer, _creature, SKILL_LEATHERWORKING);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 4:
				CompleteLearnProfession(pPlayer, _creature, SKILL_TAILORING);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 5:
				CompleteLearnProfession(pPlayer, _creature, SKILL_ENGINEERING);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 6:
				CompleteLearnProfession(pPlayer, _creature, SKILL_ENCHANTING);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 7:
				CompleteLearnProfession(pPlayer, _creature, SKILL_JEWELCRAFTING);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 8:
				CompleteLearnProfession(pPlayer, _creature, SKILL_INSCRIPTION);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 9:
				CompleteLearnProfession(pPlayer, _creature, SKILL_COOKING);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
			case 10:
				CompleteLearnProfession(pPlayer, _creature, SKILL_FIRST_AID);

				pPlayer->CLOSE_GOSSIP_MENU();
				break;
		}

        
	}
	 return true;
	 }
	 };

void AddSC_skill_npc()
{
    new skill_npc();
}
