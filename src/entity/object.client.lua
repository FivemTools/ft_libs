--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

--
-- Get all object
--
function GetObjects()

  return GetEntities(FindFirstObject, FindNextObject, EndFindObject)

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
