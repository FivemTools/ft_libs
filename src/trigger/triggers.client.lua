--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

Triggers = {}
Triggers.current = nil

function AddTrigger(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, value in pairs(args[1]) do
      Citizen.Wait(1)
      Triggers[name] = Trigger(value)
    end

  elseif count == 2 then

    local name = args[1]
    local value = args[2]
    Triggers[name] = Trigger(value)

  else

    return false

  end

end

function RemoveTrigger(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in ipairs(args[1]) do
      Citizen.Wait(1)
      if Triggers[name] ~= nil then
        Triggers[name] = nil
      end
    end

  elseif count == 1 then

    local name = args[1]
    if Triggers[name] ~= nil then
      Triggers[name] = nil
    end

  else

    return false

  end

end

function SwitchTrigger(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for name, status in pairs(args[1]) do
      Citizen.Wait(1)
      if Triggers[name] ~= nil then
        Triggers[name].enable = status
      end
    end

  elseif count == 2 then

    local name = args[1]
    local status = args[2]
    if Triggers[name] ~= nil then
      Triggers[name].enable = status
    end

  else

    return false

  end

end

function EnableTrigger(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in pairs(args[1]) do
      Citizen.Wait(1)
      if Triggers[name] ~= nil then
        Triggers[name].enable = true
      end
    end

  elseif count == 1 then

    local name = args[1]
    if Triggers[name] ~= nil then
      Triggers[name].enable = true
    end

  else

    return false

  end

end

function DisableTrigger(...)

  local args = {...}
  local count = #args

  if count == 1 and type(args[1]) == "table" then

    for _, name in pairs(args[1]) do
      Citizen.Wait(1)
      if Triggers[name] ~= nil then
        Triggers[name].enable = false
      end
    end

  elseif count == 1 then

    local name = args[1]
    if Triggers[name] ~= nil then
      Triggers[name].enable = false
    end

  else

    return false

  end

end

function CurrentTrigger()
  return Triggers.current
end

-- Check
AddRunInFrame(function()

  local playerPed = GetPlayerPed(-1)
  local playerLocalisation = GetEntityCoords(playerPed)

  for name, trigger in pairs(Triggers) do

    if trigger.enable then
      player_in = (GetDistanceBetweenCoords(trigger.x, trigger.y, trigger.z, playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, true) < (trigger.weight + 0.0) and math.abs(playerLocalisation.z - trigger.z) <= (trigger.height + 0.0))

      if player_in and Triggers.current ~= name then
        Triggers.current = name
        trigger.Enter()
      elseif player_in and Triggers.current == name then
        trigger.Active()
      elseif not player_in and Triggers.current == name then
        Triggers.current = nil
        trigger.Exit()
      end
    end

  end

end)
