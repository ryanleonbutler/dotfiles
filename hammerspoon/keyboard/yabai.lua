-- Send message(s) to a running instance of yabai.
local function yabai(commands)
	for _, cmd in ipairs(commands) do
		os.execute("/opt/homebrew/bin/yabai -m " .. cmd)
	end
end

local function alt(key, commands)
	hs.hotkey.bind({ "alt" }, key, function()
		yabai(commands)
	end)
end

local function alt_shift(key, commands)
	hs.hotkey.bind({ "alt", "shift" }, key, function()
		yabai(commands)
	end)
end

local function alt_ctrl_cmd(key, commands)
	hs.hotkey.bind({ "alt", "ctrl", "shift" }, key, function()
		yabai(commands)
	end)
end

local function ctrl_cmd(key, commands)
	hs.hotkey.bind({ "ctrl", "cmd" }, key, function()
		yabai(commands)
	end)
end

local function ctrl_shift(key, commands)
	hs.hotkey.bind({ "ctrl", "shift" }, key, function()
		yabai(commands)
	end)
end

local function hyper(key, commands)
	hs.hotkey.bind({ "ctrl", "shift", "alt", "cmd" }, key, function()
		yabai(commands)
	end)
end

-- alpha
-- alt("f", { "window --toggle zoom-fullscreen" })
-- alt("l", { "space --focus recent" })
-- alt("m", { "space --toggle mission-control" })
-- alt("p", { "window --toggle pip" })
-- alt("g", { "space --toggle padding", "space --toggle gap" })
-- alt("r", { "space --rotate 90" })
-- alt("t", { "window --toggle float", "window --grid 4:4:1:1:2:2" })

-- special characters
-- alt("'", { "space --layout stack" })
-- alt(";", { "space --layout bsp" })
-- alt("tab", { "space --focus recent" })

-- change window focus within space
alt("j", { "window --focus south" })
alt("k", { "window --focus north" })
alt("h", { "window --focus west" })
alt("l", { "window --focus east" })

-- # change focus between external displays (left and right)
alt_shift("h", { "display --focus west" })
alt_shift("l", { "display --focus east" })

-- # rotate layout clockwise
ctrl_shift("r", { "space --rotate 270" })

-- # balance
ctrl_shift("b", { "space --balance" })

-- # flip along y-axis
ctrl_shift("y", { "space --mirror y-axis" })
-- # flip along x-axis
ctrl_shift("x", { "space --mirror y-axis" })

-- # toggle window float
ctrl_shift("t", { "window --toggle float", "window --grid 4:4:1:1:2:2" })

-- # swap windows
ctrl_shift("j", { "window --swap south" })
ctrl_shift("k", { "window --swap north" })
ctrl_shift("h", { "window --swap west" })
ctrl_shift("l", { "window --swap east" })

-- # increase window size
ctrl_cmd("l", { "window --resize left:-80:0" })
ctrl_cmd("j", { "window --resize bottom:0:80" })
ctrl_cmd("k", { "window --resize top:0:-80" })
ctrl_cmd("h", { "window --resize right:80:0" })

-- # Focus on a space
for i = 1, 9 do
	local num = tostring(i)
	hyper(num, { "space --focus " .. num })
end

-- # move window to space
for i = 1, 9 do
	local num = tostring(i)
	alt_ctrl_cmd(num, { "window --space " .. num })
end
-- ctrl + alt + cmd - 1 : yabai -m window --space 1
-- ctrl + alt + cmd - 2 : yabai -m window --space 2
-- ctrl + alt + cmd - 3 : yabai -m window --space 3
-- ctrl + alt + cmd - 4 : yabai -m window --space 4
-- ctrl + alt + cmd - 5 : yabai -m window --space 5

-- restart yabai
hs.hotkey.bind({ "ctrl", "shift", "alt", "cmd" }, "r", function()
	os.execute("/opt/homebrew/bin/yabai --restart-service")
	hs.reload()
end)

-- start yabai
hs.hotkey.bind({ "ctrl", "shift", "alt", "cmd" }, "s", function()
	os.execute("/opt/homebrew/bin/yabai --start-service")
end)

-- exit yabai
hs.hotkey.bind({ "ctrl", "shift", "alt", "cmd" }, "e", function()
	os.execute("/opt/homebrew/bin/yabai --stop-service")
end)
