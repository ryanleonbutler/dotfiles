return {
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-emoji",
            {
                {
                    name = "amazonq",
                    url = "ssh://git.amazon.com/pkg/AmazonQNVim",
                    opts = {
                        ssoStartUrl = "https://amzn.awsapps.com/start",
                        lsp_server_cmd = {
                            "node",
                            vim.fn.stdpath("data")
                                .. "/lazy/amazonq/language-server/build/aws-lsp-codewhisperer-token-binary.js",
                            "--stdio",
                        },
                        inline_suggest = false,
                    },
                },
            },
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            luasnip.config.setup({})

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-c>"] = cmp.mapping.complete(),
                    ["<C-p>"] = cmp.mapping.complete({
                        Config = {
                            sources = cmp.config.sources({
                                {
                                    { name = "amazonq", priority = 100 },
                                },
                            }),
                        },
                    }),
                    ["<TAB>"] = cmp.mapping.select_next_item(),
                    ["<S-tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "amazonq", priority = 100 },
                    { name = "luasnip", keyword_length = 1 },
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    {
                        name = "buffer",
                        keyword_length = 1,
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end,
                        },
                    },
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        },
                    },
                    { name = "path" },
                    { name = "emoji" },
                }),
            })
        end,
    },
}
