--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

Menus = {
    open = nil,
    curent = nil,
    primary = nil,
    freeze = false,
    from = 1,
    to = 10,
    selectedButton = 0,
    list = {},
    backMenu = {},
    gameMenu = false,
    lastKeyPressed = 0,
}

--
--
--
function AddMenu(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for name, value in pairs(args[1]) do
            Citizen.Wait(1)
            Menus.list[name] = Menu(value)
        end

    elseif count == 2 then

        local name = args[1]
        local value = args[2]
        Menus.list[name] = Menu(value)

    end
    return false

end

--
--
--
function RemoveMenu(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for _, name in ipairs(args[1]) do
            Citizen.Wait(1)
            if Menus[name] ~= nil then
                Menus.list[name] = nil
            end
        end

    elseif count == 1 then

        local name = args[1]
        if Menus[name] ~= nil then
            Menus.list[name] = nil
        end

    end
    return false

end

--
-- Return if menu is open
--
function MenuIsOpen()

    if Menus.curent ~= nil then
        return true
    end
    return false

end

--
-- Return current
--
function GetCurrentMenu()

    return Menus.curent

end

-- old function name
function CurrentMenu()

    Citizen.Trace("CurrentMenu function is deprecated ! Please us GetCurrentMenu function.")
    return GetCurrentMenu()

end

--
-- Return current
--
function GetPrimaryMenu()

    return Menus.primary

end

-- old function name
function PrimaryMenu()

    return GetPrimaryMenu()

end

--
-- Freeze menu
--
function FreezeMenu(status)

    Menus.freeze = status

end

--
-- Reset values
--
function ResetMenu()

    Menus.selectedButton = 0
    Menus.freeze = false
    Menus.from = 1
    Menus.to = 10

end

--
-- Open menu
--
function OpenMenu(name)

    -- Check if menu is open or not
    if MenuIsOpen() or Menus.list[name] == nil then
        return
    end

    Menus.open = true
    Menus.curent = name
    Menus.primary = name

    local menu = Menus.list[name]
    local countBtns = TableLength(menu.buttons)

    if countBtns >= 1 then
        Menus.selectedButton = 1
    end

end

--
-- Close menu
--
function CloseMenu()

    ResetMenu()
    Menus.backMenu = {}
    Menus.curent = nil
    Menus.open = false
    Menus.primary = nil

end

--
-- Move Up action
--
local function MoveUp(menu)

    local countBtns = TableLength(menu.buttons)

    if Menus.selectedButton > 1 then
        Menus.selectedButton = Menus.selectedButton - 1
        if countBtns > 11 and Menus.selectedButton < Menus.from then
            Menus.from = Menus.from - 1
            Menus.to = Menus.to - 1
        end
    else
        Menus.selectedButton = countBtns
        Menus.from = countBtns - 9
        Menus.to = countBtns
    end

    menu.Hover(Menus.selectedButton)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)

end

--
-- Move down action
--
local function MoveDown(menu)

    local countBtns = TableLength(menu.buttons)

    if Menus.selectedButton < countBtns then
        Menus.selectedButton = Menus.selectedButton + 1
        if countBtns > 11 and Menus.selectedButton > Menus.to then
            Menus.to = Menus.to + 1
            Menus.from = Menus.from + 1
        end
    else
        Menus.selectedButton = 1
        Menus.from = 1
        Menus.to = 11
    end

    menu.Hover(Menus.selectedButton)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)

end

--
-- Next menu
--
function NextMenu(name)

    if Menus.curent ~= nil then
        local data = {
            name = Menus.curent,
            from = Menus.from,
            to = Menus.to,
            selectedButton = Menus.selectedButton,
        }
        table.insert(Menus.backMenu, data) -- Check if curent menu is backMenu

        ResetMenu()
        Menus.curent = name

        local menu = Menus.list[name]
        local countBtns = TableLength(menu.buttons)

        if countBtns >= 1 then
            Menus.selectedButton = 1
        end
    end
    return false

end

--
-- Back last menu
--
function BackMenu()

    local backNumber = TableLength(Menus.backMenu)
    local backMenu = Menus.backMenu[backNumber]

    -- Back menu
    if backMenu.from ~= nil then
        Menus.from = backMenu.from
    end

    if backMenu.to ~= nil then
        Menus.to = backMenu.to
    end

    if backMenu.selectedButton ~= nil then

        local name = backMenu.name
        local menu = Menus.list[name]
        local countBtns = TableLength(menu.buttons)
        if backMenu.selectedButton > countBtns then
            Menus.selectedButton = countBtns
        else
            Menus.selectedButton = backMenu.selectedButton
        end

    end

    Menus.curent = backMenu.name
    Menus.freeze = false

    -- Remove menu
    table.remove(Menus.backMenu, backNumber)
    Menus.backMenu[backNumber] = nil

