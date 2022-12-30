local status, db = pcall(require, "dashboard")
local home = os.getenv("HOME")

db.default_banner = {
    "",
    "",
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "",
    "",
}

db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
    {
        icon = "  ",
        desc = "File browser                            ",
        action = "Ex",
        shortcut = "SPC e",
    },
    {
        icon = "  ",
        desc = "Find files                              ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
        shortcut = "SPC f",
    },
    {
        icon = "  ",
        desc = "Find word                               ",
        action = "Telescope live_grep",
        shortcut = "SPC s",
    },
}
-- db.custom_footer = { "", "🎉" }
-- db.session_directory = "/Users/butryan/.config/nvim/session"
