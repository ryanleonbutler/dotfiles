--git blame
vim.g.gitblame_enabled = 0

-- better-escape.vim
vim.g.better_escape_interval = 200
vim.g.better_escape_shortcut = { "jk" }

-- last-place
require("nvim-lastplace").setup({
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = {
        "gitcommit", "gitrebase", "svn", "hgcommit",
    },
    lastplace_open_folds = true,
})

-- doge
vim.g.doge_doc_standard_python = "google"
