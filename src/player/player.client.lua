--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

playerPed = nil
playerCoords = {}

--
--
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
