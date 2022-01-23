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

-- require('themes.tokyodark')
-- local ok, rose = pcall(require, "rose-pine")
--local ok, nord = pcall(require, "nord")
local ok, onenord = pcall(require, "onenord")

if not ok then
    vim.cmd [[
    colorscheme default
    set background=dark
    return
    ]]
end

onenord.setup()
--rose.set()
--nord.set()
