--[[
--  Zen mode configuration setup.
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 22, 2022
--]]

local ok, zen = pcall(require, "zen-mode")

if not ok then
    return
end

--------- Key mappings ---------

local utils = require "utils"
local opts = { silent = true }

utils.map("n", "<leader>z", "<cmd>ZenMode<cr>", opts)

zen.setup {
    window = {
        backdrop = 1,
        options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
        },
    },
}
