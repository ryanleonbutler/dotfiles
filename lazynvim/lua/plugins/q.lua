return {
    {
        "awslabs/amazonq.nvim",
        name = "amazonq",
        lazy = false,
        opts = {
            ssoStartUrl = "https://amzn.awsapps.com/start",
            inline_suggest = true,
            on_chat_open = function()
                vim.cmd([[
      vertical topleft split
      set wrap breakindent nonumber norelativenumber nolist
    ]])
            end,
        },
    },
}
