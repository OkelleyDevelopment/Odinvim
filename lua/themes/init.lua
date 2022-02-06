-- [[
-- Selected Themes for Odinvim that I thought were nice
--
-- Author: Nicholas O'Kelley
-----------------------------------------------------
-- Directions:
-- Uncomment here and in the `../plugins/init.lua` uncomment the theme you wish to load
-- then close out of neovim and re-sync packer on the `init.lua` in the root.
-- Close and reopen neovim and the theme should appear as you wanted.
--
-- You can have all the themes uncommented in the plugins but I don't want to have so
-- much installed as I am trying to maintain a slim but functional configuration.
-- ]]
------------------------------------------------------------------------------------------

-- local ok, rose = pcall(require, "rose-pine")
--local ok, tokyonight = pcall(require, "tokyonight-nvim")
--require "tokyonight"
--local ok, nord = pcall(require, "nord")
--local ok, onenord = pcall(require, "onenord")
-- local ok, no_clown_fiesta = pcall(require, "no-clown-fiesta")

local ok, lighthaus = pcall(require, "lighthaus")

vim.opt.termguicolors = true
vim.cmd [[colorscheme lighthaus]]

--onenord.setup()
--no_clown_fiesta.set()
--rose.set()
--nord.set()
