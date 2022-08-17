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

	-- Lsp
	use({ "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig" })
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
	use("nvim-treesitter/nvim-treesitter-context")

	-- UI, Theme
	use("folke/tokyonight.nvim")
	use("akinsho/bufferline.nvim")
	use("preservim/tagbar")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Quality if live
	use("folke/which-key.nvim")
	use("justinmk/vim-sneak")
	use({ "jdhao/better-escape.vim", event = "InsertEnter" })
	use("ethanholz/nvim-lastplace")
	use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })
	use({
		"ojroques/vim-oscyank",
		config = function()
			vim.cmd([[let g:oscyank_term = 'tmux']])
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Docs and Productivity
	use("jkramer/vim-checkbox")
	use({ "kkoomen/vim-doge", run = ":call doge#install()" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
