#!/bin/bash

# stop directly if error
set -ex

# branch with files
branchOrig='master'
# branch for release
branchR='release'
#files and folders to delete
dellist=('various/wiki','various/Figures')

# update branchOrig
git checkout $branchOrig
git pull origin $branchOrig


# Get a list of all the submodules
submodulesnames=($(git config -f .gitmodules --get-regexp url|awk '{print $1}'|cut -d . -f2))
submodules=($(git config --file .gitmodules --get-regexp path | awk '{ print $2 }'))
submodulesURL=($(git config --file .gitmodules --get-regexp url | awk '{ print $2 }'))

#switch to branchR with force
git checkout --force $branchR

# Loop over submodules and convert to regular files
#for submodule in "${submodules[@]}"
for ((i=0;i<${#submodules[@]};++i));
do  
	submodule=${submodules[i]}
	suburl=${submodulesURL[i]}
	subname=${submodulesnames[i]}
	#
   echo "Removing folder $submodule and restore via checkout"
   rm -rf $submodule
   git checkout $branchOrig $submodule
   git commit -am "Removing folder $submodule and restore via checkout"
   #
   echo "Merge from folder $branchOrig"
   git merge -X theirs $branchOrig
   git checkout $branchOrig .gitmodules
   set +e
	echo "Add submodule $subname with force"
   git submodule add  $suburl $submodule --force
   set -e
   echo "Update submodule $subname with recursive"
   git submodule update --recursive
   echo "Remove $subname on the git index"
   git rm --cached $subname # Delete references to submodule HEAD
   echo "Remove git's files of $subname"
   find $submodule -name '.git*' -delete # Remove submodule .git references to prevent confusion from main repo
   git add $submodule # Add the left over files from the submodule to the main repo
   git commit -m "Converting submodule $submodule to regular files" # Commit the new regular files!
done

echo "Remove .gitmodules files"
rm .gitmodules

#remove specific files
for files in ${dellist[@]}
do
echo "Remove $files" 
rm -rf $files
done

git commit -am "Remove unused files, ready for realease"