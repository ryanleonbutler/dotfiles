local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = " "

-- disable Q
map("n", "Q", "<nop>")

-- Netrw
map("n", "<leader>e", vim.cmd.Ex)

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Save/CloseBuffer/Quit/Escape/SourceConfig
map("n", "<leader>w", ":w <CR>")
map("n", "<leader>x", ":bd <CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-q>", ":qa! <CR>")
map("i", "jk", "<ESC>")
map("i", "<C-c>", "<ESC>")
map("n", "<leader>r", ":so %<CR>")

-- Clear highlight
map("n", "<leader>h", ":nohl<CR>")

-- keep more or less same place for jumps
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move a line up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- keep last copy in paste buffer and overwrite the highlight
map("x", "<leader>p", "\"_dp")
-- map("n", "<leader>d", "\"_dp")
-- map("v", "<leader>d", "\"_dp")

-- Access system clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

-- format
map("n", "<C-f>", function()
    vim.lsp.buf.format()
end)

-- tmux
map("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Find and replace
map("n", "<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Toggle auto complete
function TOGGLE_CMP()
    vim.g.cmp_toggle = not vim.g.cmp_toggle
end

-- Toggle blame
map("n", "<leader>gb", ":GitBlameToggle<CR>")

-- Unix like terminal nav
map("n", "<C-e>", "<END>")
map("n", "<C-a>", "<HOME>")
map("v", "<C-e>", "<END>")
map("v", "<C-a>", "<HOME>")
map("i", "<C-e>", "<END>")
map("i", "<C-a>", "<HOME>")
map("x", "<C-e>", "<END>")
map("x", "<C-a>", "<HOME>")

-- Gotta have the TAB's to nav buffers
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprevious<CR>")

-- Walking the splits
map("n", "<C-k>", ":wincmd k<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-l>", ":wincmd l<CR>")
