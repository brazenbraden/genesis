#!/bin/bash

# Get current branch name
current_branch=`git branch --show-current`
echo "current branch name is: ${current_branch}"

# Create copy branch name
copy_branch="${current_branch}_copy_for_staging"
echo "copy branch name is: ${copy_branch}"

# Create the copy branch
git branch -C ${current_branch} ${copy_branch}

# Check out staging branch and update
git fetch && git checkout staging && git pull

# Merge the copy branch
if git merge ${copy_branch}; then
  echo "Branch merged to staging successfully"

  # Push staging back up to origin
  # git push
else
  git merge --abort

  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo "Merge conflicts detected. Rolling back."
  echo "Resolve merge conflicts by rebasing your branch on staging then try again."
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
fi

# Checkout original branch
git checkout ${current_branch}

# Delete copy branch
git branch -D ${copy_branch}
