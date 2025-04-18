#!/bin/bash

# input lines into array
mapfile -t ROSTERARRAY < roster.txt

#loop through array and make directories
for name in "${ROSTERARRAY[@]}"; do
        dir="$HOME/$name"
	# check directory exists
	if [ -d "$dir" ]; then
		echo "Directory $name exists"
	else
		# create directory 
		mkdir "$dir"
		echo "Directory $dir successfully created"
	fi
done

#list home directoy contents
echo "Home directory list"
ls -1 "$HOME"

