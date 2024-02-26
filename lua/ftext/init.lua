-- Indicates the filetype to register for these file types
-- and will allow LuaSnip to properly select the snippets to load.
--
vim.cmd('autocmd BufNewFile,BufRead *.plantuml set filetype=plantuml')
vim.cmd('autocmd BufNewFile,BufRead *.puml set filetype=plantuml')
