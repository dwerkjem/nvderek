#!/bin/bash bash

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

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd ~/.config/nvim || exit
nvim --headless +PackerSync
