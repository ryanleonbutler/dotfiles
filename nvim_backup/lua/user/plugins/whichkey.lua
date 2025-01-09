return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
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
        ["<leader>fm"] = {
            "<cmd>Telescope marks<cr>",
            "Telescope marks",
        },
        ["<leader>fr"] = {
            ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
            "Find and Replace",
        },

        -- Undotree
        ["<leader>u"] = {
            "<cmd>UndotreeToggle<cr>",
            "Undotree Toggle",
        },

        -- Create New file
        ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },

        -- Netrw
        ["<leader>e"] = { "<cmd>Ex<cr>", "Netrw Ex" },

        -- Oil
        ["-"] = { "<cmd>Oil<cr>", "Open parent directory" },

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
        ["<C-t>"] = {
            '<cmd>lua require("FTerm").toggle()<cr>',
            "Terminal Toggle",
        },

        -- AI Prompt
        ["<leader>ai"] = {
            "<cmd>ProomptExplain<cr>",
            "AI Prompt",
        },

        -- Tests
        ["<leader>t"] = { name = "+test" },
        ["<leader>tn"] = { "<cmd>TestNearest<CR>" },
        ["<leader>tf"] = { "<cmd>TestFile<CR>" },
        ["<leader>ts"] = { "<cmd>TestSuite<CR>" },
        ["<leader>tl"] = { "<cmd>TestLast<CR>" },
        ["<leader>tv"] = { "<cmd>TestVisit<CR>" },

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

        -- Debugging
        ["<leader>d"] = { name = "+debugging" },
        ["<leader>dC"] = {
            "<cmd>lua require'dap'.run_to_cursor()<cr>",
            "Run To Cursor",
        },
        ["<leader>dd"] = {
            "<cmd>lua require'dap'.disconnect()<cr>",
            "Disconnect",
        },
        ["<leader>dg"] = {
            "<cmd>lua require'dap'.session()<cr>",
            "Get Session",
        },
        ["<leader>dp"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
        ["<leader>db"] = {
            "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
            "Toggle Breakpoint",
        },
        ["<F1>"] = {
            "<cmd>lua require'dap'.continue()<cr>",
            "Continue",
        },
        ["<F2>"] = {
            "<cmd>lua require'dap'.step_into()<cr>",
            "Step Into",
        },
        ["<F3>"] = {
            "<cmd>lua require'dap'.step_over()<cr>",
            "Step Over",
        },
        ["<F4>"] = {
            "<cmd>lua require'dap'.step_out()<cr>",
            "Step Out",
        },
        ["<F5>"] = {
            "<cmd>lua require'dap'.step_back()<cr>",
            "Step Back",
        },
        ["<F12>"] = {
            "<cmd>lua require'dap'.restart()<cr>",
            "Step Back",
        },

        -- Neotest
        ["<leader>rt"] = {
            "<cmd>lua require('neotest').run.run()<cr>",
            "Run nearest test",
        },
        ["<leader>rf"] = {
            "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
            "Run nearest test",
        },
        ["<leader>rd"] = {
            "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
            "Run nearest test",
        },
        --scat
        -- local brazil = require("scat.brazil")
        -- local cr = require("scat.cr")
        -- local paste = require("scat.paste")
        -- local local_manager = require("scat.cr.local_manager")
        -- local brazil_utils = require("scat.brazil.utils")
        -- local scat = require("scat")

        ["<leader>b"] = { name = "+brazil" },
        ["<leader>bb"] = {
            "<cmd>lua require('scat').brazil.build_current_package<cr>",
            "Build Current Package",
        },
        ["<leader>bbr"] = {
            "<cmd>lua require('scat').brazil.build_current_package_recursively<cr>",
            "Build Current Package Recursively",
        },
        ["<leader>bl"] = {
            "<cmd>lua require('scat').brazil.list_all_packages<cr>",
            "List All Packages",
        },
        ["<leader>bp"] = {
            "<cmd>lua require('scat').brazil.display_current_package_url<cr>",
            "Display Current Package URL",
        },
        ["<leader>bP"] = {
            "<cmd>lua require('scat').brazil.display_package_under_cursor_url<cr>",
            "Display URL for Package under Cursor",
        },
        ["<leader>bR"] = {
            "<cmd>lua require('scat').brazil.display_release_under_cursor_url<cr>",
            "Display URL for Release under Cursor",
        },
        ["<leader>bf"] = {
            "<cmd>lua require('scat').brazil.display_current_file_url<cr>",
            "Display Current File URL",
        },
        ["<leader>bij"] = {
            "<cmd>lua require('scat').brazil.install_current_jdt_package<cr>",
            "Install Current JDT Package",
        },
        ["<leader>cr"] = {
            "<cmd>lua require('scat').cr.open_cr<cr>",
            "Open CR",
        },

        ["<leader>c"] = { name = "+crux" },
        -- or map_key("n", "<leader>ar", function() cr.open_cr({ cr_template = vim.fn.expandcmd"$HOME/<path_to_your_cr_template>" }) end, { desc = "Open CR" })
        ["<leader>ca"] = {
            "<cmd>lua require('scat').cr.fetch_active_crs<cr>",
            "Fetch Active CRs",
        },
        -- the below mapping prompts for user id you would like to view instead of picking from config
        -- map(
        --     "n",
        --     "<leader>cau",
        --     function()
        --         "<cmd>lua require('scat').cr.fetch_active_crs({ force_pick = true }",
        --     end,
        --     { desc = "Fetch Active CRs (ignore user specified in config)" }
        -- )
        -- -- or map_key("n", "<leader>arp", function() cr.fetch_active_crs({user = "<your_user_name>"}) end)
        -- map(
        --     "n",
        --     "<leader>cre",
        --     "<cmd>lua require('scat').cr.update_existing_cr",
        --     { desc = "Update Existing CR" }
        -- )
        -- map(
        --     "n",
        --     "<leader>art",
        --     "<cmd>lua require('scat').local_manager.toggle_cr_overview",
        --     { desc = "Toggle CR Overview" }
        -- )
        -- map(
        --     "n",
        --     "<leader>bbc",
        --     "<cmd>lua require('scat').brazil_utils.run_checkstyle",
        --     { desc = "Run Brazil Checkstyle" }
        -- )
        -- map(
        --     "n",
        --     "<leader>bbe",
        --     brazil.run_command_inside_current_package",
        --     { desc = "Run Brazil Command inside Current Package" }
        -- )
        -- map("n", "<leader>bbt", function()
        --     "<cmd>lua require('scat').brazil.pick_brazil_task_inside_current_package({
        --         callback = function(task)
        --             vim.g.test_replacement_command = task
        --         end",
        --     })
        -- end, { desc = "Pick Brazil Task inside Current Package" })
        -- map(
        --     "n",
        --     "<leader>bbtp",
        --     "<cmd>lua require('scat').brazil.run_prev_brazil_task",
        --     { desc = "Run Previous Brazil Task" }
        -- )
        -- map(
        --     "n",
        --     "<leader>bbv",
        --     "<cmd>lua require('scat').brazil.display_current_version_set_url",
        --     { desc = "Display Current Version Set URL" }
        -- )
        -- map(
        --     "n",
        --     "<leader>aw",
        --     "<cmd>lua require('scat').brazil.switch_workspace_package_info",
        --     { desc = "Switch packageInfo in Current Workspace" }
        -- )
        -- map(
        --     { "n", "x" },
        --     "<leader>as",
        --     "<cmd>lua require('scat').paste.send_to_pastebin",
        --     "Send Selection to Pastebin" }
        --     "n",
        --     "<leader>asl",
        --     "<cmd>lua require('scat').paste.list_my_pastes",
        --     { desc = "List My Pastes" }
    },
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
        notify = false,
        triggers = { { "<auto>", mode = "nxso" } },
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
