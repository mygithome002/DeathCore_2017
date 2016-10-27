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

#ifndef SiegeOfOrgrimmar_H
#define SiegeOfOrgrimmar_H

#include "SpellScript.h"
#include "Map.h"
#include "Creature.h"
#include "CreatureAIImpl.h"

enum Data
{
    // Immerseus
    DATA_IMMERSEUS                    = 1,

    // Fallen Protectors
    DATA_FALLEN_PROTECTORS            = 2,
    DATA_STONE                        = 3,
    DATA_HU                           = 4,
    DATA_SUN                          = 5,
    
    // Norushen
    DATA_AMALGAM_OF_CORRUPTION        = 6,

    // Sha of Pride
    DATA_SHA_OF_PRIDE                 = 7,

    // Galakras
    DATA_GALAKRAS                     = 8,

    // Iron Juggernaut
    DATA_IRON_JUGGERNAUT              = 9,

    // Kor'kron Dark Shamans
    DATA_DARK_SHAMANS                 = 10,
    DATA_EARTHBREAKER_HAROMM          = 11,
    DATA_WAVEBINDER_KARDRIS           = 12,

    // General Nazgrim
    DATA_GENERAL_NAZGRIM              = 13,

    // Malkorok
    DATA_MALKOROK                     = 14,

    // Spoils of Pandaria
    DATA_SPOILS_OF_PANDARIA           = 15,

    // Thok the Bloodthirsty
    DATA_THOK_THE_BLOODTHIRSTY        = 16,

    // Siegecrafter Blackfuse
    DATA_SIEGECRAFTER_BLACKFUSE       = 17,

    // Paragons of the Klaxxi
    DATA_PARAGONS_OF_THE_KLAXXI_EVENT = 18,
    DATA_SKEER_THE_BLOODSEEKER        = 19,
    DATA_RIKKAL_THE_DISSECTOR         = 20,
    DATA_HISEK_THE_SWARMKEEPER        = 21,
    DATA_KAROZ_THE_LOCUST             = 22,
    DATA_KORVET_THE_PRIME             = 23,
    DATA_IYYOKUK_THE_LUCID            = 24,
    DATA_XARIL_THE_POISONED_MIND      = 25,
    DATA_KAZTIK_THE_MANIPULATOR       = 26,
    DATA_KILRUK_THE_WIND_REAVER       = 27,

    // Garrosh Hellscream
    DATA_GARROSH_HELLSCREAM           = 28,

    // Lorewalker Cho
    DATA_LOREWALKER_CHO               = 29,
};

enum eCreaturesLocal
{
    // Immerseus
    BOSS_IMMERSEUS                  = 72436,
    CREATURE_TORMENTED_INITATE      = 73349,
    CREATURE_FALLEN_POOL_TENDER     = 73342,
    CREATURE_AQUEOUS_DEFENDER       = 73191,

    // Fallen Protectors
    BOSS_STONE                      = 71475,
    BOSS_HU                         = 71479,
    BOSS_SUN                        = 71480,

    // Norushen
    BOSS_AMALGAM_OF_CORRUPTION      = 72276,

    // Sha of Pride
    BOSS_SHA_OF_PRIDE               = 71734,

    // Galakras

    // Iron Juggernaut
    BOSS_IRON_JUGGERNAUT            = 71466,

    // Kor'kron Dark Shamans
    BOSS_EARTHBREAKER_HAROMM        = 71859,
    BOSS_WAVEBINDER_KARDRIS         = 71858,

    // General Nazgrim
    BOSS_GENERAL_NAZGRIM            = 71515,

    // Malkorok
    BOSS_MALKOROK                   = 71454,

    // Spoils of Pandaria

    // Thok the Bloodthirsty

    // Siegecrafter Blackfuse

    // Paragons of the Klaxxi

    // Garrosh Hellscream
    BOSS_GARROSH_HELLSCREAM         = 71865,
    CREATURE_THRALL                 = 73483,
    CREATURE_HEART_OF_YSHAARAJ_MAIN = 72215,
};

enum Actions
{
    ACTION_TALK_AFTER_IMMERSEUS = 2, // Lorewalker cho TALK_9
};

#endif
