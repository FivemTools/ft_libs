--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local Blips = {}

function AddBlip(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do
      Citizen.Wait(1)
      Blips[name] = Blip(value)

      if Blips[name].enable then
        Blips[name].Show()
      end
    end

  elseif count == 2 then

    local name = args[1]
    local value = args[2]
    Blips[name] = Blip(value)

    if Blips[name].enable then
      Blips[name].Show()
    end

  else

    return false

  end

end

function RemoveBlip(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)
      Blips[name] = nil
    end

  elseif count == 1 then

    local name = args[1]
    Blips[name] = nil

  else

    return false

  end

end

function ShowBlip(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)
      if Blips[name] ~= nil then
        Blips[name].Show()
      end
    end

  elseif count == 2 then

    local name = args[1]
    if Blips[name] ~= nil then
      Blips[name].Show()
    end

  else

    return false

  end

end

function HideBlip(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)
      if Blips[name] ~= nil then
        Blips[name].Hide()
      end
    end

  elseif count == 2 then

    local name = args[1]
    if Blips[name] ~= nil then
      Blips[name].Hide()
    end

  else

    return false

  end

end
