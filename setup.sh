#!/bin/bash

# DOT FILE SETUP SCRIPT

ACTION="NONE"

# Check arguments
if [ $# -gt 1 ]; then
    echo "-dot: ERROR: Too many arguments"
    exit 1
elif [ $# -eq 0 ]; then
    ACTION="INSTALL"
elif [ $1 -eq "uninstall" ]; then
    ACTION="UNINSTALL"
elif [ $1 -eq "update" ]; then
    ACTION="UPDATE"
else
    echo "-dot: ERROR: Unrecognized command"
fi

# INSTALL
if [ $ACTION -eq "INSTALL" ]; then

    echo "-dot: Installing dot files..."

    cd ~
    git clone git@github.com:leviathan747/.dot.git &>> ~/dot.log
    if [ $? -ne 0 ]; then
        echo "-dot: ERROR: Git clone failed. See full log in ~/dot.log"
        exit 1
    fi

    cd .dot/

    # Make backups
    [ -d backup ] && rm -rf backup
    mkdir backup

    [ -f ~/.bash_aliases ] && cp -f ~/.bash_aliases backup/bash_aliases
    [ -f ~/.bashlinux ] && cp -f ~/.bashlinux backup/bashlinux
    [ -f ~/.bashmac ] && cp -f ~/.bashmac backup/bashmac
    [ -f ~/.bashrc ] && cp -f ~/.bashrc backup/bashrc
    [ -f ~/.gitconfig ] && cp -f ~/.gitconfig backup/gitconfig
    [ -f ~/.gitignore ] && cp -f ~/.gitignore backup/gitignore
    [ -f ~/.vimrc ] && cp -f ~/.vimrc backup/vimrc
    [ -d ~/.vim ] && cp -rf ~/.vim backup/vim

    # Link files
    ln -s config/bash_aliases ~/.bash_aliases
    ln -s config/bashlinux ~/.bashlinux
    ln -s config/bashmac ~/.bashmac
    ln -s config/bashrc ~/.bashrc
    ln -s config/gitconfig ~/.gitconfig
    ln -s config/gitignore ~/.gitignore
    ln -s config/vimrc ~/.vimrc
    ln -s config/vim ~/.vim

    # Source bashrc
    . ~/.bashrc

    echo "-dot: Done."

fi
