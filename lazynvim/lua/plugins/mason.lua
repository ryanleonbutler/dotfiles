return {
    "williamboman/mason.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
        ensure_installed = {
            -- Golang
            "gopls",
            "gofumpt",
            "goimports",

            -- Rust
            "rust-analyzer",

            -- Python
            "isort",
            "black",
            "flake8",
            "pyright",

            -- JS/TS
            "typescript-language-server",
            "eslint-lsp",
            "eslint_d",
            "prettierd",

            -- Lua
            "lua-language-server",
            "stylua",

            -- Markdown
            "markdown-toc",
            "markdownlint-cli2",
            "marksman",

            -- JSON
            "json-lsp",

            -- Other
            "shfmt",
        },
    },
}
