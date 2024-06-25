# Sistem Toko Sepatu
## Entity Relationship Diagram 
ERD atau entity relationship diagram adalah suatu bagan dalam bentuk gambar atau simbol yang mengidentifikasi tipe dari entitas di dalam suatu sistem yang diuraikan dalam data dengan atributnya, dan menjelaskan hubungan atau relasi di antara entitas tersebut.
![Screenshot 2024-06-24 234711](https://github.com/ThisIsArtz/TokoSepatu/assets/120540979/31ad745d-604a-45f6-9b07-33e3a1ee49b1)

## Relasi

- Pelanggan (Customers):
Attributes: PelangganID (PK), NamaDepan, NamaBelakang, Email, Telepon
Pelanggan memiliki hubungan 1-N dengan Pesanan (satu pelanggan bisa melakukan banyak pesanan).

- Produk (Products):
Attributes: ProdukID (PK), NamaProduk, Merek, Ukuran, Harga, Stok
Tidak ada hubungan langsung dengan entitas lain dalam diagram ini, tetapi Produk terlibat dalam DetailPesanan.

- Pesanan (Orders):
Attributes: PesananID (PK), PelangganID (FK), TanggalPesanan, TotalHarga
Pesanan memiliki hubungan N-1 dengan Pelanggan (banyak pesanan bisa dimiliki oleh satu pelanggan).
Pesanan memiliki hubungan 1-N dengan DetailPesanan (satu pesanan bisa memiliki banyak detail pesanan).

- DetailPesanan (Order Details):
Attributes: DetailPesananID (PK), PesananID (FK), ProdukID (FK), Jumlah, HargaSatuan
DetailPesanan memiliki hubungan N-1 dengan Pesanan (banyak detail pesanan bisa dimiliki oleh satu pesanan).
DetailPesanan memiliki hubungan N-1 dengan Produk (banyak detail pesanan bisa terkait dengan satu produk).

# Deskripsi Project

## Latar Belakang
Dalam industri ritel sepatu yang kompetitif saat ini, efisiensi manajemen inventaris dan pelayanan pelanggan yang baik sangat penting untuk mencapai keberhasilan bisnis. Proyek ini bertujuan untuk mengembangkan sebuah sistem basis data untuk manajemen toko sepatu, yang mencakup manajemen produk, pelanggan, pesanan, dan analisis penjualan.

## Tujuan Project
1. Manajemen Inventaris: Mengotomatisasi dan mempermudah pencatatan stok produk, pembaruan inventaris, dan prediksi kebutuhan persediaan.  
2. Pelayanan Pelanggan: Meningkatkan pengalaman pelanggan melalui sistem manajemen pelanggan yang efisien dan efektif.
3. Analisis Penjualan: Menyediakan data yang akurat dan terstruktur untuk menganalisis tren penjualan, preferensi pelanggan, dan performa produk.
4. Optimalisasi Operasional: Mengurangi kesalahan dalam pencatatan transaksi dan memastikan akurasi dalam proses penjualan dan pembayaran.
   
## Lingkup Project
1. Manajemen Produk: Pencatatan detail produk seperti nama, merek, harga, ukuran, dan stok.
2. Manajemen Pelanggan: Penyimpanan data pelanggan termasuk nama, alamat, nomor telepon, dan riwayat pembelian.
3. Manajemen Pesanan: Pencatatan pesanan pelanggan termasuk detail produk yang dibeli, jumlah, harga, dan status pesanan.
4. Analisis Penjualan: Pengumpulan data untuk analisis penjualan harian, bulanan, dan tahunan untuk memahami tren dan preferensi pelanggan.
5. Manajemen Pembayaran: Pencatatan pembayaran pelanggan termasuk metode pembayaran, tanggal, dan total transaksi.
   
## Spesifikasi Teknis
1. Basis Data: MySQL untuk penyimpanan dan manajemen data. 
2. Bahasa Pemrograman: SQL untuk manipulasi data dan query basis data.
3. Indexing: Implementasi indeks untuk mempercepat pencarian dan query terutama pada tabel-tabel besar seperti Produk dan Pelanggan.
4. View: Penggunaan view untuk menyederhanakan dan mempermudah akses data terkait analisis penjualan dan laporan.
5. Trigger: Penggunaan trigger untuk otomatisasi tugas seperti pembaruan stok produk setelah penjualan.

## Kesimpulan
Proyek ini bertujuan untuk meningkatkan efisiensi operasional dan pelayanan pelanggan dalam sebuah toko sepatu. Dengan menggunakan basis data yang terstruktur dan terorganisir, diharapkan dapat mencapai pengelolaan inventaris yang lebih baik, pelayanan pelanggan yang lebih baik, serta analisis penjualan yang lebih mendalam untuk mendukung keputusan bisnis yang lebih baik di masa depan.

# Skema Basis Data
### Pembuatan Database dan Tabel

```
CREATE DATABASE TokoSepatuDB;

USE TokoSepatuDB;

CREATE TABLE Pelanggan (
    PelangganID INT AUTO_INCREMENT PRIMARY KEY,
    NamaDepan VARCHAR(50) NOT NULL,
    NamaBelakang VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telepon VARCHAR(20) NOT NULL
);

CREATE TABLE Produk (
    ProdukID INT AUTO_INCREMENT PRIMARY KEY,
    NamaProduk VARCHAR(100) NOT NULL,
    Merek VARCHAR(50) NOT NULL,
    Ukuran INT NOT NULL,
    Harga DECIMAL(10, 2) NOT NULL,
    Stok INT NOT NULL CHECK (Stok >= 0)
);

CREATE TABLE Pesanan (
    PesananID INT AUTO_INCREMENT PRIMARY KEY,
    PelangganID INT NOT NULL,
    TanggalPesanan DATETIME NOT NULL,
    TotalHarga DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_PelangganID FOREIGN KEY (PelangganID) REFERENCES Pelanggan(PelangganID)
);

CREATE TABLE DetailPesanan (
    DetailPesananID INT AUTO_INCREMENT PRIMARY KEY,
    PesananID INT NOT NULL,
    ProdukID INT NOT NULL,
    Jumlah INT NOT NULL CHECK (Jumlah > 0),
    HargaSatuan DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_PesananID FOREIGN KEY (PesananID) REFERENCES Pesanan(PesananID),
    CONSTRAINT FK_ProdukID FOREIGN KEY (ProdukID) REFERENCES Produk(ProdukID)
);
```


*Penjelasan :*

- CREATE DATABASE: Membuat basis data baru dengan nama TokoSepatuDB.

- USE TokoSepatuDB: Menggunakan basis data TokoSepatuDB untuk operasi selanjutnya.

- CREATE TABLE: Membuat tabel-tabel utama yang terdiri dari Pelanggan, Produk, Pesanan, dan DetailPesanan dengan struktur yang sudah ditentukan.


  ### View
```
CREATE VIEW RingkasanPesanan AS
SELECT p.PesananID, p.TanggalPesanan, pl.NamaDepan, pl.NamaBelakang, pl.Email, pr.NamaProduk, dp.Jumlah, dp.HargaSatuan, (dp.Jumlah * dp.HargaSatuan) AS TotalHarga
FROM Pesanan p
INNER JOIN Pelanggan pl ON p.PelangganID = pl.PelangganID
INNER JOIN DetailPesanan dp ON p.PesananID = dp.PesananID
INNER JOIN Produk pr ON dp.ProdukID = pr.ProdukID;
```


*Penjelasan :*

- CREATE VIEW: Membuat view bernama RingkasanPesanan yang menyediakan ringkasan pesanan dengan informasi seperti ID pesanan, tanggal pesanan, nama pelanggan, email, nama produk, jumlah barang, harga satuan, dan total harga.


### Insert Data
```
-- Insert data pelanggan
INSERT INTO Pelanggan (NamaDepan, NamaBelakang, Email, Telepon)
VALUES ('John', 'Doe', 'john.doe@example.com', '08123456789');

INSERT INTO Pelanggan (NamaDepan, NamaBelakang, Email, Telepon)
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '08567890123');

-- Insert data produk
INSERT INTO Produk (NamaProduk, Merek, Ukuran, Harga, Stok)
VALUES ('Sepatu Lari Nike Air Zoom', 'Nike', 42, 1200000.00, 50);

INSERT INTO Produk (NamaProduk, Merek, Ukuran, Harga, Stok)
VALUES ('Sepatu Sneakers Adidas Superstar', 'Adidas', 40, 900000.00, 30);

-- Insert data pesanan
INSERT INTO Pesanan (PelangganID, TanggalPesanan, TotalHarga)
VALUES (1, NOW(), 2400000.00); -- Assuming PelangganID 1 is John Doe

INSERT INTO Pesanan (PelangganID, TanggalPesanan, TotalHarga)
VALUES (2, NOW(), 1800000.00); -- Assuming PelangganID 2 is Jane Smith

-- Insert data detail pesanan
INSERT INTO DetailPesanan (PesananID, ProdukID, Jumlah, HargaSatuan)
VALUES (1, 1, 2, 1200000.00); -- PesananID 1 (John Doe) membeli 2 Sepatu Lari Nike Air Zoom

INSERT INTO DetailPesanan (PesananID, ProdukID, Jumlah, HargaSatuan)
VALUES (1, 2, 4, 900000.00); -- PesananID 1 (John Doe) membeli 4 Sepatu Sneakers Adidas Superstar

INSERT INTO DetailPesanan (PesananID, ProdukID, Jumlah, HargaSatuan)
VALUES (2, 2, 2, 900000.00); -- PesananID 2 (Jane Smith) membeli 2 Sepatu Sneakers Adidas Superstar
```

*Penjelasan :*

- INSERT INTO: Memasukkan data ke dalam tabel Pelanggan, Produk, Pesanan, dan DetailPesanan dengan data yang telah disediakan untuk tujuan contoh.

### Operasi Agregat
```
-- Operasi Agregat
SELECT ProdukID, SUM(Jumlah) AS TotalTerjual, SUM(Jumlah * HargaSatuan) AS TotalPendapatan
FROM DetailPesanan
GROUP BY ProdukID;
```

*Penjelasan :*
- SELECT: Melakukan operasi agregat untuk menghitung total barang terjual dan total pendapatan dari setiap produk berdasarkan data yang ada di tabel DetailPesanan.

### Indeks
```
-- Indeks
CREATE INDEX idx_nama_produk ON Produk(NamaProduk);
CREATE INDEX idx_tanggal_pesanan ON Pesanan(TanggalPesanan);
```

*Penjelasan :*

- CREATE INDEX: Membuat indeks pada kolom NamaProduk di tabel Produk dan pada kolom TanggalPesanan di tabel Pesanan. Indeks membantu mempercepat operasi pencarian dan query terkait kolom-kolom yang diindeks.

### Left Join
```
-- Left Join
SELECT pl.PelangganID, pl.NamaDepan, pl.NamaBelakang, p.PesananID, p.TanggalPesanan
FROM Pelanggan pl
LEFT JOIN Pesanan p ON pl.PelangganID = p.PelangganID;
```

*Penjelasan :*

- LEFT JOIN: Menggunakan operasi LEFT JOIN untuk mengambil data pelanggan beserta pesanan yang mereka miliki. Dalam contoh ini, query mengambil semua data dari tabel Pelanggan dan data yang cocok dari tabel Pesanan.


### Inner Join
```
-- Inner Join
SELECT p.PesananID, p.TanggalPesanan, pr.NamaProduk, dp.Jumlah, dp.HargaSatuan
FROM Pesanan p
INNER JOIN DetailPesanan dp ON p.PesananID = dp.PesananID
INNER JOIN Produk pr ON dp.ProdukID = pr.ProdukID;
```

*Penjelasan :*

- INNER JOIN: Menggunakan operasi INNER JOIN untuk mengambil data pesanan, detail pesanan, dan produk yang terkait. INNER JOIN menghasilkan hasil yang hanya mempertahankan baris yang memiliki nilai kunci yang cocok di kedua tabel yang berpartisipasi dalam join.


### Subquery
```
-- Subquery
SELECT ProdukID, NamaProduk
FROM Produk
WHERE ProdukID NOT IN (SELECT DISTINCT ProdukID FROM DetailPesanan);
```

*Penjelasan :*

- Subquery: Subquery digunakan di dalam klausa WHERE untuk mengambil produk yang tidak terdapat dalam tabel DetailPesanan. Subquery SELECT DISTINCT ProdukID FROM DetailPesanan digunakan untuk mendapatkan daftar ProdukID yang terkait dengan setidaknya satu detail pesanan.


### Having
```
-- Having
SELECT ProdukID, SUM(Jumlah) AS TotalTerjual
FROM DetailPesanan
GROUP BY ProdukID
HAVING SUM(Jumlah) > 100;
```

*Penjelasan :*

- HAVING: Digunakan setelah klausa GROUP BY untuk memfilter hasil grup berdasarkan kondisi tertentu. Dalam contoh ini, query mengambil produk yang memiliki jumlah penjualan lebih dari 100.


### Wildcard
```
-- Wildcard
SELECT ProdukID, NamaProduk
FROM Produk
WHERE NamaProduk LIKE '%Sport%';
```

*Penjelasan :*

- Wildcard (%): Digunakan dalam klausa WHERE untuk mencari produk dengan nama yang mengandung kata 'Sport'. % adalah karakter wildcard yang mencocokkan nol atau lebih karakter apa pun.
