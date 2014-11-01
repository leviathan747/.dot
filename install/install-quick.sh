# Quick Install
# Installs by downloading dist tarball and linking files
# Unable to publish changes
# Good for machines without git installed or one time use situations

# variables
INSTALL_DIR='.dot/'

# Abort cleanup function
abort() {
    echo Aborting...
    cd
    rm -rf ${INSTALL_DIR}
    echo Done.
    exit 1
}

# START

# go to .dot directory
cd
echo ${INSTALL_DIR}
rm -rf ${INSTALL_DIR}
mkdir -p ${INSTALL_DIR}
cd ${INSTALL_DIR}

# download distribution
command -v wget >/dev/null 2>&1 || { echo >&2 "ERROR: 'wget' is not installed."; abort; }
out=`wget http://levistarrett.com/.dot/dot.tgz`
if [ $? -ne 0 ]; then { echo "Problem downloading the archive."; abort; } fi

# extract distribution
command -v tar >/dev/null 2>&1 || { echo >&2 "ERROR: 'tar' is not installed."; abort; }
out=`tar -zxvf config.tgz`
if [ $? -ne 0 ]; then { echo "Problem extracting the archive."; abort; } fi

# remove the archive
rm -f config.tgz

# backup old dot files
mkdir backup/
mv ~/.profile ~/.bashrc ~/.gitconfig ~/.vim ~/.vimrc backup/

# link the files
cd
ln -s ${INSTALL_DIR}/config/profile .profile
ln -s ${INSTALL_DIR}/config/bashrc .bashrc
ln -s ${INSTALL_DIR}/config/gitconfig .gitconfig
ln -s ${INSTALL_DIR}/config/vim .vim
ln -s ${INSTALL_DIR}/config/vimrc .vimrc

# source bashrc and profile
source ~/.bashrc
source ~/.profile

echo Install complete.
