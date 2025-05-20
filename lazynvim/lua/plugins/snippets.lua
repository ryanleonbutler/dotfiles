return {
    "rafamadriz/friendly-snippets",
    dependecies = { "L3MON4D3/LuaSnip" },
    config = function()
        local luasnip = require("luasnip")

        luasnip.filetype_extend("javascript", { "html" })
        luasnip.filetype_extend("javascriptreact", { "html" })
        luasnip.filetype_extend("typescriptreact", { "html" })
        luasnip.filetype_extend("javascript", { "javascriptreact" })
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = { "./snippets" },
        })
    end,
}
