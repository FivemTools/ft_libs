--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

-- Display info in corner top left
function HelpPromt(text)
	Citizen.CreateThread(function()

		SetTextComponentFormat("STRING")
		AddTextComponentString(text)
		DisplayHelpTextFromStringLabel(0, false, false, -1)

	end)
end

-- Display loading promt
function LoadingPromt(settings)
	Citizen.CreateThread(function()

		settings = settings or {}
		local text = settings.text or "Text"
		local type = settings.type or 4
		local time = settings.time or 1000

		N_0xaba17d7ce615adbf("STRING")
		AddTextComponentString(text)
		N_0xbd12f8228410d9b4(type)
		Citizen.Wait(time)
		N_0x10d373323e5b9c0d()

	end)
end

-- Display notification on the top map
function Notification(message)
  Citizen.CreateThread(function()

    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)

  end)
end

-- Display notification on the top map
function AdvancedNotification(settings)
  Citizen.CreateThread(function()

		settings = settings or {}
		local icon = settings.icon or "CHAR_DEFAULT"
		local type = settings.type or 1
		local text = settings.text or ""
		local title = settings.title or ""
		local subTitle = settings.subTitle or ""

    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(icon, icon, true, type, title, subTitle)
    DrawNotification(false, true)

  end)
end

-- Display text on the screen
function Text(settings)
  Citizen.CreateThread(function()

		settings = settings or {}
		local text = settings.text or "Text"
		local font = settings.font or 1
		local centre = settings.center or true
		local x = settings.x or 0
		local y = settings.y or 0
		local scale = settings.scale or 1.0
		local red = settings.red or 255
		local green = settings.green or 255
		local blue = settings.blue or 255
		local alpha = settings.alpha or 255

    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(red, green, blue, alpha)
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)

  end)
end

-- Open input
function OpenTextInput(settings)

	settings = settings or {}
	local title = settings.title or "FMMC_KEY_TIP8"
	local defaultText = settings.defaultText or ""
	local maxInputLength = settings.maxInputLength or 255

	DisplayOnscreenKeyboard(true, title, "", defaultText, "", "", "", maxInputLength)

	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0);
		Citizen.Wait(0);
	end

	UnlockEnter()
	local result = GetOnscreenKeyboardResult()
	if result then
		return result
	else
		return nil
	end

end

-- Text on center
function TextNotification(settings)

	settings = settings or {}
	local text = settings.text or "Text"
	local time = settings.time or 1000

	SetTextEntry_2("STRING")
	AddTextComponentString(text)
	DrawSubtitleTimed(time, true)

end

-- Events
RegisterNetEvent('ft_libs:Notification')
AddEventHandler('ft_libs:Notification', Notification)

RegisterNetEvent('ft_libs:AdvancedNotification')
AddEventHandler('ft_libs:AdvancedNotification', AdvancedNotification)

RegisterNetEvent('ft_libs:TextNotification')
AddEventHandler('ft_libs:TextNotification', TextNotification)
