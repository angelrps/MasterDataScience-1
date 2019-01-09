# Shell Quick Exercises

### File and Content Utilities
1. Create a directory “first_dir” in you home folder
```sh       
~$ mkdir first_dir
```
2. Create an empty file “text_file.txt” inside “first_dir” directory. 
```sh       
~$ touch ~/first_dir/text_file.txt
```
3. Add execute permissions to group users, and write permissions to other users to “text_file.txt” 
```sh       
~$ chmod g+x,o+w ~/first_dir/text_file.txt
```
4. Create 3 subdirectories inside “first_dir”: “sub1”, “sub2”, “text_file” 
```sh       
~$ mkdir ~/first_dir/sub1 ~/first_dir/sub2 ~/first_dir/text_file
```
5. Copy the “text_file.txt” file into “sub1” directory.
```sh       
~$ cp ~/first_dir/text_file.txt ~/first_dir/sub1/
```
6. Move the “text_file.txt” into sub2 under name “text_file.txt.2” . 
```sh       
~$ mv ~/first_dir/sub1/text_file ~/first_dir/sub2/text_file.txt.2
```
7. Copy the whole directory “sub1” to “sub3” directory. 
```sh       
~$ cp -r ~/first_dir/sub1 ~/first_dir/sub3 
```
8. Change file name of “first_dir /sub2/text_file.txt.2” to “first_dir /sub2/text_file.txt.backup”
```sh       
~$ mv ~/first_dir/sub2/text_file.txt.2 ~/first_dir/sub2/text_file.txt.backup
```
9. Move “first_dir /sub2/text_file.txt.backup” to “first_dir” directory as hidden file
```sh       
~$ mv ~/first_dir/sub2/text_file.txt.backup ~/first_dir/.text_file.txt.backup
```
10. Delete the “sub2” subdirectory
```sh       
~$ rm -r ~/first_dir/sub2
```
11. Go to data/shell/ directory and use less to open Finn.txt

    - locate the lines starting with “The”
    - Locate the lines ending with “works”

```sh       
~$ less ~/data/shell/Finn.txt
/^The  
```

```sh       
~$ less ~/data/shell/Finn.txt
/works$
```
- _n: next match_ _N: previous match_ 
- _g: go to beggining of the file_ _G: go to end of the file_
- _q: quit_
12. Open ~/Data/opentraveldata/optd_aircraft.csv with less command. Search for “Canada” and then search for “Puma”
```sh       
~$ less ~/Data/opentraveldata/optd_aircraft.csv
/Canada
/Puma
```
13. Use help to find out how to get the list of subdirectories limited to 2 sublevels by using “tree” command
```sh       
~$ man tree
```
14. Go to ~/Data/Shell/ and use Text_example.txt to generate a new file with the same content but with line number at the beginning of each line.
```sh       
~$ cat -n ~/Data/Shell/Text_example.txt > ~/Data/Shell/Text_example_line_numbers.txt
```
15. Generate a new file with twice the content of “Text_example.txt” inside. (one full text content after another)
```sh       
~$ cat Text_example.txt Text_example.txt > Text_example_x2.txt
```
16. Open new shell inside a new terminal tab and using block search execute again the command where we printed the linux details (hint: it had “release” in the name)
```sh       
CTRL + Shift + T (to open a new terminal)
CTRL + R (history block search)
```
17. Generate a file with creation timestamp and name of the user who created it on the first line. Something like this:
"# This file  is created by KSCHOOL on:Sun Nov 26 10:31:06 CET 2017"
```sh       
~$ echo "# This file  is created by KSCHOOL on:$(DATE)" > timestamp_header.txt
```
18. Save the information of 3 largest files located inside ~/Data/us_dot/otp/ into a three_largest_file.txt. (hint: use ls with sort option and pipe the result)
```sh       
~$ cd ~/Data/us_dot/otp/
~$ ls -slS1 | head -4 | tail -3 > three_largest_file.txt
```
19. Save last 20 commands used at command line to a file. (hint use history and redirect the output)
```sh       
~$ history -20 > last_20.txt
~$ cat .history | tail -n 20 > last_20.txt
```
20. Print first 3 lines of ~/Data/shell/Text_example.txt
```sh       
~$ cat ~/Data/shell/Text_example.txt | head -3 
```
21. Print content of ~/Data/shell/Text_example.txt except first 2 and last 3 lines.
```sh       
~$ cat ~/Data/shell/Text_example.txt | head -n -3 | tail +2
```
22. How many lines does ~/Data/opentraveldata/optd_aircraft.csv file have?
```sh       
~$ cat ~/Data/opentraveldata/optd_aircraft.csv | wc -l
```
23. How many words do first 5 lines of the ~/Data/shell/Finn.txt have?
```sh       
~$ cat ~/Data/shell/Finn.txt | head -5 | wc -w
```
24. Find all files located ONLY inside subdirectories of your home directory which have been modified in last 60min
```sh       
~$ find ~ -mindepth 2 -type f -mmin -60 
```
25. Find all empty files inside subdirectories of your home directory which do NOT have read-write-execute permissions given to all users
```sh       
~$ find -type f -empty ! -perm 777
```
26. Expand previous command to grant these permissions using “ok” option.
```sh       
~$ find -type f -empty ! -perm 777 -ok chmod 777 {} \;    (use CTRL+C to kill this command)
```
27. Get top 3 largest files per subdirectory inside ~/Data/ 
```sh       
~$ find ~/Data/ -type d -exec echo {} \; -exec sh -c "ls -S {} | head -3 " \; 
```

