--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

--
area = {}

-- class table
local AreaClass = {}

--
-- Enable Area
--
function AreaClass:Enable()

    EnableMarker(self.name, true)
    SwitchTrigger(self.name, true)
    ShowBlip(self.name)

end

--
-- Disable Area
--
function Area:Disable()

    EnableMarker(self.name, false)
    SwitchTrigger(self.name, false)
    HideBlip(self.name)

end

--
-- Remove Area
--
function Area:Remove()

    RemoveMarker(self.name)
    RemoveTrigger(self.name)
    RemoveBlip(self.name)

end

--
-- Create new instace of Area
--
function area.new(name, data)

    assert(type(data.name) == "string", "Area : name must be text")

    local self = data
    if data.enable ~= nil then
        self.enable = data.enable
    else
        self.enable = true
    end

    -- Trigger
    if data.trigger ~= nil then
        local triggerData = data.trigger
        areaData.enable = self.enable
        areaData.x = data.x
        areaData.y = data.y
        areaData.z = data.z
        self.area = AddTrigger(self.name, areaData)
    end

    -- Blip
    if data.blip ~= nil then
        local blipData = data.blip
        blipData.enable = self.enable
        blipData.x = data.x
        blipData.y = data.y
        blipData.z = data.z
        self.blip = AddBlip(self.name, blipData)
    end

    -- Marker
    if data.marker ~= nil then
        local markerData = data.marker
        markerData.enable = self.enable
        markerData.x = data.x
        markerData.y = data.y
        markerData.z = data.z
        self.marker = AddMarker(self.name, markerData)
    end

    setmetatable(self, { __index = Area })
    return self

end
