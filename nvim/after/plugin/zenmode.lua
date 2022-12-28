require("zen-mode").setup {
    window = {
        width = 119,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}

vim.keymap.set("n", "zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
    ColorMyPencils()
end)
