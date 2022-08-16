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

	-- UI, Theme
	use("gruvbox-community/gruvbox")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	-- Telescope
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
            "LinArcX/telescope-command-palette.nvim"
		},
	})

	-- Git worktree, Harpoon
	use("ThePrimeagen/git-worktree.nvim")
	use({ "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } })

	-- LSP
	use({ "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig" })
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")
	use("simrat39/symbols-outline.nvim")
	use("glepnir/lspsaga.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")

	-- Pairs, tags, color, buffers
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")
	use("akinsho/nvim-bufferline.lua")

	-- Quality of life
	use("folke/zen-mode.nvim")
	use("ethanholz/nvim-lastplace")
	use("preservim/tagbar")
	use({ "jdhao/better-escape.vim", event = "InsertEnter" })
	use({
		"ojroques/vim-oscyank",
		config = function()
			vim.cmd([[let g:oscyank_term = 'tmux']])
		end,
	})

	-- Productivity, Docs
	use("jkramer/vim-checkbox")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use({ "kkoomen/vim-doge", run = ":call doge#install()" })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim")

	-- Tpope
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
