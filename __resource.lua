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
  "Text",
  "OpenTextInput",
  "TextNotification",

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
