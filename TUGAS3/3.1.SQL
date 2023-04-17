3.1
1. MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_modal * stok > 200000;
+-----------+-----------------+-------------+--------+------+------+------------+------------+-----------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual | min_produk | jenis_produk_id |
+-----------+-----------------+-------------+--------+------+------+------------+------------+-----------------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |     550000 |          5 |               1 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |     350000 |         10 |               3 |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |   10000000 |         10 |               5 |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |     950000 |         15 |               7 |
+-----------+-----------------+-------------+--------+------+------+------------+------------+-----------------+
4 rows in set (0.000 sec)

2. MariaDB [dbtoko1]> SELECT SUM(stok - min_produk) as selisih from produk;
+---------+
| selisih |
+---------+
|      30 |
+---------+
1 row in set (0.000 sec)

3. MariaDB [dbtoko1]> SELECT sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          70 |
+-------------+

4. MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 2001 AND 2004;
+----+------+-------+------+-----------+------------+-----------------+----------+-------------+
| id | kode | nama  | jk   | tmp_lahir | tgl_lahir  | email           | kartu_id | alamat      |
+----+------+-------+------+-----------+------------+-----------------+----------+-------------+
|  1 | 001  | Dyfa  | P    | Jakarta   | 2001-10-10 | dyfa@gmail.com  |        1 | jl.buah     |
|  2 | 002  | dwina | L    | Bandung   | 2001-05-05 | dwina@gmail.com |        2 | jl.rujak    |
|  4 | 004  | syaa  | P    | Banten    | 2002-03-03 | syaa@gmail.com  |        4 | jl.kalisari |
|  6 | 006  | Izza  | L    | Makasar   | 2004-06-12 | Izza@gmail.com  |        6 | jl.kapuk    |
+----+------+-------+------+-----------+------------+-----------------+----------+-------------+

5. MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=2001;
+----+------+-------+------+-----------+------------+-----------------+----------+----------+
| id | kode | nama  | jk   | tmp_lahir | tgl_lahir  | email           | kartu_id | alamat   |
+----+------+-------+------+-----------+------------+-----------------+----------+----------+
|  1 | 001  | Dyfa  | P    | Jakarta   | 2001-10-10 | dyfa@gmail.com  |        1 | jl.buah  |
|  2 | 002  | dwina | L    | Bandung   | 2001-05-05 | dwina@gmail.com |        2 | jl.rujak |
+----+------+-------+------+-----------+------------+-----------------+----------+----------+
2 rows in set (0.000 sec)

6. MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=10;
+----+------+------+------+-----------+------------+----------------+----------+---------+
| id | kode | nama | jk   | tmp_lahir | tgl_lahir  | email          | kartu_id | alamat  |
+----+------+------+------+-----------+------------+----------------+----------+---------+
|  1 | 001  | Dyfa | P    | Jakarta   | 2001-10-10 | dyfa@gmail.com |        1 | jl.buah |
+----+------+------+------+-----------+------------+----------------+----------+---------+
1 row in set (0.000 sec)

7. MariaDB [dbtoko1]> SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;
+-------+-----------+------------+------+
| nama  | tmp_lahir | tgl_lahir  | umur |
+-------+-----------+------------+------+
| Dyfa  | Jakarta   | 2001-10-10 |   22 |
| dwina | Bandung   | 2001-05-05 |   22 |
| Ucok  | Bekasi    | 2000-02-02 |   23 |
| syaa  | Banten    | 2002-03-03 |   21 |
| lubis | lampung   | 2000-02-10 |   23 |
| Izza  | Makasar   | 2004-06-12 |   19 |
+-------+-----------+------------+------+
