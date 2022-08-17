-- Harpoon
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    },
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = false,
    }
})

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

-- indent line
require("indent_blankline").setup {
    indentLine_enabled = 1,
    indent_blankline_char = " ",
    space_char_blankline = " ",
    show_current_context = true,
    indent_blankline_context_char_list = "▏",
    show_current_context_start = false,
    indent_blankline_show_first_indent_level = false,
}
