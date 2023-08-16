-- ==============================================================================================================
-- [[ My Config ]]
-- ==============================================================================================================

-- ==============================================================================================================
-- [[ Globals ]]

local set = vim.opt
local g = vim.g
local function map(m, k, v, desc)
    if desc then
        desc = "Desc: " .. desc
    end
    vim.keymap.set(m, k, v, { silent = true, remap = true }, { desc = desc })
end

-- git blame
vim.g.gitblame_enabled = 0

-- ==============================================================================================================
-- [[ Package Manager ]]

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
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },
    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-emoji" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            -- { "nvimdev/lspsaga.nvim" },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        -- config = function()
        --     require("null-ls.config") -- require your null-ls config here (example below)
        -- end,
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp-signature-help",
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
        },
    },
    -- Neovim plugin dev
    {
        "folke/neodev.nvim",
        dependencies = { "hrsh7th/nvim-cmp" },
    },
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = "VeryLazy",
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
    -- Theme
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = {
                    -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true,
                show_end_of_buffer = true, -- show the '~' characters after the end of buffers
                term_colors = false,
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.15,
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                color_overrides = {},
                custom_highlights = {},
                integrations = {
                    alpha = false,
                    cmp = true,
                    flash = false,
                    gitsigns = true,
                    illuminate = true,
                    indent_blankline = { enabled = true },
                    lsp_trouble = true,
                    mason = true,
                    mini = false,
                    native_lsp = {
                        enabled = true,
                        underlines = {
                            errors = { "undercurl" },
                            hints = { "undercurl" },
                            warnings = { "undercurl" },
                            information = { "undercurl" },
                        },
                    },
                    navic = { enabled = false, custom_bg = "lualine" },
                    neotest = false,
                    noice = false,
                    notify = false,
                    neotree = false,
                    semantic_tokens = true,
                    telescope = true,
                    treesitter = true,
                    which_key = false,
                },
            })
        end,
    },
    -- Add indentation guides even on blank lines
    {
        "lukas-reineke/indent-blankline.nvim",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        opts = {
            char = "┊",
            show_trailing_blankline_indent = false,
        },
    },
    -- Set statusline
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
                theme = "catppuccin",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                },
            },
        },
        extensions = {
            "fugitive",
            "nvim-dap-ui",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
    -- "gc" to comment visual regions/lines
    { "tpope/vim-commentary" },
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
                -- disable = { "lua" },
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
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    -- Other plugins
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
    -- Debugging
    {
        "mfussenegger/nvim-dap",
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.after.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    -- Zen mode
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                -- :ZenMode
                window = {
                    backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    -- height and width can be:
                    -- * an absolute number of cells when > 1
                    -- * a percentage of the width / height of the editor when <= 1
                    -- * a function that returns the width or the height
                    width = 130, -- width of the Zen window
                    height = 1, -- height of the Zen window
                    -- by default, no options are changed for the Zen window
                    -- uncomment any of the options below, or add other vim.wo options you want to apply
                    options = {
                        signcolumn = "no", -- disable signcolumn
                        number = false, -- disable number column
                        relativenumber = false, -- disable relative numbers
                        cursorline = false, -- disable cursorline
                        cursorcolumn = false, -- disable cursor column
                        foldcolumn = "0", -- disable fold column
                        list = false, -- disable whitespace characters
                    },
                },
                plugins = {
                    options = {
                        enabled = true,
                        ruler = false, -- disables the ruler text in the cmd line area
                        showcmd = false, -- disables the command in the last line of the screen
                    },
                    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                    gitsigns = { enabled = true }, -- disables git signs
                    tmux = { enabled = true }, -- disables the tmux statusline
                    alacritty = {
                        enabled = true,
                        font = "20", -- font size
                    },
                },
                -- callback where you can add custom code when the Zen window opens
                on_open = function(win) end,
                -- callback where you can add custom code when the Zen window closes
                on_close = function() end,
            })
        end,
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "f-person/git-blame.nvim",
    },
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")

            -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })
        end,
        keys = {
            { "]]", desc = "Next Reference" },
            { "[[", desc = "Prev Reference" },
        },
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
            { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
            { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
            {
                "[q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").previous({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cprev)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Previous trouble/quickfix item",
            },
            {
                "]q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").next({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cnext)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Next trouble/quickfix item",
            },
        },
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
            size = 10,
            on_create = function()
                vim.opt.foldcolumn = "0"
                vim.opt.signcolumn = "no"
            end,
            open_mapping = [[<F7>]],
            shading_factor = 2,
            direction = "float",
            float_opts = {
                border = "curved",
                highlights = { border = "Normal", background = "Normal" },
            },
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
    -- code suggestions
    {
        dir = "~/workspace/codewhisperer-nvim/src/AmazonCodeWhispererVimPlugin",
        name = "codewhisperer",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
        },
    },
    -- {
    -- 	"https://git.amazon.com/pkg/AmazonCodeWhispererVimPlugin",
    -- 	branch = "nvim",
    -- 	name = "codewhisperer",
    -- 	build =
    -- 	[[cat ~/.local/share/nvim/lazy/codewhisperer/service-2.json | jq '.metadata += {"serviceId":"codewhisperer"}' | tee /tmp/aws-coral-model.json && aws configure add-model --service-model file:///tmp/aws-coral-model.json --service-name codewhisperer]],
    -- }
    -- { import = 'custom.plugins' },
}, {})

