-- [[
-- Selected Themes for Odinvim that I thought were nice
--
-- Author: Nicholas O'Kelley
-----------------------------------------------------
--]]

require("gemstones").setup {}
vim.opt.termguicolors = true
vim.cmd "colorscheme gemstones"
--vim.cmd [[
--highlight Normal ctermbg=none guibg=none
--highlight NonText ctermbg=none guibg=none
--]]

--[[
vim.cmd [[try
            colorscheme kanagawa
          catch /.*/ 
            colorscheme default
          endtry]]
--vim.cmd [[colorscheme tokyonight]]
--]]
