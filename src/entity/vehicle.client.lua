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
-- Get vehicules in coords
--
function GetVehiclesInCoords(data)

    local vehicules = GetVehicles()
    local vehiculesInCoords = GetEntitiesInCoords(vehicles, data)
    return vehiculesInCoords

end
