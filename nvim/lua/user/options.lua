local set = vim.opt
local g = vim.g

set.termguicolors = true
set.colorcolumn = "80"
set.signcolumn = "yes"
set.cmdheight = 1
set.hidden = true
set.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
set.laststatus = 0
set.showmode = false
set.completeopt = "menuone,noselect"
set.showtabline = 1
set.cursorline = true

set.nu = true
set.rnu = true

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.autoindent = true
-- vim.cmd([[filetype plugin indent on]])
set.fileformat = "unix"

set.wrap = false
set.scrolloff = 10

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.isfname:append("@-@")

set.updatetime = 50
set.redrawtime = 500
set.timeout = true
set.ttimeoutlen = 10

set.autoread = true
set.clipboard = ""
set.fileencoding = "utf-8"
set.errorbells = false
set.spell = false
set.spelllang = "en"
set.title = true
set.titlestring = "%<%F%=%l/%L - nvim"

set.splitbelow = true
set.splitright = true

set.conceallevel = 0

set.mouse = ""

-- NETRW
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- Other plugin options
-- snippets path
g.vscode_snippets_path = "./snippets"

-- autocomplete
g.cmp_toggle = true
