require'nvim-autopairs'.setup{
    break_line_filetype = nil, -- enable this rule for all filetypes
    pairs_map = {
      ["'"] = "'",
      ['"'] = '"',
      ['('] = ')',
      ['['] = ']',
      ['{'] = '}',
      ['`'] = '`',
    },
    disable_filetype = { "TelescopePrompt" },
    html_break_line_filetype = {
      'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'
    },

    -- ignore alphanumeric, operators, quote, curly brace, and square bracket
    ignored_next_char = "[%w%.%+%-%=%/%,\"'{}%[%]]"
}
