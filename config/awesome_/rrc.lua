-- Если установлен LuaRocks, убедитесь, что пакеты, установленные через него. (например, lgi).
-- Если LuaRocks не установлен, ничего не делайте...

pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
--require("collision")()

-- Widget and layout library
local wibox = require("wibox")
--local vicious = require("vicious")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Включение виджета помощи по горячим клавишам для VIM
-- и других приложений при открытии клиента с соответствующим именем:
require("awful.hotkeys_popup.keys")

-- Загрузка пунктов меню Debian
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

os.setlocale(os.getenv("LANG"))

-- {{{ Error handling
-- Проверьте, если awesome столкнулся с ошибкой во время запуска и вернулся в другую
-- конфигурацию (Этот код будет выполняться только для конфигурации возврата)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  })
end

-- Обработка сообщений об ошибках после запуска
do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err)
    })
    in_error = false
  end)
end
-- }}}

-- {{{ Определения переменных
beautiful.init("~/.config/awesome/themes/zenburn/theme.lua")

--awful.spawn(terminal.." -e my_command")

terminal = "alacritty"
fm = terminal .. " -e ranger"
browser = "yandex-browser-stable"

editor = os.getenv("editor") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Autostarting programm
-- интернет
os.execute("pgrep -u $USER -x nm-applet || (nm-applet &)")
os.execute("pgrep -u $USER -x kbdd || (kbdd &)")
os.execute("pgrep -u $USER -x xscreensaver || (xscreensaver -nosplash &)")

modkey = "Mod4"
altkey = "Mod1"

awful.layout.layouts = {
  -- awful.layout.suit.floating,
  awful.layout.suit.tile,
  -- awful.layout.suit.tile.left,
  -- awful.layout.suit.tile.bottom,
  -- awful.layout.suit.tile.top,
  -- awful.layout.suit.fair,
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  -- awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}

--}}}
--[[--
    -- Обои
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
    -- Переустановка обоев при изменении геометрии экрана (например, при изменении разрешения)
screen.connect_signal("property::geometry", set_wallpaper)
--]]
--
--{{{

--Menu
myawesomemenu = {
  { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual",      terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart",     awesome.restart },
  { "quit",        function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
  mymainmenu = freedesktop.menu.build({
    before = { menu_awesome },
    after = { menu_terminal }
  })
else
  mymainmenu = awful.menu({
    items = {
      menu_awesome,
      { "Debian", debian.menu.Debian_menu.Debian },
      menu_terminal,
    }
  })
end

-- Назначение кнопки меню
mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mymainmenu
})
-- Конфигурация менюбара (mod4 p)
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

--}}}

-- Виджета текстовых часов

awful.screen.connect_for_each_screen(function(s)
  -- Каждый экран имеет свою таблицу тегов.
  awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 " }, s,
    { awful.layout.layouts[1], awful.layout.layouts[1], awful.layout.layouts[1], awful.layout.layouts[1],
      awful.layout.layouts[1] })

  -- Окно подсказки для каждого экрана
  s.mypromptbox = awful.widget.prompt()
  --[[--
    -- Bиджет imagebox, который будет содержать иконку, указывающую, какой макет мы используем.
    -- Нам нужно по одному layoutbox на экран.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    --]]
  --
  -- Виджет тегов
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }
  -- Виджет задач
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }
  -- Wibox - верхняя панель
  s.mywibox = awful.wibar({ position = "top", screen = s, height = 27 })
  -- Добавление виджетов в wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      --mylauncher,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      mykeyboardlayout,
      wibox.widget.systray(),
      mytextclock,
      --s.mylayoutbox,
    },
  }
end)
-- }}}

