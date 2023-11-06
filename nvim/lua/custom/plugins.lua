local plugins = {
	-- To make a plugin not be loaded
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

	-- override cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"f3fora/cmp-spell",
			"hrsh7th/cmp-emoji",
		},
		opts = {
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{
					name = "spell",
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
					},
				},
				{ name = "emoji" },
			},
		},
	},

	-- edit exiting
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"rust",
				"tsx",
				"typescript",
				"vim",
				"zig",
			},
		},
	},
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
	{
		"hrsh7th/nvim-cmp",
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
	-- Custom plugins
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"deno",
				"typescript-language-server",
				"eslint-lsp",
				"prettier",
				"js-debug-adapter",
				"pyright",
				"gopls",
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
		"nvimtools/none-ls.nvim",
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
			"nvimtools/none-ls.nvim",
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
	{
		"gbprod/yanky.nvim",
	},
	-- TPOPE
	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", lazy = false },
	-- "gc" to comment visual regions/lines
	{ "tpope/vim-commentary", lazy = false },
	{ "tpope/vim-surround", lazy = false },
	{ "tpope/vim-repeat", lazy = false },
	{ "jkramer/vim-checkbox", lazy = false },
	{ "ipkiss42/xwiki.vim", lazy = false },
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
	{
		"gbprod/yanky.nvim",
		dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
		opts = function()
			local mapping = require("yanky.telescope.mapping")
			local mappings = mapping.get_defaults()
			mappings.i["<c-p>"] = nil
			return {
				highlight = { timer = 200 },
				ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
				picker = {
					telescope = {
						use_default_mappings = false,
						mappings = mappings,
					},
				},
			}
		end,
		keys = {
			{
				"<leader>p",
				function()
					require("telescope").extensions.yank_history.yank_history({})
				end,
				desc = "Open Yank History",
			},
			{
				"y",
				"<Plug>(YankyYank)",
				mode = { "n", "x" },
				desc = "Yank text",
			},
			{
				"p",
				"<Plug>(YankyPutAfter)",
				mode = { "n", "x" },
				desc = "Put yanked text after cursor",
			},
			{
				"P",
				"<Plug>(YankyPutBefore)",
				mode = { "n", "x" },
				desc = "Put yanked text before cursor",
			},
			{
				"gp",
				"<Plug>(YankyGPutAfter)",
				mode = { "n", "x" },
				desc = "Put yanked text after selection",
			},
			{
				"gP",
				"<Plug>(YankyGPutBefore)",
				mode = { "n", "x" },
				desc = "Put yanked text before selection",
			},
			{
				"[y",
				"<Plug>(YankyCycleForward)",
				desc = "Cycle forward through yank history",
			},
			{
				"]y",
				"<Plug>(YankyCycleBackward)",
				desc = "Cycle backward through yank history",
			},
			{
				"]p",
				"<Plug>(YankyPutIndentAfterLinewise)",
				desc = "Put indented after cursor (linewise)",
			},
			{
				"[p",
				"<Plug>(YankyPutIndentBeforeLinewise)",
				desc = "Put indented before cursor (linewise)",
			},
			{
				"]P",
				"<Plug>(YankyPutIndentAfterLinewise)",
				desc = "Put indented after cursor (linewise)",
			},
			{
				"[P",
				"<Plug>(YankyPutIndentBeforeLinewise)",
				desc = "Put indented before cursor (linewise)",
			},
			{
				">p",
				"<Plug>(YankyPutIndentAfterShiftRight)",
				desc = "Put and indent right",
			},
			{
				"<p",
				"<Plug>(YankyPutIndentAfterShiftLeft)",
				desc = "Put and indent left",
			},
			{
				">P",
				"<Plug>(YankyPutIndentBeforeShiftRight)",
				desc = "Put before and indent right",
			},
			{
				"<P",
				"<Plug>(YankyPutIndentBeforeShiftLeft)",
				desc = "Put before and indent left",
			},
			{
				"=p",
				"<Plug>(YankyPutAfterFilter)",
				desc = "Put after applying a filter",
			},
			{
				"=P",
				"<Plug>(YankyPutBeforeFilter)",
				desc = "Put before applying a filter",
			},
		},
	},
	-- terminal
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		version = "*",
		cmd = { "ToggleTerm", "TermExec" },
		opts = {
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			on_create = function()
				vim.opt.foldcolumn = "0"
				vim.opt.signcolumn = "no"
			end,
			autochdir = true,
			hide_numbers = true,
			open_mapping = [[<C-t>]],
			float_opts = {
				border = "curved",
				highlights = { border = "Normal", background = "Normal" },
			},
			shade_filetypes = {},
			shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			shading_factor = "-30", -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
			start_in_insert = true,
			-- insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			auto_scroll = true,
			direction = "horizontal",
			close_on_exit = true,
		},
	},
	-- note taking - Obisdian
	{
		"epwalsh/obsidian.nvim",
		lazy = false,
		event = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			dir = "~/Documents/obsidian/work", -- no need to call 'vim.fn.expand' here
			-- Optional, if you keep notes in a specific subdirectory of your vault.
			notes_subdir = "notes",

			-- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
			-- levels defined by "vim.log.levels.*" or nil, which is equivalent to DEBUG (1).
			-- log_level = vim.log.levels.DEBUG,

			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = "notes/dailies",
				-- Optional, if you want to change the date format for daily notes.
				date_format = "%Y-%m-%d",
			},

			templates = {
				subdir = "templates",
				-- date_format = "%M-%m-%d-%a",
				date_format = "%B %d, %Y",
				time_format = "%H:%M",
			},

			-- Optional, completion.
			completion = {
				-- If using nvim-cmp, otherwise set to false
				nvim_cmp = true,
				-- Trigger completion at 2 chars
				min_chars = 2,
				-- Where to put new notes created from completion. Valid options are
				--  * "current_dir" - put new notes in same directory as the current buffer.
				--  * "notes_subdir" - put new notes in the default notes subdirectory.
				new_notes_location = "current_dir",

				-- Whether to add the output of the node_id_func to new notes in autocompletion.
				-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
				prepend_note_id = true,
			},

			-- Optional, key mappings.
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				-- ["gf"] = require("obsidian.mapping").gf_passthrough(),
			},

			-- Optional, customize how names/IDs for new notes are created.
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,

			-- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
			disable_frontmatter = false,

			-- Optional, alternatively you can customize the frontmatter data.
			note_frontmatter_func = function(note)
				-- This is equivalent to the default frontmatter function.
				local out = { id = note.id, aliases = note.aliases, tags = note.tags }
				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				return out
			end,

			-- Optional, for templates (see below).
			-- templates = {
			--     subdir = "templates",
			--     date_format = "%Y-%m-%d-%a",
			--     time_format = "%H:%M",
			-- },

			-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
			-- URL it will be ignored but you can customize this behavior here.
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				vim.fn.jobstart({ "open", url }) -- Mac OS
				-- vim.fn.jobstart({"xdg-open", url})  -- linux
			end,

			-- Optional, set to true if you use the Obsidian Advanced URI plugin.
			-- https://github.com/Vinzent03/obsidian-advanced-uri
			use_advanced_uri = true,

			-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
			open_app_foreground = false,

			-- Optional, by default commands like `:ObsidianSearch` will attempt to use
			-- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
			-- first one they find. By setting this option to your preferred
			-- finder you can attempt it first. Note that if the specified finder
			-- is not installed, or if it the command does not support it, the
			-- remaining finders will be attempted in the original order.
			finder = "telescope.nvim",

			-- Optional, determines whether to open notes in a horizontal split, a vertical split,
			-- or replacing the current buffer (default)
			-- Accepted values are "current", "hsplit" and "vsplit"
			open_notes_in = "current",
		},
	},
	-- nvim in the browser
	{
		"glacambre/firenvim",
		-- Lazy load firenvim
		-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
		lazy = not vim.g.started_by_firenvim,
		build = function()
			os.execute("set -gx NVIM_APPNAME '~/.config/nvim/firenvim.lua'")
			vim.fn["firenvim#install"](0)
		end,
	},
	-- spell source
	{
		"f3fora/cmp-spell",
	},
	-- code suggestions
	{
		dir = "~/workspace/codewhisperer-nvim/src/AmazonCodeWhispererVimPlugin",
		lazy = false,
		name = "codewhisperer",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
	},
	{
		lazy = false,
		"TabbyML/vim-tabby"
	}
}
return plugins
