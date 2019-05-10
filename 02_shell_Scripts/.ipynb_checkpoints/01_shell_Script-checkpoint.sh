#!/bin/bash

# Create a script that will return  column names together with their column
# number from the csv files. The first argument should be file name and the
# second delimiter.

# 01_shell_Script.sh file_name "delimeter"

FILE_INPUT=$1
DELIMETER=$2

NUM_COLUMNS=$(cat $FILE_INPUT | head -n 1 | tr $DELIMETER "\n" | wc -l)

paste <(seq $NUM_COLUMNS) <(cat $FILE_INPUT | head -n 1 | tr $DELIMETER "\n")


