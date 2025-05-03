#!/bin/bash

# check exactly one parameter is given 
if [ $# -ne 1 ]; then
	echo "Usage: $0 <filename with path>"
	exit 1
fi 

filename="$1"

# check for file execute permission
if [ -x "$filename" ]; then
	echo "$filename is executable."
else
	echo "Error: $filename is not executable"
fi


