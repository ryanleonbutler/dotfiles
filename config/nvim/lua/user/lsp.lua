local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- nvim-cmp
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local source_mapping = {
	nvim_lsp = "[LSP]",
	luasnip = "[Snippet]",
	path = "[Path]",
	buffer = "[Buffer]",
	nvim_lua = "[Lua]",
}

cmp.setup({
	enabled = function()
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
	    if buftype == "prompt" then return false end
		return vim.g.cmp_toggle
	end,
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-i>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	}),
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ensure_installed = {"bashls", "cssls", "eslint", "graphql", "html", "jsonls", "sumneko_lua", "tailwindcss", "tsserver",
    "vetur", "vuels", "pyright"},
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})

_G.load_config = function()
	local nvim_lsp = require("lspconfig")
	local on_attach = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set("n", "<space>wl", function()
		--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<C-d>", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
		vim.keymap.set("n", "<C-f>", vim.lsp.buf.formatting, opts)
	end

	-- Add the server that troubles you here
	-- local name = "pyright"
	-- local cmd = { "pyright-langserver", "--stdio" } -- needed for elixirls, omnisharp, sumneko_lua
	-- if not name then
	--     print "You have not defined a server name, please edit minimal_init.lua"
	-- end
	-- if not nvim_lsp[name].document_config.default_config.cmd and not cmd then
	--     print [[You have not defined a server default cmd for a server
	--     that requires it please edit minimal_init.lua]]
	-- end

	-- nvim_lsp[name].setup {
	--     -- cmd = cmd,
	--     on_attach = on_attach,
	-- }

	nvim_lsp["tsserver"].setup({
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		on_attach = on_attach,
	})

	nvim_lsp["pyright"].setup({
		cmd = { "pyright-langserver", "--stdio" },
		on_attach = on_attach,
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
				},
			},
		},
	})

	nvim_lsp["sumneko_lua"].setup({
		-- cmd = cmd,
		on_attach = on_attach,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	nvim_lsp["jsonls"].setup({
		-- cmd = "",
		on_attach = on_attach,
		-- settings = {},
	})

	local opts = {
		-- whether to highlight the currently hovered symbol
		-- disable if your cpu usage is higher than you want it
		-- or you just hate the highlight
		-- default: true
		highlight_hovered_item = true,

		-- whether to show outline guides
		-- default: true
		show_guides = true,
	}
	require("symbols-outline").setup(opts)

	luasnip.filetype_extend("javascript", {"html"})
	luasnip.filetype_extend("javascriptreact", {"html"})
	luasnip.filetype_extend("typescriptreact", {"html"})
	luasnip.filetype_extend("javascript", {"javascriptreact"})

    require("luasnip.loaders.from_vscode").lazy_load({
        -- paths = snippets_paths(),
        include = nil, -- Load all languages
        exclude = {},
    })
end

_G.load_config()

-- barium
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
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

-- null_ls
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.eslint,
		diagnostics.flake8,
		diagnostics.jsonlint,
		formatting.prettier,
		formatting.black,
		formatting.isort,
		formatting.stylua,
		formatting.trim_whitespace,
		formatting.jq,
	},
})

vim.diagnostic.config({
	virtual_text = false,
})
