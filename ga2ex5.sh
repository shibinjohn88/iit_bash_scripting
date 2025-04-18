#!/bin/bash

# source file
source="/home/controller/Linux-text-book-part-1/files/Chapter-08/lab/names.txt"
# clear duplicates.txt file
> /tmp/duplicates.txt

# read text file using while loop
while IFS= read -r name; do
	dir="/tmp/$name"
        # check directory exists
	if [ -d "$dir" ]; then
		echo "$name" >> /tmp/duplicates.txt
	else 
		mkdir "$dir"
		echo "directory $dir created"
	fi
done < $source

