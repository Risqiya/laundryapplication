-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2021 at 08:03 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `loundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangg`
--

CREATE TABLE IF NOT EXISTS `barangg` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `tgl_update` date NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barangg`
--

INSERT INTO `barangg` (`id`, `nama`, `stok`, `tgl_update`, `supplier`, `harga`) VALUES
(1, 'Deterjen Bubuk', 6, '2021-02-16', 'Risqiya', 20000),
(2, 'pewangi', 5, '2021-02-16', 'Dede', 50000),
(3, 'pemutih pakaian', 6, '2021-02-25', 'Erwin', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE IF NOT EXISTS `jenis` (
  `id` int(10) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id`, `jenis`, `harga`) VALUES
(1, 'Paket 1', 20000),
(2, 'Paket 2', 10000),
(3, 'paket 3', 8000);

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE IF NOT EXISTS `konsumen` (
  `id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konsumen`
--

INSERT INTO `konsumen` (`id`, `nama`, `alamat`, `telp`) VALUES
(1, 'Irwansyah', 'Jl. Raya Gununghalu', '082445129182'),
(2, 'Risqiya Ayu Lestari', 'Kp.Pasir Suuk', '083829'),
(17, 'Putri', 'Kp.Lampegan', '083829');

-- --------------------------------------------------------

--
-- Table structure for table `pemakaian`
--

CREATE TABLE IF NOT EXISTS `pemakaian` (
  `id` int(10) NOT NULL,
  `tgl_pakai` date NOT NULL,
  `barang` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemakaian`
--

INSERT INTO `pemakaian` (`id`, `tgl_pakai`, `barang`, `jumlah`) VALUES
(1, '2021-02-11', 'Deterjen Bubuk', 10);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `no` int(10) NOT NULL,
  `tgl` date NOT NULL,
  `totali` int(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `barang` varchar(100) NOT NULL,
  `totalh` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`no`, `tgl`, `totali`, `supplier`, `barang`, `totalh`) VALUES
(1, '2021-02-10', 10, 'Erwin', 'Deterjen Bubuk', 80000),
(2, '2021-02-10', 2, 'Erwin', 'Deterjen Bubuk', 16000),
(5, '2021-02-19', 3, 'Risqiya Ayu Lestari', 'pemutih pakaian', 36000);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `id` int(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('Administrator','Karyawan','Konsumen') NOT NULL,
  `nik` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(20) NOT NULL,
  `gender` enum('Laki laki','Perempuan') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `username`, `password`, `level`, `nik`, `alamat`, `telp`, `gender`) VALUES
(1, 'Khalid Insan Tauhid', 'khalid', '202cb962ac59075b964b07152d234b70', 'Administrator', '123456789', 'Sumedang', '085221445987', 'Laki laki'),
(6, 'Risqiya Ayu Lestari', 'Risqiya', '81dc9bdb52d04dc20036dbd8313ed055', 'Administrator', '12345678', 'Kp.Pasir Suuk', '083829', 'Perempuan'),
(7, 'Yaya', 'Yaya', '827ccb0eea8a706c4c34a16891f84e7b', 'Karyawan', '0112012000', 'Bandung', '083829317522', 'Laki laki');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `alamat`, `telp`) VALUES
(1, 'Erwin', 'Jl. Raya Gununghalu', '08178171123'),
(2, 'Risqiya Ayu Lestari', 'Kp.Pasir Suuk', '083829'),
(3, 'Yaya', 'Bandung', '083829317522');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `id` int(5) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `tarif` int(100) NOT NULL,
  `diskon` int(100) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_ambil` date NOT NULL,
  `berat` int(10) NOT NULL,
  `pengguna` varchar(100) NOT NULL,
  `konsumen` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `jenis`, `tarif`, `diskon`, `tgl_transaksi`, `tgl_ambil`, `berat`, `pengguna`, `konsumen`) VALUES
(1, 'Paket 1', 100000, 0, '2021-02-10', '2021-03-01', 10, 'Risqiya', 'Irwansyah'),
(2, 'Paket 2', 50000, 0, '2021-02-11', '2021-03-03', 10, 'Risqiya', 'Irwansyah'),
(3, 'Paket 1', 180000, 0, '2021-02-11', '2021-03-02', 20, 'Risqiya', 'Irwansyah'),
(4, 'Paket 2', 90000, 0, '2021-02-11', '2021-03-01', 20, 'Risqiya', 'Irwansyah'),
(5, 'Paket 2', 10000, 0, '2021-02-11', '2021-03-11', 1, 'Risqiya', 'Risqiya Ayu Lestari'),
(7, 'Paket 2', 50000, 0, '2009-09-23', '2021-02-05', 5, 'Risqiya', 'Putri');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangg`
--
ALTER TABLE `barangg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemakaian`
--
ALTER TABLE `pemakaian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangg`
--
ALTER TABLE `barangg`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `konsumen`
--
ALTER TABLE `konsumen`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `pemakaian`
--
ALTER TABLE `pemakaian`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `no` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `barangg`
--
ALTER TABLE `barangg`
ADD CONSTRAINT `barangg_ibfk_1` FOREIGN KEY (`id`) REFERENCES `jenis` (`id`);

--
-- Constraints for table `jenis`
--
ALTER TABLE `jenis`
ADD CONSTRAINT `jenis_ibfk_1` FOREIGN KEY (`id`) REFERENCES `transaksi` (`id`);

--
-- Constraints for table `pemakaian`
--
ALTER TABLE `pemakaian`
ADD CONSTRAINT `pemakaian_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pengguna` (`id`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`no`) REFERENCES `transaksi` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
