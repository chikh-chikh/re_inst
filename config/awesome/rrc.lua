-- Если установлен LuaRocks, убедитесь, что пакеты, установленные через него. (например, lgi).
-- Если LuaRocks не установлен, ничего не делайте...


-- Standard awesome library
--require("collision")()

-- Включение виджета помощи по горячим клавишам для VIM
-- и других приложений при открытии клиента с соответствующим именем:
require("awful.hotkeys_popup.keys")


os.setlocale(os.getenv("LANG"))

-- Autostarting programm
-- интернет
os.execute("pgrep -u $USER -x nm-applet || (nm-applet &)")
os.execute("pgrep -u $USER -x kbdd || (kbdd &)")
os.execute("pgrep -u $USER -x xscreensaver || (xscreensaver -nosplash &)")



--}}}
--{{{

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
-- }}}

---{{{
---[[--
--]]
--
---}}}



---[[--
--]]--

-- Signals
---[[--
-- Focus urgent clients automatically
-- When I launch a client at a particular place, I want to go to that client.
client.connect_signal("property::urgent", function(c)
    c.minimized = false
    c:jump_to()
end)


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
