--[[
-- Language Server Protocol Information Core
--
-- This is where the magic happens to setup all the needed components,
-- studying this will help you see how to fit Lua together (some, I'm still learning
-- too)
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 3, 2021
--]]

local M = {}

local ok, signs = pcall(require, "lsp.signs")
if not ok then
    print "Signs not found"
    return
end

M.setup = function()
    local config = {
        -- disable virtual text; aka see it inline versus using the
        -- command `gl` to reveal the issues
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

-------------------------------------
----------- LSP Highlight -----------
-------------------------------------

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

-----------------------------------
----------- LSP KEYMAPS -----------
-----------------------------------

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<C-k>",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "[d",
        '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "]d",
        '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>q",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        opts
    )
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

--------------------------------------------
--------- ON ATTACH CAPABILITIES -----------
--------------------------------------------

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
