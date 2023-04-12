-- ==============================================================================================================ini
-- [[ My Config ]]
-- ==============================================================================================================

-- ==============================================================================================================
-- [[ globals ]]

local set = vim.opt
local g = vim.g
local cmd = vim.cmd
local function map(m, k, v, desc)
    if desc then
        desc = "Desc: " .. desc
    end
    vim.keymap.set(m, k, v, { silent = true }, { desc = desc })
end

-- ==============================================================================================================
-- [[ Lazy ]]

g.mapleader = " "
g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ==============================================================================================================
-- [[ Plugins ]]

require("lazy").setup({
    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",

    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional
            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    },
    -- Formatting and linting
    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    },
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
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
        -- Theme
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = "day", -- The theme is used when the background is set to light
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "transparent", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                on_colors = function(colors) end,
                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                on_highlights = function(highlights, colors) end,
            })
            cmd.colorscheme("tokyonight-night")
        end,
    },
    {
        -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
                theme = "tokyonight",
                component_separators = "|",
                section_separators = "",
            },
        },
    },
    -- {
    --     -- Add indentation guides even on blank lines
    --     "lukas-reineke/indent-blankline.nvim",
    --     opts = {
    --         char = "┊",
    --         show_trailing_blankline_indent = false,
    --     },
    -- },
    -- "gc" to comment visual regions/lines
    { "numToStr/Comment.nvim", opts = {} },
    -- Fuzzy Finder (files, lsp, etc)
    { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
        end,
    },
    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "git_config",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "markdown",
                "markdown_inline",
                "vimdoc",
                "lua",
                "yaml",
                "bash",
                "python",
                "rust",
                "go",
                "bash",
            },
            highlight = {
                enable = true,
                disable = { "lua" },
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<tab>",
                    node_decremental = "<s-tab>",
                    scope_incremental = "<cr>",
                },
            },
            autotag = {
                enable = true,
            },
            matchup = {
                enable = true,
            },
        },
        config = function(plugin, opts)
            require("nvim-treesitter.configs").setup(opts)
            require("treesitter-context").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup()
        end,
    },
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

    -- { import = 'custom.plugins' },
}, {})

-- ==============================================================================================================
-- [[ Options ]]

-- colorcolumn
set.colorcolumn = "88"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555555" })

-- Make line numbers default
set.number = true
set.rnu = true

-- Enable mouse mode
-- set.mouse = 'a'

-- Sync clipboard between OS and Neovim.
set.clipboard = ""

-- Enable break indent
set.breakindent = true

-- Save undo history
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.smartindent = true
-- Set highlight on search
set.hlsearch = false

-- Keep signcolumn on by default
set.signcolumn = "yes"

-- Decrease update time
set.updatetime = 50
set.timeout = true
set.timeoutlen = 300

-- Set completeopt to have a better completion experience
set.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
set.termguicolors = true

-- always show tabs
set.showtabline = 2

-- auto load files
set.autoread = true

-- creates a backup file
set.backup = false
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program)
set.swapfile = false -- creates a swapfile

-- more space in the neovim command line for displaying messages
set.cmdheight = 1

-- so that `` is visible in markdown files
set.conceallevel = 0

-- highlight the current line
set.cursorline = true

-- Netrw
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- Other
set.errorbells = false
set.expandtab = true -- convert tabs to spaces
set.fileencoding = "utf-8" -- the encoding written to a file
set.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
set.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
set.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
set.hidden = true -- required to keep multiple buffers and open multiple buffers
set.pumheight = 10 -- pop up menu height
set.scrolloff = 8 -- is one of my fav
set.shiftwidth = 4 -- the number of spaces inserted for each indentation
set.showmode = true -- we don't need to see things like -- INSERT -- anymore
set.sidescrolloff = 8
set.spell = false
set.spelllang = "en"
set.splitbelow = true -- force all horizontal splits to go below current window
set.splitright = true -- force all vertical splits to go to the right of current window
set.softtabstop = 4
set.tabstop = 4 -- insert 4 spaces for a tab
set.title = true -- set the title of window to the value of the titlestring
set.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
set.wrap = false -- display lines as one long line

-- ==============================================================================================================
-- [[ Basic Keymaps ]]

