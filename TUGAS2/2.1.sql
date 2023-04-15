2.1
ariaDB [(none)]> use dbtoko1;
Database changed
MariaDB [dbtoko1]> SElect * from produk order by harga_jual desc;
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |   10000000 |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |     950000 |
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |     550000 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |     350000 |
+-----------+-----------------+-------------+--------+------+------+------------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> SELECT kode,nama,tmp_lahir,tgl_lahir from pelanggan;
+------+-------+-----------+------------+
| kode | nama  | tmp_lahir | tgl_lahir  |
+------+-------+-----------+------------+
| 001  | Dyfa  | Jakarta   | 2001-10-10 |
| 002  | dwina | Bandung   | 2001-05-05 |
| 003  | Ucok  | Bekasi    | 2000-02-02 |
| 004  | syaa  | Banten    | 2002-03-03 |
| 005  | lubis | lampung   | 2000-02-10 |
| 006  | Izza  | Makasar   | 2004-06-12 |
+------+-------+-----------+------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko1]> Select * from pelanggan where tmp_lahir = 'jakarta';
+----+------+------+------+-----------+------------+----------------+----------+---------+
| id | kode | nama | jk   | tmp_lahir | tgl_lahir  | email          | kartu_id | alamat  |
+----+------+------+------+-----------+------------+----------------+----------+---------+
|  1 | 001  | Dyfa | P    | Jakarta   | 2001-10-10 | dyfa@gmail.com |        1 | jl.buah |
+----+------+------+------+-----------+------------+----------------+----------+---------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]> select kode,nama,tmp_lahir,tgl_lahir from pelanggan order by tgl_lahir DESC;
+------+-------+-----------+------------+
| kode | nama  | tmp_lahir | tgl_lahir  |
+------+-------+-----------+------------+
| 006  | Izza  | Makasar   | 2004-06-12 |
| 004  | syaa  | Banten    | 2002-03-03 |
| 001  | Dyfa  | Jakarta   | 2001-10-10 |
| 002  | dwina | Bandung   | 2001-05-05 |
| 005  | lubis | lampung   | 2000-02-10 |
| 003  | Ucok  | Bekasi    | 2000-02-02 |
+------+-------+-----------+------------+
6 rows in set (0.000 sec)

MariaDB [dbtoko1]>