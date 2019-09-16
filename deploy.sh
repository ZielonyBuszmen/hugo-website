#!/usr/bin/env bash
echo "Deploying updates to GitHub..."

# Build the project.
hugo -t beautifulhugo
# if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
git commit -m "rebuilding site"

# Push source and build repos.
git push origin master

# Come Back
cd ../