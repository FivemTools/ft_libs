--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

-- Show on terminal
RegisterServerEvent("ft_libs:PrintTable")
AddEventHandler('ft_libs:PrintTable', function(value)

  print("---------[ft_libs : Debug]---------")
  TablePrint(value)
  print("-------------------------")

end)
