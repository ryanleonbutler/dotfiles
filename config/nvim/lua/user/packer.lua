local fn = vim.fn
local install_path = fn.stdpath("data") .. "site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- tpope
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")

	-- Auto pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Yank from SSH/Tmux
	use({
		"ojroques/vim-oscyank",
		config = function()
			vim.cmd([[let g:oscyank_term = 'tmux']])
		end,
	})

	-- Telescope / Plenary
	use("nvim-lua/plenary.nvim")
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- the man himself, what a legend!
	use("ThePrimeagen/git-worktree.nvim")
	use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })

	-- Lsp
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind-nvim")
	use("nvim-lua/lsp_extensions.nvim")
	use("simrat39/symbols-outline.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Tabbar
	use("romgrk/barbar.nvim")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Colorschemes
	use("gruvbox-community/gruvbox")
	use("folke/tokyonight.nvim")

	-- Start it up
	-- use "mhinz/vim-startify"

	-- Mistakes were made
	use("mbbill/undotree")

	-- very very sneaky
	use("justinmk/vim-sneak")

	-- class outline
	use("preservim/tagbar")

	-- Faster escape
	use({ "jdhao/better-escape.vim", event = "InsertEnter" })
end)