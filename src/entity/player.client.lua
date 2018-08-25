--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

local playerPed = nil
local playerCoords = {}

--
-- Update ped and coords for player
--
function UpdatePlayerThread()
  Citizen.CreateThread(function()

      while true do

        playerPed = Citizen.InvokeNative(0x43A66C31C68491C0, -1) -- Use native GET_PLAYER_PED
        playerCoords = GetEntityCoords(playerPed)
        Citizen.Wait(500)

      end

  end)
end

--
--
--
function GetPlayerPed()

    return playerPed

end

--
--
--
function GetPlayerCoords()

    return playerCoords

end

--
-- Get player in direction
--
function GetPlayerPedInDirection(range)

    if type(range) ~= "number" then
        range = 15.50
    end
    local entity = GetPedInDirection(range)
    if DoesEntityExist(entity) then
        local target = NetworkGetPlayerIndexFromPed(entity)
        local id = GetPlayerServerId(target)
        if id ~= nil then
            return entity
        end
    end
    return false

end

--
-- Get player ped server id in direction
--
function GetPlayerServerIdInDirection(range)

    if type(range) ~= "number" then
        range = 15.50
    end
    local entity = GetPedInDirection(range)
    if DoesEntityExist(entity) then
        local entity = NetworkGetPlayerIndexFromPed(entity)
        local id = GetPlayerServerId(entity)
        if id ~= nil then
            return id
        end
    end
    return false

end
