--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

-- Count table
function TableLength(table)

  local count = 0
  for _ in pairs(table) do
    count = count + 1
  end
  return count

end

-- Round number
function Round(settings)

  settings = settings or {}
	local number = settings.number or 0
	local decimal = settings.decimal or 1

  local mult = 10 ^ decimal
  return math.floor(number * mult + 0.5) / mult

end

-- Comat number
function CommaValue(settings)

  settings = settings or {}
	local number = settings.number or ""
	local separator = settings.separator or " "

  if (settings.decimal ~= nil) then
    number = Round({ number = number, decimal = settings.decimal })
  end

  while true do
    number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1' .. separator .. '%2')
    if (k==0) then
      break
    end
  end
  return number

end
