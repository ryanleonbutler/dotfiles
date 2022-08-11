local set = vim.opt

-- global options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- autocomplete
vim.g.cmp_toggle = true

-- indent blankline
-- vim.g.optlist = true
-- set.listchars:append "space:⋅"
-- set.listchars:append "eol:↴"

-- netrw
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
-- vim.g.netrw_keepdir = 0
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_localcopydircmd = "cp -r"

-- window-scoped options
vim.wo.colorcolumn = "119"

set.backup = false -- creates a backup file
set.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
set.cmdheight = 1 -- more space in the neovim command line for displaying messages
set.completeopt = { "menuone", "noselect" }
set.conceallevel = 0 -- so that `` is visible in markdown files
set.cursorline = true -- highlight the current line
set.errorbells = false
set.expandtab = true -- convert tabs to spaces
set.fileencoding = "utf-8" -- the encoding written to a file
set.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
set.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
-- set.guicursor = ""
set.hidden = true -- required to keep multiple buffers and open multiple buffers
set.hlsearch = true -- highlight all matches on previous search pattern
set.ignorecase = true -- ignore case in search patterns
set.mouse = "a" -- allow the mouse to be used in neovim
set.number = true -- set numbered lines
set.numberwidth = 2 -- set number column width to 2 {default 4}
set.pumheight = 10 -- pop up menu height
set.relativenumber = true -- set relative numbered lines
set.scrolloff = 8 -- is one of my fav
set.shiftwidth = 4 -- the number of spaces inserted for each indentation
set.showmode = false -- we don't need to see things like -- INSERT -- anymore
set.showtabline = 2 -- always show tabs
set.sidescrolloff = 8
set.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
set.smartindent = true
set.spell = false
set.spelllang = "en"
set.splitbelow = true -- force all horizontal splits to go below current window
set.splitright = true -- force all vertical splits to go to the right of current window
set.softtabstop = 4
set.swapfile = false -- creates a swapfile
set.tabstop = 4 -- insert 4 spaces for a tab
set.termguicolors = true -- set term gui colors (most terminals support this)
set.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
set.title = true -- set the title of window to the value of the titlestring
set.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true -- enable persistent undo
set.updatetime = 50 -- faster completion
set.wrap = false -- display lines as one long line
set.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
