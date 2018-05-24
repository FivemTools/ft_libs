--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

--
-- Get entity
--
function GetEntityDirection(range)

  local playerPed = GetPlayerPed(-1)
  local pos = GetEntityCoords(playerPed)

  local entityWorld = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, range, 0.0)
  local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, playerPed, 0)
  local a, b, c, d, entity = GetRaycastResult(rayHandle)

  return entity

end
