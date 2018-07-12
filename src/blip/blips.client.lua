--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local blips = {}

--
--
--
function ShowBlip(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then
        for _, name in ipairs(args[1]) do
            Citizen.Wait(1)
            if blips[name] ~= nil then
                blips[name]:Show()
                blips[name].enable = true
            end
        end
    elseif count == 1 then
        local name = args[1]
        if blips[name] ~= nil then
            blips[name]:Show()
            blips[name].enable = true
        end
    end

end

--
--
--
function HideBlip(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then
        for _, name in ipairs(args[1]) do
            Citizen.Wait(1)
            if blips[name] ~= nil then
                blips[name]:Hide()
                blips[name].enable = false
                blips[name].blip = nil
            end
        end
    elseif count == 1 then
        local name = args[1]
        if blips[name] ~= nil then
            blips[name]:Hide()
            blips[name].enable = false
            blips[name].blip = nil
        end
    end

end

--
--
--
function AddBlip(...)

    local args = {...}
    local count = #args

    if count == 1 then
        assert(type(args[1]) == "table", "Data is not table")
        for name, value in pairs(args[1]) do
            blips[name] = blip.new(value)
            if blips[name].enable then
                ShowBlip(name)
            end
            Citizen.Wait(10)
        end
    elseif count == 2 then
        local name = args[1]
        local value = args[2]
        blips[name] = blip.new(value)
        if blips[name].enable then
            ShowBlip(name)
        end
    end

end

--
--
--
function RemoveBlip(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then
        for _, name in ipairs(args[1]) do
            Citizen.Wait(1)
            if blips[name] then
                HideBlip(name)
                blips[name] = nil
            end
        end
    elseif count == 1 then
        local name = args[1]
        if blips[name] then
            HideBlip(name)
            blips[name] = nil
        end
    end

end
