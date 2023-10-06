-- [[ Options ]]
local set = vim.opt
local g = vim.g
-- colorcolumn
set.colorcolumn = "119"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555555" })
-- Make line numbers default
set.number = true
set.rnu = true
-- Sync clipboard between OS and Neovim.
set.clipboard = ""
-- Enable break indent
set.breakindent = true
-- Save undo history
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.smartindent = true
-- Set highlight on search
set.hlsearch = false
-- Keep signcolumn on by default
set.signcolumn = "yes"
-- Decrease update time
set.updatetime = 100
set.timeout = true
set.timeoutlen = 300
-- Set completeopt to have a better completion experience
set.completeopt = "menuone,noselect"
-- NOTE: You should make sure your terminal supports this
set.termguicolors = true
-- always show tabs
set.showtabline = 2
-- auto load files
set.autoread = true
-- creates a backup file
set.backup = false
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program)
set.swapfile = false -- creates a swapfile
-- more space in the neovim command line for displaying messages
set.cmdheight = 1
-- so that `` is visible in markdown files
set.conceallevel = 0
-- highlight the current line
set.cursorline = true
-- Other
set.errorbells = false
set.expandtab = true -- convert tabs to spaces
set.fileencoding = "utf-8" -- the encoding written to a file
set.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
set.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
set.guicursor =
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
set.hidden = true -- required to keep multiple buffers and open multiple buffers
set.pumheight = 10 -- pop up menu height
set.scrolloff = 8 -- is one of my fav
set.shiftwidth = 4 -- the number of spaces inserted for each indentation
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
set.sidescrolloff = 8
set.spell = false
set.spelllang = "en"
set.splitbelow = true -- force all horizontal splits to go below current window
set.splitright = true -- force all vertical splits to go to the right of current window
set.softtabstop = 4
set.tabstop = 4 -- insert 4 spaces for a tab
set.title = true -- set the title of window to the value of the titlestring
set.wrap = false -- display lines as one long line
