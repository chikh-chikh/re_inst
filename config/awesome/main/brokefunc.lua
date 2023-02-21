-- Standard awesome library
local awful = require("awful")

require("awful.autofocus")

-- Эти две функции предназначены для перемещения текущего клиента в следующий/предыдущий тег
-- и последующего перехода в этот тег.

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

--Нет причин для перехода к следующему/предыдущему тегу и необходимости проходить мимо пустых тегов на пути к следующему тегу с клиентом.
--Следующие две функции обходят пустые теги при переходе к следующему или предыдущему.
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
				"request::activate", "key.unminimize", { raise = true }
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

-- Если я закрою последнего клиента на данном теге, он автоматически переключится на тег, у которого есть клиент.
-- То есть, нет причин оставаться на пустом теге.
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
		-- Перебирает всех клиентов на текущем теге. Если на текущей теге 2 или более клиентов, то выход из функции.
		for _, cl in ipairs(t:clients()) do
			if cl ~= c then
				return
			end
		end
		-- Этот шаг будет выполнен только в том случае, если на текущем теге находится один клиент.
		-- Пройдитесь по всем меткам на текущем экране. Мы должны пропустить текущую метку.
		-- Затем мы переходим к метке с наименьшим индексом, на которой находится один или несколько клиентов.
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
	--Переместить на новый экран, но при этом сохранить его в том же индексе тегов.
	local index = c.first_tag.index
	c:move_to_screen(s)
	local tag = c.screen.tags[index]
	c:move_to_tag(tag)
	tag:view_only()
end
