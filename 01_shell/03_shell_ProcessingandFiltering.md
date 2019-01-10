# Shell 

### Processing and Filtering Utilities 1
_Go to ~/Data/opentraveldata_

1. Change the delimiter of optd_aircraft.csv to “,”

```sh       
~$ cat Data/opentraveldata/optd_aircraft.csv | tr "^" "," 
```
2. Check if optd_por_public.csv has repeated white spaces

```sh       
~$ cat ~/Data/opentraveldata/optd_por_public.csv | tr -s "[:blank:]" | wc
~$ wc ~/Data/opentraveldata/optd_por_public.csv
```
_Compare the size in bytes!_
3. How many columns has optd_por_public.csv? (hint: use head and tr)

```sh       
~$ cat ~/Data/opentraveldata/optd_por_public.csv | head -1 | tr "^" "\n" | wc -l 
```

4. Print column names of optd_por_public.csv  together with their column number. (hint: use paste)

```sh       
~$ paste <(seq 46)<(cat ~/Data/opentraveldata/optd_por_public.csv | head -1 | tr "^" "\n")
```

5. Use optd_airlines.csv to obtain the airline with the most flights?

```sh       
~$ cat optd_airlines.csv | cut -d "^" -f 8,14 | sort -t "^" -k2nr,2 | head -1 
```
6. Use optd_airlines.csv to obtain number of airlines in each alliance?
 
```sh       
~$ cat optd_airlines.csv | cut -d "^" -f 10 | sort | uniq -c | sort -nr
```
### Processing and Filtering Utilities 2
_Go to ~/Data/opentraveldata_
1. Use grep to extract all 7x7 (where x can be any number) airplane models from optd_aircraft.csv. 
```sh       
~$ cut -d "^" -f 3 ~/Data/opentraveldata/optd_aircraft.csv | grep -E "[7][0-9][7]"
```
2. Use grep to extract all 3xx (where x can be any number) airplane models from optd_aircraft.csv. 
```sh       
~$ cut -d "^" -f 3 ~/Data/opentraveldata/optd_aircraft.csv | grep -E "[3][0-9]{2}"
```
3. Use grep to obtain the number of airlines with prefix “aero” (case insensitive) in their name from optd_airlines.csv 
```sh       
~$ cut -d "^" -f 8 ~/Data/opentraveldata/optd_airlines.csv | grep -i -E "^aero"| wc -l
```
4. How many optd_por_public.csv columns have “name” as part of their name? What are their numerical positions? (hint: use seq and paste)
```sh       
~$ paste <(seq 50) <(head -n 1 optd_por_public.csv | tr "^" "\n")|grep name
```
5. Find all files with txt extension inside home directory (including all sub directories) that have word “Science” (case insensitive) inside the content. Print file path and the line containing the (S/s)cience word. 
```sh       
~$ find ~ -type f -iname "*.txt" -exec grep -iwH "Science" {} \;
```
### Processing and Filtering Utilities 3
_Use Text_example.txt_
1. Replace every “line” with new line character (“\n”)
```sh       
~$ sed 's/line/\n/g' Text_example.txt
```
2. Delete lines that contain the “line” word.
```sh       
~$ sed '/line/d' Text_example.txt
```
3. Print ONLY the lines that DON’T contain the “line” word
```sh       
~$ sed -n '/line/!p' Text_example.txt
```
