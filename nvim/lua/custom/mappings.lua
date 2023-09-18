local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Run or continue the debugger",
		},

		["<leader>e"] = { vim.cmd.Ex, "open explorer", opts = { nowait = true } },
		["<C-e>"] = { "<END>", opts = { nowait = true } },
		["<C-a>"] = { "<HOME>", opts = { nowait = true } },

		-- better quit and save
		["<leader>q"] = { ":qa<CR>", "quit", opts = { nowait = true } },
		["<C-q>"] = { ":qa!<CR>", "force quit all", opts = { nowait = true } },
		["<leader>x"] = { ":bd<CR>", "close buffer", opts = { nowait = true } },
		["<leader>w"] = { ":w!<CR>", "save buffer", opts = { nowait = true } },
		["<leader>h"] = { ":nohl<CR>", "no higlight", opts = { nowait = true } },

		-- jumping
		["<J>"] = { "mzJ`z", "same place", opts = { nowait = true } },
		["<C-d>"] = { "<C-d>zz", "jump down", opts = { nowait = true } },
		["<C-u>"] = { "<C-u>zz", "jump down", opts = { nowait = true } },

		-- clipboard stuff
		["<leader>y"] = { '"+y', "copy to system clipboard", opts = { nowait = true } },
		["<leader>Y"] = { '"+Y', "copy to system clipboard", opts = { nowait = true } },
		["<leader>yr"] = { ":lua YankRelativePathToOsc()<CR>", opts = { nowait = true } },
		["<leader>yf"] = { ":lua YankFullPathToOsc()<CR>", opts = { nowait = true } },

		-- Gotta have the TAB's to nav buffers
		["<TAB>"] = { ":bnext<CR>", opts = { nowait = true } },
		["<S-TAB>"] = { ":bprevious<CR>", opts = { nowait = true } },

		-- tmux navigate
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", opts = { nowait = true } },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", opts = { nowait = true } },
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", opts = { nowait = true } },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", opts = { nowait = true } },

		-- harpoon
		["<leader>m"] = { "<cmd> lua require('harpoon.mark').toggle_file()<CR>", opts = { nowait = true } },
		["<leader>,"] = { "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>", opts = { nowait = true } },
		["J"] = { "<cmd> lua require('harpoon.ui').nav_next()<CR>", opts = { nowait = true } },
		["Q"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<CR>", opts = { nowait = true } },
		["W"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<CR>", opts = { nowait = true } },
		["E"] = { "<cmd> lua require('harpoon.ui').nav_file(3)<CR>", opts = { nowait = true } },
		["R"] = { "<cmd> lua require('harpoon.ui').nav_file(4)<CR>", opts = { nowait = true } },

		-- CW
		["<C-w>"] = { "<cmd>:CWGenerateNvim<CR>", opts = { nowait = true } },
	},
	i = {
		["<C-e>"] = { "<END>", opts = { nowait = true } },
		["<C-a>"] = { "<HOME>", opts = { nowait = true } },
		["jk"] = { "<ESC>", "escape" },
	},
	v = {
		["<C-e>"] = { "<END>", opts = { nowait = true } },
		["<C-a>"] = { "<HOME>", opts = { nowait = true } },
		[">"] = { ">gv", "indent", opts = { nowait = true } },
		["<"] = { "<gv", "indent", opts = { nowait = true } },
		["J"] = { ":m '>+1<CR>gv=gv", opts = { nowait = true } },
		["K"] = { ":m '<-2<CR>gv=gv", opts = { nowait = true } },
		["<leader>y"] = { '"+y', "copy to system clipboard", opts = { nowait = true } },
	},
}

return M
