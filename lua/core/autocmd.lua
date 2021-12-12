-- Remove all trailing whitespace on save
vim.api.nvim_exec([[
    augroup TrimWhiteSpace
        au!
        autocmd BufWritePre * :%s/\s\+$//e
    augroup END
]], false)

vim.api.nvim_exec([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]], false)



