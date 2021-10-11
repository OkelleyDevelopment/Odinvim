--[[
-- Lua LSP 
--]]

require 'lsp.core'
require 'lsp.icons'

-- Styling of the pop up
local border = {
    {"╭", "FloatBorder"}, 
    {"─", "FloatBorder"},
    {"╮", "FloatBorder"}, 
    {"│", "FloatBorder"},
    {"╯", "FloatBorder"}, 
    {"─", "FloatBorder"},
    {"╰", "FloatBorder"}, 
    {"│", "FloatBorder"}
}

-----------  Lsp Init -----------
local nvim_lsp = require('lspconfig')
local lua_settings = require('lsp.lua_ls') 


local servers = {'clangd', 'pyright','rust_analyzer', 'html', 'tsserver', 'texlab'}

for _, lsp in ipairs(servers) do
    local config = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 }
    }

    if lsp == 'pyright' then
        config['cmd'] = {'pyright-langserver', '--stdio'}
    end

    if lsp == 'lua' then
      nvim_lsp[lsp].setup(lua_settings)
    else
        nvim_lsp[lsp].setup(config)
    end
end

-- nvim_lsp.sumneko_lua.setup(lua_settings)

-- require'lspconfig'.texlab.setup{}
