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
			timeout = 1000,
		})
	end,
})

-- Force formatoptions
vim.cmd([[autocmd BufWinEnter * setlocal formatoptions-=cro]])
vim.cmd([[autocmd BufRead * setlocal formatoptions-=cro]])
vim.cmd([[autocmd BufNewFile * setlocal formatoptions-=cro]])
