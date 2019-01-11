#!/bin/bash

# Repeat script 2, but add a second argument to accept number of a column
# with the number of engines. If several planes have the highest number of
# engines, then the script will only show one of them.  
# (use it on  ~/Data/opentraveldata/optd_aircraft.csv)

# 03_shell_Script ~/Data/opentraveldata/optd_aircraft.csv num_column 

FILE_INPUT=$1
COLUMN_INPUT=$2

COLUMN=$(cat $FILE_INPUT | head -n 1 | cut -d "^" -f $COLUMN_INPUT)
MODEL=$(sort -t "^" -k ${COLUMN_INPUT}nr ${FILE_INPUT}|head -1 | cut -d "^" -f 3)
ENGINES=$(sort -t "^" -k ${COLUMN_INPUT}nr ${FILE_INPUT}|head -1 | cut -d "^" -f 7)

echo "The file has been sorted by $COLUMN"
echo "The model is ${MODEL}"
echo "The number of engines is $ENGINES"


