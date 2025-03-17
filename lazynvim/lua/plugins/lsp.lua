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

        -- Bemol
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
