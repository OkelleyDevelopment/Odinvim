--[[
-- Auto commands
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 9, 2021
--]]

vim.cmd [[
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

]]
