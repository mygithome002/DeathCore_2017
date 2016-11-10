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
 
#include "Player.h"
#include "Chat.h"
#include "World.h"
#include "boost/date_time.hpp"
#include "Config.h"

class XpWeekend : public PlayerScript
{
    public:
    XpWeekend() : PlayerScript("XpWeekend") { }
    void OnGiveXP(Player* player, uint32& amount, Unit* victim)override
{
if(sConfigMgr->GetBoolDefault("DoubleXP.Enable", true))
{
    boost::gregorian::date date(boost::gregorian::day_clock::local_day());
    auto day = date.day_of_week();
    if (day == boost::date_time::Friday ||
        day == boost::date_time::Saturday ||
        day == boost::date_time::Sunday) {

        amount = amount*2; }
}
}
    void OnLogin(Player* player, bool firstLogin)
    {
if(sConfigMgr->GetBoolDefault("DoubleXP.Enable", true))
{
        boost::gregorian::date date(boost::gregorian::day_clock::local_day());
    auto day = date.day_of_week();
    if (day == boost::date_time::Friday ||
        day == boost::date_time::Saturday ||
        day == boost::date_time::Sunday) {

        ChatHandler(player->GetSession()).PSendSysMessage("Evento Dobro de XP Ativado!");
        }
}
    }
};

void AddSC_XpWeekend()
{
    new XpWeekend();
}