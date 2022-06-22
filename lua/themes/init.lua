-- [[
-- Selected Themes for Odinvim that I thought were nice
--
-- Author: Nicholas O'Kelley
-----------------------------------------------------
--]]

local ok, gem = pcall(require, "gemstones")

if not ok then
    return
end

gem.setup()
vim.opt.termguicolors = true
vim.cmd "colorscheme gemstones"
