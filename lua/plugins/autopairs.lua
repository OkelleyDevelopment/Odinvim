--[[
-- Autopairs configuration setup.
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 9, 2022
--]]

local ok, auto = pcall(require, "nvim-autopairs")

if not ok then
    return
end

-- TODO: Might adjust some settings here
-- default config seems to work just fine though
auto.setup {
    check_ts = true,
}
