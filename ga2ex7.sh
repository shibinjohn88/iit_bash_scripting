#!/bin/bash

# check file is passed
if [ $# -ne 1 ]; then
	echo "Usage: $0 <filename>"
	exit 1
fi 

filename="$HOME/topsecret/$1"

#check file exists in topsecret directory
if [ -e "$filename" ]; then
	echo "$filename exists in directory topsecret"
else
	echo "Error: $filename doest not exist in directory topsecret"
fi

