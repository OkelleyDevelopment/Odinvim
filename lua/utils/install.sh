#!/bin/bash

# Author: Nicholas O'Kelley
# A bash script to set up Odinvim
# Date: Sep 10, 2021
# Last Modified: Sep 10, 2021

set -o nounset # error when reference to undefined variables
set -o errexit # error out of the script

installpiponubuntu() { \
  sudo apt install python3-pip -y > /dev/null
}

installpiponarch() { \
  pacman -S python-pip
}

promptPipInstall() { \
    echo "pip not found. Installing now..."
    [  -n "$(uname -a | grep Ubuntu)" ] && installpiponubuntu
    [ -f "/etc/arch-release" ] && installpiponarch
    
} 

installplugs() { \
  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.tmp
  mv $HOME/.config/nvim/util/init.vim $HOME/.config/nvim/init.vim
  echo "Installing plugins..."
  nvim --headless +PlugInstall +qall > /dev/null 2>&1
  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/util/init.vim
  mv $HOME/.config/nvim/init.vim.tmp $HOME/.config/nvim/init.vim
}

promptNodeInstall() { \
    echo "NodeJS not found, installing now..."
    installNode && installcocextensions

}

installnodeubuntu(){ \
    sudo apt install nodejs -y
    sudo apt install npm -y
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
    echo export PATH=~/.npm-global/bin:$PATH >> ~/.profile;  
    source ~/.profile
}

installnodearch(){ \
    sudo pacman -S nodejs
    sudo pacman -S npm
}

installNode() { \
    echo "Installing nodejs..."
    [  -n "$(uname -a | grep Ubuntu)" ] && installnodeubuntu
    [ -f "/etc/arch-release" ] && installnodearch
}

installpynvim(){ \
    echo "Installing pynvim..."
    pip3 install pynvim
}

moveOldConfig(){ \
    echo "Found an nvim config. Renaming to ---> nvim.old"
    mv $HOME/.config/nvim $HOME/.config/nvim.old
}

cloneConfig() { \
    echo "Cloning Odinvim"
    git clone git@github.com:OkelleyDevelopment/Odinvim.git  ~/.config/nvim/
}

# Welcome to the Grid
echo "|---------- Installing Odinvim ----------|" 

# Verify pip3, node, and npm are installed
which pip3 > /dev/null && echo "Pip3 found." || promptPipInstall
pip3 list | grep pynvim > /dev/null && echo "Pynvim found." || installpynvim
which node > /dev/null && echo "NodeJS found." || promptNodeInstall
which npm > /dev/null && echo "Npm found." || echo "Install NPM"

# move old nvim directory if it exists
[ -d "$HOME/.config/nvim" ] && moveOldConfig

echo "Check if neovim is 0.5+"

# Clone the repo down
cloneConfig

echo "Check for packer install"

# Closing remark
echo "This installation has finished"
