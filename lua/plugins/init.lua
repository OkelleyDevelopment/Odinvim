-- ----------------------------------------------------------------------------
-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- ----------------------------------------------------------------------------


-- Plugin Configs
-- ./plugs.lua
require 'plugins.plugs'

-- Completion 
require 'plugins.cmp'

-- File Exploration
require 'plugins.nv_lir'

-- Autopair ({"[]"})
require 'plugins.autopairs'

require 'plugins.formatter'
