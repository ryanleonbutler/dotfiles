return {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = function(_, opts)
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")

        -- lspconfig.pyright.setup({
        --     settings = {
        --         pyright = {
        --             -- Using Ruff's import organizer
        --             disableOrganizeImports = true,
        --         },
        --         python = {
        --             analysis = {
        --                 -- Ignore all files for analysis to exclusively use Ruff for linting
        --                 ignore = { "*" },
        --             },
        --         },
        --     },
        -- })

        -- lspconfig.ruff.setup({
        --     init_options = {
        --         settings = {
        --             -- Ruff language server settings go here
        --         },
        --     },
        -- })

        -- Ty LSP configuration
        if not configs.ty then
            configs.ty = {
                default_config = {
                    cmd = { vim.fn.expand('~/.local/share/nvim/mason/packages/ty/venv/bin/ty'), 'server' },
                    filetypes = { 'python' },
                    root_dir = lspconfig.util.root_pattern('.git', 'pyproject.toml', 'setup.py'),
                    settings = {},
                },
            }
        end
        lspconfig.ty.setup({
            settings = {
                ty = {
                    disableFollowImports = true,
                    strict = true,
                },
            },
        })
    end,
    servers = {
        tsserver = {
            init_options = {
                preferences = {
                    importModuleSpecifierPreference = "non-relative",
                    importModuleSpecifierEnding = "minimal",
                },
            },
        },
    },
}
