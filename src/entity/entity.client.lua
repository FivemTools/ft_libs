--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

--
-- Get all entities
--
local function GetEntities(findFirst, findNext, endFind)

    local entities = {}

    local iter, id = findFirst()
    table.insert(entities, id)

    while true do

        local iter, id = findNext(iter)
        table.insert(entities, id)
        if endFind(iter) == false or id == 0 or not id then
            break
        end
        Citizen.Wait(10)

    end

    return entities

end

--
-- Get all object
--
function GetObjects()

  return GetEntities(FindFirstObject, FindNextObject, EndFindObject)

end

--
-- Get all peds
--
function GetPeds()

  return GetEntities(FindFirstPed, FindNextPed, EndFindPed)

end

--
-- Get all vehicles
--
function GetVehicles()

  return GetEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)

end

--
-- Get all pickups
--
function GetPickups()

  return GetEntities(FindFirstPickup, FindNextPickup, EndFindPickup)

end

--
-- Get entity in direction
--
function GetEntityInDirection(range)

  local entityWorld = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, range, 0.0)
  local rayHandle = CastRayPointToPoint(playerPos.x, playerPos.y, playerPos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, playerPed, 0)
  local a, b, c, d, entity = GetRaycastResult(rayHandle)
  if entity ~= nil then
      return entity
  end
  return false

end

--
-- Get ped in direction
--
function GetPedInDirection(range)

    if type(range) ~= "number" then
        range = 15.50
    end
    local entity = GetEntityInDirection(range)
    if DoesEntityExist(entity) then
        if GetEntityType(entity) == 1 then
            return entity
        end
    end
    return false

end

--
-- Get player in direction
--
function GetPlayerPedInDirection(range)

    if type(range) ~= "number" then
        range = 15.50
    end
    local entity = GetPedInDirection(range)
    if DoesEntityExist(entity) then
        local target = NetworkGetPlayerIndexFromPed(entity)
        local id = GetPlayerServerId(target)
        if id ~= nil then
            return entity
        end
    end
    return false

end

--
-- Get player ped server id in direction
--
function GetPlayerPedServerIdInDirection(range)

    if type(range) ~= "number" then
        range = 15.50
    end
    local entity = GetPedInDirection(range)
    if DoesEntityExist(entity) then
        local entity = NetworkGetPlayerIndexFromPed(entity)
        local id = GetPlayerServerId(entity)
        if id ~= nil then
            return id
        end
    end
    return false

end

--
-- Get vehicule in direction
--
function GetVehicleInDirection(range)

    if type(range) ~= "number" then
        range = 15.50
    end
    local entity = GetEntityInDirection(range)
    if DoesEntityExist(entity) then
        if GetEntityType(entity) == 2 then
            return entity
        end
    end
    return false

end

--
-- Get object in direction
--
function GetObjectInDirection(range)

    if type(range) ~= "number" then
        range = 15.50
    end
    local entity = GetEntityInDirection(range)
    if DoesEntityExist(entity) then
        if GetEntityType(entity) == 3 then
            return entity
        end
    end
    return false

end
