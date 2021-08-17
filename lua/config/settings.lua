local utils = require('utils')
local set = utils.opt
local cmd = vim.cmd

-- Set leader key
vim.g.mapleader = " "  -- Map leader key

-------------------------- General Settings ---------------------------

cmd 'syntax enable'
cmd 'filetype plugin indent on'

set('o', 'wrap', true)
set('o', 'hidden', true)
set('o', 'encoding', 'utf-8')
set('o', 'fileencoding', 'utf-8')
set('o', 'cmdheight', 2)
set('o', 'ruler', true)
set('o', 'mouse', 'a')
set('o', 'splitbelow', true)
set('o', 'splitright', true)
set('b', 'tabstop', 4)
set('b', 'shiftwidth', 4)
set('o', 'smarttab', true)
set('b', 'expandtab', true)
set('b', 'smartindent', true)
set('b', 'autoindent', true)
set('w', 'number', true)
set('w', 'relativenumber', true)
--set('o', 'background', 'dark')
set('o', 'conceallevel', 0)
set('o', 'showmode', false)
set('o', 'updatetime', 300)
set('o', 'timeoutlen', 500)
set('o', 'clipboard','unnamed,unnamedplus')
set('w', 'colorcolumn', '80')
set('o', 'scrolloff', 4)
set('o', 'smartcase', true)
set('w', 'wrap', false)

-------------------------- Status Line ---------------------------
local statusline = '%#CursorLineNr#'
statusline = statusline .. ' %y' 
statusline = statusline .. ' %M' 
statusline = statusline .. ' %r'
statusline = statusline .. ' %f' 
statusline = statusline .. '%='
statusline = statusline .. '%#CursorLineNr#' 
statusline = statusline .. ' %l/%L' 
statusline = statusline .. ' %p%%' 
statusline = statusline .. ' [%n]'
set('o', 'statusline', statusline)



