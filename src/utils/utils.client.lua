--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

--
-- Get entity
--
function GetEntityInDirection(range)

  local playerPed = GetPlayerPed(-1)
  local playerPos = GetEntityCoords(playerPed)
  local entityWorld = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, range, 0.0)
  local rayHandle = CastRayPointToPoint(playerPos.x, playerPos.y, playerPos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, playerPed, 0)
  local a, b, c, d, entity = GetRaycastResult(rayHandle)
  if entity ~= nil then
      return entity
  end
  return false

end

--
-- PrintTable event
--
RegisterNetEvent("ft_libs:PrintTable")
AddEventHandler('ft_libs:PrintTable', function(value)

    print("---------[ft_libs : Debug]---------")
    TablePrint(value)
    print("-------------------------")

end)

--
-- Debug mod
--
RegisterNetEvent("ft_libs:DebugMode")
AddEventHandler('ft_libs:DebugMode', function(status)

    debugMode = status
    if debugMode == true then
        Citizen.Trace("[FT_LIBS] DEBUG MODE ENABLE")
    else
        Citizen.Trace("[FT_LIBS] DEBUG MODE DISABLE")
    end

end)
