--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

--
-- Client is 100% loaded games
--
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if NetworkIsSessionStarted() then

            -- Send event to client & server
            TriggerServerEvent('ft_libs:OnClientReady')
            TriggerEvent('ft_libs:OnClientReady')

            -- Start frames
            TriggerFrame()
            MenuFrame()
            MarkerFrame()
            InstructionalButtonsFrame()
            break

        end

    end
end)
