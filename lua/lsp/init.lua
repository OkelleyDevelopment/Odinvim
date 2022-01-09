--[[
-- Language Server Protocol Information
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 3, 2021
--]]

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    return
end

require('lsp.servers')
require('lsp.core').setup()
