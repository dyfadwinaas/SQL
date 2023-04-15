2.3
MariaDB [dbtoko1]> Select* from produk where kode like 'k%' or kode like 'M%';
Empty set (0.000 sec)
MariaDB [dbtoko1]> Select * from PRODUK where left (id_produk,1)<>'M';
+-----------+-----------------+-------------+--------+------+------+------------+
| id_produk | nama_produk     | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-----------------+-------------+--------+------+------+------------+
|         1 | Bantal IKEA     |      300000 |    300 |   10 | 1112 |     550000 |
|         2 | Guling Restking |      150000 |    200 |   30 | 1113 |     350000 |
|         3 | Kasur comforta  |     8000000 |     50 |   10 | 1114 |   10000000 |
|         4 | Selimut wuinch  |      700000 |    100 |   20 | 1115 |     950000 |
+-----------+-----------------+-------------+--------+------+------+------------+
4 rows in set (0.000 sec)

MariaDB [dbtoko1]> Select * from PRODUK WHERE nama_produk = 'bantal';
Empty set (0.000 sec)

MariaDB [dbtoko1]> Select * from PRODUK WHERE nama_produk = 'bantal ikea';
+-----------+-------------+-------------+--------+------+------+------------+
| id_produk | nama_produk | harga_modal | jumlah | stok | kode | harga_jual |
+-----------+-------------+-------------+--------+------+------+------------+
|         1 | Bantal IKEA |      300000 |    300 |   10 | 1112 |     550000 |
+-----------+-------------+-------------+--------+------+------+------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1]> Select * from pelanggan where nama like '%sa%';
Empty set (0.000 sec)

MariaDB [dbtoko1]> Select * from pelanggan where tmp_lahir <> 'jakarta' and nama like '%yo%';
Empty set (0.000 sec)

MariaDB [dbtoko1]> select * from pelanggan where Substr(nama,2,1)='A';
Empty set (0.000 sec)

MariaDB [dbtoko1]>