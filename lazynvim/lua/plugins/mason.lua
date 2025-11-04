return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts_extend = { "ensure_installed" },
        pin = true,
        opts = {
            ensure_installed = {
                -- Golang
                -- "gopls",
                -- "gofumpt",
                -- "goimports",

                -- Rust
                -- "rust-analyzer",

                -- Python
                -- "isort",
                -- "black",
                -- "flake8",
                -- "pyright",
                "ruff",

                -- Javascript
                "typescript-language-server",
                "eslint-lsp",
                "prettierd",
                "prettier",

                -- Lua
                "lua-language-server",
                "stylua",

                -- Markdown
                "markdown-toc",
                -- "markdownlint-cli2",
                "marksman",

                -- JSON
                "json-lsp",

                -- Other
                "shfmt",
            },
        },
        automatic_installation = true,
    },
    {
        "mason-lspconfig.nvim",
        pin = true,
    },
}
