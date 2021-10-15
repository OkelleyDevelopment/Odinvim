--[[
-- A custom minimal statusline
--
-- Author: Nicholas O'Kelley
-- Date originally written: Late 2020
-- Date converted to lua: September 1, 2021
-- Last Modified: October 13, 2021 (Move to this file)
--
--
--]]

-------------------------- Status Line ---------------------------
local statusline = '%#CursorLineNr#'
statusline = statusline .. ' %y' 
statusline = statusline .. ' %M' 
statusline = statusline .. ' %r'
statusline = statusline .. ' %f' 
statusline = statusline .. '%='
statusline = statusline .. '%#CursorLineNr#' 
statusline = statusline .. ' %l/%L' 
statusline = statusline .. ' %p%%' 
statusline = statusline .. ' [%n]'

return statusline
