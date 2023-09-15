-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
local b = null_ls.builtins

local opts = {
  sources = {
    b.diagnostics.eslint,
    -- b.formatting.deno_fmt.with {
      -- file_types = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    --   extra_args = {
    --     "--indent-width",
    --     4,
    --     "--line-width",
    --     119,
    --     "--single-quote",
    --   },
    -- },

    b.formatting.prettier.with {
      -- file_types = { "html", "css", "json", "markdown" },
		extra_args = {
			"--print-width",
			"119",
			"--tab-width",
			"4",
			"--single-quote",
			"true",
		},
	},

    b.formatting.stylua,

    b.formatting.clang_format,

    b.formatting.black,
    b.formatting.isort,
    b.diagnostics.mypy,
    b.diagnostics.ruff.with {
      extra_args = {
        "--line-length",
        "119",
        "--max-complexity",
        "10",
        "--ignore",
        "W391", -- blank line at end of file
      },
    },

    b.formatting.gofmt.with {},
    b.formatting.goimports.with {},
    b.formatting.golines.with {},
  },
  -- on_attach = function(client, bufnr)
    -- if client.supports_method "textDocument/formatting" then
    --   vim.api.nvim_clear_autocmds {
    --     group = augroup,
    --     buffer = bufnr,
    --   }
    --   -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   --   group = augroup,
    --   --   buffer = bufnr,
    --   --   callback = function()
    --   --     vim.lsp.buf.format { bufnr = bufnr }
    --   --   end,
    --   -- })
    -- end
  -- end,
}

return opts
