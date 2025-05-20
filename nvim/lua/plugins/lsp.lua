return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		opts = {},
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"L3MON4D3/LuaSnip",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			-- {
			-- 	"https://git.amazon.com/pkg/AmazonQNVim",
			-- 	branch = "mainline",
			-- 	-- build = ":AmazonQAuth",
			-- 	config = function(_, opts)
			-- 		local amazonq = require("AmazonQNVim")
			-- 		amazonq.setup({
			-- 			ssoStartUrl = "https://amzn.awsapps.com/start",
			-- 			lsp_server_cmd = {
			-- 				"/Users/butryan/.local/share/mise/installs/node/latest/bin/node",
			-- 				"/Users/butryan/.local/share/nvim/lazy/AmazonQNVim/language-server/build/aws-lsp-codewhisperer-token-binary.js",
			-- 				"--stdio",
			-- 			},
			-- 		})
			-- 	end,
			-- },
		},
		event = 'InsertEnter',
		Lazy = false,
		config = function()
			local cmp = require('cmp')
			local luasnip = require("luasnip")

			cmp.setup({
				sources = {
					-- { name = "amazonq" },
					{ name = "luasnip" },
					{name = 'nvim_lsp'},
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{
						name = "buffer",
						keyword_length = 5,
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
					},
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
					{ name = "path" },
					{ name = "emoji" },
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					["<C-c>"] = cmp.mapping.complete(),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
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
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = {'LspInfo', 'LspInstall', 'LspStart'},
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
		},
		init = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = 'yes'
		end,
		config = function()
			local lsp_defaults = require('lspconfig').util.default_config

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			lsp_defaults.capabilities = vim.tbl_deep_extend(
			'force',
			lsp_defaults.capabilities,
			require('cmp_nvim_lsp').default_capabilities()
			)

			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local opts = {buffer = event.buf}

					vim.keymap.set('n', 'K', '<cmd>Lspsaga outline<cr>', opts)
					vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
					vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
					vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
					vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
					vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
					vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
					vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
					vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
					vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
				end,
			})

			local servers = {
				bashls = {},
				jsonls = {},
				html = {},
				cssls = {},
				tailwindcss = {},
				clangd = {},
				pyright = {},
				ts_ls = {},
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

			require('mason-lspconfig').setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,
				}
			})
		end
	}
}
