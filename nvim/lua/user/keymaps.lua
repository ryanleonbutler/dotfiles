local function map(m, k, v, desc)
    if desc then
        desc = "Desc: " .. desc
    end
    vim.keymap.set(m, k, v, { silent = true, remap = true }, { desc = desc })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Netrw
map("n", "<leader>e", vim.cmd.Ex, "Netrw Ex")

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Save/CloseBuffer/Quit/Escape
map("n", "<leader>w", ":w! <CR>")
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-q>", ":qa! <CR>")
map("i", "jk", "<ESC>")

-- Clear highlight
map("n", "<leader>h", ":nohl<CR>")

-- keep more or less same place for jumps
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move a line up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Access system clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

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

-- tmux navigate
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")

-- Copy file paths
function YankFullPathToOsc()
    local file_path = vim.fn.expand("%:p")
    vim.fn.setreg("+", file_path)
    require("osc52").copy_register("+")
end

function YankRelativePathToOsc()
    local file_path = vim.fn.expand("%:.")
    vim.fn.setreg("+", file_path)
    require("osc52").copy_register("+")
end
