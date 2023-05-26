local augroup = vim.api.nvim_create_augroup
RyanGroup = augroup("ryan", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Force formatoptions
vim.cmd([[autocmd BufWinEnter * setlocal formatoptions-=cro]])
vim.cmd([[autocmd BufRead * setlocal formatoptions-=cro]])
vim.cmd([[autocmd BufNewFile * setlocal formatoptions-=cro]])

-- Hard mode
-- vim.cmd[[autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()]]

-- LSP
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])
-- vim.cmd([[autocmd CursorHold * lua vim.lsp.buf.hover()]])
