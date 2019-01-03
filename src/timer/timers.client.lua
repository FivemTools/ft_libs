--
-- @Project: FiveM Tools
-- @Author: Samuelds, THEJean-Kevin
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

local ScreenCoords = {
    -- base coords
    ['baseX'] = 0.908,
    ['baseY'] = 0.936,

    -- title (left text) coords
    ['titleOffsetX'] = -0.035,
    ['titleOffsetY'] = -0.016,

    -- subTitle (left text) coords
    ['subTitleOffsetX'] = 0.035,
    ['subTitleOffsetY'] = -0.016,

    -- value (right text) coords
    ['valueOffsetX'] = 0.0786,
    ['valueOffsetY'] = -0.0185,

    -- progress bar coords
    ['pbarOffsetX'] = 0.047,
    ['pbarOffsetY'] = 0.0015,
}

local Sizes = {
    -- bar dimensions
    ['timerBarWidth'] = 0.185,
    ['timerBarHeight'] = 0.050,
    ['timerBarMargin'] = 0.005,

    -- progress bar dimensions
    ['pbarWidth'] = 0.0616,
    ['pbarHeight'] = 0.0105,
}

local Natives = {
    ['SET_TEXT_DROP_SHADOW'] = "0x1CA3E9EAC9D93E5E",
    ['SET_TEXT_OUTLINE'] = "0x2513DFB0FB8400FE",
}

local HUDComponents = {
    ['VehicleName'] = 6,
    ['AreaName'] = 7,
    ['VehicleClass'] = 8,
    ['StreetName'] = 9,
}

local timerBars = {}

--
--
--
function AddTimerBar(name, data)
    timerBars[name] = timerBar.new(data)
end

--
--
--
Citizen.CreateThread(function()

    if not HasStreamedTextureDictLoaded('timerbars') then
        RequestStreamedTextureDict('timerbars')
        while not HasStreamedTextureDictLoaded('timerbars') do
            Citizen.Wait(0)
        end
    end

    while true do

        local safeZone = GetSafeZoneSize()
        local safeZoneX = (1.0 - safeZone) * 0.5
        local safeZoneY = (1.0 - safeZone) * 0.5
        local total = #timerBars

        local x = ScreenCoords.baseX - safeZoneX
        local y = ScreenCoords.baseY - safeZoneY

        for key, timer in pairs(timerBars) do

            -- draw bg
            DrawSprite('timerbars', 'all_black_bg', x, y, Sizes.timerBarWidth, Sizes.timerBarHeight, 0.0, 255, 255, 255, 160)

            -- draw title
            Text({
                ['text'] = timer.title,
                ['x'] = x + ScreenCoords.titleOffsetX,
                ['y'] = y + ScreenCoords.titleOffsetY,
                ['font'] = 2,
                ['scale'] = 0.5,
                ['right'] = true,
                ['endWrap'] = x + ScreenCoords.titleOffsetX,
            })

            -- draw title
            Text({
                ['text'] = timer.subTitle,
                ['x'] = x + ScreenCoords.subTitleOffsetX,
                ['y'] = y + ScreenCoords.subTitleOffsetY,
                ['font'] = 2,
                ['scale'] = 0.5,
                ['right'] = true,
                ['startWrap'] = x + ScreenCoords.titleOffsetX,
                ['endWrap'] = 0.98,
            })

            y = y - Sizes.timerBarHeight - Sizes.timerBarMargin

        end

        Citizen.Wait(5)

    end

end)