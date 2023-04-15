crosoft Windows [Version 10.0.22621.1413]
(c) Microsoft Corporation. All rights reserved.

C:\Users\yusri>cd\xampp\MySQL\bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.27-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

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
5 rows in set (0.015 sec)

MariaDB [(none)]> create database dbtoko1;
Query OK, 1 row affected (0.001 sec)

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
MariaDB [dbtoko1]> create table kartu(
    -> id int auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(30) not null,
    -> diskon double default 0,
    -> iuran double default 0);
Query OK, 0 rows affected (0.012 sec)

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
5 rows in set (0.008 sec)

MariaDB [dbtoko1]> create table pelanggan(
    -> id int not null auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(30),
    -> jk char(1),
    -> tmp_lahir varchar(30),
    -> tgl_lahir date,
    -> email varchar(45),
    -> kartu_id int not null references kartu(id));
Query OK, 0 rows affected (0.014 sec)

MariaDB [dbtoko1]> desc pelanggan;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode      | varchar(10) | YES  | UNI | NULL    |                |
| nama      | varchar(30) | YES  |     | NULL    |                |
| jk        | char(1)     | YES  |     | NULL    |                |
| tmp_lahir | varchar(30) | YES  |     | NULL    |                |
| tgl_lahir | date        | YES  |     | NULL    |                |
| email     | varchar(45) | YES  |     | NULL    |                |
| kartu_id  | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
8 rows in set (0.007 sec)

MariaDB [dbtoko1]> create table pesanan(
    -> id int not null auto_increment primary key,
    -> tanggal date,
    -> total double,
    -> pelanggan_id int not null references pelanggan(id));
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbtoko1]> create table pembayaran(
    -> id int not null auto_increment primary key,
    -> nokuitansi varchar(10) unique,
    -> tanggal date,
    -> jumlah double,
    -> ke int,
    -> pesanan_id int not null references pesanan (id));
Query OK, 0 rows affected (0.014 sec)

MariaDB [dbtoko1]> create table jenis_produk(
    -> id int not null auto_increment primary key,
    -> nama varchar (45));
Query OK, 0 rows affected (0.007 sec)

MariaDB [dbtoko1]> create table produk(
    -> id_produk int not null auto_increment primary key,
    -> nama_produk varchar(20) not null,
    -> harga int,
    -> jumlah int,
    -> stok int not null
    -> );
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbtoko1]> create table pesanan_items(
    -> id int not null auto_increment primary key,
    -> id_pelanggan int not null,
    -> id_produk int not null,
    -> jml_produk int not null,
    -> harga_produk int not null);
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbtoko1]> create table vendor(
    -> id_vendor int not null auto_increment primary key,
    -> nama_vendor varchar(30),
    -> no_telp char(13),
    -> alamat varchar(100));
Query OK, 0 rows affected (0.006 sec)

MariaDB [dbtoko1]> create table pembelian(
    -> id_pembelian int not null auto_increment primary key,
    -> tanggal date,
    -> produk_id int(40) not null references produk(id),
    -> jumlah_produk int not null,
    -> total_pembelian int not null,
    -> vendor_id int not null references vendor(id));
Query OK, 0 rows affected (0.006 sec)

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
| pesanan_items     |
| produk            |
| vendor            |
+-------------------+
9 rows in set (0.001 sec)

MariaDB [dbtoko1]> desc pelanggan;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode      | varchar(10) | YES  | UNI | NULL    |                |
| nama      | varchar(30) | YES  |     | NULL    |                |
| jk        | char(1)     | YES  |     | NULL    |                |
| tmp_lahir | varchar(30) | YES  |     | NULL    |                |
| tgl_lahir | date        | YES  |     | NULL    |                |
| email     | varchar(45) | YES  |     | NULL    |                |
| kartu_id  | int(11)     | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
8 rows in set (0.007 sec)

