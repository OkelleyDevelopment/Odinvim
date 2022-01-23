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

utils.map(
    "n",
    "<leader>e",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = false}))<cr>",
    opts
)

todo.setup {}
