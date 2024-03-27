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
                ":ene <BAR> startinsert <CR>"
            ),
            dashboard.button(
                "SPC f f",
                "  > Find file",
                ":cd $HOME/Workspace | Telescope find_files<CR>"
            ),
            dashboard.button(
                "SPC f o",
                "  > Recent",
                ":Telescope oldfiles<CR>"
            ),
            dashboard.button(
                "s",
                "  > Settings",
                ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"
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
