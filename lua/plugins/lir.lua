--[[
-- Lir File Explorer config
--
-- Author: Nicholas O'Kelley
-- Updated: Jan 9, 2022
--]]

local ok, lir = pcall(require, "lir")

if not ok then
    return
end

local utils = require "utils"

local actions = require "lir.actions"
local mark_actions = require "lir.mark.actions"
local clipboard_actions = require "lir.clipboard.actions"

local keyOpts = { noremap = true, silent = true }

-- Maps the leader + f to open the floating file explorer
utils.map("n", "<Leader>f", ":lua require'lir.float'.toggle()<CR>", keyOpts)

lir.setup {
    show_hidden_files = true,
    devicons_enable = true,
    mappings = {
        --['<Enter>']     = actions.edit,
        ["l"] = actions.edit,
        ["<C-s>"] = actions.split,
        ["<C-v>"] = actions.vsplit,
        ["<C-t>"] = actions.tabedit,

        ["h"] = actions.up,
        ["q"] = actions.quit,

        ["K"] = actions.mkdir,
        ["N"] = actions.newfile,
        ["R"] = actions.rename,
        ["@"] = actions.cd,
        ["Y"] = actions.yank_path,
        --['.']     = actions.toggle_show_hidden,
        ["D"] = actions.delete,

        ["J"] = function()
            mark_actions.toggle_mark()
            vim.cmd "normal! j"
        end,
        ["C"] = clipboard_actions.copy,
        ["X"] = clipboard_actions.cut,
        ["P"] = clipboard_actions.paste,
    },
    float = {
        winblend = 0,
        win_opts = function()
            local width = math.floor(vim.o.columns * 0.8)
            local height = math.floor(vim.o.lines * 0.5)
            return {
                border = require("lir.float.helper").make_border_opts({
                    "+",
                    "─",
                    "+",
                    "│",
                    "+",
                    "─",
                    "+",
                    "│",
                }, "Normal"),
                width = width,
                height = height,
                row = 1,
                col = math.floor((vim.o.columns - width) / 2),
            }
        end,
    },
    hide_cursor = false,
}

-- custom folder icon
require("nvim-web-devicons").setup {
    override = {
        lir_folder_icon = {
            icon = "",
            color = "#7ebae4",
            name = "LirFolderNode",
        },
    },
}

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
