vim.g.mapleader = " "

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Disable arrow keys
vim.keymap.set("", "<up>", "<nop>")
vim.keymap.set("", "<down>", "<nop>")
vim.keymap.set("", "<left>", "<nop>")
vim.keymap.set("", "<right>", "<nop>")

-- Save/CloseBuffer/Quit/Escape/SourceConfig
vim.keymap.set("n", "<leader>w", ":w <CR>")
vim.keymap.set("n", "<leader>x", ":bd <CR>")
vim.keymap.set("n", "<leader>q", ":q <CR>")
vim.keymap.set("n", "<C-q>", ":qa! <CR>")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("n", "<leader>r", ":so %<CR>")

-- Clear highlight
vim.keymap.set("n", "<leader>h", ":nohl<CR>")

-- keep more or less same place for jumps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move a line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep last copy in paste buffer and overwrite the highlight
vim.keymap.set("x", "<leader>p", "\"_dp")
-- vim.keymap.set("n", "<leader>d", "\"_dp")
-- vim.keymap.set("v", "<leader>d", "\"_dp")

-- Access system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- format
vim.keymap.set("n", "<C-f>", function()
    vim.lsp.buf.format()
end)

-- tmux
vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Find and replace
vim.keymap.set("n", "<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Toggle auto complete
function TOGGLE_CMP()
    vim.g.cmp_toggle = not vim.g.cmp_toggle
end

-- Toggle blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")

-- Unix like terminal nav
vim.keymap.set("n", "<C-e>", "<END>")
vim.keymap.set("n", "<C-a>", "<HOME>")
vim.keymap.set("v", "<C-e>", "<END>")
vim.keymap.set("v", "<C-a>", "<HOME>")
vim.keymap.set("i", "<C-e>", "<END>")
vim.keymap.set("i", "<C-a>", "<HOME>")
vim.keymap.set("x", "<C-e>", "<END>")
vim.keymap.set("x", "<C-a>", "<HOME>")

-- Gotta have the TAB's to nav buffers
vim.keymap.set("n", "<TAB>", ":bnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>")

-- Walking the splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
