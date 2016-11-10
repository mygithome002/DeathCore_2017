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

// This is where scripts' loading functions should be declared:
void AddSC_System_Censure();
void AddSC_NoFarming();
void AddSC_fake_commandscript();
void AddSC_Reset();
void AddSC_example_ItemGossip();
void AddSC_example_PlayerGossip();
void AddSC_Tools_NPC();
void AddSC_NDP_NpcMorph();
void AddSC_REFORGER_NPC();
void AddSC_NPC_VisualWeapon();
void AddSC_VIP_Item();
void AddSC_VIP_Item_60d();
void AddSC_VIP_Item_120d();
void AddSC_VIP_Item_240d();
void AddSC_VIP_Item_480d();
void AddSC_VIP_Item_960d();
void AddSC_transmogriefer();
void AddSC_VIP_NPC();
void AddSC_VipSystemCommands();
void AddSC_weptransmog();

// The name of this function should match:
// void Add${NameOfDirectory}Scripts()
void AddCustomScripts()
{
	AddSC_System_Censure();
	AddSC_NoFarming();
    AddSC_fake_commandscript();
    AddSC_Reset();
    AddSC_example_ItemGossip();
    AddSC_example_PlayerGossip();
    AddSC_Tools_NPC();
    AddSC_NDP_NpcMorph();
    AddSC_REFORGER_NPC();
    AddSC_NPC_VisualWeapon();
    AddSC_VIP_Item();
    AddSC_VIP_Item_60d();
    AddSC_VIP_Item_120d();
    AddSC_VIP_Item_240d();
    AddSC_VIP_Item_480d();
    AddSC_VIP_Item_960d();
    AddSC_transmogriefer();
    AddSC_VIP_NPC();
    AddSC_VipSystemCommands();
    AddSC_weptransmog();
}