return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        require("trouble").setup()
        -- Lua
        vim.keymap.set("n", ";x", function()
            require("trouble").toggle()
        end)
        vim.keymap.set("n", ";w", function()
            require("trouble").toggle("workspace_diagnostics")
        end)
        vim.keymap.set("n", ";d", function()
            require("trouble").toggle("document_diagnostics")
        end)
        vim.keymap.set("n", ";q", function()
            require("trouble").toggle("quickfix")
        end)
        vim.keymap.set("n", ";l", function()
            require("trouble").toggle("loclist")
        end)
        vim.keymap.set("n", "gR", function()
            require("trouble").toggle("lsp_references")
        end)
    end,
}
