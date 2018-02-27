--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

Areas = {}

function AddArea(...)

  local args = {...}
  local count = #args
  local array = {}

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do

      Areas[name] = #value.locations

      for key, location in pairs(value.locations) do
        Citizen.Wait(1)
        value.x = location.x
        value.y = location.y
        value.z = location.z
        Area(name .. "_" .. key, value)
      end

    end

  elseif count == 2 then

    local name = args[1]
    local value = args[2]
    Areas[name] = #value.locations

    for key, location in pairs(value.locations) do
      Citizen.Wait(1)
      value.x = location.x
      value.y = location.y
      value.z = location.z
      Area(name .. "_" .. key, value)
    end

  else

    return false

  end

end

function RemoveArea(...)

  local args = {...}
  local count = #args
  local array = {}

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do

      Areas[name] = #value.locations

      for key, location in pairs(value.locations) do
        Areas[name .. "_" .. key].Remove()
      end

      Areas[name] = nil

    end

  elseif count == 2 then

    local name = args[1]
    local value = args[2]
    Areas[name] = #value.locations

    for key, location in pairs(value.locations) do
      Areas[name .. "_" .. key].Remove()
    end

    Areas[name] = nil

  else

    return false

  end

end

function EnableArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do
      if Areas[name] ~= nil then
        Areas[name].Enable()
        Area[name].enable = true
      end
    end

  elseif count == 2 then

    local name = args[1]
    local status = args[2]
    if Areas[name] ~= nil then
      Areas[name].Enable()
      Area[name].enable = true
    end

  else

    return false

  end

end

function DisableArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do
      if Areas[name] ~= nil then
        Areas[name].Disable()
        Area[name].enable = false
      end
    end

  elseif count == 2 then

    local name = args[1]
    local status = args[2]
    if Areas[name] ~= nil then
      Areas[name].Disable()
      Area[name].enable = false
    end

  else

    return false

  end

end

function SwitchArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, status in pairs(args[1]) do
      Citizen.Wait(1)
      if Area[name] ~= nil then
        if status == false then
          Areas[name].Disable()
        elseif status ==  true then
          Areas[name].Enable()
        end
        Area[name].enable = status
      end
    end

  elseif count == 2 then

    local name = args[1]
    local status = args[2]
    if Area[name] ~= nil then
      if status == false then
        Areas[name].Disable()
      elseif status ==  true then
        Areas[name].Enable()
      end
      Area[name].enable = status
    end

  else

    return false

  end

end
