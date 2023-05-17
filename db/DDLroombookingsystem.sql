-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2020 at 07:20 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roombookingsystem`
--
CREATE DATABASE IF NOT EXISTS `roombookingsystem` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `roombookingsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `userID` varchar(10) NOT NULL,
  `NIDN` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `jenisFasilitas` varchar(30) DEFAULT NULL,
  `IDFasilitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_ruangan`
--

CREATE TABLE `fasilitas_ruangan` (
  `IDFasilitas` int(11) NOT NULL,
  `IDRuangan` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `userID` varchar(10) NOT NULL,
  `NIM` varchar(10) DEFAULT NULL,
  `NIDN` varchar(10) DEFAULT NULL,
  `IDInstansi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_ruangan`
--

CREATE TABLE `peminjaman_ruangan` (
  `jamPinjam` time NOT NULL,
  `lamaPinjam` time NOT NULL,
  `jamSelesai` time NOT NULL,
  `keperluan` varchar(350) NOT NULL,
  `tglSelesai` date NOT NULL,
  `tglPinjam` date NOT NULL,
  `persetujuan` varchar(10) NOT NULL,
  `tglPersetujuan` date NOT NULL,
  `userID` varchar(10) NOT NULL,
  `IDRuangan` int(11) NOT NULL,
  `IDPeminjaman` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Instansi`
--

CREATE TABLE `instansi` (
  `kainstansi` varchar(30) NOT NULL,
  `namaInstansi` varchar(20) NOT NULL,
  `IDInstansi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `IDRuangan` int(11) NOT NULL,
  `namaRuangan` varchar(100) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `lantai` int(11) NOT NULL,
  `fotoRuangan` varchar(20) NOT NULL,
  `userID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userruangan`
--

CREATE TABLE `userruangan` (
  `userID` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `noTelp` int(13) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`IDFasilitas`);

--
-- Indexes for table `fasilitas_ruangan`
--
ALTER TABLE `fasilitas_ruangan`
  ADD KEY `fk_IDFasilitasRuangan` (`IDFasilitas`),
  ADD KEY `fk_IDRuanganFasilitas` (`IDRuangan`);

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `fk_IDInstansiPeminjam` (`IDInstansi`);

--
-- Indexes for table `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  ADD PRIMARY KEY (`IDPeminjaman`),
  ADD KEY `fk_userIDpeminjaman` (`userID`),
  ADD KEY `fk_IDRuanganPeminjaman` (`IDRuangan`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`IDInstansi`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`IDRuangan`),
  ADD KEY `fk_userIDRuangan` (`userID`);

--
-- Indexes for table `userruangan`
--
ALTER TABLE `userruangan`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `IDFasilitas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  MODIFY `IDPeminjaman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `IDInstansi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `IDRuangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_userIDAdmin` FOREIGN KEY (`userID`) REFERENCES `userruangan` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fasilitas_ruangan`
--
ALTER TABLE `fasilitas_ruangan`
  ADD CONSTRAINT `fk_IDFasilitasRuangan` FOREIGN KEY (`IDFasilitas`) REFERENCES `fasilitas` (`IDFasilitas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IDRuanganFasilitas` FOREIGN KEY (`IDRuangan`) REFERENCES `ruangan` (`IDRuangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD CONSTRAINT `fk_IDInstansiPeminjam` FOREIGN KEY (`IDInstansi`) REFERENCES `instansi` (`IDInstansi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userIDpeminjam` FOREIGN KEY (`userID`) REFERENCES `userruangan` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  ADD CONSTRAINT `fk_IDRuanganPeminjaman` FOREIGN KEY (`IDRuangan`) REFERENCES `ruangan` (`IDRuangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userIDpeminjaman` FOREIGN KEY (`userID`) REFERENCES `peminjam` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD CONSTRAINT `fk_userIDRuangan` FOREIGN KEY (`userID`) REFERENCES `admin` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
