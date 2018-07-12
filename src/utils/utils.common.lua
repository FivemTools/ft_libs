--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @Contributors : izio38
-- @License: GNU General Public License v3.0
--


--
-- Citizen.Trace table
--
function PrintTable(table, indent)

    if type(table) == "table" then

        if not indent then
            indent = 0
        end

        for k, v in pairs(table) do
            formatting = string.rep("  ", indent) .. k .. ": "
            if type(v) == "table" then
                Citizen.Trace(formatting .. "\n")
                PrintTable(v, indent + 1)
            elseif type(v) == "boolean" then
                if v then
                    Citizen.Trace(formatting .. "true \n")
                else
                    Citizen.Trace(formatting .. "false \n")
                end
            elseif type(v) == "nil" then
                Citizen.Trace(formatting .. "nil \n")
            elseif type(v) == "function" then
                Citizen.Trace(formatting .. "function \n")
            else
                Citizen.Trace(formatting .. tostring(v) .. " (" .. type(v) .. ") \n")
            end
        end

    elseif type(table) == "boolean" then

        if table then
            Citizen.Trace("true \n")
        else
            Citizen.Trace("false \n")
        end

    elseif type(table) == "nil" then

        Citizen.Trace("nil \n")

    elseif type(table) == "function" then

        Citizen.Trace("function \n")

    else

        Citizen.Trace(tostring(table)  .. " (" .. type(table) .. ") \n")

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

    if type(t) ~= "table" then
        return t
    end
    local meta = getmetatable(t)
    local target = {}
    for k, v in pairs(t) do
        target[k] = v
    end
    setmetatable(target, meta)
    return target
end

--
-- Clone table
--
function Clone(t)

    if type(t) ~= "table" then
        return t
    end
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

--
-- Debug print
--

debugMode = false

--
--
--
function SetDebug(status)

  assert(type(status) == "boolean" or boolean == 1 or boolean == 0, "SetDebug : status must be boolean or number")

  if status == 1 then
      status = true
  elseif status == 0 then
      status = false
  end
  debugMode = status

end

--
--
--
function DebugPrint(data)

  if debugMode then
      TablePrint(data)
  end

end

