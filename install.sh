#!/bin/bash

# Required packages:
# - git
# - neovim
# - zsh
# - oh-my-zsh

echo "-dot: Removing existing configuration..."
mkdir -p $HOME/.config
rm -rf $HOME/.zshrc \
       $HOME/.gitconfig \
       $HOME/.gitignore \
       $HOME/.config/nvim \

# Link files
echo "-dot: Installing dot files..."
ln -Fs $HOME~/.dot/config/zshrc     $HOME/.zshrc
ln -Fs $HOME~/.dot/config/gitconfig $HOME/.gitconfig
ln -Fs $HOME~/.dot/config/gitignore $HOME/.gitignore
ln -Fs $HOME~/.dot/config/nvim      $HOME/.config/nvim

echo "-dot: Done."
