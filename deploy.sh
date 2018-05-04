#!/bin/bash

io_repo=UnderfundedHackers.github.io
hugo_repo=Website-Hugo-Files

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# go to .io repo
cd ../$io_repo

# delete files in .io repo
rm -rf *

# go to Hugo-files repo
cd ../$hugo_repo

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# copy files to .io repo
cp -r public/* ../$io_repo/

# go to .io repo
cd ../$io_repo

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..