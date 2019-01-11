#!/bin/bash

# Create a script that accepts as input arguments the name of the CSV file,
# and a number (number of engines) and returns number of aircrafts that have
# that number of engines. 
# (use it on  ~/Data/opentraveldata/optd_aircraft.csv)  

# 04_shell_Script.sh ~/Data/opentraveldata/optd_aircraft.csv num_engines

FILE_INPUT=$1
ENGINES=$2

AIRCRAFT=$(cat $FILE_INPUT | cut -d "^" -f 7 | grep -c $ENGINES)

echo "NUMBER OF AIRCRAFTS WITH $ENGINES ENGINES: $AIRCRAFT"

