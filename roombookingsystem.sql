-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Feb 2021 pada 03.15
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

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
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `UserID` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`UserID`, `nama`) VALUES
(27, ''),
(28, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `instansi`
--

CREATE TABLE `instansi` (
  `IDInstansi` int(11) NOT NULL,
  `namaInstansi` varchar(100) NOT NULL,
  `kainstansi` varchar(50) NOT NULL,
  `alamat_instansi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `instansi`
--

INSERT INTO `instansi` (`IDInstansi`, `namaInstansi`, `kainstansi`, `alamat_instansi`) VALUES
(1, 'Dinas Komunikasi dan Informatika', '', ''),
(2, 'Dinas Pendidikan', '', ''),
(3, 'Kantor Bupati dan Wakil Bupati', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjam`
--

CREATE TABLE `peminjam` (
  `IDInstansi` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjam`
--

INSERT INTO `peminjam` (`IDInstansi`, `UserID`) VALUES
(1, 33);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_ruangan`
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
-- Dumping data untuk tabel `peminjaman_ruangan`
--

INSERT INTO `peminjaman_ruangan` (`IDPeminjaman`, `jamPinjam`, `jamSelesai`, `lamaPinjam`, `keperluan`, `tglPinjam`, `tglSelesai`, `persetujuan`, `tglPersetujuan`, `UserID`, `IDRuangan`, `tambahan`) VALUES
(16, '12:00:00', '13:30:00', '01:30:00', 'Undangan Video Conference', '2021-02-20', '2021-02-20', 'Disetujui', '2021-02-16 06:53:29', 33, 33, 'Laptop 3 unit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `IDRuangan` int(11) NOT NULL,
  `namaRuangan` varchar(100) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `lantai` int(11) NOT NULL,
  `ket_ruangan` text DEFAULT NULL,
  `fotoRuangan` varchar(40) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`IDRuangan`, `namaRuangan`, `kapasitas`, `lantai`, `ket_ruangan`, `fotoRuangan`, `UserID`) VALUES
(33, 'Command Center', 100, 1, NULL, 'Auditorium.jpg', 27),
(34, 'Binapraja', 100, 1, NULL, 'Auditorium.jpg', 27),
(35, 'Ballroom Kantor Wakil Bupati 1', 100, 1, NULL, 'Auditorium.jpg', 27),
(36, 'cc', 100, 1, 'rrfcrf', '', 27);

-- --------------------------------------------------------

--
-- Struktur dari tabel `userruangan`
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
-- Dumping data untuk tabel `userruangan`
--

INSERT INTO `userruangan` (`UserID`, `nama`, `email`, `password`, `alamat`, `role`, `noTelp`, `gender`, `instansi`) VALUES
(27, 'Admin', 'admin@demak.com', '$2y$10$dZ61iRv4Nn0TP3Pc9ppb/u0T2Nkolb3UG9T9PbwfqTeU/e1j2lhKa', 'Demak', 'Admin', '08143256789', 'M', ''),
(28, 'Kadiv', 'opowaex9@gmail.com', '$2y$10$oUYUkCMS/ndUGTKw/JTVBOPPmaY/X302.6J5z66KUC44vkakK1gLO', 'Bekasi', 'Kadiv', '08132456789', 'F', ''),
(33, 'Andi', 'andi@demak.com', '$2y$10$A8fcFc5ivFakcvUy1ZGm5OHwIeBcPRZLxcGC4HxOYropEdRiel5tu', 'Demak', 'OPD', '0813333199', 'M', 'Dinas Komunikasi dan Informatika'),
(34, 'Ima', 'ima@demak.com', '$2y$10$np4orrL/DWApAHFapgeOsOAnUWAhE5o7zqNff4ujaeUa7hhPVZAbC', 'Demak', 'OPD', '08176281192', 'F', 'Kantor Bupati dan Wakil Bupati'),
(35, 'Rizqia', 'rizqia@students.unnes.ac.id', '$2y$10$inKOSGCbWMErJI0wIIiuZOsjE7WXcYoia46fVSxh.tWlGSl/beUVi', 'Demak', 'Umum', '081762766381', 'F', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`UserID`);

--
-- Indeks untuk tabel `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`IDInstansi`);

--
-- Indeks untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `fk_IDProdiPeminjam` (`IDInstansi`);

--
-- Indeks untuk tabel `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  ADD PRIMARY KEY (`IDPeminjaman`),
  ADD KEY `fk_UserIDPeminjamanRuangan` (`UserID`),
  ADD KEY `fk_IDRuanganPeminjaman` (`IDRuangan`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`IDRuangan`),
  ADD KEY `fk_UserIDRuangan` (`UserID`);

--
-- Indeks untuk tabel `userruangan`
--
ALTER TABLE `userruangan`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `instansi`
--
ALTER TABLE `instansi`
  MODIFY `IDInstansi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  MODIFY `IDPeminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `IDRuangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `userruangan`
--
ALTER TABLE `userruangan`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_UserIDAdmin` FOREIGN KEY (`UserID`) REFERENCES `userruangan` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjam`
--
ALTER TABLE `peminjam`
  ADD CONSTRAINT `fk_IDProdiPeminjam` FOREIGN KEY (`IDInstansi`) REFERENCES `instansi` (`IDInstansi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UserIDPeminjam` FOREIGN KEY (`UserID`) REFERENCES `userruangan` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjaman_ruangan`
--
ALTER TABLE `peminjaman_ruangan`
  ADD CONSTRAINT `fk_IDRuanganPeminjaman` FOREIGN KEY (`IDRuangan`) REFERENCES `ruangan` (`IDRuangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD CONSTRAINT `fk_UserIDRuangan` FOREIGN KEY (`UserID`) REFERENCES `admin` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
