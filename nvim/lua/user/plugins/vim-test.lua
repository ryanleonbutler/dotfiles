return {
    "vim-test/vim-test",
    dependencies = { "preservim/vimux" },
    config = function()
        vim.keymap.set("n", "<leader>t", "<cmd>TestNearest<CR>")
        vim.keymap.set("n", "<leader>T", "<cmd>TestFile<CR>")
        vim.keymap.set("n", "<leader>a", "<cmd>TestSuite<CR>")
        vim.keymap.set("n", "<leader>l", "<cmd>TestLast<CR>")
        vim.keymap.set("n", "<leader>g", "<cmd>TestVisit<CR>")
        vim.cmd([[let test#strategy = "vimux"]])
    end,
}
