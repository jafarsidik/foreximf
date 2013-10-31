-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 31 Okt 2013 pada 07.19
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Basis data: `foreximf`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `acl_resources`
--

CREATE TABLE IF NOT EXISTS `acl_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('module','controller','action','other') NOT NULL DEFAULT 'other',
  `parent` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data untuk tabel `acl_resources`
--

INSERT INTO `acl_resources` (`id`, `name`, `type`, `parent`, `created`, `modified`) VALUES
(1, 'welcome', 'module', NULL, '2012-11-12 12:07:26', NULL),
(2, 'auth', 'module', NULL, '2012-11-12 04:00:23', NULL),
(3, 'auth/login', 'controller', 2, '2012-11-12 12:43:42', '2012-11-12 12:44:06'),
(4, 'auth/logout', 'controller', 2, '2012-11-12 12:43:56', NULL),
(5, 'auth/user', 'controller', 2, '2012-11-12 04:07:59', '2012-11-12 08:29:29'),
(6, 'acl', 'module', NULL, '2012-02-02 13:47:43', NULL),
(7, 'acl/resource', 'controller', 6, '2012-02-02 13:47:57', NULL),
(8, 'acl/resource/index', 'action', 7, '2012-02-02 13:48:21', NULL),
(9, 'acl/resource/add', 'action', 7, '2012-02-02 13:48:35', '2012-10-16 17:26:12'),
(10, 'acl/resource/edit', 'action', 7, '2012-02-02 13:48:50', '2012-07-09 18:44:38'),
(11, 'acl/resource/delete', 'action', 7, '2012-02-02 13:49:06', NULL),
(12, 'acl/role', 'controller', 6, '2012-07-12 17:54:16', NULL),
(13, 'acl/role/index', 'action', 12, '2012-07-12 17:55:29', NULL),
(14, 'acl/role/add', 'action', 12, '2012-07-12 17:56:00', NULL),
(15, 'acl/role/edit', 'action', 12, '2012-07-12 17:56:19', NULL),
(16, 'acl/role/delete', 'action', 12, '2012-07-12 17:56:55', NULL),
(17, 'acl/rule', 'controller', 6, '2012-07-12 17:53:04', NULL),
(18, 'acl/rule/edit', 'action', 17, '2012-07-12 17:53:25', NULL),
(19, 'demo', 'module', NULL, '2013-09-19 09:32:45', NULL),
(20, 'demo/demo', 'controller', 19, '2013-09-19 10:13:08', '2013-09-19 10:16:32'),
(22, 'live_account', 'module', NULL, '2013-10-02 10:16:44', NULL),
(23, 'live_account/live_account', 'controller', 22, '2013-10-02 10:17:16', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `acl_roles`
--

CREATE TABLE IF NOT EXISTS `acl_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=26 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `acl_roles`
--

