local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

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
        vim.opt.formatoptions:remove({ "o", "r" })
    end,
})

-- Set width and wrap on Markdown files
autocmd("BufNew", {
    group = augroup("FormatMarkdown", { clear = false }),
    pattern = "markdown",
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "markdown" then
            vim.opt.wrap = true
            vim.opt.textwidth = 80
        end
    end,
})
autocmd("BufWritePre", {
    group = augroup("FormatMarkdown", { clear = false }),
    pattern = "markdown",
    callback = function(opts)
        if vim.bo[opts.buf].filetype == "markdown" then
            vim.opt.wrap = true
            vim.opt.textwidth = 80
        end
    end,
})
