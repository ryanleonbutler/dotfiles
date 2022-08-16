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

-- Reload "config"
M.nmap("<Leader>r", ":% so<CR>")

-- Disable q
M.nmap("q", '<Nop>')

-- Do not yank with x
M.nmap("x", '"_x')

-- Better save and quit
M.nmap("<Leader>w", ":write<CR>")
M.nmap("<Leader>q", ":qa<CR>")
M.nmap("<C-q>", ":qa!<CR>")
M.nmap("<Leader>x", ":bd<CR>")

-- Alternate escape
M.imap("jk", "<ESC>")
M.imap("<C-c>", "<ESC>")

-- No highlight
M.nmap("<Leader>h", ":nohlsearch<CR>")

-- Unix like terminal nav
M.nmap("<C-e>", "<END>")
M.nmap("<C-a>", "<HOME>")
M.vmap("<C-e>", "<END>")
M.vmap("<C-a>", "<HOME>")
M.imap("<C-e>", "<END>")
M.imap("<C-a>", "<HOME>")

-- Nav buffers
M.nmap("<TAB>", ":bnext<CR>")
M.nmap("<S-TAB>", ":bprevious<CR>")

-- Split window
M.nmap('ss', ':split<Return><C-w>w')
M.nmap('sv', ':vsplit<Return><C-w>w')

-- Nav splits
M.nmap("<C-k>", ":wincmd k<CR>")
M.nmap("<C-j>", ":wincmd j<CR>")
M.nmap("<C-h>", ":wincmd h<CR>")
M.nmap("<C-l>", ":wincmd l<CR>")

-- keep more or less same place
M.nmap("n", "nzzzv")
M.nmap("N", "nzzzv")

-- Stay in indent mode
M.vmap("<", "<gv")
M.vmap(">", ">gv")

-- Yank through SSH/tmux
M.vmap("<C-c>", ":OSCYank<CR>")

-- increment/decrement
M.nmap("+", "<C-a>")
M.nmap("-", "<C-x>")

-- Disable arrow keys
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

-- Harpoon
M.nmap("<Leader>m", ":lua require('harpoon.mark').toggle_file()<CR>")

-- Toggle blame
M.nmap("<Leader>gb", ":GitBlameToggle<CR>")

-- Toggle auto complete
function TOGGLE_CMP()
    vim.g.cmp_toggle = not vim.g.cmp_toggle
end
M.nmap("<Leader>cc", ":lua TOGGLE_CMP()<CR>")

return M
