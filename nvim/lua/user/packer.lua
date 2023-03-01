local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false

end

local packer_bootstrap = ensure_packer()

-- Reloads Neovim after whenever you save packer.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup END
]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- Performance
    use("lewis6991/impatient.nvim")
    pcall(require, "impatient")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

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

    use("jose-elias-alvarez/null-ls.nvim")

    use "EdenEast/nightfox.nvim" -- Packer
    -- use({
    --     "rose-pine/neovim",
    --     as = "rose-pine",
    --     config = function()
    --         vim.cmd("colorscheme rose-pine")
    --     end,
    -- })

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-treesitter/nvim-treesitter-context")

    use("mbbill/undotree")
    use("ThePrimeagen/harpoon")
    use("ThePrimeagen/vim-be-good")
    use("tpope/vim-fugitive")
    use("tpope/vim-surround")
    use("tpope/vim-repeat")
    use("tpope/vim-commentary")
    use("f-person/git-blame.nvim")
    use({
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup({})
        end,
    })
    use("jkramer/vim-checkbox")
    use("ipkiss42/xwiki.vim")
    use({
		"ojroques/vim-oscyank",
		config = function()
			vim.cmd([[
            let g:oscyank_term = 'default'
            let g:oscyank_max_length = 10000000 
            ]])
		end,
	})

    -- Perf
    use("nathom/filetype.nvim")

    -- Work
    -- use(vim.g.work_plugins)

    if packer_bootstrap then
        require("packer").sync()
    end
end)
