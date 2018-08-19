--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

--
--
--
local function EnumerateEntities(findFirst, findNext, endFind)

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
--
--
function EnumerateObjects()

  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)

end

--
--
--
function EnumeratePeds()

  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)

end

--
--
--
function EnumerateVehicles()

  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)

end

--
--
--
function EnumeratePickups()

  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)

end
