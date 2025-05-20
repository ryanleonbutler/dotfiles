return {
    "nvim-lualine/lualine.nvim",
    opts = function()
        local icons = LazyVim.config.icons
        local opts = {
            theme = "auto",
            sections = {
                lualine_b = {},
                lualine_z = {},
                lualine_x = {
                    {
                        "diff",
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                    },
                },
            },
        }
        return opts
    end,
}
