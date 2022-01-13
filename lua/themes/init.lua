-- [[
-- Selected Themes for Odinvim that I thought were nice
--
-- Author: Nicholas O'Kelley
-----------------------------------------------------
-- Directions:
-- Uncomment here and in the `../plugins/init.lua` uncomment the theme you wish to load
-- then close out of neovim and resync packer on the `init.lua` in the root.
-- Close and reopen neovim and the theme should appear as you wanted.
--
-- You can have all the themes uncommented in the plugins but I don't want to have so
-- much installed as I am trying to maintain a slim but functional configuration.
-- ]]
------------------------------------------------------------------------------------------

-- require('rose-pine').set()
-- require('nord').set()

-- vim.cmd[[colorscheme deus]]
-- vim.cmd[[ colorscheme material]]
-- vim.cmd[[colorscheme typewriter-vim]]
-- vim.cmd[[colorscheme everforest]]

-- require('themes.tokyodark')

local ok, onenord = pcall(require, "onenord")
if not ok then
    vim.cmd [[
    colorscheme default
    set background=dark
    ]]
end

onenord.setup()

-- This is what will get the config to install and not
-- error out.
--[[
vim.cmd [[

try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=NONE
endtry
]]
