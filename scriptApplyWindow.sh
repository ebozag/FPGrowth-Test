#!/bin/bash
file="$1"
windowSize="$2"
read_n() { output=""; for i in $(seq $1); do read || return; output="$output $REPLY"; done; echo $output; }

while lines="$(read_n $windowSize)"; do
    #echo "========= 5 lines below ============"
    echo "$lines"
done < $file
