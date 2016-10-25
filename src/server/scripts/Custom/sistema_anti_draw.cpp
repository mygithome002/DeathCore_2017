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
#include "../../../game/Entities/Pet/Pet.h"

const uint32 SPELL_DEMENTIA = 41406;

class AntiDrawSystem : public PlayerScript
{
public:
    AntiDrawSystem() : PlayerScript("AntiDrawSystem") {}

    void OnUpdateZone(Player* player, uint32 newZone, uint32 newArea)
	{
		Pet* pet = player->GetPet();

        // Remove Dementia on updating zone for player
        if (player->HasAura(SPELL_DEMENTIA))
            player->RemoveAura(SPELL_DEMENTIA);

		// Remove Dementia on upddating zone for pet
		if (pet)
		{
			if (pet->HasAura(SPELL_DEMENTIA))
			{
				pet->RemoveAura(SPELL_DEMENTIA);
			}
		}
    }

    void OnLogin(Player* player, bool /* OnLogin */)
    {
		Pet* pet = player->GetPet();

        // Remove Dementia on player login
        if (player->HasAura(SPELL_DEMENTIA))
            player->RemoveAura(SPELL_DEMENTIA);

		// Remove Dementia on Pet Login
		if (pet)
		{
			if (pet->HasAura(SPELL_DEMENTIA))
			{
				pet->RemoveAura(SPELL_DEMENTIA);
			}
		}
    }

};

void AddSC_Arena_AntiDraw()
{
    new AntiDrawSystem();
}