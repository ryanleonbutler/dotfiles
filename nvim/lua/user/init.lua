require("user.remap")
require("user.packer")
require("user.set")
require("user.autocmd")

-- load private work config
local function load_work(name)
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

-- load_work("/Users/butryan/.config/nvim/lua/user/work.lua")
