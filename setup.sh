#!/bin/bash

# DOT FILE SETUP SCRIPT

ACTION="NONE"

# remove log file
rm -f ~/.dot.log

# Check arguments
if [ $# -gt 1 ]; then
    echo "-dot: ERROR: Too many arguments"
    exit 1
elif [ $# -eq 0 ]; then
    ACTION="INSTALL"
elif [ $1 == "uninstall" ]; then
    ACTION="UNINSTALL"
elif [ $1 == "update" ]; then
    ACTION="UPDATE"
else
    echo "-dot: ERROR: Unrecognized command"
fi

# INSTALL
if [ $ACTION == "INSTALL" ]; then

    echo "-dot: Installing dot files..."

    # Clone git repo
    cd ~
    if [ -d ~/.dot ]; then
        cd ~/.dot
        OVERWRITE="y"
        if [ -n "$(git status --porcelain)" ]; then
            echo "-dot: There are unsaved changes to your dot files. Overwrite? [y/n]"
            read -n 1 OVERWRITE
        fi
	cd ~
        [ $OVERWRITE == "y" ] && rm -rf ~/.dot >> ~/.dot.log 2>&1
    fi
    [ -d ~/.dot ] && exit 1

    echo "-dot: Cloning git repo..."
    git clone git@github.com:leviathan747/.dot.git >> ~/.dot.log 2>&1
    if [ $? -ne 0 ]; then
        echo "-dot: ERROR: Git clone failed. See full log in ~/.dot.log"
        exit 1
    fi

    cd ~/.dot/
    chmod +x setup.sh

    # Make backups
    echo "-dot: Making backups..."
    [ -d backup ] && rm -rf backup >> ~/.dot.log 2>&1
    mkdir backup

    [ -f ~/.bash_aliases ] && cp -f ~/.bash_aliases backup/bash_aliases >> ~/.dot.log 2>&1
    [ -f ~/.bashlinux ] && cp -f ~/.bashlinux backup/bashlinux >> ~/.dot.log 2>&1
    [ -f ~/.bashmac ] && cp -f ~/.bashmac backup/bashmac >> ~/.dot.log 2>&1
    [ -f ~/.bashrc ] && cp -f ~/.bashrc backup/bashrc >> ~/.dot.log 2>&1
    [ -f ~/.profile ] && cp -f ~/.profile backup/profile >> ~/.dot.log 2>&1
    [ -f ~/.gitconfig ] && cp -f ~/.gitconfig backup/gitconfig >> ~/.dot.log 2>&1
    [ -f ~/.gitignore ] && cp -f ~/.gitignore backup/gitignore >> ~/.dot.log 2>&1
    [ -f ~/.vimrc ] && cp -f ~/.vimrc backup/vimrc >> ~/.dot.log 2>&1
    [ -d ~/.vim ] && cp -rf ~/.vim backup/vim >> ~/.dot.log 2>&1

    # remove old files
    rm -rf ~/.bash_aliases ~/.bashlinux ~/.bashmac ~/.bashrc ~/.profile ~/.gitconfig ~/.gitignore ~/.vimrc ~/.vim >> ~/.dot.log 2>&1

    # Link files
    echo "-dot: Linking config files..."
    ln -s ~/.dot/config/bash_aliases ~/.bash_aliases >> ~/.dot.log 2>&1
    ln -s ~/.dot/config/bashlinux ~/.bashlinux >> ~/.dot.log 2>&1
    ln -s ~/.dot/config/bashmac ~/.bashmac >> ~/.dot.log 2>&1
    ln -s ~/.dot/config/bashrc ~/.bashrc >> ~/.dot.log 2>&1
    ln -s ~/.dot/config/profile ~/.profile >> ~/.dot.log 2>&1
    ln -s ~/.dot/config/gitconfig ~/.gitconfig >> ~/.dot.log 2>&1
    ln -s ~/.dot/config/gitignore ~/.gitignore >> ~/.dot.log 2>&1
    ln -s ~/.dot/config/vimrc ~/.vimrc >> ~/.dot.log 2>&1
    ln -s ~/.dot/config/vim ~/.vim >> ~/.dot.log 2>&1

    # Pull down submodules
    echo "-dot: Updating submodules..."
    git submodule init >> ~/.dot.log 2>&1
    git submodule update >> ~/.dot.log 2>&1

    echo "-dot: Done."

# UNINSTALL
elif [ $ACTION == "UNINSTALL" ]; then

    echo "-dot: Uninstalling dot files..."

    # Replace backups
    echo "-dot: Replacing backup files..."
    [ -f ~/.dot/backup/bash_aliases ] && rm -f ~/.bash_aliases && cp -f ~/.dot/backup/bash_aliases ~/.bash_aliases >> ~/.dot.log 2>&1
    [ -f ~/.dot/backup/bashlinux ] && rm -f ~/.bashlinux && cp -f ~/.dot/backup/bashlinux ~/.bashlinux >> ~/.dot.log 2>&1
    [ -f ~/.dot/backup/bashmac ] && rm -f ~/.bashmac && cp -f ~/.dot/backup/bashmac ~/.bashmac >> ~/.dot.log 2>&1
    [ -f ~/.dot/backup/bashrc ] && rm -f ~/.bashrc && cp -f ~/.dot/backup/bashrc ~/.bashrc >> ~/.dot.log 2>&1
    [ -f ~/.dot/backup/profile ] && rm -f ~/.profile && cp -f ~/.dot/backup/profile ~/.profile >> ~/.dot.log 2>&1
    [ -f ~/.dot/backup/gitconfig ] && rm -f ~/.gitconfig && cp -f ~/.dot/backup/gitconfig ~/.gitconfig >> ~/.dot.log 2>&1
    [ -f ~/.dot/backup/gitignore ] && rm -f ~/.gitignore && cp -f ~/.dot/backup/gitignore ~/.gitignore >> ~/.dot.log 2>&1
    [ -f ~/.dot/backup/vimrc ] && rm -f ~/.vimrc && cp -f ~/.dot/backup/vimrc ~/.vimrc >> ~/.dot.log 2>&1
    [ -d ~/.dot/backup/vim ] && rm -rf ~/.vim && cp -rf ~/.dot/backup/vim ~/.vim >> ~/.dot.log 2>&1

    # Remove git repo
    echo "-dot: Removing git repo..."
    cd ~
    rm -rf ~/.dot

    echo "-dot: Done."

fi
