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

