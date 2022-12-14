---[[
-- Sourcing the plugins for the configuration
--
-- Author: Nicholas O'Kelley
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-lua/plenary.nvim", dev = false },
    { 
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "tamago324/lir.nvim",
        config = function()
            local utils = require "utils"
            local lir = require "lir"
            local actions = require "lir.actions"
            local mark_actions = require "lir.mark.actions"
            local clipboard_actions = require "lir.clipboard.actions"
            local keyOpts = { noremap = true, silent = true }

            -- Maps the leader + f to open the floating file explorer
            utils.map("n", "<Leader>f", ":lua require'lir.float'.toggle()<CR>", keyOpts)

            lir.setup {
                show_hidden_files = true,
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
                }
            }
            lir.devicons_enable = true
        end,


    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "vim",
                    "vimdoc",
                    "query",
                    "lua",
                    "rust",
                    "haskell"
                },

                auto_install = true,

                highlight = {
                    enable = true,
                },
            })
        end,
    },
    { 
        "nvim-telescope/telescope.nvim",
        config = function()
            local utils = require "utils"
            local opts = { silent = true }
            local ok, telescope = pcall(require, "telescope")

            if not ok then
                print "Failed to load telescope"
                return
            end

            utils.map(
                "n",
                "<leader>e",
                "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({previewer = false}))<cr>",
                opts
            )
            utils.map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)

            -----------------------------------------

            telescope.setup {
                defaults = {
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    prompt_prefix = "",
                    selection_caret = "> ",
                    path_display = { "smart" },

                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            --["<C-h>"] = "which_key",
                        },
                    },
                },
                pickers = {
                    -- Default configuration for builtin pickers goes here:
                    -- picker_name = {
                    --   picker_config_key = value,
                    --   ...
                    -- }
                    -- Now the picker_config_key will be applied every time you call this
                    -- builtin picker
                },
                extensions = {
                    -- Your extension configuration goes here:
                    -- extension_name = {
                    --   extension_config_key = value,
                    -- }
                    -- please take a look at the readme of the extension you want to configure
                },
            }
        end
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lua", ft = "lua" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
    { 
        "hrsh7th/nvim-cmp",
            config = function()
                local ok, luasnip = pcall(require, "luasnip")
                if not ok then
                    print "Failed to load LuaSnip"
                    return
                end

                local ok, cmp = pcall(require, "cmp")
                if not ok then
                    print "Failed to load cmp"
                    return
                end
                ---------------------------------------------------------------------
                -- Found this trick from Chris@Machine on his discord
                -- this selects the loader to read the json of our snippets
                -- in this case, friendly-snippets
                require("luasnip/loaders/from_vscode").lazy_load()
                require("luasnip").filetype_extend("javascript", { "javascriptreact" })
                require("luasnip").filetype_extend("javascriptreact", { "html" })

                -- Extend javascript to load the react snippets too
                require("luasnip").filetype_extend("typescript", { "javascript" })

                -- Added this for my custom snippets (April 9, 2022)
                require("luasnip/loaders/from_vscode").load { paths = "/home/nikolai/.config/nvim/snippets" }

                local check_backspace = function()
                    local col = vim.fn.col "." - 1
                    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
                end
                ---------------------------------------------------------------------

                -- Feel free to add in icons
                -- using nerd font or something, I do not like using them
                -- though :)
                local kind_icons = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                }

                cmp.setup {
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body) -- For `luasnip` users.
                        end,
                    },
                    mapping = {
                        ["<C-k>"] = cmp.mapping.select_prev_item(),
                        ["<C-j>"] = cmp.mapping.select_next_item(),
                        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                        ["<C-e>"] = cmp.mapping {
                            i = cmp.mapping.abort(),
                            c = cmp.mapping.close(),
                        },
                        -- Accept currently selected item. If none selected, `select` first item.
                        ["<CR>"] = cmp.mapping.confirm { select = true },
                        ["<Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expandable() then
                                luasnip.expand()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            elseif check_backspace() then
                                fallback()
                            else
                                fallback()
                            end
                        end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                    "i",
                    "s",
                }),
            },
            -- Found this trick from chris@machines' youtube video
            -- on setting up cmp
            -- https://www.youtube.com/watch?v=6F3ONwrCxMg&t=831s
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[SNIP]",
                        buffer = "[BUFF]",
                        path = "[PATH]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            }),
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            window = {
                documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                },
            },
            experimental = {
                ghost_text = false,
                native_menu = false,
            },
        }
    end
    },
    {   "williamboman/mason.nvim",
        config = function()
            require "mason".setup{}
        end
    },
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust-tools").setup {}
        end
    },
    { "neovim/nvim-lspconfig" },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
          require("todo-comments").setup{}
      end
    }
})
