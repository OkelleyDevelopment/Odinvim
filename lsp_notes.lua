-- Notes for me to rewrite my lsp stuff
--
--
--
-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = {"pyright", "tsserver"}
-- for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end
-- config that activates keymaps and enables snippet support
--
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

-- lsp-install
-- This blog helped (with the functions below)
-- https://ka.codes/posts/nvim-lspinstall#nvim-lspinstall
local function setup_servers()
  require "lspinstall".setup()

  local servers = require "lspinstall".installed_servers()
  -- ... and add manually installed servers
  --table.insert(servers, "clangd")
  --table.insert(servers, "pyright")
  --table.insert(servers, "rust_analyzer")
  --table.insert(servers, "tsserver")

  -- Build each servers config
  for _, server in pairs(servers) do
    local config = make_config()

    if server == "lua" then
      config.settings = require("lsp.lua_ls")
    end

    if server == "tsserver" then
        config.settings = require("lsp.tsserver")
    end

    require "lspconfig"[server].setup(config)
  end
end

setup_servers()


