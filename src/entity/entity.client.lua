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
-- Get entity in direction
--
function GetEntityInDirection(range)

    local playerPed = GetPlayerPed()
    local playerCoords = GetPlayerCoords()
    local entityWorld = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, range, 0.0)
    local rayHandle = CastRayPointToPoint(playerCoords.x, playerCoords.y, playerCoords.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, playerPed, 0)
    local a, b, c, d, entity = GetRaycastResult(rayHandle)
    if entity ~= nil then
        return entity
    end
    return false

end

--
-- Get entity in coords
--
function GetEntitiesInCoords(entities, data)

    local entitiesInArea = {}
    for _, id in pairs(entities) do

        local entitieCoords = GetEntityCoords(id)
        local distance = GetDistanceBetween3DCoords(entitieCoords.x, entitieCoords.y, entitieCoords.z, entitieCoords.x, entitieCoords.y, entitieCoords.z)
        if distance <= data.range then
            table.insert(entitiesInArea, id)
        end

    end

end
