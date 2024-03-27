return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        local ui = require("harpoon.ui")
        local mark = require("harpoon.mark")

        local wk = require("which-key")
        wk.register({

            -- File / Telescope
            ["<leader>f"] = { name = "+file" },
            ["<leader>fo"] = {
                "<cmd>Telescope oldfiles<cr>",
                "Find Recently Opened Files",
            },
            ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
            ["<leader>fg"] = {
                "<cmd>Telescope live_grep<cr>",
                "Live Grep",
            },
            ["<leader>fc"] = {
                "<cmd>Telescope commands<cr>",
                "Find Command",
            },
            ["<leader>fd"] = {
                "<cmd>Telescope diagnostics<cr>",
                "Find Diagnostics",
            },
            ["<leader>fh"] = {
                "<cmd>Telescope help_tags<cr>",
                "Find Help Tags",
            },
            ["<leader>fj"] = {
                "<cmd>Telescope jumplist<cr>",
                "Find Jumplist",
            },
            ["<leader>fk"] = {
                "<cmd>Telescope keymaps<cr>",
                "Find Keymaps",
            },
            ["<leader>fw"] = {
                "<cmd>Telescope grep_string<cr>",
                "Find Word",
            },
            ["<leader>fb"] = {
                "<cmd>Telescope buffers<cr>",
                "Find Buffers",
            },
            ["<leader>fr"] = {
                ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
                "Find and Replace",
            },

            -- harpoon / marks
            ["<leader>m"] = {
                mark.toggle_file,
                "Mark File",
            },
            ["<leader>mt"] = {
                ui.toggle_quick_menu,
                "Harpoon Toggle",
            },
            ["<leader>mn"] = {
                ui.nav_next,
                "Mark Next",
            },

            -- Undotree
            ["<leader>u"] = {
                "<cmd>UndotreeToggle<cr>",
                "UndotreeToggle",
            },

            -- Create New file
            ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },

            -- Netrw
            ["<leader>e"] = { "<cmd>Ex<cr>", "Netrw Ex" },

            -- Git
            ["<leader>gw"] = {
                "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
                "List Git Worktrees",
            },
            ["<leader>gW"] = {
                "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
                "Create Git Worktree",
            },
            ["<leader>g"] = { name = "+git" },
            ["<leader>gb"] = {
                "<cmd>Gitsigns toggle_current_line_blame<cr>",
                "Git Blame Toggle",
            },
            ["<leader>gp"] = {
                "<cmd>Gitsigns preview_hunk<cr>",
                "Preview Hunk",
            },
            ["<leader>gs"] = {
                "<cmd>Neogit<cr>",
                "Git Status",
            },
            ["<leader>gy"] = {
                "<cmd>brazil.display_package_under_cursor_url<cr>",
                "Display URL for Package under Cursor",
            },

            -- Diagnostics
            ["<S-d>"] = {
                "<cmd>lua vim.diagnostic.open_float()<cr>",
                "Show Diagnostic",
            },

            -- Terminal
            ["<leader>t"] = { name = "+terminal" },
            ["<leader>ts"] = { "<cmd>silent !tmux neww tmux-sessionizer<cr>", "Tmux Sessionizer" },
            ["<C-t>"] = {
                '<cmd>lua require("FTerm").toggle()<cr>',
                "Terminal Toggle",
            },

            -- Trouble
            [";"] = { name = "+trouble" },
            [";x"] = {
                '<cmd>lua require("trouble").toggle()<cr>',
                "Trouble Toggle",
            },
            [";w"] = {
                '<cmd>lua require("trouble").toggle("workspace_diagnostics")<cr>',
                "Trouble WS Diagnostics",
            },
            [";d"] = {
                '<cmd>lua require("trouble").toggle("document_diagnostics")<cr>',
                "Trouble Doc Diagnostics",
            },
            [";q"] = {
                '<cmd>lua require("trouble").toggle("quickfix")<cr>',
                "Trouble Quickfix",
            },
            [";l"] = {
                '<cmd>lua require("trouble").toggle("quickfix")<cr>',
                "Trouble loclist",
            },
            ["gR"] = {
                '<cmd>lua require("trouble").toggle("lsp_references")<cr>',
                "Trouble lsp_references",
            },

            -- ZenMode
            ["<leader>z"] = { "<cmd>ZenMode<cr>", "ZenMode" },

            -- Yanking
            ["<leader>y"] = { name = "+yank" },
            ["<leader>yr"] = {
                "<cmd>lua YankRelativePathToOsc()<cr>",
                "Yank relative file path",
            },
            ["<leader>yf"] = {
                "<cmd>lua YankFullPathToOsc()<cr>",
                "Yank full file path",
            },

            -- Scrathces
            ["<leader>s"] = { name = "+scratch" },
            ["<leader>ss"] = { "<cmd>Scratch<cr>" },
            ["<leader>so"] = { "<cmd>ScratchOpen<cr>" },
        })
    end,
    opts = {
        plugins = {
            marks = false, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = false, -- adds help for operators like d, y, ...
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false, -- default bindings on <c-w>
                nav = false, -- misc bindings to work with windows
                z = false, -- bindings for folds, spelling and others prefixed with z
                g = false, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        key_labels = {
            -- override the label used to display some keys. It doesn't effect WK in any other way.
            -- For example:
            -- ["<space>"] = "SPC",
            -- ["<cr>"] = "RET",
            -- ["<tab>"] = "TAB",
        },
        motions = {
            count = true,
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        popup_mappings = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>", -- binding to scroll up inside the popup
        },
        window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
            padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            zindex = 1000, -- positive value to position WhichKey above other floating windows.
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = {
            -- "<silent>",
            "<cmd>",
            "<Cmd>",
            "<CR>",
            "^:",
            "^ ",
            "^call ",
            "^lua ",
        }, -- hide mapping boilerplate
        -- show_help = true, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specifiy a list manually
        -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
        triggers_nowait = {
            -- marks
            "`",
            "'",
            "g`",
            "g'",
            -- registers
            '"',
            "<c-r>",
            -- spelling
            "z=",
        },
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for keymaps that start with a native binding
            i = { "j", "k" },
            v = { "j", "k" },
        },
        -- disable the WhichKey popup for certain buf types and file types.
        -- Disabled by default for Telescope
        disable = {
            buftypes = {},
            filetypes = {},
        },
    }, -- refer to the configuration section below
}
