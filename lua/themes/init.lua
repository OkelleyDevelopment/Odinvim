-- [[
-- Selected Themes for Odinvim
--
-- Author: Nicholas O'Kelley
-----------------------------------------------------
--]]

--local ok, kana = pcall(require, "kanagawa")
--local ok, ayu = pcall(require, "ayu")

vim.opt.termguicolors = true
--vim.cmd "colorscheme kanagawa"
--vim.cmd "colorscheme ayu-dark"
local ok, naut = pcall(require, "nautilus")

if not ok then
    return
end

naut.load({ 
    transparent = true,
})
