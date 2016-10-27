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
#include "InstanceScript.h"
#include "siege_of_orgrimmar.h"

class instance_SiegeOfOrgrimmar : public InstanceMapScript
{
    public:
        instance_SiegeOfOrgrimmar() : InstanceMapScript("instance_SiegeOfOrgrimmar", 1136) { }

        struct instance_SiegeOfOrgrimmar_InstanceMapScript : public InstanceScript
        {
            instance_SiegeOfOrgrimmar_InstanceMapScript(Map* map) : InstanceScript(map)
            {

            }

			InstanceScript* Pinstance = this;

            // Immerseus
            uint64 ImmerseusGuid;

            // Fallen Protectors
            uint64 StoneGuid;
            uint64 HuGuid;
            uint64 SunGuid;

            // Norushen   
            uint64 amalgamGuid;

            // Sha of Pride
            uint64 ShaOfPrideGuid;

            // Galakras

            // Iron Juggernaut
            uint64 JuggernautGuid;

            // Kor'kron Dark Shamans
            uint64 HarommGuid;
            uint64 KardrisGuid;

            // General Nazgrim
            uint64 NazgrimGuid;

            // Malkorok
            uint64 MalkorokGuid;

            // Spoils of Pandaria

            // Thok the Bloodthirsty

            // Siegecrafter Blackfuse

            // Paragons of the Klaxxi

            // Garrosh Hellscream
            uint64 GarroshGuid;

            void Initialize()
            {
                // Immerseus
                ImmerseusGuid  = 0;

                // Fallen Protectors
                StoneGuid      = 0;
                HuGuid         = 0;
                SunGuid        = 0;

                // Norushen
                amalgamGuid    = 0;

                // Sha of Pride
                ShaOfPrideGuid = 0;

                // Galakras

                // Iron Juggernaut
                JuggernautGuid = 0;

                // Kor'kron Dark Shamans
                HarommGuid     = 0;
                KardrisGuid    = 0;

                // General Nazgrim
                NazgrimGuid	   = 0;

                // Malkorok
                MalkorokGuid   = 0;

                // Spoils of Pandaria

                // Thok the Bloodthirsty

                // Siegecrafter Blackfuse

                // Paragons of the Klaxxi

                // Garrosh Hellscream
                GarroshGuid    = 0;

                SetBossNumber(14);
            }

            void OnCreatureCreate(Creature* creature)
            {
                switch (creature->GetEntry())
                {
                    // Immerseus
                    case BOSS_IMMERSEUS:
                        ImmerseusGuid = creature->GetGUID();
                        break;

                    // Fallen Protectors
                    case BOSS_STONE:
                        StoneGuid = creature->GetGUID();
                        break;
                    case BOSS_HU:
                        HuGuid = creature->GetGUID();
                        break;
                    case BOSS_SUN:
                        SunGuid = creature->GetGUID();
                        break;

                        // Norushen
					case BOSS_AMALGAM_OF_CORRUPTION:
						amalgamGuid = creature->GetGUID();

                    // Sha of Pride
                    case BOSS_SHA_OF_PRIDE:
                        ShaOfPrideGuid = creature->GetGUID();
                        break;

                    // Galakras

                    // Iron Juggrenaut
                    case BOSS_IRON_JUGGERNAUT:
                        JuggernautGuid = creature->GetGUID();
                        break;

                    // Kor'kron Dark Shamans
                    case BOSS_EARTHBREAKER_HAROMM:
                        HarommGuid = creature->GetGUID();
                        break;
                    case BOSS_WAVEBINDER_KARDRIS:
                        KardrisGuid = creature->GetGUID();
                        break;

                    // General Nazgrim
                    case BOSS_GENERAL_NAZGRIM:
                        NazgrimGuid = creature->GetGUID();
                        break;

                    // Malkorok
                    case BOSS_MALKOROK:
                        MalkorokGuid = creature->GetGUID();
                        break;
                    // Spoils of Pandaria

                    // Thok the Bloodthirsty

                    // Siegecrafter Blackfuse

                    // Paragons of the Klaxxi

                    // Garrosh Hellscream
                    case BOSS_GARROSH_HELLSCREAM:
                        GarroshGuid = creature->GetGUID();
                        break;
                }
            }

            void OnUnitDeath(Unit* unit)
            {
                Creature* creature = unit->ToCreature();
                if (!creature)
                    return;
				
                /*switch (creature->GetEntry())
                {

                }*/
            }
            
            void OnGameObjectCreate(GameObject* go)
            {
                /*switch (go->GetEntry())
                {

                }*/
            }
            
            uint64 GetData64(uint32 type) const
            {
                switch (type)
                {
                    // Immerseus
                    case DATA_IMMERSEUS:
                        return ImmerseusGuid;
                        break;

                    // Fallen Protectors
                    case DATA_STONE:
                        return StoneGuid;
                        break;
                    case DATA_HU:
                        return HuGuid;
                        break;
                    case DATA_SUN:
                        return SunGuid;
                        break;

                        // Norushen
                    case DATA_AMALGAM_OF_CORRUPTION:
                        return amalgamGuid;
                        break;

                    // Sha of Pride
                    case DATA_SHA_OF_PRIDE:
                        return ShaOfPrideGuid;
                        break;

                    // Iron Juggernaut
                    case DATA_IRON_JUGGERNAUT:
                        return JuggernautGuid;
                        break;

                    // Kor'kron Dark Shamans
                    case DATA_EARTHBREAKER_HAROMM:
                        return HarommGuid;
                        break;
                    case DATA_WAVEBINDER_KARDRIS:
                        return KardrisGuid;
                        break;

                    // General Nazgrim
                    case DATA_GENERAL_NAZGRIM:
                        return NazgrimGuid;
                        break;

                    // Malkorok
                    case DATA_MALKOROK:
                        return MalkorokGuid;
                        break;

                    // Spoils of Pandaria

                    // Thok the Bloodthirsty

                    // Siegecrafter Blackfuse

                    // Paragons of the Klaxxi

                    // Garrosh Hellscream
                    case DATA_GARROSH_HELLSCREAM:
                        return GarroshGuid;
                        break;
                }

                return 0;
            }

            bool IsWipe()
            {
                Map::PlayerList const& PlayerList = instance->GetPlayers();

                if (PlayerList.isEmpty())
                    return true;

                return false;
            }
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const override
        {
            return new instance_SiegeOfOrgrimmar_InstanceMapScript(map);
        }
};

void AddSC_instance_SiegeOfOrgrimmar()
{
    new instance_SiegeOfOrgrimmar();
}
