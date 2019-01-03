--
-- @Project: FiveM Tools
-- @Author: Samuelds, THEJean-Kevin
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--


-- Class
timerBar = {}
local TimerBar = {}

--
--
--
function TimerBar:GetProgress()
    return self._pbarValue
end

--
--
--
function TimerBar:SetProgress(value)

    if value <= 0.0 then
        self._pbarValue = 0.0
    elseif value >= 1.0 then
        self._pbarValue = 1.0
    else
        self._pbarValue = value
    end

end

--
--
--
function TimerBar:GetVisible()
    return self._visible
end

--
--
--
function TimerBar:SetVisible(value)
    self._visible = value
end

--
--
--
timerBar.new = function (data)

    local self = data
    setmetatable(self, { __index = TimerBar })
    return self

end