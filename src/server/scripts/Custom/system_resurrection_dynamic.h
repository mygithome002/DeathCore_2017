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

#ifndef DYNAMIC_RESURRECTION
#define DYNAMIC_RESURRECTION

#include "Player.h"
#include "DBCStores.h"

class Player;

enum WAYPOINT_CREATURE
{
	C_Resurrection_ENTRY = 1, // change this as you wishes
	C_DISTANCE_CHECK_RANGE = 1000, // change this (in yards)
	C_SPAWN_TIMER_TWO_HOURS = 1200000, // change this (in miliseconds)
};

class TC_GAME_API Dynamic_Resurrection
{
public:
	static Dynamic_Resurrection* instance()
	{
		static Dynamic_Resurrection instance;
		return &instance;
	}
	
	bool IsInDungeonOrRaid(Player* player);
	bool CheckForSpawnPoint(Player* player);
	void DynamicResurrection(Player* player);
};
#define sDynRes Dynamic_Resurrection::instance()

#endif