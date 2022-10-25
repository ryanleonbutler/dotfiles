-- useful keymap test
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

-- commentary
M.nmap("<leader>/", ":Commentary<CR>")
M.vmap("<leader>/", ":Commentary<CR>")

-- undotree
M.nmap("<leader>u", ":UndotreeToggle<CR>")

-- floatterm
M.nmap("<leader>nt", ":FloatermNew<CR>")
M.nmap("<leader>t", ":FloatermToggle<CR>")
M.nmap("<leader>kt", ":FloatermKill<CR>")

-- keep more or less same place
M.nmap("n", "nzzzv")
M.nmap("N", "nzzzv")

-- Stay in indent mode
M.vmap("<", "<gv")
M.vmap(">", ">gv")

-- Better save and quit
M.nmap("<leader>w", ":write<CR>")
M.nmap("<leader>q", ":qa<CR>")
M.nmap("<C-q>", ":qa!<CR>")
M.nmap("<leader>x", ":bd<CR>")

-- The best remap
M.imap("jk", "<ESC>")
M.imap("<C-c>", "<ESC>")

-- Reload the "config"
M.nmap("<leader>r", ":% so<CR>")

-- Yank through ssh/tmux whatever...
M.vmap("<C-c>", ":OSCYank<CR>")

-- Clipboard stuff
M.nmap("<leader>y", "\"+y")
M.vmap("<leader>y", "\"+y")

-- no highlight
M.nmap("<leader>h", ":nohlsearch<CR>")

-- Unix like terminal nav
M.nmap("<C-e>", "<END>")
M.nmap("<C-a>", "<HOME>")
M.vmap("<C-e>", "<END>")
M.vmap("<C-a>", "<HOME>")
M.imap("<C-e>", "<END>")
M.imap("<C-a>", "<HOME>")
M.xmap("<C-e>", "<END>")
M.xmap("<C-a>", "<HOME>")

-- Gotta have the TAB's to nav buffers
M.nmap("<TAB>", ":bnext<CR>")
M.nmap("<S-TAB>", ":bprevious<CR>")

-- Move up and down and center cursor
M.nmap("<C-d>", "<C-d>zz")
M.nmap("<C-u>", "<C-u>zz")

-- Move a line up or down
M.vmap("J", ":m '>+1<CR>gv=gv")
M.vmap("K", ":m '<-2<CR>gv=gv")

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
M.vmap("<Up>", "<Nop>")
M.vmap("<Down>", "<Nop>")
M.vmap("<Left>", "<Nop>")
M.vmap("<Right>", "<Nop>")
M.imap("<Up>", "<Nop>")
M.imap("<Down>", "<Nop>")
M.imap("<Left>", "<Nop>")
M.imap("<Right>", "<Nop>")
M.xmap("<Up>", "<Nop>")
M.xmap("<Down>", "<Nop>")
M.xmap("<Left>", "<Nop>")
M.xmap("<Right>", "<Nop>")

-- Find and replace
M.nmap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Lets go harpooning
M.nmap("<leader>m", ":lua require('harpoon.mark').toggle_file()<CR>")

-- Toggle blame
M.nmap("<leader>gb", ":GitBlameToggle<CR>")

-- Toggle auto complete
function TOGGLE_CMP()
    vim.g.cmp_toggle = not vim.g.cmp_toggle
end
M.nmap("<leader>cc", ":lua TOGGLE_CMP()<CR>")

-- zen
M.nmap("<leader>zn", ":TZNarrow<CR>")
M.nmap("<leader>zn", ":'<,'>TZNarrow<CR>")
M.nmap("<leader>zf", ":TZFocus<CR>")
M.nmap("<leader>zm", ":TZMinimalist<CR>")
M.nmap("<leader>za", ":TZAtaraxis<CR>")

-- Aerial
-- Toggle the aerial window with <leader>a
M.nmap("<leader>at", "<cmd>AerialToggle!<CR>")
-- Jump forwards/backwards with '{' and '}'
M.nmap('{', '<cmd>AerialPrev<CR>')
M.nmap('}', '<cmd>AerialNext<CR>')
-- Jump up the tree with '[[' or ']]'
M.nmap('[[', '<cmd>AerialPrevUp<CR>')
M.nmap(']]', '<cmd>AerialNextUp<CR>')

return M
