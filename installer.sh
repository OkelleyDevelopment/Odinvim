#!/bin/bash

set -o nounset  # error when ref undefined vars
set -o errexit # exit on command failure

GREEN="$(printf '\033[32m')"
CYAN="$(printf '\033[36m')"

clear
echo "Odinvim"

backup_nvim() {
    echo ${GREEN} "Moving the old config to ~/.config/nvim.bak"
    mv ~/.config/nvim/ ~/.config/nvim.bak/
}

installpacker() {
    echo ${GREEN} "Cloning Packer"
    git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
}

summonOdinvim() {
    echo ${GREEN} "Cloning Odinvim"
    git clone --branch experimental https://github.com/OkelleyDevelopment/Odinvim.git ~/.config/nvim
    cd "$HOME"/.config/nvim/
    #nvim +PackerSync 
    #nvim +PackerCompile
   nvim --headless \
        +'autocmd User PackerComplete sleep 100m | qall' \
        +PackerInstall

    nvim --headless \
        +'autocmd User PackerComplete sleep 100m | qall' \
        +PackerSync 
    echo ${CYAN}"\nCompile Completed"
}

# Welcome  
echo ${CYAN} "Installing Odinvim has begun..."

[ -d "$HOME/.config/nvim/" ] && backup_nvim

if [ -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then 
    echo "Packer already installed"
else
    rm -rf ~/.local/share/nvim/site/pack/packer/
    installpacker
fi

summonOdinvim

echo ${GREEN}"Installation is complete."

