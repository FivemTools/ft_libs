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
