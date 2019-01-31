# Shell Scripts

- Creating reusable command-line tools
- Building block that can be part of something bigger
- Turn one-liner into a reusable command-line tool

## 1. ¿How can i create a shell script?
 To run a command as a script, we have to follow this steps:
 
 1. Copy a paste the one-liner commands into a file
 2. Add execute permissions
 3. file with .sh extension
 4. Remove the fixed input part
 5. Add parameters
 6. Optionally extend your path

First of all we have to create a file (with .sh extension) and the first line will be as follows
```
#!/bin/bash
```
Then, we have to add execute permissions
```
~$ chmod +x file_name.sh
```
Write the code
```
#!/bin/bash  
echo "This is a shell script"  
ls -lah  
echo "I am done running ls"  
SOMEVAR='text stuff'  
echo "$SOMEVAR"
```
and the result will be as follows (ls -lah : print all the long content of the current dir)
```
This is a shell script
total 16K
drwxr-xr-x  2 dsc dsc 4,0K ene 10 16:21 ./
drwxr-xr-x 38 dsc dsc 4,0K ene 10 16:24 ../
-rwxrwxrwx  1 dsc dsc  223 ene 10 16:12 column_name_number.sh*
-rwxr-xr-x  1 dsc dsc  125 ene 10 16:21 open_file_w_numberlines.sh*
I am done running ls
text stuff
```
### Example: 
Finding top 10 common words in a file
```
~$ cat textfile | tr "[:upper:]" "[:lower:]" | grep -oE "\w+" | sort | uniq -c | sort -nr | head -n 10
```
- Convert the entire text to lowercase using tr
- Extract all the words using grep and put each word on a separate line
- Sort words
- Remove all the duplicates using uniq and count how often each word appears in that list with -c
- Sort the numbers
- Keep the first 10 lines

```
#!/bin/bash  

# This script returns the 10 most common words in a file
# cat file | top_10_most_common_words.sh

tr "[:upper:]" "[:lower:]" | grep -oE "\w+" | sort | uniq -c | sort -nr | head -n 10
```
### Example:
Adding number to all output lines in a file

```
#!/bin/bash  

# This script returns the file content adding number to all output lines
# open_file_w_numberlines.sh file_name


FILE_INPUT= $1

cat -n $FILE_INPUT
```

## 2. Shell Script Exercises

1. Create a script that will return  column names together with their column number from the csv files. The first argument should be file name and the second delimiter.
- [Exercise 1](https://github.com/emunozlorenzo/MasterDataScience/blob/master/02_shell_Scripts/01_shell_Script.sh)

2. Create a script that accepts a CSV filename as input ($1 inside your script) and returns the model of the aircraft with the highest number of engines. (use it on  ~/Data/opentraveldata/optd_aircraft.csv) 
- [Exercise 2](https://github.com/emunozlorenzo/MasterDataScience/blob/master/02_shell_Scripts/02_shell_Script.sh)
3. Repeat script 2, but add a second argument to accept number of a column with the number of engines. If several planes have the highest number of engines, then the script will only show one of them.  (use it on  ~/Data/opentraveldata/optd_aircraft.csv) 
- [Exercise 3](https://github.com/emunozlorenzo/MasterDataScience/blob/master/02_shell_Scripts/03_shell_Script.sh)
4. Create a script that accepts as input arguments the name of the CSV file, and a number (number of engines) and returns number of aircrafts that have that number of engines. (use it on  ~/Data/opentraveldata/optd_aircraft.csv)  
- [Exercise 4](https://github.com/emunozlorenzo/MasterDataScience/blob/master/02_shell_Scripts/04_shell_Script.sh)

