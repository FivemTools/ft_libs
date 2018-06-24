--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--


--
-- Citizen.Trace table
--
function TablePrint(table, indent)

  if type(table) == "table" then
    if not indent then indent = 0 end
    for k, v in pairs(table) do
      formatting = string.rep("  ", indent) .. k .. ": "
      if type(v) == "table" then
        Citizen.Trace(formatting)
        TableCitizen.Trace(v, indent + 1)
      elseif type(v) == "boolean" then
        if v then
          Citizen.Trace(formatting .. "true")
        else
          Citizen.Trace(formatting .. "false")
        end
      elseif type(v) == "nil" then
        Citizen.Trace(formatting .. "nil")
      elseif type(v) == "function" then
        Citizen.Trace(formatting .. "function")
      else
        Citizen.Trace(formatting .. tostring(v) .. " (" .. type(v) .. ")")
      end
    end
  elseif type(table) == "boolean" then
    if table then
      Citizen.Trace("true")
    else
      Citizen.Trace("false")
    end
  elseif type(table) == "nil" then
    Citizen.Trace("nil")
  elseif type(table) == "function" then
    Citizen.Trace("function")
  else
    Citizen.Trace(tostring(table)  .. " (" .. type(table) .. ")")
  end

end

--
-- Count table
--
function TableLength(table)

    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count

end

--
-- Round number
--
function Round(settings)

    settings = settings or {}
    local number = settings.number or 0
    local decimal = settings.decimal or 1
    local mult = 10 ^ decimal
    return math.floor(number * mult + 0.5) / mult

end

--
-- Comat number
--
function CommaValue(settings)

    settings = settings or {}
    local number = settings.number or ""
    local separator = settings.separator or " "

    if settings.decimal ~= nil then
        number = Round({ number = number, decimal = settings.decimal })
    end

    while true do
        number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1' .. separator .. '%2')
        if k==0 then
            break
        end
    end
    return number

end

--
-- Copy table
--
function Copy(t)
    if type(t) ~= "table" then return t end
    local meta = getmetatable(t)
    local target = {}
    for k, v in pairs(t) do target[k] = v end
    setmetatable(target, meta)
    return target
end

--
-- Clone table
--
function Clone(t)
    if type(t) ~= "table" then return t end
    local meta = getmetatable(t)
    local target = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            target[k] = Clone(v)
        else
            target[k] = v
        end
    end
    setmetatable(target, meta)
    return target
end
