3.4
MariaDB [dbtoko1]> SELECT tmp_lahir, COUNT(*) as total_konsumen,
    -> AVG(umur) as average_umur, MAX(umur) as max_umur, MIN(umur) as min_umur
    -> FROM pelanggan
    -> GROUP BY tmp_lahir;
+-----------+----------------+--------------+----------+----------+
| tmp_lahir | total_konsumen | average_umur | max_umur | min_umur |
+-----------+----------------+--------------+----------+----------+
| Bandung   |              1 |      22.0000 |       22 |       22 |
| Banten    |              1 |      21.0000 |       21 |       21 |
| Bekasi    |              1 |      23.0000 |       23 |       23 |
| Jakarta   |              1 |      22.0000 |       22 |       22 |
| lampung   |              1 |      23.0000 |       23 |       23 |
| Makasar   |              1 |      19.0000 |       19 |       19 |
+-----------+----------------+--------------+----------+----------+

MariaDB [dbtoko1]>  SELECT harga_jual, COUNT(*) as total_produk,
    ->  AVG(harga_jual) as average_harga, MAX(harga_jual) as max_harga, MIN(harga_jual) as min_harga
    -> FROM produk
    -> GROUP BY harga_jual;
+------------+--------------+---------------+-----------+-----------+
| harga_jual | total_produk | average_harga | max_harga | min_harga |
+------------+--------------+---------------+-----------+-----------+
|     350000 |            1 |   350000.0000 |    350000 |    350000 |
|     550000 |            1 |   550000.0000 |    550000 |    550000 |
|     950000 |            1 |   950000.0000 |    950000 |    950000 |
|   10000000 |            1 | 10000000.0000 |  10000000 |  10000000 |
+------------+--------------+---------------+-----------+-----------+

ariaDB [dbtoko1]> SELECT *
    -> FROM pelanggan
    -> WHERE umur < (SELECT AVG(umur) FROM pelanggan);
+----+------+------+------+-----------+------------+----------------+----------+-------------+------+
| id | kode | nama | jk   | tmp_lahir | tgl_lahir  | email          | kartu_id | alamat      | umur |
+----+------+------+------+-----------+------------+----------------+----------+-------------+------+
|  4 | 004  | syaa | P    | Banten    | 2002-03-03 | syaa@gmail.com |        4 | jl.kalisari |   21 |
|  6 | 006  | Izza | L    | Makasar   | 2004-06-12 | Izza@gmail.com |        6 | jl.kapuk    |   19 |
+----+------+------+------+-----------+------------+----------------+----------+-------------+------+

MariaDB [dbtoko1]> SELECT *
    -> FROM produk
    -> WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
+-----------+----------------+-------------+--------+------+------+------------+------------+-----------------+
| id_produk | nama_produk    | harga_modal | jumlah | stok | kode | harga_jual | min_produk | jenis_produk_id |
+-----------+----------------+-------------+--------+------+------+------------+------------+-----------------+
|         3 | Kasur comforta |     8000000 |     50 |   10 | 1114 |   10000000 |         10 |               5 |
+-----------+----------------+-------------+--------+------+------+------------+------------+-----------------+