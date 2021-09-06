local utils = require('utils')

-- Who likes the North Western side of the keyboard anyways? 
utils.map('i', 'jk', '<Esc>') -- jk to escape
utils.map('i', 'kj', '<Esc>') -- kj to escape

-- Capitalize on the letter
utils.map('i', '<c-u>', '<Esc>viwUi')
utils.map('n', '<c-u>', '<Esc>viwUi')

-- TAB in normal mode will move to the next buffer
utils.map('n', '<TAB>', ':bnext<CR>')

-- SHIFT + TAB will go back a buffer
utils.map('n', '<S-TAB>', ':bnext<CR>')

-- Better block tabbing
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')
