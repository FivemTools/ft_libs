--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local runInFrameList = {}

-- Add
function AddRunInFrame(callback)

  table.insert(runInFrameList, callback)

end

-- Run all function to exectToFrameList
function RunToFrames()

  while true do
    Citizen.Wait(1)

    -- Run all functions
    for _, callback in pairs(runInFrameList) do
      callback()
    end

  end

end

-- Client is 100% loaded games
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)

    if NetworkIsSessionStarted() then

      RunToFrames()
      break

    end

  end
end)
