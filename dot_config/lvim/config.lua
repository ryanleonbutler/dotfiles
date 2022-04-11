--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = false -- highlight the current line
-- vim.opt.wrap = true

-- colorscheme
lvim.colorscheme = "onedarker"
lvim.transparent_window = true

-- Spell check
lvim.keys.normal_mode["<leader>ss"] = ":setlocal spell spelllang=en<CR>"

-- nvim tree
lvim.nvim_tree_hide_dotfiles = 0

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- easy save
lvim.keys.normal_mode["<leader>w"] = ":w<cr>"

-- easy quit
lvim.keys.normal_mode["<leader>q"] = ":q<cr>"
lvim.keys.normal_mode["<leader>c"] = ":bd<cr>"

-- Unix command line navigation
lvim.keys.normal_mode["<C-q>"] = ":qa<cr>"
lvim.keys.normal_mode["<C-e>"] = "<END>"
lvim.keys.normal_mode["<C-a>"] = "<HOME>"
lvim.keys.insert_mode["<C-e>"] = "<END>"
lvim.keys.insert_mode["<C-a>"] = "<HOME>"

-- Tab navigation
lvim.keys.normal_mode["<TAB>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":bprevious<CR>"

-- Ranger
lvim.keys.normal_mode["<leader>r"] = ":RnvimrToggle<CR>"

-- Glow
lvim.keys.normal_mode["<leader>m"] = ":Glow<CR>"

-- unmap a default keymapping
lvim.keys.normal_mode["q"] = ""
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)
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

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
}

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
lvim.plugins = {
  {"tpope/vim-surround"},
  {"tpope/vim-repeat"},
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
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
  {
    'Pocco81/AutoSave.nvim',
    config = function()
      require("autosave").setup()
    end,
  },
  -- {
  --   'kevinhwang91/rnvimr',
  --   config = function ()
  --     vim.cmd[[let g:rnvimr_enable_picker = 1]]
  --   end
  -- },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        indentLine_enabled = 1,
        char = "▏",
        filetype_exclude = {
          "help",
          "terminal",
          "dashboard",
          "alpha",
          "packer",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "startify",
          "",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
      }
    end,
  },
  -- {
  --   "folke/todo-comments.nvim",
  --   config = function ()
  --     require("todo-comments").setup {
  --       signs = true, -- show icons in the signs column
  --       sign_priority = 8, -- sign priority
  --       -- keywords recognized as todo comments
  --       keywords = {
  --         FIX = {
  --           icon = " ", -- icon used for the sign, and in search results
  --           color = "error", -- can be a hex color, or a named color (see below)
  --           alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
  --           -- signs = false, -- configure signs for some keywords individually
  --         },
  --         TODO = { icon = " ", color = "info" },
  --         HACK = { icon = " ", color = "warning" },
  --         WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
  --         PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
  --         NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  --       },
  --       merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  --       -- highlighting of the line containing the todo comment
  --       -- * before: highlights before the keyword (typically omment characters)
  --       -- * keyword: highlights of the keyword
  --       -- * after: highlights after the keyword (todo text)
  --       highlight = {
  --         before = "", -- "fg" or "bg" or empty
  --         keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
  --         after = "fg", -- "fg" or "bg" or empty
  --         pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
  --         comments_only = true, -- uses treesitter to match keywords in comments only
  --         max_line_len = 400, -- ignore lines longer than this
  --         exclude = {}, -- list of file types to exclude highlighting
  --       },
  --       -- list of named colors where we try to extract the guifg from the
  --       -- list of hilight groups or use the hex color if hl not found as a fallback
  --       colors = {
  --         error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
  --         warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
  --         info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
  --         hint = { "LspDiagnosticsDefaultHint", "#10B981" },
  --         default = { "Identifier", "#7C3AED" },
  --       },
  --       search = {
  --         command = "rg",
  --         args = {
  --           "--color=never",
  --           "--no-heading",
  --           "--with-filename",
  --           "--line-number",
  --           "--column",
  --         },
  --         -- regex that will be used to match keywords.
  --         -- don't replace the (KEYWORDS) placeholder
  --         pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  --         -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  --       },
  --     }
  --   end
  -- },
  -- {
  --   "sindrets/diffview.nvim",
  --   event = "BufRead",
  -- },
  -- {
  --   "f-person/git-blame.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.cmd "highlight default link gitblame SpecialComment"
  --     vim.g.gitblame_enabled = 0
  --   end,
  -- },
  -- {
  --   "tpope/vim-fugitive",
  --   cmd = {
  --     "G",
  --     "Git",
  --     "Gdiffsplit",
  --     "Gread",
  --     "Gwrite",
  --     "Ggrep",
  --     "GMove",
  --     "GDelete",
  --     "GBrowse",
  --     "GRemove",
  --     "GRename",
  --     "Glgrep",
  --     "Gedit"
  -- },
  --   ft = {"fugitive"}
  -- },
  -- {
  --   "p00f/nvim-ts-rainbow",
  -- },
  -- {
  --   "nvim-telescope/telescope-project.nvim",
  --   event = "BufWinEnter",
  --   setup = function()
  --     vim.cmd [[packadd telescope.nvim]]
  --   end,
  -- },
  -- {
  --   "folke/lsp-colors.nvim",
  --   event = "BufRead",
  -- },
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --     config = function()
  --       require("colorizer").setup({ "*" }, {
  --           RGB = true, -- #RGB hex codes
  --           RRGGBB = true, -- #RRGGBB hex codes
  --           RRGGBBAA = true, -- #RRGGBBAA hex codes
  --           rgb_fn = true, -- CSS rgb() and rgba() functions
  --           hsl_fn = true, -- CSS hsl() and hsla() functions
  --           css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  --           css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  --           })
  --   end,
  -- },
  -- {
  --   "ahmedkhalf/lsp-rooter.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp-rooter").setup()
  --   end,
  -- },
  -- {
  --   "vim-test/vim-test",
  --   config = function()
  --       vim.cmd [[
  --           function! ToggleTermStrategy(cmd) abort
  --               call luaeval("require('toggleterm').exec(_A[1])", [a:cmd])
  --           endfunction
  --           let g:test#custom_strategies = {'toggleterm': function('ToggleTermStrategy')}
  --       ]]
  --       vim.g["test#strategy"] = "toggleterm"
  --   end,
  -- },
  -- {
  --   "npxbr/glow.nvim",
  --   ft = {"markdown"}
  -- },
  {
    'wakatime/vim-wakatime'
  },
  {
    "lunarvim/colorschemes"
  },
  -- {
  --   'dracula/vim'
  -- },
  -- {
  --   'folke/tokyonight.nvim'
  -- },
  -- {
  --   "arcticicestudio/nord-vim"
  -- },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
