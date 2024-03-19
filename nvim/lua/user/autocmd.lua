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
            timeout = 200,
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

-- Disable code folding
autocmd("BufWritePost", {
    group = augroup("Folding", {}),
    pattern = "*",
    callback = function()
        vim.cmd([[set nofoldenable foldmethod=manual foldlevelstart=99]])
    end,
})
autocmd("BufEnter", {
    group = augroup("Folding", {}),
    pattern = "*",
    callback = function()
        vim.cmd([[set nofoldenable foldmethod=manual foldlevelstart=99]])
    end,
})
