local function map(m, k, v, desc)
    vim.keymap.set(m, k, v, { silent = true, remap = true, desc = desc })
end

-- Disable
map("n", "<leader><leader>", "<nop>")

-- Neogit
map("n", "<leader>gs", "<cmd>Neogit<cr>", "Neogit")

-- Oil
map("n", "-", "<cmd>Oil<cr>", "Oil")
map("n", "<leader>e", "<cmd>Oil<cr>", "Oil")

-- Harpoon
map("n", "<leader>m", function()
    require("harpoon"):list():add()
end, "Harpoon Add")
map("n", "<leader>,", function()
    require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, "Harpoon Menu")
map("n", "<leader>bp", function()
    require("harpoon"):list():prev()
end, "Harpoon prev")
map("n", "<leader>n", function()
    require("harpoon"):list():next()
end, "Harpoon next")

-- Disable this way of escape
map("", "<C-c>", "<nop>")

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

-- Clear highlight
map("n", "<leader>h", ":nohl<CR>")

-- keep more or less same place for jumps
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

-- Unix like terminal nav
map("n", "<C-e>", "<END>")
map("n", "<C-a>", "<HOME>")
map("v", "<C-e>", "<END>")
map("v", "<C-a>", "<HOME>")
map("i", "<C-e>", "<END>")
map("i", "<C-a>", "<HOME>")
map("x", "<C-e>", "<END>")
map("x", "<C-a>", "<HOME>")

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

map("n", "<leader>yr", "<cmd>lua YankRelativePathToOsc()<cr>", "Yank relative file path")
map("n", "<leader>yf", "<cmd>lua YankFullPathToOsc()<cr>", "Yank full file path")

-- Telescope
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", "Find Recently Opened Files")

-- Disable diagnostics
map("n", "<leader>cd", "<cmd>lua vim.diagnostic.disable()<cr>", "Disable diagnostics")
