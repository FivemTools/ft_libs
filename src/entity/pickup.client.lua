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