end

--
-- Back is press Back key
--
local function BackBtn(menu)

    local name = Menus.curent
    local menu = Menus.list[name]

    menu.Back()

    local backNumber = TableLength(Menus.backMenu)
    if next(Menus.backMenu) and backNumber > 0 and menu.backLock == false then
        BackMenu()
    elseif menu.closable == true then
        CloseMenu()
    end

end

--
-- Execute action
--
local function Exec(menu)

    local button = menu.buttons[Menus.selectedButton]
    menu.Exec(Menus.selectedButton)

    -- Go to next menu
    if button.openMenu ~= nil and Menus.list[button.openMenu] ~= nil then
        NextMenu(button.openMenu)
    end

    -- Freeze, Close and Back
    if button.freeze ~= nil and button.freeze then
        Menus.freeze = button.freeze
    elseif button.close ~= nil and button.close then
        CloseMenu()
    elseif button.back ~= nil and button.back then
        menu.Back()
        BackMenu()
    end

end

--
-- Clean buttons
function CleanMenuButtons(name)

    if Menus.list[name] ~= nil then
        Menus.list[name].buttons = {}
    end

end
--

--
-- Clean buttons
--
function SetMenuButtons()

    local args = {...}

    name, buttons
    if Menus.list[name] ~= nil then
        Menus.list[name].buttons = buttons
    end

end

--
-- Set menu value
--
function SetMenuValue(name, values)

    if Menus.list[name] ~= nil then

        local menu = Menus.list[name]

        for key, value in pairs(values) do
            menu[key] = value
        end

    end

end

--
-- Add button
--
function AddMenuButton(name, button)

    if Menus.list[name] ~= nil then
        if type(button) == "table" then
            local buttons = button
            for _, button in pairs (buttons) do
                table.insert(Menus.list[name].buttons, button)
            end
        else
            table.insert(Menus.list[name].buttons, button)
        end
    end

end

--
-- remove button
--
function RemoveMenuButton(name, button)

    if menus.list[name] ~= nil then
        table.remove(menus.list[name].buttons, button)
    end

end

--
-- Init instructionalButtons
--
local function menuInit()

    AddInstructionalButtons("ft_menu", {
        ["Up"] = 188,
        ["Down"] = 187,
        ["Enter"] = 201,
        ["Back"] = 177,
    })

end

--
-- Show menu
--
function MenuFrame()

    menuInit()

    Citizen.CreateThread(function()

        while true do

            if MenuIsOpen() and not IsHudComponentActive(19) and not IsHudComponentActive(16) and not IsPauseMenuActive() then

                local current = Menus.curent
                local menu = Menus.list[current]
                local countBtns = TableLength(menu.buttons)

                if not Menus.freeze then

                    local gameTimer = GetGameTimer()
                    local getLastInputMethod = GetLastInputMethod()

                    -- Fix
                    if Menus.selectedButton > countBtns then
                        Menus.selectedButton = countBtns
                    end

                    -- Block if menu is empty
                    if Menus.selectedButton > 0 and Menus.selectedButton <= countBtns then

                        -- Up
                        if IsControlPressed(2, 188) and getLastInputMethod and (gameTimer - Menus.lastKeyPressed) > 150 then

                            MoveUp(menu)
                            Menus.lastKeyPressed = gameTimer

                        end

                        -- Down
                        if IsControlPressed(2, 187) and getLastInputMethod and (gameTimer - Menus.lastKeyPressed) > 150 then

                            MoveDown(menu)
                            Menus.lastKeyPressed = gameTimer

                        end

                        -- Enter
                        if IsControlJustReleased(2, 201) and getLastInputMethod then

                            Exec(menu)
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)

                        end

                    end

                    -- Back
                    if IsControlJustReleased(2, 177) and not IsControlJustReleased(2, 322) and not IsControlJustReleased(2, 24) and not IsControlJustReleased(0, 25) and getLastInputMethod then

                        BackBtn(menu)
                        PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)

                    end

                end

                -- Show Memu
                menu.Show(Menus.from, Menus.to, Menus.selectedButton)
                DisplayInstructionalButtons("ft_menu")

            elseif GetCurrentInstructionalButtons() == "ft_menu" then

                DisplayInstructionalButtons(false)

            end -- end check menu is open

            Citizen.Wait(5)
        end

    end)

end
