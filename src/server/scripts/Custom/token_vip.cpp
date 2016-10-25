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

#include "../../../game/Scripting/ScriptMgr.h"
#include "../../../game/Globals/ObjectMgr.h"
#include "../../../game/Maps/MapManager.h"
#include "../../../game/Chat/Chat.h"
#include "../../common/Common.h"
#include "../../../game/Miscellaneous/Language.h"
#include "../../../game/Grids/Cells/CellImpl.h"
#include "../../../game/Grids/Notifiers/GridNotifiers.h"
 
class vip_token_item : public ItemScript
{
public: vip_token_item() : ItemScript("vip_token_item") { }
       
bool OnUse(Player* player, Item* item, SpellCastTargets const& /*targets*/)
{
if (player->GetSession()->GetSecurity() == SEC_VIP)
{
player->GetSession()->SendNotification("Você já é V.I.P."); /* if player already have VIP access he will get a refund */
player->DestroyItemCount(item->GetEntry(), 1, true, false);
player->AddItem(800048, 10);
player->GetSession()->SendNotification("O token foi reembolsado.");
return false;
}
else
{
   QueryResult insertvip = LoginDatabase.PQuery("REPLACE INTO `account_access` VALUES(%u, 1, -1)", player->GetSession()->GetAccountId()); /*/will run the sql and give player V,I,P rank wich in my server is SEC_VIP=4 */
player->GetSession()->SetSecurity(SEC_VIP); /*will set security of that account to 4 so player don't have to logout to get vip privilege */
player->GetSession()->SendNotification("Agora a sua conta é V.I.P!");
//player->GiveLevel(80);
player->DestroyItemCount(item->GetEntry(), 1, true, false);
return true;
  }
       }
};
 
void AddSC_vip_token_item()
{
new vip_token_item();
}