#!/bin/bash

# Prompt the user for a commit message
read -p "Enter Git commit message: " commit_message

# Check if the message is empty
if [ -z "$commit_message" ]; then
  echo "Commit message cannot be empty. Aborting."
  exit 1
fi

# Add all changes
echo "Adding all changes..."
git add .

# Commit changes
echo "Committing with message: \"$commit_message\""
git commit -m "$commit_message"

# Check if commit was successful (e.g., if there were changes to commit)
if [ $? -ne 0 ]; then
  echo "No changes to commit or commit failed."
  exit 1
fi

# Push changes
echo "Pushing changes..."
git push

# Check if push was successful
if [ $? -ne 0 ]; then
  echo "Push failed."
  exit 1
fi

echo "Git update complete."