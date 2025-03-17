return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "isort", "black" },
                cpp = { "clang_format" },
                c = { "clang_format" },
                ["*"] = { "trim_whitespace" },
                formatters = {
                    black = {
                        prepend_args = { "-S" },
                    },
                },
            },
        },
    },
}