-- ==============================================================================================================
-- [[ Options ]]

-- colorcolumn
set.colorcolumn = "119"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555555" })

-- Make line numbers default
set.number = true
set.rnu = true

-- Disable mouse
set.mouse = ""

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
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
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

-- Netrw
map("n", "<leader>e", vim.cmd.Ex)
-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")
-- Save/CloseBuffer/Quit/Escape
map("n", "<leader>w", ":w! <CR>")
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-q>", ":qa! <CR>")
map("i", "jk", "<ESC>")
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
-- tmux navigate
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
-- Copy file paths
function YankFullPathToOsc()
    local file_path = vim.fn.expand("%:p")
    vim.fn.setreg("+", file_path)
    require("osc52").copy_register("+")
end

function YankRelativePathToOsc()
    local file_path = vim.fn.expand("%:.")
    vim.fn.setreg("+", file_path)
    require("osc52").copy_register("+")
end

map("n", "<leader>yr", ":lua YankRelativePathToOsc()<CR>")
map("n", "<leader>yf", ":lua YankFullPathToOsc()<CR>")
map("n", "<leader>z", ":ZenMode<CR>")
map("n", "<leader>M", ":Glow<CR>")

-- ==============================================================================================================
-- [[ Autocmd's ]]
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Yank through ssh/tmux whatever...
local function copy()
    if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
        require("osc52").copy_register("+")
    end
end
vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })

-- Highlight on yank
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

-- Set width and wrap on Markdown files
autocmd("BufNew", {
    group = augroup("FormatMarkdown", { clear = false }),
    pattern = "markdown",
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "markdown" then
            set.wrap = true
            set.textwidth = 100
        end
    end,
})
autocmd("BufWritePre", {
    group = augroup("FormatMarkdown", { clear = false }),
    pattern = "markdown",
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "markdown" then
            set.wrap = true
            set.textwidth = 100
        end
    end,
})

-- Disable autocomment
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "*",
    callback = function()
        set.formatoptions:remove({ "o", "r" })
    end,
})

-- ==============================================================================================================
-- [[ Configure Telescope ]]
local telescope_dropdown_theme = require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
})

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
        pickers = {},
    },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
map("n", "<leader>?", require("telescope.builtin").oldfiles, "[?] Find recently opened files")
vim.keymap.set(
    "n",
    "<leader><space>",
    require("telescope.builtin").buffers,
    { desc = "[<space>] Find existing buffers" }
)
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(telescope_dropdown_theme)
end, { desc = "[/] Fuzzy search current buffer" })

