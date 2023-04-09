Microsoft Windows [Version 10.0.22621.1413]
(c) Microsoft Corporation. All rights reserved.

C:\Users\Asus>cd \xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.27-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'database' at line 1
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
5 rows in set (0.033 sec)

MariaDB [(none)]> create databases dbtoko1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'databases dbtoko1' at line 1
MariaDB [(none)]> CREATE DATABASE dbtoko1;
Query OK, 1 row affected (0.012 sec)

MariaDB [(none)]> use dbtoko1;
Database changed
MariaDB [dbtoko1]> create table kartu(
    -> id int not null auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(30) not null,
    -> diskon double default 0,
    -> iuran double default 0);
Query OK, 0 rows affected (0.048 sec)

MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| kartu             |
+-------------------+
1 row in set (0.010 sec)

MariaDB [dbtoko1]> desc kartu;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode   | varchar(10) | YES  | UNI | NULL    |                |
| nama   | varchar(30) | NO   |     | NULL    |                |
| diskon | double      | YES  |     | 0       |                |
| iuran  | double      | YES  |     | 0       |                |
+--------+-------------+------+-----+---------+----------------+
5 rows in set (0.025 sec)

MariaDB [dbtoko1]> create table pelanggan(
    -> id int not null auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(30),
    -> jk char(1),
    -> tmp_lahir varchar(20),
    -> tgl_lahir date,
    -> email varchar(30),
    -> kartu_id int not null references kartu(id));
Query OK, 0 rows affected (0.037 sec)

MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| kartu             |
| pelanggan         |
+-------------------+
2 rows in set (0.001 sec)

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
+-----------+-------------+------+-----+---------+----------------+
8 rows in set (0.023 sec)

MariaDB [dbtoko1]> create table pesanan(
    -> id int not null auto_increment primary key,
    -> tanggal date,
    -> total double,
    -> pelanggan_id int not null references pelanggan(id));
Query OK, 0 rows affected (0.030 sec)

MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| kartu             |
| pelanggan         |
| pesanan           |
+-------------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko1]> desc pesanan;
+--------------+---------+------+-----+---------+----------------+
| Field        | Type    | Null | Key | Default | Extra
 |
+--------------+---------+------+-----+---------+----------------+
| id           | int(11) | NO   | PRI | NULL    | auto_increment |
| tanggal      | date    | YES  |     | NULL    |
 |
| total        | double  | YES  |     | NULL    |
 |
| pelanggan_id | int(11) | NO   |     | NULL    |
 |
+--------------+---------+------+-----+---------+----------------+
4 rows in set (0.020 sec)

MariaDB [dbtoko1]> create table pembayaran(
    -> id int not null auto_increment primary key,
    -> nokuitansi varchar(10) unique,
    -> tanggal date,
    -> jumlah double,
    -> ke int,
    -> pesanan_id int not null references pesanan(id));
Query OK, 0 rows affected (0.030 sec)

MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| kartu             |
| pelanggan         |
| pembayaran        |
| pesanan           |
+-------------------+
4 rows in set (0.001 sec)

MariaDB [dbtoko1]> desc pembayaran;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi | varchar(10) | YES  | UNI | NULL    |
   |
| tanggal    | date        | YES  |     | NULL    |
   |
| jumlah     | double      | YES  |     | NULL    |
   |
| ke         | int(11)     | YES  |     | NULL    |
   |
| pesanan_id | int(11)     | NO   |     | NULL    |
   |
+------------+-------------+------+-----+---------+----------------+
6 rows in set (0.008 sec)

MariaDB [dbtoko1]> create table jenis_produk(
    -> id int not null auto_increment primary key,
    -> nama varchar(45));
Query OK, 0 rows affected (0.022 sec)

MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| jenis_produk      |
| kartu             |
| pelanggan         |
| pembayaran        |
| pesanan           |
+-------------------+
5 rows in set (0.001 sec)

MariaDB [dbtoko1]>c