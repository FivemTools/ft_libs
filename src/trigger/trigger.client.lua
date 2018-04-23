--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

--
trigger = {}

-- class table
local Trigger = {}

--
-- Enter
--
function Trigger:Enter()

    Citizen.CreateThread(function()

        if self.enter.callback ~= nil then
            Citizen.Trace("Enter : callback Oui")
            local callback = self.enter.callback
            callback(self.data)
        end

        if self.enter.eventClient ~= nil then
            Citizen.Trace("Enter : eventClient Oui")
            TriggerEvent(self.enter.eventClient, self.data)
        end

        if self.enter.eventServer ~= nil then
            Citizen.Trace("Enter : eventServer Oui")
            TriggerServerEvent(self.enter.eventServer, self.data)
        end

    end)
end

--
--
--
function Trigger:Active()
    Citizen.CreateThread(function()

        if self.active.callback ~= nil then
            Citizen.Trace("Active : callback Oui")
            local callback = self.active.callback
            callback(self.data)
        end

        if self.active.eventClient ~= nil then
            Citizen.Trace("Active : eventClient Oui")
            TriggerEvent(self.active.eventClient, self.data)
        end

        if self.active.eventServer ~= nil then
            Citizen.Trace("Active : eventServer Oui")
            TriggerServerEvent(self.active.eventServer, self.data)
        end

    end)
end

--
--
--
function Trigger:Exit()
    Citizen.CreateThread(function()

        if self.exit.callback ~= nil then
            Citizen.Trace("Exit : callback Oui")
            local callback = self.exit.callback
            callback(self.data)
        end

        if self.exit.eventClient ~= nil then
            Citizen.Trace("Exit : eventClient Oui")
            TriggerEvent(self.exit.eventClient, self.data)
        end

        if self.exit.eventServer ~= nil then
            Citizen.Trace("Exit : eventServer Oui")
            TriggerServerEvent(self.exit.eventServer, self.data)
        end

    end)
end

--
--
--
function trigger.new(data)

    assert(type(data.x) == "number", "Trigger : x must be number")
    assert(type(data.y) == "number", "Trigger : y must be number")
    assert(type(data.z) == "number", "Trigger : z must be number")

    local self = data
    self.weight = data.weight or 2.0
    self.height = data.height or 2.0
    self.enter = data.enter or {}
    self.exit = data.exit or {}
    self.active = data.active or {}
    self.data = data.data or {}

    setmetatable(self, { __index = Trigger })
    return self

end
