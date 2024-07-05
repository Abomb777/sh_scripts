#!/bin/bash

#awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat)
USAGE=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf "%.2f", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')
echo "CPU load: $USAGE %"
CORES="$(nproc --all)"
echo "Total cores: $CORES"
#CORESINUSE=$(awk 'BEGIN { printf "%.2f", ($CORES/100) }')
CORESINUSE=$(awk "BEGIN { printf \"%.0f\", ($CORES / 100 * $USAGE) }")
echo "Cores in use: $CORESINUSE"
#MAXTHREADS="$($CORES - $CORESINUSE)"
MAXTHREADS=$(awk "BEGIN { printf \"%.0f\", ($CORES - $CORESINUSE) }")
echo "Can use max cores: $MAXTHREADS"
