--[[
.___       .__  __     .__
|   | ____ |__|/  |_   |  |  __ _______
|   |/    \|  \   __\  |  | |  |  \__  \
|   |   |  \  ||  |    |  |_|  |  // __ \
|___|___|  /__||__|   /\____/____/(____  /
         \/           \/               \/
----]]

-- Speed it up
require 'speed.startup'

-- General Configs
require 'core'

-- Plugin Config
require 'plugins'

-- Language Server Support
require 'lsp'

-- Load theme and set filetype
require 'speed.end'
