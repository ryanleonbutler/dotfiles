local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
	-- packer
	use("wbthomason/packer.nvim")

	-- tpope
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")

	-- Telescope / Plenary
	use("nvim-lua/plenary.nvim")
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Git
	use("f-person/git-blame.nvim")
	use("ThePrimeagen/git-worktree.nvim")
	use("tpope/vim-fugitive")

	-- Lsp
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- use({ "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig" })
	-- use("jose-elias-alvarez/null-ls.nvim")
	-- use("onsails/lspkind-nvim")
	-- use("nvim-lua/lsp_extensions.nvim")
	-- use("simrat39/symbols-outline.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")

	-- UI, Theme
	use("gruvbox-community/gruvbox")
	use("folke/tokyonight.nvim")
	-- use({ "catppuccin/nvim", as = "catppuccin" })
	use("akinsho/bufferline.nvim")
	-- use("lukas-reineke/indent-blankline.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- use("Pocco81/true-zen.nvim")
	use("stevearc/aerial.nvim")

	-- Quality of live
	use("ethanholz/nvim-lastplace")
	use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })
	-- use("wikitopian/hardmode")
	-- use("mbbill/undotree")
	use("voldikss/vim-floaterm")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Docs and Productivity
	use("jkramer/vim-checkbox")
	-- use({ "kkoomen/vim-doge", run = ":call doge#install()" })

	-- Xwiki syntax highlighting
	use("ipkiss42/xwiki.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
