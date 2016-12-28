#!/bin/bash

./generate-categories
./generate-tags
JEKYLL_ENV=production jekyll build --source ../ --destination ../_site
cd ../
git add *
read -p "Enter commit message: " message
git commit -m "$message"
git push origin master
exit
