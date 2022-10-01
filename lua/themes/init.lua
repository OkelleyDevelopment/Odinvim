-- [[
-- Selected Themes for Odinvim
--
-- Author: Nicholas O'Kelley
-----------------------------------------------------
--]]

--local ok, gem = pcall(require, "gemstones")
-- local ok, kana = pcall(require, "kanagawa")
local ok, ayu = pcall(require, "ayu")

if not ok then
    print "theme not loaded"
    return
end

--gem.setup()
vim.opt.termguicolors = true
--vim.cmd "colorscheme gemstones"
--vim.cmd "colorscheme kanagawa"
vim.cmd "colorscheme ayu-dark"
