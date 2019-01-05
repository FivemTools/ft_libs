--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

-- Scren resolution
local screenW, screenH = 0.0

--
--
--
function RefeshScreenResolution()
    screenW, screenH = GetScreenResolution()
end

--
--
--
function GetScreenResolution()
    return screenW, screenH
end

-- SafeZone
local safeZone = 0.0

--
--
--
function RefeshSafeZone()
    safeZone = GetScreenResolution()
end

--
--
--
function GetSafeZone()
    return safeZone
end

-- Screen Resolution Maintain Ratio
local width, ratio = 0.0
local height = 1080.0

--
--
--
function RefeshScreenResolutionMaintainRatio()
    ratio = (screenW / screenH) + 0.0
    width = height * ratio;
end

--
--
--
function GetScreenResolutionMaintainRatio()
    return width, height
end

-- Safe Zone Bounds
local hmp = 5.4

--
--
--
function RefeshSafeZoneBounds()

    local wmp = ratio * hmp
    local safeSize  = tonumber(string.format("%." .. 2 .. "f", safeZone))
    safeSize = (safeSize * 100) - 90
    safeSize = 10 - safeSize

    width = tonumber(string.format("%." .. 0 .. "f", safe * wmp))
    height = tonumber(string.format("%." .. 0 .. "f", safe * hmp))

end

--
--
--
function GetSafeZoneBounds()

    safeZone = GetSafeZoneSize()

end

