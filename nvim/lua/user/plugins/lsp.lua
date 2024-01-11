return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "j-hui/fidget.nvim",
            },
        },
        config = function()
            require("mason").setup({})
            require("fidget").setup({})

            local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs")
            local mason_lspconfig = require("mason-lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities =
                require("cmp_nvim_lsp").default_capabilities(capabilities)
            local telescope_dropdown_theme =
                require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = true,
                })
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
                client.server_capabilities.documentRangeFormattingProvider =
                    false
                client.server_capabilities.semanticTokensProvider = nil

                nmap("gr", function()
                    require("telescope.builtin").lsp_references(
                        telescope_dropdown_theme
                    )
                end, "[G]oto [R]eferences")
                nmap("gd", function()
                    require("telescope.builtin").lsp_definitions(
                        telescope_dropdown_theme
                    )
                end, "[G]oto [D]efinitions")
                nmap("gt", function()
                    require("telescope.builtin").lsp_type_definitions(
                        telescope_dropdown_theme
                    )
                end, "[G]oto [T]ype Definitions")
                nmap(
                    "gi",
                    vim.lsp.buf.implementation,
                    "[G]oto [I]mplementation"
                )
                nmap("K", vim.lsp.buf.hover, "LSP Hover")
                nmap("<space>wa", vim.lsp.buf.add_workspace_folder)
                nmap("<space>wr", vim.lsp.buf.remove_workspace_folder)
                nmap("<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end)
                nmap("[d", vim.diagnostic.goto_prev, "[[]Next [d]iagnostic")
                nmap("]d", vim.diagnostic.goto_next, "[]]Previous [d]iagnostic")
                nmap("<leader>a", function()
                    vim.lsp.buf.code_action()
                end, "[<space>] code [a]ction")
                nmap(
                    "<leader>lr",
                    "<cmd>lua vim.lsp.buf.rename()<CR>",
                    "[<leader>l]var [r]ename"
                )
                nmap(
                    "<C-f>",
                    "<cmd>lua vim.lsp.buf.format()<CR>",
                    "[C]ode [f]ormat"
                )
            end

            local servers = {
                bashls = {},
                jsonls = {},
                html = {},
                cssls = {},
                -- tailwindcss = {},
                clangd = {},
                pyright = {},
                tsserver = {},
                gopls = {},
                rust_analyzer = {},
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

            if not configs.codewhisperer then
                configs.codewhisperer = {
                    default_config = {
                        cmd = { "oliven-cwls" },
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
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-emoji",
        },
        opts = {
            enabled = function()
                local buftype = vim.api.nvim_buf_get_option(0, "buftype")
                if buftype == "prompt" then
                    return false
                end
                return vim.g.cmp_toggle
            end,
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete({}),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "nvim_lsp_signature_help" },
                    {
                        name = "buffer",
                        keyword_length = 1,
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end,
                        },
                    },
                    { name = "luasnip", keyword_length = 1 },
                    { name = "path" },
                    { name = "emoji" },
                },
            })

            luasnip.config.setup({})
            luasnip.filetype_extend("javascript", { "html" })
            luasnip.filetype_extend("javascriptreact", { "html" })
            luasnip.filetype_extend("typescriptreact", { "html" })
            luasnip.filetype_extend("javascript", { "javascriptreact" })
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { "./snippets" },
            })
        end,
    },
}
