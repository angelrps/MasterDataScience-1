# SQL Exercises

First of all, we have to create our environment (DB: MasterDC)
```sh       
# Connect to a default DB (dsc) with psql
~$ psql 
dsc=# CREATE DATABASE masterdc;
dsc=# \c masterdc; 
masterdc=#
```

1. Generate 'Facebook' table where every person is identified with the name, age, city of residence and email. The table should at least have 5 rows
```sh       
masterdc=# CREATE TABLE facebook ( name VARCHAR,
masterdc(#                         age INT,
masterdc(#                         city VARCHAR,
masterdc(#                         email VARCHAR);
```
![Figure 1-1](https://github.com/emunozlorenzo/MasterDataScience/blob/master/07_SQL/Img/image.png "Figure 1-1")

```sh       
masterdc=# INSERT INTO facebook VALUES('Alberto',28,'Madrid','al@gmail.com');
masterdc=# INSERT INTO facebook VALUES('Javier',32,'Barcelona','ja@gmail.com');
masterdc=# INSERT INTO facebook VALUES('Laura',24,'Valencia','la@gmail.com');
masterdc=# INSERT INTO facebook VALUES('Fernando',68,'Madrid','fer@gmail.com');
masterdc=# INSERT INTO facebook VALUES('Patricia',45,'Sevilla','pa@gmail.com');
```
2. Writea query to obtain Facebook friends which are younger than < 25 or older than 65 years. 
```sh       
masterdc=# SELECT * FROM facebook WHERE age<25 or age>65;
```
3. Write a query to obtain all facebook friends which do not reside in Madrid. 
```sh       
masterdc=# SELECT * FROM facebook WHERE UPPER(city) != 'MADRID';
```
4. Add phone and username columns to your Facebook table.
```sh       
masterdc=# ALTER TABLE facebook ADD COLUMN phone VARCHAR;
masterdc=# ALTER TABLE facebook ADD COLUMN username VARCHAR;

```
5. What is the content of these two columns after their creation? 
```sh       
masterdc=# SELECT * FROM facebook;
```
![Figure 1-2](https://github.com/emunozlorenzo/MasterDataScience/blob/master/07_SQL/Img/image2.png "Figure 1-2")

6. Update the phone number of all of your facebook friends.
```sh       
masterdc=# UPDATE facebook SET phone='+34111222333';
```
![Figure 1-3](https://github.com/emunozlorenzo/MasterDataScience/blob/master/07_SQL/Img/image3.png "Figure 1-3")

7. All your Facebook friends use their email as user name, so that both columns conicide.How can you take advantage of this fact when updating the user name column.
```sh       
masterdc=# UPDATE facebook SET username= email;
```

### Importing data
```sh       
masterdc=# \! wget https://raw.githubusercontent.com/masterdatascience/postgres/master/my_fb_friends.csv
masterdc=# \! wget https://raw.githubusercontent.com/masterdatascience/postgres/master/my_ldin_contacts.csv
```
### Renaming table 
```sh       
masterdc=# ALTER TABLE facebook RENAME TO old_facebook;
```
### Copy table (choosing the columns) to another table
```sh       
masterdc=# CREATE TABLE facebook AS SELECT name,age,city,email FROM old_facebook;
```
### Copy a csv (delimeter ^) to a table
```sh       
masterdc=# \copy facebook from './my_fb_friends.csv' delimiter '^' csv header;
```
![Figure 1-4](https://github.com/emunozlorenzo/MasterDataScience/blob/master/07_SQL/Img/image4.png "Figure 1-4")

### Alias
- Alias is used to chage momentarely the name of something, during a query
- Alias is specified with AS
```sh       
masterdc=# SELECT *, (age*2) as doub_edad from facebook where (age*2)>49;
masterdc=# SELECT * FROM facebook AS t WHERE t.city = 'Valencia';
```
![Figure 1-5](https://github.com/emunozlorenzo/MasterDataScience/blob/master/07_SQL/Img/image5.png "Figure 1-5")

### Removing the duplicates
Cities present in Facebook table:
```sh       
masterdc=# SELECT DISTINCT residencia FROM facebook;
```
### Sorting the results
When we launch a query the order of the obtained results is not guaranteed!

We can define the order by using order by.

*From lowest to highest:*
```sh       
masterdc=# SELECT * FROM facebook ORDER BY age;
```
*From highest to lowest:*
```sh       
masterdc=# SELECT * FROM facebook ORDER BY age DESC;
```
### Sorting by multiples options
```sh       
masterdc=# SELECT * FROM facebook ORDER BY age, name;
masterdc=# SELECT * FROM facebook ORDER BY age DESC, name ASC;
```
### Limiting the number of results
```sh       
masterdc=# SELECT * FROM facebook ORDER BY age DESC LIMIT 5;
```
With offset we can start counting at the specific line
```sh       
masterdc=# SELECT * FROM facebook ORDER BY age DESC OFFSET 5 LIMIT 3;
```
### Logical operators
AND OR NOT BETWEEN IN
```sh       
masterdc=# SELECT * FROM facebook WHERE age BETWEEN 18 AND 30;
masterdc=# SELECT * FROM facebook WHERE age NOT IN (24,32,35);
```
### Aggregate function
Compute a single result value from a set of input values.

AVG COUNT MAX MIN SUM
```sh       
masterdc=# SELECT COUNT(*) FROM facebook;
masterdc=# SELECT AVG(age), MIN(age), MAX(age) FROM facebook;
```
### Group by
- Is used to group together those rows in a table that share the same values in all the columns listed.
- The effect is to combine each set of rows sharing common values into one group row that is representative of all rows in the group
- This is done to eliminate redundancy in the output and/or compute aggregates that apply to these groups.
```sh       
masterdc=# SELECT city, COUNT(*), AVG(age) FROM facebook GROUP BY city;
masterdc=# SELECT city, age, COUNT(*) FROM facebook GROUP BY city, age;
masterdc=# SELECT city, COUNT(*), AVG(age) FROM facebook GROUP BY city HAVING AVG(age)>20;
```
### Multiple queries
- The result of a query is nothing more than a temporal table. Hence we can apply a query over the result of another query.
```sh
masterdc=# SELECT *, ( SELECT AVG(age) FROM facebook WHERE city='Madrid' ) AS Mad_average FROM facebook;
masterdc=# SELECT *, ( SELECT AVG(age) FROM facebook WHERE city='Madrid' ) AS Mad_average FROM facebook WHERE age <(SELECT AVG(age) FROM facebook WHERE city=’Madrid’); 
```

WHERE + IN, ANY, ALL
```sh
masterdc=# SELECT * FROM facebook WHERE city IN (SELECT city FROM facebook GROUP BY city HAVING AVG(edad)>35) ;
masterdc=# SELECT * FROM facebook WHERE username = ANY (SELECT name FROM friends WHERE name LIKE '%a%‘);
```
### JOINS
- Joins the result of different queries
- Join combination can be:
    - INNER JOIN,
    - LEFT OUTER JOIN,
    - RIGHT OUTER JOIN,
    - FULL JOIN
- Multiple quieries(especially join) can be very slow and can consume a lot of memory.
- Data model should facilitate multiple queries, buttry NOT to duplicate too much the data

#### INNER JOIN
```sh
masterdc=# SELECT * FROM facebook AS fb  
masterdc-# INNER JOIN linkedin AS ln
masterdc-# ON fb.email = ln.email;
```
#### LEFT OUTER JOIN
```sh
masterdc=# SELECT fb.*, ln.* FROM facebook AS fb  
masterdc-# LEFT OUTER JOIN linkedin AS ln
masterdc-# ON fb.email = ln.email;
```
#### RIGHT OUTER JOIN
```sh
masterdc=# SELECT fb.*, ln.* FROM facebook AS fb  
masterdc-# RIGHT OUTER JOIN linkedin AS ln
masterdc-# ON fb.email = ln.email;
```
#### FULL JOIN
```sh
masterdc=# SELECT fb.*, ln.* FROM facebook AS fb  
masterdc-# FULL JOIN linkedin AS ln
masterdc-# ON fb.email = ln.email;
```

### EXERCISES

1. Import optd_aircraft.csv and optd_airlines.csv in postgres
( /Data/opentraveldata/)

    1.1 Execute in psql:

```sh
masterdc=# CREATE DATABASE optd;
```

    1.2  Execute @shell inside ( ~/Data/opentraveldata/):

```sh
~$ csvsql -d '^' optd_aircraft.csv -i postgresql > psql_create_optd_aircraft.txt 
~$ csvsql -d '^' optd_airlines.csv -i postgresql > psql_create_optd_airlines.txt 
~$ psql -d optd -f psql_create_optd_aircraft.txt
~$ psql -d optd -f psql_create_optd_airlines.txt 
```

    1.3 Execute in psql:

```sh
optd=# \cd ~/Data/opentraveldata/
optd=# \copy optd_aircraft from './optd_aircraft.csv' delimiter '^' csv header;
optd=# \copy optd_airlines from './optd_airlines.csv' delimiter '^' csv header;
```

2. Which airplane has the highest number of engines?
(optd_aircraft)

```sh
optd=# SELECT manufacturer,model,nb_engines FROM optd_aircraft WHERE nb_engines >0 ORDER BY nb_engines DESC LIMIT 1; 
```
or

```sh
optd=# SELECT manufacturer,model,nb_engines FROM optd_aircraft WHERE nb_engines IS NOT NULL ORDER BY nb_engines DESC LIMIT 1; 
```


3. What number of engines is most common on airplanes?
(optd_aircraft)

```sh
optd=# SELECT nb_engines,COUNT(nb_engines) FROM optd_aircraft WHERE nb_engines IS NOT NULL GROUP BY nb_engines ORDER BY COUNT(nb_engines) DESC ;
```