---[[
-- Plugin Requires, install, packer setup, and more!
--
-- Author: Nicholas O'Kelley
-- Updated: March 26, 2022
--]]
--
------------------- Automatically Install Packer.nvim -------------------------
--
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    -- Allows us to bootstrap
    PACKER = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    --print "Packer installing"
    --vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost init.lua PackerCompile"

------------------------------------------------------------------------------

local ok, packer = pcall(require, "packer")
if not ok then
    --print "Packer missing, check lua/plugins/init.lua"
    return
end

--
-- Discussions with others has led me to this approach, Chris was
-- the latest, but I had in some notes where Vhyrro was mentioning
-- how to handle loading.
--
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

------------------- Require Plugins -------------------------
--
--require "plugins.plugins"
------------------- End Require Plugins -------------------------
--
--
------------------ Packer Configs --------------------

local ok, packer = pcall(require, "packer")

if not ok then
    return
end

-- This makes the linter not scream at me
return packer.startup(function(use)
    -- Packer to maintain itself
    use { "wbthomason/packer.nvim", opt = true }

    ----- Themes -----
    use "rebelot/kanagawa.nvim"
    --use { "rose-pine/neovim", as = "rose-pine" }
    --use "folke/tokyonight.nvim"
    --use "rmehri01/onenord.nvim"
    --use "theniceboy/nvim-deus"
    --use "tiagovla/tokyodark.nvim"
    --use "mrjones2014/lighthaus.nvim"

    ----- Syntax Highlight ----
    use "OkelleyDevelopment/vim-solidity"
    use "aklt/plantuml-syntax"

    ----- Tools and Utilities -----

    use { "davidgranstrom/nvim-markdown-preview" }

    -- Default Lua functions for other plugins
    use { "nvim-lua/plenary.nvim" }
    -- Autopair braces
    use { "windwp/nvim-autopairs" }

    -- Git integration
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            --require("gitsigns").setup()
            local okay, gitsigns = pcall(require, "gitsigns")
            if not okay then
                return
            end
            gitsigns.setup()
        end,
    }

    -- File browser
    use { "kyazdani42/nvim-web-devicons" }
    use {
        "tamago324/lir.nvim",
        requires = {
            { "tamago324/lir-git-status.nvim" },
        },
    }
    -- Project Fuzzy Finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- Todo comment highlighter
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- Twilight Mode
    --use { "folke/twilight.nvim" }

    -- Zen Mode
    use { "folke/zen-mode.nvim" }
    --
    --------- Snippets Support ---------
    --
    use { "L3MON4D3/LuaSnip" } -- the snippets engine
    --use "rafamadriz/friendly-snippets" -- snippets we can use
    use "OkelleyDevelopment/friendly-snippets" -- Forked my own version
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    --
    --------- Code Completion ---------
    --
    use "jose-elias-alvarez/null-ls.nvim" -- formatters and linters
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-nvim-lua", ft = "lua" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" }, -- luasnip completion source for nvim-cmp
            { "hrsh7th/cmp-calc" },
        },
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    --------- Language Server Plugins ---------
    --
    use { "neovim/nvim-lspconfig" } -- Collection of configurations for built-in LSP clientJkh
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json

    -- This is what will finish out the bootstrap
    if PACKER then
        require("packer").sync()
        print "------------------------------------------------"
        print "  ___      _  _             _        "
        print " / _ \\  __| |(_) _ _  __ __(_) _ __  "
        print "| (_) |/ _` || || ' \\ \\ V /| || '  \\ "
        print " \\___/ \\__/_||_||_||_| \\_/ |_||_|_|_|"
        print "Installing configurations, please wait..."
        print "------------------------------------------------"
    end
end)
