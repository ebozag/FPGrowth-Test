#!/bin/bash
trace=$1
column=$2

cut -d "," -f $column $trace > $trace-onlyIDs.txt
sort -u $trace-onlyIDs.txt > $trace-uniqueIDs.txt
objects=$(wc -l $trace-uniqueIDs.txt|cut -d " " -f 1)
seq $objects > newIDs.temp
paste -d "," $trace-uniqueIDs.txt newIDs.temp > $trace-pattern

#http://unix.stackexchange.com/questions/126485/replacing-the-values-in-one-file-with-the-values-in-another-file-in-bash
awk -F',|, ' 'NR==FNR{a[$1]=$2} NR>FNR{$1=a[$1];print}' OFS=',' "$trace-pattern" "$trace-onlyIDs.txt" > $trace-onlyIDs-transformed.txt
### For this line, "NR>FNR{$2=a[$2]", needs to manually use the column with IDs on the trace.
awk -v column="$column" -F',|, ' 'NR==FNR{a[$1]=$2} NR>FNR{$column=a[$column];print}' OFS=',' "$trace-pattern" "$trace" > $trace-transformed.txt
rm -f $trace-onlyIDs.txt $trace-uniqueIDs.txt newIDs.temp