map("n", "<leader>ff", require("telescope.builtin").find_files, "[f]ind [f]iles")
map("n", "<leader>fh", require("telescope.builtin").help_tags, "[f]ind [h]elp")
map("n", "<leader>fw", require("telescope.builtin").grep_string, "[f]ind [w]ord")
map("n", "<leader>fg", require("telescope.builtin").live_grep, "[f]ind [g]rep")
map("n", "<leader>fd", require("telescope.builtin").diagnostics, "[f]ind [d]iagnostics")
map("n", "<leader>fr", require("telescope.builtin").registers, "[f]ind [r]egisters")
map("n", "<leader>fk", require("telescope.builtin").keymaps, "[f]ind [k]eymaps")
map("n", "<leader>fj", require("telescope.builtin").jumplist, "[f]ind [j]umplist")
map({ "n", "v" }, "<leader>fc", require("telescope.builtin").commands, "[f]ind [c]ommands")

-- ==============================================================================================================
-- [[ Configure Treesitter ]]
require("nvim-treesitter.configs").setup({
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { "c", "cpp", "rust", "go", "lua", "python", "tsx", "typescript", "vimdoc", "vim", "bash" },
    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        -- disable = function(lang, bufnr) -- Disable in large C++ buffers
        --     return api.nvim_buf_line_count(bufnr) > 50000
        -- end,
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

-- LSP settings
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.set_preferences({
    sign_icons = {},
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = true,
})

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gr", function()
        require("telescope.builtin").lsp_references(telescope_dropdown_theme)
    end, opts, { desc = "[G]oto [R]eferences" })
    vim.keymap.set("n", "gd", function()
        require("telescope.builtin").lsp_definitions(telescope_dropdown_theme)
    end, opts({ desc = "[G]oto [D]efinitions" }))
    vim.keymap.set("n", "gt", function()
        require("telescope.builtin").lsp_type_definitions(telescope_dropdown_theme)
    end, opts, { desc = "[G]oto [T]ype Definitions" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts, { desc = "[G]oto [I]mplementation" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "LSP Hover" })
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts, { desc = "[[]Next [d]iagnostic" })
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts, { desc = "[]]Previous [d]iagnostic" })
    -- vim.keymap.set("n", "<leader>vca", function()
    --     vim.lsp.buf.code_action()
    -- end, "[<leader>][v] [c]ode [a]ction")
    -- vim.keymap.set("n", "<leader>vrn", function()
    --     vim.lsp.buf.rename()
    -- end, "[<leader>][v] [r]e[n]ame")

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
    vim.keymap.set("n", "<C-f>", "<cmd>Format<CR>", opts)
end

local servers = {
    bashls = {},
    jsonls = {},
    html = {},
    cssls = {},
    tailwindcss = {},
    clangd = {},
    pyright = {},
    tsserver = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup()
require("mason-null-ls").setup({
    automatic_setup = true,
    ensure_installed = { "stylua", "jq", "ruff", "black", "isort", "mypy", "debugpy", "eslint", "prettier" },
})

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
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "nvim_lsp_signature_help" },
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
        { name = "path" },
        { name = "emoji" },
    },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- ==============================================================================================================
-- [[ null-ls setup ]]
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
    -- debug = true,
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
            extra_args = {},
        }),
        diagnostics.eslint,

        -- Python
        formatting.black.with({}),
        formatting.isort.with({}),
        diagnostics.mypy.with({}),
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
-- [[ nvim-dap setup ]]
map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<F10>", ":lua require'dap'.step_over()<CR>")
map("n", "<F11>", ":lua require'dap'.step_into()<CR>")
map("n", "<F12>", ":lua require'dap'.step_out()<CR>")
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<leader>dpr", ":lua require'dap-python'.test_method()<CR>")
-- ==============================================================================================================
-- [[ nvim-autopairs setup ]]
require("nvim-autopairs").remove_rule("'")
require("nvim-autopairs").remove_rule('"')
require("nvim-autopairs").remove_rule("`")
-- ==============================================================================================================
g.loaded_codewhisperer_plugin = 1
g.cw_debugging = true
map({ "n", "i" }, "<C-w>", ":CWGenerateNvim<CR>")
vim.g.aws_profile = "Isen_Admin"
-- ==============================================================================================================
vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, { noremap = false, expr = true })
-- ==============================================================================================================
vim.cmd.colorscheme("catppuccin-mocha")
-- ==============================================================================================================
