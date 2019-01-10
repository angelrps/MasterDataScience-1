# Shell 

### Sorting and Counting Utilities
1. Find top 10 files by size in your home directory including the subdirectories. Sort them by size and print the result including the size and the name of the file (hint: use find with -size and -exec ls -s parameters)  
```sh       
~$ find ~ -type f -size +20M -exec ls -sh {} \; | sort -nr | head -10
```
2. Create a dummy file with this command : seq 15> 20lines.txt; seq 9 1 20 >> 20lines.txt; echo"20\n20" >> 20lines.txt; (check the content of file first)
```sh       
~$ seq 15> 20lines.txt; seq 9 1 20 >> 20lines.txt; echo"20\n20" >> 20lines.txt
```
- Sort the lines of file based on alphanumeric characters
```sh       
~$  sort -d 20lines.txt 
```
- Sort the lines of file based on numeric values and eliminate the duplicates
```sh       
~$ sort -nu 20lines.txt 
```
- Print all duplicated lines of the file
```sh       
~$ sort -n 20lines.txt| uniq -d 
```
- Print the line which has most repetition
```sh       
~$ sort -nr 20lines.txt | uniq -c | sort -nr | head -1
```
- Print all lines with the number of repetitions sorted by the number of repetitions from lowest to highest
```sh       
~$ sort -n 20lines.txt| uniq -c | sort -n
```
3. Create another file with this command : seq 0 2 40 > 20lines2.txt
```sh       
~$ seq 0 2 40 > 20lines2.txt
```
- Create 3rd file from the first two but without duplicates
```sh       
~$ cat 20lines.txt 20lines2.txt | sort -n | uniq > 20lines_no_dup.txt 
~$ sort -nu 20lines.txt 20lines2.txt > 20files_no_dupl.txt
```
- Merge the first two files. Print unique lines together with the number of occurrences  inside the merged file and sorted based on line content.
```sh       
~$ sort 20lines2.txt 20lines.txt | uniq -c | sort -k 2n,2
```
4. Go to ~/Data/opentraveldata. Get the line with the highest number of engines using sort.
```sh       
~$ cat optd_aircraft.csv | sort -t "^" -k7nr | head -1
~$ sort -t "^" -k 7nr,7 optd_aircraft.csv |head -1
```
