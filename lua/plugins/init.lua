-- ----------------------------------------------------------------------------
-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- ----------------------------------------------------------------------------


------------------- Require Plugins -------------------------
-- Completion 
require 'plugins.cmp'
--
-- File Exploration
require 'plugins.lir'
--
-- Autopair ({"[]"})
require 'plugins.autopairs'
--
-- Code Formatting (Currently supports python and markdown)
require 'plugins.formatter'

------------------- End Require Plugins -------------------------


------------------- Packer Configs --------------------

-- This makes the linter not scream at me
local use = require('packer').use

require('packer').startup(function()

    -- Packer to maintain itself
    use {'wbthomason/packer.nvim', opt = true}

    ----- Themes -----
    -- use 'marko-cerovac/material.nvim'
    -- use({ 'rose-pine/neovim', as = 'rose-pine'})
    -- use 'shaunsingh/nord.nvim'
    use 'folke/tokyonight.nvim'
    -- use 'theniceboy/nvim-deus'
    -- use 'logico/typewriter-vim'
  	-- use('sainnhe/everforest')
    -- use 'tiagovla/tokyodark.nvim'

    ----- Tools and Utilities -----

    -- Default Lua functions for other plugins 
    use {'nvim-lua/plenary.nvim'}

    -- Autopair braces
    use { 'windwp/nvim-autopairs'}

    -- Git integration
    use { 'lewis6991/gitsigns.nvim',
          requires = {
            'nvim-lua/plenary.nvim'
          },
          config = function()
            require('gitsigns').setup()
        end}

    -- File browser
    use {"kyazdani42/nvim-web-devicons"}
    use {'tamago324/lir.nvim',
            requires = {
               {'kyazdani42/nvim-web-devicons'},
               {'tamago324/lir-git-status.nvim'},
            },
        }

    
    -- File Formatting
    use {"mhartington/formatter.nvim"}

    --------- Language Server Plugins ---------

    use { 'kabouzeid/nvim-lspinstall' }
    use {'neovim/nvim-lspconfig'} -- Collection of configurations for built-in LSP clientJkh
    use { 'onsails/lspkind-nvim' }
	use { 'ray-x/lsp_signature.nvim', module='lsp_signature' }
    use { 'L3MON4D3/LuaSnip' }
    use {'hrsh7th/nvim-cmp',
        requires = {
                {"hrsh7th/cmp-buffer"},
                {'hrsh7th/cmp-nvim-lua'},
                {"hrsh7th/cmp-nvim-lsp"},
                {'hrsh7th/cmp-calc'},
                {'hrsh7th/cmp-path'},
            }}

    
end)