INSERT INTO `acl_roles` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Administrator', '2011-12-27 12:00:00', NULL),
(2, 'Guest', '2011-12-27 12:00:00', NULL),
(5, 'Demo', '2013-09-19 10:08:11', '2013-10-18 06:21:16'),
(6, 'Live Account', '2013-10-18 06:21:29', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `acl_role_parents`
--

CREATE TABLE IF NOT EXISTS `acl_role_parents` (
  `role_id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `acl_rules`
--

CREATE TABLE IF NOT EXISTS `acl_rules` (
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `access` enum('allow','deny') NOT NULL DEFAULT 'deny',
  `priviledge` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `acl_rules`
--

INSERT INTO `acl_rules` (`role_id`, `resource_id`, `access`, `priviledge`) VALUES
(2, 1, 'allow', NULL),
(2, 3, 'allow', NULL),
(2, 4, 'allow', NULL),
(2, 19, 'allow', NULL),
(2, 20, 'allow', NULL),
(5, 1, 'allow', NULL),
(5, 3, 'allow', NULL),
(5, 4, 'allow', NULL),
(5, 5, 'allow', NULL),
(5, 19, 'deny', NULL),
(5, 20, 'deny', NULL),
(5, 22, 'allow', NULL),
(5, 23, 'allow', NULL),
(6, 1, 'allow', NULL),
(6, 3, 'allow', NULL),
(6, 4, 'allow', NULL),
(6, 22, 'allow', NULL),
(6, 23, 'allow', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `agent_code`
--

CREATE TABLE IF NOT EXISTS `agent_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `agent_code`
--

INSERT INTO `agent_code` (`id`, `code`, `full_name`, `picture`, `email`, `phone`) VALUES
(1, '12345', 'Jafar Sidik', 'jafar.jpg', 'mjsnux@gmail.com', '083815644435');

-- --------------------------------------------------------

--
-- Struktur dari tabel `alamat_kabupaten`
--

CREATE TABLE IF NOT EXISTS `alamat_kabupaten` (
  `ID_KABUPATEN` int(11) NOT NULL AUTO_INCREMENT,
  `NAMA_KABUPATEN` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `KODE_KABUPATEN` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAMA_PROPINSI` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `KODE_PROPINSI` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `flag_status` int(1) NOT NULL DEFAULT '0',
  `upsize_ts` longblob NOT NULL,
  PRIMARY KEY (`ID_KABUPATEN`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=501 ;

--
-- Dumping data untuk tabel `alamat_kabupaten`
--

INSERT INTO `alamat_kabupaten` (`ID_KABUPATEN`, `NAMA_KABUPATEN`, `KODE_KABUPATEN`, `NAMA_PROPINSI`, `KODE_PROPINSI`, `flag_status`, `upsize_ts`) VALUES
(1, 'Simeulue', '1101', 'ACEH', '11', 0, ''),
(2, 'Aceh Singkil', '1102', 'ACEH', '11', 0, ''),
(3, 'Aceh Selatan', '1103', 'ACEH', '11', 0, ''),
(4, 'Aceh Tenggara', '1104', 'ACEH', '11', 0, ''),
(5, 'Aceh Timur', '1105', 'ACEH', '11', 0, ''),
(6, 'Aceh Tengah', '1106', 'ACEH', '11', 0, ''),
(7, 'Aceh Barat', '1107', 'ACEH', '11', 0, ''),
(8, 'Aceh Besar', '1108', 'ACEH', '11', 0, ''),
(9, 'Pidie', '1109', 'ACEH', '11', 0, ''),
(10, 'Bireuen', '1110', 'ACEH', '11', 0, ''),
(11, 'Aceh Utara', '1111', 'ACEH', '11', 0, ''),
(12, 'Aceh Barat Daya', '1112', 'ACEH', '11', 0, ''),
(13, 'Gayo Lues', '1113', 'ACEH', '11', 0, ''),
(14, 'Aceh Tamiang', '1114', 'ACEH', '11', 0, ''),
(15, 'Nagan Raya', '1115', 'ACEH', '11', 0, ''),
(16, 'Aceh Jaya', '1116', 'ACEH', '11', 0, ''),
(17, 'Bener Meriah', '1117', 'ACEH', '11', 0, ''),
(18, 'Pidie Jaya', '1118', 'ACEH', '11', 0, ''),
(19, 'Banda Aceh', '1171', 'ACEH', '11', 0, ''),
(20, 'Sabang', '1172', 'ACEH', '11', 0, ''),
(21, 'Langsa', '1173', 'ACEH', '11', 0, ''),
(22, 'Lhokseumawe', '1174', 'ACEH', '11', 0, ''),
(23, 'Subulussalam', '1175', 'ACEH', '11', 0, ''),
(24, 'Nias', '1201', 'SUMATRA UTARA', '12', 0, ''),
(25, 'Mandailing Natal', '1202', 'SUMATRA UTARA', '12', 0, ''),
(26, 'Tapanuli Selatan', '1203', 'SUMATRA UTARA', '12', 0, ''),
(27, 'Tapanuli Tengah', '1204', 'SUMATRA UTARA', '12', 0, ''),
(28, 'Tapanuli Utara', '1205', 'SUMATRA UTARA', '12', 0, ''),
(29, 'Toba Samosir', '1206', 'SUMATRA UTARA', '12', 0, ''),
(30, 'Labuhan Batu', '1207', 'SUMATRA UTARA', '12', 0, ''),
(31, 'Asahan', '1208', 'SUMATRA UTARA', '12', 0, ''),
(32, 'Simalungun', '1209', 'SUMATRA UTARA', '12', 0, ''),
(33, 'Dairi', '1210', 'SUMATRA UTARA', '12', 0, ''),
(34, 'Karo', '1211', 'SUMATRA UTARA', '12', 0, ''),
(35, 'Deli Serdang', '1212', 'SUMATRA UTARA', '12', 0, ''),
(36, 'Langkat', '1213', 'SUMATRA UTARA', '12', 0, ''),
(37, 'Nias Selatan', '1214', 'SUMATRA UTARA', '12', 0, ''),
(38, 'Humbang Hasundutan', '1215', 'SUMATRA UTARA', '12', 0, ''),
(39, 'Pakpak Bharat', '1216', 'SUMATRA UTARA', '12', 0, ''),
(40, 'Samosir', '1217', 'SUMATRA UTARA', '12', 0, ''),
(41, 'Serdang Bedagai', '1218', 'SUMATRA UTARA', '12', 0, ''),
(42, 'Batu Bara', '1219', 'SUMATRA UTARA', '12', 0, ''),
(43, 'Padang Lawas Utara', '1220', 'SUMATRA UTARA', '12', 0, ''),
(44, 'Padang Lawas', '1221', 'SUMATRA UTARA', '12', 0, ''),
(45, 'Labuhan Batu Selatan', '1222', 'SUMATRA UTARA', '12', 0, ''),
(46, 'Labuhan Batu Utara', '1223', 'SUMATRA UTARA', '12', 0, ''),
(47, 'Nias Utara', '1224', 'SUMATRA UTARA', '12', 0, ''),
(48, 'Nias Barat', '1225', 'SUMATRA UTARA', '12', 0, ''),
(49, 'Sibolga', '1271', 'SUMATRA UTARA', '12', 0, ''),
(50, 'Tanjung Balai', '1272', 'SUMATRA UTARA', '12', 0, ''),
(51, 'Pematang Siantar', '1273', 'SUMATRA UTARA', '12', 0, ''),
(52, 'Tebing Tinggi', '1274', 'SUMATRA UTARA', '12', 0, ''),
(53, 'Medan', '1275', 'SUMATRA UTARA', '12', 0, ''),
(54, 'Binjai', '1276', 'SUMATRA UTARA', '12', 0, ''),
(55, 'Padangsidimpuan', '1277', 'SUMATRA UTARA', '12', 0, ''),
(56, 'Gunungsitoli', '1278', 'SUMATRA UTARA', '12', 0, ''),
(57, 'Kepulauan Mentawai', '1301', 'SUMATRA BARAT', '13', 0, ''),
(58, 'Pesisir Selatan', '1302', 'SUMATRA BARAT', '13', 0, ''),
(59, 'Solok', '1303', 'SUMATRA BARAT', '13', 0, ''),
(60, 'Sijunjung', '1304', 'SUMATRA BARAT', '13', 0, ''),
(61, 'Tanah Datar', '1305', 'SUMATRA BARAT', '13', 0, ''),
(62, 'Padang Pariaman', '1306', 'SUMATRA BARAT', '13', 0, ''),
(63, 'Agam', '1307', 'SUMATRA BARAT', '13', 0, ''),
(64, 'Lima Puluh Kota', '1308', 'SUMATRA BARAT', '13', 0, ''),
(65, 'Pasaman', '1309', 'SUMATRA BARAT', '13', 0, ''),
(66, 'Solok Selatan', '1310', 'SUMATRA BARAT', '13', 0, ''),
(67, 'Dharmasraya', '1311', 'SUMATRA BARAT', '13', 0, ''),
(68, 'Pasaman Barat', '1312', 'SUMATRA BARAT', '13', 0, ''),
(69, 'Padang', '1371', 'SUMATRA BARAT', '13', 0, ''),
(70, 'Solok', '1372', 'SUMATRA BARAT', '13', 0, ''),
(71, 'Sawah Lunto', '1373', 'SUMATRA BARAT', '13', 0, ''),
(72, 'Padang Panjang', '1374', 'SUMATRA BARAT', '13', 0, ''),
(73, 'Bukittinggi', '1375', 'SUMATRA BARAT', '13', 0, ''),
(74, 'Payakumbuh', '1376', 'SUMATRA BARAT', '13', 0, ''),
(75, 'Pariaman', '1377', 'SUMATRA BARAT', '13', 0, ''),
(76, 'Kuantan Singingi', '1401', 'RIAU', '14', 0, ''),
(77, 'Indragiri Hulu', '1402', 'RIAU', '14', 0, ''),
(78, 'Indragiri Hilir', '1403', 'RIAU', '14', 0, ''),
(79, 'Pelalawan', '1404', 'RIAU', '14', 0, ''),
(80, 'S I A K', '1405', 'RIAU', '14', 0, ''),
(81, 'Kampar', '1406', 'RIAU', '14', 0, ''),
(82, 'Rokan Hulu', '1407', 'RIAU', '14', 0, ''),
(83, 'Bengkalis', '1408', 'RIAU', '14', 0, ''),
(84, 'Rokan Hilir', '1409', 'RIAU', '14', 0, ''),
(85, 'Kepulauan Meranti', '1410', 'RIAU', '14', 0, ''),
(86, 'Pekanbaru', '1471', 'RIAU', '14', 0, ''),
(87, 'D U M A I', '1473', 'RIAU', '14', 0, ''),
(88, 'Kerinci', '1501', 'JAMBI', '15', 0, ''),
(89, 'Merangin', '1502', 'JAMBI', '15', 0, ''),
(90, 'Sarolangun', '1503', 'JAMBI', '15', 0, ''),
(91, 'Batang Hari', '1504', 'JAMBI', '15', 0, ''),
(92, 'Muaro Jambi', '1505', 'JAMBI', '15', 0, ''),
(93, 'Tanjung Jabung Timur', '1506', 'JAMBI', '15', 0, ''),
(94, 'Tanjung Jabung Barat', '1507', 'JAMBI', '15', 0, ''),
(95, 'Tebo', '1508', 'JAMBI', '15', 0, ''),
(96, 'Bungo', '1509', 'JAMBI', '15', 0, ''),
(97, 'Jambi', '1571', 'JAMBI', '15', 0, ''),
(98, 'Sungai Penuh', '1572', 'JAMBI', '15', 0, ''),
(99, 'Ogan Komering Ulu', '1601', 'SUMATRA SELATAN', '16', 0, ''),
(100, 'Ogan Komering Ilir', '1602', 'SUMATRA SELATAN', '16', 0, ''),
(101, 'Muara Enim', '1603', 'SUMATRA SELATAN', '16', 0, ''),
(102, 'Lahat', '1604', 'SUMATRA SELATAN', '16', 0, ''),
(103, 'Musi Rawas', '1605', 'SUMATRA SELATAN', '16', 0, ''),
(104, 'Musi Banyuasin', '1606', 'SUMATRA SELATAN', '16', 0, ''),
(105, 'Banyu Asin', '1607', 'SUMATRA SELATAN', '16', 0, ''),
(106, 'Ogan Komering Ulu Selatan', '1608', 'SUMATRA SELATAN', '16', 0, ''),
(107, 'Ogan Komering Ulu Timur', '1609', 'SUMATRA SELATAN', '16', 0, ''),
(108, 'Ogan Ilir', '1610', 'SUMATRA SELATAN', '16', 0, ''),
(109, 'Empat Lawang', '1611', 'SUMATRA SELATAN', '16', 0, ''),
(110, 'Palembang', '1671', 'SUMATRA SELATAN', '16', 0, ''),
(111, 'Prabumulih', '1672', 'SUMATRA SELATAN', '16', 0, ''),
(112, 'Pagar Alam', '1673', 'SUMATRA SELATAN', '16', 0, ''),
(113, 'Lubuklinggau', '1674', 'SUMATRA SELATAN', '16', 0, ''),
(114, 'Bengkulu Selatan', '1701', 'BENGKULU', '17', 0, ''),
(115, 'Rejang Lebong', '1702', 'BENGKULU', '17', 0, ''),
(116, 'Bengkulu Utara', '1703', 'BENGKULU', '17', 0, ''),
(117, 'Kaur', '1704', 'BENGKULU', '17', 0, ''),
(118, 'Seluma', '1705', 'BENGKULU', '17', 0, ''),
(119, 'Mukomuko', '1706', 'BENGKULU', '17', 0, ''),
(120, 'Lebong', '1707', 'BENGKULU', '17', 0, ''),
(121, 'Kepahiang', '1708', 'BENGKULU', '17', 0, ''),
(122, 'Bengkulu Tengah', '1709', 'BENGKULU', '17', 0, ''),
(123, 'Bengkulu', '1771', 'BENGKULU', '17', 0, ''),
(124, 'Lampung Barat', '1801', 'LAMPUNG', '18', 0, ''),
(125, 'Tanggamus', '1802', 'LAMPUNG', '18', 0, ''),
(126, 'Lampung Selatan', '1803', 'LAMPUNG', '18', 0, ''),
(127, 'Lampung Timur', '1804', 'LAMPUNG', '18', 0, ''),
(128, 'Lampung Tengah', '1805', 'LAMPUNG', '18', 0, ''),
(129, 'Lampung Utara', '1806', 'LAMPUNG', '18', 0, ''),
(130, 'Way Kanan', '1807', 'LAMPUNG', '18', 0, ''),
(131, 'Tulangbawang', '1808', 'LAMPUNG', '18', 0, ''),
(132, 'Pesawaran', '1809', 'LAMPUNG', '18', 0, ''),
(133, 'Pringsewu', '1810', 'LAMPUNG', '18', 0, ''),
(134, 'Mesuji', '1811', 'LAMPUNG', '18', 0, ''),
(135, 'Tulang Bawang Barat', '1812', 'LAMPUNG', '18', 0, ''),
(136, 'Pesisir Barat', '1813', 'LAMPUNG', '18', 0, ''),
(137, 'Bandar Lampung', '1871', 'LAMPUNG', '18', 0, ''),
(138, 'Metro', '1872', 'LAMPUNG', '18', 0, ''),
(139, 'Bangka', '1901', 'KEPULAUAN BANGKA BELITUNG', '19', 0, ''),
(140, 'Belitung', '1902', 'KEPULAUAN BANGKA BELITUNG', '19', 0, ''),
(141, 'Bangka Barat', '1903', 'KEPULAUAN BANGKA BELITUNG', '19', 0, ''),
(142, 'Bangka Tengah', '1904', 'KEPULAUAN BANGKA BELITUNG', '19', 0, ''),
(143, 'Bangka Selatan', '1905', 'KEPULAUAN BANGKA BELITUNG', '19', 0, ''),
(144, 'Belitung Timur', '1906', 'KEPULAUAN BANGKA BELITUNG', '19', 0, ''),
(145, 'Pangkal Pinang', '1971', 'KEPULAUAN BANGKA BELITUNG', '19', 0, ''),
(146, 'Karimun', '2101', 'KEPULAUAN RIAU', '21', 0, ''),
(147, 'Bintan', '2102', 'KEPULAUAN RIAU', '21', 0, ''),
(148, 'Natuna', '2103', 'KEPULAUAN RIAU', '21', 0, ''),
(149, 'Lingga', '2104', 'KEPULAUAN RIAU', '21', 0, ''),
(150, 'Kepulauan Anambas', '2105', 'KEPULAUAN RIAU', '21', 0, ''),
(151, 'B A T A M', '2171', 'KEPULAUAN RIAU', '21', 0, ''),
(152, 'Tanjung Pinang', '2172', 'KEPULAUAN RIAU', '21', 0, ''),
(153, 'Kepulauan Seribu', '3101', 'DKI JAKARTA', '31', 0, ''),
(154, 'Jakarta Selatan', '3171', 'DKI JAKARTA', '31', 0, ''),
(155, 'Jakarta Timur', '3172', 'DKI JAKARTA', '31', 0, ''),
(156, 'Jakarta Pusat', '3173', 'DKI JAKARTA', '31', 0, ''),
(157, 'Jakarta Barat', '3174', 'DKI JAKARTA', '31', 0, ''),
(158, 'Jakarta Utara', '3175', 'DKI JAKARTA', '31', 0, ''),
(159, 'Bogor', '3201', 'JAWA BARAT    ', '32', 0, ''),
(160, 'Sukabumi', '3202', 'JAWA BARAT    ', '32', 0, ''),
(161, 'Cianjur', '3203', 'JAWA BARAT    ', '32', 0, ''),
(162, 'Bandung', '3204', 'JAWA BARAT    ', '32', 1, ''),
(163, 'Garut', '3205', 'JAWA BARAT    ', '32', 0, ''),
(164, 'Tasikmalaya', '3206', 'JAWA BARAT    ', '32', 0, ''),
(165, 'Ciamis', '3207', 'JAWA BARAT    ', '32', 0, ''),
(166, 'Kuningan', '3208', 'JAWA BARAT    ', '32', 0, ''),
(167, 'Cirebon', '3209', 'JAWA BARAT    ', '32', 0, ''),
(168, 'Majalengka', '3210', 'JAWA BARAT    ', '32', 0, ''),
(169, 'Sumedang', '3211', 'JAWA BARAT    ', '32', 0, ''),
(170, 'Indramayu', '3212', 'JAWA BARAT    ', '32', 0, ''),
(171, 'Subang', '3213', 'JAWA BARAT    ', '32', 0, ''),
(172, 'Purwakarta', '3214', 'JAWA BARAT    ', '32', 0, ''),
(173, 'Karawang', '3215', 'JAWA BARAT    ', '32', 0, ''),
(174, 'Bekasi', '3216', 'JAWA BARAT    ', '32', 0, ''),
(175, 'Bandung Barat', '3217', 'JAWA BARAT    ', '32', 1, ''),
(176, 'Pangandaran', '3218', 'JAWA BARAT    ', '32', 0, ''),
(177, 'Bogor', '3271', 'JAWA BARAT    ', '32', 0, ''),
(178, 'Sukabumi', '3272', 'JAWA BARAT    ', '32', 0, ''),
(179, 'Bandung', '3273', 'JAWA BARAT    ', '32', 1, ''),
(181, 'Bekasi', '3275', 'JAWA BARAT    ', '32', 0, ''),
(182, 'Depok', '3276', 'JAWA BARAT    ', '32', 0, ''),
(183, 'Cimahi', '3277', 'JAWA BARAT    ', '32', 0, ''),
(184, 'Tasikmalaya', '3278', 'JAWA BARAT    ', '32', 0, ''),
(185, 'Banjar', '3279', 'JAWA BARAT    ', '32', 0, ''),
(186, 'Cilacap', '3301', 'JAWA TENGAH', '33', 0, ''),
(187, 'Banyumas', '3302', 'JAWA TENGAH', '33', 0, ''),
(188, 'Purbalingga', '3303', 'JAWA TENGAH', '33', 0, ''),
(189, 'Banjarnegara', '3304', 'JAWA TENGAH', '33', 0, ''),
(190, 'Kebumen', '3305', 'JAWA TENGAH', '33', 0, ''),
(191, 'Purworejo', '3306', 'JAWA TENGAH', '33', 0, ''),
(192, 'Wonosobo', '3307', 'JAWA TENGAH', '33', 0, ''),
(193, 'Magelang', '3308', 'JAWA TENGAH', '33', 0, ''),
(194, 'Boyolali', '3309', 'JAWA TENGAH', '33', 0, ''),
(195, 'Klaten', '3310', 'JAWA TENGAH', '33', 0, ''),
(196, 'Sukoharjo', '3311', 'JAWA TENGAH', '33', 0, ''),
(197, 'Wonogiri', '3312', 'JAWA TENGAH', '33', 0, ''),
(198, 'Karanganyar', '3313', 'JAWA TENGAH', '33', 0, ''),
(199, 'Sragen', '3314', 'JAWA TENGAH', '33', 0, ''),
(200, 'Grobogan', '3315', 'JAWA TENGAH', '33', 0, ''),
(201, 'Blora', '3316', 'JAWA TENGAH', '33', 0, ''),
(202, 'Rembang', '3317', 'JAWA TENGAH', '33', 0, ''),
(203, 'Pati', '3318', 'JAWA TENGAH', '33', 0, ''),
(204, 'Kudus', '3319', 'JAWA TENGAH', '33', 0, ''),
(205, 'Jepara', '3320', 'JAWA TENGAH', '33', 0, ''),
(206, 'Demak', '3321', 'JAWA TENGAH', '33', 0, ''),
(207, 'Semarang', '3322', 'JAWA TENGAH', '33', 0, ''),
(208, 'Temanggung', '3323', 'JAWA TENGAH', '33', 0, ''),
(209, 'Kendal', '3324', 'JAWA TENGAH', '33', 0, ''),
(210, 'Batang', '3325', 'JAWA TENGAH', '33', 0, ''),
(211, 'Pekalongan', '3326', 'JAWA TENGAH', '33', 0, ''),
(212, 'Pemalang', '3327', 'JAWA TENGAH', '33', 0, ''),
(213, 'Tegal', '3328', 'JAWA TENGAH', '33', 0, ''),
(214, 'Brebes', '3329', 'JAWA TENGAH', '33', 0, ''),
(215, 'Magelang', '3371', 'JAWA TENGAH', '33', 0, ''),
(216, 'Surakarta', '3372', 'JAWA TENGAH', '33', 0, ''),
(217, 'Salatiga', '3373', 'JAWA TENGAH', '33', 0, ''),
(218, 'Semarang', '3374', 'JAWA TENGAH', '33', 0, ''),
(219, 'Pekalongan', '3375', 'JAWA TENGAH', '33', 0, ''),
(220, 'Tegal', '3376', 'JAWA TENGAH', '33', 0, ''),
(221, 'Kulon Progo', '3401', 'D.I YOGYAKARTA', '34', 0, ''),
(222, 'Bantul', '3402', 'D.I YOGYAKARTA', '34', 0, ''),
(223, 'Gunung Kidul', '3403', 'D.I YOGYAKARTA', '34', 0, ''),
(224, 'Sleman', '3404', 'D.I YOGYAKARTA', '34', 0, ''),
(225, 'Yogyakarta', '3471', 'D.I YOGYAKARTA', '34', 0, ''),
(226, 'Pacitan', '3501', 'JAWA TIMUR', '35', 0, ''),
(227, 'Ponorogo', '3502', 'JAWA TIMUR', '35', 0, ''),
(228, 'Trenggalek', '3503', 'JAWA TIMUR', '35', 0, ''),
(229, 'Tulungagung', '3504', 'JAWA TIMUR', '35', 0, ''),
(230, 'Blitar', '3505', 'JAWA TIMUR', '35', 0, ''),
(231, 'Kediri', '3506', 'JAWA TIMUR', '35', 0, ''),
(232, 'Malang', '3507', 'JAWA TIMUR', '35', 0, ''),
(233, 'Lumajang', '3508', 'JAWA TIMUR', '35', 0, ''),
(234, 'Jember', '3509', 'JAWA TIMUR', '35', 0, ''),
(235, 'Banyuwangi', '3510', 'JAWA TIMUR', '35', 0, ''),
(236, 'Bondowoso', '3511', 'JAWA TIMUR', '35', 0, ''),
(237, 'Situbondo', '3512', 'JAWA TIMUR', '35', 0, ''),
(238, 'Probolinggo', '3513', 'JAWA TIMUR', '35', 0, ''),
(239, 'Pasuruan', '3514', 'JAWA TIMUR', '35', 0, ''),
(240, 'Sidoarjo', '3515', 'JAWA TIMUR', '35', 0, ''),
(241, 'Mojokerto', '3516', 'JAWA TIMUR', '35', 0, ''),
(242, 'Jombang', '3517', 'JAWA TIMUR', '35', 0, ''),
(243, 'Nganjuk', '3518', 'JAWA TIMUR', '35', 0, ''),
(244, 'Madiun', '3519', 'JAWA TIMUR', '35', 0, ''),
(245, 'Magetan', '3520', 'JAWA TIMUR', '35', 0, ''),
(246, 'Ngawi', '3521', 'JAWA TIMUR', '35', 0, ''),
(247, 'Bojonegoro', '3522', 'JAWA TIMUR', '35', 0, ''),
(248, 'Tuban', '3523', 'JAWA TIMUR', '35', 0, ''),
(249, 'Lamongan', '3524', 'JAWA TIMUR', '35', 0, ''),
(250, 'Gresik', '3525', 'JAWA TIMUR', '35', 0, ''),
(251, 'Bangkalan', '3526', 'JAWA TIMUR', '35', 0, ''),
(252, 'Sampang', '3527', 'JAWA TIMUR', '35', 0, ''),
(253, 'Pamekasan', '3528', 'JAWA TIMUR', '35', 0, ''),
(254, 'Sumenep', '3529', 'JAWA TIMUR', '35', 0, ''),
(255, 'Kediri', '3571', 'JAWA TIMUR', '35', 0, ''),
(256, 'Blitar', '3572', 'JAWA TIMUR', '35', 0, ''),
(257, 'Malang', '3573', 'JAWA TIMUR', '35', 0, ''),
(258, 'Probolinggo', '3574', 'JAWA TIMUR', '35', 0, ''),
(259, 'Pasuruan', '3575', 'JAWA TIMUR', '35', 0, ''),
(260, 'Mojokerto', '3576', 'JAWA TIMUR', '35', 0, ''),
(261, 'Madiun', '3577', 'JAWA TIMUR', '35', 0, ''),
(262, 'Surabaya', '3578', 'JAWA TIMUR', '35', 0, ''),
(263, 'Batu', '3579', 'JAWA TIMUR', '35', 0, ''),
(264, 'Pandeglang', '3601', 'BANTEN', '36', 0, ''),
(265, 'Lebak', '3602', 'BANTEN', '36', 0, ''),
(266, 'Tangerang', '3603', 'BANTEN', '36', 0, ''),
(267, 'Serang', '3604', 'BANTEN', '36', 0, ''),
(268, 'Tangerang', '3671', 'BANTEN', '36', 0, ''),
(269, 'Cilegon', '3672', 'BANTEN', '36', 0, ''),
(270, 'Serang', '3673', 'BANTEN', '36', 0, ''),
(271, 'Tangerang Selatan', '3674', 'BANTEN', '36', 0, ''),
(272, 'Jembrana', '5101', 'BALI', '51', 0, ''),
(273, 'Tabanan', '5102', 'BALI', '51', 0, ''),
(274, 'Badung', '5103', 'BALI', '51', 0, ''),
(275, 'Gianyar', '5104', 'BALI', '51', 0, ''),
(276, 'Klungkung', '5105', 'BALI', '51', 0, ''),
(277, 'Bangli', '5106', 'BALI', '51', 0, ''),
(278, 'Karang Asem', '5107', 'BALI', '51', 0, ''),
(279, 'Buleleng', '5108', 'BALI', '51', 0, ''),
(280, 'Denpasar', '5171', 'BALI', '51', 0, ''),
(281, 'Lombok Barat', '5201', 'NUSA TENGGARA BARAT', '52', 0, ''),
(282, 'Lombok Tengah', '5202', 'NUSA TENGGARA BARAT', '52', 0, ''),
(283, 'Lombok Timur', '5203', 'NUSA TENGGARA BARAT', '52', 0, ''),
(284, 'Sumbawa', '5204', 'NUSA TENGGARA BARAT', '52', 0, ''),
(285, 'Dompu', '5205', 'NUSA TENGGARA BARAT', '52', 0, ''),
(286, 'Bima', '5206', 'NUSA TENGGARA BARAT', '52', 0, ''),
(287, 'Sumbawa Barat', '5207', 'NUSA TENGGARA BARAT', '52', 0, ''),
(288, 'Lombok Utara', '5208', 'NUSA TENGGARA BARAT', '52', 0, ''),
(289, 'Mataram', '5271', 'NUSA TENGGARA BARAT', '52', 0, ''),
(290, 'Bima', '5272', 'NUSA TENGGARA BARAT', '52', 0, ''),
(291, 'Sumba Barat', '5301', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(292, 'Sumba Timur', '5302', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(293, 'Kupang', '5303', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(294, 'Timor Tengah Selatan', '5304', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(295, 'Timor Tengah Utara', '5305', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(296, 'Belu', '5306', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(297, 'Belu                                         ', '5306', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(298, 'Alor', '5307', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(299, 'Lembata', '5308', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(300, 'Flores Timur', '5309', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(301, 'Sikka', '5310', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(302, 'Ende', '5311', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(303, 'Ngada', '5312', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(304, 'Manggarai', '5313', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(305, 'Rote Ndao', '5314', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(306, 'Manggarai Barat', '5315', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(307, 'Sumba Tengah', '5316', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(308, 'Sumba Barat Daya', '5317', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(309, 'Nagekeo', '5318', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(310, 'Manggarai Timur', '5319', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(311, 'Sabu Raijua', '5320', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(312, 'Kupang', '5371', 'NUSA TENGGARA TIMUR', '53', 0, ''),
(313, 'Sambas', '6101', 'KALIMANTAN BARAT', '61', 0, ''),
(314, 'Bengkayang', '6102', 'KALIMANTAN BARAT', '61', 0, ''),
(315, 'Landak', '6103', 'KALIMANTAN BARAT', '61', 0, ''),
(316, 'Pontianak', '6104', 'KALIMANTAN BARAT', '61', 0, ''),
(317, 'Sanggau', '6105', 'KALIMANTAN BARAT', '61', 0, ''),
(318, 'Ketapang', '6106', 'KALIMANTAN BARAT', '61', 0, ''),
(319, 'Sintang', '6107', 'KALIMANTAN BARAT', '61', 0, ''),
(320, 'Kapuas Hulu', '6108', 'KALIMANTAN BARAT', '61', 0, ''),
(321, 'Sekadau', '6109', 'KALIMANTAN BARAT', '61', 0, ''),
(322, 'Melawi', '6110', 'KALIMANTAN BARAT', '61', 0, ''),
(323, 'Kayong Utara', '6111', 'KALIMANTAN BARAT', '61', 0, ''),
(324, 'Kubu Raya', '6112', 'KALIMANTAN BARAT', '61', 0, ''),
(325, 'Pontianak', '6171', 'KALIMANTAN BARAT', '61', 0, ''),
(326, 'Singkawang', '6172', 'KALIMANTAN BARAT', '61', 0, ''),
(327, 'Kotawaringin Barat', '6201', 'KALIMANTAN TENGAH', '62', 0, ''),
(328, 'Kotawaringin Timur', '6202', 'KALIMANTAN TENGAH', '62', 0, ''),
(329, 'Kapuas', '6203', 'KALIMANTAN TENGAH', '62', 0, ''),
(330, 'Barito Selatan', '6204', 'KALIMANTAN TENGAH', '62', 0, ''),
(331, 'Barito Utara', '6205', 'KALIMANTAN TENGAH', '62', 0, ''),
(332, 'Sukamara', '6206', 'KALIMANTAN TENGAH', '62', 0, ''),
(333, 'Lamandau', '6207', 'KALIMANTAN TENGAH', '62', 0, ''),
(334, 'Seruyan', '6208', 'KALIMANTAN TENGAH', '62', 0, ''),
(335, 'Katingan', '6209', 'KALIMANTAN TENGAH', '62', 0, ''),
(336, 'Pulang Pisau', '6210', 'KALIMANTAN TENGAH', '62', 0, ''),
(337, 'Gunung Mas', '6211', 'KALIMANTAN TENGAH', '62', 0, ''),
(338, 'Barito Timur', '6212', 'KALIMANTAN TENGAH', '62', 0, ''),
(339, 'Murung Raya', '6213', 'KALIMANTAN TENGAH', '62', 0, ''),
(340, 'Palangka Raya', '6271', 'KALIMANTAN TENGAH', '62', 0, ''),
(341, 'Tanah Laut', '6301', 'KALIMANTAN SELATAN', '63', 0, ''),
(342, 'Kota Baru', '6302', 'KALIMANTAN SELATAN', '63', 0, ''),
(343, 'Banjar', '6303', 'KALIMANTAN SELATAN', '63', 0, ''),
(344, 'Barito Kuala', '6304', 'KALIMANTAN SELATAN', '63', 0, ''),
(345, 'Tapin', '6305', 'KALIMANTAN SELATAN', '63', 0, ''),
(346, 'Hulu Sungai Selatan', '6306', 'KALIMANTAN SELATAN', '63', 0, ''),
(347, 'Hulu Sungai Tengah', '6307', 'KALIMANTAN SELATAN', '63', 0, ''),
(348, 'Hulu Sungai Utara', '6308', 'KALIMANTAN SELATAN', '63', 0, ''),
(349, 'Tabalong', '6309', 'KALIMANTAN SELATAN', '63', 0, ''),
(350, 'Tanah Bumbu', '6310', 'KALIMANTAN SELATAN', '63', 0, ''),
(351, 'Balangan', '6311', 'KALIMANTAN SELATAN', '63', 0, ''),
(352, 'Banjarmasin', '6371', 'KALIMANTAN SELATAN', '63', 0, ''),
(353, 'Banjar Baru', '6372', 'KALIMANTAN SELATAN', '63', 0, ''),
(354, 'Paser', '6401', 'KALIMANTAN TIMUR', '64', 0, ''),
(355, 'Kutai Barat', '6402', 'KALIMANTAN TIMUR', '64', 0, ''),
(356, 'Kutai Kartanegara', '6403', 'KALIMANTAN TIMUR', '64', 0, ''),
(357, 'Kutai Timur', '6404', 'KALIMANTAN TIMUR', '64', 0, ''),
(358, 'Berau', '6405', 'KALIMANTAN TIMUR', '64', 0, ''),
(359, 'Penajam Paser Utara', '6409', 'KALIMANTAN TIMUR', '64', 0, ''),
(360, 'Balikpapan', '6471', 'KALIMANTAN TIMUR', '64', 0, ''),
(361, 'Samarinda', '6472', 'KALIMANTAN TIMUR', '64', 0, ''),
(362, 'Bontang', '6474', 'KALIMANTAN TIMUR', '64', 0, ''),
(363, 'Malinau', '6501', 'KALIMANTAN UTARA', '65', 0, ''),
(364, 'Bulungan', '6502', 'KALIMANTAN UTARA', '65', 0, ''),
(365, 'Tana Tidung', '6503', 'KALIMANTAN UTARA', '65', 0, ''),
(366, 'Nunukan', '6504', 'KALIMANTAN UTARA', '65', 0, ''),
(367, 'Tarakan', '6571', 'KALIMANTAN UTARA', '65', 0, ''),
(368, 'Bolaang Mongondow', '7101', 'SULAWESI UTARA', '71', 0, ''),
(369, 'Minahasa', '7102', 'SULAWESI UTARA', '71', 0, ''),
(370, 'Kepulauan Sangihe', '7103', 'SULAWESI UTARA', '71', 0, ''),
(371, 'Kepulauan Talaud', '7104', 'SULAWESI UTARA', '71', 0, ''),
(372, 'Minahasa Selatan', '7105', 'SULAWESI UTARA', '71', 0, ''),
(373, 'Minahasa Utara', '7106', 'SULAWESI UTARA', '71', 0, ''),
(374, 'Bolaang Mongondow Utara', '7107', 'SULAWESI UTARA', '71', 0, ''),
(375, 'Siau Tagulandang Biaro', '7108', 'SULAWESI UTARA', '71', 0, ''),
(376, 'Minahasa Tenggara', '7109', 'SULAWESI UTARA', '71', 0, ''),
(377, 'Bolaang Mongondow Selatan', '7110', 'SULAWESI UTARA', '71', 0, ''),
(378, 'Bolaang Mongondow Timur', '7111', 'SULAWESI UTARA', '71', 0, ''),
(379, 'Manado', '7171', 'SULAWESI UTARA', '71', 0, ''),
(380, 'Bitung', '7172', 'SULAWESI UTARA', '71', 0, ''),
(381, 'Tomohon', '7173', 'SULAWESI UTARA', '71', 0, ''),
(382, 'Kotamobagu', '7174', 'SULAWESI UTARA', '71', 0, ''),
(383, 'Banggai Kepulauan', '7201', 'SULAWESI TENGAH', '72', 0, ''),
(384, 'Banggai', '7202', 'SULAWESI TENGAH', '72', 0, ''),
(385, 'Morowali', '7203', 'SULAWESI TENGAH', '72', 0, ''),
(386, 'Poso', '7204', 'SULAWESI TENGAH', '72', 0, ''),
(387, 'Donggala', '7205', 'SULAWESI TENGAH', '72', 0, ''),
(388, 'Toli-toli', '7206', 'SULAWESI TENGAH', '72', 0, ''),
(389, 'Buol', '7207', 'SULAWESI TENGAH', '72', 0, ''),
(390, 'Parigi Moutong', '7208', 'SULAWESI TENGAH', '72', 0, ''),
(391, 'Tojo Una-una', '7209', 'SULAWESI TENGAH', '72', 0, ''),
(392, 'Sigi', '7210', 'SULAWESI TENGAH', '72', 0, ''),
(393, 'Palu', '7271', 'SULAWESI TENGAH', '72', 0, ''),
(394, 'Kepulauan Selayar', '7301', 'SULAWESI SELATAN', '73', 0, ''),
(395, 'Bulukumba', '7302', 'SULAWESI SELATAN', '73', 0, ''),
(396, 'Bantaeng', '7303', 'SULAWESI SELATAN', '73', 0, ''),
(397, 'Jeneponto', '7304', 'SULAWESI SELATAN', '73', 0, ''),
(398, 'Takalar', '7305', 'SULAWESI SELATAN', '73', 0, ''),
(399, 'Gowa', '7306', 'SULAWESI SELATAN', '73', 0, ''),
(400, 'Sinjai', '7307', 'SULAWESI SELATAN', '73', 0, ''),
(401, 'Maros', '7308', 'SULAWESI SELATAN', '73', 0, ''),
(402, 'Pangkajene Dan Kepulauan', '7309', 'SULAWESI SELATAN', '73', 0, ''),
(403, 'Barru', '7310', 'SULAWESI SELATAN', '73', 0, ''),
(404, 'Bone', '7311', 'SULAWESI SELATAN', '73', 0, ''),
(405, 'Soppeng', '7312', 'SULAWESI SELATAN', '73', 0, ''),
(406, 'Wajo', '7313', 'SULAWESI SELATAN', '73', 0, ''),
(407, 'Sidenreng Rappang', '7314', 'SULAWESI SELATAN', '73', 0, ''),
(408, 'Pinrang', '7315', 'SULAWESI SELATAN', '73', 0, ''),
(409, 'Enrekang', '7316', 'SULAWESI SELATAN', '73', 0, ''),
(410, 'Luwu', '7317', 'SULAWESI SELATAN', '73', 0, ''),
(411, 'Tana Toraja', '7318', 'SULAWESI SELATAN', '73', 0, ''),
(412, 'Luwu Utara', '7322', 'SULAWESI SELATAN', '73', 0, ''),
(413, 'Luwu Timur', '7325', 'SULAWESI SELATAN', '73', 0, ''),
(414, 'Toraja Utara', '7326', 'SULAWESI SELATAN', '73', 0, ''),
(415, 'Makassar', '7371', 'SULAWESI SELATAN', '73', 0, ''),
(416, 'Parepare', '7372', 'SULAWESI SELATAN', '73', 0, ''),
(417, 'Palopo', '7373', 'SULAWESI SELATAN', '73', 0, ''),
(418, 'Buton', '7401', 'SULAWESI TENGGARA', '74', 0, ''),
(419, 'Muna', '7402', 'SULAWESI TENGGARA', '74', 0, ''),
(420, 'Konawe', '7403', 'SULAWESI TENGGARA', '74', 0, ''),
(421, 'Kolaka', '7404', 'SULAWESI TENGGARA', '74', 0, ''),
(422, 'Konawe Selatan', '7405', 'SULAWESI TENGGARA', '74', 0, ''),
(423, 'Bombana', '7406', 'SULAWESI TENGGARA', '74', 0, ''),
(424, 'Wakatobi', '7407', 'SULAWESI TENGGARA', '74', 0, ''),
(425, 'Kolaka Utara', '7408', 'SULAWESI TENGGARA', '74', 0, ''),
(426, 'Buton Utara', '7409', 'SULAWESI TENGGARA', '74', 0, ''),
(427, 'Konawe Utara', '7410', 'SULAWESI TENGGARA', '74', 0, ''),
(428, 'Kendari', '7471', 'SULAWESI TENGGARA', '74', 0, ''),
(429, 'Baubau', '7472', 'SULAWESI TENGGARA', '74', 0, ''),
(430, 'Boalemo', '7501', 'GORONTALO', '75', 0, ''),
(431, 'Gorontalo', '7502', 'GORONTALO', '75', 0, ''),
(432, 'Pohuwato', '7503', 'GORONTALO', '75', 0, ''),
(433, 'Bone Bolango', '7504', 'GORONTALO', '75', 0, ''),
(434, 'Gorontalo Utara', '7505', 'GORONTALO', '75', 0, ''),
(435, 'Gorontalo', '7571', 'GORONTALO', '75', 0, ''),
(436, 'Majene', '7601', 'SULAWESI BARAT', '76', 0, ''),
(437, 'Polewali Mandar', '7602', 'SULAWESI BARAT', '76', 0, ''),
(438, 'Mamasa', '7603', 'SULAWESI BARAT', '76', 0, ''),
(439, 'Mamuju', '7604', 'SULAWESI BARAT', '76', 0, ''),
(440, 'Mamuju Utara', '7605', 'SULAWESI BARAT', '76', 0, ''),
(441, 'Maluku Tenggara Barat', '8101', 'MALUKU', '81', 0, ''),
(442, 'Maluku Tenggara', '8102', 'MALUKU', '81', 0, ''),
(443, 'Maluku Tengah', '8103', 'MALUKU', '81', 0, ''),
(444, 'Buru', '8104', 'MALUKU', '81', 0, ''),
(445, 'Kepulauan Aru', '8105', 'MALUKU', '81', 0, ''),
(446, 'Seram Bagian Barat', '8106', 'MALUKU', '81', 0, ''),
(447, 'Seram Bagian Timur', '8107', 'MALUKU', '81', 0, ''),
(448, 'Maluku Barat Daya', '8108', 'MALUKU', '81', 0, ''),
(449, 'Buru Selatan', '8109', 'MALUKU', '81', 0, ''),
(450, 'Ambon', '8171', 'MALUKU', '81', 0, ''),
(451, 'Tual', '8172', 'MALUKU', '81', 0, ''),
(452, 'Halmahera Barat', '8201', 'MALUKU UTARA', '82', 0, ''),
(453, 'Halmahera Tengah', '8202', 'MALUKU UTARA', '82', 0, ''),
(454, 'Kepulauan Sula', '8203', 'MALUKU UTARA', '82', 0, ''),
(455, 'Halmahera Selatan', '8204', 'MALUKU UTARA', '82', 0, ''),
(456, 'Halmahera Utara', '8205', 'MALUKU UTARA', '82', 0, ''),
(457, 'Halmahera Timur', '8206', 'MALUKU UTARA', '82', 0, ''),
(458, 'Pulau Morotai', '8207', 'MALUKU UTARA', '82', 0, ''),
(459, 'Ternate', '8271', 'MALUKU UTARA', '82', 0, ''),
(460, 'Tidore Kepulauan', '8272', 'MALUKU UTARA', '82', 0, ''),
(461, 'Fakfak', '9101', 'PAPUA BARAT', '91', 0, ''),
(462, 'Kaimana', '9102', 'PAPUA BARAT', '91', 0, ''),
(463, 'Teluk Wondama', '9103', 'PAPUA BARAT', '91', 0, ''),
(464, 'Teluk Bintuni', '9104', 'PAPUA BARAT', '91', 0, ''),
(465, 'Manokwari', '9105', 'PAPUA BARAT', '91', 0, ''),
(466, 'Sorong Selatan', '9106', 'PAPUA BARAT', '91', 0, ''),
(467, 'Sorong', '9107', 'PAPUA BARAT', '91', 0, ''),
(468, 'Raja Ampat', '9108', 'PAPUA BARAT', '91', 0, ''),
(469, 'Tambrauw', '9109', 'PAPUA BARAT', '91', 0, ''),
(470, 'Maybrat', '9110', 'PAPUA BARAT', '91', 0, ''),
(471, 'Sorong', '9171', 'PAPUA BARAT', '91', 0, ''),
(472, 'Merauke', '9401', 'PAPUA', '94', 0, ''),
(473, 'Jayawijaya', '9402', 'PAPUA', '94', 0, ''),
(474, 'Jayapura', '9403', 'PAPUA', '94', 0, ''),
(475, 'Nabire', '9404', 'PAPUA', '94', 0, ''),
(476, 'Kepulauan Yapen', '9408', 'PAPUA', '94', 0, ''),
(477, 'Biak Numfor', '9409', 'PAPUA', '94', 0, ''),
(478, 'Paniai', '9410', 'PAPUA', '94', 0, ''),
(479, 'Puncak Jaya', '9411', 'PAPUA', '94', 0, ''),
(480, 'Mimika', '9412', 'PAPUA', '94', 0, ''),
(481, 'Boven Digoel', '9413', 'PAPUA', '94', 0, ''),
(482, 'Mappi', '9414', 'PAPUA', '94', 0, ''),
(483, 'Asmat', '9415', 'PAPUA', '94', 0, ''),
(484, 'Yahukimo', '9416', 'PAPUA', '94', 0, ''),
(485, 'Pegunungan Bintang', '9417', 'PAPUA', '94', 0, ''),
(486, 'Tolikara', '9418', 'PAPUA', '94', 0, ''),
(487, 'Sarmi', '9419', 'PAPUA', '94', 0, ''),
(488, 'Keerom', '9420', 'PAPUA', '94', 0, ''),
(489, 'Waropen', '9426', 'PAPUA', '94', 0, ''),
(490, 'Supiori', '9427', 'PAPUA', '94', 0, ''),
(491, 'Mamberamo Raya', '9428', 'PAPUA', '94', 0, ''),
(492, 'Nduga', '9429', 'PAPUA', '94', 0, ''),
(493, 'Lanny Jaya', '9430', 'PAPUA', '94', 0, ''),
(494, 'Mamberamo Tengah', '9431', 'PAPUA', '94', 0, ''),
(495, 'Yalimo', '9432', 'PAPUA', '94', 0, ''),
(496, 'Puncak', '9433', 'PAPUA', '94', 0, ''),
(497, 'Dogiyai', '9434', 'PAPUA', '94', 0, ''),
(498, 'Intan Jaya', '9435', 'PAPUA', '94', 0, ''),
(499, 'Deiyai', '9436', 'PAPUA', '94', 0, ''),
(500, 'Jayapura', '9471', 'PAPUA', '94', 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_autologin`
--

CREATE TABLE IF NOT EXISTS `auth_autologin` (
  `user` int(11) NOT NULL,
  `series` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`user`,`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users`
--

CREATE TABLE IF NOT EXISTS `auth_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(15) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `investor_password` varchar(255) NOT NULL,
  `lang` varchar(2) DEFAULT NULL,
  `registered` datetime NOT NULL,
  `active` enum('0','1') NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `approval` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `auth_users`
--

INSERT INTO `auth_users` (`id`, `title`, `first_name`, `last_name`, `username`, `email`, `password`, `investor_password`, `lang`, `registered`, `active`, `role_id`, `approval`) VALUES
(1, '', 'Administrator', 'Tea', 'admin', 'admin@vmt.co.id', '$2a$08$dxSn4NG3GUxu3XGLr4niIuemUHBohdWdBobNsRi6WpBE.h8zHNmXO', '', 'id', '2012-03-15 19:23:59', '1', 1, 0),
(2, 'Mr.', 'jafar', 'Sidik', '79540', 'mjsnux@gmail.com', '$2a$08$DqqcJr4c/r/kcshxj2ICUeG3fm14sEPew.UdFhXBRiIjL.QU8xHj.', 'qnfvPj', 'id', '2013-10-30 08:23:22', '1', 6, 0),
(3, 'Mr.', 'jafar', 'sidik', '88591', 'admin@admin.com', '', '', 'id', '2013-10-30 11:56:34', '0', 2, 0),
(4, 'Mr.', 'vxc', 'xcv', '94288', 'xc@gmail.com', '', '', 'id', '2013-10-30 11:59:39', '0', 2, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users_master`
--

CREATE TABLE IF NOT EXISTS `auth_users_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registered` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1703 ;

--
-- Dumping data untuk tabel `auth_users_master`
--

INSERT INTO `auth_users_master` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `registered`) VALUES
(1002, 'Diane', 'Murphy', 'dmurphy', 'dmurphy@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1056, 'Mary', 'Patterson', 'mpatterso', 'mpatterso@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1076, 'Jeff', 'Firrelli', 'jeff.firrelli', 'jeff.firrelli@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1088, 'William', 'Patterson', 'wpatterson', 'wpatterson@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1102, 'Gerard', 'Bondur', 'gbondur', 'gbondur@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1143, 'Anthony', 'Bow', 'abow', 'abow@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1165, 'Leslie', 'Jennings', 'ljennings', 'ljennings@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1166, 'Leslie', 'Thompson', 'lthompson', 'lthompson@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1188, 'Julie', 'Firrelli', 'julie.firrelli', 'julie.firrelli@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1216, 'Steve', 'Patterson', 'spatterson', 'spatterson@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1286, 'Foon Yue', 'Tseng', 'ftseng', 'ftseng@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1323, 'George', 'Vanauf', 'gvanauf', 'gvanauf@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1337, 'Loui', 'Bondur', 'lbondur', 'lbondur@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1370, 'Gerard', 'Hernandez', 'ghernande', 'ghernande@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1401, 'Pamela', 'Castillo', 'pcastillo', 'pcastillo@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1501, 'Larry', 'Bott', 'lbott', 'lbott@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1504, 'Barry', 'Jones', 'bjones', 'bjones@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1611, 'Andy', 'Fixter', 'afixter', 'afixter@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1612, 'Peter', 'Marsh', 'pmarsh', 'pmarsh@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1619, 'Tom', 'King', 'tking', 'tking@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1621, 'Mami', 'Nishi', 'mnishi', 'mnishi@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1625, 'Yoshimi', 'Kato', 'ykato', 'ykato@classicmodelcars.com', '', '2012-03-01 05:54:30'),
(1702, 'Martin', 'Gerard', 'mgerard', 'mgerard@classicmodelcars.com', '', '2012-03-01 05:54:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('1bc8c0d9e6c5d84543fdc351833d7d22', '::1', 'Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Firefox/24.0', 1383195536, 'a:7:{s:9:"user_data";s:0:"";s:9:"role_name";s:13:"Administrator";s:9:"auth_user";s:1:"1";s:13:"auth_loggedin";b:1;s:4:"lang";s:2:"id";s:7:"role_id";s:1:"1";s:14:"flash:old:info";s:20:"Rule telah diupdate.";}'),
('57f230051b894b8eed2018b9f23f8410', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36', 1383193050, 'a:2:{s:9:"user_data";s:0:"";s:9:"role_name";s:5:"Guest";}'),
('b79b8a59f8980ed1087cd1e2d1325de3', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36', 1383200114, 'a:6:{s:9:"user_data";s:0:"";s:9:"role_name";s:12:"Live Account";s:9:"auth_user";s:1:"2";s:13:"auth_loggedin";b:1;s:4:"lang";s:2:"id";s:7:"role_id";s:1:"6";}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=240 ;

--
-- Dumping data untuk tabel `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Struktur dari tabel `demo_account`
--

CREATE TABLE IF NOT EXISTS `demo_account` (
  `email` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `tanggal_lahir` varchar(5) NOT NULL,
  `bulan_lahir` varchar(5) NOT NULL,
  `tahun_lahir` varchar(8) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `balance` varchar(30) DEFAULT NULL,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `demo_account`
--

INSERT INTO `demo_account` (`email`, `city`, `tanggal_lahir`, `bulan_lahir`, `tahun_lahir`, `phone`, `balance`) VALUES
('admin@admin.com', 'Kab. Simeulue', '12', '12', '1212', '1212', '$5000'),
('mjsnux@gmail.com', 'Kota Binjai', '1', '1', '1945', '083815644435', '$30000'),
('xc@gmail.com', 'Kab. Aceh Selatan', '12', '12', '12', '1212121', '$10000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `link`
--

CREATE TABLE IF NOT EXISTS `link` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data untuk tabel `link`
--

INSERT INTO `link` (`id`, `link`) VALUES
(11, 'http://localhost/client.mysmartfx/index.php/demo/demo/active?key=''92224'''),
(12, 'http://localhost/client.mysmartfx/index.php/demo/demo/active/?key=''76790'''),
(13, 'http://localhost/client.mysmartfx/index.php/demo/demo/active/?key=97213'),
(14, 'http://localhost/client.mysmartfx/index.php/demo/demo/active/?key=78322'),
(15, 'http://localhost/client.mysmartfx/index.php/demo/demo/active/?key=99175'),
(16, 'http://localhost/client.mysmartfx/index.php/demo/demo/active/?key=85758'),
(17, 'http://localhost/client.mysmartfx/index.php/demo/demo/active/?key=84113');

-- --------------------------------------------------------

--
-- Struktur dari tabel `live_account`
--

CREATE TABLE IF NOT EXISTS `live_account` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `reg_option` enum('Individual','Join') NOT NULL,
  `type_account` varchar(30) NOT NULL,
  `tanggal_lahir` varchar(5) NOT NULL,
  `bulan_lahir` varchar(20) NOT NULL,
  `tahun_lahir` varchar(15) NOT NULL,
  `personal_name` varchar(50) DEFAULT NULL,
  `personal_idnumber` varchar(100) NOT NULL,
  `personal_iddocument` varchar(150) DEFAULT NULL,
  `personal_citizenship` varchar(40) DEFAULT NULL,
  `contact_info_email` varchar(50) DEFAULT NULL,
  `contact_info_address` text,
  `contact_info_country` varchar(20) DEFAULT NULL,
  `contact_info_provinsi` varchar(40) DEFAULT NULL,
  `contact_info_city` varchar(50) DEFAULT NULL,
  `contact_info_zip` int(20) DEFAULT NULL,
  `contact_info_phone` varchar(50) DEFAULT NULL,
  `contact_info_mobile` varchar(50) DEFAULT NULL,
  `contact_info_fax` varchar(50) DEFAULT NULL,
  `contact_info_correspondence` varchar(50) DEFAULT NULL,
  `contact_info_profofresidance` varchar(50) DEFAULT NULL,
  `account_info_agentcode` varchar(50) DEFAULT NULL,
  `bank_info_bankname` varchar(50) DEFAULT NULL,
  `bank_info_bankaddress` text,
  `bank_info_bankswiftcode` varchar(200) DEFAULT NULL,
  `bank_info_bankaccount` varchar(100) DEFAULT NULL,
  `bank_info_bankaccountholder` varchar(100) DEFAULT NULL,
  `tranding_info_annualincome` varchar(200) DEFAULT NULL,
  `tranding_info_trandingexperience` varchar(200) DEFAULT NULL,
  `tranding_info_invenstments` varchar(20) DEFAULT NULL,
  `tranding_info_riskprofile` varchar(20) DEFAULT NULL,
  `additional_info_manageaccount` varchar(50) DEFAULT NULL,
  `additional_info_website` varchar(50) DEFAULT NULL,
  `additional_info_aboutme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data untuk tabel `live_account`
--

INSERT INTO `live_account` (`id`, `reg_option`, `type_account`, `tanggal_lahir`, `bulan_lahir`, `tahun_lahir`, `personal_name`, `personal_idnumber`, `personal_iddocument`, `personal_citizenship`, `contact_info_email`, `contact_info_address`, `contact_info_country`, `contact_info_provinsi`, `contact_info_city`, `contact_info_zip`, `contact_info_phone`, `contact_info_mobile`, `contact_info_fax`, `contact_info_correspondence`, `contact_info_profofresidance`, `account_info_agentcode`, `bank_info_bankname`, `bank_info_bankaddress`, `bank_info_bankswiftcode`, `bank_info_bankaccount`, `bank_info_bankaccountholder`, `tranding_info_annualincome`, `tranding_info_trandingexperience`, `tranding_info_invenstments`, `tranding_info_riskprofile`, `additional_info_manageaccount`, `additional_info_website`, `additional_info_aboutme`) VALUES
(17, 'Join', '', '0', '0', '0', 'Jeff', '12', NULL, 'Australia', 'mjsnux@gmail.com', 'jafar', 'Comoros', 'Jawa Barat', 'Bandung', 10000, '62 - 22900000', '62 - 2000', '370 - 20000', 'dfgdf', NULL, 'Yes', 'Mandiri', 'Cibiru', '12', 'Mandiri', 'Test', '50.000 - 100.000', '> 3 Years', 'forex,futures,Other', 'Low', 'Other', NULL, 'Other');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `acl_role_parents`
--
ALTER TABLE `acl_role_parents`
  ADD CONSTRAINT `acl_role_parents_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acl_role_parents_ibfk_2` FOREIGN KEY (`parent`) REFERENCES `acl_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `acl_rules`
--
ALTER TABLE `acl_rules`
  ADD CONSTRAINT `acl_rules_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acl_rules_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `acl_resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_users`
--
ALTER TABLE `auth_users`
  ADD CONSTRAINT `auth_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `acl_roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
