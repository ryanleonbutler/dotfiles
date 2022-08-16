local M = {}

function M.setup()
	local telescope = require("telescope")
	local builtin = require("telescope.builtin")

	telescope.setup({
		defaults = {
			-- Default configuration for telescope goes here:
			-- config_key = value,
			prompt_position = "bottom",
			layout_strategy = "horizontal",
			sorting_strategy = "descending",
			use_less = false,
			prompt_prefix = " >",
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" },
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git",
			},
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			mappings = {
				i = {},
			},
			command_palette = {
				{
					"File",
					{ "entire selection (C-a)", ':call feedkeys("GVgg")' },
					{ "save current file (C-s)", ":w" },
					{ "save all files (C-A-s)", ":wa" },
					{ "quit (C-q)", ":qa" },
					{ "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
					{ "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
					{ "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
					{ "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
				},
				{
					"Help",
					{ "tips", ":help tips" },
					{ "cheatsheet", ":help index" },
					{ "tutorial", ":help tutor" },
					{ "summary", ":help summary" },
					{ "quick reference", ":help quickref" },
					{ "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
				},
				{
					"Vim",
					{ "reload vimrc", ":source $MYVIMRC" },
					{ "check health", ":checkhealth" },
					{ "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
					{ "commands", ":lua require('telescope.builtin').commands()" },
					{ "command history", ":lua require('telescope.builtin').command_history()" },
					{ "registers (A-e)", ":lua require('telescope.builtin').registers()" },
					{ "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
					{ "vim options", ":lua require('telescope.builtin').vim_options()" },
					{ "keymaps", ":lua require('telescope.builtin').keymaps()" },
					{ "buffers", ":Telescope buffers" },
					{ "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
					{ "paste mode", ":set paste!" },
					{ "cursor line", ":set cursorline!" },
					{ "cursor column", ":set cursorcolumn!" },
					{ "spell checker", ":set spell!" },
					{ "relative number", ":set relativenumber!" },
					{ "search highlighting (F12)", ":set hlsearch!" },
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			file_browser = {
				theme = "ivy",
				hijack_netwr = true,
				mappings = {
					["i"] = {},
					["n"] = {},
				},
			},
			project = {
				base_dirs = {
					"~/workspace",
					{"~/development"},
					{"~/documents"},
					-- { path = "~/dev/src5", max_depth = 2 },
				},
				hidden_files = true, -- default: false
				theme = "dropdown",
			},
		},
	})
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("git_worktree")
	require("telescope").load_extension("harpoon")
	require("telescope").load_extension("file_browser")
	require("telescope").load_extension("project")
	require("telescope").load_extension("command_palette")

	M.find_files = function()
		builtin.find_files({
			find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
			previewer = true,
			hidden = true,
		})
	end

	M.switch_projects = function()
		require("telescope.builtin").find_files({
			prompt_title = "< Switch Project >",
			cwd = "$HOME/projects",
		})
	end

	M.telescope_buffer_dir = function()
		return vim.fn.expand("%:p:h")
	end
end

return M
