---@type ChadrcConfig
local M = {}

-- Re-enable Netrw to make the 'gx' shortcut work
-- see https://github.com/NvChad/NvChad/issues/1865
---@ChadrcConfig
M.lazy_nvim = {
	performance = {
		rtp = {
			disabled_plugins = vim.tbl_filter(function(name)
				return string.sub(name, 1, 5) ~= "netrw"
			end, require("plugins.configs.lazy_nvim").performance.rtp.disabled_plugins),
		},
	},
}

M.ui = { theme = "catppuccin", transparency = true, statusline = { theme = "default", enabled = true } }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
