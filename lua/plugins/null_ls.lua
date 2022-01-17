--[[
-- null-ls configuration setup.
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 9, 2021
--]]

local ok, null = pcall(require, "null-ls")

if not ok then
    return
end

------------------------------------ Key Mappings ---------------------------------------
local utils = require "utils"
local opts = { silent = true }

utils.map("n", "<leader>s", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", opts)

-----------------------------------------------------------------------------------------

local formatting = null.builtins.formatting

-- I have solidity specified because I found a prettier addition that
-- might work well
local sources = {
    formatting.prettier.with {
        filetype = { "html", "json", "yaml", "markdown" },
        extra_filetypes = { "toml", "solidity", "plantuml" },
        extra_args = {
            "--no-semi",
            "--single-quote",
            "--jsx-single-quote",
        },
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
}

null.setup {
    debug = false,
    sources = sources,
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]]
        end
    end,
}
