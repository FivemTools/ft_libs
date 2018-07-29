--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
-- @Source: https://github.com/FivemTools/ft_libs
--

local triggers = {}
local activeTriggers = {}
local currentTriggers = {}


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
            activeTriggers[name] = nil
            currentTriggers[name] = nil
            Citizen.Wait(10)
        end

    elseif count == 1 then

        local name = args[1]
        activeTriggers[name] = nil
        currentTriggers[name] = nil

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
            if triggers[name] ~= nil then
                if status == true then
                    EnableTrigger(name)
                elseif status == false then
                    DisableTrigger(name)
                end
            end
            Citizen.Wait(10)
        end

    elseif count == 2 then

        local name = args[1]
        local status = args[2]
        if triggers[name] ~= nil then
            if status == true then
                EnableTrigger(name)
            else
                DisableTrigger(name)
            end
        end

    end

end

--
-- Add Trigger
--
function AddTrigger(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for name, value in pairs(args[1]) do
            if triggers[name] == nil then
                triggers[name] = trigger.new(value)
                if value.enable == nil or value.enable == true then
                    EnableTrigger(name)
                end
            end
            Citizen.Wait(10)
        end

    elseif count == 2 then

        local name = args[1]
        local value = args[2]
        if triggers[name] == nil then
            triggers[name] = trigger.new(value)

            if value.enable == nil or value.enable == true then
                EnableTrigger(name)
            end
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
                DisableTrigger(name)
                triggers[name] = nil
            end
            Citizen.Wait(10)
        end

    elseif count == 1 then

        local name = args[1]
        if triggers[name] ~= nil then
            DisableTrigger(name)
            triggers[name] = nil
        end

    end

end


--
-- Set areas value
--
function SetTriggerValue(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for name, values in pairs(args[1]) do
            if triggers[name] ~= nil then
                local trigger = triggers[name]
                for key, value in pairs(values) do
                    trigger[key] = value
                end
            end
            Citizen.Wait(1)
        end

    elseif count == 2 then

        local name = args[1]
        local values = args[2]
        if triggers[name] ~= nil then
            local trigger = triggers[name]
            for key, value in pairs(values) do
                trigger[key] = value
            end
        end

    else

        return false

    end

end

--
-- Current Trigger
--
function CurrentTrigger()

    return currentTriggers

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
                if target ~= nil then
                    player_in = (GetDistanceBetweenCoords(target.x, target.y, target.z, playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, true) < (target.weight + 0.0) and math.abs(playerLocalisation.z - target.z) <= (target.height + 0.0))
                    if player_in and currentTriggers[name] == nil then
                        currentTriggers[name] = true
                        target:Enter()
                    elseif player_in and currentTriggers[name] ~= nil then
                        target:Active()
                    elseif not player_in and currentTriggers[name] ~= nil then
                        currentTriggers[name] = nil
                        target:Exit()
                    end
                end

            end

            Citizen.Wait(5)
        end

    end)

end
