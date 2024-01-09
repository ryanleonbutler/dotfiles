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
					extra_args = {
						"--print-width",
						"119",
						"--tab-width",
						"4",
						"--single-quote",
						"true",
					},
				}),

				b.formatting.stylua,

				b.formatting.clang_format,

				-- b.formatting.black,
				-- b.formatting.isort,
				-- b.diagnostics.mypy,
				b.formatting.ruff.with({
					extra_args = {
						"--line-length=79",
					},
				}),
				b.diagnostics.ruff.with({
					extra_args = {
						"--line-length=79",
					},
				}),

				b.formatting.gofmt.with({}),
				b.formatting.goimports.with({}),
				b.formatting.golines.with({}),
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
