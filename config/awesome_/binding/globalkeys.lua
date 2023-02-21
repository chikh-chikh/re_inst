-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
-- Menubar library
local menubar = require("menubar")

-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal

local _M = {}

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
    local globalkeys = gears.table.join(
        awful.key({ modkey, }, "s", hotkeys_popup.show_help,
            { description = "show help", group = "awesome" }),

        --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- переключение тега
        awful.key({ modkey, }, "Left", awful.tag.viewprev,
            { description = "view previous", group = "tag" }),
        awful.key({ modkey, }, "Right", awful.tag.viewnext,
            { description = "view next", group = "tag" }),
        awful.key({ modkey, }, "Escape", awful.tag.history.restore,
            { description = "go back", group = "tag" }),

        --фокус монитора
        --[[--
        awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
        awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
     	--]] --

        -- Фокус клиента
        awful.key({ modkey, }, "Tab",
            function()
                awful.client.focus.history.previous()
                if client.focus then
                    client.focus:raise()
                end
            end,
            { description = "go back", group = "client" }),
        awful.key({ modkey, }, "j", function() awful.client.focus.byidx(1) end,
            { description = "фокус на след. клиент", group = "client" }),
        awful.key({ modkey, }, "k", function() awful.client.focus.byidx( -1) end,
            { description = "фокус на пред. клиент", group = "client" }),
        --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- Layout manipulation
        awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
            { description = "swap with next client by index", group = "client" }),
        awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx( -1) end,
            { description = "swap with previous client by index", group = "client" }),
        awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
            { description = "focus the next screen", group = "screen" }),
        awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative( -1) end,
            { description = "focus the previous screen", group = "screen" }),
        awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
            { description = "jump to urgent client", group = "client" }),
        awful.key({ modkey, }, "Tab",
            function()
                awful.client.focus.history.previous()
                if client.focus then
                    client.focus:raise()
                end
            end,
            { description = "go back", group = "client" }),

        --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

        -- Стандартная программа
        awful.key({ modkey, }, "w", function() RC.mainmenu:show() end,
            { description = "show main menu", group = "awesome" }),
        awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
            { description = "open a terminal", group = "launcher" }),
        awful.key({ modkey, "Control" }, "r", awesome.restart,
            { description = "перезапуск awesome", group = "awesome" }),
        awful.key({ modkey, "Control" }, "q", awesome.quit,
            { description = "выход из awesome", group = "awesome" }),
        -- Terminal
        awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
            { description = "терминал", group = "RU" }),
        -- Ranger
        awful.key({ modkey, }, "r", function() awful.spawn(fm) end,
            { description = "файловый менеджер", group = "RU" }),
        -- Neovim
        awful.key({ modkey, }, "v", function() awful.spawn(editor_cmd) end,
            { description = "текстовый редактор", group = "RU" }),
        -- DMenu
        awful.key({ modkey }, "d", function() awful.util.spawn("dmenu_run") end,
            { description = "dmenu", group = "RU" }),
        -- Menubar
        awful.key({ modkey }, "p", function() menubar.show() end,
            { description = "menubar", group = "RU" }),
        -- Browser
        awful.key({ modkey }, "b", function() awful.util.spawn(browser) end,
            { description = "browser", group = "RU" }),
        --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- Управление схемой расположения
        awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
            { description = "переставить окно со след. ", group = "layout" }),
        awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx( -1) end,
            { description = "переставить окно с пред.", group = "layout" }),
        awful.key({ modkey, }, "h", function() awful.tag.incmwfact( -0.05) end,
            { description = "уменьшить мастер клиент", group = "layout" }),
        awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
            { description = "увеличить мастер клиент", group = "layout" }),
        awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
            { description = "increase the number of master clients", group = "layout" }),
        awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster( -1, nil, true) end,
            { description = "decrease the number of master clients", group = "layout" }),
        awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
            { description = "increase the number of columns", group = "layout" }),
        awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol( -1, nil, true) end,
            { description = "decrease the number of columns", group = "layout" }),
        awful.key({ modkey, }, "space", function() awful.layout.inc(1) end,
            { description = "select next", group = "layout" }),
        awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc( -1) end,
            { description = "select previous", group = "layout" }),

        awful.key({ modkey, "Control" }, "n",
            function()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", { raise = true }
                    )
                end
            end,
            { description = "развернуть", group = "client" }),

        --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- Resize
        --awful.key({ modkey, "Control" }, "Left",  function () awful.client.moveresize( 20,  20, -40, -40) end),
        --awful.key({ modkey, "Control" }, "Right", function () awful.client.moveresize(-20, -20,  40,  40) end),
        awful.key({ modkey, "Control" }, "Down",
            function() awful.client.moveresize(0, 0, 0, -20) end),
        awful.key({ modkey, "Control" }, "Up",
            function() awful.client.moveresize(0, 0, 0, 20) end),
        awful.key({ modkey, "Control" }, "Left",
            function() awful.client.moveresize(0, 0, -20, 0) end),
        awful.key({ modkey, "Control" }, "Right",
            function() awful.client.moveresize(0, 0, 20, 0) end),

        -- Move
        awful.key({ modkey, "Shift" }, "Down",
            function() awful.client.moveresize(0, 20, 0, 0) end),
        awful.key({ modkey, "Shift" }, "Up",
            function() awful.client.moveresize(0, -20, 0, 0) end),
        awful.key({ modkey, "Shift" }, "Left",
            function() awful.client.moveresize( -20, 0, 0, 0) end),
        awful.key({ modkey, "Shift" }, "Right",
            function() awful.client.moveresize(20, 0, 0, 0) end)

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

    )

    return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
    __call = function(_, ...) return _M.get(...) end
})
