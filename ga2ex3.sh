#!/bin/bash

# input lines into array
mapfile -t ROSTERARRAY < roster.txt

#loop through array and make directories
for name in "${ROSTERARRAY[@]}"; do
	dir="$HOME/$name"
	mkdir -p "$dir"
	echo "Directory $dir successfully created"
done

#list home directoy contents
echo "Home directory list"
ls -1 "$HOME"

