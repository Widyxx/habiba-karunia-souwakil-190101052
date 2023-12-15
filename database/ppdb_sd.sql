-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 15 Jan 2023 pada 13.42
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppdb_sd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrasi`
--

CREATE TABLE `administrasi` (
  `id_administrasi` int(11) NOT NULL,
  `id_identitas_siswa` int(11) NOT NULL,
  `harga` int(16) NOT NULL,
  `status` enum('Lunas','Belum Lunas') NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `administrasi`
--

INSERT INTO `administrasi` (`id_administrasi`, `id_identitas_siswa`, `harga`, `status`, `tgl_buat`, `tgl_ubah`) VALUES
(6, 5, 200000, 'Lunas', '2022-03-19 14:03:20', '2022-03-19 13:05:20'),
(7, 6, 150000, 'Lunas', '2022-03-21 17:20:52', '2022-03-21 16:21:31'),
(8, 7, 50000, 'Lunas', '2022-12-13 04:24:43', '2022-12-13 03:24:43'),
(9, 8, 100000, 'Lunas', '2022-12-13 04:44:34', '2022-12-13 03:44:34');

--
-- Trigger `administrasi`
--
DELIMITER $$
CREATE TRIGGER `HapusAdministrasi` AFTER DELETE ON `administrasi` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_administrasi = 0 
  WHERE Id_Identitas_Siswa = OLD.id_identitas_siswa; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TambahAdministrasi` AFTER INSERT ON `administrasi` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_administrasi = 1 
  WHERE Id_Identitas_Siswa = NEW.id_identitas_siswa;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas_siswa`
--

CREATE TABLE `identitas_siswa` (
  `Id_Identitas_Siswa` int(11) NOT NULL,
  `NISN` varchar(15) NOT NULL,
  `No_KK` varchar(20) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `Nama_Panggilan` text NOT NULL,
  `Nama_Peserta_Didik` text NOT NULL,
  `Tempat_Lahir` varchar(30) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `Agama` varchar(9) NOT NULL,
  `Gol_Darah` varchar(5) NOT NULL,
  `Tinggi_Badan` varchar(4) NOT NULL,
  `Berat_Badan` varchar(3) NOT NULL,
  `Suku` varchar(10) NOT NULL,
  `Bahasa` varchar(12) NOT NULL,
  `Kewarganegaraan` varchar(10) NOT NULL,
  `Status_Anak` varchar(12) NOT NULL,
  `Anak_Ke` int(2) NOT NULL,
  `Jml_Saudara` int(2) NOT NULL,
  `Jenis_Tinggal` varchar(17) NOT NULL,
  `Alamat_Tinggal` text NOT NULL,
  `Provinsi_Tinggal` varchar(30) NOT NULL,
  `Kab_Kota_Tinggal` varchar(30) NOT NULL,
  `Kec_Tinggal` varchar(30) NOT NULL,
  `Kelurahan_Tinggal` varchar(30) NOT NULL,
  `Kode_POS` varchar(6) NOT NULL,
  `Jarak_Ke_Sekolah` varchar(5) NOT NULL,
  `Riwayat_Penyakit` text NOT NULL,
  `status_ortu` tinyint(1) NOT NULL,
  `status_administrasi` tinyint(1) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `identitas_siswa`
--

INSERT INTO `identitas_siswa` (`Id_Identitas_Siswa`, `NISN`, `No_KK`, `NIK`, `Nama_Panggilan`, `Nama_Peserta_Didik`, `Tempat_Lahir`, `Tanggal_Lahir`, `Jenis_Kelamin`, `Agama`, `Gol_Darah`, `Tinggi_Badan`, `Berat_Badan`, `Suku`, `Bahasa`, `Kewarganegaraan`, `Status_Anak`, `Anak_Ke`, `Jml_Saudara`, `Jenis_Tinggal`, `Alamat_Tinggal`, `Provinsi_Tinggal`, `Kab_Kota_Tinggal`, `Kec_Tinggal`, `Kelurahan_Tinggal`, `Kode_POS`, `Jarak_Ke_Sekolah`, `Riwayat_Penyakit`, `status_ortu`, `status_administrasi`, `tgl_buat`, `tgl_ubah`) VALUES
(1, '0001999901', '0001999901666444', '0001999901666444', 'Agung', 'Agung Dermawan', 'Jember', '2014-11-14', 'Laki-Laki', 'Islam', 'A', '108', '28', 'Jawa', 'Indonesia', 'Indonesia', 'Jawa', 2, 3, 'Kontrak', 'Jl. Dr. Soebandi Gg. Kenitu', 'Jawa Timur', 'Jember', 'Wuluhan', 'Wuluhan', '68119', '1', 'Tidak Ada', 1, 0, '0000-00-00 00:00:00', '2022-12-13 03:07:34'),
(3, '0131293812', '9071230127301273', '1237102370127309', 'Jonatan', 'Jonatan Zilguin', 'Jember', '2013-08-26', 'Laki-Laki', 'Islam', 'B', '120', '30', 'Jawa', 'Indonesia', 'Indonesia', 'Jawa', 2, 5, 'Kontrak', 'Jember Lor 2', 'Jawa Timur', 'Jember', 'Wuluhan', 'Wuluhan', '68118', '2', 'Tidak Ada', 1, 0, '0000-00-00 00:00:00', '2020-09-18 08:16:05'),
(4, '0120981371', '9012730126301273', '9263017230127390', 'Iskandar', 'Iskandar Muda', 'Jember', '2011-09-08', 'Laki-Laki', 'Islam', 'B', '120', '30', 'Jawa', 'Indonesia', 'Indonesia', 'Jawa', 2, 3, 'Kontrak', 'Jember', 'Jawa Timur', 'Jember', 'Wuluhan', 'Wuluhan', '68115', '1', 'Tidak Ada', 0, 0, '2020-09-18 10:53:33', '2020-09-18 08:53:33'),
(5, '1234567813', '1491269816589165', '1984986126591659', 'cindy', 'cindy', 'padang', '2018-07-19', 'Perempuan', 'islam', 'o', '145', '35', 'minang', 'indonesia', 'indonesia', 'minang', 3, 3, 'padang', 'padang', 'sumbar', 'padang', 'kuranci', 'parak karakah', '28593', '10', 'sakit saku saku', 1, 1, '2022-03-19 13:55:29', '2022-03-19 13:03:20'),
(6, '1601020303', '1050912759017571', '0158017501577151', 'lala', 'naila', 'padang', '2022-03-16', 'Perempuan', 'islam', 'o', '160', '50', 'minang', 'indonesia', 'indonesia', 'minang', 2, 3, 'padang', 'padang', 'sumbar', 'Padang', 'kuranci', 'parak karakah', '25563', '100', 'no', 1, 1, '2022-03-21 17:17:53', '2022-03-21 16:20:52'),
(7, '1234567899', '1234567899945363', '1234567354263626', 'salsa', 'salsa', 'kambang', '2022-12-01', 'Perempuan', 'islam', '-', '150', '45', 'minang', 'indonesia', 'Indonesia', 'minang', 1, 3, 'rumah', 'kambang', 'sumbar', 'pesisir selatan', 'lengayang', 'kambang utara', '25663', '100', '-', 0, 1, '2022-12-13 04:21:56', '2022-12-13 03:24:43'),
(8, '1312451526', '1094190501577015', '1523612636137371', 'RAFI', 'RAFI AHMAD', 'KAMBANG', '2022-12-02', 'Laki-Laki', 'islam', '-', '155', '40', 'CHANIAGO', 'indonesia', 'INDONESIA', 'CHANIAGO', 1, 3, 'RUMAH', 'KAMBANG', 'SUMATERA BARAT', 'PESISIR SELATAN', 'LENGAYANG', 'KAMBANG UTARA', '25663', '200', '-', 1, 1, '2022-12-13 04:42:42', '2022-12-13 03:52:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orang_tua_wali`
--

