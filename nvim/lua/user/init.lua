local function map(m, k, v, desc)
	if desc then
		desc = "Desc: " .. desc
	end
	vim.keymap.set(m, k, v, { silent = true, remap = true }, { desc = desc })
end

vim.g.mapleader = " "

require("user.options")
require("user.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("user.plugins")


-- [[ Diagnostics ]]
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- [[ Telescope ]]
local telescope_dropdown_theme = require("telescope.themes").get_dropdown({
	winblend = 10,
	previewer = false,
})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
		pickers = {},
	},
})


-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
map("n", "<leader>?", require("telescope.builtin").oldfiles, "[?] Find recently opened files")
map(
	"n",
	"<leader><space>",
	require("telescope.builtin").buffers,
	"[<space>] Find existing buffers"
)
map("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(telescope_dropdown_theme)
end, "[/] Fuzzy search current buffer")

map("n", "<leader>ff", require("telescope.builtin").find_files, "[f]ind [f]iles")
map("n", "<leader>fh", require("telescope.builtin").help_tags, "[f]ind [h]elp")
map("n", "<leader>fw", require("telescope.builtin").grep_string, "[f]ind [w]ord")
map("n", "<leader>fg", require("telescope.builtin").live_grep, "[f]ind [g]rep")
map("n", "<leader>fd", require("telescope.builtin").diagnostics, "[f]ind [d]iagnostics")
map("n", "<leader>fr", require("telescope.builtin").registers, "[f]ind [r]egisters")
map("n", "<leader>fk", require("telescope.builtin").keymaps, "[f]ind [k]eymaps")
map("n", "<leader>fj", require("telescope.builtin").jumplist, "[f]ind [j]umplist")
map({ "n", "v" }, "<leader>fc", require("telescope.builtin").commands, "[f]ind [c]ommands")


-- [[ Harpoon ]]
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
map("n", "<leader>m", mark.toggle_file)
map("n", "<leader>,", ui.toggle_quick_menu)

