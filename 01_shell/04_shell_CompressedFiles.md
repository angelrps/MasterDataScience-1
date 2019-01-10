# Shell 
.zip    - This kind of compressed file can contain several files inside
.gz     - This kind of compressed file contains only one file
.bzip2  - This kind of compressed file contains only on file (You can have different blocks)
### Working with Compressed Files
1. Go to ~/Data/us_dot/otp. Show the content of one of the files. 
```sh       
~$ zless On_Time_On_Time_Performance_2015_1.zip 
```
2. Use head/tail together with zcat command. Any difference in time execution?
```sh       
~$ zcat On_Time_On_Time_Performance_2015_1.zip |head
~$ zcat On_Time_On_Time_Performance_2015_1.zip |tail
```
3. Compress “optd_por_public.csv” with bzip2 and then extract from the compressed file all the lines starting with MAD (hint: use bzcat and grep)
```sh       
~$ bzip2 optd_por_public.csv 
~$ bzgrep -E "^MAD" optd_por_public.csv.bz2
~$ bzcat optd_por_public.csv.bz2 | grep -E "^MAD" 
```
4. (On_Time_On_Time_Performance_2015_1.zip): What are the column numbers of columns having “carrier” in the name ? (don't count!) (hint: we have seen this )
```sh       
~$ paste <(seq 110) <(zcat ./On_Time_On_Time_Performance_2015_1.zip  | head -n 1 | tr "," "\n")|grep -i "carrier"
```
5. (On_Time_On_Time_Performance_2015_1.zip) Print to screen, one field per line, the header and first line of the T100 file, side by side.
```sh       
~$ paste <(seq 110) <(zcat On_Time_On_Time_Performance_2015_1.zip  | head -n 1 | tr "," "\n") <(zcat On_Time_On_Time_Performance_2015_1.zip  | head -n 2 | tail -1 | tr "," "\n")
```
