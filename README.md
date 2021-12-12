# Odnvim

## Motivation

Instead of relying on third party plugins for LSP like the old ([Nvim-config](https://github.com/OkelleyDevelopment/Nvim-Config)),
this refresh aims to harness the power of the built in LSP that NeoVim 0.5+ offers.

This configuration is by no means perfect and will continue to be updated as my work-flow
evolves.

## Prerequisites

You will need the following installed:

- NEOVIM (0.5+ -- will not work otherwise)
- An open mind

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

- `nvim-cmp` - Autocompletion framework

- `lspconfig` - configuration quickstart for neovim's built in LSP

- `nvim-lspinstall` - automatic installation of LSP servers

  - `:LspInstall <server name>`

- `lsp_signatures` - show function signature as you type

### Appearence

- Themes - Themes found around that I felt were neat, more can be added :)
  - Material Ocean
  - Tokyonight
  - Rose-pine
  - Nord
