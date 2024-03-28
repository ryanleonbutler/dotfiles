return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button(
                "SPC f e",
                "  > New file",
                "<cmd>ene <BAR> startinsert <cr>"
            ),
            dashboard.button(
                "SPC f f",
                "  > Find file",
                "<cmd>Telescope find_files<cr>"
            ),
            dashboard.button(
                "SPC f o",
                "  > Recent",
                "<cmd>Telescope oldfiles<cr>"
            ),
            dashboard.button(
                "s",
                "  > Settings",
                "<cmd>e ~/development/dotfiles/nvim | :cd %:p:h | wincmd k | pwd<cr>"
            ),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            callback = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime * 100) / 100
                dashboard.section.footer.val = "󱐌 Lazy-loaded "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
