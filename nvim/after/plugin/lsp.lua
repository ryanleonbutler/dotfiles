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
    "sumneko_lua",
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
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
    opts = lsp_opts,
})

-- lsp.set_preferences({
-- 	sign_icons = { }
-- })

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
    bind("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    bind("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    bind("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup_nvim_cmp({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    formatting = {
        -- -- changing the order of fields so the icon is the first
        -- fields = { 'menu', 'abbr', 'kind' },

        -- -- here is where the change happens
        -- format = function(entry, item)
        --     local menu_icon = {
        --         nvim_lsp = 'λ',
        --         luasnip = '⋗',
        --         buffer = 'Ω',
        --         path = '🖫',
        --         nvim_lua = 'Π',
        --     }

        --     item.menu = menu_icon[entry.source.name]
        --     return item
        -- end,
    },
    documentation = {
        max_height = 15,
        max_width = 60,
        border = 'rounded',
        col_offset = 0,
        side_padding = 1,
        winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
        zindex = 1001
    }
})

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
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


-- null_ls
-- local null_ls_status_ok, null_ls = pcall(require, "null-ls")
-- if not null_ls_status_ok then
-- 	return
-- end

-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

-- null_ls.setup({
-- 	debug = false,
-- 	sources = {
-- 		diagnostics.eslint,
-- 		diagnostics.flake8,
-- 		diagnostics.jsonlint,
-- 		formatting.prettier,
-- 		formatting.black,
-- 		formatting.isort,
-- 		formatting.stylua,
		-- formatting.trim_whitespace,
-- 		formatting.jq,
-- 	},
-- })
