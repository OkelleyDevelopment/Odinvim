# Odnvim 

## Motivation

Instead of relying on third party plugins for LSP ([Like Nvim-config](https://github.com/OkelleyDevelopment/Nvim-Config)), 
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


## Future updates

### Short Term Goals (Next few weeks):
- [x] Autocomplete  (WIP)
- [ ] Code formatting
- [ ] Documentation on Installation
- [ ] Documentation update for adding plugins
- [ ] Documentation update
- [ ] Bring in more colorschemes

### Long Term

- [ ] zen mode
- [ ] Making an install script


## File Browsing 

Currently file browsing is handled via `lir.nvim`. To make edits to the setup
for lir, checkout `./lua/plugins/nv_lir.lua`

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


### Notes for when I update this readme
1. Formatter 
    - `pip install black`
2. `npm install -g vscode-html-languageserver-bin`
TODO: Add language server section ... this will be a while... 

TODO: Make the functions silent (passing as an opt)
TODO: Figure out why `lir.nvim` throws an error when renaming a file from the float menu



## Plugins

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

- `lsp_signatures` - show function signature as you type (Might not add)

- ``

### Appearence

- Themes - Themes found around that I felt were neat, more can be added :)
    - Material Ocean
    - Tokyonight
    - Rose-pine
    - Nord
