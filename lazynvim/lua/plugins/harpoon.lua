return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        local function map(m, k, v, desc)
            vim.keymap.set(m, k, v, { silent = true, remap = true, desc = desc })
        end
        local list_select_keymap = function(index)
            map("n", "<leader><leader>" .. tostring(index), function()
                harpoon:list():select(index)
            end, "Harpoon: " .. tostring(index))
        end
        for i = 1, 9 do
            list_select_keymap(i)
        end
    end,
}
