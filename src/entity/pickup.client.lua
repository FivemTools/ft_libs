--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

--
-- Get all pickups
--
function GetPickups()

  return GetEntities(FindFirstPickup, FindNextPickup, EndFindPickup)

end

--
-- Get pickups in area
--
function GetPickupsInArea(data)

    local pickups = GetPickups()
    local pickupsInArea = GetEntitiesInArea(pickups, data)
    return pickupsInArea

end

--
-- Get pickups in around
--
function GetObjectsInAround(range)

    local pickups = GetPickups()
    local playerCoords = GetPlayerCoords()
    local data = {
        x = playerCoords.x,
        y = playerCoords.y,
        z = playerCoords.z,
        range = range,
    }
    local pickupsInAround = GetEntitiesInArea(pickups, data)
    return pickupsInAround

end
