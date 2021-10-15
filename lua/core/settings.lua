local utils = require('utils')
local status = require('core.statusline')
local set = utils.opt
local cmd = vim.cmd

-- Set leader key
vim.g.mapleader = " "  -- Map leader key

-------------------------- General Settings ---------------------------

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
set('o', 'smartindent', true)
set('b', 'smartindent', true)
set('b', 'autoindent', true)
-- set('w', 'number', true)
--set('w', 'relativenumber', true)
set('o', 'background', 'dark')
set('o', 'conceallevel', 0)
set('o', 'showmode', false)
set('o', 'updatetime', 100)
set('o', 'timeoutlen', 300)
set('o', 'clipboard','unnamed,unnamedplus')
set('w', 'colorcolumn', '80')
set('o', 'scrolloff', 4)
set('o', 'smartcase', true)
set('w', 'wrap', false)
set('o', 'completeopt', "menuone,noselect")
set('o', 'statusline', status)



