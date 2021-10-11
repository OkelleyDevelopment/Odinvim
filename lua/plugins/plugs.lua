-- This makes the linter happy
local use = require('packer').use

require('packer').startup(function()

    -- Packer to maintain itself
    use {'wbthomason/packer.nvim', opt = true}

    -- Default Lua functions for other plugins
    use {'nvim-lua/plenary.nvim'}

    -- Autopair braces
    use { 'windwp/nvim-autopairs'}

    -- File browser
    use {"kyazdani42/nvim-web-devicons"}
    use {'tamago324/lir.nvim',requires = {
                                   {'kyazdani42/nvim-web-devicons'},
                                   {'tamago324/lir-git-status.nvim'},
                                   {'nvim-lua/plenary.nvim'},
                            },}

    -- Git integration
    use { 'lewis6991/gitsigns.nvim',
          requires = {
            'nvim-lua/plenary.nvim'
          },
          config = function()
            require('gitsigns').setup()
        end}

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    
    --use {'windwp/nvim-ts-autotag'}

    -- LSP and completion
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
                {'L3MON4D3/LuaSnip' },
                { "kdheepak/cmp-latex-symbols" },
                {'rafamadriz/friendly-snippets'},
            }}
    
    use { 'saadparwaiz1/cmp_luasnip' }

    use "rafamadriz/friendly-snippets"

    use({"ckipp01/stylua-nvim"})
        
    -- Java Debugging (Add note in Readme)
    use 'mfussenegger/nvim-jdtls'

    -- File Formatting (Supposedly)
    use "mhartington/formatter.nvim"

    ----- Themes -----
    
    use 'marko-cerovac/material.nvim'
    use({ 'rose-pine/neovim', as = 'rose-pine'})
    use 'shaunsingh/nord.nvim'
    use 'folke/tokyonight.nvim'
    use 'theniceboy/nvim-deus'
    use 'logico/typewriter-vim'
	use('sainnhe/everforest')

end)