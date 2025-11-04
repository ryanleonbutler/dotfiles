return {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = function(_, opts)
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")

        -- Barium
        if not configs.barium then
            configs.barium = {
                default_config = {
                    cmd = { "barium" },
                    filetypes = { "brazil-config" },
                    root_dir = function(fname)
                        return vim.fs.dirname(
                            vim.fs.find(".git", { path = fname, upward = true })[1]
                        )
                    end,
                    settings = {},
                },
            }
        end
        lspconfig.barium.setup({})

        -- Bemol workspace folders
        local bemol_dir = vim.fs.find({ ".bemol" }, { upward = true, type = "directory" })[1]
        local ws_folders_lsp = {}
        if bemol_dir then
            local file = io.open(bemol_dir .. "/ws_root_folders", "r")
            if file then
                for line in file:lines() do
                    table.insert(ws_folders_lsp, line)
                end
                file:close()
            end
        end

        for _, line in ipairs(ws_folders_lsp) do
            vim.lsp.buf.add_workspace_folder(line)
        end

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
