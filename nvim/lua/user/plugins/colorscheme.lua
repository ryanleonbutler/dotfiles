return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
        require("rose-pine").setup({
            variant = "main",
            dark_variant = "main",
            dim_inactive_windows = false,
            extend_background_behind_borders = true,
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
            groups = {
                error = "love",
                hint = "iris",
                info = "foam",
                warn = "gold",
                headings = {
                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },
            },
            highlight_groups = {
                TelescopeBorder = { fg = "highlight_high", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "base" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "text", bg = "base" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                -- StatusLine = { fg = "love", bg = "love", blend = 10 },
                -- StatusLineNC = { fg = "subtle", bg = "surface" },
                ColorColumn = { bg = "foam", blend = 25 },
                Cursor = { fg = "#ffffff", bg = "#ffffff" },
                -- Blend colours against the "base" background
                CursorLine = { bg = "foam", blend = 25 },
                -- StatusLine = { fg = "love", bg = "love", blend = 10 },
                -- By default each group adds to the existing config.
                -- If you only want to set what is written in this config exactly,
                -- you can set the inherit option:
                -- Search = { bg = "gold", inherit = false },
                -- DiagnosticVirtualTextError = { fg = "love"},
                -- DiagnosticVirtualTextInfo = { fg = "foam"},
                -- DiagnosticVirtualTextWarn = { fg = "rose"},
                -- DiagnosticVirtualTextHint = { fg = "pine"},
                LineNrAbove = { fg = "subtle"},
                LineNr = { fg = "text" },
                LineNrBelow = { fg = "subtle"},
            },
        })
        vim.cmd([[colorscheme rose-pine]])
    end,
}
