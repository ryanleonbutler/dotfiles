return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
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
            "eslint-lsp",

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
    automatic_installation = false,
}
