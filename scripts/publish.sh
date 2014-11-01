# Publish
# Commits to master and then updates the distribution

# variables
INSTALL_DIR='.dot/'

# abort function
abort() {
    echo Aborting...
    exit 1
}

# check argument
[ $# -eq 1 ] || abort

# change directories
cd
cd ${INSTALL_DIR}

# package
bash scripts/package.sh

# commit to master
git add config/ dist/
[ $? -eq 0 ] || abort
git commit -m "$1"
[ $? -eq 0 ] || abort
git push origin master
[ $? -eq 0 ] || abort

# checkout gh-pages
git checkout gh-pages
[ $? -eq 0 ] || abort

# move the new distribution
git show master:dist/dot.tgz > dot.tgz
[ $? -eq 0 ] || abort

# commit
git add .
[ $? -eq 0 ] || abort
git commit -m "Updated distribution from `git show-ref -s --abbrev --heads master`"
[ $? -eq 0 ] || abort
git push origin gh-pages
[ $? -eq 0 ] || abort

# checkout master
git checkout master
[ $? -eq 0 ] || abort
