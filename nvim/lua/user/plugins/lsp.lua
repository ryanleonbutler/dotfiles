local function bemol()
    local bemol_dir =
        vim.fs.find({ ".bemol" }, { upward = true, type = "directory" })[1]
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
end

vim.diagnostic.config({
    virtual_text = true,
})

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "zeioth/garbage-day.nvim",
        },
    },
    config = function()
        require("mason").setup({})

        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")
        local mason_lspconfig = require("mason-lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities =
            require("cmp_nvim_lsp").default_capabilities(capabilities)
        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        -- [[ Diagnostics ]]
        local signs = { Error = "E", Warn = "W", Hint = "H", Info = "W" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        local on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            client.server_capabilities.semanticTokensProvider = nil

            nmap("gr", function()
                require("telescope.builtin").lsp_references()
            end, "[G]oto [R]eferences")
            nmap("gd", function()
                require("telescope.builtin").lsp_definitions()
            end, "[G]oto [D]efinitions")
            nmap("gt", function()
                require("telescope.builtin").lsp_type_definitions()
            end, "[G]oto [T]ype Definitions")
            nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
            nmap("K", vim.lsp.buf.hover, "LSP Hover")
            nmap("<leader>wa", vim.lsp.buf.add_workspace_folder)
            nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder)
            nmap("<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end)
            nmap("[d", vim.diagnostic.goto_prev, "[[]Next [d]iagnostic")
            nmap("]d", vim.diagnostic.goto_next, "[]]Previous [d]iagnostic")
            nmap("<leader>a", function()
                vim.lsp.buf.code_action()
            end, "[<leader>]Code [a]ction")
            nmap(
                "<leader>vr",
                "<cmd>lua vim.lsp.buf.rename()<CR>",
                "[<leader>][v]ar [r]ename"
            )
            nmap(
                "<C-f>",
                "<cmd>lua vim.lsp.buf.format()<CR>",
                "[C]ode [f]ormat"
            )

            bemol()
        end

        local servers = {
            bashls = {},
            jsonls = {},
            html = {},
            cssls = {},
            tailwindcss = {},
            clangd = {},
            pyright = {},
            tsserver = {},
            gopls = {},
            rust_analyzer = {},
            marksman = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        }
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })
        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                })
            end,
            ["html"] = function()
                lspconfig.html.setup({
                    filetypes = {
                        "html",
                        "markdown",
                    },
                })
            end,
        })

        local function organize_imports()
            local params = {
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(0) },
            }
            vim.lsp.buf.execute_command(params)
        end

        lspconfig.tsserver.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
                preferences = {
                    disableSuggestions = true,
                },
            },
            commands = {
                OrganizeImports = {
                    organize_imports,
                    description = "Organize Imports",
                },
            },
        })

        -- Check if the config is already defined (useful when reloading this file)
        if not configs.barium then
            configs.barium = {
                default_config = {
                    cmd = { "barium" },
                    filetypes = { "brazil-config" },
                    root_dir = function(fname)
                        return lspconfig.util.find_git_ancestor(fname)
                    end,
                    settings = {},
                },
            }
        end
        lspconfig.barium.setup({})

        if not configs.codewhisperer then
            configs.codewhisperer = {
                default_config = {
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
                    },
                    autostart = true,
                },
            }
        end
        lspconfig.codewhisperer.setup({})
    end,
}
