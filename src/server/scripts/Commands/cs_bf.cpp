/*
* This file is part of the Pandaria 5.4.8 Project. See THANKS file for Copyright information
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

/* ScriptData
Name: bf_commandscript
%Complete: 100
Comment: All bf related commands
Category: commandscripts
EndScriptData */

#include "ScriptMgr.h"
#include "Chat.h"
#include "BattlefieldMgr.h"

class bf_commandscript : public CommandScript
{
public:
    bf_commandscript() : CommandScript("bf_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> battlefieldcommandTable =
        {
            { "start",          SEC_GAMEMASTER, false,  &HandleBattlefieldStart,    },
            { "stop",           SEC_GAMEMASTER, false,  &HandleBattlefieldEnd,      },
            { "switch",         SEC_GAMEMASTER, false,  &HandleBattlefieldSwitch,   },
            { "timer",          SEC_GAMEMASTER, false,  &HandleBattlefieldTimer,    },
            { "enable",         SEC_GAMEMASTER, false,  &HandleBattlefieldEnable,   },
        };
        static std::vector<ChatCommand> commandTable =
        {
            { "bf",             SEC_GAMEMASTER, false,  battlefieldcommandTable     },
        };
        return commandTable;
    }

    static bool HandleBattlefieldStart(ChatHandler* handler, const char* args)
    {
        uint32 battleid = 0;
        char* battleid_str = strtok((char*)args, " ");
        if (!battleid_str)
            return false;

        battleid = atoi(battleid_str);

        Battlefield* bf = sBattlefieldMgr->GetBattlefieldByBattleId(battleid);

        if (!bf)
            return false;

        bf->StartBattle();

        if (battleid == 1)
            handler->SendGlobalGMSysMessage("Wintergrasp (Command start used)");

        return true;
    }

    static bool HandleBattlefieldEnd(ChatHandler* handler, const char* args)
    {
        uint32 battleid = 0;
        char* battleid_str = strtok((char*)args, " ");
        if (!battleid_str)
            return false;

        battleid = atoi(battleid_str);

        Battlefield* bf = sBattlefieldMgr->GetBattlefieldByBattleId(battleid);

        if (!bf)
            return false;

        bf->EndBattle(true);

        if (battleid == 1)
            handler->SendGlobalGMSysMessage("Wintergrasp (Command stop used)");

        return true;
    }

    static bool HandleBattlefieldEnable(ChatHandler* handler, const char* args)
    {
        uint32 battleid = 0;
        char* battleid_str = strtok((char*)args, " ");
        if (!battleid_str)
            return false;

        battleid = atoi(battleid_str);

        Battlefield* bf = sBattlefieldMgr->GetBattlefieldByBattleId(battleid);

        if (!bf)
            return false;

        if (bf->IsEnabled())
        {
            bf->ToggleBattlefield(false);
            if (battleid == 1)
                handler->SendGlobalGMSysMessage("Wintergrasp is disabled");
        }
        else
        {
            bf->ToggleBattlefield(true);
            if (battleid == 1)
                handler->SendGlobalGMSysMessage("Wintergrasp is enabled");
        }

        return true;
    }

    static bool HandleBattlefieldSwitch(ChatHandler* handler, const char* args)
    {
        uint32 battleid = 0;
        char* battleid_str = strtok((char*)args, " ");
        if (!battleid_str)
            return false;

        battleid = atoi(battleid_str);

        Battlefield* bf = sBattlefieldMgr->GetBattlefieldByBattleId(battleid);

        if (!bf)
            return false;

        bf->EndBattle(false);
        if (battleid == 1)
            handler->SendGlobalGMSysMessage("Wintergrasp (Command switch used)");

        return true;
    }

    static bool HandleBattlefieldTimer(ChatHandler* handler, const char* args)
    {
        uint32 battleid = 0;
        uint32 time = 0;
        char* battleid_str = strtok((char*)args, " ");
        if (!battleid_str)
            return false;
        char* time_str = strtok(NULL, " ");
        if (!time_str)
            return false;

        battleid = atoi(battleid_str);

        time = atoi(time_str);

        Battlefield* bf = sBattlefieldMgr->GetBattlefieldByBattleId(battleid);

        if (!bf)
            return false;

        bf->SetTimer(time * IN_MILLISECONDS);
        bf->SendInitWorldStatesToAll();
        if (battleid == 1)
            handler->SendGlobalGMSysMessage("Wintergrasp (Command timer used)");

        return true;
    }
};

void AddSC_bf_commandscript()
{
    new bf_commandscript();
}