-- -- disable Q
map("n", "Q", "<nop>")
-- Netrw
map("n", "<leader>e", vim.cmd.Ex)
-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")
-- Save/CloseBuffer/Quit/Escape/SourceConfig
map("n", "<leader>w", ":w <CR>")
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-q>", ":qa! <CR>")
map("i", "jk", "<ESC>")
map("n", "<leader>r", ":so %<CR>")
-- Clear highlight
map("n", "<leader>h", ":nohl<CR>")
-- keep more or less same place for jumps
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Move a line up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
-- keep last copy in paste buffer and overwrite the highlight
map("x", "<leader>p", '"_dp')
-- map("n", "<leader>d", "\"_dp")
-- map("v", "<leader>d", "\"_dp")
-- Access system clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
-- format
map("n", "<C-f>", function()
    vim.lsp.buf.format()
end)
-- tmux
map("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Find and replace
map("n", "<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- Toggle blame
map("n", "<leader>gb", ":GitBlameToggle<CR>")
-- Unix like terminal nav
map("n", "<C-e>", "<END>")
map("n", "<C-a>", "<HOME>")
map("v", "<C-e>", "<END>")
map("v", "<C-a>", "<HOME>")
map("i", "<C-e>", "<END>")
map("i", "<C-a>", "<HOME>")
map("x", "<C-e>", "<END>")
map("x", "<C-a>", "<HOME>")
-- Gotta have the TAB's to nav buffers
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprevious<CR>")
-- Walking the splits
map("n", "<C-k>", ":wincmd k<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-l>", ":wincmd l<CR>")
-- Copy file paths
vim.api.nvim_command([[
    function! YankFullPathToOsc()
        let @+ = expand('%:p')
        OSCYankRegister +
    endfunction
    function! YankRelativePathToOsc()
        let @+ = expand('%:.')
        OSCYankRegister +
    endfunction
]])
map("n", "<leader>yr", ":call YankRelativePathToOsc()<CR>")
map("n", "<leader>yf", ":call YankFullPathToOsc()<CR>")

-- ==============================================================================================================
-- [[ Autocmd's ]]

-- [[ Yank through ssh/tmux whatever... ]]
local function copy()
    if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
        require("osc52").copy_register("+")
    end
end
vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })

-- [[ Highlight on yank ]]
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 100,
        })
    end,
})

-- ==============================================================================================================
-- [[ Configure Telescope ]]

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- ==============================================================================================================
-- [[ Configure Treesitter ]]

require("nvim-treesitter.configs").setup({
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "tsx", "typescript", "vimdoc", "vim", "bash" },
    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<M-space>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
})

-- ==============================================================================================================
-- [[ Configure LSP ]]

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP settings.
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.set_preferences({
    sign_icons = {},
})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = true,
})

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local bind = vim.keymap.set

    bind("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    bind("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    bind("n", "K", vim.lsp.buf.hover, opts)
    bind("n", "gi", vim.lsp.buf.implementation, opts)
    bind("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    bind("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    bind("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    bind("n", "F", vim.lsp.buf.type_definition, opts)
    bind("n", "D", vim.diagnostic.open_float, opts)
    bind("n", "[d", vim.diagnostic.goto_prev, opts)
    bind("n", "]d", vim.diagnostic.goto_next, opts)
    bind("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
    end, opts)
    bind("n", "<leader>vrr", function()
        vim.lsp.buf.references()
    end, opts)
    bind("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, opts)

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
    bind("n", "<C-f>", "<cmd>Format<CR>", opts)
end

local servers = {
    bashls = {},
    jsonls = {},
    html = {},
    cssls = {},
    tailwindcss = {},
    clangd = {},
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
    eslint = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
    -- gopls = {},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        })
    end,
})

-- ==============================================================================================================
-- [[ nvim-cmp setup ]]
local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup({})
luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
luasnip.filetype_extend("javascript", { "javascriptreact" })
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
    paths = { "./snippets" },
})

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 1 },
        {
            name = "buffer",
            keyword_length = 1,
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
        { name = "luasnip", keyword_length = 1 },
    },
})

-- ==============================================================================================================
-- [[ null-ls setup ]]

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
    end,
    sources = {
        formatting.trim_whitespace,
        formatting.trim_newlines,

        -- https://github.com/JohnnyMorganz/StyLua#options
        formatting.stylua.with({
            extra_args = {
                "--indent-type",
                "spaces",
                "--indent-width",
                "4",
                "--column-width",
                "119",
                "--quote-style",
                "AutoPreferDouble",
            },
        }),

        -- Prettier: Javascript, TypeScript, CSS, JSON, HTML, Yaml, Markdown
        formatting.prettier.with({
            extra_args = {
                "--double-quote",
                "--jsx-single-quote",
                "--print-width",
                "119",
            },
        }),
        diagnostics.eslint,

        -- Python
        formatting.black.with({}),
        formatting.isort.with({}),
        -- ruff: Python
        -- formatting.ruff.with({
        --     extra_args = {
        --         "--line-length",
        --         "119",
        --         "--fix"
        --     },
        -- }),

        -- https://pycodestyle.pycqa.org/en/latest/intro.html#error-codes
        diagnostics.ruff.with({
            extra_args = {
                "--line-length",
                "119",
                "--max-complexity",
                "10",
                "--ignore",
                "W391", -- blank line at end of file
            },
        }),
    },
})

-- ==============================================================================================================
-- [[ harpoon setup ]]

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
map("n", "<leader>m", mark.toggle_file)
map("n", "<leader>,", ui.toggle_quick_menu)

-- ==============================================================================================================

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
