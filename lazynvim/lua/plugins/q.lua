return {
    {
        name = "amazonq",
        lazy = false,
        url = "ssh://git.amazon.com/pkg/AmazonQNVim",
        opts = {
            ssoStartUrl = "https://amzn.awsapps.com/start",
            lsp_server_cmd = {
                "node",
                vim.fn.stdpath("data")
                    .. "/lazy/amazonq/language-server/build/aws-lsp-codewhisperer-token-binary.js",
                "--stdio",
            },
            inline_suggest = true,
        },
    },
}
