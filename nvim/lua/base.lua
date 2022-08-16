local set = vim.opt

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- autocomplete
vim.g.cmp_toggle = true

-- Encoding
set.encoding = "utf-8"
set.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"

-- set.guicursor = ""
set.ai = true -- Auto Indent
set.backspace = "start,eol,indent"
set.backup = false -- creates a backup file
set.backupskip = "/tmp/*,/private/tmp/*"
set.breakindent = true
set.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
set.cmdheight = 1 -- more space in the neovim command line for displaying messages
set.completeopt = { "menuone", "noselect" }
set.conceallevel = 0 -- so that `` is visible in markdown files
set.cursorline = true -- highlight the current line
set.errorbells = false
set.expandtab = true -- convert tabs to spaces
set.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
set.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
set.hidden = true -- required to keep multiple buffers and open multiple buffers
set.hlsearch = true -- highlight all matches on previous search pattern
set.ignorecase = true -- ignore case in search patterns
set.inccommand = "split"
set.laststatus = 2
set.mouse = "a" -- allow the mouse to be used in neovim
set.number = true -- set numbered lines
set.numberwidth = 2 -- set number column width to 2 {default 4}
set.path:append { "**" } -- Finding files - search down subfolders
set.pumheight = 10 -- pop up menu height
set.relativenumber = true -- set relative numbered lines
set.scrolloff = 10
set.shiftwidth = 4 -- the number of spaces inserted for each indentation
set.showcmd = true
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
set.showtabline = 2 -- always show tabs
set.si = true -- Smart Indent
set.sidescrolloff = 10
set.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
set.smarttab = true
set.softtabstop = 4
set.spell = false
set.spelllang = "en"
set.splitbelow = true -- force all horizontal splits to go below current window
set.splitright = true -- force all vertical splits to go to the right of current window
set.swapfile = false -- creates a swapfile
set.tabstop = 4 -- insert 4 spaces for a tab
set.termguicolors = true -- set term gui colors (most terminals support this)
set.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
set.title = true -- set the title of window to the value of the titlestring
set.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true -- enable persistent undo
set.updatetime = 50 -- faster completion
set.wildignore:append { "*/node_modules/*" } -- Finding files - search down subfolders
set.wrap = false -- No wrap lines
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.number = true
vim.numberwidth = 2
vim.wo.colorcolumn = "119"
vim.wo.fillchars='eob: '
