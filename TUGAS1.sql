Microsoft Windows [Version 10.0.22621.1413]
(c) Microsoft Corporation. All rights reserved.

C:\Users\Asus>cd \xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
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
MariaDB [dbtoko1]> create table produk;
ERROR 1113 (42000): A table must have at least 1 column
MariaDB [dbtoko1]> create table produk(
    -> id_produk int not null auto_increment primary key,
    -> nama_produk varchar(20) not null,
    -> harga int,
    -> jumlah int,
    -> stok int not null
    -> );
Query OK, 0 rows affected (0.021 sec)

MariaDB [dbtoko1]> create table pesanan_produk(
    -> id int not null auto_increment primary key,
    -> id_pelanggan INT NOT NULL,
    -> id_produk INT NOT NULL,
    -> jumlah_produk INT NOT NULL,
    -> harga_produk int,
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 7
MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| jenis_produk      |
| kartu             |
| pelanggan         |
| pembayaran        |
| pesanan           |
| produk            |
+-------------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko1]> create table pesanan_produk(
    -> id int not null auto_increment primary key,
    -> id_pelanggan INT NOT NULL,
    -> id_produk INT NOT NULL,
    ->  jumlah_produk INT NOT NULL,
    -> harga_produk INT NOT NULL,
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 7
MariaDB [dbtoko1]> create table pesanan_produk(
    -> id int not null auto_increment primary key,
    -> id_pelanggan INT NOT NULL,
    -> id_produk INT NOT NULL,
    -> jumlah_produk INT NOT NULL,
    -> harga_produk INT NOT NULL);
Query OK, 0 rows affected (0.012 sec)

MariaDB [dbtoko1]> create table vendor(
    -> id_supplier int not null auto_increment primary key,
    -> nama_supplier varchar(30) not null,);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 3
MariaDB [dbtoko1]> create table vendor(
    -> id_vendor int not null auto_increment primary key,
    -> nama_vendor varchar(30) not null,
    -> no_telp char(13),
    -> alamat varchar(100));
Query OK, 0 rows affected (0.032 sec)

MariaDB [dbtoko1]> creat table pembelian(
    -> id_pembelian INT PRIMARY KEY AUTO_INCREMENT,
    -> tanggal date,
    -> produk_id int(40) not null references produk(id),
    -> jumlah_produk INT NOT NULL,
    -> total_pembelian INT NOT NULL,
    -> vendor_id int(11) not null references vendor(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'creat table pembelian(
id_pembelian INT PRIMARY KEY AUTO_INCREMENT,
tanggal d...' at line 1
MariaDB [dbtoko1]> create table pembelian(
    -> id_pembelian INT PRIMARY KEY AUTO_INCREMENT,
    -> tanggal date,
    -> produk_id int(40) not null references produk(id),
    -> jumlah_produk INT NOT NULL,
    -> total_pembelian INT NOT NULL,
    -> vendor_id INT NOT NULL REFERENCES vendor(id));
Query OK, 0 rows affected (0.051 sec)

MariaDB [dbtoko1]> show tables;
+-------------------+
| Tables_in_dbtoko1 |
+-------------------+
| jenis_produk      |
| kartu             |
| pelanggan         |
| pembayaran        |
| pembelian         |
| pesanan           |
| pesanan_produk    |
| produk            |
| vendor            |
+-------------------+
9 rows in set (0.001 sec)

MariaDB [dbtoko1]> alter table pelanggan add column alamat varch
ar(40)
    -> Bye
Ctrl-C -- exit!

C:\xampp\mysql\bin>