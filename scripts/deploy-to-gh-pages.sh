#!/usr/bin/env bash

set -ex

if [ "$TRAVIS_PULL_REQUEST" != "false" ]
then
   echo "Pull request PR, not deploying"
   exit 0
fi

if [ "$TRAVIS_BRANCH" != "master" ]
then
   echo "Not on master branch, not deploying"
   exit 0
fi

echo "==> Building and deploying app <=="

# go to the out directory and create a *new* Git repo
cd dist
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "joeleapublic@gmail.com"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1

echo "==> Deployment completed successfully <=="
