--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

dependencies {}

client_scripts {

  -- Utils
  "src/utils/utils.common.lua",
  "src/utils/utils.client.lua",

  -- Ui
  "src/ui/ui.client.lua",

  -- Frames
  "src/frame.client.lua",

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

  -- Event 100% load
  "src/client.load.lua",

}

exports {

  -- Utils
  "TableLength",
  "Round",
  "CommaValue",
  "GetEntityDirection",

  -- Ui
  "HelpPromt",
  "LoadingPromt",
  "Message",
  "Notification",
  "AdvancedNotification",
  "Text",
  "OpenTextInput",
  "TextNotification",

  -- Menu
  "AddMenu",
  "RemoveMenu",
  "MenuIsOpen",
  "CurrentMenu",
  "PrimaryMenu",
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
  "AddAreas",
  "RemoveAreas",
  "EnableAreas",
  "DisableAreas",
  "SwitchAreas",

}

server_scripts {

  -- Utils
  "src/utils/utils.common.lua",
  "src/utils/utils.server.lua",

  -- Debug
  "src/debug/debug.server.lua",

}

server_exports {

  -- Utils
  "TablePrint",
  "Round",

}
