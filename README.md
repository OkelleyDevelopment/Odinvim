# Odnvim

## Motivation

Instead of relying on third party plugins for LSP like the old ([Nvim-config](https://github.com/OkelleyDevelopment/Nvim-Config)),
this refresh aims to harness the power of the built in LSP that NeoVim 0.5+ offers.

This configuration is by no means perfect and will continue to be updated as my work-flow
evolves.

## Prerequisites

You will need the following installed:

- NEOVIM (0.5+ -- will not work otherwise)
  - I currently use the nightly 0.7+
- An open mind

Also make sure thse are installed:

- clangd
- `pip install pynvim`

Once I update the script to reflect the changes since August, these
dependencies will be handled.

## Included Features

- [x] Git signs (changes, add, or removal)
- [x] File browsing
- [x] Autopairs
- [x] LSP support
- [x] A few colorschemes to get started
- [ ] Autocomplete (Just need to setup the servers correctly)

## Key Mappings

The key mappings are bootstrapped from within the `lua/config/keys.lua`. If you
wish to remove, simply comment out or delete the line.

If you wish to add a mapping, it is made easy with a utils function in the format:

```
utils.map(mode, mapping, command)
```

The basic modes include {'n': normal, 'i': insert, 'v': visual}. The `mapping` is the
keys you will press to get the action, and `command` is the command that would execute once
the mapping is made.

## Plugins (`./lua/plugins/plugs.lua`)

- `packer.nvim` - lua plugin manager to auto-install and update plugins

### Git

- `gitsigns` - git gutter indicators and hunk management

### File exploration

- `lir.nvim` - Simple file explorer for easier file navigation around projects

### LSP and Code Completion

#### Snippets

- `L3MON4D3/LuaSnip` - A snippets engine
- `rafamadriz/friendly-snippets` - A collection of snippets
- `saadparwaiz1/cmp_luasnip` - snippet completion

#### Language Servers

- `neovim/nvim-lspconfig` -- Collection of configurations for built-in LSP clientJkh
- `williamboman/nvim-lsp-installer` -- simple to use language server installer
- `tamago324/nlsp-settings.nvim` -- language server settings defined in json
- `jose-elias-alvarez/null-ls.nvim` -- formatters and linters
- `nvim-cmp` - Autocompletion framework
- `lspconfig` - configuration quickstart for neovim's built in LSP

### Formatting (Still a WIP)

Currently utilizing `prettier` for formatting markdown, json, etc. Some settings
still need to be worked out and will be addressed soon.

- `mhartington/formater.nvim`

### Appearence

- Themes - Themes found around that I felt were neat, more can be added :)
  - Material Ocean
  - Tokyonight (Currently set)
  - Rose-pine
  - Nord
