echo "Deploying updates to GitHub..."

:: Build the project.
hugo -t mainroad --buildDrafts
:: if using a theme, replace by `hugo -t <yourtheme>`

:: Go To Public folder
cd public
:: Add changes to git.
git add -A

:: Commit changes.
SET msg="rebuilding site"

git commit -m %msg%

:: Push source and build repos.
git push origin master

:: Come Back
cd ../