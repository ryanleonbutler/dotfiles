-- Auto reload Hammerspoon config
local function reload()
	hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/development/dotfiles/hammerspoon/**/*", reload):start()
