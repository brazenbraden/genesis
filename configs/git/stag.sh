#!/bin/bash

staging_branch=staging

# Get current branch name
current_branch=`git branch --show-current`

# Create copy branch name
copy_branch="${current_branch}_copy_for_staging"

# Create the copy branch
git checkout -b ${copy_branch}

# Check out staging branch and update
git fetch && git checkout -q ${staging_branch} && git pull --force -q

# Merge the copy branch
if git merge --no-ff ${copy_branch}; then
  # Push staging back up to origin

  git push
  echo "Branch merged to staging successfully"
else
  git merge --abort

  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo "Merge conflicts detected. Rolling back."
  echo "Resolve merge conflicts by rebasing your branch on staging then try again."
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
fi

# Checkout original branch
git checkout -q ${current_branch}

# Delete copy branch
git branch -D -q ${copy_branch}
