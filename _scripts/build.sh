#!/bin/bash

# Enable error reporting to the console.

echo 'this is PR, exiting'
set -e




npm install


# Build the site.
gulp serve-build


# Checkout `master` and remove everything.
git clone https://${GH_TOKEN}@github.com/hashworksIT/hashworksIT.github.io.git ../hashworksIT.github.io.master
cd ../hashworksIT.github.io.master
git checkout master
rm -rf *

# Copy generated HTML site from source branch in original repository.
# Now the `master` branch will contain only the contents of the _site directory.
cp -R ../hashworksIT.github.io/_site/* .
cp ../hashworksIT.github.io/.travis.yml .

# Make sure we have the updated .travis.yml file so tests won't run on master.

git config user.email ${GH_EMAIL}
git config user.name "hashworksIT"



# Commit and push generated content to `master` branch.
git status
git add -A .
git status
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --quiet origin master > /dev/null 2>&1