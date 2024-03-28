return {
    {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("git-worktree").setup()
            require("telescope").load_extension("git_worktree")
        end,
    },
    { "ThePrimeagen/vim-be-good" },
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup({})
        end,
    },
    {
        "LintaoAmons/scratch.nvim",
        event = "VeryLazy",
    },
}
