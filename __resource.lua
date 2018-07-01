--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {

    -- Utils
    "src/utils/utils.common.lua",
    "src/utils/utils.client.lua",

    -- Ui
    "src/ui/ui.client.lua",
    "src/ui/instructionalButtons.client.lua",

    -- Menu
    "src/menu/menu.client.lua",
    "src/menu/menus.client.lua",

    -- Blip
    "src/blip/blip.client.lua",
    "src/blip/blips.client.lua",

    -- Trigger
    "src/trigger/trigger.client.lua",
    "src/trigger/triggers.client.lua",

    -- Marker
    "src/marker/marker.client.lua",
    "src/marker/markers.client.lua",

    -- Area
    "src/area/area.client.lua",
    "src/area/areas.client.lua",

    -- Event 100% load
    "src/client.load.lua",

}

exports {

    -- Utils
    "TableLength",
    "Round",
    "CommaValue",
    "GetEntityDirection",
    "SetDebug",
    "Print",
    "TablePrint",

    -- Ui
    "HelpPromt",
    "LoadingPromt",
    "Message",
    "Notification",
    "AdvancedNotification",
    "Text",
    "OpenTextInput",
    "TextNotification",
    "Show3DText",

    -- Instructional Buttons
    "AddInstructionalButtons",
    "RemoveInstructionalButtons",
    "DisplayInstructionalButtons",
    "GetCurrentInstructionalButtons",

    -- Menu
    "AddMenu",
    "RemoveMenu",
    "MenuIsOpen",
    "CurrentMenu",
    "PrimaryMenu",
    "GetCurrentMenu",
    "GetPrimaryMenu",
    "FreezeMenu",
    "OpenMenu",
    "CloseMenu",
    "NextMenu",
    "BackMenu",
    "CleanMenuButtons",
    "SetMenuButtons",
    "SetMenuValue",
    "AddMenuButton",
    "RemoveMenuButton",

    -- Blip
    "AddBlip",
    "RemoveBlip",
    "ShowBlip",
    "HideBlip",

    -- Trigger
    "AddTrigger",
    "RemoveTrigger",
    "SwitchTrigger",
    "EnableTrigger",
    "DisableTrigger",
    "CurrentTrigger",

    -- Marker
    "AddMarker",
    "RemoveMarker",
    "EnableMarker",
    "DisableMarker",
    "SwitchMarker",
    "CurrentMarker",

    -- Areas
    "AddArea",
    "RemoveArea",
    "EnableArea",
    "DisableArea",
    "SwitchArea",

    -- Debug
    "SetDebug",
    "DebugPrint",

}

server_scripts {

    -- Utils
    "src/utils/utils.common.lua",
    "src/utils/utils.server.lua",

}

server_exports {

    -- Utils
    "TableLength",
    "TablePrint",
    "Round",
    "GetSteamIDFormSource",
    "GetIpFormSource",

}
