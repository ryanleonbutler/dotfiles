return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
			"L3MON4D3/LuaSnip",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
        },
        Lazy = false,
        opts = {
            enabled = function()
                local buftype = vim.api.nvim_buf_get_option(0, "buftype")
                if buftype == "prompt" then
                    return false
                end
                return vim.g.cmp_toggle
            end,
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete({}),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "nvim_lsp_signature_help" },
                    {
                        name = "buffer",
                        keyword_length = 1,
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end,
                        },
                    },
                    { name = "luasnip", keyword_length = 1 },
                    { name = "path" },
                    { name = "emoji" },
                },
            })

            luasnip.config.setup({})
            luasnip.filetype_extend("javascript", { "html" })
            luasnip.filetype_extend("javascriptreact", { "html" })
            luasnip.filetype_extend("typescriptreact", { "html" })
            luasnip.filetype_extend("javascript", { "javascriptreact" })
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { "./snippets" },
            })
        end,
    },
}
