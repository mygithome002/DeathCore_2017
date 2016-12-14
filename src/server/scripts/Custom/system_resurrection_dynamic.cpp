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

#include "../../../scripts/Custom/system_resurrection_dynamic.h"

bool Dynamic_Resurrection::IsInDungeonOrRaid(Player* player)
{
	if (sMapStore.LookupEntry(player->GetMapId())->Instanceable())
		return true; // boolean need to return to a value
	return false;
}

bool Dynamic_Resurrection::CheckForSpawnPoint(Player* player)
{
	// Find Nearest Creature And Teleport.
	if (Creature* creature = player->FindNearestCreature(C_Resurrection_ENTRY, C_DISTANCE_CHECK_RANGE))
		return true;
	return false;
}

void Dynamic_Resurrection::DynamicResurrection(Player* player)
{
	// Find Nearest Creature And Teleport.
	if (Creature* creature = player->FindNearestCreature(C_Resurrection_ENTRY, C_DISTANCE_CHECK_RANGE))
		player->TeleportTo(player->GetMapId(), creature->GetPositionX(), creature->GetPositionY(), creature->GetPositionZ(), 1);
	// Revive Player with 70 %
	player->ResurrectPlayer(0.7);
	player->SpawnCorpseBones();
}