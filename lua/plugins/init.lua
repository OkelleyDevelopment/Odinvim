---[[
-- Plugin Requires, install, packer setup, and more!
--
-- Author: Nicholas O'Kelley
-- Updated: 06/21/2022
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
end

vim.cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost init.lua PackerCompile"

------------------------------------------------------------------------------

local ok, packer = pcall(require, "packer")
if not ok then
    print "Packer missing, check lua/plugins/init.lua"
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
    use { "j4d3nw/gemstones.nvim" }
    --use "rebelot/kanagawa.nvim"
    --use "theniceboy/nvim-deus"
    --use "tiagovla/tokyodark.nvim"

    ----- Syntax Highlight ----
    use "OkelleyDevelopment/vim-solidity"
    use "aklt/plantuml-syntax"

    ----- Tools and Utilities -----

    use { "davidgranstrom/nvim-markdown-preview" }
    use { "nvim-lua/plenary.nvim" }
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

    --------- Snippets Support ---------
    --
    use { "L3MON4D3/LuaSnip" } -- the snippets engine
    --use "rafamadriz/friendly-snippets" -- snippets we can use
    use { "OkelleyDevelopment/friendly-snippets" } -- Forked my own version
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
    use { "simrat39/rust-tools.nvim" }
    use {
        "saecki/crates.nvim",
        tag = "v0.2.1",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    }
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
