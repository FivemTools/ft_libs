--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_players
--

local resourceName = GetCurrentResourceName()
local version = LoadResourceFile(resourceName, "VERSION")
PerformHttpRequest('https://raw.githubusercontent.com/FivemTools/' .. resourceName .. '/master/VERSION', function(err, text, headers)
    if text and text ~= version then
        print('[' .. resourceName .. '] new version (' .. text .. ') is available : https://github.com/FivemTools/' .. resourceName .. '/releases')
    end
end, 'GET', '')