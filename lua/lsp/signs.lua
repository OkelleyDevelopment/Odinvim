--[[
-- Signs for LSP
--
-- Can be configured in the text = "" portion, I opted to not have anything for now
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 3, 2022
--]]

local signs = {
    { name = "DiagnosticSignError", text = "E" },
    { name = "DiagnosticSignWarn", text = "W" },
    { name = "DiagnosticSignHint", text = "H" },
    { name = "DiagnosticSignInfo", text = "I" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

return signs
