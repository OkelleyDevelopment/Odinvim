--[[
.___       .__  __     .__
|   | ____ |__|/  |_   |  |  __ _______
|   |/    \|  \   __\  |  | |  |  \__  \
|   |   |  \  ||  |    |  |_|  |  // __ \
|___|___|  /__||__|   /\____/____/(____  /
         \/           \/               \/
----]]

-- General Configs
require 'core'

-- Plugin Config
require 'plugins'
require 'plugins.cmp'

-- File Exploration
require 'plugins.nv_lir'

-- Lsp configuration
-- Add specific lang servers below lsp line ...

require 'lsp'
require 'plugins.cmp'

-- Extras
require 'themes'
require 'plugins.autopairs'
