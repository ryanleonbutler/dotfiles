vim.g.ryan_colorscheme = "tokyonight"
vim.g.tokyonight_tranparent_sidebar = true
vim.g.tokyonight_tranparent = true
vim.g.gruvbox_contrast_dark = "dark"
vim.g.gruvbox_transparent_bg = true
vim.g.gruvbox_insert_selection = "0"
vim.opt.background = "dark"
vim.cmd("colorscheme " .. vim.g.ryan_colorscheme)

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("SignColumn", {
    bg = "none",
})

hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
})

hl("CursorLineNR", {
    bg = "#555555",
})

hl("Normal", {
    bg = "none",
})

hl("LineNR", {
    fg = "#5eacd3",  -- Tokyonight
    -- fg = "#7DB669",  -- Gruvbox
})

hl("netrwDir", {
    fg = "#5eacd3",
})
