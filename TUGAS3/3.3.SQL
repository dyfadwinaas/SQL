3.3
MariaDB [dbtoko1]> SELECT id_produk, nama_produk, stok,
    -> case
    -> WHEN stok <= min_produk THEN 'segera belanja'
    -> else 'stok aman'
    -> END as stock_info
    -> from produk;
+-----------+-----------------+------+----------------+
| id_produk | nama_produk     | stok | stock_info     |
+-----------+-----------------+------+----------------+
|         1 | Bantal IKEA     |   10 | stok aman      |
|         2 | Guling Restking |   30 | stok aman      |
|         3 | Kasur comforta  |   10 | segera belanja |
|         4 | Selimut wuinch  |   20 | stok aman      |
+-----------+-----------------+------+----------------+

MariaDB [dbtoko1]> SELECT id, nama, umur,
    -> CASE
    -> WHEN umur < 19 THEN 'muda'
    -> WHEN umur >= 19 AND umur <= 22 THEN 'Dewasa'
    -> ELSE 'TUA'
    -> END as kategory_umur
    -> FROM pelanggan;
+----+-------+------+---------------+
| id | nama  | umur | kategory_umur |
+----+-------+------+---------------+
|  1 | Dyfa  |   22 | Dewasa        |
|  2 | dwina |   22 | Dewasa        |
|  3 | Ucok  |   23 | TUA           |
|  4 | syaa  |   21 | Dewasa        |
|  5 | lubis |   23 | TUA           |
|  6 | Izza  |   19 | Dewasa        |
+----+-------+------+---------------+

MariaDB [dbtoko1]>  SELECT id_produk, kode, nama_produk,
    -> CASE
    -> WHEN kode = '1112' THEN 'Bantal IKEA'
    -> WHEN kode = '1113' THEN 'Guling Restking'
    -> ELSE 'Tidak Ada'
    -> END as bonus
    -> FROM produk;
+-----------+------+-----------------+-----------------+
| id_produk | kode | nama_produk     | bonus           |
+-----------+------+-----------------+-----------------+
|         1 | 1112 | Bantal IKEA     | Bantal IKEA     |
|         2 | 1113 | Guling Restking | Guling Restking |
|         3 | 1114 | Kasur comforta  | Tidak Ada       |
|         4 | 1115 | Selimut wuinch  | Tidak Ada       |
+-----------+------+-----------------+-----------------+