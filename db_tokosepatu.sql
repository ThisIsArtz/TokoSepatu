/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - tokosepatudb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tokosepatudb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tokosepatudb`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_barang` text NOT NULL,
  `merk` varchar(255) NOT NULL,
  `harga_beli` varchar(255) NOT NULL,
  `harga_jual` varchar(255) NOT NULL,
  `satuan_barang` varchar(255) NOT NULL,
  `stok` text NOT NULL,
  `tgl_input` varchar(255) NOT NULL,
  `tgl_update` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `barang` */

LOCK TABLES `barang` WRITE;

insert  into `barang`(`id`,`id_barang`,`id_kategori`,`nama_barang`,`merk`,`harga_beli`,`harga_jual`,`satuan_barang`,`stok`,`tgl_input`,`tgl_update`) values 
(1,'BR001',1,'Pensil','Fabel Castel','1500','3000','PCS','98','6 October 2020, 0:41',NULL),
(2,'BR002',5,'Sabun','Lifeboy','1800','3000','PCS','38','6 October 2020, 0:41','6 October 2020, 0:54'),
(3,'BR003',1,'Pulpen','Standard','1500','2000','PCS','70','6 October 2020, 1:34',NULL);

UNLOCK TABLES;

/*Table structure for table `detailpesanan` */

DROP TABLE IF EXISTS `detailpesanan`;

