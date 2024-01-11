return {
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")
			local b = nls.builtins
			opts.sources = vim.list_extend(opts.sources or {}, {
				b.diagnostics.eslint,

				b.formatting.prettier.with({
					file_types = {
						"html",
						"css",
						"json",
						"markdown",
						"javascript",
						"typescript",
						"javascriptreact",
					},
				}),

				b.formatting.stylua,

				b.formatting.clang_format,

				b.formatting.ruff,
				b.diagnostics.ruff,

				b.formatting.gofmt,
				b.formatting.goimports,
				b.formatting.golines,
			})
			return opts
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = nil,
				automatic_installation = true,
				handlers = {}
			})
		end,
	},
}
