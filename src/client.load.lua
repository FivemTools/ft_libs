--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

-- Client is 100% loaded games
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)

    if NetworkIsSessionStarted() then

      -- Send event to client & server
      TriggerServerEvent('ft_libs:OnClientReady')
      TriggerEvent('ft_libs:OnClientReady')

      -- Start frames
      RunToFrames()
      break

    end

  end
end)
