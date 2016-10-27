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

class example_ItemGossip : public ItemScript
{
public:
    example_ItemGossip() : ItemScript("example_ItemGossip") { }

    bool OnUse(Player* player, Item* item, SpellCastTargets const& targets) override // Any hook here
    {
        player->PlayerTalkClass->ClearMenus(); // Clears old options
        player->ADD_GOSSIP_ITEM(0, "Morph", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        player->ADD_GOSSIP_ITEM(0, "Demorph", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, item->GetGUID());
        return false; // Cast the spell on use normally
    }

    void OnGossipSelect(Player* player, Item* item, uint32 sender, uint32 action) override
    {
        player->PlayerTalkClass->ClearMenus();

        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                player->SetDisplayId(999);
                break;
            case GOSSIP_ACTION_INFO_DEF + 2:
                player->DeMorph();
                break;
        }
        player->CLOSE_GOSSIP_MENU();
    }
};

void AddSC_example_ItemGossip() // Add to scriptloader normally
{
    new example_ItemGossip();
}
