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

-- lsp.configure("tsserver", {
-- 	flags = {
-- 		debounce_text_changes = 150,
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		print("tsserver")
-- 	end,
-- })

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local bind = vim.keymap.set

    bind("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    bind("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    bind("n", "K", vim.lsp.buf.hover, opts)
    bind("n", "gi", vim.lsp.buf.implementation, opts)
    bind("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    bind("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    bind("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    bind("n", "F", vim.lsp.buf.type_definition, opts)
    bind("n", "<leader>rn", vim.lsp.buf.rename, opts)
    bind("n", "D", vim.diagnostic.open_float, opts)
    bind("n", "[d", vim.diagnostic.goto_prev, opts)
    bind("n", "]d", vim.diagnostic.goto_next, opts)
    bind("n", "<C-f>", vim.lsp.buf.format, opts)
    bind("n", "<Leader>vrn", function() vim.lsp.buf.rename() end, opts)
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

-- 	enabled = function()
-- 		local buftype = vim.api.nvim_buf_get_option(0, "buftype")
-- 		if buftype == "prompt" then
-- 			return false
-- 		end
-- 		return vim.g.cmp_toggle
-- 	end,

-- -- null_ls
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
-- 		-- formatting.trim_whitespace,
-- 		formatting.jq,
-- 	},
-- })

-- 	nvim_lsp["tsserver"].setup({
-- 		cmd = { "typescript-language-server", "--stdio" },
-- 		filetypes = {
-- 			"javascript",
-- 			"javascriptreact",
-- 			"javascript.jsx",
-- 			"typescript",
-- 			"typescriptreact",
-- 			"typescript.tsx",
-- 		},
-- 		on_attach = on_attach,
-- 	})

-- 	nvim_lsp["pyright"].setup({
-- 		cmd = { "pyright-langserver", "--stdio" },
-- 		on_attach = on_attach,
-- 		settings = {
-- 			python = {
-- 				analysis = {
-- 					autoSearchPaths = true,
-- 					diagnosticMode = "workspace",
-- 					useLibraryCodeForTypes = true,
-- 				},
-- 			},
-- 		},
-- 	})

-- 	nvim_lsp["cssls"].setup({
-- 		on_attach = on_attach,
-- 	})

-- 	nvim_lsp["rust_analyzer"].setup({
-- 		on_attach = on_attach,
-- 		-- cmd = { "rust-analyzer" },
-- 		-- filetypes = { "rust" },
-- 		-- root_dir = { "Cargo.toml", "rust-project.json" },
-- 		settings = {
-- 			["rust_analyzer"] = {
-- 				imports = {
-- 					granularity = {
-- 						group = "module",
-- 					},
-- 					prefix = "self",
-- 				},
-- 				cargo = {
-- 					buildScripts = {
-- 						enable = true,
-- 					},
-- 				},
-- 				procMacro = {
-- 					enable = true,
-- 				},
-- 			},
-- 		},
-- 	})

-- 	nvim_lsp["sumneko_lua"].setup({
-- 		-- cmd = cmd,
-- 		on_attach = on_attach,
-- 		settings = {
-- 			Lua = {
-- 				runtime = {
-- 					-- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
-- 					version = "LuaJIT",
-- 				},
-- 				diagnostics = {
-- 					-- Get the language server to recognize the `vim` global
-- 					globals = { "vim" },
-- 				},
-- 				workspace = {
-- 					-- Make the server aware of Neovim runtime files
-- 					library = vim.api.nvim_get_runtime_file("", true),
-- 				},
-- 				-- Do not send telemetry data containing a randomized but unique identifier
-- 				telemetry = {
-- 					enable = false,
-- 				},
-- 			},
-- 		},
-- 	})

-- 	nvim_lsp["jsonls"].setup({
-- 		on_attach = on_attach,
-- 	})

-- 	local opts = {
-- 		highlight_hovered_item = true,
-- 		show_guides = true,
-- 	}
