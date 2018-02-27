--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

function Marker(data)

  local self = {}
  self.type = data.type or 1
  self.x = data.x or 0.0
  self.y = data.y or 0.0
  self.z = data.z or 0.0
  self.weight = data.weight or 2.0
  self.height = data.height or 0.5
  self.red = data.red or 255
  self.green = data.green or 255
  self.blue = data.blue or 255
  self.alpha = data.alpha or 255
  self.showDistance = data.showDistance or self.weight + 20

  if data.enable ~= nil then
      self.enable = data.enable
  else
      self.enable = true
  end

  self.Display = function(display)
    self.display = display
  end

  self.Show = function()
    local weight = self.weight * 2.0
    local height = self.height + 0.0
    DrawMarker(self.type, self.x, self.y, (self.z - 1), 0, 0, 0, 0, 0, 0, weight, weight, height, self.red, self.green, self.blue, self.alpha, 0, 0, 0, 0)
  end

  return self

end
