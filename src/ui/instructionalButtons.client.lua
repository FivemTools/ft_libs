--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--
local instructionalsButtonsList = {}
local currentInstructionalButtons = nil

--
--
--
local function CreateInstructionalButtons(data)

	local scaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(10)
    end

	local total = 0
	for text, value in pairs(data) do
		PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
	    PushScaleformMovieFunctionParameterInt(total)
	    PushScaleformMovieFunctionParameterString(GetControlInstructionalButton(2, value, true))
	    PushScaleformMovieFunctionParameterString(text)
	    PopScaleformMovieFunctionVoid()
		total = total + 1
		Citizen.Wait(1)
	end

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()
	return scaleform

end

--
--
--
function AddInstructionalButtons(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for name, value in pairs(args[1]) do
            Citizen.Wait(1)
            instructionalsButtonsList[name] = CreateInstructionalButtons(value)
        end

    elseif count == 2 then

        local name = args[1]
        local value = args[2]
        instructionalsButtonsList[name] = CreateInstructionalButtons(value)

    else

        return false

    end

end

--
--
--
function RemoveInstructionalButtons(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for name, value in pairs(args[1]) do
            instructionalsButtonsList[name] = nil
            Citizen.Wait(1)
        end

    elseif count == 1 then

        local name = args[1]
        instructionalsButtonsList[name] = nil

    else

        return false

    end

end

--
--
--
function DisplayInstructionalButtons(name)

    if instructionalsButtonsList[name] ~= nil then
        currentInstructionalButtons = name
    else
        currentInstructionalButtons = nil
    end

end

--
--
--
function GetCurrentInstructionalButtons()

    return currentInstructionalButtons

end

--
--
--
function InstructionalButtonsFrame()

    Citizen.CreateThread(function()
        while true do

            if currentInstructionalButtons ~= nil and instructionalsButtonsList[currentInstructionalButtons] ~= nil then
                DrawScaleformMovieFullscreen(instructionalsButtonsList[currentInstructionalButtons], 255, 255, 255, 255, 0)
            end
            Citizen.Wait(5)

        end
    end)

end
