print("Loading work config")
-- barium
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
-- Check if the config is already defined (useful when reloading this file)
if not configs.barium then
	configs.barium = {
		default_config = {
			cmd = { "barium" },
			filetypes = { "brazil-config" },
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname)
			end,
			settings = {},
		},
	}
end
lspconfig.barium.setup({})

return require("packer").startup(function(use)
	use({
		"butryan@git.amazon.com:pkg/NinjaHooks",
		branch = "mainline",
		cmd = vim.opt.rtp:append(
			vim.fn.stdpath("data") .. "/site/pack/packer/start/NinjaHooks/configuration/vim/amazon/brazil-config"
		),
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
