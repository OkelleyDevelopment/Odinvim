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

-- This makes the linter not scream at me
return packer.startup(function(use)
    -- Packer to maintain itself
    use { "wbthomason/packer.nvim", opt = true }
    
    ----- Additional Syntax Highlight -----
    -- use "OkelleyDevelopment/vim-solidity"
    -- use "aklt/plantuml-syntax"

    -----    Themes    -----
    use { "pwntester/nautilus.nvim" }

    ----- Tools and Utilities -----
    use { "nvim-lua/plenary.nvim" } -- functions plugins utilize
    use { "nvim-telescope/telescope.nvim" }     -- Project Fuzzy Finder 
    use { "lewis6991/gitsigns.nvim" } -- Git integration
    use {
        "tamago324/lir.nvim",
        requires = {
            { "tamago324/lir-git-status.nvim" },
            { "kyazdani42/nvim-web-devicons" },
        },
    }

    --------- LSP Related ---------
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" } -- Collection of configurations for built-in LSP client

    --------- Code Completion ---------
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-nvim-lua", ft = "lua" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" }, -- luasnip completion source for nvim-cmp
        },
    }
    
    --------- Snippets Support ---------
    use { "L3MON4D3/LuaSnip" } -- the snippets engine
    use { "OkelleyDevelopment/friendly-snippets" } -- a fork of the original
    -- use { "rafamadriz/friendly-snippets" }

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
