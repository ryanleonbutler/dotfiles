return {
    -- {
    --     "folke/tokyonight.nvim",
    --     opts = {
    --         transparent = true,
    --         styles = {
    --             sidebars = "transparent",
    --             -- floats = "transparent",
    --         },
    --     },
    -- },
    -- {
    --     "catppuccin/nvim",
    --     lazy = true,
    --     name = "catppuccin",
    --     opts = {
    --         flavour = "mocha",
    --         transparent_background = true,
    --         integrations = {
    --             aerial = true,
    --             alpha = true,
    --             cmp = true,
    --             dashboard = true,
    --             flash = true,
    --             grug_far = true,
    --             gitsigns = true,
    --             headlines = true,
    --             illuminate = true,
    --             indent_blankline = { enabled = true },
    --             leap = true,
    --             lsp_trouble = true,
    --             mason = true,
    --             markdown = true,
    --             mini = true,
    --             native_lsp = {
    --                 enabled = true,
    --                 underlines = {
    --                     errors = { "undercurl" },
    --                     hints = { "undercurl" },
    --                     warnings = { "undercurl" },
    --                     information = { "undercurl" },
    --                 },
    --             },
    --             navic = { enabled = true, custom_bg = "lualine" },
    --             neotest = true,
    --             neotree = true,
    --             noice = true,
    --             notify = true,
    --             semantic_tokens = true,
    --             telescope = true,
    --             treesitter = true,
    --             treesitter_context = true,
    --             which_key = true,
    --         },
    --     },
    -- },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            transparent = true,
            variant = "moon", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = false,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                transparency = true,
                bold = true,
                italic = true,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            palette = {
                -- Override the builtin palette per variant
                -- moon = {
                --     base = '#18191a',
                --     overlay = '#363738',
                -- },
            },

            highlight_groups = {
                -- Comment = { fg = "foam" },
                -- VertSplit = { fg = "muted", bg = "muted" },
                Cursor = { fg = "#ffffff", bg = "#ffffff" },
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                -- if highlight.undercurl then
                --     highlight.undercurl = false
                -- end
                --
                -- Change palette colour
                -- if highlight.fg == palette.pine then
                --     highlight.fg = palette.foam
                -- end
            end,
        },
        {
            "LazyVim/LazyVim",
            opts = {
                colorscheme = "rose-pine-moon",
            },
        },
    },
}
