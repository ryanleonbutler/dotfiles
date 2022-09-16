-- Harpoon
require("harpoon").setup({
	menu = {
		width = vim.api.nvim_win_get_width(0) - 4,
	},
	global_settings = {
		-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
		save_on_toggle = false,

		-- saves the harpoon file upon every change. disabling is unrecommended.
		save_on_change = true,

		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = false,

		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
		tmux_autoclose_windows = false,

		-- filetypes that you want to prevent from adding to the harpoon list menu.
		excluded_filetypes = { "harpoon" },

		-- set marks specific to each git branch inside git repository
		mark_branch = false,
	},
})

-- better-escape.vim
-- vim.g.better_escape_interval = 200
-- vim.g.better_escape_shortcut = { "jk" }

-- last-place
require("nvim-lastplace").setup({
	lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
	lastplace_ignore_filetype = {
		"gitcommit",
		"gitrebase",
		"svn",
		"hgcommit",
	},
	lastplace_open_folds = true,
})

-- doge
vim.g.doge_doc_standard_python = "google"

-- indent line
require("indent_blankline").setup({
	indentLine_enabled = 1,
	indent_blankline_char = " ",
	space_char_blankline = " ",
	show_current_context = true,
	indent_blankline_context_char_list = "▏",
	show_current_context_start = false,
	indent_blankline_show_first_indent_level = false,
})

-- require("cinnamon").setup({
	-- extra_keymaps = true,
	-- override_keymaps = true,
	-- max_length = 500,
	-- scroll_limit = -1,
-- })

require("true-zen").setup({
	{
		modes = { -- configurations per mode
			ataraxis = {
				shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
				backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
				minimum_writing_area = { -- minimum size of main window
					width = 70,
					height = 44,
				},
				quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
				padding = { -- padding windows
					left = 52,
					right = 52,
					top = 0,
					bottom = 0,
				},
				callbacks = { -- run functions when opening/closing Ataraxis mode
					open_pre = nil,
					open_pos = nil,
					close_pre = nil,
					close_pos = nil,
				},
			},
			minimalist = {
				ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
				options = { -- options to be disabled when entering Minimalist mode
					number = false,
					relativenumber = false,
					showtabline = 0,
					signcolumn = "no",
					statusline = "",
					cmdheight = 1,
					laststatus = 0,
					showcmd = false,
					showmode = false,
					ruler = false,
					numberwidth = 1,
				},
				callbacks = { -- run functions when opening/closing Minimalist mode
					open_pre = nil,
					open_pos = nil,
					close_pre = nil,
					close_pos = nil,
				},
			},
			narrow = {
				--- change the style of the fold lines. Set it to:
				--- `informative`: to get nice pre-baked folds
				--- `invisible`: hide them
				--- function() end: pass a custom func with your fold lines. See :h foldtext
				folds_style = "informative",
				run_ataraxis = true, -- display narrowed text in a Ataraxis session
				callbacks = { -- run functions when opening/closing Narrow mode
					open_pre = nil,
					open_pos = nil,
					close_pre = nil,
					close_pos = nil,
				},
			},
			focus = {
				callbacks = { -- run functions when opening/closing Focus mode
					open_pre = nil,
					open_pos = nil,
					close_pre = nil,
					close_pos = nil,
				},
			},
		},
		integrations = {
			tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
			kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
				enabled = false,
				font = "+3",
			},
			twilight = false, -- enable twilight (ataraxis)
			lualine = false, -- hide nvim-lualine (ataraxis)
		},
	},
})
