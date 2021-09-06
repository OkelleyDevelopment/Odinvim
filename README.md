# Odnvim 

## Motivation

Instead of relying on third party plugins for LSP ([Like Nvim-config](https://github.com/OkelleyDevelopment/Nvim-Config)), 
this refresh aims to harness the power of the built in LSP that NeoVim 0.5+ offers.

This configuration is by no means perfect and will continue to be updated as my work-flow
evolves.

## Prerequisites

You will need the following installed:

- NEOVIM (0.5+)
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
    - `pip install yapf`

