

1. MariaDB [dbtoko1]> SELECT COUNT(*) FROM pelanggan WHERE YEAR(tgl_lahir) = 2000;
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.003 sec)


2. MariaDB [dbtoko1]> SELECT COUNT(*) FROM pelanggan WHERE (tmp_lahir) = 'Jakarta';
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.001 sec)

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



3. MariaDB [dbtoko1]> SELECT SUM(stok) FROM produk WHERE harga_jual < 10000000;
+-----------+
| SUM(stok) |
+-----------+
|        60 |
+-----------+
1 row in set (0.001 sec)

MariaDB [dbtoko1]>

4. MariaDB [dbtoko1]> SELECT COUNT(*) FROM produk WHERE nama_produk LIKE 'K%';
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.001 sec)


5. MariaDB [dbtoko1]> SELECT AVG(harga_jual) FROM produk WHERE harga_jual > 1000000;
+-----------------+
| AVG(harga_jual) |
+-----------------+
|   10000000.0000 |
+-----------------+
1 row in set (0.000 sec)


6. MariaDB [dbtoko1]> SELECT COUNT(*) FROM produk WHERE stok < min_produk;
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
1 row in set (0.000 sec)

7. MariaDB [dbtoko1]> SELECT SUM(harga_modal * stok) as total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|   101500000 |
+-------------+
1 row in set (0.000 sec)
