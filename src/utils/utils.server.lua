--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

--
-- Print table
--
function TablePrint(table, indent)

  if type(table) == "table" then
    if not indent then indent = 0 end
    for k, v in pairs(table) do
      formatting = string.rep("  ", indent) .. k .. ": "
      if type(v) == "table" then
        print(formatting)
        TablePrint(v, indent + 1)
      elseif type(v) == "boolean" then
        if v then
          print(formatting .. "true")
        else
          print(formatting .. "false")
        end
      elseif type(v) == "nil" then
        print(formatting .. "nil")
      elseif type(v) == "function" then
        print(formatting .. "function")
      else
        print(formatting .. tostring(v) .. " (" .. type(v) .. ")")
      end
    end
  elseif type(table) == "boolean" then
    if table then
      print("true")
    else
      print("false")
    end
  elseif type(table) == "nil" then
    print("nil")
  elseif type(table) == "function" then
    print("function")
  else
    print(tostring(table)  .. " (" .. type(table) .. ")")
  end

end

--
-- Get SeamID
--
local function GetSteamIDFormSource(source)

    local player = GetPlayerIdentifiers(source)
    if player[1] ~= nil  then
        return player[1]
    end
	return false

end

--
-- Get IP
--
local function GetIpFormSource(source)

    local player = GetPlayerEP(source)
    if player[3] ~= nil  then
        return player[3]
    end
	return false

end
