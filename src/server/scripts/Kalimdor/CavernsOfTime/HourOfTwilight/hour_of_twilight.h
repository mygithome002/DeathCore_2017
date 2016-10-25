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

#ifndef DEF_HOUR_OF_TWILIGHT_H
#define DEF_HOUR_OF_TWILIGHT_H

enum Data 
{
     DATA_ARCURION_EVENT,
     DATA_ASIRA_EVENT,
     DATA_ARCHBISHOP_EVENT,
};

enum Data64 
{
     DATA_ASIRA,
     DATA_ARCURION,
     DATA_ARCHBISHOP,
};

enum CreatureIds 
{
    //Dungeon Bosses

    BOSS_ARCURION 	 = 54590,
    BOSS_ASIRA 		 = 54968,
    BOSS_ARCHBISHOP  = 54938,
	
    //Thrall
    NPC_THRALL       = 54971,
	
    //Trash
    NPC_FROZEN_SERVITOR = 54555
};

#endif
