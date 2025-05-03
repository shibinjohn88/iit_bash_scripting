#!/bin/bash

# log files 
log1="$HOME/Linux-text-book-part-1/files/Chapter-08/logs/u_ex150721.log"
log2="$HOME/Linux-text-book-part-1/files/Chapter-08/logs/u_ex151002.log"

echo "Top 5 Offending IPs"
# using awk filter find offending ips with error code in 400s or 500s
cat "$log1" "$log2" \
| awk 'NF >= 4 && $(NF-3) ~ /^[45]/ { print $9 }'\
| sort \
| uniq -c \
| sort -nr \
| head -n 5




