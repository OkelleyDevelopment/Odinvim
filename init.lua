--[[
                   ▄▄   ▄▄                         ▄▄                   
  ▄▄█▀▀██▄       ▀███   ██                         ██                   
▄██▀    ▀██▄       ██                                                   
██▀      ▀██  ▄█▀▀███ ▀███ ▀████████▄ ▀██▀   ▀██▀▀███ ▀████████▄█████▄  
██        ██▄██    ██   ██   ██    ██   ██   ▄█    ██   ██    ██    ██  
██▄      ▄█████    ██   ██   ██    ██    ██ ▄█     ██   ██    ██    ██  
▀██▄    ▄██▀▀██    ██   ██   ██    ██     ███      ██   ██    ██    ██  
  ▀▀████▀▀   ▀████▀███▄████▄████  ████▄    █     ▄████▄████  ████  ████▄
                                                                        
----]]

-- General Configs
require "core"

require "utils"

-- Plugin Config
require "plugins"

-- Config snippets for obscure filetypes
require "ftext"

-- LSP configuration (lspconfig and Mason)
require "lsp"
