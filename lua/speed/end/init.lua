vim.defer_fn(function()

    vim.cmd [[
        syntax enable
        filetype plugin indent on
    ]]

    require('themes')

end, 5)
