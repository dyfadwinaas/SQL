Microsoft Windows [Version 10.0.22621.1413]
(c) Microsoft Corporation. All rights reserved.

C:\Users\Asus>cd \xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 12
Server version: 10.4.27-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| dbtoko1            |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.001 sec)

MariaDB [(none)]> use dbtoko1;
Database changed
MariaDB [dbtoko1]> alter table pelanggan add alamat varchar(50);
Query OK, 0 rows affected (0.032 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc pelanggan;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode      | varchar(10) | YES  | UNI | NULL    |
  |
| nama      | varchar(30) | YES  |     | NULL    |
  |
| jk        | char(1)     | YES  |     | NULL    |
  |
| tmp_lahir | varchar(20) | YES  |     | NULL    |
  |
| tgl_lahir | date        | YES  |     | NULL    |
  |
| email     | varchar(30) | YES  |     | NULL    |
  |
| kartu_id  | int(11)     | NO   |     | NULL    |
  |
| alamat    | varchar(50) | YES  |     | NULL    |
  |
+-----------+-------------+------+-----+---------+----------------+
9 rows in set (0.020 sec)

MariaDB [dbtoko1]> alter table pelanggan modify nama_pelanggan varchar(30);
ERROR 1054 (42S22): Unknown column 'nama_pelanggan' in 'pelanggan'
MariaDB [dbtoko1]> alter table pelanggan change nama nama_pelanggan varchar(30);
Query OK, 0 rows affected (0.034 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc pelanggan
    -> desc pelanggan;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'desc pelanggan' at line 2
MariaDB [dbtoko1]> desc pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |
       |
| nama_pelanggan | varchar(30) | YES  |     | NULL    |
       |
| jk             | char(1)     | YES  |     | NULL    |
       |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |
       |
| tgl_lahir      | date        | YES  |     | NULL    |
       |
| email          | varchar(30) | YES  |     | NULL    |
       |
| kartu_id       | int(11)     | NO   |     | NULL    |
       |
| alamat         | varchar(50) | YES  |     | NULL    |
       |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.021 sec)

MariaDB [dbtoko1]> alter table pelanggan modify nama_pelanggan varchar(50);
Query OK, 0 rows affected (0.010 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |
       |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |
       |
| jk             | char(1)     | YES  |     | NULL    |
       |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |
       |
| tgl_lahir      | date        | YES  |     | NULL    |
       |
| email          | varchar(30) | YES  |     | NULL    |
       |
| kartu_id       | int(11)     | NO   |     | NULL    |
       |
| alamat         | varchar(50) | YES  |     | NULL    |
       |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.016 sec)

MariaDB [dbtoko1]>