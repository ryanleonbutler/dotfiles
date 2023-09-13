local plugins = {
	-- To make a plugin not be loaded
	{
		"windwp/nvim-autopairs",
		enabled = false,
	},
	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
	},
	{
		"folke/which-key.nvim",
		enabled = false,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			-- Enable Netrw to make the 'gx' shortcut work
			disable_netrw = false,
			hijack_netrw = false,
		},
		enabled = false,
	},

	-- edit exiting
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("custom.configs.telescope")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			show_current_context = true,
			show_current_context_start = false,
		},
	},

	-- Custom plugins
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"typescript-language-server",
				"eslint-lsp",
				"prettier",
				"js-debug-adapter",
				"pyright",
				"gopls",
				"rust_analyzer",
				"html",
				"cssls",
				"tailwindcss",
				"jsonls",
				"bashls",
				"clangd",
				"lua_ls",
			},
		},
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},

	-- NULL-LS alternatives --
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("custom.configs.lint")
	-- 	end
	-- },
	-- {
	-- 	"mhartington/formatter.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("custom.configs.formatter")
	-- 	end
	-- },
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dapui").setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.dap")
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	-- TPOPE
	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", lazy = false },
	-- "gc" to comment visual regions/lines
	{ "tpope/vim-commentary", lazy = false },
	{ "tpope/vim-surround", lazy = false },
	{ "tpope/vim-repeat", lazy = false },
	{ "jkramer/vim-checkbox" },
	{ "ipkiss42/xwiki.vim" },
	{
		"ojroques/nvim-osc52",
		config = function()
			require("osc52").setup({
				max_length = 0, -- Maximum length of selection (0 for no limit)
				silent = false, -- Disable message on successful copy
				trim = false, -- Trim surrounding whitespaces before copy
			})
		end,
	},
	{ "ThePrimeagen/harpoon" },
	{ "ThePrimeagen/vim-be-good" },
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup()
		end,
		lazy = false,
	},
}
return plugins
