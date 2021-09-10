require 'config.settings'
local utils = require('utils')

-- Who likes the North Western side of the keyboard anyways? 
utils.map('i', 'jk', '<Esc>') -- jk to escape
utils.map('i', 'kj', '<Esc>') -- kj to escape

-- Split Movement
utils.map('n', '<C-h>', '<C-w>h')
utils.map('n', '<C-j>', '<C-w>j')
utils.map('n', '<C-k>', '<C-w>k')
utils.map('n', '<C-l>', '<C-w>l')

-- Easier Splits
utils.map('n', '<Leader>v', ':vsplit<CR>')
utils.map('n', '<Leader>h', ':split<CR>')


-- Capitalize word on letter
utils.map('i', '<c-u>', '<Esc>viwUi')
utils.map('n', '<c-u>', '<Esc>viwUi')

-- TAB in normal mode will move to the next buffer
utils.map('n', '<TAB>', ':bnext<CR>')

-- SHIFT + TAB will go back a buffer
utils.map('n', '<S-TAB>', ':bprevious<CR>')

-- Better block tabbing
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')