MariaDB [dbtoko1]> alter table pelanggan add alamat varchar(100);
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc pelanggan;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id        | int(11)      | NO   | PRI | NULL    | auto_increment |
| kode      | varchar(10)  | YES  | UNI | NULL    |                |
| nama      | varchar(30)  | YES  |     | NULL    |                |
| jk        | char(1)      | YES  |     | NULL    |                |
| tmp_lahir | varchar(30)  | YES  |     | NULL    |                |
| tgl_lahir | date         | YES  |     | NULL    |                |
| email     | varchar(45)  | YES  |     | NULL    |                |
| kartu_id  | int(11)      | NO   |     | NULL    |                |
| alamat    | varchar(100) | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
9 rows in set (0.007 sec)

MariaDB [dbtoko1]> Insert into pelanggan(kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat) values
    -> ('001','Dyfa','P','Jakarta','2001-10-10','dyfa@gmail.com',1,'jl.buah');
Query OK, 1 row affected (0.031 sec)

MariaDB [dbtoko1]> Insert into pelanggan(kode, nama, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat) values
    -> ('002','dwina','L','Bandung','2001-05-05','dwina@gmail.com',2,'jl.rujak'),
    -> ('003','Ucok','L','Bekasi','2000-02-02','ucok@gmail.com',3,'jl.haji salim'),
    -> ('004','syaa','P','Banten','2002-03-03','syaa@gmail.com',4,'jl.kalisari'),
    -> ('005','lubis','L','lampung','2000-02-010','Lubis@gmail.com',5,'jl.albasia'),
    -> ('006','Izza','L','Makasar','2004-06-012','Izza@gmail.com',6,'jl.kapuk');
Query OK, 5 rows affected (0.001 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> select * from pelanggan;
+----+------+-------+------+-----------+------------+-----------------+----------+---------------+
| id | kode | nama  | jk   | tmp_lahir | tgl_lahir  | email           | kartu_id | alamat        |
+----+------+-------+------+-----------+------------+-----------------+----------+---------------+
|  1 | 001  | Dyfa  | P    | Jakarta   | 2001-10-10 | dyfa@gmail.com  |        1 | jl.buah       |
|  2 | 002  | dwina | L    | Bandung   | 2001-05-05 | dwina@gmail.com |        2 | jl.rujak      |
|  3 | 003  | Ucok  | L    | Bekasi    | 2000-02-02 | ucok@gmail.com  |        3 | jl.haji salim |
|  4 | 004  | syaa  | P    | Banten    | 2002-03-03 | syaa@gmail.com  |        4 | jl.kalisari   |
|  5 | 005  | lubis | L    | lampung   | 2000-02-10 | Lubis@gmail.com |        5 | jl.albasia    |
|  6 | 006  | Izza  | L    | Makasar   | 2004-06-12 | Izza@gmail.com  |        6 | jl.kapuk      |
+----+------+-------+------+-----------+------------+-----------------+----------+---------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko1]>
MariaDB [dbtoko1]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
2 rows in set (0.008 sec)

MariaDB [dbtoko1]> alter table jenis_produk add ket varchar(30);
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
| ket   | varchar(30) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.007 sec)

MariaDB [dbtoko1]> Insert into jenis_produk(nama,ket) values
    -> ('bantal','tersedia'),
    -> ('guling','tersedia'),
    -> ('kasur','tersedia'),
    -> ('selimut','tidak tersedia');
