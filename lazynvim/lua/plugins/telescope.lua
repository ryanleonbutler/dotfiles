return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "fcying/telescope-ctags-outline.nvim" },
    extensions = {
        ctags_outline = {
            --ctags option
            ctags = { "ctags" },
            --ctags filetype option
            ft_opt = {
                vim = "--vim-kinds=fk",
                lua = "--lua-kinds=fk",
            },
            sorting_strategy = "ascending",
        },
    },
    keys = {
        {
            "<leader>fg",
            "<cmd>Telescope live_grep<cr>",
            desc = "Live Grep",
        },
        {
            "<leader>fc",
            "<cmd>Telescope commands<cr>",
            desc = "Find Command",
        },
        {
            "<leader>fd",
            "<cmd>Telescope diagnostics<cr>",
            desc = "Find Diagnostics",
        },
        {
            "<leader>fh",
            "<cmd>Telescope help_tags<cr>",
            desc = "Find Help Tags",
        },
        {
            "<leader>fj",
            "<cmd>Telescope jumplist<cr>",
            desc = "Find Jumplist",
        },
        {
            "<leader>fk",
            "<cmd>Telescope keymaps<cr>",
            desc = "Find Keymaps",
        },
        {
            "<leader>fw",
            "<cmd>Telescope grep_string<cr>",
            desc = "Find Word",
        },
        {
            "<leader>fb",
            "<cmd>Telescope buffers<cr>",
            desc = "Find Buffers",
        },
        {
            "<leader>fm",
            "<cmd>Telescope marks<cr>",
            desc = "Telescope marks",
        },
        {
            "<leader>fr",
            ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
            desc = "Find and Replace",
        },
        {
            "<leader>ft",
            "<cmd>Telescope ctags_outline<cr>",
            desc = "Find CTags",
        },
        {
            "<leader>gw",
            "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
            desc = "Browse Git Worktrees",
        },
    },
    config = function()
        require("telescope").load_extension("ctags_outline")
    end,
}
