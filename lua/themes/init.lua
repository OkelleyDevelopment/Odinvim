-- [[
-- Selected Themes for Odinvim
--
-- Author: Nicholas O'Kelley
-----------------------------------------------------
--]]

--local ok, gem = pcall(require, "gemstones")
local ok, kang = pcall(require, "kanagawa")

if not ok then
    return
end

--gem.setup()
vim.opt.termguicolors = true
--vim.cmd "colorscheme gemstones"
vim.cmd "colorscheme kanagawa"
