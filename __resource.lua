--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

dependencies {}

client_scripts {

  -- Ui
  "src/ui/ui.client.lua",

  -- Run function in frame
  "src/frame.client.lua",

}

exports {

  -- Ui
  "HelpPromt",
  "LoadingPromt",
  "Message",
  "Notification",
  "Text",

}

server_scripts {}

server_exports {}
