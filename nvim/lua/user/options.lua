local set = vim.opt
local g = vim.g
local cmd = vim.cmd
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- OPT
set.termguicolors = true
set.colorcolumn = "80"
set.signcolumn = "yes"
set.cmdheight = 1
set.hidden = true
set.guicursor ="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
set.laststatus = 2 -- Or 3 for global statusline

set.nu = true
set.rnu = true

set.hlsearch = true
set.incsearch = true

set.foldexpr = ""
set.foldmethod = "manual"
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.expandtab = true  -- convert tabs to spaces

set.wrap = false
set.scrolloff = 8

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.isfname:append("@-@")
set.updatetime = 50
set.autoread = true
set.clipboard = ""
set.fileencoding = "utf-8"
set.errorbells = false
set.spell = false
set.title = true
set.titlestring = "%<%F%=%l/%L - nvim"

set.splitbelow = true
set.splitright = true

set.conceallevel = 0  -- `` is visible in markdown files

-- NETRW
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- Other plugin options
-- snippets path
g.vscode_snippets_path = "./snippets"
-- autocomplete
g.cmp_toggle = true
-- git blame
g.gitblame_enabled = 0

-- Highlight on yank
local yank_group = augroup("HighlightYank", {})
autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 100,
        })
    end,
})

-- Disable autocomment on new line
autocmd({ "FileType" }, {
    pattern = "*",
    callback = function()
        set.formatoptions:remove({ "o", "r" })
    end,
})

-- Set width and wrap on Markdown files
autocmd("BufNew", {
    group = augroup("FormatMarkdown", { clear = false }),
    pattern = "markdown",
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "markdown" then
            set.wrap = true
            set.textwidth = 80
        end
    end,
})
autocmd("BufWritePre", {
    group = augroup("FormatMarkdown", { clear = false }),
    pattern = "markdown",
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "markdown" then
            set.wrap = true
            set.textwidth = 80
        end
    end,
})
