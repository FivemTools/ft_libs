--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local triggers = {}
local activeTriggers = {}
local currentTrigger = nil

--
-- Add Trigger
--
function AddTrigger(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for name, value in pairs(args[1]) do
            triggers[name] = trigger.new(value)
            if value.enable == nil or value.enable == true then
                activeTriggers[name] = true
            end
            Citizen.Wait(10)
        end

    elseif count == 2 then

        local name = args[1]
        local value = args[2]
        triggers[name] = trigger.new(value)

        if value.enable == nil or value.enable == true then
            activeTriggers[name] = true
        end

    end

end

--
-- Remove Trigger
--
function RemoveTrigger(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then
        for _, name in ipairs(args[1]) do
            if triggers[name] ~= nil then
                triggers[name] = nil
                activeTriggers[name] = nil
            end
            Citizen.Wait(10)
        end
    elseif count == 1 then
        local name = args[1]
        if triggers[name] ~= nil then
            triggers[name] = nil
            activeTriggers[name] = nil
        end
    end

end

--
-- Switch Trigger
--
function SwitchTrigger(...)

    local args = {...}
    local count = #args
    if count == 1 and type(args[1]) == "table" then
        for name, status in pairs(args[1]) do
            if activeTriggers[name] then
                activeTriggers[name] = nil
            else
                activeMarkers[name] = true
            end
            Citizen.Wait(10)
        end
    elseif count == 1 then
        local name = args[1]
        local status = args[2]
        if activeTriggers[name] then
            activeTriggers[name] = nil
        else
            activeTriggers[name] = true
        end
    end

end

--
-- Enable Trigger
--
function EnableTrigger(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then
        for _, name in pairs(args[1]) do
            if triggers[name] ~= nil then
                activeTriggers[name] = true
            end
            Citizen.Wait(10)
        end
    elseif count == 1 then
        local name = args[1]
        if triggers[name] ~= nil then
            activeTriggers[name] = true
        end
    end

end

--
-- Disable Trigger
--
function DisableTrigger(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then
        for _, name in pairs(args[1]) do
            if activeTriggers[name] ~= nil then
                activeTriggers[name] = nil
            end
            Citizen.Wait(10)
        end
    elseif count == 1 then
        local name = args[1]
        if activeTriggers[name] ~= nil then
            activeTriggers[name] = nil
        end
    end

end

--
-- Current Trigger
--
function CurrentTrigger()

    return currentTrigger

end

--
-- Check
--
function TriggerFrame()

    Citizen.CreateThread(function()

        while true do
            local playerPed = GetPlayerPed(-1)
            local playerLocalisation = GetEntityCoords(playerPed)

            for name, value in pairs(activeTriggers) do

                local target = triggers[name]
                if target then
                    player_in = (GetDistanceBetweenCoords(target.x, target.y, target.z, playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, true) < (target.weight + 0.0) and math.abs(playerLocalisation.z - target.z) <= (target.height + 0.0))
                    if player_in and currentTrigger ~= name then
                        currentTrigger = name
                        target:Enter()
                    elseif player_in and currentTrigger == name then
                        target:Active()
                    elseif not player_in and currentTrigger == name then
                        currentTrigger = nil
                        target:Exit()
                    end
                end

            end

            Citizen.Wait(10)
        end

    end)

end
