local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local telescope_dropdown_theme = require("telescope.themes").get_dropdown({
	winblend = 10,
	previewer = true,
})

local on_attach = function(client, bufnr)
	---Disable formatting for servers (Handled by null-ls)
	---@see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	---Disable |lsp-semantic_tokens| (conflicting with TS highlights)
	client.server_capabilities.semanticTokensProvider = nil

	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end
	nmap("gr", function()
		require("telescope.builtin").lsp_references(telescope_dropdown_theme)
	end, "[G]oto [R]eferences")
	nmap("gd", function()
		require("telescope.builtin").lsp_definitions(telescope_dropdown_theme)
	end, "[G]oto [D]efinitions")
	nmap("gt", function()
		require("telescope.builtin").lsp_type_definitions(telescope_dropdown_theme)
	end, "[G]oto [T]ype Definitions")
	nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
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
	nmap("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", "[<leader>]code [a]ction")
	nmap("<C-f>", "<cmd>lua vim.lsp.buf.format()<CR>", "[C]ode [f]ormat")
end

require("mason-null-ls").setup({
	automatic_setup = true,
	ensure_installed = {
		"stylua",
		"jq",
		"ruff",
		"black",
		"isort",
		"mypy",
		"debugpy",
		"eslint",
		"prettier",
		"goimports",
		"golines",
	},
})

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
