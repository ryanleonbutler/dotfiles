require"nvim-treesitter.configs".setup {
    ensure_installed = "all",
    sync_install = false,

    ignore_install = { "phpdoc" },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["gnc"] = "@class.outer",
                ["gnf"] = "@function.outer",
                ["gnp"] = "@parameter.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["gpc"] = "@class.outer",
                ["gpf"] = "@function.outer",
                ["gpp"] = "@parameter.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["Snp"] = "@parameter.inner",
            },
            swap_previous = {
                ["Spp"] = "@parameter.inner",
            },
        },
    },
}
