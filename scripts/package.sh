# Package
# Puts together a distribution package for
# quick install

# variables
INSTALL_DIR='.dot/'

# change directories
cd
cd ${INSTALL_DIR}

# clean
rm -rf dist/
mkdir dist/

# gather needed files
cd dist/
cp -r ../config .
mkdir scripts/
cp ../scripts/uninstall.sh scripts/

# create tar
tar -zcvf dot.tgz config/ scripts/

# remove files
rm -rf config/ scripts/
