return {
    "tpope/vim-fugitive",
    config = function()

        local UserFugitive =
            vim.api.nvim_create_augroup("UserFugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = UserFugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>gp", function()
                    vim.cmd.Git("push")
                end, opts)

                vim.keymap.set("n", "<leader>gr", function()
                    vim.cmd.Git({ "pull", "--rebase" })
                end, opts)

                vim.keymap.set("n", "<leader>gr", ":Git push -u origin ", opts)
            end,
        })

        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
    end,
}
