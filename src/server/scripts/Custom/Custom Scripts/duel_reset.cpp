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

class Duel_Reset : public PlayerScript
{
public:
Duel_Reset() : PlayerScript("Duel_Reset"){}

void OnDuelEnd(Player* pWinner, Player* pLoser, DuelCompleteType type)

{
    if (pWinner->GetAreaId() == 5974)
    {

		if (type != DUEL_WON)
		return;
        pWinner->RemoveArenaSpellCooldowns();
        pLoser->RemoveArenaSpellCooldowns();
        pWinner->SetHealth(pWinner->GetMaxHealth());
        if ( pWinner->getPowerType() == POWER_MANA )
            pWinner->SetPower(POWER_MANA, pWinner->GetMaxPower(POWER_MANA));
        pLoser->SetHealth(pLoser->GetMaxHealth());
        if ( pLoser->getPowerType() == POWER_MANA )
            pLoser->SetPower(POWER_MANA, pLoser->GetMaxPower(POWER_MANA));
	

    }
}
};

void AddSC_Duel_Reset()
{
new Duel_Reset();
}