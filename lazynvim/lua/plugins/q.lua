return {
    -- {
    --     "nvim-cmp",
    --     lazy = false,
    --     dependencies = {
    --         {
    --             "https://git.amazon.com/pkg/AmazonQNVim",
    --             branch = "mainline",
    --             -- build = ":AmazonQAuth",
    --             config = function(_, opts)
    --                 local amazonq = require("AmazonQNVim")
    --                 amazonq.setup({
    --                     ssoStartUrl = "https://amzn.awsapps.com/start",
    --                     lsp_server_cmd = {
    --                         "/Users/butryan/.local/share/mise/installs/node/latest/bin/node",
    --                         "/Users/butryan/.local/share/nvim/lazy/AmazonQNVim/language-server/build/aws-lsp-codewhisperer-token-binary.js",
    --                         "--stdio",
    --                     },
    --                 })
    --             end,
    --         },
    --     },
    --     opts = function(_, opts)
    --         table.insert(opts.sources, 1, {
    --             name = "amazonq",
    --             group_index = 1,
    --             priority = 100,
    --         })
    --     end,
    -- },
    {
        "neovim/nvim-lspconfig",
        cmd = function()
            local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs")
            if not configs.codewhisperer then
                configs.codewhisperer = {
                    default_config = {
                        -- Add the codewhisperer to our PATH or BIN folder
                        cmd = { "cwls" },
                        root_dir = lspconfig.util.root_pattern(
                            "packageInfo",
                            "package.json",
                            "tsconfig.json",
                            "jsconfig.json",
                            ".git"
                        ),
                        filetypes = {
                            "java",
                            "python",
                            "typescript",
                            "javascript",
                            "csharp",
                            "ruby",
                            "kotlin",
                            "shell",
                            "sql",
                            "c",
                            "cpp",
                            "go",
                            "rust",
                            "lua",
                        },
                    },
                }
            end
            lspconfig.codewhisperer.setup({})
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            table.insert(opts.sources, 1, {
                name = "codewhisperer",
                group_index = 1,
                priority = 100,
            })
        end,
    },
}
