return {
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp'},
		}
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-emoji"
		},
		opts = {
			enabled = function()
				local buftype = vim.api.nvim_buf_get_option(0, "buftype")
				if buftype == "prompt" then
					return false
				end
				return vim.g.cmp_toggle
			end,
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			map_cr = true, --  map <CR> on insert mode
			map_complete = true, -- it will auto insert `(` after select function or method item
			ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
			enable_check_bracket_line = false,
			-- fast_wrap = {},
		},
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({})
			npairs.remove_rule("'")
			npairs.remove_rule('"')
			npairs.remove_rule("`")
			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
