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

class Dynamic_Resurrections : public PlayerScript
{
public:
	Dynamic_Resurrections() : PlayerScript("Dynamic_Resurrections") {}

	void OnCreatureKill(Player* player, Creature* boss) override
	{
		if (sDynRes->IsInDungeonOrRaid(player) && (boss->isWorldBoss() || boss->IsDungeonBoss()))
			player->SummonCreature(C_Resurrection_ENTRY, boss->GetPositionX(), boss->GetPositionY(), boss->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, C_SPAWN_TIMER_TWO_HOURS);
	}
};

void AddSC_Dynamic_Resurrections()
{
	new Dynamic_Resurrections();
}