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
git commit -m "$1"
git push origin master

# checkout gh-pages
git checkout gh-pages

# move the new distribution
git show master:dist/dot.tgz > dot.tgz

# commit
git add .
git commit -m "Updated distribution from `git show-ref -s --abbrev --heads master`"
git push origin gh-pages

# checkout master
git checkout master
