local function map(m, k, v, desc)
    if desc then
        desc = "Desc: " .. desc
    end
    vim.keymap.set(m, k, v, { silent = true, remap = true }, { desc = desc })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File Explorer
map("n", "<leader>e", "<cmd>Oil<cr>", "Oil")
map("n", "-", "<cmd>Oil<cr>", "Oil")

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Save/CloseBuffer/Quit/Escape
map("n", "<leader>w", ":w! <CR>")
map("n", "<leader>x", ":bd<CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<C-q>", ":qa! <CR>")
map("i", "jk", "<ESC>")

-- Clear highlight
map("n", "<leader>h", ":nohl<CR>")

-- keep more or less same place for jumps
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move a line up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Access system clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Unix like terminal nav
map("n", "<C-e>", "<END>")
map("n", "<C-a>", "<HOME>")
map("v", "<C-e>", "<END>")
map("v", "<C-a>", "<HOME>")
map("i", "<C-e>", "<END>")
map("i", "<C-a>", "<HOME>")
map("x", "<C-e>", "<END>")
map("x", "<C-a>", "<HOME>")

-- Gotta have the TAB's to nav buffers
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprevious<CR>")

-- tmux navigate
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")

local wk = require("which-key")
wk.add({
	-- File / Telescope
	{ "<leader>f", group = "+file" },
	{
		"<leader>fo",
		"<cmd>Telescope oldfiles<cr>",
		desc = "Find Recently Opened Files",
	},
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Command" },
	-- ["<leader>fd"] = {
	-- 	"<cmd>Telescope diagnostics<cr>",
	-- 	"Find Diagnostics",
	-- },
	-- ["<leader>fh"] = {
	-- 	"<cmd>Telescope help_tags<cr>",
	-- 	"Find Help Tags",
	-- },
	-- ["<leader>fj"] = {
	-- 	"<cmd>Telescope jumplist<cr>",
	-- 	"Find Jumplist",
	-- },
	-- ["<leader>fk"] = {
	-- 	"<cmd>Telescope keymaps<cr>",
	-- 	"Find Keymaps",
	-- },
	-- ["<leader>fw"] = {
	-- 	"<cmd>Telescope grep_string<cr>",
	-- 	"Find Word",
	-- },
	-- ["<leader>fb"] = {
	-- 	"<cmd>Telescope buffers<cr>",
	-- 	"Find Buffers",
	-- },
	-- ["<leader>fm"] = {
	-- 	"<cmd>Telescope marks<cr>",
	-- 	"Telescope marks",
	-- },
	-- ["<leader>fr"] = {
	-- 	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	-- 	"Find and Replace",
	-- },
	--
	-- -- Undotree
	-- ["<leader>u"] = {
	-- 	"<cmd>UndotreeToggle<cr>",
	-- 	"Undotree Toggle",
	-- },
	--
	-- Create New file
	{ "<leader>fn", "<cmd>enew<cr>", desc = "New File" },

	-- Oil
	-- ["-"] = { "<cmd>Oil<cr>", "Open parent directory" },
	-- -- Git
	-- ["<leader>gw"] = {
	-- 	"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
	-- 	"List Git Worktrees",
	-- },
	-- ["<leader>gW"] = {
	-- 	"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
	-- 	"Create Git Worktree",
	-- },
	-- ["<leader>g"] = { name = "+git" },
	-- ["<leader>gb"] = {
	-- 	"<cmd>Gitsigns toggle_current_line_blame<cr>",
	-- 	"Git Blame Toggle",
	-- },
	-- ["<leader>gp"] = {
	-- 	"<cmd>Gitsigns preview_hunk<cr>",
	-- 	"Preview Hunk",}
	-- },
	{	"<leader>gs",
		"<cmd>Neogit<cr>",
		desc = "Git Status",
	},
	-- ["<leader>gy"] = {
	-- 	"<cmd>brazil.display_package_under_cursor_url<cr>",
	-- 	"Display URL for Package under Cursor",
	-- },
	--
	-- Diagnostics
	{	"<S-d>",
		"<cmd>lua vim.diagnostic.open_float()<cr>",
		desc = "Show Diagnostic",
	},

	-- Terminal
	{	"<C-t>",
		'<cmd>lua require("FTerm").toggle()<cr>',
		desc = "Terminal Toggle",
	},
	--
	-- -- AI Prompt
	-- ["<leader>ai"] = {
	-- 	"<cmd>ProomptExplain<cr>",
	-- 	"AI Prompt",
	-- },
	--
	-- -- Tests
	-- ["<leader>t"] = { name = "+test" },
	-- ["<leader>tn"] = { "<cmd>TestNearest<CR>" },
	-- ["<leader>tf"] = { "<cmd>TestFile<CR>" },
	-- ["<leader>ts"] = { "<cmd>TestSuite<CR>" },
	-- ["<leader>tl"] = { "<cmd>TestLast<CR>" },
	-- ["<leader>tv"] = { "<cmd>TestVisit<CR>" },
	--
	-- -- Trouble
	-- [";"] = { name = "+trouble" },
	-- [";x"] = {
	-- 	'<cmd>lua require("trouble").toggle()<cr>',
	-- 	"Trouble Toggle",
	-- },
	-- [";w"] = {
	-- 	'<cmd>lua require("trouble").toggle("workspace_diagnostics")<cr>',
	-- 	"Trouble WS Diagnostics",
	-- },
	-- [";d"] = {
	-- 	'<cmd>lua require("trouble").toggle("document_diagnostics")<cr>',
	-- 	"Trouble Doc Diagnostics",
	-- },
	-- [";q"] = {
	-- 	'<cmd>lua require("trouble").toggle("quickfix")<cr>',
	-- 	"Trouble Quickfix",
	-- },
	-- [";l"] = {
	-- 	'<cmd>lua require("trouble").toggle("quickfix")<cr>',
	-- 	"Trouble loclist",
	-- },
	-- ["gR"] = {
	-- 	'<cmd>lua require("trouble").toggle("lsp_references")<cr>',
	-- 	"Trouble lsp_references",
	-- },
	--
	-- -- ZenMode
	-- ["<leader>z"] = { "<cmd>ZenMode<cr>", "ZenMode" },
	--
	-- Yanking
	{ "<leader>y", group = "+yank" },
	{ "<leader>yr", "<cmd>lua YankRelativePathToOsc()<cr>", desc = "Yank relative file path" },
	{ "<leader>yf", "<cmd>lua YankFullPathToOsc()<cr>", desc = "Yank full file path" },
	--
	-- -- Scrathces
	-- ["<leader>s"] = { name = "+scratch" },
	-- ["<leader>ss"] = { "<cmd>Scratch<cr>" },
	-- ["<leader>so"] = { "<cmd>ScratchOpen<cr>" },
	--
	-- -- Debugging
	-- ["<leader>d"] = { name = "+debugging" },
	-- ["<leader>dC"] = {
	-- 	"<cmd>lua require'dap'.run_to_cursor()<cr>",
	-- 	"Run To Cursor",
	-- },
	-- ["<leader>dd"] = {
	-- 	"<cmd>lua require'dap'.disconnect()<cr>",
	-- 	"Disconnect",
	-- },
	-- ["<leader>dg"] = {
	-- 	"<cmd>lua require'dap'.session()<cr>",
	-- 	"Get Session",
	-- },
	-- ["<leader>dp"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
	-- ["<leader>db"] = {
	-- 	"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
	-- 	"Toggle Breakpoint",
	-- },
	-- ["<F1>"] = {
	-- 	"<cmd>lua require'dap'.continue()<cr>",
	-- 	"Continue",
	-- },
	-- ["<F2>"] = {
	-- 	"<cmd>lua require'dap'.step_into()<cr>",
	-- 	"Step Into",
	-- },
	-- ["<F3>"] = {
	-- 	"<cmd>lua require'dap'.step_over()<cr>",
	-- 	"Step Over",
	-- },
	-- ["<F4>"] = {
	-- 	"<cmd>lua require'dap'.step_out()<cr>",
	-- 	"Step Out",
	-- },
	-- ["<F5>"] = {
	-- 	"<cmd>lua require'dap'.step_back()<cr>",
	-- 	"Step Back",
	-- },
	-- ["<F12>"] = {
	-- 	"<cmd>lua require'dap'.restart()<cr>",
	-- 	"Step Back",
	-- },
	--
	-- -- Neotest
	-- ["<leader>rt"] = {
	-- 	"<cmd>lua require('neotest').run.run()<cr>",
	-- 	"Run nearest test",
	-- },
	-- ["<leader>rf"] = {
	-- 	"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
	-- 	"Run nearest test",
	-- },
	-- ["<leader>rd"] = {
	-- 	"<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
	-- 	"Run nearest test",
	-- },
})
