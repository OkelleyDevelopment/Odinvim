#!/bin/bash
#
# Install script to load the Okelldev nvim config (Odinvim)
# 
# Author: Nicholas O'Kelley
# Date: 06/22/2022
# 

set -o nounset  # error when ref undefined vars
set -o errexit # exit on command failure

CYAN="$(printf '\033[1;36m')"; # Technically bold
YELLOW="$(printf '\033[33m')";
GREEN="$(printf '\033[32m')";
WHITE="$(printf '\033[37m')";

backup_nvim() {
    echo -e ${YELLOW}"Moving the old config to ~/.config/nvim.bak" ${GREEN};
    mv ~/.config/nvim/ ~/.config/nvim.bak/
    echo ${WHITE} "Done."
}

installpacker() {
    echo -e ${YELLOW}"Installing the packer plugin manager ..."  ${GREEN};
    git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
    echo ${WHITE} "Done."
}

summonOdinvim() {
    echo ${YELLOW}"Cloning the project, please wait ..."  ${GREEN};
    git clone --branch experimental https://github.com/OkelleyDevelopment/Odinvim.git ~/.config/nvim
    cd "$HOME"/.config/nvim/
    nvim --headless \
        +'autocmd User PackerComplete sleep 100m | qall' \
        +PackerInstall

    nvim --headless \
        +'autocmd User PackerComplete sleep 100m | qall' \
        +PackerSync 
    echo -e ${WHITE} "Done."
}


clear

echo ${WHITE}"---------------------------------------"
echo ${CYAN}"  ___      _  _             _        "
echo ${CYAN}" / _ \\  __| |(_) _ _  __ __(_) _ __  "
echo ${CYAN}"| (_) |/ _\` || || ' \\ \\ V /| || '  \\ "
echo ${CYAN}" \\___/ \\__/_||_||_||_| \\_/ |_||_|_|_|"
echo ${WHITE}"---------------------------------------"

#echo "Installing Odinvim has begun..."

[ -d "$HOME/.config/nvim/" ] && backup_nvim

if [ -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then 
    echo "Packer already installed"
else
    rm -rf ~/.local/share/nvim/site/pack/packer/
    installpacker
fi

summonOdinvim

echo ${GREEN}"Installation is complete."
