--[[
-- Autopairs configuration setup.
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 9, 2021
--]]

local ok, auto = pcall(require, "nvim-autopairs")

if not ok then
    return
end

-- TOOD: Might adjust some settings here
-- default config seems to work just fine though
auto.setup {
    check_ts = true,
}