CREATE TABLE `orang_tua_wali` (
  `Id_Orang_Tua_Wali` int(11) NOT NULL,
  `Id_Identitas_Siswa` int(11) NOT NULL,
  `Nama_Ayah` varchar(30) NOT NULL,
  `Status_Ayah` varchar(10) NOT NULL,
  `Tgl_Lahir_Ayah` date NOT NULL,
  `Telepon_Ayah` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Ayah` varchar(20) NOT NULL,
  `Pekerjaan_Ayah` varchar(30) NOT NULL,
  `Penghasilan_Ayah` varchar(10) NOT NULL,
  `Alamat_Ayah` varchar(165) NOT NULL,
  `Nama_Ibu` varchar(30) NOT NULL,
  `Status_Ibu` varchar(10) NOT NULL,
  `Tgl_Lahir_Ibu` date NOT NULL,
  `Telepon_Ibu` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Ibu` varchar(20) NOT NULL,
  `Pekerjaan_Ibu` varchar(30) NOT NULL,
  `Penghasilan_Ibu` varchar(10) NOT NULL,
  `Alamat_Ibu` varchar(165) NOT NULL,
  `Nama_Wali` varchar(30) NOT NULL,
  `Status_Wali` varchar(10) NOT NULL,
  `Tgl_Lahir_Wali` date NOT NULL,
  `Telepon_Wali` varchar(14) NOT NULL,
  `Pendidikan_Terakhir_Wali` varchar(20) NOT NULL,
  `Pekerjaan_Wali` varchar(30) NOT NULL,
  `Penghasilan_Wali` varchar(10) NOT NULL,
  `Alamat_Wali` varchar(165) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orang_tua_wali`
--

INSERT INTO `orang_tua_wali` (`Id_Orang_Tua_Wali`, `Id_Identitas_Siswa`, `Nama_Ayah`, `Status_Ayah`, `Tgl_Lahir_Ayah`, `Telepon_Ayah`, `Pendidikan_Terakhir_Ayah`, `Pekerjaan_Ayah`, `Penghasilan_Ayah`, `Alamat_Ayah`, `Nama_Ibu`, `Status_Ibu`, `Tgl_Lahir_Ibu`, `Telepon_Ibu`, `Pendidikan_Terakhir_Ibu`, `Pekerjaan_Ibu`, `Penghasilan_Ibu`, `Alamat_Ibu`, `Nama_Wali`, `Status_Wali`, `Tgl_Lahir_Wali`, `Telepon_Wali`, `Pendidikan_Terakhir_Wali`, `Pekerjaan_Wali`, `Penghasilan_Wali`, `Alamat_Wali`, `tgl_buat`, `tgl_ubah`) VALUES
(1, 1, 'Dedi Sunarto', 'Kandung', '1988-08-30', '089623492347', 'SMA', 'Teknisi', '1991-05-05', 'JL. Tempanyung', 'Dewi Setia', 'Kandung', '1991-10-13', '082323231231', 'SMA', 'Ibu Rumah Tangga', '1992-12-06', 'Jl. Semeru ', 'Ferdi Wicaksono', 'Tiri', '1989-03-20', '085212312368', 'Kuliah', 'Wasit', '1989-10-08', 'Jl. Butang', '2020-09-17 04:54:57', '2020-09-17 02:54:57'),
(3, 3, 'Hendro Siswanto', 'Kandung', '1992-06-29', '087197123877', 'SMA', 'Supir', '2000000', 'Jl Dr. Hari', 'Gigi Susanti', 'Kandung', '1993-04-20', '08786868690', 'SMA', 'Ibu Rumah Tangga', '0', 'Jl. Sirsat', 'Bejo Santoso', 'Tiri', '2008-04-19', '0890123876', 'Kuliah', 'HRD', '8000000', 'Jl. semeru', '0000-00-00 00:00:00', '2020-09-18 08:31:12'),
(4, 5, 'ahmad', 'kandung', '2003-05-19', '082147583953', 'd3', 'tani', '3000000', 'padang', 'andin', 'kandung', '2004-10-19', '0832174833', 's1', 'kandung', '3000000', 'padang', 'andi', 'kandung', '2003-11-19', '082175849395', 'sma', 'tani', '2000000', 'padang', '2022-03-19 13:59:06', '2022-03-19 12:59:06'),
(5, 6, 'amar', 'kandung', '2022-03-14', '098347513242', 'd3', 'tani', '100000', 'painan', 'ani', 'kandung', '2022-03-24', '0801285091275', 's1', 'kandung', '1000000', 'padang', 'andi', 'kandung', '2022-03-22', '10483257092175', 'sma', 'tani', '10000000', 'padang', '2022-03-21 17:19:40', '2022-03-21 16:19:40'),
(6, 8, 'TEUKU', 'KANDUNG', '1999-04-13', '0812858475843', 'S1', 'PEGAWAI SWASTA', '3000000', 'KAMBANG', 'LIZA', 'KANDUNG', '2000-12-16', '081385947586', 'S1', 'RUMAH TANGGA', '1000000', 'KAMBANG', 'AHMAD', 'PAMAN', '1998-12-17', '081258476848', 'SMA', 'PETANI', '3000000', 'KAMBANG', '2022-12-13 04:52:38', '2022-12-13 03:52:38');

--
-- Trigger `orang_tua_wali`
--
DELIMITER $$
CREATE TRIGGER `HapusOrangTuaWali` AFTER DELETE ON `orang_tua_wali` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_ortu = 0 
  WHERE Id_Identitas_Siswa = OLD.Id_Identitas_Siswa;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TambahOrangTuaWali` AFTER INSERT ON `orang_tua_wali` FOR EACH ROW BEGIN
  UPDATE identitas_siswa SET status_ortu = 1 
  WHERE Id_Identitas_Siswa = NEW.Id_Identitas_Siswa;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` char(45) NOT NULL,
  `username` char(65) NOT NULL,
  `password` char(125) NOT NULL,
  `hak` enum('admin','pegawai') NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_ubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `hak`, `status`, `tgl_buat`, `tgl_ubah`) VALUES
(6, 'Admin PPDB', 'admin', 'admin', 'admin', 'aktif', '2020-09-16 18:32:57', '2022-05-16 03:51:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrasi`
--
ALTER TABLE `administrasi`
  ADD PRIMARY KEY (`id_administrasi`),
  ADD KEY `id_identitas_siswa` (`id_identitas_siswa`);

--
-- Indexes for table `identitas_siswa`
--
ALTER TABLE `identitas_siswa`
  ADD PRIMARY KEY (`Id_Identitas_Siswa`),
  ADD UNIQUE KEY `NISN` (`NISN`),
  ADD UNIQUE KEY `NIK` (`NIK`);

--
-- Indexes for table `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  ADD PRIMARY KEY (`Id_Orang_Tua_Wali`),
  ADD KEY `Id_Identitas_Siswa` (`Id_Identitas_Siswa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrasi`
--
ALTER TABLE `administrasi`
  MODIFY `id_administrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `identitas_siswa`
--
ALTER TABLE `identitas_siswa`
  MODIFY `Id_Identitas_Siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  MODIFY `Id_Orang_Tua_Wali` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `administrasi`
--
ALTER TABLE `administrasi`
  ADD CONSTRAINT `administrasi_ibfk_1` FOREIGN KEY (`id_identitas_siswa`) REFERENCES `identitas_siswa` (`Id_Identitas_Siswa`);

--
-- Ketidakleluasaan untuk tabel `orang_tua_wali`
--
ALTER TABLE `orang_tua_wali`
  ADD CONSTRAINT `orang_tua_wali_ibfk_1` FOREIGN KEY (`Id_Identitas_Siswa`) REFERENCES `identitas_siswa` (`Id_Identitas_Siswa`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