---{{{
--[[--
-- These two functions are for moving the current client to the next/previous tag and following view to that tag.
local function move_to_previous_tag()
	local c = client.focus
	if not c then return end
	local t = c.screen.selected_tag
	local tags = c.screen.tags
	local idx = t.index
	local newtag = tags[gmath.cycle(#tags, idx - 1)]
	c:move_to_tag(newtag)
	awful.tag.viewprev()
end
local function move_to_next_tag()
	local c = client.focus
	if not c then return end
	local t = c.screen.selected_tag
	local tags = c.screen.tags
	local idx = t.index
	local newtag = tags[gmath.cycle(#tags, idx + 1)]
	c:move_to_tag(newtag)
	awful.tag.viewnext()
end

-- There is no reason to navigate next or previous in my tag list and have to pass by empty tags in route to the next tag with a client. The following two functions bypass the empty tags when navigating to next or previous.
function view_next_tag_with_client()
	local initial_tag_index = awful.screen.focused().selected_tag.index
	while (true) do
		awful.tag.viewnext()
		local current_tag = awful.screen.focused().selected_tag
		local current_tag_index = current_tag.index
		if #current_tag:clients() > 0 or current_tag_index == initial_tag_index then
			return
		end
	end
end
function view_prev_tag_with_client()
	local initial_tag_index = awful.screen.focused().selected_tag.index
	while (true) do
		awful.tag.viewprev()
		local current_tag = awful.screen.focused().selected_tag
		local current_tag_index = current_tag.index
		if #current_tag:clients() > 0 or current_tag_index == initial_tag_index then
			return
		end
	end
end

-- Toggle showing the desktop
local show_desktop = false
function show_my_desktop()
	if show_desktop then
		for _, c in ipairs(client.get()) do
			c:emit_signal(
				"request::activate", "key.unminimize", {raise = true}
			)
		end
		show_desktop = false
	else
		for _, c in ipairs(client.get()) do
			c.minimized = true
		end
		show_desktop = true
	end
end
--]]
--
---}}}


-- {{{ Привязка клавиш
globalkeys = gears.table.join(



--------------------------
  awful.key({ modkey, }, "s", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),
  awful.key({ modkey, }, "w", function() mymainmenu:show() end,
    { description = "вызов главного меню", group = "awesome" }),
-- awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
-- {description = "jump to urgent client", group = "client"}),


)
-- }}}

--[[
awful.util.table.join(
  -- Audio
  awful.key({ }, "XF86AudioRaiseVolume", pulseaudio.volume_up),
  awful.key({ }, "XF86AudioLowerVolume", pulseaudio.volume_down),
  awful.key({ }, "XF86AudioMute",  pulseaudio.toggle_muted),
  -- Microphone
  awful.key({"Shift"}, "XF86AudioRaiseVolume", pulseaudio.volume_up_mic),
  awful.key({"Shift"}, "XF86AudioLowerVolume", pulseaudio.volume_down_mic),
  awful.key({ }, "XF86MicMute",  pulseaudio.toggle_muted_mic)
)
--]]
-- {{{ Rules
-- Правила, применяемые к новым клиентам (через сигнал "manage").
awful.rules.rules = {
  -- All clients will match this rule.
  { rule = {},
    properties = { border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  -- Плавающие клиенты.
  { rule_any = {
    instance = {
      "DTA", -- Firefox addon DownThemAll (отключает их всех).
      "copyq", -- Включение имени сессии в класс.
      "pinentry",
    },
    class = {
      "Arandr",
      "Blueman-manager",
      "Gpick",
      "Kruler",
      "MessageWin", -- kalarm.
      "Sxiv",
      "Tor Browser", -- Требуется фиксированный размер окна, чтобы избежать отпечатков пальцев по размеру экрана.
      "Wpa_gui",
      "veromix",
      "xtightvncviewer"
    },

    -- Обратите внимание, что свойство name, показанное в xprop, может быть установлено немного позже после создания клиента.
    -- и имя, показанное там, может не соответствовать правилам, определенным здесь.
    name = {
      "Event Tester", -- xev.
    },
    role = {
      "AlarmWindow", -- Thunderbird's calendar.
      "ConfigManager", -- Thunderbird's about:config.
      "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
    }
  }, properties = { floating = true } },


  -- Добавление панелей заголовков к окнам
  { rule_any = { type = { "normal", "dialog" }
  }, properties = { titlebars_enabled = false }
  },
  -- Установите Firefox, чтобы он всегда отображал метку с именем "2" на экране 1.
  { rule = { class = "Firefox" },
    properties = { screen = 1, tag = "2" } },
}

-- }}}
---[[--
-- If I close the last client on a given tag, it will automatically switch to a tag that has a client. That is, there is no reason to stay on a tag that is empty.
client.connect_signal("unmanage", function(c)
  local t = c.first_tag or awful.screen.focused().selected_tag
  for _, cl in ipairs(t:clients()) do
    if cl ~= c then
      return
    end
  end
  for _, t in ipairs(awful.screen.focused().tags) do
    if #t:clients() > 0 then
      t:view_only()
      return
    end
  end
end)

move_client_to_screen = function(c, s)
  function avoid_showing_empty_tag_client_move(c)
    -- Get the current tag.
    local t = c.first_tag or awful.screen.focused().selected_tag
    -- Cycle through all clients on the current tag. If there are 2 or greater clients on the current tag then leave function.
    for _, cl in ipairs(t:clients()) do
      if cl ~= c then
        return
      end
    end
    -- This step is only run if there is one client on the current tag.
    -- Cycle through all tags on the current screen. We must skip the current tag. We then move to the lowest index tag with one or more clients on it.
    for _, tg in ipairs(awful.screen.focused().tags) do
      if tg ~= t then
        if #tg:clients() > 0 then
          tg:view_only()
          break
        end
      end
    end
  end

  avoid_showing_empty_tag_client_move(c)
  -- Move to new screen but also keep it on the same tag index.
  local index = c.first_tag.index
  c:move_to_screen(s)
  local tag = c.screen.tags[index]
  c:move_to_tag(tag)
  tag:view_only()
end
--]]--

-- Signals
---[[--
-- Focus urgent clients automatically
-- When I launch a client at a particular place, I want to go to that client.
client.connect_signal("property::urgent", function(c)
  c.minimized = false
  c:jump_to()
end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end
  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)
--]]--

--[[--
-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", {raise = false})
 end)
--]]
--

-- My focus border matches the mouse color.
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Gups
beautiful.useless_gap = 7

-- Autostart
awful.spawn.with_shell("picom")
awful.spawn.with_shell("feh --bg-fill --randomize ~/.config/awesome/themes/wallpaper/")
awful.spawn.with_shell("setxkbmap -option grp:alt_shift_toggle -layout us,ru")

--awful.spawn.with_shell(fm)
--awful.spawn.with_shell(terminal)

client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)
-- }}}
