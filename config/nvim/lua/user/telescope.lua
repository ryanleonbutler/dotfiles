local Remap = require("user.keymap")
local nmap = Remap.nmap

local telescope = require 'telescope'
local telescope_builtin = require 'telescope.builtin'
local telescope_actions = require 'telescope.actions'

local M = {}

telescope.setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
	prompt_position = 'top',
	layout_strategy = 'horizontal',
	sorting_strategy = 'ascending',
	use_less = false,
	prompt_prefix = " >",
	-- color_devicons = true,

	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ["<C-h>"] = "which_key"
            }
        }
    },
    -- pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    -- },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
require('telescope').load_extension('fzf')

require("telescope").load_extension("git_worktree")

require("telescope").load_extension("harpoon")

M.find_files = function()
  telescope_builtin.find_files {
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    previewer = true,
    hidden = true
  }
end

-- normal
nmap("<C-p>", ":Telescope <CR>")
nmap("<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>s", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap("<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<leader>t", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- harpoon
nmap("<leader>,", ":Telescope harpoon marks<cr>")

return M
