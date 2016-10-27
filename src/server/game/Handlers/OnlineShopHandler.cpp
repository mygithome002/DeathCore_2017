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

#include "OnlineShopMgr.h"
#include "Opcodes.h"
#include "WorldSession.h"

void WorldSession::HandleOnlineShopQueryOpcode(WorldPacket& recvData)
{
    TC_LOG_DEBUG("network", "WORLD: Received CMSG_BATTLE_PAY_GET_PRODUCT_LIST");

    SendOnlineShopQueryResult();
}

void WorldSession::SendOnlineShopQueryResult()
{
    TC_LOG_DEBUG("network", "WORLD: Received SMSG_BATTLE_PAY_GET_PRODUCT_LIST_RESPONSE");

    WorldPacket data(SMSG_BATTLE_PAY_GET_PRODUCT_LIST_RESPONSE);

}