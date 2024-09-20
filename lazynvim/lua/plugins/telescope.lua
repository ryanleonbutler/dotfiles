return {
    "nvim-telescope/telescope.nvim",
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
    },
}
