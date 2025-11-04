return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = function(bufnr)
                    if require("conform").get_formatter_info("ruff_format", bufnr).available then
                        return { "ruff_format" }
                    else
                        return { "isort", "black" }
                    end
                end,
                c = { "clang_format" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                ["*"] = { "trim_whitespace" },
                formatters = {
                    black = {
                        prepend_args = { "-S" },
                    },
                },
                ["_"] = { "trim_whitespace" },
            },
        },
    },
}
