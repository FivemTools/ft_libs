--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

function Blip(data)

  local self = {}
  self.blip = nil
  self.x = data.x or 0
  self.y = data.y or 0
  self.z = data.z or 0
  self.text = data.text or "Blip"
  self.imageId = data.imageId or 1
  self.colorId = data.colorId or 0
  self.scale = data.scale or 1.0
  self.rotation = data.rotation or 0

  if data.shortRange ~= nil then
    self.shortRange = data.shortRange
  else
    self.shortRange = true
  end

  if data.enable ~= nil then
    self.enable = data.enable
  else
    self.enable = true
  end

  self.Show = function()

    if self.x ~= nil and self.y ~= nil and self.z ~= nil and self.blip == nil then
      local blip = AddBlipForCoord(self.x, self.y, self.z)
      SetBlipSprite(blip, self.imageId)
      SetBlipAsShortRange(blip, self.shortRange)
      SetBlipColour(blip, self.colorId)
      SetBlipScale(blip, self.scale)
      SetBlipRotation(blip, self.rotation)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(self.text)
      EndTextCommandSetBlipName(blip)
      self.blip = blip
    end

  end

  self.Hide = function()

    if self.blip ~= nil then
      Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(self.blip))
    end

  end

  return self

end
