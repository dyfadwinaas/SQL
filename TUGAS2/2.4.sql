2.4
MariaDB [dbtoko1]> select * from produk order by harga_modal desc limit 2;
+-----------+----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk    | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+----------------+-------------+--------+------+------+------------+
|         3 | Kasur comforta |     8000000 |     50 |   10 | 1114 |   10000000 |
|         4 | Selimut wuinch |      700000 |    100 |   20 | 1115 |     950000 |
+-----------+----------------+-------------+--------+------+------+------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko1]> select * from produk where harga_jual = (select min(harga_jual) from produk);
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |     350000 |
+-----------+-----------------+-------------+--------+------+------+------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]> select * from produk where stok = (select max(stok) from produk);
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |     350000 |
+-----------+-----------------+-------------+--------+------+------+------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]> select * from produk where stok IN (select min(stok) from produk) ORDER by stok ASC limit 2;
+-----------+----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk    | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+----------------+-------------+--------+------+------+------------+
|         1 | Bantal IKEA    |      300000 |    300 |   10 | 1112 |     550000 |
|         3 | Kasur comforta |     8000000 |     50 |   10 | 1114 |   10000000 |
+-----------+----------------+-------------+--------+------+------+------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko1]> select * from pelanggan order by tgl_lahir desc;
+----+------+-------+------+-----------+------------+-----------------+----------+---------------+
| id | kode | nama  | jk   | tmp_lahir | tgl_lahir  | email           | kartu_id | alamat        |
+----+------+-------+------+-----------+------------+-----------------+----------+---------------+
|  6 | 006  | Izza  | L    | Makasar   | 2004-06-12 | Izza@gmail.com  |        6 | jl.kapuk      |
|  4 | 004  | syaa  | P    | Banten    | 2002-03-03 | syaa@gmail.com  |        4 | jl.kalisari   |
|  1 | 001  | Dyfa  | P    | Jakarta   | 2001-10-10 | dyfa@gmail.com  |        1 | jl.buah       |
|  2 | 002  | dwina | L    | Bandung   | 2001-05-05 | dwina@gmail.com |        2 | jl.rujak      |
|  5 | 005  | lubis | L    | lampung   | 2000-02-10 | Lubis@gmail.com |        5 | jl.albasia    |
|  3 | 003  | Ucok  | L    | Bekasi    | 2000-02-02 | ucok@gmail.com  |        3 | jl.haji salim |
+----+------+-------+------+-----------+------------+-----------------+----------+---------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko1]> select * from pelanggan order by tgl_lahir desc LIMIT 1;
+----+------+------+------+-----------+------------+----------------+----------+----------+
| id | kode | nama | jk   | tmp_lahir | tgl_lahir  | email          | kartu_id | alamat   |
+----+------+------+------+-----------+------------+----------------+----------+----------+
|  6 | 006  | Izza | L    | Makasar   | 2004-06-12 | Izza@gmail.com |        6 | jl.kapuk |
+----+------+------+------+-----------+------------+----------------+----------+----------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]> select * from pelanggan order by tgl_lahir asc LIMIT 1;
+----+------+------+------+-----------+------------+----------------+----------+---------------+
| id | kode | nama | jk   | tmp_lahir | tgl_lahir  | email          | kartu_id | alamat        |
+----+------+------+------+-----------+------------+----------------+----------+---------------+
|  3 | 003  | Ucok | L    | Bekasi    | 2000-02-02 | ucok@gmail.com |        3 | jl.haji salim |
+----+------+------+------+-----------+------------+----------------+----------+---------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]>