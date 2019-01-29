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

