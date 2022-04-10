-- [[
-- Selected Themes for Odinvim that I thought were nice
--
-- Author: Nicholas O'Kelley
-----------------------------------------------------

vim.opt.termguicolors = true
vim.cmd [[try
            colorscheme kanagawa
          catch /.*/ 
            colorscheme default
          endtry]]
--vim.cmd [[colorscheme tokyonight]]
