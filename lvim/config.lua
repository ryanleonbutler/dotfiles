vim.cmd "let g:gruvbox_contrast_dark = 'hard'"
lvim.colorscheme = "gruvbox"

-- general lvim
lvim.format_on_save = false
lvim.leader = "space"
lvim.log.level = "warn"
lvim.nvim_tree_hide_dotfiles = 0
lvim.transparent_window = true
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = false -- highlight the current line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "no" -- always show the sign column otherwise it would shift the text each time
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.wrap = false -- display lines as one long line
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited

-- keys
lvim.keys.normal_mode["<leader>w"] = ":w<cr>"
lvim.keys.normal_mode["<leader>q"] = ":q<cr>"
lvim.keys.normal_mode["<leader>c"] = ":bd<cr>"
lvim.keys.normal_mode["<C-q>"] = ":qa<cr>"
lvim.keys.normal_mode["<C-e>"] = "<END>"
lvim.keys.normal_mode["<C-a>"] = "<HOME>"
lvim.keys.insert_mode["<C-e>"] = "<END>"
lvim.keys.insert_mode["<C-a>"] = "<HOME>"
lvim.keys.visual_mode["<C-e>"] = "<END>"
lvim.keys.visual_mode["<C-a>"] = "<HOME>"
lvim.keys.normal_mode["<TAB>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":bprevious<CR>"
lvim.keys.normal_mode["q"] = ""
lvim.keys.visual_mode["<C-c>"] = ":OSCYank<CR>"
lvim.keys.visual_mode["<Up>"] = "<Nop>"
lvim.keys.visual_mode["<Down>"] = "<Nop>"
lvim.keys.visual_mode["<Left>"] = "<Nop>"
lvim.keys.insert_mode["<Right>"] = "<Nop>"
lvim.keys.insert_mode["<Up>"] = "<Nop>"
lvim.keys.insert_mode["<Down>"] = "<Nop>"
lvim.keys.insert_mode["<Left>"] = "<Nop>"
lvim.keys.normal_mode["<Right>"] = "<Nop>"
lvim.keys.normal_mode["<Up>"] = "<Nop>"
lvim.keys.normal_mode["<Down>"] = "<Nop>"
lvim.keys.normal_mode["<Left>"] = "<Nop>"
lvim.keys.normal_mode["<Right>"] = "<Nop>"
lvim.keys.normal_mode["<Leader>vs"] = "<Cmd>lua ReloadConfig()<CR>"
lvim.keys.normal_mode["<Leader>m"] = "<Cmd>:Glow <CR>"

-- copy filename / paths to clipboard
lvim.keys.normal_mode["<C-c>"] = ":let @*=expand('%')<CR>"
lvim.keys.normal_mode["<C-x>"] = ":let @*=expand('%:p')<CR>"

-- tmux copy
vim.cmd[[:let g:oscyank_term = 'tmux']]

-- Lvim builtins
lvim.builtin.alpha.active = false
lvim.builtin.dap.active = false
lvim.builtin.gitsigns.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = false
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.bufferline.options.diagnostics_indicator = false
lvim.builtin.bufferline.options.custom_filter = false

-- Lualine
local function full_path()
  return vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')
end

lvim.builtin.lualine.options.theme = "gruvbox"
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "filename", "branch", "python_env" }
lvim.builtin.lualine.sections.lualine_c = { full_path }
lvim.builtin.lualine.sections.lualine_x = {}
lvim.builtin.lualine.sections.lualine_y = { "lsp", "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "progress" }

-- treesitter
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  -- "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  -- "rust",
  -- "java",
  "yaml",
}

-- generic LSP settings
lvim.lsp.automatic_servers_installation = true
lvim.lsp.diagnostics.virtual_text = { spacing = 4, prefix = "■" }
-- lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.underline = false
vim.cmd[[
:hi DiagnosticError guifg=#88088F
:hi DiagnosticWarn guifg=DarkOrange
:hi DiagnosticInfo guifg=Blue
:hi DiagnosticHint guifg=Green
]]

-- barium
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

if not configs.barium then
    configs.barium = {
        default_config = {
            cmd = {'barium'};
            filetypes = {'brazil-config'};
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname)
            end;
            settings = {};
        };
    }
end

lspconfig.barium.setup {}

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  -- {
  --   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "prettier",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--print-with", "100" },
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
  -- {
  --   -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --   command = "shellcheck",
  --   ---@usage arguments to pass to the formatter
  --   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --   extra_args = { "--severity", "warning" },
  -- },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python" },
  -- },
}

-- Additional Plugins
lvim.plugins = {
  {"tpope/vim-surround"},
  {"tpope/vim-repeat"},
  {
    "ethanholz/nvim-lastplace",
    config = function ()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
        "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
        })
    end,
  },
  -- {
  --   'Pocco81/AutoSave.nvim',
  --   config = function()
  --     require("autosave").setup()
  --   end,
  -- },
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   config = function()
  --     require("indent_blankline").setup {
  --       indentLine_enabled = 1,
  --       char = "▏",
  --       filetype_exclude = {
  --         "help",
  --         "terminal",
  --         "dashboard",
  --         "alpha",
  --         "packer",
  --         "lspinfo",
  --         "TelescopePrompt",
  --         "TelescopeResults",
  --         "startify",
  --         "",
  --       },
  --       buftype_exclude = { "terminal" },
  --       show_trailing_blankline_indent = false,
  --       show_first_indent_level = false,
  --     }
  --   end,
  -- },
  -- {
  --   "npxbr/glow.nvim",
  --   ft = {"markdown"}
  -- },
  -- {
  --   "wakatime/vim-wakatime"
  -- },
  {
    "joshdick/onedark.vim"
  },
  {
    "folke/tokyonight.nvim"
  },
  {
    "gruvbox-community/gruvbox"
  },
  {
    "lifepillar/vim-gruvbox8"
  },
  {
    "chriskempson/base16-vim"
  },
  {
    "arcticicestudio/nord-vim"
  },
  {
    "ojroques/vim-oscyank",
  },
  {
    "ellisonleao/glow.nvim"
  },
}

