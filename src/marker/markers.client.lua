--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

Markers = {}
ActiveMarkers = {}

function AddMarker(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do
      Citizen.Wait(1)
      Markers[name] = Marker(value)
      if value.enable ~= nil or value.enable == true then
        ActiveMarkers[name] = Markers[name]
      end
    end

  elseif count == 2 then

    local name = args[1]
    local value = args[2]
    Markers[name] = Marker(value)
    if value.enable ~= nil or value.enable == true then
      ActiveMarkers[name] = Markers[name]
    end

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
        ActiveMarkers[name] = Markers[name]
      end
    end

  elseif count == 1 then

    local name = args[1]
    if Markers[name] ~= nil then
      ActiveMarkers[name] = Markers[name]
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
      if ActiveMarkers[name] ~= nil then
        ActiveMarkers[name] = nil
      end
    end

  elseif count == 1 then

    local name = args[1]
    if ActiveMarkers[name] ~= nil then
      Markers[name] = nil
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
      if ActiveMarkers[name] ~= nil then
        ActiveMarkers[name] = nil
      else
        ActiveMarkers[name] = Markers[name]
      end
    end

  elseif count == 2 then

    local name = args[1]
    local status = args[2]
    if ActiveMarkers[name] ~= nil then
      ActiveMarkers[name] = nil
    else
      ActiveMarkers[name] = Markers[name]
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

  for name, marker in pairs(ActiveMarkers) do
    if GetDistanceBetweenCoords(marker.x, marker.y, marker.z, playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, true) <= marker.showDistance then
      marker.Show()
    end
  end

end)