Query OK, 4 rows affected (0.002 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> SELECT * from jenis_produk;
+----+---------+----------------+
| id | nama    | ket            |
+----+---------+----------------+
|  1 | bantal  | tersedia       |
|  2 | guling  | tersedia       |
|  3 | kasur   | tersedia       |
|  4 | selimut | tidak tersedia |
+----+---------+----------------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> desc produk;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id_produk   | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama_produk | varchar(20) | NO   |     | NULL    |                |
| harga       | int(11)     | YES  |     | NULL    |                |
| jumlah      | int(11)     | YES  |     | NULL    |                |
| stok        | int(11)     | NO   |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
5 rows in set (0.007 sec)

MariaDB [dbtoko1]> alter table produk add kode varchar(10);
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc produk;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id_produk   | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama_produk | varchar(20) | NO   |     | NULL    |                |
| harga       | int(11)     | YES  |     | NULL    |                |
| jumlah      | int(11)     | YES  |     | NULL    |                |
| stok        | int(11)     | NO   |     | NULL    |                |
| kode        | varchar(10) | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
6 rows in set (0.007 sec)

MariaDB [dbtoko1]> insert into produk (nama_produk,harga,jumlah,stok,kode) values
    -> ('Bantal IKEA',300000,300,10,1112),
    -> ('Guling Restking',150000,200,30,1113),
    -> ('Kasur comforta',8000000,50,10,1114),
    -> ('Selimut wuinch',700000,100,20,1115);
Query OK, 4 rows affected (0.001 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> Select * FROM produk;
+-----------+-----------------+---------+--------+------+------+
| id_produk | nama_produk     | harga   | jumlah | stok | kode |
+-----------+-----------------+---------+--------+------+------+
|         1 | Bantal IKEA     |  300000 |    300 |   10 | 1112 |
|         2 | Guling Restking |  150000 |    200 |   30 | 1113 |
|         3 | Kasur comforta  | 8000000 |     50 |   10 | 1114 |
|         4 | Selimut wuinch  |  700000 |    100 |   20 | 1115 |
+-----------+-----------------+---------+--------+------+------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]>

MariaDB [dbtoko1]>
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
5 rows in set (0.007 sec)

MariaDB [dbtoko1]> insert into kartu (kode,nama,diskon,iuran) values
    -> ('10113','Silver',20000,2000),
    -> ('10114','Gold',30000,3000),
    -> ('10115','Platinum',40000,4000);
Query OK, 3 rows affected (0.002 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> Select * FroM kartu;
+----+-------+----------+--------+-------+
| id | kode  | nama     | diskon | iuran |
+----+-------+----------+--------+-------+
|  1 | 10113 | Silver   |  20000 |  2000 |
|  2 | 10114 | Gold     |  30000 |  3000 |
|  3 | 10115 | Platinum |  40000 |  4000 |
+----+-------+----------+--------+-------+
3 rows in set (0.000 sec)

MariaDB [dbtoko1]>
MariaDB [dbtoko1]> Select * FROM produk;
+-----------+-----------------+---------+--------+------+------+
| id_produk | nama_produk     | harga   | jumlah | stok | kode |
+-----------+-----------------+---------+--------+------+------+
|         1 | Bantal IKEA     |  300000 |    300 |   10 | 1112 |
|         2 | Guling Restking |  150000 |    200 |   30 | 1113 |
|         3 | Kasur comforta  | 8000000 |     50 |   10 | 1114 |
|         4 | Selimut wuinch  |  700000 |    100 |   20 | 1115 |
+-----------+-----------------+---------+--------+------+------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> alter table produk change harga harga_modal int;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> SElect * FROM produk;
+-----------+-----------------+-------------+--------+------+------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode |
+-----------+-----------------+-------------+--------+------+------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |
+-----------+-----------------+-------------+--------+------+------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> alter table produk add harga_jual int;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> SElect * FROM produk;
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |       NULL |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |       NULL |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |       NULL |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |       NULL |
+-----------+-----------------+-------------+--------+------+------+------------+
4 rows in set (0.001 sec)

MariaDB [dbtoko1]> insert into produk (harga_jual) values
    -> (550000),
    -> (350000),
    -> (10000000),
    -> (900000);
Query OK, 4 rows affected, 2 warnings (0.001 sec)
Records: 4  Duplicates: 0  Warnings: 2

MariaDB [dbtoko1]> SElect * FROM produk;
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |       NULL |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |       NULL |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |       NULL |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |       NULL |
|         5 |                 |        NULL |   NULL |    0 | NULL |     550000 |
|         6 |                 |        NULL |   NULL |    0 | NULL |     350000 |
|         7 |                 |        NULL |   NULL |    0 | NULL |   10000000 |
|         8 |                 |        NULL |   NULL |    0 | NULL |     900000 |
+-----------+-----------------+-------------+--------+------+------+------------+
8 rows in set (0.000 sec)

MariaDB [dbtoko1]> Alter table produk drop harga_jual;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> Select * From produk;
+-----------+-----------------+-------------+--------+------+------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode |
+-----------+-----------------+-------------+--------+------+------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |
|         5 |                 |        NULL |   NULL |    0 | NULL |
|         6 |                 |        NULL |   NULL |    0 | NULL |
|         7 |                 |        NULL |   NULL |    0 | NULL |
|         8 |                 |        NULL |   NULL |    0 | NULL |
+-----------+-----------------+-------------+--------+------+------+
8 rows in set (0.000 sec)

MariaDB [dbtoko1]> Delete From produk Where id_produk=5;
Query OK, 1 row affected (0.002 sec)

MariaDB [dbtoko1]> Select * From produk;
+-----------+-----------------+-------------+--------+------+------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode |
+-----------+-----------------+-------------+--------+------+------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |
|         6 |                 |        NULL |   NULL |    0 | NULL |
|         7 |                 |        NULL |   NULL |    0 | NULL |
|         8 |                 |        NULL |   NULL |    0 | NULL |
+-----------+-----------------+-------------+--------+------+------+
7 rows in set (0.000 sec)

MariaDB [dbtoko1]> Delete From produk Where id_produk=6;
Query OK, 1 row affected (0.001 sec)

MariaDB [dbtoko1]> Delete From produk Where id_produk=7;
Query OK, 1 row affected (0.001 sec)

MariaDB [dbtoko1]> Delete From produk Where id_produk=8;
Query OK, 1 row affected (0.001 sec)

MariaDB [dbtoko1]> Select * From produk;
+-----------+-----------------+-------------+--------+------+------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode |
+-----------+-----------------+-------------+--------+------+------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |
+-----------+-----------------+-------------+--------+------+------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> alter table produk add harga_jual int;
Query OK, 0 rows affected (0.007 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> Select * From produk;
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |       NULL |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |       NULL |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |       NULL |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |       NULL |
+-----------+-----------------+-------------+--------+------+------+------------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> update produk set harga_jual = 550000 where id_produk=1;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko1]> Select * From produk;
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |     550000 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |       NULL |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |       NULL |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |       NULL |
+-----------+-----------------+-------------+--------+------+------+------------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> update produk set harga_jual = 350000 where id_produk=2;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko1]> update produk set harga_jual = 10000000 where id_produk=3;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko1]> update produk set harga_jual = 950000 where id_produk=4;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko1]> Select * From produk;
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |     550000 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |     350000 |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |   10000000 |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |     950000 |
+-----------+-----------------+-------------+--------+------+------+------------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> desc jenis_produk;
+-------+-------------+------+-----+---------+----------------+
| Field | Type        | Null | Key | Default | Extra          |
+-------+-------------+------+-----+---------+----------------+
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nama  | varchar(45) | YES  |     | NULL    |                |
| ket   | varchar(30) | YES  |     | NULL    |                |
+-------+-------------+------+-----+---------+----------------+
3 rows in set (0.007 sec)

MariaDB [dbtoko1]> Insert into jenis_produk(nama,ket) values
    -> ('bantal','tersedia'),
    -> ('guling','tersedia'),
    -> ('kasur','tersedia'),
    -> ('selimut','tidak tersedia');
Query OK, 4 rows affected (0.002 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> SELECT * from jenis_produk;
+----+---------+----------------+
| id | nama    | ket            |
+----+---------+----------------+
|  1 | bantal  | tersedia       |
|  2 | guling  | tersedia       |
|  3 | kasur   | tersedia       |
|  4 | selimut | tidak tersedia |
+----+---------+----------------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]>