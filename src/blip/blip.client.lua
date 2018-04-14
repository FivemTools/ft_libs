--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

--
blip = {}

-- class table
local Blip = {}

--
-- Show Blip
--
function Blip:Show()

    self.blip = AddBlipForCoord(self.x, self.y, self.z)
    SetBlipSprite(self.blip, self.imageId)
    SetBlipAsShortRange(self.blip, self.shortRange)
    SetBlipColour(self.blip, self.colorId)
    SetBlipScale(self.blip, self.scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(self.text)
    EndTextCommandSetBlipName(self.blip)
    if self.rotation then SetBlipRotation(self.blip, self.rotation) end

end

--
-- Hide Blip
--
function Blip:Hide()

    if self.blip ~= nil then
        -- Use native REMOVE_BLIP
        Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(self.blip))
    end

end

--
-- Create new instace of Marker
--
function blip.new(data)

    assert(type(data.x) == "number", "Blip : x must be number")
    assert(type(data.y) == "number", "Blip : y must be number")
    assert(type(data.text) == "text", "Blip : text must be text")

    local self = {}
    self.blip = nil
    self.x = data.x
    self.y = data.y
    self.text = data.text
    self.imageId = data.imageId or 1
    self.colorId = data.colorId or 0
    self.scale = data.scale or 1.0
    self.shortRange = true
    self.enable = true
    if data.shortRange then self.shortRange = data.shortRange end
    if data.enable then self.enable = data.enable end

    setmetatable(self, { __index = Blip })
    return self

end
