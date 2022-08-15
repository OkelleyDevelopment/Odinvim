# Odinvim

Author: Nicholas O'Kelley

<img src="./assets/odinvim.png"  width="700" height="400" />

## Motivation

Having built a configuration with VimScript prior ([Nvim-config](https://github.com/OkelleyDevelopment/Nvim-Config)),
this refresh aims to harness the power of the built in LSP support that Neovim 0.7 offers.

This configuration is by no means perfect, but it was built by me over several months of work and learning.
As good software should, this project will continue to have updates periodically as my workflow changes and
better solutions are found.

## Included Features

- [x] Git signs (changes, add, or removal)
- [x] File browsing
- [x] Auto-pairs
- [x] A few color schemes to get started
- [x] LSP support
  - [x] nvim-lsp-installer helps a ton in this area
- [x] Autocomplete (Just need to setup the servers correctly to your needs)
  - [x] friendly-snippets has some good stuff here too
- [x] Telescope
- [x] Format on save utilizing `null-ls`
- [ ] Nerd Fonts

## Installation

**IMPORTANT**: This config is primarily built on Neovim nightly builds

### Prerequisites

Neovim (v0.7.0)
Install the following for my setup:

- `clangd`
- `cargo install stylua` (lua formatter)
- `pip install black` (python formatter)
- `pip install pynvim`
- If you wish to utilize the `live_grep` (`<leader>g`) portion of the [Telescope plugin](https://github.com/nvim-telescope/telescope.nvim)
  - `ripgrep (rg)`
- Make sure you configure Node to be user level (no sudo + node)

  - `npm i -g neovim`
  - `npm install -g prettier` (Assumes your npm setup is for user level perms only)

- For the [`nvim-markdown-previewer`](https://github.com/davidgranstrom/nvim-markdown-preview):
  - Install pandoc
  - `npm install -g live-server`

### Final steps

Assuming you have the extra bits installed, the rest will be a breeze.

```
git clone https://github.com/OkelleyDevelopment/Odinvim.git ~/.config/nvim
```

Then follow the next sequence of steps:

1. Open Neovim and wait for the installs to finish
2. Exit Neovim
3. Resume as normal
4. Get healthy

```
:checkhealth
```

## Feature Breakdown

### Key Mappings

The key mappings are bootstrapped from within the `lua/config/keys.lua`. If you
wish to remove, simply comment out or delete the line.

If you wish to add a mapping, it is made easy with a utilities function in the format:

```
utils.map(mode, mapping, command, opts)
```

The basic modes include {'n': normal, 'i': insert, 'v': visual}. The `mapping` is the
keys you will press to get the action, and `command` is the command that would execute once
the mapping is made.

### Plugins

Can be found here `./lua/plugins/plugs.lua`

- `packer.nvim` - lua plugin manager to auto-install and update plugins

### Tools and Utilities

- `lir.nvim` - Simple file explorer for easier file navigation around projects
- `gitsigns` - git gutter indicators and hunk management
- `nvim-telescope/telescope.nvim` - Project fuzzy finder

### LSP and Code Completion

#### Snippet Support

- `L3MON4D3/LuaSnip` - A snippets engine
- `rafamadriz/friendly-snippets` - A collection of snippets
- `saadparwaiz1/cmp_luasnip` - snippet completion

#### Code Completion

- `hrsh7th/nvim-cmp` - Autocompletion framework

#### Language Servers

- `neovim/nvim-lspconfig` -- Collection of configurations for built-in LSP client
- `williamboman/nvim-lsp-installer` -- simple to use language server installer
- `tamago324/nlsp-settings.nvim` -- language server settings defined in JSON

### Appearance

- Themes - Themes found around that I felt were neat, more can be added :)
  - Kanagawa (Currently set)
  - Tokyonight
  - nvim-deus

## Extra Pictures

### Demo of `lir.nvim`

![Lir](./assets/lir_demo.png)

### Demo of `nvim-telescope`

![telescope live grep](./assets/telescope_demo.png)

## Why Odinvim?

I like projects with fun names and was originally trying to find a way to include
`OkelleyDevelopment`. This then shifted to the fun play on the initials `OD` to
become `Odinvim`.
