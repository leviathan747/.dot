#!/bin/bash

# install pacakges
echo "-dot: Installing packages..."
sudo apt-get update && apt-get install -y git neovim zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# clone the repository
echo "-dot: Cloning .dot repository..."
git clone https://github.com/leviathan747/.dot $HOME/.dot

# Link files
echo "-dot: Installing dot files..."
mkdir -p $HOME/.config
ln -Fs $HOME~/.dot/config/zshrc     $HOME/.zshrc
ln -Fs $HOME~/.dot/config/gitconfig $HOME/.gitconfig
ln -Fs $HOME~/.dot/config/gitignore $HOME/.gitignore
ln -Fs $HOME~/.dot/config/nvim      $HOME/.config/nvim

echo "-dot: Done."
