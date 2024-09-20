local function map(m, k, v, desc)
  if desc then
    desc = "Desc:" .. desc
  end
  vim.keymap.set(m, k, v, { silent = true, remap = true, desc = desc })
end

-- Netrw
map("n", "-", "<cmd>Oil<cr>", "Oil")

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Disable arrow keys
map("n", "J", "<nop>")

-- Save/CloseBuffer/Quit/Escape
map("n", "<leader>w", ":w! <CR>")
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-q>", ":qa! <CR>")

-- Clear highlight
map("n", "<leader>h", ":nohl<CR>")

-- keep more or less same place for jumps
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move a line up or down
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- Access system clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Gotta have the TAB's to nav buffers
map("n", "<S-TAB>", ":bprevious<CR>")
map("n", "<TAB>", ":bnext<CR>")

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
