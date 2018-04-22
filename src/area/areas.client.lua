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

      Areas[name] = {}

      for key, location in pairs(value.locations) do
        Citizen.Wait(1)
        value.x = location.x
        value.y = location.y
        value.z = location.z
        Areas[name][key] = area.new(name .. "_" .. key, value)
      end

    end

  elseif count == 2 then

    local name = args[1]
    local value = args[2]
    Areas[name] = {}

    for key, location in pairs(value.locations) do
      Citizen.Wait(1)
      value.x = location.x
      value.y = location.y
      value.z = location.z
      Areas[name][key] = area.new(name .. "_" .. key, value)
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

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)

      if Areas[name] ~= nil then

        for _, area in pairs(Areas[name]) do
          area:Disable()
          area:Remove()
        end

        Areas[name] = nil
      end

    end

  elseif count == 1 then

    local name = args[1]

    if Areas[name] ~= nil then

      for _, area in pairs(Areas[name]) do
        area:Disable()
        area:Remove()
      end

      Areas[name] = nil

    end

  else

    return false

  end

end

function EnableArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)

      if Areas[name] ~= nil then
        for _, area in pairs(Areas[name]) do
          area:Enable()
          area.enable = true
        end
      end

    end

  elseif count == 1 then

    local name = args[1]
    if Areas[name] ~= nil then
      for _, area in pairs(Areas[name]) do
        area:Enable()
        area.enable = true
      end
    end

  else

    return false

  end

end

function DisableArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)

      if Areas[name] ~= nil then
        for _, area in pairs(Areas[name]) do
          area:Disable()
          area.enable = false
        end
      end

    end

  elseif count == 2 then

    local name = args[1]
    if Areas[name] ~= nil then
      for _, area in pairs(Areas[name]) do
        area:Disable()
        area.enable = false
      end
    end

  else

    return false

  end

end

function SwitchArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, status in ipairs(args[1]) do
      Citizen.Wait(1)

      if Areas[name] ~= nil then
        for _, area in pairs(Areas[name]) do
          if status == false then
            area:Disable()
            area.enable = false
          elseif status == true then
            area:Enable()
            area.enable = true
          end
        end
      end

    end

  elseif count == 2 then

    local name = args[1]
    if Areas[name] ~= nil then
      for _, area in pairs(Areas[name]) do
        area:Disable()
        area.enable = false
      end
    end

  else

    return false

  end

end
