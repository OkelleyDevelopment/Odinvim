--[[
-- Signs for LSP
--
-- Can be configured in the text = "" portion, I opted to not have anything for now
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 3, 2021
--]]

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

return signs
