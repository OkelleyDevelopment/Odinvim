-- Remove all trailing whitespace on save
vim.api.nvim_exec([[
    augroup TrimWhiteSpace
        au!
        autocmd BufWritePre * :%s/\s\+$//e
    augroup END
]], false)
