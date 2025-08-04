return {
    "sriram-mv/q-cli-neovim",
    config = function()
        require("q-cli-neovim").setup()

        -- Set your preferred keymaps
        vim.keymap.set({"n", "v", "t"}, "<leader>tq", "<cmd>QToggle<cr>", { desc = "Toggle Q CLI" })
        vim.keymap.set("n", "<leader>qd", "<cmd>QDebug<cr>", { desc = "Debug Q CLI session" })
        vim.keymap.set("n", "<leader>qc", "<cmd>QCleanup<cr>", { desc = "Clean up Q CLI sessions" })
    end,
}
