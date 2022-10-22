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

-- Config Themes
require "themes"

-- LSP settings (Mason, lspconfig)
require "lsp"

-- Plugin Config
require "plugins"

-- Setup Plugin Configs post install
require "plugins.configs"
