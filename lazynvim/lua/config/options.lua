local set = vim.opt
local g = vim.g

-- warnings
g.deprecation_warnings = true

-- linting
g.lazyvim_prettier_needs_config = false

-- formatting
g.autoformat = false -- default

-- UI
vim.o.termguicolors = true
set.colorcolumn = "100"
set.conceallevel = 0
set.cursorline = true
-- set.cursorcolumn = true
vim.o.list = false

-- Netrw
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- spaces/tabs
set.softtabstop = 4
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.autoindent = true
set.wrap = false
set.scrolloff = 10

-- search
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- backup/undofiles
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- Mouse
set.mouse = ""

-- clipboard
set.clipboard = ""

-- spelling
set.spell = false
set.spelllang = "en_us"

-- filetypes
set.encoding = "utf-8"
set.fileencoding = "utf-8"

-- update time
set.updatetime = 50
set.redrawtime = 500
set.timeout = true
set.ttimeoutlen = 10

-- splits
set.splitbelow = true -- Put new windows below current
set.splitright = true -- Put new windows right of current

-- nvim-cmp
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- load python
-- g.python_host_prog  = '/Users/butryan/.local/share/mise/installs/python/3.13.1/bin/python'
-- g.python3_host_prog = '/Users/butryan/.local/share/mise/installs/python/3.13.1/bin/python'

vim.g.snacks_animate = false
