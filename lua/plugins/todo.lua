--[[
-- Todo comments configuration setup.
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 22, 2022
--]]

local ok, todo = pcall(require, "todo-comments")

if not ok then
    print "not okay"
    return
end

--------- todo-comments Keymappings ---------

local utils = require "utils"
local opts = { silent = true }

utils.map("n", "<leader>t", "<cmd>:TodoLocList<cr>", opts)
utils.map("n", "<leader>c", "<cmd>:q<cr>", opts)

todo.setup {}
