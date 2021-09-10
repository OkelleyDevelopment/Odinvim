-- configuration options for stylua
local filetype_configs = {
  lua = {
    function()
      return {
        exe = 'stylua',
        args = {
          '--config-path ~/.config/nvim/lua/plugins/stylua.toml',
          '-',
        },
        stdin = true,
      }
    end,
  },
  python = {
    function()
      return {
        exe = 'yapf',
        args = {
          '',
        },
        stdin = true,
      }
    end,
  },
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    markdown = {
        -- should be prettier
        function()
            return {
                prettier_config
            }
        end
    }
}

-- configuration options for prettier
local prettier_config = {
  function()
    return {
      exe = 'prettier',
      args = {
        '--stdin-filepath',
        vim.api.nvim_buf_get_name(0),
        '--single-quote',
        '--tab-width 2',
        '--trailing-comma all',
        '--jsx-single-quote',
        '-w'
      },
      stdin = true,
    }
  end,
}

-- add a prettier_config for all js/ts/vue/svelte filetypes
for _, ft in pairs({ 'markdown','javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'svelte', 'vue' }) do
  filetype_configs[ft] = prettier_config
end

-- require formatter.nvim
require('formatter').setup({
  logging = false,
  filetype = filetype_configs,
})

-- call formatter.nvim automatically on save
vim.cmd[[
augroup FormatterNvimWebDev
  autocmd!
  autocmd BufWritePost *.md,*.js,*.jsx,*.ts,*.tsx,*.svelte,*.vue Format
augroup END
]]
