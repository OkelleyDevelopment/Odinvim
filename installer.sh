#!/bin/bash
#
# Install script to load the Okelldev nvim config (Odinvim)
# 
# Author: Nicholas O'Kelley
# Date: 06/22/2022
# 

set -o nounset  # error when ref undefined vars
set -o errexit # exit on command failure

CYAN="$(printf '\033[36m')"

backup_nvim() {
    echo ${CYAN} "Moving the old config to ~/.config/nvim.bak"
    mv ~/.config/nvim/ ~/.config/nvim.bak/
}

installpacker() {
    echo ${CYAN} "Cloning Packer"
    git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
}

summonOdinvim() {
    echo ${CYAN} "Cloning Odinvim"
    git clone --branch experimental https://github.com/OkelleyDevelopment/Odinvim.git ~/.config/nvim
    cd "$HOME"/.config/nvim/
    nvim --headless \
        +'autocmd User PackerComplete sleep 100m | qall' \
        +PackerInstall

    nvim --headless \
        +'autocmd User PackerComplete sleep 100m | qall' \
        +PackerSync 
    echo -e ${CYAN}"\nCompile Completed"
}


clear
echo ${CYAN} "Installing Odinvim has begun..."

[ -d "$HOME/.config/nvim/" ] && backup_nvim

if [ -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then 
    echo "Packer already installed"
else
    rm -rf ~/.local/share/nvim/site/pack/packer/
    installpacker
fi

summonOdinvim

echo ${CYAN}"Installation is complete."
