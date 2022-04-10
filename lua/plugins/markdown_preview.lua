local status, nm = pcall(require, "nvim-markdown-preview")
if not status then
    return
end

local utils = require "utils"

vim.cmd [[ let g:nvim_markdown_preview_theme = 'solarized-light']]
