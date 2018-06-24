--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

--
-- Get SeamID
--
function GetSteamIDFormSource(source)

    assert(type(source) == "number", "source must be number")

    local steamID = GetPlayerIdentifiers(source)
    if steamID[1] ~= nil  then
        return steamID[1]
    end
	return false

end

--
-- Get IP
--
function GetIpFormSource(source)

    assert(type(source) == "number", "source must be number")

    local ip = GetPlayerEP(source)
    if ip ~= nil  then
        return ip
    end
	return false

end

--
-- PrintTable event
--
RegisterServerEvent("ft_libs:PrintTable")
AddEventHandler('ft_libs:PrintTable', function(value)

    print("---------[ft_libs : Debug]---------")
    TablePrint(value)
    print("-------------------------")

end)

--
--
--
AddEventHandler('onServerResourceStart', function(resource)

    if resource == 'ft_libs' then
        debugMode = GetConvar("ft_debug", "false")
    end

end)

--
--
--
RegisterServerEvent("ft_libs:OnClientReady")
AddEventHandler('ft_libs:OnClientReady', function()

	TriggerClientEvent("ft_libs:DebugMode", source, debugMode)

end)

