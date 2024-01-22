return {
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },

    {
        "ojroques/nvim-osc52",
        config = function()
            require("osc52").setup({
                max_length = 0, -- Maximum length of selection (0 for no limit)
                silent = false, -- Disable message on successful copy
                trim = false, -- Trim surrounding whitespaces before copy
            })
            -- Yank through ssh/tmux whatever...
            local function copy()
                if
                    vim.v.event.operator == "y"
                    and vim.v.event.regname == "+"
                then
                    require("osc52").copy_register("+")
                end
            end
            vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
        end,
    },

    {
        "gbprod/yanky.nvim",
        dependencies = {
            { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") },
        },
        opts = function()
            local mapping = require("yanky.telescope.mapping")
            local mappings = mapping.get_defaults()
            mappings.i["<c-p>"] = nil
            return {
                highlight = { timer = 200 },
                ring = {
                    storage = jit.os:find("Windows") and "shada" or "sqlite",
                },
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
        "ThePrimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "<leader>m", mark.toggle_file)
            vim.keymap.set("n", "<leader>,", ui.toggle_quick_menu)
            vim.keymap.set("n", "<leader>.", ui.nav_next)
        end,
    },
    { "ThePrimeagen/vim-be-good" },

    { "tpope/vim-commentary" },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },

    { "jkramer/vim-checkbox" },
    { "ipkiss42/xwiki.vim" },

    {
        "f-person/git-blame.nvim",
        config = function()
            require("gitblame").setup({})
        end,
    },
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup({})
        end,
    },
}
