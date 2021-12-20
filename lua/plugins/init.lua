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


    --------- Snippets Support (supposedly LOL)---------

    use { 'L3MON4D3/LuaSnip' } -- the snippets engine 
    use "rafamadriz/friendly-snippets" -- snippets we can use 
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    --------- Language Server Plugins ---------

    use {'neovim/nvim-lspconfig'} -- Collection of configurations for built-in LSP clientJkh
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json
    use "jose-elias-alvarez/null-ls.nvim" -- formatters and linters 

    use {'hrsh7th/nvim-cmp',
        requires = {
                {"hrsh7th/cmp-buffer"},
                {'hrsh7th/cmp-nvim-lua'},
                {"hrsh7th/cmp-nvim-lsp"},
                {'hrsh7th/cmp-path'},
                {'hrsh7th/cmp-calc'},
            }}


end)

