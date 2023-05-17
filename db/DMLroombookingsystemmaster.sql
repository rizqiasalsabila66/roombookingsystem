-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2021 at 05:09 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

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

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `NIDN` varchar(10) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`NIDN`, `UserID`, `nama`) VALUES
('1810130100', 27, ''),
('1810130200', 28, '');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `jenisFasilitas` varchar(30) NOT NULL,
  `IDFasilitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`jenisFasilitas`, `IDFasilitas`) VALUES
('AC', 5),
('Seperangkat Komputer', 6),
('LCD Projector', 7),
('Microphone', 8),
('Kursi Kuliah', 9),
('Meja', 10);

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_ruangan`
--

CREATE TABLE `fasilitas_ruangan` (
  `IDFasilRuangan` int(11) NOT NULL,
  `IDFasilitas` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `IDPeminjaman` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `IDInstansi` int(11) NOT NULL,
  `namaInstansi` varchar(100) NOT NULL,
  `kainstansi` varchar(50) NOT NULL,
  `alamat_instansi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`IDInstansi`, `namaInstansi`, `kainstansi`, `alamat_instansi`) VALUES
(1, 'Dinas Komunikasi dan Informatika', '', ''),
(2, 'Dinas Pendidikan', '', ''),
(3, 'Kantor Bupati dan Wakil Bupati', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `NIM` varchar(10) DEFAULT NULL,
  `NIDN` varchar(10) DEFAULT NULL,
  `IDInstansi` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `instansi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_ruangan`
--

CREATE TABLE `peminjaman_ruangan` (
  `IDPeminjaman` int(11) NOT NULL,
  `jamPinjam` time NOT NULL,
  `jamSelesai` time NOT NULL,
  `lamaPinjam` time NOT NULL,
  `keperluan` varchar(350) NOT NULL,
  `tglPinjam` date NOT NULL,
  `tglSelesai` date NOT NULL,
  `persetujuan` varchar(20) NOT NULL DEFAULT 'Belum disetujui',
  `tglPersetujuan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UserID` int(11) DEFAULT NULL,
  `IDRuangan` int(11) DEFAULT NULL,
  `tambahan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman_ruangan`
--

INSERT INTO `peminjaman_ruangan` (`IDPeminjaman`, `jamPinjam`, `jamSelesai`, `lamaPinjam`, `keperluan`, `tglPinjam`, `tglSelesai`, `persetujuan`, `tglPersetujuan`, `UserID`, `IDRuangan`, `tambahan`) VALUES
(14, '04:48:00', '07:48:00', '03:00:00', 'Kelas Tambahan Pemrograman Web', '2020-06-05', '2020-06-05', 'Disetujui', '2020-06-05 03:51:06', 11, 33, '');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `IDRuangan` int(11) NOT NULL,
  `namaRuangan` varchar(100) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `lantai` int(11) NOT NULL,
  `fotoRuangan` varchar(40) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ket_ruangan` varchar(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`IDRuangan`, `namaRuangan`, `kapasitas`, `lantai`, `fotoRuangan`, `UserID`, `ket_ruangan`) VALUES
(33, 'Command Center', 100, 1, 'Auditorium.jpg', 27, ''),
(34, 'Binapraja', 100, 1, 'Auditorium.jpg', 27, ''),
(35, 'Ballroom Kantor Wakil Bupati 1', 100, 1, 'Auditorium.jpg', 27, '');

-- --------------------------------------------------------

--
-- Table structure for table `userruangan`
--

CREATE TABLE `userruangan` (
  `UserID` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `noTelp` varchar(13) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `instansi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userruangan`
--

INSERT INTO `userruangan` (`UserID`, `nama`, `email`, `password`, `alamat`, `role`, `noTelp`, `gender`, `instansi`) VALUES
(27, 'Admin', 'admin@demak.com', '$2y$10$dZ61iRv4Nn0TP3Pc9ppb/u0T2Nkolb3UG9T9PbwfqTeU/e1j2lhKa', 'Demak', 'Admin', '08143256789', 'M', ''),
(28, 'Kadiv', 'opowaex9@gmail.com', '$2y$10$oUYUkCMS/ndUGTKw/JTVBOPPmaY/X302.6J5z66KUC44vkakK1gLO', 'Bekasi', 'Kadiv', '08132456789', 'F', ''),
(33, 'Andi', 'andi@demak.com', '$2y$10$A8fcFc5ivFakcvUy1ZGm5OHwIeBcPRZLxcGC4HxOYropEdRiel5tu', 'Demak', 'OPD', '0813333199', 'M', 'Dinas Komunikasi dan Informatika'),
(34, 'Ima', 'ima@demak.com', '$2y$10$np4orrL/DWApAHFapgeOsOAnUWAhE5o7zqNff4ujaeUa7hhPVZAbC', 'Demak', 'OPD', '08176281192', 'F', 'Kantor'),
(35, 'Rizqia', 'rizqia@students.unnes.ac.id', '$2y$10$inKOSGCbWMErJI0wIIiuZOsjE7WXcYoia46fVSxh.tWlGSl/beUVi', 'Demak', 'Umum', '081762766381', 'F', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`IDFasilitas`);

--
-- Indexes for table `fasilitas_ruangan`
--
ALTER TABLE `fasilitas_ruangan`
  ADD PRIMARY KEY (`IDFasilRuangan`),
  ADD KEY `fk_IDFasilitasRuangan` (`IDFasilitas`),
  ADD KEY `fk_IDPeminjamanFasilitas` (`IDPeminjaman`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`IDInstansi`);

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `fk_IDProdiPeminjam` (`IDInstansi`);

--
-- Indexes for table `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  ADD PRIMARY KEY (`IDPeminjaman`),
  ADD KEY `fk_UserIDPeminjamanRuangan` (`UserID`),
  ADD KEY `fk_IDRuanganPeminjaman` (`IDRuangan`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`IDRuangan`),
  ADD KEY `fk_UserIDRuangan` (`UserID`);

--
-- Indexes for table `userruangan`
--
ALTER TABLE `userruangan`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `IDFasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fasilitas_ruangan`
--
ALTER TABLE `fasilitas_ruangan`
  MODIFY `IDFasilRuangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `IDInstansi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  MODIFY `IDPeminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `IDRuangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `userruangan`
--
ALTER TABLE `userruangan`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_UserIDAdmin` FOREIGN KEY (`UserID`) REFERENCES `userruangan` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fasilitas_ruangan`
--
ALTER TABLE `fasilitas_ruangan`
  ADD CONSTRAINT `fk_IDFasilitasRuangan` FOREIGN KEY (`IDFasilitas`) REFERENCES `fasilitas` (`IDFasilitas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_IDPeminjamanFasilitas` FOREIGN KEY (`IDPeminjaman`) REFERENCES `peminjaman_ruangan` (`IDPeminjaman`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD CONSTRAINT `fk_IDProdiPeminjam` FOREIGN KEY (`IDInstansi`) REFERENCES `instansi` (`IDInstansi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UserIDPeminjam` FOREIGN KEY (`UserID`) REFERENCES `userruangan` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  ADD CONSTRAINT `fk_IDRuanganPeminjaman` FOREIGN KEY (`IDRuangan`) REFERENCES `ruangan` (`IDRuangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD CONSTRAINT `fk_UserIDRuangan` FOREIGN KEY (`UserID`) REFERENCES `admin` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
