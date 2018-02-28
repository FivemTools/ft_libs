--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

Markers = {}

function AddMarker(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do
      Citizen.Wait(1)
      Markers[name] = Marker(value)
    end

  elseif count == 2 then

    local name = args[1]
    local value = args[2]
    Markers[name] = Marker(value)

  else

    return false

  end

end

function RemoveMarker(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)
      if Markers[name] ~= nil then
        Markers[name] = nil
      end
    end

  elseif count == 1 then

    local name = args[1]
    if Markers[name] ~= nil then
      Markers[name] = nil
    end

  else

    return false

  end

end

function EnableMarker(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in pairs(args[1]) do
      Citizen.Wait(1)
      if Markers[name] ~= nil then
        Markers[name].enable = true
      end
    end

  elseif count == 1 then

    local name = args[1]
    if Markers[name] ~= nil then
      Markers[name].enable = true
    end

  else

    return false

  end

end

function DisableMarker(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in pairs(args[1]) do
      Citizen.Wait(1)
      if Markers[name] ~= nil then
        Markers[name].enable = false
      end
    end

  elseif count == 1 then

    local name = args[1]
    if Markers[name] ~= nil then
      Markers[name].enable = false
    end

  else

    return false

  end

end

function SwitchMarker(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, status in pairs(args[1]) do
      Citizen.Wait(1)
      if Markers[name] ~= nil then
        Markers[name].enable = status
      end
    end

  elseif count == 2 then

    local name = args[1]
    local status = args[2]
    if Markers[name] ~= nil then
      Markers[name].enable = status
    end

  else

    return false

  end

end

function CurrentMarker()
  return Markers.current
end

-- Check
AddRunInFrame(function()

  local playerPed = GetPlayerPed(-1)
  local playerLocalisation = GetEntityCoords(playerPed)

  for name, marker in pairs(Markers) do
    if GetDistanceBetweenCoords(marker.x, marker.y, marker.z, playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, true) <= marker.showDistance and marker.enable then
      marker.Show()
    end
  end

end)
