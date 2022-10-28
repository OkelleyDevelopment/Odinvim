--[[
-- Language Server Protocol Information
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 3, 2022
--]]

require "lsp.mason"
local ok, core = pcall(require, "lsp.core")

if not ok then 
    print "Core isn't loaded"
    return
end

core.setup() -- Sets up the core info for lsp

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

lspconfig["rust_analyzer"].setup({
    on_attach = core.on_attach,
    capabilities = core.capabilities,
})

lspconfig["tsserver"].setup({
    on_attach = core.on_attach,
    capabilities = core.capabilities,
})

[[--
lspconfig["sumneko_lua"].setup({
    on_attach = core.on_attach,
    capabilities = core.capabilities,
})
--]]
