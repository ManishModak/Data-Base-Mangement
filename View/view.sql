mysql> show databases ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| myrestaurant       |
| mysql              |
| performance_schema |
| sakila             |
| sib14              |
| sys                |
| world              |
+--------------------+
8 rows in set (0.01 sec)

mysql> use sib14 ;
Database changed

mysql> show tables ;
+-----------------+
| Tables_in_sib14 |
+-----------------+
| customers       |
| orders          |
| person          |
+-----------------+
3 rows in set (0.01 sec)

mysql> create table StudentDetails(
    -> StudentId int ,
    -> Name varchar(50) ,
    -> Address varchar(50) ,
    -> primary key(StudentId) ) ;
Query OK, 0 rows affected (0.05 sec)

mysql> create table StudentMarks(
    -> ID int ,
    -> Name varchar(50) ,
    -> Marks int ,
    -> Age int );
Query OK, 0 rows affected (0.03 sec)

mysql> insert into StudentMarks values (1,'Manish',90,19) ,
    -> (2,'Aman',85,20) ,
    -> (3,'Suyog',88,19) ,
    -> (4,'Abhi',50,18),
    -> (5,'Ram',65,22) ;
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>  insert into StudentDetails values (1,'Manish','Buldhana') ,
    -> (2,'Aman','Nagpur') ,
    -> (3,'Suyog','Pune') ,
    -> (4,'Ram','Mumbai') ,
    -> (5,'Abhi','Nashik') ;
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> CREATE VIEW first_three_students AS SELECT Name,Address FROM StudentDetails WHERE StudentId < 4 ;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM  first_three_students ;
+--------+----------+
| Name   | Address  |
+--------+----------+
| Manish | Buldhana |
| Aman   | Nagpur   |
| Suyog  | Pune     |
+--------+----------+
3 rows in set (0.00 sec)

mysql> CREATE VIEW temp AS SELECT Name,Address FROM StudentDetails ORDER BY Name ;
Query OK, 0 rows affected (0.01 sec)

mysql> Select * from temp ;
+--------+----------+
| Name   | Address  |
+--------+----------+
| Abhi   | Nashik   |
| Aman   | Nagpur   |
| Manish | Buldhana |
| Ram    | Mumbai   |
| Suyog  | Pune     |
+--------+----------+
5 rows in set (0.00 sec)

mysql> CREATE VIEW MarkView AS SELECT StudentDetails.Name , StudentDetails.Address , StudentMarks.Marks FROM StudentDetails , StudentMarks WHERE StudentDetails.Name = StudentMarks.Name ;
Query OK, 0 rows affected (0.01 sec)

mysql> Select * From MarkView ;
+--------+----------+-------+
| Name   | Address  | Marks |
+--------+----------+-------+
| Manish | Buldhana |    90 |
| Aman   | Nagpur   |    85 |
| Suyog  | Pune     |    88 |
| Abhi   | Nashik   |    50 |
| Ram    | Mumbai   |    65 |
+--------+----------+-------+
5 rows in set (0.01 sec)

mysql> show full tables where table_type like "%VIEW";
+----------------------+------------+
| Tables_in_sib14      | Table_type |
+----------------------+------------+
| first_three_students | VIEW       |
| markview             | VIEW       |
| temp                 | VIEW       |
+----------------------+------------+
3 rows in set (0.01 sec)

mysql> DROP VIEW temp ;
Query OK, 0 rows affected (0.01 sec)

mysql>  show full tables where table_type like "%VIEW";
+----------------------+------------+
| Tables_in_sib14      | Table_type |
+----------------------+------------+
| first_three_students | VIEW       |
| markview             | VIEW       |
+----------------------+------------+
2 rows in set (0.00 sec)

mysql> CREATE OR REPLACE VIEW Markview As SELECT StudentDetails.Name , StudentDetails.Address , StudentMarks.Marks , StudentMarks.Age FROM StudentDetails,StudentMarks WHERE StudentDetails.Name = StudentMarks.Name ;
Query OK, 0 rows affected (0.22 sec)

mysql>  Select * From MarkView ;
+--------+----------+-------+------+
| Name   | Address  | Marks | Age  |
+--------+----------+-------+------+
| Manish | Buldhana |    90 |   19 |
| Aman   | Nagpur   |    85 |   20 |
| Suyog  | Pune     |    88 |   19 |
| Abhi   | Nashik   |    50 |   18 |
| Ram    | Mumbai   |    65 |   22 |
+--------+----------+-------+------+
5 rows in set (0.00 sec)

mysql> INSERT INTO first_three_students(Name,Address) values('Tanmay','Pune') ;
ERROR 1423 (HY000): Field of view 'sib14.first_three_students' underlying table doesn't have a default value

mysql>  ALTER TABLE StudentDetails ALTER StudentId SET DEFAULT 0 ;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO first_three_students(Name,Address) values('Tanmay','Pune') ;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM first_three_students ;
+--------+----------+
| Name   | Address  |
+--------+----------+
| Tanmay | Pune     |
| Manish | Buldhana |
| Aman   | Nagpur   |
| Suyog  | Pune     |
+--------+----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM StudentDetails ;
+-----------+--------+----------+
| StudentId | Name   | Address  |
+-----------+--------+----------+
|         0 | Tanmay | Pune     |
|         1 | Manish | Buldhana |
|         2 | Aman   | Nagpur   |
|         3 | Suyog  | Pune     |
|         4 | Ram    | Mumbai   |
|         5 | Abhi   | Nashik   |
+-----------+--------+----------+
6 rows in set (0.00 sec)

mysql> CREATE VIEW SampleView AS SELECT StudentId,Name FROM StudentDetails WHERE Name is NOT NULL WITH CHECK OPTION ;
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO SampleView(StudentId) value (6) ;
ERROR 1369 (HY000): CHECK OPTION failed 'sib14.sampleview'
