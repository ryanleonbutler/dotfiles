return {
    "ThePrimeagen/harpoon",
    branch = "master",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>m", mark.toggle_file)
        vim.keymap.set("n", "<leader>,", ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>.", ui.nav_next)
    end,
}

-- return {
--     "ThePrimeagen/harpoon",
--     branch = "harpoon2",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--         local harpoon = require("harpoon")
--         harpoon:setup()

--         local wk = require("which-key")
--         wk.register({
--             ["<leader>m"] = {
--                 vim.keymap.set("n", "<leader>a", function()
--                     harpoon:list():append()
--                 end),
--                 "Harpoon Mark File",
--             },
--             ["<leader>,"] = {
--                 vim.keymap.set("n", "<C-e>", function()
--                     harpoon.ui:toggle_quick_menu(harpoon:list())
--                 end),
--                 "Harpoon Menu Toggle",
--             },
--             ["<leader>."] = {
--                 vim.keymap.set("n", "<C-S-N>", function()
--                     harpoon:list():next()
--                 end),
--                 "Harpoon Next Mark",
--             },
--         })
--     end,
-- }
