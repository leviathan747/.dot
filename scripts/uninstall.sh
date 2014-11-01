# Uninstall
# Replaces dot files with backups 
# and deletes the install directory

# variables
INSTALL_DIR='.dot/'

# START

# go to home directory
cd

# delete links
rm -rf .bashrc .profile .vimrc .gitconfig .vim/

# move backup files
mv ${INSTALL_DIR}/backup/.bashrc ~
mv ${INSTALL_DIR}/backup/.profile ~
mv ${INSTALL_DIR}/backup/.vimrc ~
mv ${INSTALL_DIR}/backup/.gitconfig ~
mv ${INSTALL_DIR}/backup/.vim ~

# source profile and bashrc
. ./.profile
. ./.bashrc

echo Uninstall finished.
