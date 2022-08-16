local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local luasnip = require("luasnip")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ensure_installed = {"bashls", "cssls", "eslint", "graphql", "html", "jsonls", "sumneko_lua", "tailwindcss", "tsserver",
    "vetur", "vuels", "pyright", "rust_analyzer"},
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})

_G.load_config = function()
	local on_attach = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
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
		vim.keymap.set("n", "<C-d>", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
		vim.keymap.set("n", "<C-f>", vim.lsp.buf.formatting, opts)

	end

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

	nvim_lsp["rust_analyzer"].setup({
		-- cmd = cmd,
		on_attach = on_attach,
		settings = {},
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
		on_attach = on_attach,
	})

	local opts = {
		highlight_hovered_item = true,
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

