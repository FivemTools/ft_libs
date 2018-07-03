--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local areas = {}

--
--
--
function AddArea(...)

  local args = {...}
  local count = #args
  local array = {}

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do

      areas[name] = {}

      for key, location in pairs(value.locations) do
        Citizen.Wait(1)
        value.x = location.x
        value.y = location.y
        value.z = location.z
        areas[name][key] = area.new(name .. "_" .. key, value)
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
      areas[name][key] = area.new(name .. "_" .. key, value)
    end

  end

end

function RemoveArea(...)

  local args = {...}
  local count = #args
  local array = {}

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)

      if areas[name] ~= nil then

        for _, area in pairs(areas[name]) do
          area:Disable()
          area:Remove()
        end

        areas[name] = nil
      end

    end

  elseif count == 1 then

    local name = args[1]

    if areas[name] ~= nil then

      for _, area in pairs(areas[name]) do
        area:Disable()
        area:Remove()
      end

      areas[name] = nil

    end

  end

end

function EnableArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)

      if areas[name] ~= nil then
        for _, area in pairs(areas[name]) do
          area:Enable()
          area.enable = true
        end
      end

    end

  elseif count == 1 then

    local name = args[1]
    if areas[name] ~= nil then
      for _, area in pairs(areas[name]) do
        area:Enable()
        area.enable = true
      end
    end

  end

end

function DisableArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)

      if areas[name] ~= nil then
        for _, area in pairs(areas[name]) do
          area:Disable()
          area.enable = false
        end
      end

    end

  elseif count == 2 then

    local name = args[1]
    if areas[name] ~= nil then
      for _, area in pairs(areas[name]) do
        area:Disable()
        area.enable = false
      end
    end

  end

end

function SwitchArea(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, status in ipairs(args[1]) do
      Citizen.Wait(1)

      if areas[name] ~= nil then
        for _, area in pairs(areas[name]) do
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
    if areas[name] ~= nil then
      for _, area in pairs(areas[name]) do
        area:Disable()        
        area.enable = false
      end
    end

  end

end
