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
