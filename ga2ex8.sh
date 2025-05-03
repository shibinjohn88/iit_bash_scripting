#!/bin/bash

# log files 
log1="$HOME/Linux-text-book-part-1/files/Chapter-08/logs/u_ex150721.log"
log2="$HOME/Linux-text-book-part-1/files/Chapter-08/logs/u_ex151002.log"

# using awk filter file
read count ip <<< "$(cat "$log1" "$log2" \
| awk 'NF >= 4 && $(NF-3) == 404 { print $9 }'\
| sort \
| uniq -c \
| sort -nr \
| head -n 1)"
echo "IP $ip caused most 404 errors, number of errors: $count"



