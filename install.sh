#!/usr/bin/bash

# make sure neovim is installed
if ! command -v nvim &> /dev/null
then
    echo "neovim is not installed, please install it first"
    exit
fi

# make sure git is installed
if ! command -v git &> /dev/null
then
    echo "git is not installed, please install it first"
    exit
fi
if [ ! .local/share/nvim/site/pack/packer/start/packer.nvim ]
then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 	~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

cd ~/.config/nvim || exit
nvim --headless +PackerSync

# install python3 and pip3 and then install pynthon3 neovim 
# check what package manager to use

if command -v apt &> /dev/null
then
    sudo apt install python3 python3-pip python-neovim
elif command -v pacman &> /dev/null
then
    sudo pacman -S python3 python3-pip python-neovim

elif command -v dnf &> /dev/null
then
    sudo dnf install python3 python3-pip python3-neovim
elif command -v zypper &> /dev/null
then
    sudo zypper install python3 python3-pip python3-neovim
elif command -v brew &> /dev/null
then
    brew install python3 python3-pip python3-neovim
else
    echo "No package manager found, please install python3 and pip3 manually"
fi
