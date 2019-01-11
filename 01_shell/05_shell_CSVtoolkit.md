# Shell

## CSVtoolkit


Convert Excel to CSV::

    in2csv data.xls > data.csv

Convert JSON to CSV::

    in2csv data.json > data.csv
### csvcut

-d delimiter (-d "," by default)

-c column (column_name or column_number)

-n display column names and index

Print column names:

    csvcut -n data.csv

Select a subset of columns:

    csvcut -c column_a,column_c data.csv > new.csv
    csvcut -d "^" -c 1-3 data.csv
    csvcut -d "|" -c 5 data.csv

Reorder columns::

    csvcut -c column_c,column_a data.csv > new.csv
    
### csvlook
Render a csv file

-d delimiter

-H csv file without header row

-l show line numers

    csvlook -d "^" data.csv
    csvlook -l data.csv | less
    
Truncate lines wider than window - TOP

    csvlook -ld "^" data.csv | less -S
### csvstat
Descriptive statistics

-d delimeter

-c column

    csvstat -d "^" -c 2-4,7 data.csv | less
    csvstat -c column_name data.csv

### csvgrep
This is similar to unix "grep" command with output delimiter ","

-m pattern

-i invert the result

-a any listed column must match the search string (by default is all)

    csvgrep -d "^" -m 380 data.csv
    csvgrep -d "^" -c column_name -m 380 data.csv
    csvgrep -d "^" -c column_number -im 380 data.csv
    
    # The pattern has to be in column_1 OR column_2
    csvgrep -a -c 1,2 -r "^A" data.csv
    
    # The pattern has to be in column_1 AND column_2
    csvgrep -c 1,2 -r "^A" data.csv
    
Find rows with matching cells::

    csvgrep -c 

### csvsort
This is similar to unix "sort" command with output delimiter ","

-r reverse

-n display column names and index

-c columns

    csvsort -n -d "^" data.csv
    csvsort -c column_name -r data.csv | csvcut -c 3 | head

### csvstack
Stack up (apila) the rows from multiple CSV files

    csvstack data1.csv data2.csv | less
### csvjoin
Execute a SQL-like join to merge CSV files on a specified column or columns.

_Don't try this on very large files_

### csvformat
Convert a CSV file to a custom output format

-D output delimeter

    csvformat -d "^" -D "~" data.csv > new_del_data.csv
    # Similar to
    cat data.csv | tr "^" "~" > new_del_data.csv

### csvsql
Generate SQL statements for one or more CSV files

-i Database

    csvsql -d "^" data.csv > sql_data.sql
    csvsql -d "^" -i postgresql data.csv
    csvsql -d "^" -i mysql data.csv

Convert to JSON::

    csvjson data.csv > data.json

Query with SQL::

    csvsql --query "select name from data where age > 30" data.csv > new.csv

Import into PostgreSQL::

    csvsql --db postgresql:///database --insert data.csv

Extract data from PostgreSQL::

    sql2csv --db postgresql:///database --query "select * from data" > new.csv

And much more...

## CSVtoolkit Exercises
1. Use csvstat to find out how many different manufactures are in the file
```
csvstat -d "^" -c manufacturer optd_aircraft.csv
```    
2. Extract the column manufacturer and using pipes, use sort, uniq and wc  find out how many manufacturers are in the file. Why does this number differ to the number reported in csvstat?
```
csvcut -d '^' -c manufacturer optd_aircraft.csv | tail -n+2 | sort | uniq | wc –l
```   
3. What are the top 5 manufacturers? 
```
csvcut -d '^' -c manufacturer optd_aircraft.csv | tail -n+2 | sort | uniq -c | sort -nr | head -5
```   
4. Using csvgrep, get only the records with manufacturer equal to Airbus and save them to a file with pipe (|) delimiter.
```
csvgrep -d '^' -c manufacturer -m Airbus optd_aircraft.csv | tr "," "|" > airbus.csv 
csvgrep -d '^' -c manufacturer -m Airbus optd_aircraft.csv | csvformat -D '|' > airbus.csv
```   

