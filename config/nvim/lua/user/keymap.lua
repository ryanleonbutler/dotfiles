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

-- Nerdtree
M.nmap("<Leader>e", ":NvimTreeToggle<CR>")

-- TagBar
M.nmap("<F8>", ":TagbarToggle<CR>")

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

-- Lets go harpooning
-- M.nmap("<Leader>,", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
M.nmap("<Leader>m", ":lua require('harpoon.mark').toggle_file()<CR>")

-- Replace f with sneak
M.nmap("f", "<Plug>Sneak_f")
M.nmap("F", "<Plug>Sneak_F")
M.nmap("t", "<Plug>Sneak_t")
M.nmap("T", "<Plug>Sneak_T")

-- Toggle blame
M.nmap("<Leader>gb", ":GitBlameToggle<CR>")

return M
