return {
    "numToStr/FTerm.nvim",
    config = function()
        require("FTerm").setup({
            border = "double",
            dimensions = {
                height = 0.9,
                width = 0.9,
            },
        })

        vim.keymap.set(
            "t",
            "<C-t>",
            '<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>'
        )
    end,
}
