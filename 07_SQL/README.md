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
![alt text](https://github.com/emunozlorenzo/MasterDataScience/tree/master/07_SQL/Img/image.png "Figure 1-1")

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

