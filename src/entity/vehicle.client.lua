--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

--
-- Get all vehicles
--
function GetVehicles()

  return GetEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)

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
-- Get vehicules in area
--
function GetVehiclesInArea(data)

    local vehicules = GetVehicles()
    local vehiculesInArea = GetEntitiesInArea(vehicles, data)
    return vehiculesInArea

end

--
-- Get vehicules in around
--
function GetVehiculessInAround(range)

    local pickups = GetVehicles()
    local playerCoords = GetPlayerCoords()
    local data = {
        x = playerCoords.x,
        y = playerCoords.y,
        z = playerCoords.z,
        range = range,
    }
    local vehiculesInAround = GetEntitiesInArea(vehicules, data)
    return vehiculesInAround

end
