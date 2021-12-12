vim.api.nvim_exec([[
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.md,*.py FormatWrite
augroup END
]], true)

require('formatter').setup({
    filetype = {
        markdown = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                    },
                    stdin = true
                }
            end
        },
        python = {
            function()
                return {exe = "black", args = {"-"}, stdin = true}
            end
        },
        go = {
            function()
                return {
                    exe = "gofmt",
                    args = {
                        "-w", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                    },
                    stdin = false
                }
            end
        },
        json = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                    },
                    stdin = true
                }
            end
        },

    }
})
