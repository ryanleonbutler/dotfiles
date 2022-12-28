require("user.remap")
require("user.packer")
require("user.set")

-- load private work config
local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		require("user.work")
		io.close(f)
		return true
	else
		print("No work config found...")
		return false
	end
end

file_exists("lua/user/work.lua")

