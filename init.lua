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

-- Plugin Config
require "plugins"

-- Language Server Support
require "lsp"

-- Config Themes
require "themes"

-- Setup Plugin Configs post install
require "plugins.configs"
