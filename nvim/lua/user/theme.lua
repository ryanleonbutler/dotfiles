-- vim.g.ryan_colorscheme = "catppuccin"

-- local colors = require("catppuccin.palettes").get_palette()
-- colors.none = "NONE"

-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- require("catppuccin").setup({
--     custom_highlights = {
--         LineNR = { bg = colors.none, fg = colors.overlay0 },
--         CursorLine = { bg = colors.mantle },
--         CursorLineNR = { fg = colors.text, bg = colors.none },
--     },
--     transparent_background = true,
--     term_colors = true,
--     compile = {
--         enabled = false,
--         path = vim.fn.stdpath("cache") .. "/catppuccin",
--     },
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
--     styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     integrations = {
--         -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
--     },
--     color_overrides = {},
--     highlight_overrides = {},
-- })

vim.g.ryan_colorscheme = "tokyonight"
vim.g.tokyonight_tranparent_sidebar = true
vim.g.tokyonight_tranparent = true

-- vim.g.ryan_colorscheme = "gruvbox"
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
    ctermbg = "none",
    bg = "#555555",
})

hl("Folded", {
    ctermbg = "none",
    bg = "none",
})

-- hl("CursorLineNR", {
--     ctermbg = "none",
--     bg = "#555555",
-- })

hl("Normal", {
    ctermbg = "none",
    bg = "none",
})

hl("Nontext", {
    ctermbg = "none",
    bg = "none",
})

hl("VertSplit", {
    ctermbg = "none",
    bg = "none",
})

hl("LineNR", {
    ctermbg = "none",
    fg = "#525860",
    -- fg = "#5eacd3",  -- Tokyonight
    -- fg = "#7DB669",  -- Gruvbox
})

-- hl("netrwDir", {
--     fg = "#5eacd3",
-- })
