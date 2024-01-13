-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2024 at 06:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sigereja`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `id_anggota` int(11) NOT NULL,
  `id_kk` int(11) NOT NULL,
  `id_umat` int(11) NOT NULL,
  `hubungan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_anggota`
--

INSERT INTO `tb_anggota` (`id_anggota`, `id_kk`, `id_umat`, `hubungan`) VALUES
(4, 4, 3, 'Istri'),
(5, 3, 4, 'Famili Lain');

-- --------------------------------------------------------

--
-- Table structure for table `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `kategori_berita` varchar(100) NOT NULL,
  `judul_berita` varchar(100) NOT NULL,
  `konten_berita` text NOT NULL,
  `ringkasan_berita` text NOT NULL,
  `tanggal_postingan` date NOT NULL,
  `user_postingan` varchar(20) NOT NULL,
  `gambar_berita` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `kategori_berita`, `judul_berita`, `konten_berita`, `ringkasan_berita`, `tanggal_postingan`, `user_postingan`, `gambar_berita`) VALUES
(1, 'Bahan Pemahaman Alkitab', 'Bulan Kitab Suci', '<p>Test1</p>\r\n', '<p>Hello Word</p>\r\n', '2022-11-17', 'Administrator', 'cara-cepat-hamil-setelah-lepas-kb-suntik-3-bulan-sekali-1602598533.jpg'),
(3, 'Berita Gereja', 'Pastor Paroki', '<p>Gereja St. Karolus Orakeri Ende Memiliki 44 Pastor Paroki</p>\r\n', '<p>Hello Word</p>\r\n', '2022-09-06', 'Administrator', '546092_620.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kegiatan`
--

CREATE TABLE `tb_kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `kategori_kegiatan` varchar(200) NOT NULL,
  `judul_kegiatan` varchar(500) NOT NULL,
  `konten_kegiatan` text NOT NULL,
  `tanggal_postingan` date NOT NULL,
  `user_postingan` varchar(200) NOT NULL,
  `gambar_kegiatan` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kegiatan`
--

INSERT INTO `tb_kegiatan` (`id_kegiatan`, `kategori_kegiatan`, `judul_kegiatan`, `konten_kegiatan`, `tanggal_postingan`, `user_postingan`, `gambar_kegiatan`) VALUES
(1, 'OMK', 'Mari Bersatu Bersama OMK St. Karolus Agung Orakeri Ende', '<p>test kegiatan</p>\r\n', '2022-10-30', 'Administrator', 'team-4.jpg'),
(3, 'Bulan Kitab Suci', 'Mari Membaca Kitab Suci', '<p>Mari Membaca Yohanes 4: 16-17</p>\r\n', '2022-11-10', 'Administrator', 'team-4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kk`
--

CREATE TABLE `tb_kk` (
  `id_kk` int(11) NOT NULL,
  `no_kk` int(16) NOT NULL,
  `kepala_keluarga` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `rt` varchar(200) NOT NULL,
  `rw` varchar(200) NOT NULL,
  `kec` varchar(200) NOT NULL,
  `kab` varchar(200) NOT NULL,
  `prov` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kk`
--

INSERT INTO `tb_kk` (`id_kk`, `no_kk`, `kepala_keluarga`, `alamat`, `rt`, `rw`, `kec`, `kab`, `prov`) VALUES
(3, 2147483647, 'Martinianus Carimu', 'Orakeri 1', '13', '004', 'Nangapanda', 'Ende', 'Nusa Tenggara Timur'),
(4, 2147483647, 'Lambertus Sale', 'Orakeri 1', '13', '004', 'Nangapanda', 'Ende', 'Nusa Tenggara Timur');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kub`
--

CREATE TABLE `tb_kub` (
  `id_kub` int(11) NOT NULL,
  `nama_kub` varchar(200) NOT NULL,
  `id_lingkungan` int(11) NOT NULL,
  `ketua` int(11) NOT NULL,
  `sekretaris` int(11) NOT NULL,
  `bendahara` int(11) NOT NULL,
  `jumlah_kk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kub`
--

INSERT INTO `tb_kub` (`id_kub`, `nama_kub`, `id_lingkungan`, `ketua`, `sekretaris`, `bendahara`, `jumlah_kk`) VALUES
(3, 'KUB Orakeri 1', 1, 2, 1, 7, 30),
(4, 'KUB Orakeri 2', 1, 13, 14, 15, 24),
(5, 'KUB Orakeri 3', 1, 16, 17, 18, 22),
(14, 'KUB STA. Sisilia Marakoja', 4, 39, 40, 41, 32),
(15, 'KUB RPD Puugawa', 4, 54, 55, 56, 14),
(16, 'KUB Puumari', 4, 57, 58, 59, 23),
(19, 'KUB Mbesi 1', 5, 60, 61, 62, 27),
(20, 'KUB Mbesi 2', 5, 63, 64, 65, 19),
(21, 'KUB Tiwe  1', 6, 66, 67, 68, 29),
(22, 'KUB Tiwe 2', 6, 69, 70, 71, 28),
(23, 'KUB Worowona', 6, 72, 73, 74, 17),
(24, 'KUB Santo Mikhael Marakisa', 7, 81, 82, 83, 13),
(25, 'KUB Ratu Pencinta Damai Worofeo', 7, 84, 85, 86, 18),
(26, 'KUB ST. Agustinus Reghu', 8, 90, 91, 92, 27),
(27, 'KUB Bunda Penebus', 8, 93, 94, 95, 21),
(28, 'KUB STA. Maria Malawaru', 9, 99, 100, 101, 31),
(29, 'KUB ST. Yosef Mboaronggo', 9, 102, 103, 104, 26),
(30, 'KUB Bintang Timur Rokambake 1', 10, 108, 107, 110, 14),
(31, 'KUB Bunda Hati Kudus', 10, 111, 112, 113, 29);

-- --------------------------------------------------------

--
-- Table structure for table `tb_lingkungan`
--

CREATE TABLE `tb_lingkungan` (
  `id_lingkungan` int(11) NOT NULL,
  `id_stasi` int(11) NOT NULL,
  `nama_lingkungan` varchar(200) NOT NULL,
  `ketua` varchar(200) NOT NULL,
  `sekretaris` varchar(200) NOT NULL,
  `bendahara` varchar(200) NOT NULL,
  `jumlah_kk` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_lingkungan`
--

INSERT INTO `tb_lingkungan` (`id_lingkungan`, `id_stasi`, `nama_lingkungan`, `ketua`, `sekretaris`, `bendahara`, `jumlah_kk`) VALUES
(1, 1, 'Lingkungan 1 Orakeri', '10', '11', '12', '76'),
(4, 2, 'Lingkungan  1 Marakoja', '51', '52', '53', '69'),
(5, 2, 'Lingkungan II Mbesi', '48', '49', '50', '46'),
(6, 2, 'Lingkungan III Tiwe', '45', '46', '47', '74'),
(7, 3, 'Lingkungan 1 Marakisa', '78', '79', '80', '31'),
(8, 3, 'Lingkungan II Watumite', '87', '88', '89', '48'),
(9, 3, 'Lingkungan III Watumite', '96', '97', '98', '57'),
(10, 3, 'Lingkungan Rokambake', '105', '106', '107', '43');

-- --------------------------------------------------------

--
-- Table structure for table `tb_liturgi`
--

CREATE TABLE `tb_liturgi` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `user` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_liturgi`
--

INSERT INTO `tb_liturgi` (`id`, `title`, `start`, `end`, `user`) VALUES
(1, 'Peringatan Wajib \r\nSt. Leo Agung, Paus\r\n\r\nFlm.7-20; Mzm. 146:7,\r\n8-9a,9bc-10;\r\nLuk. 17:20-25;\r\n\r\nWarna Liturgi Putih\r\n', '2022-11-10', '2022-11-10', 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengaturan`
--

CREATE TABLE `tb_pengaturan` (
  `id_pengaturan` int(11) NOT NULL,
  `nama_web` varchar(500) NOT NULL,
  `isi_judul` text NOT NULL,
  `tentang_gereja` text NOT NULL,
  `no_hp` varchar(200) NOT NULL,
  `email_gereja` varchar(200) NOT NULL,
  `alamat_gereja` varchar(200) NOT NULL,
  `provinsi_gereja` varchar(200) NOT NULL,
  `kabupaten_gereja` varchar(200) NOT NULL,
  `kecamatan_gereja` varchar(200) NOT NULL,
  `kelurahan_gereja` varchar(200) NOT NULL,
  `gambar_gereja` varchar(200) NOT NULL,
  `pastor_paroki` varchar(200) NOT NULL,
  `tentang_pastor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pengaturan`
--

INSERT INTO `tb_pengaturan` (`id_pengaturan`, `nama_web`, `isi_judul`, `tentang_gereja`, `no_hp`, `email_gereja`, `alamat_gereja`, `provinsi_gereja`, `kabupaten_gereja`, `kecamatan_gereja`, `kelurahan_gereja`, `gambar_gereja`, `pastor_paroki`, `tentang_pastor`) VALUES
(1, 'Gereja St. Karolus Agung Orakeri Ende ', '<p>Sebab dalam satu Roh kita semua, baik orang Yahudi, maupun orang Yunani, baik budak, maupun orang merdeka, telah dibaptis menjadi satu tubuh dan kita semua diberi minum dari satu Roh.&nbsp;<span style=\"color:#ffd700\"><strong>1 Korintus 12:13</strong></span></p>\r\n', '<p style=\"text-align:justify\">Gereja Kuasi Santo Karolus Agung Orakeri resmi berdiri dengan surat keputusan Uskup Keuskupan Agung Ende No: 104/ 5K/ KUS/ IX/ 2017, tanggal 4 November 2017. Kuasi Santo Karolus Agung Orakeri didirikan sebagai persiapan ke arah Paroki baru pemekaran dari Paroki Santo Eduardus Nangapanda dan cakupan sementara wilayah pelayanan pastoral meliputi Stasi Orakeri, Stasi Marakoja, Stasi Watumite, Stasi Oja dan Stasi Malaara.&nbsp;Pendirian gereja Kuasi Santo Karolus Agung Orakeri disusul dengan pengangkatan Pastor Kuasi Santo Karolus Agung Orakeri oleh Uskup Agung Ende melalui surat keputusan No: 027/ SK/ KUS/ IV/ 2018 tanggal 9 April 2018. Tanggal 20 April 2018. Reverendus Dominus Fidelis Markus Demu dilantik menjadi Pastor Kuasi Santo Karolus Agung Orakeri, oleh Reverendus Dominus Adolf Keo (Vikep Ende) dan sejak tanggal 29 April 2018, RD.Fidelis Markus Demu mulai menetap di Orakeri sebagai pusat kuasi untuk melaksanakan karya Pastoral Parokial untuk umat Allah dan wilayah gereja Kuasi Santo Karolus Agung Orakeri.</p>\r\n\r\n<p style=\"text-align:justify\">Gereja Kuasi Santo Karolus Agung Orakeri beriklim tropis dan berhawa sejuk karena terletak di pegunungan. Sangat berbanding jauh dengan umat yang hidup dekat pesisir pantai Nangapanda, yang berhawa panas. Musim hujan dan panas terkadang berubah-ubah sesuai dengan siklus alam yang tidak tetap.Kuasi Paroki ini juga memiliki&nbsp;cakupan wilayah yang cukup luas yakni: dari Nitu sampai Malaara, dan dibagi dalam lima stasi besar yang berada dalam tujuh desa, dalam satu kecamatan Nangapanda. Kelima Stasi terdiri dari Stasi Gunung Kalfari Oja, yang terletak didua desa yaitu Desa Mboabhenga dan Desa Tendambepa, stasi pusat berada di dua desa yakni, Desa Tendarea dan Desa Timbazi&rsquo;a, Stasi Taman Zaitun Marakoja berada di satu desa yaitu Desa Tiwerea, Stasi Ngga&rsquo;e Raja Watumite berada disatu desa yaitu Desa Watumite dan Stasi Betlehem Mala&rsquo;ara berada disatu desa yaitu Desa Romarea.</p>\r\n\r\n<p style=\"text-align:justify\">Secara Geografis, wilayah Gereja Kuasi Santo Karolus Agung Orakeri bagian utara berbatasan dengan Kuasi Paroki Santo Yosep Kamubheka, bagian selatan berbatasan dengan Paroki Santo Eduardus Nangapanda, bagian barat berbatasan dengan Paroki Santo Martinus Nangaroro, bagian timur berbatasan dengan Paroki Santo Eduardus Nangapanda. Transportasi yang digunakan diwilayah gereja Kuasi Santo Karolus Agung Orakeri ini pada umumnya adalah kendaraan roda dua dan roda empat. Gereja ini juga memiliki beberapa kelompok organisasi gerejani, yaitu: organisasi rohani terdiri dari Kelompok Santa Anna dan Legio Maria, organisasi kategorial gerejani terdiri dari Sekami, OMK, THS atau THM, dan yang terakhir organisasi bernafaskan iman katolik yang terdiri dari ITDM. Wilayah Kuasi Santo Karolus Agung Orakeri terdiri dari 5 Stasi yang masing-masingnya terbagi dalam beberapa lingkungan dan KUB.</p>\r\n', '082146540581', 'santokarolusagungorakeri@gmail.com', 'Jln. Mohammad Hatta', 'Nusa Tenggara Timur', 'Ende', 'Nangapanda', 'Tendarea', 'IMG_20221012_141641.jpg', 'Pastor RD Fidelis Demu', '<p>Lahir di Saga, Ende 11 Juli 1951.</p>\r\n\r\n<p>Motto tahbisan: Praedica Verbum Opportune Importune yang artinya &quot;Wartakanlah firman, baik atau tidak baik waktunya. <span style=\"color:#000000\"><strong>2 Timotius 4:2</strong></span>&quot;</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` enum('Administrator','Kaur Pemerintah') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Ervanto Andreas', 'admin', 'admin', 'Administrator'),
(3, 'Imas', 'admin2', 'admin2', 'Kaur Pemerintah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `email` varchar(200) NOT NULL,
  `subjek` varchar(200) NOT NULL,
  `pesan` text NOT NULL,
  `tanggal` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pindah`
--

CREATE TABLE `tb_pindah` (
  `id_pindah` int(11) NOT NULL,
  `ketua` varchar(255) NOT NULL,
  `id_kub` int(11) NOT NULL,
  `id_lingkungan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pindah`
--

INSERT INTO `tb_pindah` (`id_pindah`, `ketua`, `id_kub`, `id_lingkungan`) VALUES
(13, '2', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_stasi`
--

CREATE TABLE `tb_stasi` (
  `id_stasi` int(11) NOT NULL,
  `nama_stasi` varchar(200) NOT NULL,
  `ketua` varchar(200) NOT NULL,
  `sekretaris` varchar(200) NOT NULL,
  `bendahara` varchar(200) NOT NULL,
  `jumlah_kk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_stasi`
--

INSERT INTO `tb_stasi` (`id_stasi`, `nama_stasi`, `ketua`, `sekretaris`, `bendahara`, `jumlah_kk`) VALUES
(1, 'Stasi Gunung Sion Orakeri', '6', '1', '2', '76'),
(2, 'Stasi Taman Zaitun Marakoja', '42', '43', '44', '189'),
(3, 'Stasi Nggae Raja Watumite', '75', '76', '77', '179');

-- --------------------------------------------------------

--
-- Table structure for table `tb_umat`
--

CREATE TABLE `tb_umat` (
  `id_umat` int(11) NOT NULL,
  `id_kub` int(11) NOT NULL,
  `id_lingkungan` int(11) NOT NULL,
  `nik` int(16) NOT NULL,
  `nama_umat` varchar(200) NOT NULL,
  `jenis_kelamin` enum('LK','PR') NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `rt` varchar(11) NOT NULL,
  `rw` varchar(11) NOT NULL,
  `pekerjaan` varchar(200) NOT NULL,
  `jabatan_gereja` varchar(200) NOT NULL,
  `pendidikan` varchar(200) NOT NULL,
  `gol_darah` varchar(10) NOT NULL,
  `no_hp` varchar(16) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `status_kawin` varchar(20) NOT NULL,
  `tanggal_nikah` date NOT NULL,
  `tempat_nikah` varchar(20) NOT NULL,
  `tanggal_komuni` date NOT NULL,
  `tempat_komuni` varchar(20) NOT NULL,
  `tanggal_baptis` date NOT NULL,
  `tempat_baptis` varchar(20) NOT NULL,
  `status_umat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_umat`
--

INSERT INTO `tb_umat` (`id_umat`, `id_kub`, `id_lingkungan`, `nik`, `nama_umat`, `jenis_kelamin`, `alamat`, `rt`, `rw`, `pekerjaan`, `jabatan_gereja`, `pendidikan`, `gol_darah`, `no_hp`, `tempat_lahir`, `tanggal_lahir`, `status_kawin`, `tanggal_nikah`, `tempat_nikah`, `tanggal_komuni`, `tempat_komuni`, `tanggal_baptis`, `tempat_baptis`, `status_umat`) VALUES
(1, 2, 1, 2147483647, 'Yosep Wasa', 'LK', 'Orakeri 2', '007', '009', 'Guru', 'Pengurus Stasi', 'S1', 'B', '+6282216912599', 'Maumere', '1999-05-05', 'Sudah', '0000-00-00', '', '2022-11-25', 'Maumere', '2022-11-29', 'Maumere', 'Ada'),
(2, 2, 1, 2147483647, 'Katarina Dhina', 'PR', 'Orakeri 3', '012', '019', 'Guru Honor', 'Pengurus Stasi', 'S1', 'AB', '+6282216912577', 'Ende', '2022-10-04', 'Sudah', '0000-00-00', '', '2022-10-30', 'Ende', '2022-11-18', 'Ende', 'Ada'),
(6, 2, 1, 2147483647, 'Donatus Doi', 'LK', 'Orakeri 1', '13', '004', 'Guru', 'Pengurus Stasi', 'S1', 'A', '08123845786', 'Ende', '1970-02-23', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(7, 2, 1, 2147483647, 'Ambrosius Djago', 'LK', 'Orakeri 1', '13', '004', 'PNS', 'Pengurus KUB', 'S1', '0', '082146540581', 'Ende', '1070-09-14', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(8, 2, 1, 2147483647, 'Tomas Koba', 'LK', 'Orakeri', '13', '004', 'PNS', 'Pengurus KUB', 'S1', 'A', '082145324123', 'Ende', '1985-12-14', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(9, 2, 1, 2147483647, 'Katarina Nggua', 'PR', 'Orakeri', '14', '003', 'Guru TK', 'Pengurus KUB', 'S1 ', '0', '085253156036', 'Ende', '1985-04-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(10, 2, 1, 2147483647, 'Herbaculanus Hasenda Ndewa', 'LK', 'Orakeri', '13', '004', 'Guru SMP', 'Pengurus Lingkungan', 'S1 ', 'B', '081338240036', 'Maumere', '1985-06-14', 'Belum', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(11, 2, 1, 2147483647, 'Moses Mia', 'LK', 'Orakeri', '15', '006', 'PNS', 'Pengurus Lingkungan', 'S1', 'AB', '082342132456', 'Ende', '1975-02-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(12, 2, 1, 2147483647, 'Selvinus O. Duja', 'LK', 'Orakeri', '16', '005', 'PNS', 'Pengurus KUB', 'S1', 'B', '082143212346', 'Bajawa', '1988-02-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(13, 2, 1, 2147483647, 'Daniel Jon Jata', 'LK', 'Orakeri 2', '17', '008', 'PNS', 'Pengurus KUB', 'S1', 'AB', '082342123678', 'Ende', '1987-01-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(14, 2, 1, 2147483647, 'Nikolaus Leri', 'LK', 'Orakeri 2', '17', '008', 'PNS', 'Pengurus KUB', 'S1 Pendidikan', 'AB', '085234564324', 'Ende', '1988-05-14', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(15, 2, 1, 2147483647, 'Yustina Poa', 'PR', 'Orakeri 2', '17', '008', 'Guru TK', 'Pengurus KUB', 'S1', 'B', '082236440341', 'Mbay', '1989-02-04', 'Cerai Mati', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(16, 2, 1, 2147483647, 'Kanisius Sa', 'LK', 'Orakeri 3', '15', '007', 'PNS', 'Pengurus KUB', 'S1 Teknik Sipil', 'B', '082339903407', 'Sumba', '1976-05-14', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(17, 2, 1, 2147483647, 'Anton  Sa', 'LK', 'Orakeri 3', '17', '008', 'Guru SD', 'Pengurus KUB', 'S1 PGSD', 'B', '081319738474', 'Ende', '1979-10-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(18, 2, 1, 2147483647, 'Nikolaus Side', 'LK', 'Orakeri 3', '17', '008', 'Pegawai PLN Ende', 'Pengurus KUB', 'S1 Teknik Elektro', 'B', '081353447194', 'Ende', '1995-10-28', 'Belum', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(19, 3, 1, 2147483647, 'Vinsensius Dasa', 'LK', 'Orakeri 1', '13', '004', 'Wiraswasta', 'Umat', 'SMA', 'B', '081236163844', 'Sumba', '1976-10-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(20, 3, 1, 2147483647, 'Aleks Pende', 'LK', 'Orakeri 1', '13', '004', 'Petani', 'Umat', 'SMP', 'B', '081239123443', 'Ende', '1980-11-02', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(21, 3, 1, 2147483647, 'Yeremias Gae', 'LK', 'Orakeri 1', '13', '004', 'Petani', 'Umat', 'SMP', 'B', '081337427825', 'Ende', '1987-09-14', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(22, 3, 1, 2147483647, 'Antonius Sena', 'LK', 'Orakeri', '13', '004', 'Petani', 'Umat', 'SMA', 'AB', '085352857156', 'Bajawa', '1965-12-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(23, 3, 1, 2147483647, 'Pius Pama', 'LK', 'Orakeri 1', '13', '004', 'PNS', 'Umat', 'S1', 'A', '085792502633', 'Bajawa', '1977-07-15', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(24, 3, 1, 2147483647, 'Lambertus Sale', 'LK', 'Orakeri 1', '13', '004', 'Petani', 'Umat', 'SMP', 'B', '082123567890', 'worowatu', '1965-10-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(25, 3, 1, 2147483647, 'Valerius Akumen', 'LK', 'Orakeri 1', '13', '004', 'Guru', 'Umat', 'S1', 'B', '081395228169', 'Ruteng', '1980-12-12', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(26, 27, 8, 2147483647, 'Yosep Nggoma', 'LK', 'Orakeri 1', '13', '004', 'Tukang Kayu', 'Umat', 'SMA', 'A', '081237097653', 'Ende', '1985-06-29', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(27, 3, 1, 2147483647, 'Kosmas Batu Bara', 'LK', 'Orakeri 1', '13', '004', 'Tukang listrik ', 'Umat', 'SMA', 'B', '081238197146', 'Ende', '1975-01-29', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(28, 3, 1, 2147483647, 'Albinus Nggili', 'LK', 'Orakeri 1', '13', '004', 'Petani', 'Umat', 'SMA', 'A', '081213699018', 'Sumba', '1976-05-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(29, 4, 1, 2147483647, 'Antonius Rus', 'LK', 'Orakeri 2', '14', '005', 'Guru SMA', 'Umat', 'S1', 'B', '082146018887', 'Ende', '1980-11-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(30, 4, 1, 2147483647, 'Nasarius Nuri', 'LK', 'Orakeri 2', '14', '005', 'Wiraswasta', 'Umat', 'SMA', 'B', '085234654190', 'Ende', '1990-08-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(31, 4, 1, 2147483647, 'Pius W. Dera', 'LK', 'Orakeri 2', '14', '005', 'Guru SMA', 'Umat', 'S1', 'B', '082144321657', 'Ende', '1986-02-05', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(32, 4, 1, 2147483647, 'Serfas Gayadi', 'LK', 'Orakeri 2', '14', '005', 'Wiraswasta', 'Umat', 'SMA', 'AB', '081359464147', 'Ende', '1988-09-15', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(33, 4, 1, 2147483647, 'Pius Se', 'LK', 'Orakeri 2', '14', '005', 'Guru SMA', 'Umat', 'S1', 'O', '082229199663', 'Manggarai', '1977-06-08', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(34, 5, 1, 2147483647, 'Martinus Nuga', 'LK', 'Orakeri 3', '15', '006', 'Wiraswasta', 'Umat', 'SMA', 'AB', '081236244098', 'Ende', '1985-05-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(35, 5, 1, 2147483647, 'Ardianus Rapo', 'LK', 'Orakeri 3', '15', '006', 'Petani', 'Umat', 'SMP', 'AB', '082144843728', 'Ende', '1786-08-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(36, 5, 1, 2147483647, 'Zakarias Sedhu', 'LK', 'Orakeri 3', '15', '006', 'Wiraswasta', 'Umat', 'SMA', 'AB', '081237199558', 'Ende', '1989-05-20', 'Belum', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(37, 5, 1, 2147483647, 'Benediktus Dala', 'LK', 'Orakeri 3', '15', '006', 'PNS', 'Umat', 'S1', 'B', '08082236221837', 'Ende', '1965-07-14', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(38, 5, 1, 2147483647, 'Mikael Maju', 'LK', 'Orakeri 3', '15', '006', 'Wiraswasta', 'Umat', 'SMA', 'B', '085238745234', 'Sorong', '1975-05-23', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(39, 6, 4, 2147483647, 'Donatus Tiara', 'PR', 'Kampung Marakoja', '20', '008', 'Guru SMA', 'Pengurus KUB', 'S1', 'B', '085238641987', 'Ende', '1965-06-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(40, 6, 4, 2147483647, 'Amandus Mesa', 'LK', 'Kampung Marakoja', '20', '008', 'PNS', 'Pengurus KUB', 'S1', 'B', '081338240036', 'Ende', '1975-05-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(41, 6, 4, 2147483647, 'Serfas Jae', 'LK', 'Kampung Marakoja', '20', '008', 'PNS', 'Pengurus KUB', 'S1', 'B', '081236098544', 'Ende', '1988-06-27', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(42, 11, 6, 2147483647, 'Adrianus Dera', 'LK', 'Kampung Tiwe', '10', '005', 'PNS', 'Pengurus Stasi', 'S1', 'O', '085238544234', 'Ende', '1975-09-09', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(43, 10, 5, 2147483647, 'Henarikus Mbeda', 'LK', 'Kampung Mbesi', '10', '004', 'Guru SMA', 'Pengurus Stasi', 'S1', 'O', '081236239239', 'Ende', '1978-08-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(44, 12, 0, 2147483647, 'Lugardis Ndai', 'LK', 'Kampung Tiwe', '10', '008', 'Guru SMA', 'Pengurus Stasi', 'S1', 'AB', '081238231334', 'Mbay', '1990-10-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(45, 13, 6, 2147483647, 'Gaspar Geu', 'LK', 'Kampung Tiwe', '10', '002', 'PNS', 'Pengurus Lingkungan', 'S1', 'O', '082367089544', 'Bajawa', '1986-09-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(46, 12, 6, 2147483647, 'Paulina Poi', 'PR', 'Kampung Tiwe', '10', '002', 'PNS', 'Pengurus Lingkungan', 'S1', 'B', '081238089654', 'Ende', '1990-05-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(47, 11, 6, 2147483647, 'Kletus Tegu', 'LK', 'Kampung Tiwe', '14', '006', 'Guru SMA', 'Pengurus Lingkungan', 'S1', 'B', '082167978089', 'Bajawa', '1988-10-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(48, 10, 5, 2147483647, 'Mateus Go', 'LK', 'Kampung Mbesi', '13', '006', 'Guru SMA', 'Pengurus Lingkungan', 'S1', 'A', '081213699018', 'Maumere', '1987-09-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(49, 10, 5, 2147483647, 'Timoteus Juma', 'LK', 'Kampung Mbesi', '14', '004', 'PNS', 'Pengurus Lingkungan', 'S1', 'O', '082234567890', 'Maumere', '1988-12-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(50, 9, 5, 2147483647, 'Mersiana Tawa', 'PR', 'Kampung Mbesi', '13', '004', 'Guru SD', 'Pengurus Lingkungan', 'S1', 'B', '081236435235', 'Bajawa', '1988-09-29', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(51, 6, 4, 2147483647, 'Yohanes Kako', 'LK', 'Kampung Marakoja', '12', '004', 'PNS', 'Pengurus Lingkungan', 'S1', 'AB', '085253651063', 'Ende', '1980-09-24', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(52, 8, 4, 2147483647, 'Gabriel Gala', 'LK', 'Kampung Marakoja', '12', '004', 'Guru SMA', 'Pengurus Lingkungan', 'S1', 'O', '082123456789', 'Maumere', '1980-09-12', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(53, 7, 4, 2147483647, 'Kornelis Keli', 'LK', 'Kampung Marakoja', '12', '007', 'Guru SD', 'Pengurus Lingkungan', 'S1', 'A', '085239544345', 'Ende', '1990-08-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(54, 15, 4, 2147483647, 'Simon Setu', 'LK', 'Kampung Marakoja', '11', '005', 'Guru SMA', 'Pengurus KUB', 'S1', 'AB', '085237556432', 'Ende', '1989-09-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(55, 15, 4, 2147483647, 'Stafanus Songga', 'LK', 'Kampung Marakoja', '12', '007', 'Wiraswasta', 'Pengurus KUB', 'SMA', 'B', '081234567987', 'Maumere', '1979-09-12', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(56, 15, 4, 2147483647, 'Karolus Kesu', 'LK', 'Kampung Marakoja', '15', '002', 'PNS', 'Pengurus KUB', 'S1', 'B', '082146542312', 'Bajawa', '1980-02-25', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(57, 16, 4, 2147483647, 'Rofinus Siku', 'LK', 'Kampung Marakoja', '13', '005', 'Guru SMk', 'Pengurus KUB', 'S1', 'A', '081238295356', 'Ende', '1988-02-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(58, 16, 4, 2147483647, 'Maria Isa', 'PR', 'Kampung Marakoja', '13', '005', 'PNS', 'Pengurus KUB', 'S1', 'B', '085321193094', 'Maumere', '1995-05-20', 'Belum', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(59, 16, 4, 530, 'Fransiskus Ngaka', 'LK', 'Kampung Marakoja', '13', '005', 'PNS', 'Pengurus KUB', 'S1', 'AB', '081246692262', 'Mbay', '1985-08-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(60, 17, 5, 2147483647, 'Tobias Bhisa', 'LK', 'Kampung Mbesi', '20', '008', 'Petani', 'Pengurus KUB', 'SMA', 'AB', '081237421408', 'Ende', '1977-09-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(61, 17, 5, 2147483647, 'Marselina Jhoni', 'PR', 'Kampung Mbesi', '20', '008', 'Guru TK', 'Pengurus KUB', 'S1', 'B', '081353812300', 'Maumere', '1992-06-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(62, 17, 5, 5301, 'Renol Siga', 'LK', 'Kampung Mbesi', '20', '006', 'PNS', 'Pengurus KUB', 'S1', 'A', '082144752706', 'Mbay', '1990-01-02', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(63, 18, 5, 2147483647, 'Gaspar Bisara', 'LK', 'Kampung Marakoja', '12', '002', 'Wiraswasta', 'Pengurus KUB', 'S1', 'A', '081236784462', 'Ende', '1989-03-11', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(64, 18, 5, 2147483647, 'Marianus Mbesi', 'LK', 'Kampung Mbesi', '12', '005', 'Wiraswasta', '', 'SMA', 'A', '081337190083', 'Maumere', '1977-05-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(65, 18, 5, 2147483647, 'Agata Tunda', 'PR', 'Kampung Mbesi', '12', '004', 'Guru SD', 'Pengurus KUB', 'S1', 'B', '082359466447', 'Ende', '1989-08-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(66, 20, 6, 2147483647, 'Bernadus Lasa', 'LK', 'Kampung Tiwe', '10', '005', 'Wiraswasta', 'Pengurus KUB', 'SMA', 'A', '082147883848', 'Ende', '1975-02-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(67, 16, 6, 2147483647, 'Marta Rimba', 'PR', 'Kampung Tiwe', '10', '005', 'Guru Honor', 'Pengurus KUB', 'S1', 'B', '081237563131', 'Ende', '1986-02-23', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(68, 16, 6, 2147483647, 'Veronika Diki', 'PR', 'Kampung Tiwe', '10', '005', 'PNS', 'Pengurus KUB', 'S1', 'O', '082269094912', 'Maumere', '1990-02-20', 'Belum', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(69, 16, 6, 2147483647, 'Tresia Hawa', 'PR', 'Kampung Tiwe', '11', '06', 'Guru SD', 'Pengurus KUB', 'S1', 'A', '082237831475', 'Bajawa', '1990-02-11', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(70, 16, 6, 2147483647, 'Bertolomeus Paga', 'LK', 'Kampung Tiwe', '11', '006', 'Guru SMA', 'Pengurus KUB', 'S1', 'AB', '082145252834', 'Bajawa', '1989-02-11', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(71, 16, 6, 537104041, 'Martina Sia', 'PR', 'Kampung Tiwe', '11', '006', 'Guru SD', 'Pengurus KUB', 'S1', 'AB', '081288395496', 'Mbay', '1988-02-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(72, 16, 6, 2147483647, 'Benediktus Weto', 'LK', 'Kampung Tiwe', '11', '006', 'Wiraswasta', 'Pengurus KUB', 'SMA', 'B', '081338243679', 'Mbay', '1977-03-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(73, 16, 6, 2147483647, 'Andreas Dara', 'LK', 'Kampung Tiwe', '11', '006', 'Wiraswasta', 'Pengurus KUB', 'SMA', 'B', '085234127898', 'Mbay', '1989-03-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(74, 16, 6, 2147483647, 'Antasia Mude', 'PR', 'Kampung Tiwe', '12', '002', 'Guru SD', 'Pengurus KUB', 'S1', 'B', '081238223456', 'Sumba', '1992-03-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(75, 23, 6, 2147483647, 'Stanislaus Luka', 'LK', 'Kampung Watumite', '23', '10', 'PNS', 'Pengurus Stasi', 'S1', 'AB', '085234167543', 'Ende', '1980-04-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(76, 16, 6, 2147483647, 'Paskalis Kanga', 'LK', 'Kampung Malawaru', '17', '008', 'PNS', 'Pengurus Stasi', 'S1', 'A', '082235412678', 'Sorong', '1988-04-18', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(77, 26, 8, 2147483647, 'Maria Nia', 'PR', 'Kampung Regu', '22', '008', 'Guru SMA', 'Pengurus Stasi', 'S1', 'B', '085231554321', 'Sumba', '1990-05-01', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(78, 24, 7, 2147483647, 'Polikarpus Pasi', 'LK', 'Kampung Watumite', '23', '10', 'Guru SD', 'Pengurus Lingkungan', 'S1', 'B', '082143500524', 'Ende', '1980-12-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(79, 3, 1, 2147483647, 'Elias Piala', 'LK', 'Kampung Watumite', '20', '001', 'PNS', 'Pengurus Lingkungan', 'S1', 'AB', '082146543127', 'Mbay', '1988-11-09', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(80, 4, 4, 2147483647, 'Melkiades S. Woru', 'LK', 'Kampung Watumite', '23', '10', 'PNS', 'Pengurus Lingkungan', 'S1', 'A', '082237654129', 'Bajawa', '1990-10-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(81, 24, 7, 2147483647, 'Nikolaus Ngita', 'LK', 'Kampung Watumite', '23', '10', 'Wiraswasta', 'Pengurus KUB', 'SMA', 'AB', '081238324354', 'Ende', '1965-10-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(82, 24, 7, 2147483647, 'Yosep Aliwaris', 'LK', 'Kampung Watumite', '23', '10', 'Wiraswasta', 'Pengurus KUB', 'S1', 'AB', '082146557654', 'Maumere', '1988-11-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(83, 24, 7, 2147483647, 'Theresia Titi', 'PR', 'Kampung Watumite', '23', '10', 'Guru SMA', 'Pengurus KUB', 'S1', 'A', '082144322122', 'Bajawa', '1992-09-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(84, 25, 7, 2147483647, 'Vinsensius F. O. Idu', 'LK', 'Kampung Watumite', '13', '008', 'Wiraswasta', 'Pengurus KUB', 'SMA', 'A', '082144322123', 'Maumere', '1988-10-09', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(85, 25, 7, 2147483647, 'Fransiska Vivi Sumanti', 'PR', 'Kampung Watumite', '13', '006', 'Guru SD', 'Pengurus KUB', 'S1', 'B', '081238435432', 'Mbay', '1988-10-09', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(86, 25, 7, 2147483647, 'Irma M. N. Ngore', 'PR', 'Kampung Watumite', '13', '006', 'PNS', 'Pengurus KUB', 'S1', 'A', '081234543567', 'Ende', '1989-09-27', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(87, 25, 7, 2147483647, 'Rosalia Eo', 'PR', 'Kampung Regu', '23', '009', 'Guru SD', 'Pengurus Lingkungan', 'S1', 'A', '082145345235', 'Mbay', '1988-10-10', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(88, 25, 4, 2147483647, 'Yohanes B. Eden', 'LK', 'Kampung Regu', '23', '009', 'Wiraswasta', 'Pengurus Lingkungan', 'S1', 'B', '081238233221', 'Maumere', '1998-12-07', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(89, 25, 7, 2147483647, 'Yosep Seso', 'LK', 'Kampung Regu', '23', '009', 'Guru Honor', 'Pengurus Lingkungan', 'S1', 'B', '082144321234', 'Sumba', '1992-10-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(90, 26, 8, 2147483647, 'Petrus G. Dua', 'LK', 'Kampung Regu', '23', '009', 'Wiraswasta', 'Pengurus KUB', 'S1', '0', '085238544234', 'Ende', '1987-10-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(91, 26, 8, 2147483647, 'Adriana Yani', 'PR', 'Kampung Regu', '18', '004', 'Guru Honor', 'Pengurus KUB', 'S1', '0', '081338246540', 'Ende', '1989-11-03', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(92, 26, 8, 2147483647, 'Maria Mae', 'PR', 'Kampung Regu', '013', '007', 'PNS', 'Pengurus KUB', 'S1', '0', '082145340344', 'Bajawa', '1990-09-22', 'Belum', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(93, 26, 8, 2147483647, 'Adolfus Damai', 'LK', 'Kampung Regu', '013', '004', 'Pensiun Pns', 'Pengurus KUB', 'S1', 'AB', '085238455089', 'Mbay', '1965-09-12', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(94, 27, 8, 2147483647, 'Pius A. Piluwa', 'LK', 'Kampung Regu', '013', '006', 'Wiraswasta', 'Pengurus KUB', 'S1', 'B', '082238676908', 'Ende', '1987-10-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(95, 27, 8, 2147483647, 'Fransiskus Dhosa', 'LK', 'Kampung Regu', '013', '006', 'Wiraswasta', 'Pengurus KUB', 'S1', 'B', '081235556786', 'Nangapanda', '1989-09-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(96, 28, 9, 2147483647, 'Adrianus Muda ', 'LK', 'Kampung Malawaru', '15', '006', 'Wiraswasta', 'Pengurus Lingkungan', 'S1', 'AB', '085238655251', 'Bajawa', '1978-06-22', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(97, 27, 8, 2147483647, 'Yohanes Da Gui', 'LK', 'Kampung Malawaru', '13', '004', 'Wiraswasta', 'Pengurus Lingkungan', 'SMA', 'A', '085238567433', 'Maumere', '1975-08-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(98, 27, 8, 2147483647, 'Yoseph Deku', 'LK', 'Kampung Malawaru', '13', '004', 'Guru SMA', 'Pengurus Lingkungan', 'S1', 'A', '081223672123', 'Bajawa', '1988-10-09', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(99, 28, 9, 2147483647, 'Gregorius Gesi', 'LK', 'Kampung Malawaru', '012', '003', 'Wiraswasta', 'Pengurus KUB', 'SMA', '0', '082146543116', 'Maumere', '1980-12-24', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(100, 28, 9, 2147483647, 'Herman Ye Dimana', 'LK', 'Kampung Malawaru', '15', '004', 'Wiraswasta', 'Pengurus KUB', 'S1', '0', '082146542112', 'Bajawa', '1989-09-24', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(101, 28, 9, 2147483647, 'Maria Ue', 'PR', 'Kampung Malawaru', '12', '008', 'PNS', 'Pengurus KUB', 'S1', 'B', '081236540581', 'Mbay', '1990-09-12', 'Belum', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(102, 29, 9, 2147483647, 'Romaldus Parera', 'LK', 'Kampung Malawaru', '012', '006', 'Wiraswasta', 'Pengurus KUB', 'SMA', 'B', '082145540558', 'Kupang', '1988-12-14', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(103, 29, 9, 2147483647, 'Florentinus Sidi', 'LK', 'Kampung Malawaru', '15', '009', 'PNS', 'Pengurus KUB', 'S1', 'A', '082342542556', 'Worowona', '1988-10-09', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(104, 29, 9, 2147483647, 'Elisabet Siti', 'PR', 'Kampung Malawaru', '17', '004', 'Guru SMA', 'Pengurus KUB', 'S1', 'AB', '081236546555', 'Mbay', '1992-10-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(105, 29, 9, 2147483647, 'Agustina Ue', 'PR', 'Kampung Rokambake', '016', '005', 'PNS', 'Pengurus Lingkungan', 'S1', 'A', '085238554028', 'Ende', '1980-08-24', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(106, 30, 10, 2147483647, 'Paulinus Rai', 'LK', 'Kampung Rokambake', '13', '002', 'Guru SMA', 'Pengurus Lingkungan', 'SMA', 'AB', '081237654345', 'Maumere', '1988-04-20', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(107, 14, 4, 2147483647, 'Rosalia Eo', 'PR', 'Kampung Rokambake', '10', '002', 'Guru SD', 'Pengurus Lingkungan', 'S1', 'B', '08123456098', 'Bajawa', '1990-01-02', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(108, 30, 10, 2147483647, 'Nikolaus Lara', 'LK', 'Kampung Rokambake', '011', '007', 'Wiraswasta', 'Pengurus KUB', 'S1', 'AB', '081236089655', 'Ende', '1980-01-02', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(109, 30, 10, 2147483647, 'Albertus Bole', 'LK', 'Kampung Rokambake', '012', '003', 'PNS', 'Pengurus KUB', 'S1', 'AB', '082146554214', 'Ende', '1986-09-08', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(110, 30, 10, 2147483647, 'Thomas AQ Pesa', 'LK', 'Kampung Rokambake', '009', '002', 'Guru Honor', 'Pengurus KUB', 'S1', 'B', '085738345112', 'Ende', '1988-08-24', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(111, 31, 10, 2147483647, 'Philipus P. Alo', 'LK', 'Kampung Rokambake', '016', '008', 'Guru SD', 'Pengurus KUB', 'S1', 'A', '085233123223', 'Ende', '1975-08-28', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(112, 31, 10, 2147483647, 'Marselinus Embu Welu', 'LK', 'Kampung Rokambake', '017', '008', 'Guru Honor', 'Pengurus KUB', 'S1', '0', '081239667897', 'Ende', '1988-08-12', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada'),
(113, 31, 10, 2147483647, 'Aloysius Kota', 'LK', 'Kampung Rokambake', '017', '006', 'Wiraswasta', 'Pengurus KUB', 'S1', 'AB', '082146554321', 'Bajawa', '1990-10-18', 'Sudah', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 'Ada');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `tb_kegiatan`
--
ALTER TABLE `tb_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indexes for table `tb_kk`
--
ALTER TABLE `tb_kk`
  ADD PRIMARY KEY (`id_kk`);

--
-- Indexes for table `tb_kub`
--
ALTER TABLE `tb_kub`
  ADD PRIMARY KEY (`id_kub`);

--
-- Indexes for table `tb_lingkungan`
--
ALTER TABLE `tb_lingkungan`
  ADD PRIMARY KEY (`id_lingkungan`);

--
-- Indexes for table `tb_liturgi`
--
ALTER TABLE `tb_liturgi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengaturan`
--
ALTER TABLE `tb_pengaturan`
  ADD PRIMARY KEY (`id_pengaturan`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`) USING BTREE;

--
-- Indexes for table `tb_pindah`
--
ALTER TABLE `tb_pindah`
  ADD PRIMARY KEY (`id_pindah`);

--
-- Indexes for table `tb_stasi`
--
ALTER TABLE `tb_stasi`
  ADD PRIMARY KEY (`id_stasi`);

--
-- Indexes for table `tb_umat`
--
ALTER TABLE `tb_umat`
  ADD PRIMARY KEY (`id_umat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_kegiatan`
--
ALTER TABLE `tb_kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_kk`
--
ALTER TABLE `tb_kk`
  MODIFY `id_kk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_kub`
--
ALTER TABLE `tb_kub`
  MODIFY `id_kub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tb_lingkungan`
--
ALTER TABLE `tb_lingkungan`
  MODIFY `id_lingkungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_liturgi`
--
ALTER TABLE `tb_liturgi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_pengaturan`
--
ALTER TABLE `tb_pengaturan`
  MODIFY `id_pengaturan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pindah`
--
ALTER TABLE `tb_pindah`
  MODIFY `id_pindah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_stasi`
--
ALTER TABLE `tb_stasi`
  MODIFY `id_stasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_umat`
--
ALTER TABLE `tb_umat`
  MODIFY `id_umat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
