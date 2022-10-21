--[[
-- Servers for LSP
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 3, 2022
--]]

local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
    return
end

-- Register each of the server handlers for installed servers
-- Check lsp-installer for more info
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("lsp.core").on_attach,
        capabilities = require("lsp.core").capabilities,
    }

    server:setup(opts)
end)
