local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end

-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

-- Load Packer
cmd([[packadd packer.nvim]])

-- Initialize pluggins
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'            -- Package manager
    use 'neovim/nvim-lspconfig'             -- Collection of configurations for the built-in LSP client
    use 'hrsh7th/nvim-cmp'                  -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'              -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'          -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'                  -- Snippets plugin
    use 'olimorris/onedarkpro.nvim'         -- Theme

    -- Tab bar
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- Telescope
    use {
	'nvim-telescope/telescope.nvim',
	requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Startify
    use({
    	'mhinz/vim-startify',
   	config = function()
      	local path = vim.fn.stdpath('config')..'/lua/user/plugins/startify.lua'
      	vim.cmd('source '..path)
    	end
  })
end)
