--[[
-- Utilities that help with the configuration of the config.
--
-- This was influenced by many people so I do not take credit on anything here
--]]
local utils = {}

local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

function utils.opt(scope, key, val)
    scopes[scope][key] = val
    if scope ~= "o" then
        scopes["o"][key] = val
    end
end

function utils.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.is_root()
    local output = vim.fn.systemlist "id -u"
    return ((output[1] or "") == "0")
end

return utils
