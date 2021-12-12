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
local servers = {'clangd','cssls', 'bashls','python','rust_analyzer', 'html', 'tsserver', 'texlab'}

for _, lsp in ipairs(servers) do
    local config = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 }
    }

    if lsp == 'python' then
        config['cmd'] = {'pyright-langserver', '--stdio'}
    else
        nvim_lsp[lsp].setup(config)
    end
end

-- nvim_lsp.sumneko_lua.setup(lua_settings)
