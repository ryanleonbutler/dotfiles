-- useful keymap wrapper
local M = {}
M.nmap = function(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end
M.imap = function(lhs, rhs)
    vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true })
end
M.vmap = function(lhs, rhs)
    vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true, silent = true })
end
M.xmap = function(lhs, rhs)
    vim.api.nvim_set_keymap('x', lhs, rhs, { noremap = true, silent = true })
end

-- Netrw
M.nmap("<Leader>ea", ":Lexplore %:p:h<CR>")
M.nmap("<Leader>ed", ":Lexplore<CR>")
M.nmap("<Leader>e", ":Explore<CR>")

-- M.nmap("<TAB>", "mf") -- toggles mark on file
-- M.nmap("<S-TAB>", "mF") -- unmarks current files in current buffer
-- M.nmap("<Leader><TAB>", "mu") -- removes marks on all files

-- M.nmap("ff", ":w<CR>:buffer #<CR>") -- new file
-- M.nmap("fe", "R") -- rename file
-- M.nmap("fc", "mc") -- copy marked files
-- M.nmap("fx", "mm") -- move marked file
-- M.nmap("f;", "mx") -- run external commands on marked files

-- Better save and quit
M.nmap("<Leader>w", ":write<CR>")
M.nmap("<Leader>q", ":qa<CR>")
M.nmap("<C-q>", ":qa!<CR>")
M.nmap("<Leader>x", ":bd<CR>")

-- The best remap
M.imap("jk", "<ESC>")
M.imap("<C-c>", "<ESC>")

-- Reload the "config"
M.nmap("<Leader>r", ":% so<CR>")

-- Yank through ssh/tmux whatever...
M.vmap("<C-c>", ":OSCYank<CR>")

-- no highlight
M.nmap("<Leader>h", ":nohlsearch<CR>")

-- Unix like terminal nav
M.nmap("<C-e>", "<END>")
M.nmap("<C-a>", "<HOME>")
M.vmap("<C-e>", "<END>")
M.vmap("<C-a>", "<HOME>")
M.imap("<C-e>", "<END>")
M.imap("<C-a>", "<HOME>")

-- Gotta have the TAB's to nav buffers
M.nmap("<TAB>", ":bnext<CR>")
M.nmap("<S-TAB>", ":bprevious<CR>")

-- Walking the splits
M.nmap("<C-k>", ":wincmd k<CR>")
M.nmap("<C-j>", ":wincmd j<CR>")
M.nmap("<C-h>", ":wincmd h<CR>")
M.nmap("<C-l>", ":wincmd l<CR>")

-- "Q" whaaaaaaat
M.nmap("q", "<Nop>")

-- No arrows for you...
M.nmap("<Up>", "<Nop>")
M.nmap("<Down>", "<Nop>")
M.nmap("<Left>", "<Nop>")
M.nmap("<Right>", "<Nop>")
M.nmap("<Up>", "<Nop>")
M.nmap("<Down>", "<Nop>")
M.nmap("<Left>", "<Nop>")
M.nmap("<Right>", "<Nop>")
M.nmap("<Up>", "<Nop>")
M.nmap("<Down>", "<Nop>")
M.nmap("<Left>", "<Nop>")
M.nmap("<Right>", "<Nop>")

-- Git-worktree
M.nmap("<Leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")

return M
