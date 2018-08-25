--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

--
-- Get all peds
--
function GetPeds()

  return GetEntities(FindFirstPed, FindNextPed, EndFindPed)

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
