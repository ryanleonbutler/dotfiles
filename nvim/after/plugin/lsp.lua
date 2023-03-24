local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
    "bashls",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "luau_lsp",
    "tailwindcss",
    "tsserver",
})

local lsp_opts = {
    flags = {
        debounce_text_changes = 150,
    },
}

lsp.setup_servers({
    "bashls",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "luau_lsp",
    "tailwindcss",
    "tsserver",
    opts = lsp_opts,
})

lsp.set_preferences({
    sign_icons = {},
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local bind = vim.keymap.set

    bind("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    bind("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    bind("n", "K", vim.lsp.buf.hover, opts)
    bind("n", "gi", vim.lsp.buf.implementation, opts)
    bind("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    bind("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    bind("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    bind("n", "F", vim.lsp.buf.type_definition, opts)
    bind("n", "D", vim.diagnostic.open_float, opts)
    bind("n", "[d", vim.diagnostic.goto_prev, opts)
    bind("n", "]d", vim.diagnostic.goto_next, opts)
    bind("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
    end, opts)
    bind("n", "<leader>vrr", function()
        vim.lsp.buf.references()
    end, opts)
    bind("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, opts)
end)

lsp.setup_nvim_cmp({
    sources = {
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 1 },
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
    },
    formatting = {
        -- changing the order of fields so the icon is the first
        fields = { "menu", "abbr", "kind" },
        -- here is where the change happens
        -- format = function(entry, item)
        --     local menu_icon = {
        --         nvim_lsp = "λ",
        --         luasnip = "⋗",
        --         buffer = "Ω",
        --         path = "🖫",
        --         nvim_lua = "Π",
        --     }

        --     item.menu = menu_icon[entry.source.name]
        --     return item
        -- end,
    },
    documentation = {
        max_height = 15,
        max_width = 60,
        border = "rounded",
        col_offset = 0,
        side_padding = 1,
        winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
        zindex = 1001,
    },
})

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = true,
})

local luasnip = require("luasnip")
luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
luasnip.filetype_extend("javascript", { "javascriptreact" })

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
    paths = { "./snippets" },
})

-- Null-ls
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
        ---
        -- you can add other stuff here....
        ---
    end,
    sources = {
        --- configure sources
        formatting.trim_whitespace,
        formatting.trim_newlines,

        -- https://github.com/JohnnyMorganz/StyLua#options
        formatting.stylua.with({
            extra_args = {
                "--indent-type",
                "spaces",
                "--indent-width",
                "4",
                "--column-width",
                "119",
                "--quote-style",
                "AutoPreferDouble",
            },
        }),

        -- Prettier: Javascript, TypeScript, CSS, JSON, HTML, Yaml, Markdown
        formatting.prettier.with({
            extra_args = {
                "--double-quote",
                "--jsx-single-quote",
                "--print-width",
                "119",
            },
        }),
        diagnostics.eslint,

        -- ruff: Python
        formatting.ruff.with({
            extra_args = {
                "--line-length",
                "119",
                "--fix"
            },
        }),
        -- https://pycodestyle.pycqa.org/en/latest/intro.html#error-codes
        diagnostics.ruff.with({
            extra_args = {
                "--line-length",
                "119",
                "--max-complexity",
                "10",
                "--ignore",
                "W391", -- blank line at end of file
            },
        }),
    },
})
