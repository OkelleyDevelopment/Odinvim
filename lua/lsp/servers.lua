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

    if server.name == "sumneko_lua" then
        local lua_opts = require "lsp.configs.sumneko_lua_settings"
        opts = vim.tbl_deep_extend("force", lua_opts, opts)
    end

    server:setup(opts)
end)
