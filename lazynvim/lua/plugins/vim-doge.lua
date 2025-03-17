return {
    "kkoomen/vim-doge",
	build = ":call doge#install()",
    config = function()
        vim.keymap.set("n", "<Leader>d", "<Plug>(doge-generate)", { desc = "Vim-Doge: Generate" })
    end,
}
