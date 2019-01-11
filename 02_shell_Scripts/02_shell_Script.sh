#!/bin/bash

# Create a script that accepts a CSV filename as input ($1 inside your
# script) and returns the model of the aircraft with the highest number of
# engines. (use it on  ~/Data/opentraveldata/optd_aircraft.csv) 

# 02_shell_Script.sh ~/Data/opentraveldata/optd_aircraft.csv

FILE_NAME=$1


MODEL=$(cat $FILE_NAME | cut -d "^" -f 3,7 | sort -t "^" -k2nr,2 | head -n 1 | cut -d "^" -f 1)
ENGINES=$(cat $FILE_NAME | cut -d "^" -f 3,7 | sort -t "^" -k2nr,2 | head -n 1 | cut -d "^" -f 2)

echo "The Model is $MODEL"
echo "Number of engines is $ENGINES"
