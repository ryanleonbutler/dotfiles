return {
    {
        "nvim-treesitter/nvim-treesitter",
        name = "treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "git_config",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "markdown",
                "markdown_inline",
                "vimdoc",
                "lua",
                "yaml",
                "bash",
                "python",
                "rust",
                "go",
                "bash",
            },
            highlight = {
                enable = true,
                -- disable = { "lua" },
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<tab>",
                    node_decremental = "<s-tab>",
                    scope_incremental = "<cr>",
                },
            },
            autotag = {
                enable = true,
            },
            matchup = {
                enable = true,
            },
        },
        config = function(plugin, opts)
            require("nvim-treesitter.configs").setup(opts)
            require("treesitter-context").setup({
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "treesitter" },
    },
}
