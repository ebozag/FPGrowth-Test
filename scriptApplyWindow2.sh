#!/bin/bash
file="$1"
windowSize="$2"
fileSection="$2"
fileSize=$(wc -l $file |awk '{print $1}')
#read_n() { output=""; for i in $(seq $1); do read || return; output="$output $REPLY"; done; echo $output| tr " " "\n" | sort -g -u | tr "\n" " "; }

while test $fileSection -lt $fileSize; do
    head -n $fileSection $file|tail -n $windowSize | sort -g -u | tr "\n" " "
    echo
    fileSection=$((fileSection + windowSize))
done

