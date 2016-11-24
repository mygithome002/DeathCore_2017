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
#include "Config.h"

bool CobrarEncantamentos;
uint8 TokenTipo;
uint32 IDToken;
uint32 vEncanto;
std::string TextoConfirmar;

//#define StringToken "Item[Token]"
//#define StringToken2 "Gold"

enum Enchants
{
	ENCHANT_WEP_BLADE_WARD = 3869,
	ENCHANT_WEP_BLOOD_DRAINING = 3870,
	ENCHANT_WEP_BERSERKING = 3789,
	ENCHANT_WEP_ACCURACY = 3788,
	ENCHANT_WEP_AGILITY_1H = 1103,
	ENCHANT_WEP_AGILITY_2H = 2670,
	ENCHANT_WEP_SPIRIT = 3844,
	ENCHANT_WEP_BATTLEMASTER = 2675,
	ENCHANT_WEP_BLACK_MAGIC = 3790,
	ENCHANT_WEP_ICEBREAKER = 3239,
	ENCHANT_WEP_LIFEWARD = 3241,
	ENCHANT_WEP_MIGHTY_SPELL_POWER = 3834, // One-hand
	ENCHANT_WEP_GREATER_SPELL_POWER = 3854, // Two-hand (staff)
	ENCHANT_WEP_MONGOOSE = 2673,
	ENCHANT_WEP_EXECUTIONER = 3225,
	ENCHANT_WEP_POTENCY = 3833,
	ENCHANT_WEP_TITANGUARD = 3851,
	ENCHANT_SHIELD_MAJOR_STAMINA = 1071,
	ENCHANT_SHIELD_INTELLECT = 1128,
	ENCHANT_SHIELD_DEFENSE = 1952,
	ENCHANT_SHIELD_TITANIUM_SPIKE = 3748,
	ENCHANT_RANGED_HEARTSEEKER_SCOPE = 3608,
	ENCHANT_RANGED_SUN_SCOPE = 3607,
	ENCHANT_SHIELD_TITANIUM_PLATING = 3849,
	ENCHANT_SHIELD_RESILIENCE = 3229,
	ENCHANT_WEP_MASSACRE = 3827,
	ENCHANT_WEP_CINDERGLACIER = 3369,
	ENCHANT_WEP_LICHBANE = 3366,
	ENCHANT_WEP_RAZORICE = 3370,
	ENCHANT_WEP_SPELLBREAKING = 3595,
	ENCHANT_WEP_SPELLSHATTERING = 3367,
	ENCHANT_WEP_SWORDBREAKING = 3594,
	ENCHANT_WEP_SWORDSHATTERING = 3365,
	ENCHANT_WEP_FALLEN_CRUSADER = 3368,
	ENCHANT_WEP_NERUBIAN_CARAPACE = 3883,
	ENCHANT_WEP_TITANIUM_CHAIN = 3731,
	ENCHANT_BELT_ETERNAL_BELT_BUCKLE = 3729,
	ENCHANT_GLOVES_SOCKET_GLOVES = 3723,
	ENCHANT_BRACER_SOCKET_BRACER = 3717,
};
int stvt; //SlotTypeVisualTexto
using namespace std;
struct MenusLista
{
	uint32 Menu;
	uint32 Submenu;
	uint8 Icone;
	uint8 Slot;
	uint32 Skill;
	uint32 SkillValor;
	uint8 pClasses;
	uint32 AcaoID;
	string Nome;
	//string NomeConfirm;
};
std::string icone = "Rings";
MenusLista mvData[] =
{
	//{ Menu, subMenu, Icone, Slot, Skill, SkillValor, Classe, AcaoID, Nome },
	
	{ 1, 100, 4, 0, 0, 0, 0, 0, "[Aplicar Encantamentos]" },
	//Remover Encantamentos
	{ 1, 99, 6, 0, 0, 0, 0, 0, "[Remover Encantamentos]" },

	{ 100, 2, 4, 0, 0, 0, 0, 0, "[Enchant Weapon]" },
	{ 100, 111, 4, 0, 0, 0, 0, 0, "[Enchant OffHand]" },
	{ 100, 3, 4, 0, 0, 0, 0, 0, "[Enchant 2H Weapon]" },
	{ 100, 112, 4, 0, 0, 0, 1, 0, "[Enchant 2H OffHand]" },
	{ 100, 4, 4, 0, 0, 0, 3, 0, "[Enchant Ranged Weapon]" }, //Hunter
	{ 100, 4, 4, 0, 0, 0, 1, 0, "[Enchant Ranged Weapon]" }, //Warrior
	{ 100, 6, 4, 0, 0, 0, 0, 0, "[Enchant Shield]" },
	{ 100, 7, 4, 0, 0, 0, 0, 0, "[Enchant Head]" },
	{ 100, 8, 4, 0, 0, 0, 0, 0, "[Enchant Shoulders]" },
	{ 100, 9, 4, 0, 0, 0, 0, 0, "[Enchant Cloak]" },
	{ 100, 10, 4, 0, 0, 0, 0, 0, "[Enchant Chest]" },
	{ 100, 11, 4, 0, 0, 0, 0, 0, "[Enchant Bracers]" },
	{ 100, 12, 4, 0, 0, 0, 0, 0, "[Enchant Gloves]" },
	//{ 100, 150, 4, 0, 0, 0, 0, 0, "[NULL]" },
	{ 100, 13, 4, 0, 0, 0, 0, 0, "[Eternal Belt Buckle]" }, //EQUIPMENT_SLOT_WAIST
	{ 100, 14, 4, 0, 0, 0, 0, 0, "[Enchant Legs]" },	
	{ 100, 15, 4, 0, 0, 0, 0, 0, "[Enchant Boots]" },
	{ 100, 16, 4, 0, 333, 450, 0, 0, "Enchant Rings" }, // Requer SKILL_ENCHANTING 450
	{ 100, 1, 8, 99, 0, 0, 0, 0, "<< Voltar" },
	
	{ 99, 0, 6, 15, 0, 0, 0, 0, "[Enchant Weapon]" },
	{ 99, 0, 6, 16, 0, 0, 0, 0, "[Enchant OffHand]" },
	{ 99, 0, 6, 16, 0, 0, 0, 0, "[Enchant Ranged Weapon]" },
	{ 99, 0, 6, 0, 0, 0, 0, 0, "[Enchant Head]" },
	{ 99, 0, 6, 2, 0, 0, 0, 0, "[Enchant Shoulders]" },
	{ 99, 0, 6, 14, 0, 0, 0, 0, "[Enchant Cloak]" },
	{ 99, 0, 6, 4, 0, 0, 0, 0, "[Enchant Chest]" },
	{ 99, 0, 6, 8, 0, 0, 0, 0, "[Enchant Bracers]" },
	{ 99, 0, 6, 9, 0, 0, 0, 0, "[Enchant Gloves]" },
	{ 99, 0, 6, 5, 0, 0, 0, 0, "[Eternal Belt Buckle]" },
	{ 99, 0, 6, 6, 0, 0, 0, 0, "[Enchant Legs]" },
	{ 99, 0, 6, 7, 0, 0, 0, 0, "[Enchant Boots]" },
	{ 99, 98, 6, 0, 333, 450, 0, 0, "[Enchant Rings]" },
	{ 99, 1, 8, 99, 0, 0, 0, 0, "<< Voltar" },
	
	// Show1HWeaponMenu			EQUIPMENT_SLOT_MAINHAND		
	{ 2, 0, 2, 15, 0, 0, 6, 3369, "Rune of Cinderglacier" }, // Exclusivo para classe DK
	{ 2, 0, 2, 15, 0, 0, 6, 3366, "Rune of Lichbane" }, // Exclusivo para classe DK
	{ 2, 0, 2, 15, 0, 0, 6, 3370, "Rune of Razorice" }, // Exclusivo para classe DK
	{ 2, 0, 2, 15, 0, 0, 6, 3595, "Rune of Spellbreaking" }, // Exclusivo para classe DK
	{ 2, 0, 2, 15, 0, 0, 6, 3594, "Rune of Swordbreaking" }, // Exclusivo para classe DK
	{ 2, 0, 2, 15, 0, 0, 6, 3368, "Rune of the Fallen Crusader" }, // Exclusivo para classe DK
	{ 2, 0, 2, 15, 0, 0, 6, 3883, "Rune of the Nerubian Carapace" }, // Exclusivo para classe DK

	
	{ 2, 0, 2, 15, 333, 450, 0, 3869, "Blade Ward" }, // Requer SKILL_ENCHANTING 450
	{ 2, 0, 2, 15, 333, 450, 0, 3870, "Blood Draining" }, // Requer SKILL_ENCHANTING 450
	{ 2, 0, 2, 15, 0, 0, 0, 3788, "Accuracy -- 25 Hit + 25 Crit" },
	{ 2, 0, 2, 15, 0, 0, 0, 3790, "Black Magic -- 250 Spell Haste Proc" },
	{ 2, 0, 2, 15, 0, 0, 0, 2675, "Battlemaster -- Chance of heal on hit" },
	{ 2, 0, 2, 15, 0, 0, 0, 3789, "Berserking -- 400 Attack Power Proc" },
	{ 2, 0, 2, 15, 0, 0, 0, 1103, "Exceptional Agility -- 26 Agility" },
	{ 2, 5, 2, 0, 0, 0, 0, 0, "Próximo>>" }, //Proxima tela
	{ 2, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },
	
	{ 5, 0, 2, 15, 0, 0, 0, 3844, "Exceptional Spirit -- 45 Spirit" },
	{ 5, 0, 2, 15, 0, 0, 0, 3225, "Executioner -- 120 Arm Pen Proc" },
	{ 5, 0, 2, 15, 0, 0, 0, 3239, "Icebreaker -- Fire damage on hit" },
	{ 5, 0, 2, 15, 0, 0, 0, 3241, "Lifeward -- Chance of heal on hit" },
	{ 5, 0, 2, 15, 0, 0, 0, 3834, "Mighty Spellpower -- 63 Spell Power" },
	{ 5, 0, 2, 15, 0, 0, 0, 2673, "Mongoose -- 120 Agility Proc" },
	{ 5, 0, 2, 15, 0, 0, 0, 3833, "Superior Potency -- 65 Attack Power" },
	{ 5, 0, 2, 15, 0, 0, 0, 3851, "Titanguard -- 50 Stamina" },
	{ 5, 0, 2, 15, 0, 0, 0, 3731, "Titanium Weapon Chain -- Less Disarm Time" },
	{ 5, 2, 2, 0, 0, 0, 0, 0, "<< Anterior" },
	{ 5, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	// Show1HWeaponMenu			EQUIPMENT_SLOT_OFFHAND		
	{ 111, 0, 2, 16, 0, 0, 6, 3369, "Rune of Cinderglacier" }, // Exclusivo para classe DK
	{ 111, 0, 2, 16, 0, 0, 6, 3366, "Rune of Lichbane" }, // Exclusivo para classe DK
	{ 111, 0, 2, 16, 0, 0, 6, 3370, "Rune of Razorice" }, // Exclusivo para classe DK
	{ 111, 0, 2, 16, 0, 0, 6, 3595, "Rune of Spellbreaking" }, // Exclusivo para classe DK
	{ 111, 0, 2, 16, 0, 0, 6, 3594, "Rune of Swordbreaking" }, // Exclusivo para classe DK
	{ 111, 0, 2, 16, 0, 0, 6, 3368, "Rune of the Fallen Crusader" }, // Exclusivo para classe DK
	{ 111, 0, 2, 16, 0, 0, 6, 3883, "Rune of the Nerubian Carapace" }, // Exclusivo para classe DK


	{ 111, 0, 2, 16, 333, 450, 0, 3869, "Blade Ward" }, // Requer SKILL_ENCHANTING 450
	{ 111, 0, 2, 16, 333, 450, 0, 3870, "Blood Draining" }, // Requer SKILL_ENCHANTING 450
	{ 111, 0, 2, 16, 0, 0, 0, 3788, "Accuracy -- 25 Hit + 25 Crit" },
	{ 111, 0, 2, 16, 0, 0, 0, 3790, "Black Magic -- 250 Spell Haste Proc" },
	{ 111, 0, 2, 16, 0, 0, 0, 2675, "Battlemaster -- Chance of heal on hit" },
	{ 111, 0, 2, 16, 0, 0, 0, 3789, "Berserking -- 400 Attack Power Proc" },
	{ 111, 0, 2, 16, 0, 0, 0, 1103, "Exceptional Agility -- 26 Agility" },
	{ 111, 55, 2, 0, 0, 0, 0, 0, "Próximo >>" }, //Proxima tela
	{ 111, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	{ 55, 0, 2, 16, 0, 0, 0, 3844, "Exceptional Spirit -- 45 Spirit" },
	{ 55, 0, 2, 16, 0, 0, 0, 3225, "Executioner -- 120 Arm Pen Proc" },
	{ 55, 0, 2, 16, 0, 0, 0, 3239, "Icebreaker -- Fire damage on hit" },
	{ 55, 0, 2, 16, 0, 0, 0, 3241, "Lifeward -- Chance of heal on hit" },
	{ 55, 0, 2, 16, 0, 0, 0, 3834, "Mighty Spellpower -- 63 Spell Power" },
	{ 55, 0, 2, 16, 0, 0, 0, 2673, "Mongoose -- 120 Agility Proc" },
	{ 55, 0, 2, 16, 0, 0, 0, 3833, "Superior Potency -- 65 Attack Power" },
	{ 55, 0, 2, 16, 0, 0, 0, 3851, "Titanguard -- 50 Stamina" },
	{ 55, 0, 2, 16, 0, 0, 0, 3731, "Titanium Weapon Chain -- Less Disarm Time" },
	{ 55, 111, 2, 0, 0, 0, 0, 0, "<< Anterior" },
	{ 55, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	// Show2HWeaponMenu 			EQUIPMENT_SLOT_MAINHAND			
	{ 3, 0, 2, 15, 0, 0, 6, 3369, "Rune of Cinderglacier" }, // Exclusivo para classe DK
	{ 3, 0, 2, 15, 0, 0, 6, 3366, "Rune of Lichbane" }, // Exclusivo para classe DK
	{ 3, 0, 2, 15, 0, 0, 6, 3370, "Rune of Razorice" }, // Exclusivo para classe DK
	{ 3, 0, 2, 15, 0, 0, 6, 3367, "Rune of Spellshattering" }, // Exclusivo para classe DK
	{ 3, 0, 2, 15, 0, 0, 6, 3365, "Rune of Swordshattering" }, // Exclusivo para classe DK
	{ 3, 0, 2, 15, 0, 0, 6, 3368, "Rune of the Fallen Crusader" }, // Exclusivo para classe DK
	{ 3, 0, 2, 15, 0, 0, 6, 3847, "Rune of the Stoneskin Gargoyle" }, // Exclusivo para classe DK0

	{ 3, 0, 2, 15, 0, 0, 0, 3789, "Berserking -- 400 Attack Power Proc" },
	{ 3, 0, 2, 15, 0, 0, 0, 3225, "Executioner -- 120 Arm Pen Proc" },
	{ 3, 0, 2, 15, 0, 0, 0, 3854, "Greater Spellpower -- 81 Spell Power" },
	{ 3, 0, 2, 15, 0, 0, 0, 2670, "Major Agility -- 35 Agility" },
	{ 3, 0, 2, 15, 0, 0, 0, 3827, "Massacre -- 110 Attack Power" },
	{ 3, 0, 2, 15, 0, 0, 0, 2673, "Mongoose --120 Agility Proc" },
	{ 3, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	// Show2HWeaponMenu 			EQUIPMENT_SLOT_OFFHAND  Só para Warrior	
	{ 112, 0, 2, 16, 0, 0, 1, 3789, "Berserking -- 400 Attack Power Proc" },
	{ 112, 0, 2, 16, 0, 0, 1, 3225, "Executioner -- 120 Arm Pen Proc" },
	{ 112, 0, 2, 16, 0, 0, 1, 3854, "Greater Spellpower -- 81 Spell Power" },
	{ 112, 0, 2, 16, 0, 0, 1, 2670, "Major Agility -- 35 Agility" },
	{ 112, 0, 2, 16, 0, 0, 1, 3827, "Massacre -- 110 Attack Power" },
	{ 112, 0, 2, 16, 0, 0, 1, 2673, "Mongoose --120 Agility Proc" },
	{ 112, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowRangedMenu            EQUIPMENT_SLOT_RANGED
	{ 4, 0, 2, 17, 0, 0, 0, 3608, "Heartseeker Scope" }, // Hunter e warrior
	{ 4, 0, 2, 17, 0, 0, 3, 3607, "Sun Scope" }, // Somente para hunter
	{ 4, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowShieldMenu           EQUIPMENT_SLOT_OFFHAND   INVTYPE_SHIELD
	{ 6, 0, 2, 16, 0, 0, 0, 1952, "Defense -- 20 Defense" }, //30:30:-18:0
	{ 6, 0, 2, 16, 0, 0, 0, 1128, "Greater Intellect -- 25 Intellect" },
	{ 6, 0, 2, 16, 0, 0, 0, 1071, "Major Stamina -- 18 Stamina" },
	{ 6, 0, 2, 16, 0, 0, 0, 3229, "Resilience -- 12 Resilience" },
	{ 6, 0, 2, 16, 0, 0, 0, 3849, "Titanium Plating -- 36 Block" },
	{ 6, 0, 2, 16, 0, 0, 0, 3748, "Titanium Shield Spike -- 81 Block + 50% less Disarm" },
	{ 6, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowHeadMenu	      0 = EQUIPMENT_SLOT_HEAD	
	{ 7, 0, 2, 0, 0, 0, 0, 3819, "Arc. - 30 Spell Power + 10 Mp5" },
	{ 7, 0, 2, 0, 0, 0, 0, 3820, "Arc. - 30 Spell Power + 20 Crit" },
	{ 7, 0, 2, 0, 0, 0, 0, 3796, "Arc. - 29 Spell Power + 20 Resil Rat" },
	{ 7, 0, 2, 0, 0, 0, 0, 3842, "Arc. - 30 Stamina + 25 Resil" },
	{ 7, 0, 2, 0, 0, 0, 0, 3818, "Arc. - 37 Stamina + 20 Defense" },
	{ 7, 0, 2, 0, 0, 0, 0, 3817, "Arc. - 50 Attack Power + 20 Crit" },
	{ 7, 0, 2, 0, 0, 0, 0, 3795, "Arc. - 50 Attack Power + 20 Resil" },
	{ 7, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowShouldersMenu      EQUIPMENT_SLOT_SHOULDERS
	{ 8, 0, 2, 2, 773, 450, 0, 3835, "Master's Inscription of the Axe" }, // Requer SKILL_INSCRIPTION 450
	{ 8, 0, 2, 2, 773, 450, 0, 3836, "Master's Inscription of the Crag" }, // Requer SKILL_INSCRIPTION 450
	{ 8, 0, 2, 2, 773, 450, 0, 3837, "Master's Inscription of the Pinnacle" }, // Requer SKILL_INSCRIPTION 450
	{ 8, 0, 2, 2, 773, 450, 0, 3838, "Master's Inscription of the Storm" }, // Requer SKILL_INSCRIPTION 450
	{ 8, 0, 2, 2, 0, 0, 0, 3808, "Axe - 40 Attack Power + 15 Crit" },
	{ 8, 0, 2, 2, 0, 0, 0, 3809, "Crag - 24 Spell Power + 8 Mp5" },
	{ 8, 0, 2, 2, 0, 0, 0, 3852, "Pinnacle - 30 Stamina + 15 Resil" },
	{ 8, 0, 2, 2, 0, 0, 0, 3811, "Gladiator - 20 Dodge + 15 Defense" },
	{ 8, 0, 2, 2, 0, 0, 0, 3810, "Storm - 24 Spell Power + 15 Crit" },
	{ 8, 0, 2, 2, 0, 0, 0, 3794, "Dominance - 23 Spel Pow + 15 Resil" },	
	{ 8, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowCloakMenu			EQUIPMENT_SLOT_BACK
	{ 9, 0, 2, 14, 202, 450, 0, 3859, "Springy Arachnoweave" }, //Requer SKILL_ENGINEERING 450
	{ 9, 0, 2, 14, 202, 450, 0, 3605, "Flexweave Underlay" }, //SKILL_ENGINEERING 450
	{ 9, 0, 2, 14, 0, 0, 4, 3256, "Shadow Armor" }, // Exclusivo Rogue
	{ 9, 0, 2, 14, 197, 450, 0, 3728, "Darkglow Embroidery" }, //Requer SKILL_TAILORING 450
	{ 9, 0, 2, 14, 197, 450, 0, 3722, "Lightweave Embroidery" }, //Requer SKILL_TAILORING 450
	{ 9, 0, 2, 14, 197, 450, 0, 3730, "Swordguard Embroidery" }, //Requer SKILL_TAILORING 450
	{ 9, 0, 2, 14, 0, 0, 0, 3296, "Wisdom - 10 Spirit +2% reduce threat" },
	{ 9, 0, 2, 14, 0, 0, 0, 1951, "Titanweave - 16 Defense" },
	{ 9, 0, 2, 14, 0, 0, 0, 3243, "Spell Piercing - 35 Spell Pen" },
	{ 9, 0, 2, 14, 0, 0, 0, 3294, "Mighty Armor - 225 Armor" },
	{ 9, 0, 2, 14, 0, 0, 0, 1099, "Major Agility - 22 Agility" },
	{ 9, 0, 2, 14, 0, 0, 0, 3831, "Greater Speed - 23 Haste" },
	{ 9, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	{ 10, 0, 2, 4, 0, 0, 0, 3233, "Exceptional Mana - 150 Mana" },
	{ 10, 0, 2, 4, 0, 0, 0, 3533, "Greater Mana Restoration - 10 Mp5" },
	{ 10, 0, 2, 4, 0, 0, 0, 3245, "Exceptional Resilience - 20 Resilience" },
	{ 10, 0, 2, 4, 0, 0, 0, 3297, "Super Health - 225 Health" },
	{ 10, 0, 2, 4, 0, 0, 0, 3832, "10 of all stats" },
	{ 10, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowBracerMenu		EQUIPMENT_SLOT_WRISTS
	{ 11, 0, 2, 8, 0, 0, 0, 3845, "Greater Assault - 50 Attack Power" },
	{ 11, 0, 2, 8, 0, 0, 0, 3458, "Exceptional Intellect - 16 Intellect" },
	{ 11, 0, 2, 8, 0, 0, 0, 1147, "Major Spirit - 18 Spirit" },
	{ 11, 0, 2, 8, 0, 0, 0, 3231, "Expertise - 15 Expertise" },
	{ 11, 0, 2, 8, 0, 0, 0, 2661, "Greater Stats - 6 all stats" },
	{ 11, 0, 2, 8, 0, 0, 0, 2332, "Superior Spellpower - 30 Spell Power" },
	{ 11, 0, 2, 8, 0, 0, 0, 3850, "Major Stamina - 40 Stamina" },
	{ 11, 0, 2, 8, 164, 450, 0, 3717, "Socket Bracer" }, //Reuqer SKILL_BLACKSMITHING 450	
	{ 11, 0, 2, 8, 165, 450, 0, 3756, "Fur Lining: Attack Power" }, //Reuqer SKILL_LEATHERWORKING 450
	{ 11, 0, 2, 8, 165, 450, 0, 3757, "Fur Lining: Stamina" }, //Reuqer SKILL_LEATHERWORKING 450
	{ 11, 0, 2, 8, 165, 450, 0, 3758, "Fur Lining: Spell Power" }, //Reuqer SKILL_LEATHERWORKING 450
	{ 11, 0, 2, 8, 165, 450, 0, 3763, "Fur Lining: Arcane Resist" }, //Reuqer SKILL_LEATHERWORKING 450
	{ 11, 0, 2, 8, 165, 450, 0, 3762, "Fur Lining: Nature Resist" }, //Reuqer SKILL_LEATHERWORKING 450
	{ 11, 0, 2, 8, 165, 450, 0, 3761, "Fur Lining: Shadow Resist" }, //Reuqer SKILL_LEATHERWORKING 450
	{ 11, 0, 2, 8, 165, 450, 0, 3760, "Fur Lining: Frost Resist" }, //Reuqer SKILL_LEATHERWORKING 450
	{ 11, 0, 2, 8, 165, 450, 0, 3759, "Fur Lining: Fire Resist" }, //Reuqer SKILL_LEATHERWORKING 450
	{ 11, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowGlovesMenu		EQUIPMENT_SLOT_HANDS
	{ 12, 0, 2, 9, 0, 0, 0, 3253, "Armsman - 2% Threat 10 Parry" },
	{ 12, 0, 2, 9, 0, 0, 0, 2330, "Exceptional Spellpower -- 23 Spell Power" },
	{ 12, 0, 2, 9, 0, 0, 0, 3231, "Expertise - 15 Expertise" },
	{ 12, 0, 2, 9, 0, 0, 0, 1603, "Greater Assault - 44 Attack Power" },
	{ 12, 0, 2, 9, 0, 0, 0, 1097, "Major Agility - 20 Agility" },
	{ 12, 0, 2, 9, 0, 0, 0, 3234, "Precision - 20 Hit Rating" },
	{ 12, 0, 2, 9, 164, 450, 0, 3723, "Socket Gloves" }, //Requer SKILL_BLACKSMITHING 450
	{ 12, 0, 2, 9, 202, 450, 0, 3603, "Hand-Mounted Pyro Rocket" }, //Requer SKILL_ENGINEERING 450
	{ 12, 0, 2, 9, 202, 450, 0, 3604, "Hyperspeed Accelerators" }, //Requer SKILL_ENGINEERING 450
	{ 12, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowBeltMenu			EQUIPMENT_SLOT_WAIST
	{ 13, 0, 4, 5, 0, 0, 0, 3729, "Eternal Belt Buckle" },
	{ 13, 0, 4, 5, 202, 450, 0, 3601, "Frag Belt" }, //Requer SKILL_ENGINEERING 450
	{ 13, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowLegsMenu			EQUIPMENT_SLOT_LEGS
	{ 14, 0, 4, 6, 0, 0, 0, 3822, "Leg Armor - 55 Stam 22 Agil" },
	{ 14, 0, 4, 6, 0, 0, 0, 3823, "Leg Armor - 75 AP 22 Crit" },
	{ 14, 0, 4, 6, 0, 0, 0, 3853, "Leg Armor - 40 Resil 28 Stam" },
	{ 14, 0, 4, 6, 0, 0, 0, 3873, "Spellthread - 50 SP 30 Stam" },
	{ 14, 0, 4, 6, 0, 0, 0, 3872, "Spellthread - 50 SP 22 Spirit" },
	{ 14, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowBootsMenu			EQUIPMENT_SLOT_FEET 
	{ 15, 15, 4, 0, 0, 0, 0, 0, "" },
	{ 15, 0, 4, 7, 0, 0, 0, 3826, "Icewalker - 12 Hit + 12 Crit" },
	{ 15, 0, 4, 7, 0, 0, 0, 1597, "Greater Assault - 32 Assult" },
	{ 15, 0, 4, 7, 0, 0, 0, 3259, "Greater Fortitude - 22 Stamins" },
	{ 15, 0, 4, 7, 0, 0, 0, 1147, "Greater Spirit - 18 Spirit" },
	{ 15, 0, 4, 7, 202, 450, 0, 3606, "Nitro Boosts" }, //Requer SKILL_ENGINEERING 450
	{ 15, 0, 4, 7, 202, 450, 0, 983, "Superior Agility - 16 Agility" }, //Requer SKILL_ENGINEERING 450
	{ 15, 0, 4, 7, 202, 450, 0, 3232, "Vitality - 15 Stam + Speed Increase" }, //Requer SKILL_ENGINEERING 450
	{ 15, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },

	//ShowRingsMenu
	{ 16, 17, 4, 0, 333, 450, 0, 0, "Finger 1" },
	{ 16, 18, 4, 0, 333, 450, 0, 0, "Finger 2" },
	{ 16, 100, 8, 0, 0, 0, 0, 0, "<< Voltar" },
	//EQUIPMENT_SLOT_FINGER1 = 10
	{ 17, 0, 4, 10, 0, 0, 0, 3839, "Assault" },
	{ 17, 0, 4, 10, 0, 0, 0, 3840, "Greater Spellpower" },
	{ 17, 0, 4, 10, 0, 0, 0, 3791, "Stamina" },
	{ 17, 16, 8, 0, 0, 0, 0, 0, "<< Voltar" },
	//EQUIPMENT_SLOT_FINGER2 = 11
	{ 18, 0, 4, 11, 0, 0, 0, 3839, "Assault" },
	{ 18, 0, 4, 11, 0, 0, 0, 3840, "Greater Spellpower" },
	{ 18, 0, 4, 11, 0, 0, 0, 3791, "Stamina" },
	{ 18, 16, 8, 0, 0, 0, 0, 0, "<< Voltar" },
	//Remover encatamentos de rings
	{ 98, 0, 6, 10, 0, 0, 0, 0, "Finger1->" },
	{ 98, 0, 6, 11, 0, 0, 0, 0, "Finger2->"},
	{ 98, 99, 8, 0, 0, 0, 0, 0, "<< Voltar" }
};
uint32 GetText(unsigned int menu, Player* /*pPlayer*/)
{
	uint32 TEXT = 50030; //Default
	switch (mvData[menu].Menu)
	{
	case 100:
		TEXT = 50031;
		break;
	case 99:
		TEXT = 50032;
		break;
	}
	return (TEXT);
}
bool playerCheckClasse(uint8 playerClass, unsigned char pcc)
{
	bool Show = false;
	switch (mvData[pcc].pClasses)
	{
	case 0:
		Show = true;
		break;
	case CLASS_WARRIOR:
		if (playerClass == CLASS_WARRIOR)
			Show = true;
		break;
	case CLASS_PALADIN:
		if (playerClass == CLASS_PALADIN)
			Show = true;
		break;
	case CLASS_DRUID:
		if (playerClass == CLASS_DRUID)
			Show = true;
		break;
	case CLASS_DEATH_KNIGHT:
		if (playerClass == CLASS_DEATH_KNIGHT)
			Show = true;
		break;
	case CLASS_MAGE:
		if (playerClass == CLASS_MAGE)
			Show = true;
		break;
	case CLASS_HUNTER:
		if (playerClass == CLASS_HUNTER)
			Show = true;
		break;
	case CLASS_PRIEST:
		if (playerClass == CLASS_PRIEST)
			Show = true;
		break;
	case CLASS_WARLOCK:
		if (playerClass == CLASS_WARLOCK)
			Show = true;
		break;
	case CLASS_SHAMAN:
		if (playerClass == CLASS_SHAMAN)
			Show = true;
		break;
	case CLASS_ROGUE:
		if (playerClass == CLASS_ROGUE)
			Show = true;
		break;
	}
	return (Show);
}
void Acao(Player* /*player*/, Creature* /*creature*/, uint32 id)
{
	switch (id)
	{
	case 99:

		break;
	case 2:
		
		break;
	
	}
	return;
}
Item* PlayerAddItem(Player* player, uint32 item_id)
{
	uint8 count = 1;
	uint32 noSpaceForCount = 0;
	ItemPosCountVec dest;
	InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, item_id, count, &noSpaceForCount);
	if (msg != EQUIP_ERR_OK)
		count -= noSpaceForCount;
	Item* item = player->StoreNewItem(dest, item_id, true,
		Item::GenerateItemRandomPropertyId(item_id));
	if (noSpaceForCount > 0)
	{
		player->GetSession()->SendNotification("Por favor, faça espaço no seu "	"inventário primeiramente.");
		return NULL;
	}
	return item;
}
void EnchantWithItem(Player* player, uint32 item_id, Item* target)
{
	Item* item = PlayerAddItem(player, item_id);
	SpellCastTargets* targets = new SpellCastTargets();
	targets->SetItemTarget(target);
	player->CastItemUseSpell(item, *targets, 1, 0);
}
void EnchantWithSpell(Player* player, uint32 spell_id, Item* item)
{
	SpellCastTargets* targets = new SpellCastTargets();
	targets->SetItemTarget(item);
	player->CastSpell(*targets, sSpellMgr->GetSpellInfo(spell_id),
		NULL, TRIGGERED_IGNORE_POWER_AND_REAGENT_COST);
}
bool CobrarEncantos(Player* player)
{
	if (CobrarEncantamentos)
	{
		if (TokenTipo == 1){
			if (player->HasItemCount(IDToken, vEncanto, true))
			{
				player->DestroyItemCount(IDToken, vEncanto, true);
				return true;
			}
			else{
				ChatHandler(player->GetSession()).PSendSysMessage("|cffFF4500Você não tem o valor suficiente para encantar este item. Valor necessário:|cffFF4500%u|r |cffffcc00 Emblem Of Frost|r", vEncanto);
				return false;
			}
		}
		else{
			if (TokenTipo == 2){
				if (player->GetMoney() >= vEncanto*GOLD)
				{
					player->ModifyMoney(-int(vEncanto*GOLD), true);
					return true;
				}
				else{
					ChatHandler(player->GetSession()).PSendSysMessage("|cffFF4500Você não tem Gold sufuciente para encantar este item. Valor necessário:|cffFF4500%u|r G |cffffcc00de Gold|r", vEncanto);
					return false;
				}
			}
		}
	}
	return true;
}
void Enchant(Player* player, Creature* creature, Item* item, uint32 enchantid)
{
	if (!item)
	{
		player->GetSession()->SendNotification("Favor equipar um item primeiro.");
		return;
	}
	if (!CobrarEncantos(player))
		return;

	switch (enchantid)
	{
	case ENCHANT_WEP_GREATER_SPELL_POWER:
	case ENCHANT_WEP_AGILITY_2H:
	case ENCHANT_WEP_MASSACRE:
		if (item->GetTemplate()->InventoryType != INVTYPE_2HWEAPON)
		{
			player->GetSession()->SendNotification("Favor equipar uma arma de duas mãos antes.");
			return;
		}
		break;
	case ENCHANT_SHIELD_DEFENSE:
	case ENCHANT_SHIELD_INTELLECT:
	case ENCHANT_SHIELD_MAJOR_STAMINA:
	case ENCHANT_SHIELD_RESILIENCE:
	case ENCHANT_SHIELD_TITANIUM_PLATING:
	case ENCHANT_SHIELD_TITANIUM_SPIKE:
		if (item->GetTemplate()->InventoryType != INVTYPE_SHIELD)
		{
			player->GetSession()->SendNotification("Favor equipar um escudo antes.");
			return;
		}
		break;
	case ENCHANT_RANGED_HEARTSEEKER_SCOPE: // EQUIPMENT_SLOT_RANGED
	case ENCHANT_RANGED_SUN_SCOPE: // EQUIPMENT_SLOT_RANGED
		if (item->GetTemplate()->InventoryType != INVTYPE_RANGED &&	item->GetTemplate()->InventoryType != INVTYPE_RANGEDRIGHT)
		{
			player->GetSession()->SendNotification("Favor equipar uma arma ranged antes. Ex:[Bow, CrossBow e Gun].");
			return;
		}
		break;
//======================================================== EQUIPMENT_SLOT_MAINHAND & EQUIPMENT_SLOT_OFFHAND
	case ENCHANT_WEP_CINDERGLACIER:
	case ENCHANT_WEP_LICHBANE:
	case ENCHANT_WEP_RAZORICE:
	case ENCHANT_WEP_SPELLBREAKING:
	case ENCHANT_WEP_SWORDBREAKING:
	case ENCHANT_WEP_FALLEN_CRUSADER:
	case ENCHANT_WEP_NERUBIAN_CARAPACE:
	case ENCHANT_WEP_BLADE_WARD:
	case ENCHANT_WEP_BLOOD_DRAINING:
	case ENCHANT_WEP_ACCURACY:
	case ENCHANT_WEP_BLACK_MAGIC:
	case ENCHANT_WEP_BATTLEMASTER:
	case ENCHANT_WEP_BERSERKING:
	case ENCHANT_WEP_AGILITY_1H:
	case ENCHANT_WEP_SPIRIT:
	case ENCHANT_WEP_EXECUTIONER:
	case ENCHANT_WEP_ICEBREAKER:
	case ENCHANT_WEP_LIFEWARD:
	case ENCHANT_WEP_MIGHTY_SPELL_POWER:
	case ENCHANT_WEP_MONGOOSE:
	case ENCHANT_WEP_POTENCY:
	case ENCHANT_WEP_TITANGUARD:
	case ENCHANT_WEP_TITANIUM_CHAIN:
		if (item->GetTemplate()->InventoryType == INVTYPE_SHIELD)
		{
			player->GetSession()->SendNotification("Este encantamento não pode ser aplicado em escudos");
			return;
		}
		break;
//======================================================== EQUIPMENT_SLOT_MAINHAND & EQUIPMENT_SLOT_OFFHAND
	default:
		break;
	}
	player->ApplyEnchantment(item, PERM_ENCHANTMENT_SLOT, false);
	item->ClearEnchantment(PERM_ENCHANTMENT_SLOT);
	item->SetEnchantment(PERM_ENCHANTMENT_SLOT, enchantid, 0, 0);
	player->ApplyEnchantment(item, PERM_ENCHANTMENT_SLOT, true);
	switch (enchantid)
	{
	case ENCHANT_BELT_ETERNAL_BELT_BUCKLE: //EQUIPMENT_SLOT_WAIST
		EnchantWithItem(player, 41611, item); 
		break;
	case ENCHANT_BRACER_SOCKET_BRACER: //EQUIPMENT_SLOT_WAIST
		PlayerAddItem(player, 5956); // Blacksmith hammer
		EnchantWithSpell(player, 55628, item);
		player->DestroyItemCount(5956, -1, true, false);
		break;
	case ENCHANT_GLOVES_SOCKET_GLOVES:
		PlayerAddItem(player, 5956); // Blacksmith hammer
		EnchantWithSpell(player, 55641, item);
		player->DestroyItemCount(5956, -1, true, false);
		break;
	}
	std::string item_name = item->GetTemplate()->Name1.c_str();
	//	char* message;
	if (item->GetEnchantmentId(PERM_ENCHANTMENT_SLOT) != 0){
		player->GetSession()->SendNotification("|cff9400D3%s |cff00FF00encantamento realizado com sucesso!", item->GetTemplate()->Name1.c_str());
		player->CastSpell(player, 46325, false); // Spell só para visual //26410
		player->CastSpell(creature, 48340, false); // Spell só para visual //26410
	}
	else
	player->GetSession()->SendNotification("|cff9400D3%s |cffFF0000ERRO: Impossível aplicar encantamento no item!", item->GetTemplate()->Name1.c_str());
}
bool RemoveEnchantS(Player* player, Item* item)
{
	//Item* slot = player->GetItemByPos(INVENTORY_SLOT_BAG_0, item);
	if (!item)
	{
		player->GetSession()->SendNotification("Você não tem item Equipado.");
		return false;
	}
	if (item->GetEnchantmentId(PERM_ENCHANTMENT_SLOT) != 0)
	{
		item->ClearEnchantment(PERM_ENCHANTMENT_SLOT);
		player->GetSession()->SendNotification("|cff9400D3%s |cff7CFC00encantamento removido com sucesso!", item->GetTemplate()->Name1.c_str());
		return true;		
	}
	else
	{ 
		player->GetSession()->SendNotification("|cffFF0000Este item não está encantantado!"); 		
		return false;
	}
	return true;
}
// Creature
class Script_Encantamentos : public CreatureScript
{
public:
	Script_Encantamentos() : CreatureScript("Script_Encantamentos") { }

	void GetMenuIDs(Player* player, Creature* creature, uint32 menuId)
	{		
		player->PlayerTalkClass->ClearMenus();
		std::ostringstream Bs;
		bool evMENU = false;
		for (uint8 i = 0; i < (sizeof(mvData) / sizeof(*mvData)); i++)
		{
			if (evMENU && mvData[i].Menu != menuId)
				break;
			if (mvData[i].Menu == menuId && playerCheckClasse(player->getClass(), i))
			{
				Item* ItemsSlot = player->GetItemByPos(INVENTORY_SLOT_BAG_0, mvData[i].Slot);
				
				if (mvData[i].Skill != 0 && !(/*player->HasSkill(mvData[i].Skill) &&*/ player->GetSkillValue(mvData[i].Skill) >= mvData[i].SkillValor)) continue;
				
				if (CobrarEncantamentos && mvData[i].Submenu == 0 && mvData[i].Menu != 99)
				{
					if (mvData[i].Menu != 98)
					{
						if (ItemsSlot)
						{
							TextoConfirmar = "Tem Certeza que quer encantar este item\n\n[|cff9400D3" + ItemsSlot->GetTemplate()->Name1 + "|r]";
						}
						else{
							TextoConfirmar = "|cffFF0000Nenhum item equipado!|r";
						} 
						AddGossipItemFor(player, mvData[i].Icone, mvData[i].Nome, GOSSIP_SENDER_MAIN, i, TextoConfirmar, 0, false);
					}
					else{
						if (ItemsSlot)
						AddGossipItemFor(player, mvData[i].Icone, mvData[i].Nome +ItemsSlot->GetTemplate()->Name1, GOSSIP_SENDER_MAIN, i);
					}
				}
				else
					AddGossipItemFor(player, mvData[i].Icone, mvData[i].Nome, GOSSIP_SENDER_MAIN, i);
				evMENU = true;
			}
		}
		SendGossipMenuFor(player, 907, creature->GetGUID());
		player->PlayerTalkClass->SendGossipMenu(GetText(menuId, player), creature->GetGUID());
		return;
	}
	bool OnGossipHello(Player* player, Creature* creature)
	{
		if (player->IsInCombat()){
			CloseGossipMenuFor(player);
			ChatHandler(player->GetSession()).PSendSysMessage("|cffFF0000Você esta em Combate!| r");
			return true;
		}
		else
		{
			GetMenuIDs(player, creature, 1);
			return true;
		}
	}	
	bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
	{
		player->PlayerTalkClass->ClearMenus();
		uint32 menuLista;
		Item* ItemSlot = player->GetItemByPos(INVENTORY_SLOT_BAG_0, mvData[action].Slot);
		switch (action)
		{
		case EQUIPMENT_SLOT_MAINHAND:
			break;
		default:
			menuLista = mvData[action].Submenu;
			break;
		}
		if ((mvData[action].Menu == 99 && mvData[action].Submenu == 0) || (mvData[action].Menu == 98 && mvData[action].Submenu == 0))
		{
			RemoveEnchantS(player, ItemSlot);
			menuLista = mvData[action].Menu;
		}
		else{
			if (menuLista == 0)
			{
				Enchant(player, creature, ItemSlot, mvData[action].AcaoID);
				menuLista = mvData[action].Menu;
			}
		}
		GetMenuIDs(player, creature, menuLista);		
		return true;
	}
};
class Script_Encantamentos_WorldScript : public WorldScript
{
public:
	Script_Encantamentos_WorldScript() : WorldScript("Script_Encantamentos_WorldScript") { }
	void OnConfigLoad(bool /*reload*/)
	{
		CobrarEncantamentos = sConfigMgr->GetBoolDefault("Charge.Enchantments", true);
		TokenTipo           = sConfigMgr->GetIntDefault("Type.Token", 0);
		IDToken             = sConfigMgr->GetIntDefault("IDToken", 0);
		vEncanto            = sConfigMgr->GetIntDefault("Value.Enchants", 0);
	}
};
void AddSC_Script_Encantamentos()
{
	new Script_Encantamentos();
	new Script_Encantamentos_WorldScript;
}
