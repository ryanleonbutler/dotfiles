return {
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            nls.setup({ debug = true })
            local b = nls.builtins
            opts.sources = vim.list_extend(opts.sources or {}, {
                b.diagnostics.eslint,

                b.formatting.prettier.with({
                    disabled_filetypes = {
                        "markdown",
                    },
                }),

                b.formatting.prettierd.with({
                    filetypes = {
                        "markdown",
                    },
                   extra_args = {
                        "--print-width",
                        "80",
                        "--tab-width",
                        "4",
                        "--write",
                    },
                }),

                b.formatting.stylua,

                b.formatting.clang_format,

                b.formatting.isort,
                b.formatting.black,
                b.diagnostics.flake8,

                b.formatting.gofmt,
                b.formatting.goimports,
                b.formatting.golines,
            })
            return opts
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = nil,
                automatic_installation = true,
                handlers = {},
            })
        end,
    },
}
