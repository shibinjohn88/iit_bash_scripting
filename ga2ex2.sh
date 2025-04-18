#!/bin/bash

# input lines from roster.txt into array using mapfile
mapfile -t ROSTERARRAY < roster.txt

# Echo second element in array
echo "${ROSTERARRAY[1]}"
