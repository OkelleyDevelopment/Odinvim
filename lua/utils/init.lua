local utils = {}

local scopes = { o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, val)
  scopes[scope][key] = val
  if scope ~= 'o' then scopes['o'][key] = val end
end

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return utils