CREATE TABLE `detailpesanan` (
  `DetailPesananID` int(11) NOT NULL AUTO_INCREMENT,
  `PesananID` int(11) NOT NULL,
  `ProdukID` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL CHECK (`Jumlah` > 0),
  `HargaSatuan` decimal(10,2) NOT NULL,
  PRIMARY KEY (`DetailPesananID`),
  KEY `FK_PesananID` (`PesananID`),
  KEY `FK_ProdukID` (`ProdukID`),
  CONSTRAINT `FK_PesananID` FOREIGN KEY (`PesananID`) REFERENCES `pesanan` (`PesananID`),
  CONSTRAINT `FK_ProdukID` FOREIGN KEY (`ProdukID`) REFERENCES `produk` (`ProdukID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detailpesanan` */

LOCK TABLES `detailpesanan` WRITE;

insert  into `detailpesanan`(`DetailPesananID`,`PesananID`,`ProdukID`,`Jumlah`,`HargaSatuan`) values 
(1,1,1,2,1200000.00),
(2,1,2,4,900000.00),
(3,2,2,2,900000.00),
(4,1,1,2,1200000.00),
(5,1,2,4,900000.00),
(6,2,2,2,900000.00);

UNLOCK TABLES;

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(255) NOT NULL,
  `tgl_input` varchar(255) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `kategori` */

LOCK TABLES `kategori` WRITE;

insert  into `kategori`(`id_kategori`,`nama_kategori`,`tgl_input`) values 
(1,'ATK','7 May 2017, 10:23'),
(5,'Sabun','7 May 2017, 10:28'),
(6,'Snack','6 October 2020, 0:19'),
(7,'Minuman','6 October 2020, 0:20');

UNLOCK TABLES;

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `pass` char(32) NOT NULL,
  `id_member` int(11) NOT NULL,
  PRIMARY KEY (`id_login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `login` */

LOCK TABLES `login` WRITE;

insert  into `login`(`id_login`,`user`,`pass`,`id_member`) values 
(1,'admin','202cb962ac59075b964b07152d234b70',1);

UNLOCK TABLES;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL AUTO_INCREMENT,
  `nm_member` varchar(255) NOT NULL,
  `alamat_member` text NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gambar` text NOT NULL,
  `NIK` text NOT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `member` */

LOCK TABLES `member` WRITE;

insert  into `member`(`id_member`,`nm_member`,`alamat_member`,`telepon`,`email`,`gambar`,`NIK`) values 
(1,'Fauzan Falah','uj harapan','081234567890','example@gmail.com','unnamed.jpg','12314121');

UNLOCK TABLES;

/*Table structure for table `nota` */

DROP TABLE IF EXISTS `nota`;

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL,
  `periode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `nota` */

LOCK TABLES `nota` WRITE;

UNLOCK TABLES;

/*Table structure for table `pelanggan` */

DROP TABLE IF EXISTS `pelanggan`;

CREATE TABLE `pelanggan` (
  `PelangganID` int(11) NOT NULL AUTO_INCREMENT,
  `NamaDepan` varchar(50) NOT NULL,
  `NamaBelakang` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telepon` varchar(20) NOT NULL,
  PRIMARY KEY (`PelangganID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pelanggan` */

LOCK TABLES `pelanggan` WRITE;

insert  into `pelanggan`(`PelangganID`,`NamaDepan`,`NamaBelakang`,`Email`,`Telepon`) values 
(1,'John','Doe','john.doe@example.com','08123456789'),
(2,'Jane','Smith','jane.smith@example.com','08567890123');

UNLOCK TABLES;

/*Table structure for table `penjualan` */

DROP TABLE IF EXISTS `penjualan`;

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL,
  PRIMARY KEY (`id_penjualan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `penjualan` */

LOCK TABLES `penjualan` WRITE;

UNLOCK TABLES;

/*Table structure for table `pesanan` */

DROP TABLE IF EXISTS `pesanan`;

CREATE TABLE `pesanan` (
  `PesananID` int(11) NOT NULL AUTO_INCREMENT,
  `PelangganID` int(11) NOT NULL,
  `TanggalPesanan` datetime NOT NULL,
  `TotalHarga` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PesananID`),
  KEY `FK_PelangganID` (`PelangganID`),
  KEY `idx_tanggal_pesanan` (`TanggalPesanan`),
  CONSTRAINT `FK_PelangganID` FOREIGN KEY (`PelangganID`) REFERENCES `pelanggan` (`PelangganID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pesanan` */

LOCK TABLES `pesanan` WRITE;

insert  into `pesanan`(`PesananID`,`PelangganID`,`TanggalPesanan`,`TotalHarga`) values 
(1,1,'2024-06-25 00:43:59',2400000.00),
(2,2,'2024-06-25 00:43:59',1800000.00),
(3,1,'2024-06-25 00:46:55',2400000.00),
(4,2,'2024-06-25 00:46:55',1800000.00);

UNLOCK TABLES;

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `ProdukID` int(11) NOT NULL AUTO_INCREMENT,
  `NamaProduk` varchar(100) NOT NULL,
  `Merek` varchar(50) NOT NULL,
  `Ukuran` int(11) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL CHECK (`Stok` >= 0),
  PRIMARY KEY (`ProdukID`),
  KEY `idx_nama_produk` (`NamaProduk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `produk` */

LOCK TABLES `produk` WRITE;

insert  into `produk`(`ProdukID`,`NamaProduk`,`Merek`,`Ukuran`,`Harga`,`Stok`) values 
(1,'Sepatu Lari Nike Air Zoom','Nike',42,1200000.00,46),
(2,'Sepatu Sneakers Adidas Superstar','Adidas',40,900000.00,18),
(3,'Sepatu Lari Nike Air Zoom','Nike',42,1200000.00,50),
(4,'Sepatu Sneakers Adidas Superstar','Adidas',40,900000.00,30);

UNLOCK TABLES;

/*Table structure for table `toko` */

DROP TABLE IF EXISTS `toko`;

CREATE TABLE `toko` (
  `id_toko` int(11) NOT NULL AUTO_INCREMENT,
  `nama_toko` varchar(255) NOT NULL,
  `alamat_toko` text NOT NULL,
  `tlp` varchar(255) NOT NULL,
  `nama_pemilik` varchar(255) NOT NULL,
  PRIMARY KEY (`id_toko`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `toko` */

LOCK TABLES `toko` WRITE;

insert  into `toko`(`id_toko`,`nama_toko`,`alamat_toko`,`tlp`,`nama_pemilik`) values 
(1,'CV Daruttaqwa','Ujung Harapan','081234567890','Fauzan Falah');

UNLOCK TABLES;

/* Trigger structure for table `detailpesanan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `UpdateStok` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `UpdateStok` AFTER INSERT ON `detailpesanan` FOR EACH ROW 
BEGIN
    -- Deklarasi variabel untuk menyimpan stok produk yang akan diupdate
    DECLARE stok_produk INT;
    
    -- Ambil stok produk sebelum diupdate
    SELECT Stok INTO stok_produk
    FROM Produk
    WHERE ProdukID = NEW.ProdukID;
    
    -- Update stok produk
    UPDATE Produk
    SET Stok = stok_produk - NEW.Jumlah
    WHERE ProdukID = NEW.ProdukID;
END */$$


DELIMITER ;

/*Table structure for table `ringkasanpesanan` */

DROP TABLE IF EXISTS `ringkasanpesanan`;

/*!50001 DROP VIEW IF EXISTS `ringkasanpesanan` */;
/*!50001 DROP TABLE IF EXISTS `ringkasanpesanan` */;

/*!50001 CREATE TABLE  `ringkasanpesanan`(
 `PesananID` int(11) ,
 `TanggalPesanan` datetime ,
 `NamaDepan` varchar(50) ,
 `NamaBelakang` varchar(50) ,
 `Email` varchar(100) ,
 `NamaProduk` varchar(100) ,
 `Jumlah` int(11) ,
 `HargaSatuan` decimal(10,2) ,
 `TotalHarga` decimal(20,2) 
)*/;

/*View structure for view ringkasanpesanan */

/*!50001 DROP TABLE IF EXISTS `ringkasanpesanan` */;
/*!50001 DROP VIEW IF EXISTS `ringkasanpesanan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ringkasanpesanan` AS select `p`.`PesananID` AS `PesananID`,`p`.`TanggalPesanan` AS `TanggalPesanan`,`pl`.`NamaDepan` AS `NamaDepan`,`pl`.`NamaBelakang` AS `NamaBelakang`,`pl`.`Email` AS `Email`,`pr`.`NamaProduk` AS `NamaProduk`,`dp`.`Jumlah` AS `Jumlah`,`dp`.`HargaSatuan` AS `HargaSatuan`,`dp`.`Jumlah` * `dp`.`HargaSatuan` AS `TotalHarga` from (((`pesanan` `p` join `pelanggan` `pl` on(`p`.`PelangganID` = `pl`.`PelangganID`)) join `detailpesanan` `dp` on(`p`.`PesananID` = `dp`.`PesananID`)) join `produk` `pr` on(`dp`.`ProdukID` = `pr`.`ProdukID`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
