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
                url = os.getenv("USER") .. "@git.amazon.com:pkg/AmazonQNVim",
                -- build = ":AmazonQAuth",
                config = function(_, opts)
					-- vim.lsp.set_log_level("DEBUG")
                    local amazonq = require("AmazonQNVim")
                    amazonq.setup({
                        ssoStartUrl = "https://amzn.awsapps.com/start",
                        lsp_server_cmd = {
                            "node",
                            os.getenv("HOME")
                                .. "/.local/share/nvim/lazy/AmazonQNVim/language-server/build/aws-lsp-codewhisperer-token-binary.js",
                            "--stdio",
                        },
                    })
                end,
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
                    ["<TAB>"] = cmp.mapping.select_next_item(),
                    ["<S-tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "amazonq" },
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    { name = "luasnip", keyword_length = 1 },
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
