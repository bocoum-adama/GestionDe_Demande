-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 19 juin 2020 à 18:30
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion_ticket`
--

-- --------------------------------------------------------

--
-- Structure de la table `affectation_carte`
--

CREATE TABLE `affectation_carte` (
  `id_affectation` int(11) NOT NULL,
  `id_carte` int(11) DEFAULT NULL,
  `id_vehicule` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `ien` varchar(45) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(256) NOT NULL,
  `email_pro` varchar(256) NOT NULL,
  `code_str` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`id`, `ien`, `nom`, `prenom`, `email_pro`, `code_str`) VALUES
(24, '956ND48W', 'FALL', 'Adama', 'adama.fall@education.sn', 1290902230),
(25, '387dmvh9', 'DIAHAM', 'ibrahima farba', 'ibrahimafarba.diaham@education.sn', 1290902230),
(27, '01WK8DA0', 'FALL', 'Seyni Ndiaye', 'seynindiaye.fall@education.sn', 1290902230),
(28, '856OS0XE', 'SANE', 'BAKARY AINENY', 'bakaryaineny.sane@education.sn', 1290902230),
(31, '493CACBT', 'BOB', 'Fatou', 'fatou.bob@education.sn', 1186970740);

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

CREATE TABLE `carte` (
  `id_carte` int(11) NOT NULL,
  `numero_carte` varchar(20) DEFAULT NULL,
  `etat_carte` enum('-1','1','2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `carte`
--

INSERT INTO `carte` (`id_carte`, `numero_carte`, `etat_carte`) VALUES
(1, '00352895163', '1'),
(2, '02395150143', '1'),
(3, '02395174861', '1'),
(4, '00353115793', '1'),
(5, '00353137714', '1'),
(6, '00501268726', '1'),
(7, '02395456029', '1'),
(8, '02395612605', '1'),
(9, '02395135508', '1'),
(10, '02395191006', '1'),
(11, '02395439967', '1'),
(12, '02395574433', '1'),
(14, '00432383989', '1'),
(15, '00352808265', '1'),
(16, '00492701263', '1');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `date_cmd` date DEFAULT NULL,
  `etat` enum('-1','1','2') DEFAULT NULL,
  `IEN` varchar(8) NOT NULL,
  `id_livraison` int(11) DEFAULT NULL,
  `heure` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `date_cmd`, `etat`, `IEN`, `id_livraison`, `heure`) VALUES
(3, '2020-06-08', '1', 'W6WDBX5Q', NULL, '08:17:27'),
(4, '2020-06-08', '1', '856OS0XE', NULL, '09:02:46'),
(5, '2020-06-08', '1', '387DMVH9', NULL, '09:06:45'),
(6, '2020-06-08', '1', '01WK8DA0', NULL, '10:32:32'),
(7, '2020-06-08', '1', '95WEJKHY', NULL, '11:23:59'),
(8, '2020-06-08', '1', '498NJMPG', NULL, '11:54:23'),
(9, '2020-06-11', '-1', '683DYTUN', NULL, '09:39:09'),
(10, '2020-06-11', '1', '439TPRCR', NULL, '11:38:36'),
(11, '2020-06-12', '2', 'W6WDBX5Q', NULL, '10:04:52'),
(12, '2020-06-12', '-1', '378H6QTA', NULL, '10:09:11'),
(13, '2020-06-12', '1', '844PYNTD', NULL, '10:11:42'),
(14, '2020-06-12', '-1', '997TH8HV', NULL, '10:11:45'),
(15, '2020-06-12', '2', '387DMVH9', NULL, '10:14:45'),
(16, '2020-06-12', '2', '856OS0XE', NULL, '10:14:46'),
(17, '2020-06-12', '2', '438JU4AT', NULL, '10:16:33'),
(18, '2020-06-12', '2', '733NY38C', NULL, '10:17:05'),
(19, '2020-06-12', '2', '01WK8DA0', NULL, '10:19:27'),
(20, '2020-06-12', '2', '844R9CQ4', NULL, '10:26:05'),
(21, '2020-06-12', '1', '948V7EKB', NULL, '10:26:18'),
(22, '2020-06-12', '2', '484NNYA9', NULL, '10:26:54'),
(23, '2020-06-12', '2', '784ABJRB', NULL, '10:28:13'),
(24, '2020-06-12', '2', '497QDDYM', NULL, '10:28:32'),
(25, '2020-06-12', '2', '493CACBT', NULL, '10:29:31'),
(26, '2020-06-12', '1', '479PYRCH', NULL, '10:31:07'),
(27, '2020-06-12', '2', '676WQ3GX', NULL, '10:32:25'),
(28, '2020-06-12', '1', '433RCFY4', NULL, '10:33:10'),
(29, '2020-06-12', '2', '674M44KU', NULL, '10:34:27'),
(30, '2020-06-12', '1', '649JRP49', NULL, '10:34:34'),
(31, '2020-06-12', '2', '879W9RJD', NULL, '10:37:26'),
(32, '2020-06-12', '1', '367XNG88', NULL, '10:38:25'),
(33, '2020-06-12', '1', '633MUUC9', NULL, '10:38:47'),
(34, '2020-06-12', '1', '644KEFFT', NULL, '10:38:53'),
(35, '2020-06-12', '1', '866RCNXK', NULL, '10:40:35'),
(36, '2020-06-12', '1', '787GDRFR', NULL, '10:41:02'),
(37, '2020-06-12', '1', '639EPC96', NULL, '10:51:27'),
(38, '2020-06-12', '1', '736RFWCV', NULL, '10:55:06'),
(39, '2020-06-12', '1', '676DAFM6', NULL, '11:02:21'),
(40, '2020-06-12', '-1', '673BQDRA', NULL, '11:09:15'),
(41, '2020-06-12', '1', '636TM3A7', NULL, '11:11:47'),
(42, '2020-06-12', '1', '683DYTUN', NULL, '11:13:47'),
(43, '2020-06-12', '1', '348DRDQV', NULL, '11:14:55'),
(44, '2020-06-12', '1', '779CVCY3', NULL, '11:16:18'),
(45, '2020-06-12', '1', '476N9CY8', NULL, '11:17:50'),
(46, '2020-06-12', '-1', '698VFJ3G', NULL, '11:23:06'),
(47, '2020-06-12', '1', '893TR7WE', NULL, '11:25:33'),
(48, '2020-06-12', '2', '934RCNK3', NULL, '11:25:39'),
(49, '2020-06-12', '1', '893RW6DB', NULL, '11:28:27'),
(50, '2020-06-12', '1', '898V6WUR', NULL, '11:30:43'),
(51, '2020-06-12', '1', '699TQYTG', NULL, '11:32:00'),
(52, '2020-06-12', '1', '637UX6EV', NULL, '11:32:17'),
(53, '2020-06-12', '1', '846TXDDP', NULL, '11:33:00'),
(54, '2020-06-12', '1', '694AGDJ7', NULL, '11:33:56'),
(55, '2020-06-12', '1', '769MFTA7', NULL, '11:34:13'),
(56, '2020-06-12', '1', '388JTDPQ', NULL, '11:35:20'),
(57, '2020-06-12', '1', '749HAQED', NULL, '11:37:56'),
(58, '2020-06-12', '1', '383CTX7R', NULL, '11:45:08'),
(59, '2020-06-12', '1', '368GNV7T', NULL, '11:46:30'),
(60, '2020-06-12', '-1', '939PN3TR', NULL, '11:48:03'),
(61, '2020-06-12', '1', '447DPC4N', NULL, '11:51:57'),
(62, '2020-06-12', '2', '049EZQEE', NULL, '11:54:56'),
(63, '2020-06-14', '1', '676WQ3GX', NULL, '11:01:26'),
(64, '2020-06-15', '1', '699TQYTG', NULL, '08:55:40'),
(65, '2020-06-15', '1', '948V7EKB', NULL, '09:04:37'),
(66, '2020-06-15', '1', '893RW6DB', NULL, '09:07:14'),
(67, '2020-06-15', '1', '946TT64K', NULL, '09:14:59'),
(68, '2020-06-15', '1', '984QP4JD', NULL, '09:22:19'),
(69, '2020-06-15', '1', '844R9CQ4', NULL, '09:27:23'),
(70, '2020-06-15', '1', '784ABJRB', NULL, '09:41:11'),
(71, '2020-06-15', '1', '674M44KU', NULL, '09:43:58'),
(72, '2020-06-15', '1', '438JU4AT', NULL, '09:49:12'),
(73, '2020-06-15', '1', '898V6WUR', NULL, '09:50:05'),
(74, '2020-06-15', '1', '493CACBT', NULL, '09:54:13'),
(75, '2020-06-15', '1', '737PMBA7', NULL, '09:59:31'),
(76, '2020-06-15', '1', '779CVCY3', NULL, '10:01:44'),
(77, '2020-06-15', '1', '367XNG88', NULL, '10:06:42'),
(78, '2020-06-15', '1', '799NHUNA', NULL, '10:11:36'),
(79, '2020-06-15', '1', '673BQDRA', NULL, '10:21:26'),
(80, '2020-06-15', '1', '893TR7WE', NULL, '10:25:07'),
(81, '2020-06-15', '1', '696NMNMA', NULL, '10:28:46'),
(82, '2020-06-15', '1', '497QDDYM', NULL, '10:28:53'),
(83, '2020-06-15', '1', '956ND48W', NULL, '10:28:59'),
(84, '2020-06-15', '1', '387DMVH9', NULL, '10:30:16'),
(85, '2020-06-15', '1', '394T83TV', NULL, '10:31:46'),
(86, '2020-06-15', '1', '934GNUD3', NULL, '10:33:09'),
(87, '2020-06-15', '1', '448HVQ87', NULL, '10:34:37'),
(88, '2020-06-15', '1', '856OS0XE', NULL, '10:37:06'),
(89, '2020-06-15', '1', '399MNHVH', NULL, '10:41:35'),
(90, '2020-06-15', '1', '787GDRFR', NULL, '10:43:39'),
(91, '2020-06-15', '1', '498NJMPG', NULL, '10:45:46'),
(92, '2020-06-15', '1', '939PN3TR', NULL, '10:46:04'),
(93, '2020-06-15', '1', '683DYTUN', NULL, '10:55:36'),
(94, '2020-06-15', '1', '496YMU36', NULL, '11:04:31'),
(95, '2020-06-15', '1', '677V8K7N', NULL, '11:05:41'),
(96, '2020-06-15', '1', '464RUCNB', NULL, '11:07:16'),
(97, '2020-06-15', '1', '974F6BTV', NULL, '11:07:20'),
(98, '2020-06-15', '1', '476N9CY8', NULL, '11:12:01'),
(99, '2020-06-15', '1', '637TJ4CE', NULL, '11:12:10'),
(100, '2020-06-15', '1', '868JQX7M', NULL, '11:12:13'),
(101, '2020-06-15', '1', '999DTW3B', NULL, '11:13:37'),
(102, '2020-06-15', '1', '387BRTR4', NULL, '11:14:29'),
(103, '2020-06-15', '1', '473WXGPV', NULL, '11:14:51'),
(104, '2020-06-15', '1', '934RCNK3', NULL, '11:21:36'),
(105, '2020-06-15', '1', '646RTHK3', NULL, '11:24:02'),
(106, '2020-06-15', '1', '343VHHEW', NULL, '11:27:56'),
(107, '2020-06-15', '1', '986JYEKE', NULL, '11:27:58'),
(108, '2020-06-15', '1', '773Q3DWF', NULL, '11:29:55'),
(109, '2020-06-15', '1', '438JE3GH', NULL, '11:35:47'),
(110, '2020-06-15', '1', '964XMADQ', NULL, '11:39:46'),
(111, '2020-06-15', '1', '846TXDDP', NULL, '11:41:29'),
(112, '2020-06-15', '1', '743WVEDE', NULL, '11:41:58'),
(113, '2020-06-15', '1', '049EZQEE', NULL, '11:47:25'),
(114, '2020-06-15', '1', '374MC8NH', NULL, '11:57:06'),
(115, '2020-06-15', '1', '484NNYA9', NULL, '11:58:57'),
(116, '2020-06-15', '1', '897VMJJN', NULL, '12:13:56'),
(117, '2020-06-15', '1', '497MNEAX', NULL, '13:52:49'),
(118, '2020-06-16', '1', '974F6BTV', NULL, '01:51:50'),
(119, '2020-06-16', '1', '964XMADQ', NULL, '08:37:42'),
(120, '2020-06-16', '1', '397RF3JF', NULL, '08:44:42'),
(121, '2020-06-16', '1', '497QDDYM', NULL, '09:03:24'),
(122, '2020-06-16', '1', '676WQ3GX', NULL, '09:04:03'),
(123, '2020-06-16', '1', '674M44KU', NULL, '09:06:57'),
(124, '2020-06-16', '1', '893RW6DB', NULL, '09:14:25'),
(125, '2020-06-16', '1', '948V7EKB', NULL, '09:15:35'),
(126, '2020-06-16', '1', '784ABJRB', NULL, '09:17:52'),
(127, '2020-06-16', '1', '479PYRCH', NULL, '09:18:12'),
(128, '2020-06-16', '1', '844R9CQ4', NULL, '09:19:30'),
(129, '2020-06-16', '1', '696NMNMA', NULL, '09:20:03'),
(130, '2020-06-16', '1', '683DYTUN', NULL, '09:27:38'),
(131, '2020-06-16', '2', '868JQX7M', NULL, '09:29:46'),
(132, '2020-06-16', '1', '664NNKAA', NULL, '09:32:11'),
(133, '2020-06-16', '1', '493CACBT', NULL, '09:34:39'),
(134, '2020-06-16', '1', '784YX7XB', NULL, '09:35:10'),
(135, '2020-06-16', '1', '367XNG88', NULL, '09:36:03'),
(136, '2020-06-16', '1', '984QP4JD', NULL, '09:41:20'),
(137, '2020-06-16', '1', '874BU8DB', NULL, '09:48:47'),
(138, '2020-06-16', '1', '779CVCY3', NULL, '09:52:43'),
(139, '2020-06-16', '1', '737PMBA7', NULL, '09:54:38'),
(140, '2020-06-16', '1', '736WQB3J', NULL, '09:54:58'),
(141, '2020-06-16', '1', '699TQYTG', NULL, '09:55:36'),
(142, '2020-06-16', '1', '699WD6GR', NULL, '09:59:22'),
(143, '2020-06-16', '1', '864TA8FM', NULL, '10:04:14'),
(144, '2020-06-16', '1', '464RUCNB', NULL, '10:04:45'),
(145, '2020-06-16', '1', '966QDG3U', NULL, '10:04:59'),
(146, '2020-06-16', '1', '473WXGPV', NULL, '10:07:10'),
(147, '2020-06-16', '1', '893TR7WE', NULL, '10:07:34'),
(148, '2020-06-16', '1', '498M8KJ8', NULL, '10:15:04'),
(149, '2020-06-16', '1', '773Q3DWF', NULL, '10:15:12'),
(150, '2020-06-16', '1', '836AT3BH', NULL, '10:18:44'),
(151, '2020-06-16', '-1', '997TH8HV', NULL, '10:20:30'),
(152, '2020-06-16', '1', '856OS0XE', NULL, '10:20:53'),
(153, '2020-06-16', '1', '496YMU36', NULL, '10:24:22'),
(154, '2020-06-16', '1', '996HX333', NULL, '10:25:02'),
(155, '2020-06-16', '1', '95WEJKHY', NULL, '10:25:46'),
(156, '2020-06-16', '1', '949T6NMP', NULL, '10:30:22'),
(157, '2020-06-16', '1', '733ED6QF', NULL, '10:34:11'),
(158, '2020-06-16', '1', '676VAGX7', NULL, '10:38:21'),
(159, '2020-06-16', '1', '667U8KCE', NULL, '10:41:34'),
(160, '2020-06-16', '1', '844PYNTD', NULL, '10:47:01'),
(161, '2020-06-16', '1', '748MKRPT', NULL, '10:47:07'),
(162, '2020-06-16', '1', '934RCNK3', NULL, '10:48:26'),
(163, '2020-06-16', '1', '337RV4GT', NULL, '10:49:08'),
(164, '2020-06-16', '1', '879W9RJD', NULL, '10:57:05'),
(165, '2020-06-16', '1', '866RCNXK', NULL, '10:58:39'),
(166, '2020-06-16', '1', '649JRP49', NULL, '11:00:03'),
(167, '2020-06-16', '1', '786WYTNV', NULL, '11:00:49'),
(168, '2020-06-16', '1', '736RFWCV', NULL, '11:02:59'),
(169, '2020-06-16', '1', '387BRTR4', NULL, '11:03:56'),
(170, '2020-06-16', '1', '676DAFM6', NULL, '11:07:02'),
(171, '2020-06-16', '1', '348DRDQV', NULL, '11:09:09'),
(172, '2020-06-16', '1', '847NY4HQ', NULL, '11:10:25'),
(173, '2020-06-16', '1', '476N9CY8', NULL, '11:11:47'),
(174, '2020-06-16', '1', '488RFMJE', NULL, '11:12:49'),
(175, '2020-06-16', '1', '639TGM4K', NULL, '11:13:39'),
(176, '2020-06-16', '1', '394T83TV', NULL, '11:15:14'),
(177, '2020-06-16', '1', '433RCFY4', NULL, '11:15:34'),
(178, '2020-06-16', '1', '677V8K7N', NULL, '11:15:47'),
(179, '2020-06-16', '1', '468VMDWJ', NULL, '11:20:12'),
(180, '2020-06-16', '1', '497MNEAX', NULL, '11:24:37'),
(181, '2020-06-16', '1', '484NNYA9', NULL, '11:26:15'),
(182, '2020-06-16', '1', '646RTHK3', NULL, '11:32:17'),
(183, '2020-06-16', '1', '637UX6EV', NULL, '11:33:18'),
(184, '2020-06-16', '1', '789QRDYG', NULL, '11:35:03'),
(185, '2020-06-16', '1', '799NHUNA', NULL, '11:35:48'),
(186, '2020-06-16', '1', '644KEFFT', NULL, '11:37:14'),
(187, '2020-06-16', '1', '636TM3A7', NULL, '11:38:12'),
(188, '2020-06-16', '1', '849DDAMT', NULL, '11:43:06'),
(189, '2020-06-16', '1', '673BQDRA', NULL, '11:43:11'),
(190, '2020-06-16', '1', '399MNHVH', NULL, '11:45:43'),
(191, '2020-06-16', '1', '644K7GC9', NULL, '11:46:35'),
(192, '2020-06-16', '1', '737NRUYC', NULL, '11:50:38'),
(193, '2020-06-16', '1', '698VFJ3G', NULL, '11:52:42'),
(194, '2020-06-17', '1', '736WQB3J', NULL, '07:10:03'),
(195, '2020-06-17', '1', '676DAFM6', NULL, '07:39:27'),
(196, '2020-06-17', '1', '674M44KU', NULL, '08:33:46'),
(197, '2020-06-17', '1', '699TQYTG', NULL, '08:46:58'),
(198, '2020-06-17', '1', '874BU8DB', NULL, '08:49:44'),
(199, '2020-06-17', '1', '387DMVH9', NULL, '09:11:29'),
(200, '2020-06-17', '1', '683DYTUN', NULL, '09:16:33'),
(201, '2020-06-17', '1', '868JQX7M', NULL, '09:17:57'),
(202, '2020-06-17', '1', '844R9CQ4', NULL, '09:19:08'),
(203, '2020-06-17', '1', '779CVCY3', NULL, '09:20:48'),
(204, '2020-06-17', '1', '696NMNMA', NULL, '09:23:16'),
(205, '2020-06-17', '1', '856OS0XE', NULL, '09:24:39'),
(206, '2020-06-17', '1', '676WQ3GX', NULL, '09:29:49'),
(207, '2020-06-17', '1', '964XMADQ', NULL, '09:29:55'),
(208, '2020-06-17', '1', '479PYRCH', NULL, '09:30:35'),
(209, '2020-06-17', '1', '493CACBT', NULL, '09:32:07'),
(210, '2020-06-17', '1', '866RCNXK', NULL, '09:33:06'),
(211, '2020-06-17', '1', '784ABJRB', NULL, '09:36:42'),
(212, '2020-06-17', '1', '984QP4JD', NULL, '09:38:54'),
(213, '2020-06-17', '1', '637TJ4CE', NULL, '09:44:49'),
(214, '2020-06-17', '1', '364UJTBJ', NULL, '09:47:32'),
(215, '2020-06-17', '1', '784YX7XB', NULL, '09:50:57'),
(216, '2020-06-17', '1', '488RFMJE', NULL, '09:51:27'),
(217, '2020-06-17', '1', '387KA7WN', NULL, '09:54:20'),
(218, '2020-06-17', '1', '497QDDYM', NULL, '09:58:53'),
(219, '2020-06-17', '1', '836AT3BH', NULL, '09:59:45'),
(220, '2020-06-17', '1', '367XNG88', NULL, '10:05:17'),
(221, '2020-06-17', '1', '498NJMPG', NULL, '10:05:55'),
(222, '2020-06-17', '1', '967WEB98', NULL, '10:06:23'),
(223, '2020-06-17', '1', '773Q3DWF', NULL, '10:10:23'),
(224, '2020-06-17', '1', '798VH76G', NULL, '10:18:13'),
(225, '2020-06-17', '-1', '498M8KJ8', NULL, '10:20:01'),
(226, '2020-06-17', '1', '996HX333', NULL, '10:20:10'),
(227, '2020-06-17', '1', '763NYEJ6', NULL, '10:21:12'),
(228, '2020-06-17', '1', '847NY4HQ', NULL, '10:22:45'),
(229, '2020-06-17', '1', '673BQDRA', NULL, '10:24:23'),
(230, '2020-06-17', '1', '783DA4XF', NULL, '10:24:58'),
(231, '2020-06-17', '1', '348DRDQV', NULL, '10:37:10'),
(232, '2020-06-17', '1', '677V8K7N', NULL, '10:38:48'),
(233, '2020-06-17', '1', '637UX6EV', NULL, '10:39:06'),
(234, '2020-06-17', '1', '956ND48W', NULL, '10:41:58'),
(235, '2020-06-17', '1', '464RUCNB', NULL, '10:43:16'),
(236, '2020-06-17', '1', '844PYNTD', NULL, '10:45:07'),
(237, '2020-06-17', '1', '683KMPJV', NULL, '10:45:43'),
(238, '2020-06-17', '1', '743WVEDE', NULL, '10:46:58'),
(239, '2020-06-17', '1', '443RJH4W', NULL, '10:47:53'),
(240, '2020-06-17', '1', '748MKRPT', NULL, '10:48:03'),
(241, '2020-06-17', '1', '769BGKVY', NULL, '10:48:12'),
(242, '2020-06-17', '1', '637WDYUG', NULL, '10:49:14'),
(243, '2020-06-17', '1', '898V6WUR', NULL, '10:52:21'),
(244, '2020-06-17', '1', '963DEJ6K', NULL, '10:54:02'),
(245, '2020-06-17', '1', '864TA8FM', NULL, '10:55:37'),
(246, '2020-06-17', '1', '893RW6DB', NULL, '10:56:41'),
(247, '2020-06-17', '1', '789QRDYG', NULL, '10:57:29'),
(248, '2020-06-17', '1', '433J4MAT', NULL, '10:57:46'),
(249, '2020-06-17', '1', '636TM3A7', NULL, '10:58:33'),
(250, '2020-06-17', '1', '874K68MQ', NULL, '10:58:56'),
(251, '2020-06-17', '1', '438JU4AT', NULL, '10:59:53'),
(252, '2020-06-17', '1', '948V7EKB', NULL, '10:59:58'),
(253, '2020-06-17', '1', 'W6WDBX5Q', NULL, '11:00:18'),
(254, '2020-06-17', '1', '338PUJX4', NULL, '11:01:33'),
(255, '2020-06-17', '1', '974F6BTV', NULL, '11:02:33'),
(256, '2020-06-17', '1', '676VAGX7', NULL, '11:02:43'),
(257, '2020-06-17', '1', '347K7GMB', NULL, '11:03:34'),
(258, '2020-06-17', '1', '768VWMBK', NULL, '11:03:43'),
(259, '2020-06-17', '1', '893TR7WE', NULL, '11:05:08'),
(260, '2020-06-17', '1', '664NNKAA', NULL, '11:05:17'),
(261, '2020-06-17', '1', '468VMDWJ', NULL, '11:05:24'),
(262, '2020-06-17', '1', '474VW6UU', NULL, '11:11:28'),
(263, '2020-06-17', '1', '879W9RJD', NULL, '11:11:58'),
(264, '2020-06-17', '1', '674RY7AH', NULL, '11:12:21'),
(265, '2020-06-17', '1', '484NNYA9', NULL, '11:14:34'),
(266, '2020-06-17', '1', '797CUWTD', NULL, '11:22:02'),
(267, '2020-06-17', '1', '736RFWCV', NULL, '11:24:30'),
(268, '2020-06-17', '1', '497MNEAX', NULL, '11:28:04'),
(269, '2020-06-17', '1', '433RCFY4', NULL, '11:29:50'),
(270, '2020-06-17', '1', '646RTHK3', NULL, '11:29:59'),
(271, '2020-06-17', '1', '649JRP49', NULL, '11:31:26'),
(272, '2020-06-17', '1', '694AGDJ7', NULL, '11:33:47'),
(273, '2020-06-17', '1', '049EZQEE', NULL, '11:33:58'),
(274, '2020-06-17', '1', '484AE97K', NULL, '11:35:18'),
(275, '2020-06-17', '1', '476N9CY8', NULL, '11:35:36'),
(276, '2020-06-17', '1', '947BABJT', NULL, '11:39:46'),
(277, '2020-06-17', '1', '399MNHVH', NULL, '11:40:55'),
(278, '2020-06-17', '1', '897AW67R', NULL, '11:42:19'),
(279, '2020-06-17', '1', '95WEJKHY', NULL, '11:52:52'),
(280, '2020-06-17', '1', '388JTDPQ', NULL, '11:54:11'),
(281, '2020-06-17', '1', '436GRUF8', NULL, '11:58:02'),
(282, '2020-06-18', '1', '374MC8NH', NULL, '08:19:57'),
(283, '2020-06-18', '2', '786WYTNV', NULL, '08:31:31'),
(284, '2020-06-18', '2', '497QDDYM', NULL, '08:41:23'),
(285, '2020-06-18', '1', '699TQYTG', NULL, '08:53:43'),
(286, '2020-06-18', '2', '844R9CQ4', NULL, '08:55:18'),
(287, '2020-06-18', '1', '966QDG3U', NULL, '09:02:35'),
(288, '2020-06-18', '1', '683DYTUN', NULL, '09:04:19'),
(289, '2020-06-18', '2', '438JU4AT', NULL, '09:05:56'),
(290, '2020-06-18', '2', '674M44KU', NULL, '09:15:13'),
(291, '2020-06-18', '1', '898V6WUR', NULL, '09:15:41'),
(292, '2020-06-18', '1', '676DAFM6', NULL, '09:16:03'),
(293, '2020-06-18', '2', '737PMBA7', NULL, '09:17:55'),
(294, '2020-06-18', '1', '948V7EKB', NULL, '09:19:04'),
(295, '2020-06-18', '1', '893RW6DB', NULL, '09:20:12'),
(296, '2020-06-18', '1', '784YX7XB', NULL, '09:20:21'),
(297, '2020-06-18', '2', '676WQ3GX', NULL, '09:22:06'),
(298, '2020-06-18', '1', '984QP4JD', NULL, '09:23:23'),
(299, '2020-06-18', '1', '479PYRCH', NULL, '09:24:01'),
(300, '2020-06-18', '1', '664NNKAA', NULL, '09:27:33'),
(301, '2020-06-18', '2', '484NNYA9', NULL, '09:29:05'),
(302, '2020-06-18', '2', '939PN3TR', NULL, '09:29:47'),
(303, '2020-06-18', '1', '866RCNXK', NULL, '09:30:32'),
(304, '2020-06-18', '1', '476N9CY8', NULL, '09:31:30'),
(305, '2020-06-18', '2', '784ABJRB', NULL, '09:31:30'),
(306, '2020-06-18', '1', '388JTDPQ', NULL, '09:31:35'),
(307, '2020-06-18', '1', '694AGDJ7', NULL, '09:32:31'),
(308, '2020-06-18', '1', '649JRP49', NULL, '09:32:56'),
(309, '2020-06-18', '1', '868JQX7M', NULL, '09:36:42'),
(310, '2020-06-18', '1', '893TR7WE', NULL, '09:37:07'),
(311, '2020-06-18', '1', '779CVCY3', NULL, '09:39:41'),
(312, '2020-06-18', '1', '696NMNMA', NULL, '09:41:59'),
(313, '2020-06-18', '2', '699WD6GR', NULL, '09:48:50'),
(314, '2020-06-18', '1', '874BU8DB', NULL, '09:48:53'),
(315, '2020-06-18', '1', '844PYNTD', NULL, '09:55:12'),
(316, '2020-06-18', '2', '476FNNBU', NULL, '10:01:12'),
(317, '2020-06-18', '2', '364UJTBJ', NULL, '10:02:54'),
(318, '2020-06-18', '2', '493CACBT', NULL, '10:05:15'),
(319, '2020-06-18', '1', '674RY7AH', NULL, '10:05:17'),
(320, '2020-06-18', '1', '997TH8HV', NULL, '10:05:24'),
(321, '2020-06-18', '1', '949T6NMP', NULL, '10:06:45'),
(322, '2020-06-18', '1', '473WXGPV', NULL, '10:10:14'),
(323, '2020-06-18', '1', '667U8KCE', NULL, '10:11:34'),
(324, '2020-06-18', '1', '637TJ4CE', NULL, '10:11:58'),
(325, '2020-06-18', '2', '498NJMPG', NULL, '10:20:39'),
(326, '2020-06-18', '1', '636TM3A7', NULL, '10:25:22'),
(327, '2020-06-18', '2', '768VWMBK', NULL, '10:25:52'),
(328, '2020-06-18', '1', '789QRDYG', NULL, '10:25:53'),
(329, '2020-06-18', '1', '736WQB3J', NULL, '10:29:12'),
(330, '2020-06-18', '2', '474VW6UU', NULL, '10:29:35'),
(331, '2020-06-18', '1', '743WVEDE', NULL, '10:30:55'),
(332, '2020-06-18', '1', '664YGKMP', NULL, '10:31:36'),
(333, '2020-06-18', '1', '769BGKVY', NULL, '10:34:08'),
(334, '2020-06-18', '1', '637UX6EV', NULL, '10:36:04'),
(335, '2020-06-18', '2', '387DMVH9', NULL, '10:38:16'),
(336, '2020-06-18', '1', '367XNG88', NULL, '10:41:41'),
(337, '2020-06-18', '2', '879W9RJD', NULL, '10:43:03'),
(338, '2020-06-18', '1', '974F6BTV', NULL, '10:43:18'),
(339, '2020-06-18', '1', '967WEB98', NULL, '10:44:09'),
(340, '2020-06-18', '2', 'W6WDBX5Q', NULL, '10:44:38'),
(341, '2020-06-18', '1', '488RFMJE', NULL, '10:45:27'),
(342, '2020-06-18', '2', '856OS0XE', NULL, '10:46:25'),
(343, '2020-06-18', '1', '874K68MQ', NULL, '10:46:38'),
(344, '2020-06-18', '1', '677V8K7N', NULL, '10:48:42'),
(345, '2020-06-18', '1', '637WDYUG', NULL, '10:53:04'),
(346, '2020-06-18', '1', '999DTW3B', NULL, '10:53:30'),
(347, '2020-06-18', '1', '994RDGFH', NULL, '11:02:30'),
(348, '2020-06-18', '1', '498M8KJ8', NULL, '11:03:41'),
(349, '2020-06-18', '1', '836AT3BH', NULL, '11:08:33'),
(350, '2020-06-18', '2', '748MKRPT', NULL, '11:10:48'),
(351, '2020-06-18', '2', '934GNUD3', NULL, '11:10:56'),
(352, '2020-06-18', '2', '049EZQEE', NULL, '11:22:05'),
(353, '2020-06-18', '1', '497MNEAX', NULL, '11:25:43'),
(354, '2020-06-18', '1', '468VMDWJ', NULL, '11:26:06'),
(355, '2020-06-18', '2', '95WEJKHY', NULL, '11:26:13'),
(356, '2020-06-18', '2', '448HVQ87', NULL, '11:26:13'),
(357, '2020-06-18', '1', '488P8X44', NULL, '11:27:07'),
(358, '2020-06-18', '1', '364JVHED', NULL, '11:30:10'),
(359, '2020-06-18', '1', '786QX3U8', NULL, '11:30:13'),
(360, '2020-06-18', '1', '394T83TV', NULL, '11:31:53'),
(361, '2020-06-18', '1', '347K7GMB', NULL, '11:39:05'),
(362, '2020-06-18', '2', '934RCNK3', NULL, '11:41:05'),
(363, '2020-06-18', '1', '644KEFFT', NULL, '11:41:11'),
(364, '2020-06-18', '1', '447DPC4N', NULL, '11:44:45'),
(365, '2020-06-18', '1', '947BABJT', NULL, '11:48:51'),
(366, '2020-06-18', '1', '844Q9DDH', NULL, '11:51:54'),
(367, '2020-06-18', '1', '384VH44C', NULL, '11:52:18'),
(368, '2020-06-18', '1', '773Q3DWF', NULL, '11:52:21'),
(369, '2020-06-18', '1', '433J4MAT', NULL, '11:52:52'),
(370, '2020-06-18', '1', '864TA8FM', NULL, '11:54:27'),
(371, '2020-06-18', '2', '956ND48W', NULL, '11:55:59'),
(372, '2020-06-18', '1', '867BVQJ4', NULL, '11:56:14'),
(373, '2020-06-18', '1', '343VHHEW', NULL, '11:57:15'),
(374, '2020-06-18', '1', '967NRQDT', NULL, '11:57:48'),
(375, '2020-06-18', '1', '483TR3PH', NULL, '11:59:19'),
(379, '2020-06-18', '2', '899E8EYB', NULL, '11:59:10'),
(380, '2020-06-19', '1', '498M8KJ8', NULL, '08:33:03'),
(381, '2020-06-19', '1', '868JQX7M', NULL, '08:47:54'),
(382, '2020-06-19', '1', '784ABJRB', NULL, '08:49:25'),
(383, '2020-06-19', '1', '736WQB3J', NULL, '08:52:20'),
(384, '2020-06-19', '1', '438JU4AT', NULL, '09:05:53'),
(385, '2020-06-19', '1', '374MC8NH', NULL, '09:08:31'),
(386, '2020-06-19', '1', '779CVCY3', NULL, '09:10:07'),
(387, '2020-06-19', '1', '493CACBT', NULL, '09:10:54'),
(388, '2020-06-19', '1', '348DRDQV', NULL, '09:11:57'),
(389, '2020-06-19', '1', '683DYTUN', NULL, '09:14:16'),
(390, '2020-06-19', '1', '479PYRCH', NULL, '09:16:25'),
(391, '2020-06-19', '1', '893TR7WE', NULL, '09:18:27'),
(392, '2020-06-19', '1', '984QP4JD', NULL, '09:19:27'),
(393, '2020-06-19', '1', '939PN3TR', NULL, '09:20:16'),
(394, '2020-06-19', '1', '737PMBA7', NULL, '09:21:19'),
(395, '2020-06-19', '1', '436GRUF8', NULL, '09:23:14'),
(396, '2020-06-19', '1', '664NNKAA', NULL, '09:23:46'),
(397, '2020-06-19', '1', '496YMU36', NULL, '09:29:25'),
(398, '2020-06-19', '1', '498NJMPG', NULL, '09:32:33'),
(399, '2020-06-19', '1', '948V7EKB', NULL, '09:43:06'),
(400, '2020-06-19', '1', '676DAFM6', NULL, '09:43:31'),
(401, '2020-06-19', '1', '893RW6DB', NULL, '09:45:37'),
(402, '2020-06-19', '1', '789QRDYG', NULL, '09:47:00'),
(403, '2020-06-19', '1', '748MKRPT', NULL, '09:47:17'),
(404, '2020-06-19', '1', '636TM3A7', NULL, '09:47:42'),
(405, '2020-06-19', '1', '964XMADQ', NULL, '09:50:15'),
(406, '2020-06-19', '1', '996HX333', NULL, '09:52:05'),
(407, '2020-06-19', '1', '676WQ3GX', NULL, '09:54:39'),
(408, '2020-06-19', '1', '947WTB8A', NULL, '09:56:52'),
(409, '2020-06-19', '1', '898V6WUR', NULL, '10:04:04'),
(410, '2020-06-19', '1', '874K68MQ', NULL, '10:04:35'),
(411, '2020-06-19', '1', '699WD6GR', NULL, '10:06:51'),
(412, '2020-06-19', '1', '966HFBQ3', NULL, '10:07:13'),
(413, '2020-06-19', '1', '949T6NMP', NULL, '10:09:17'),
(414, '2020-06-19', '1', '879W9RJD', NULL, '10:10:20'),
(415, '2020-06-19', '1', '674M44KU', NULL, '10:12:00'),
(416, '2020-06-19', '1', '488RFMJE', NULL, '10:12:15'),
(417, '2020-06-19', '1', '677V8K7N', NULL, '10:12:33'),
(418, '2020-06-19', '1', '664YGKMP', NULL, '10:13:05'),
(419, '2020-06-19', '1', '696NMNMA', NULL, '10:21:22'),
(420, '2020-06-19', '1', '786QX3U8', NULL, '10:22:12'),
(421, '2020-06-19', '1', '386FKD6X', NULL, '10:23:24'),
(422, '2020-06-19', '1', '844Q9DDH', NULL, '10:23:36'),
(423, '2020-06-19', '1', '674RY7AH', NULL, '10:24:42'),
(424, '2020-06-19', '1', '649JRP49', NULL, '10:25:04'),
(425, '2020-06-19', '1', '866RCNXK', NULL, '10:25:23'),
(426, '2020-06-19', '1', '487WXVJY', NULL, '10:27:00'),
(427, '2020-06-19', '1', '693JFU43', NULL, '10:27:00'),
(428, '2020-06-19', '1', '899E8EYB', NULL, '10:30:47'),
(429, '2020-06-19', '1', '767WR37A', NULL, '10:31:03'),
(430, '2020-06-19', '1', '994RDGFH', NULL, '10:31:13'),
(431, '2020-06-19', '1', '384VH44C', NULL, '10:31:36'),
(432, '2020-06-19', '1', '683KMPJV', NULL, '10:36:05'),
(433, '2020-06-19', '1', '846TXDDP', NULL, '10:37:05'),
(434, '2020-06-19', '1', '768VWMBK', NULL, '10:37:13'),
(435, '2020-06-19', '1', '868TWTKP', NULL, '10:38:06'),
(436, '2020-06-19', '1', '637TJ4CE', NULL, '10:39:54'),
(437, '2020-06-19', '1', '967WEB98', NULL, '10:40:56'),
(438, '2020-06-19', '1', '639TGM4K', NULL, '10:42:05'),
(439, '2020-06-19', '1', '763NYEJ6', NULL, '10:47:37'),
(440, '2020-06-19', '1', '898A9A4V', NULL, '10:55:52'),
(441, '2020-06-19', '1', '443RJH4W', NULL, '10:56:02'),
(442, '2020-06-19', '1', '338PUJX4', NULL, '10:57:30'),
(443, '2020-06-19', '1', '986JYEKE', NULL, '10:58:11'),
(444, '2020-06-19', '1', '889VVHU9', NULL, '10:59:36'),
(445, '2020-06-19', '1', '474VW6UU', NULL, '11:00:00'),
(446, '2020-06-19', '1', '856OS0XE', NULL, '11:01:27'),
(447, '2020-06-19', '1', '387DMVH9', NULL, '11:01:44'),
(448, '2020-06-19', '1', '956ND48W', NULL, '11:02:15'),
(449, '2020-06-19', '1', 'W6WDBX5Q', NULL, '11:04:14'),
(450, '2020-06-19', '1', '844PYNTD', NULL, '11:05:16'),
(451, '2020-06-19', '1', '433RCFY4', NULL, '11:06:29'),
(452, '2020-06-19', '1', '867BVQJ4', NULL, '11:09:24'),
(453, '2020-06-19', '1', '743WVEDE', NULL, '11:10:29'),
(454, '2020-06-19', '1', '864TA8FM', NULL, '11:11:29'),
(455, '2020-06-19', '1', '468VMDWJ', NULL, '11:12:36'),
(456, '2020-06-19', '1', '836AT3BH', NULL, '11:13:50'),
(457, '2020-06-19', '1', '849U9FB3', NULL, '11:15:29'),
(458, '2020-06-19', '1', '737NRUYC', NULL, '11:19:12'),
(459, '2020-06-19', '1', '484NNYA9', NULL, '11:20:47'),
(460, '2020-06-19', '1', '947BABJT', NULL, '11:21:13'),
(461, '2020-06-19', '1', '367XNG88', NULL, '11:27:09'),
(462, '2020-06-19', '1', '497MNEAX', NULL, '11:29:24'),
(463, '2020-06-19', '1', '934GNUD3', NULL, '11:37:35'),
(464, '2020-06-19', '1', '694AGDJ7', NULL, '11:39:40'),
(465, '2020-06-19', '1', '784YX7XB', NULL, '11:50:26'),
(466, '2020-06-19', '1', '667U8KCE', NULL, '11:51:05'),
(467, '2020-06-19', '1', '637UX6EV', NULL, '11:52:29'),
(468, '2020-06-19', '1', '673BQDRA', NULL, '11:53:26'),
(469, '2020-06-19', '1', '488P8X44', NULL, '11:55:39'),
(470, '2020-06-19', '1', '644KEFFT', NULL, '11:58:06');

-- --------------------------------------------------------

--
-- Structure de la table `historique_mouvement_jour_ien`
--

CREATE TABLE `historique_mouvement_jour_ien` (
  `IEN` varchar(10) CHARACTER SET latin1 NOT NULL,
  `date_mouvement` date NOT NULL,
  `site_mouvement` int(11) NOT NULL,
  `code_str` bigint(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `E1` time NOT NULL,
  `S1` time NOT NULL,
  `E2` time NOT NULL,
  `S2` time NOT NULL,
  `E3` time NOT NULL,
  `S3` time NOT NULL,
  `E4` time NOT NULL,
  `S4` time NOT NULL,
  `E5` time NOT NULL,
  `S5` time NOT NULL,
  `E6` time NOT NULL,
  `S6` time NOT NULL,
  `E7` time NOT NULL,
  `S7` time NOT NULL,
  `E8` time NOT NULL,
  `S8` time NOT NULL,
  `SN` time NOT NULL,
  `etat` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id_livraison` int(11) NOT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `code_str` bigint(20) NOT NULL,
  `Personnel_IEN` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id_livraison`, `date_livraison`, `code_str`, `Personnel_IEN`) VALUES
(1, '2020-06-07 00:00:00', 1050362770, '0T8ZUK0S'),
(2, '2020-06-12 00:00:00', 1174469590, '733NY38C'),
(3, '2020-06-12 00:00:00', 1186970740, '493CACBT'),
(4, '2020-06-12 00:00:00', 1290902230, 'W6WDBX5Q'),
(5, '2020-06-16 00:00:00', 1026726200, '868JQX7M'),
(6, '2020-06-18 00:00:00', 1290902230, '956ND48W'),
(7, '2020-06-18 00:00:00', 1115779360, '644K7GC9'),
(8, '2020-06-18 00:00:00', 1186970740, '484AE97K');

-- --------------------------------------------------------

--
-- Structure de la table `livraison_ticket`
--

CREATE TABLE `livraison_ticket` (
  `id_livraison` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `nbr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livraison_ticket`
--

INSERT INTO `livraison_ticket` (`id_livraison`, `date`, `nbr`) VALUES
(1, '2020-06-04 00:00:00', 2500);

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `libelle_marque` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `libelle_marque`) VALUES
(1, 'Mercedes'),
(2, 'Toyota'),
(3, 'Tata'),
(4, 'Hyundai'),
(5, 'Wolkswagen'),
(6, 'Chevrolet');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `id` bigint(20) NOT NULL,
  `IEN` varchar(8) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `code_str` bigint(20) NOT NULL,
  `email_pro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`id`, `IEN`, `prenom`, `nom`, `code_str`, `email_pro`) VALUES
(1, '784ABJRB', 'MAMADOU', 'SONKO', 1186970740, 'mamadou.sonko2@education.sn'),
(2, '478DVE77', 'Mounirou', 'SONKO', 1094533540, 'mounirou.sonko@education.sn'),
(3, '879W9RJD', 'Ismaila', 'DIEME', 1186970740, 'ismaila.dieme3@education.sn'),
(4, '947BABJT', 'Demba Yankhoba', 'SALL', 1563582550, 'dembayankhoba.sall@education.sn'),
(5, '733NY38C', 'Cheikh Tidiane', 'MBAYE', 1174469590, 'cheikhtidiane.mbaye@education.sn'),
(6, '433J4MAT', 'Khassim', 'BA', 1544151360, 'khassim.ba@education.sn'),
(7, '737NRUYC', 'ALIOUNE BADARA', 'DIALLO', 1770461530, 'aliounebadara.diallo@education.sn'),
(8, '468VMDWJ', 'Abdou Rahmane', 'Diouf', 1579405730, 'abdourahmane.diouf1@education.sn'),
(9, '488P8X44', 'Avelino Cyrille', 'PEREIRA', 1579405730, 'avelinocyrille.pereira@education.sn'),
(10, '736WQB3J', 'el hadji fallou', 'dieng', 1579405730, 'elhadji.dieng8@education.sn'),
(11, '378H6QTA', 'Ndiawar abdoulaye', 'Teuw', 1174469590, 'ndiawarabdoulaye.teuw@education.sn'),
(12, '337RV4GT', 'Bakary', 'BODIAN', 1432067520, 'bakary.bodian@education.sn'),
(13, '733ED6QF', 'LANSANA', 'SAGNA', 1186970740, 'lansana.sagna@education.sn'),
(14, '498M8KJ8', 'Edouard Bérenger', 'MANGA', 1579405730, 'edouardberenger.manga1@education.sn'),
(15, '363FJXYV', 'Ibrahima', 'DIATTA', 1050362770, 'ibrahima.diatta@education.sn'),
(16, '897VMJJN', 'fallou', 'sarr', 1432067520, 'fallou.sarr@education.sn'),
(17, '967NRQDT', 'DAOUDA', 'THIAW', 1538921320, 'daouda.thiaw@education.sn'),
(18, '637UX6EV', 'Souleye', 'Faye', 1553748820, 'souleye.faye@education.sn'),
(19, '947WTB8A', 'ousmane', 'DIAGNE', 1553748820, 'ousmane.diagne@education.sn'),
(20, '984QP4JD', 'Mamadou Moustapha', 'Diallo', 1553748820, 'mamadoumoustapha.diallo@education.sn'),
(21, '694AGDJ7', 'Jean Mathieu', 'Badji', 1982782740, 'jeanmathieu.badji@education.sn'),
(22, '696NMNMA', 'Ousmane', 'FAYE', 1579405730, 'ousmane.faye59@education.sn'),
(23, '698VFJ3G', 'Papa Demba', 'Sy', 1544151360, 'papademba.sy@education.sn'),
(24, '849U9FB3', 'Abdoul Aziz', 'GUEYE', 1130379380, 'abdoulaziz.gueye@education.sn'),
(25, '447DPC4N', 'Omar', 'THIAM', 1538921320, 'omar.thiam1@education.sn'),
(26, '667U8KCE', 'JOSEPH', 'BIAYE', 1866441510, 'joseph.biaye@education.sn'),
(27, '474VW6UU', 'Nestor', 'SAGNA', 1115779360, 'nestor.sagna@education.sn'),
(28, '963DEJ6K', 'Papa', 'KANDJI', 1866441510, 'papa.kandji@education.sn'),
(29, '476N9CY8', 'Papa Madiamboye', 'TALL', 1579405730, 'papamadiamboye.tall@education.sn'),
(30, '683DYTUN', 'Elhadji Babacar', 'NIANG', 1544151360, 'elhadjibabacar.niang@education.sn'),
(31, '649JRP49', 'Demba', 'MENDY', 1982782740, 'demba.mendy@education.sn'),
(32, '898V6WUR', 'MAHAMADOU LAMINE', 'BARRO', 1562092850, 'mahamadoulamine.barro@education.sn'),
(33, '347YN66J', 'serigne bamba', 'toure', 1111789570, 'serignebamba.toure@education.sn'),
(34, '343VHHEW', 'LAMINE', 'DIEME', 1538921320, 'lamine.dieme@education.sn'),
(35, '387KA7WN', 'Ousmane', 'LABOU', 1770461530, 'ousmane.labou@education.sn'),
(36, '646RTHK3', 'Papa Ndiaga', 'Diome', 1544151360, 'papandiaga.diome@education.sn'),
(37, '479PYRCH', 'Malick', 'Dione', 1982782740, 'malick.dione3@education.sn'),
(38, '856OS0XE', 'BAKARY AINENY', 'SANE', 1290902230, 'bakaryaineny.sane@education.sn'),
(39, '893TR7WE', 'Amadou Mamadou', 'SALL', 1544151360, 'amadoumamadou.sall@education.sn'),
(40, '676VAGX7', 'Toumany', 'SANKHARE', 1872351910, 'toumany.sankhare@education.sn'),
(41, '639TGM4K', 'Abdallah', 'Sow', 1478898750, 'abdallah.sow@education.sn'),
(42, '784YX7XB', 'Malamine Sakho', 'SADIO', 1553748820, 'malaminesakho.sadio@education.sn'),
(43, '677V8K7N', 'Ousmane', 'KEITA', 1579405730, 'ousmane.keita@education.sn'),
(44, '644K7GC9', 'aliou', 'Thiaw', 1115779360, 'aliou.thiaw2@education.sn'),
(45, '799NHUNA', 'Abdou', 'THIAO', 1493742260, 'abdou.thiao@education.sn'),
(46, '497QDDYM', 'SEYDOU', 'DIALLO', 1186970740, 'seydou.diallo@education.sn'),
(47, '644KEFFT', 'Modou', 'Gueye', 1982782740, 'modou.gueye@education.sn'),
(48, '779CVCY3', 'Mor', 'DIOUM', 1544151360, 'mor.dioum@education.sn'),
(49, '368GNV7T', 'Abdou', 'Sene', 1538921320, 'abdou.sene@education.sn'),
(50, '789QRDYG', 'mame libasse', 'ka', 1982782740, 'mamelibasse.ka@education.sn'),
(51, '844Q9DDH', 'MAMADOU MBENDA', 'FALL', 1538921320, 'mamadoumbenda.fall@education.sn'),
(52, 'W6WDBX5Q', 'Idrissa', 'NDIAYE', 1290902230, 'idrissa.ndiaye@education.sn'),
(53, '394EPXP8', 'ALY', 'BADIANE', 1094533540, 'aly.badiane@education.sn'),
(54, '783DA4XF', 'Amadou Bocar', 'GUEYE', 1186970740, 'amadoubocar.gueye@education.sn'),
(55, '049EZQEE', 'Moussa', 'BA', 1290902230, 'moussa.ba@education.sn'),
(56, '676DAFM6', 'Hameth Hamidou', 'SY', 1982782740, 'hamethhamidou.sy@education.sn'),
(57, '786QX3U8', 'Macky Chérif', 'Gassama', 1579405730, 'mackychérif.gassama@education.sn'),
(58, '387BRTR4', 'OUSMANE', 'GUEYE', 1478898750, 'ousmane.gueye@education.sn'),
(59, '773Q3DWF', 'Abou', 'KONTE', 1544151360, 'abou.konte@education.sn'),
(60, '484NNYA9', 'OUMAR', 'NDIAYE', 1186970740, 'oumar.ndiaye@education.sn'),
(61, '443RJH4W', 'Ousmane', 'BA', 1770461530, 'ousmane.ba@education.sn'),
(62, '438JE3GH', 'Tenguella', 'BA', 1478898750, 'tenguella.ba1@education.sn'),
(63, '438JU4AT', 'Ibrahima Abdoulaye', 'WATT', 1186970740, 'ibrahimaabdoulaye.watt@education.sn'),
(64, '946TT64K', 'Ibrahima', 'BA', 1544151360, 'ibrahima.ba@education.sn'),
(65, '436GRUF8', 'Cheikh', 'SENE', 1544151360, 'cheikh.sene@education.sn'),
(66, '377DH9K7', 'mamadou', 'Cissé', 1579405730, 'mamadou.cisse2@education.sn'),
(67, '769MFTA7', 'Ibrahima', 'Senghor', 1562092850, 'ibrahima.senghor@education.sn'),
(68, '798VH76G', 'Momar', 'DIAW', 1866441510, 'momar.diaw@education.sn'),
(69, '374MC8NH', 'ibrahima', 'sene', 1770461530, 'ibrahima.sene2@education.sn'),
(70, '934GNUD3', 'Amath', 'Sene', 1290902230, 'amath.sene@education.sn'),
(71, '787GDRFR', 'MALICK', 'SANOKHO', 1538921320, 'malick.sanokho@education.sn'),
(72, '676WQ3GX', 'Moussa', 'SARR', 1186970740, 'moussa.sarr@education.sn'),
(73, '473WXGPV', 'Ibra Thioro', 'Fall', 1544151360, 'ibrathioro.fall@education.sn'),
(74, '864TA8FM', 'YOUSSOU', 'NDOUR', 1982782740, 'youssou.ndour5@education.sn'),
(75, '639EPC96', 'MADIOP', 'GUEYE', 1551270300, 'madiop.gueye@education.sn'),
(76, '956ND48W', 'Adama', 'FALL', 1290902230, 'adama.fall@education.sn'),
(77, '633MUUC9', 'ALIOU', 'SARR', 1982782740, 'aliou.sarr@education.sn'),
(78, '01WK8DA0', 'Seyni Ndiaye', 'FALL', 1290902230, 'seynindiaye.fall@education.sn'),
(79, '736RFWCV', 'Elhadji Babacar', 'SECK', 1982782740, 'elhadjibabacar.seck1@education.sn'),
(80, '974F6BTV', 'MOUHAMADOU BAMBA', 'MBAYE', 1544151360, 'mouhamadoubamba.mbaye@education.sn'),
(81, '868JQX7M', 'ALIOUNE', 'BA', 1544151360, 'alioune.ba@education.sn'),
(82, '0T8ZUK0S', 'Abdoulaye', 'NDAO', 1290902230, 'abdoulaye.ndao@education.sn'),
(83, '898A9A4V', 'ALIOUNE', 'FALL', 1538921320, 'alioune.fall50@education.sn'),
(84, '487WXVJY', 'Momar', 'FAYE', 1579405730, 'momar.faye@education.sn'),
(85, '844R9CQ4', 'Moussa', 'SAMB', 1186970740, 'moussa.samb@education.sn'),
(86, '347K7GMB', 'SERIGNE', 'NDIAYE', 1544151360, 'serigne.ndiaye@education.sn'),
(87, '394T83TV', 'Abdourahmane', 'KEINDE', 1432067520, 'abdourahmane.keinde@education.sn'),
(88, '763NYEJ6', 'El Hadji Mbaye', 'SYLLA', 1579405730, 'elhadji.sylla@education.sn'),
(89, '996HX333', 'Boubacar', 'NIASSE', 1186970740, 'boubacar.niasse@education.sn'),
(90, '743WVEDE', 'Cheikh', 'Niang', 1553748820, 'cheikh.niang@education.sn'),
(91, '889VVHU9', 'Moussa', 'NIANG', 1432067520, 'moussa.niang@education.sn'),
(92, '939PN3TR', 'Mamadou Lamine', 'SAMB', 1186970740, 'mamadoulamine.samb@education.sn'),
(93, '384VH44C', 'Abdoulaye', 'NDAO', 1478898750, 'abdoulaye.ndao3@education.sn'),
(94, '433RCFY4', 'Mohamed Ibrahim', 'DIAGNE', 1982782740, 'mohamedibrahim.diagne@education.sn'),
(95, '693JFU43', 'CHEIKH', 'BA', 1538921320, 'cheikh.ba@education.sn'),
(96, '664NNKAA', 'MAMSENE', 'TOURE', 1544151360, 'mamsene.toure@education.sn'),
(97, '387DMVH9', 'ibrahima farba', 'DIAHAM', 1290902230, 'ibrahimafarba.diaham@education.sn'),
(98, '498NJMPG', 'Ismael', 'Mbodji', 1290902230, 'ismael.mbodji@education.sn'),
(99, '767WR37A', 'NDENE', 'NIANG', 1538921320, 'ndene.niang3@education.sn'),
(100, '899E8EYB', 'Pape Khole', 'Dioh', 1290902230, 'papekhole.dioh@education.sn'),
(101, '484AE97K', 'Babacar', 'THIANE', 1186970740, 'babacar.thiane@education.sn'),
(102, '748MKRPT', 'Samba', 'DIAGNE', 1186970740, 'samba.diagne@education.sn'),
(103, '388JTDPQ', 'Makhtar Yacine', 'Mbengue', 1982782740, 'makhtaryacine.mbengue@education.sn'),
(104, '999DTW3B', 'Ameth', 'Seck', 1982782740, 'ameth.seck8@education.sn'),
(105, '699TQYTG', 'Ibrahima', 'SECK', 1544151360, 'ibrahima.seck@education.sn'),
(106, '964XMADQ', 'IBRAHIMA', 'KA', 1186970740, 'ibrahima.ka@education.sn'),
(107, '674M44KU', 'ALIOU', 'DIOP', 1186970740, 'aliou.diop@education.sn'),
(108, '949T6NMP', 'ousseynou', 'pouye', 1553748820, 'ousseynou.pouye@education.sn'),
(109, '846TXDDP', 'Mamadou', 'KEBE', 1478898750, 'mamadou.kebe@education.sn'),
(110, '986JYEKE', 'Abdourahmane', 'Gueye', 1538921320, 'abdourahmane.gueye@education.sn'),
(111, '966QDG3U', 'Saliou', 'FALL', 1866441510, 'saliou.fall1@education.sn'),
(112, '464RUCNB', 'Mouhamadou', 'MBENGUE', 1579405730, 'mouhamadou.mbengue@education.sn'),
(113, '849DDAMT', 'Magueye', 'Thiam', 1553748820, 'magueye.thiam1@education.sn'),
(114, '367XNG88', 'Ndiaga Ndiaye', 'Wade', 1579405730, 'ndiagandiaye.wade@education.sn'),
(115, '399MNHVH', 'Souleymane', 'THIAM', 1579405730, 'souleymane.thiam@education.sn'),
(116, '994RDGFH', 'Papa Samba', 'MBAYE', 1553748820, 'papasamba.mbaye@education.sn'),
(117, '867BVQJ4', 'Oumy', 'Badji', 1544151360, 'oumy.badji@education.sn'),
(118, '893RW6DB', 'mariama', 'daffe', 1982782740, 'mariama.daffe2@education.sn'),
(119, '674RY7AH', 'Astou', 'Cissokho', 1579405730, 'astou.cissokho@education.sn'),
(120, '997TH8HV', 'Oumy', 'Gueye', 1832722740, 'oumy.gueye1@education.sn'),
(121, '386FKD6X', 'Diakhou', 'Tall', 1982782740, 'diakhou.tall@education.sn'),
(122, '483TR3PH', 'HIPPOLYTE', 'SAMBOU', 1563582550, 'hippolyte.sambou@education.sn'),
(123, '364JVHED', 'COUMBA', 'GUISSE', 1563582550, 'coumba.guisse@education.sn'),
(124, '397RF3JF', 'Nar', 'Diankha', 1866441510, 'nar.diankha@education.sn'),
(125, '439TPRCR', 'Ndeye', 'NAME', 1982782740, 'ndeye.name@education.sn'),
(126, '866RCNXK', 'mariama', 'seck', 1982782740, 'mariama.seck13@education.sn'),
(127, '683KMPJV', 'Diattou', 'Faye', 1579405730, 'diattou.faye@education.sn'),
(128, '95WEJKHY', 'NDEYE FALL', 'DIENG', 1290902230, 'ndeyefall.dieng@education.sn'),
(129, '768VWMBK', 'Ngone', 'Seck', 1115779360, 'ngone.seck@education.sn'),
(130, '476FNNBU', 'Genevieve Estelle', 'MPAMY', 1186970740, 'genevieveestelle.mpamy@education.sn'),
(131, '836AT3BH', 'Diaw nar', 'Ngom', 1562092850, 'diawnar.ngom@education.sn'),
(132, '874BU8DB', 'Awa', 'DIENG', 1544151360, 'awa.dieng9@education.sn'),
(133, '699WD6GR', 'Kardiatou', 'Camara', 1186970740, 'kardiatou.camara@education.sn'),
(134, '637TJ4CE', 'COUMBA', 'NDIAYE', 1579405730, 'coumba.ndiaye@education.sn'),
(135, '847NY4HQ', 'Aminata', 'Diallo', 1770461530, 'aminata.diallo@education.sn'),
(136, '874K68MQ', 'Ndella Diouf', 'FAYE', 1579405730, 'ndelladiouf.faye@education.sn'),
(137, '493CACBT', 'Fatou', 'BOB', 1186970740, 'fatou.bob@education.sn'),
(138, '934RCNK3', 'AWA', 'DIALLO', 1186970740, 'awa.diallo4@education.sn'),
(139, '636TM3A7', 'DIARRA', 'SOW', 1982782740, 'diarra.sow@education.sn'),
(140, '769BGKVY', 'Awa', 'DIONGUE', 1553748820, 'awa.diongue@education.sn'),
(141, '797CUWTD', 'mariama', 'diouf', 1432067520, 'mariama.diouf37@education.sn'),
(142, '364UYRU9', 'Thiaba', 'DIENG', 1050362770, 'thiaba.dieng@education.sn'),
(143, '364UJTBJ', 'ndeye khary mame', 'faye', 1186970740, 'ndeyekhary.faye@education.sn'),
(144, '749HAQED', 'SEYNABOU', 'MBAYE', 1159343490, 'seynabou.mbaye@education.sn'),
(145, '497MNEAX', 'Arame', 'TOURE', 1563582550, 'arame.toure@education.sn'),
(146, '348DRDQV', 'Mame Maréma', 'DIOP', 1982782740, 'mamemarema.diop@education.sn'),
(147, '844PYNTD', 'Fatou', 'SARR', 1932617310, 'fatou.sarr@education.sn'),
(148, '786WYTNV', 'FATOU', 'MBENGUE', 1186970740, 'fatou.mbengue@education.sn'),
(149, '448HVQ87', 'YEYA', 'LY', 1186970740, 'yeya.ly1@education.sn'),
(150, '967WEB98', 'Marie Madeleine', 'NDONG', 1579405730, 'mariemadeleine.ndong@education.sn'),
(151, '737PMBA7', 'Faty', 'SEYE', 1186970740, 'faty.seye@education.sn'),
(152, '868TWTKP', 'Fatou Kine', 'Mbaye', 1115779360, 'fatoukine.mbaye1@education.sn'),
(153, '383CTX7R', 'Aminata', 'DIENA', 1562092850, 'aminata.diena@education.sn'),
(154, '637WDYUG', 'Madeleine', 'FALL', 1432067520, 'madeleine.fall3@education.sn'),
(155, '897AW67R', 'Ndeye Aby', 'NDAW', 1544151360, 'ndeyeaby.ndaw@education.sn'),
(156, '338PUJX4', 'Khady', 'Sene', 1579405730, 'khady.sene@education.sn'),
(157, '966HFBQ3', 'debo', 'mbaye', 1579405730, 'debo.mbaye@education.sn'),
(158, '948V7EKB', 'Khoudia Bassirou', 'Ndao', 1982782740, 'khoudiabassirou.ndao@education.sn'),
(159, '496YMU36', 'Khary', 'NDIAYE', 1872351910, 'khary.ndiaye@education.sn'),
(160, '664YGKMP', 'Mariata', 'Ba', 1770461530, 'mariata.ba@education.sn'),
(161, '488RFMJE', 'Mame rose', 'Fall', 1579405730, 'mamerose.fall@education.sn'),
(162, '673BQDRA', 'Sokhna', 'NDIAYE', 1579405730, 'sokhna.ndiaye1@education.sn');

-- --------------------------------------------------------

--
-- Structure de la table `renouvellement`
--

CREATE TABLE `renouvellement` (
  `id_renouvellement` int(11) NOT NULL,
  `montant` bigint(20) DEFAULT NULL,
  `id_carte` int(11) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `structure`
--

CREATE TABLE `structure` (
  `code_str` bigint(20) NOT NULL,
  `id_categorie` int(2) NOT NULL,
  `sigle_str` varchar(50) DEFAULT NULL,
  `libelle` varchar(250) NOT NULL,
  `date_creation_str` varchar(100) DEFAULT NULL,
  `email_str` varchar(100) DEFAULT NULL,
  `tel_str` char(20) DEFAULT NULL,
  `etat_str` tinyint(1) DEFAULT NULL,
  `date_insert` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `structure`
--

INSERT INTO `structure` (`code_str`, `id_categorie`, `sigle_str`, `libelle`, `date_creation_str`, `email_str`, `tel_str`, `etat_str`, `date_insert`) VALUES
(1016310720, 1, NULL, 'DIVISION ETUDE ANALYSE ET PROGRAMMES', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1025022210, 1, 'ODELS', 'ODELS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1026726200, 1, 'CNRE', 'CENTRE NATIONAL DE RESSOURCES EDUCATIONNELLE', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1050362770, 1, ' DEQS', 'DIRECTION DES EQUIPEMENTS SCOLAIRES', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1090399160, 1, 'SADEF', 'SADEF', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1093653390, 1, 'SELS/OR', 'SELS/OR', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1094533540, 1, 'PASEB', 'PROGRAMME D’APPUI AU SYSTEME EDUCATIF DE BASE AU SéNéGAL  ', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1111789570, 1, 'CIME', 'CELLULE INFORMATIQUE DU MINISTèRE DE L’EDUCATION   ', NULL, NULL, NULL, 1, '2018-04-24 18:35:02'),
(1115779360, 1, 'DCAS', 'DIVISION DES CANTINES SCOLAIRES ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1127546280, 1, 'CUSEMS 2', 'CUSEMS 2', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1130379380, 1, 'PAEBCA', 'PROGRAMME D APPUI A L EDUCATION DE BASE DE LA CASAMANCE ', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1138847950, 1, 'FNERE', 'FORCE NATIONAL DES ENSEIGNANTS POUR LE RENOUVEAU DE L\'EDUCATION', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1154914640, 1, 'UNESCO', 'SECRETARIAT GENERAL PERMANENT DE LA COMMISSION NATIONALE POUR  L’UNESCO', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1159343490, 1, 'PAQEEB', 'PROJET D’AMéLIORATION DE LA QUALITé ET DE L’EQUITé DE L’EDUCATION DE BASE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1173765310, 1, 'SCEMES', 'SCEMES', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1174469590, 1, 'CPM', 'CELLULE DE PASSATION DES MARCHES', NULL, NULL, NULL, 1, '2018-04-24 18:35:02'),
(1182141030, 1, 'SUDES ', 'SUDES', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1182320250, 1, 'SYPROS', 'SYPROS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1186970740, 1, 'DRH', 'DIRECTION DES RESSOURCES HUMAINES  ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1215466110, 1, 'SDEA', 'SDEA', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1225263010, 1, 'SAEMSS/CUSEMS', 'SAEMSS/CUSEMS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1248131190, 1, 'CUSEMS', 'CUSEMS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1265389050, 1, 'ADES', 'ADES', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1290902230, 1, 'SIMEN', 'SYSTEME D\'INFORMATION ET MANAGEMENT DE L\'EDUCATION NATIONALE', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1294167480, 1, 'SYDELS', 'SYDELS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1311273430, 1, 'OPES', 'OPES', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1346757130, 1, 'SEPPI', 'SEPPI', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1348495690, 1, 'CNOSP', 'CENTRE NATIONAL DE L’ORIENTATION SCOLAIRE ET PROFESSIONNELLE ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1352127250, 1, NULL, 'DIRECTION DE L EDUCATION PRESCOLAIRE', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1352932430, 1, 'PAEF', 'PROJET D APPUI A L EDUCATION DES FILLES', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1359989150, 1, 'UDEPL (PRIVE)', 'UDEPL (PRIVE)', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1392688860, 1, 'IMPRIMEN', 'IMPRIMERIE DE L\'EDUCATION NATIONALE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1420082910, 1, 'SNELAS/FC', 'SNELAS/FC', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1432067520, 1, ' ID', 'INSPECTION DES DAARAS', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1449931990, 1, 'COF', 'CHARGé DES OPéRATIONS FINANCIèRES', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(1466847420, 1, 'PREMAS', 'PROJET POUR LA PRéSERVATION DES MANUELS SCOLAIRES', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1474712690, 1, NULL, 'PROJET D\'APPUI à LA MODERNISATION DES DAARA  ', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1478898750, 1, ' DEPS', 'DIRECTION DE L’EDUCATION PRéSCOLAIRE', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1481958550, 1, 'SAEMESS', 'SAEMESS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1493742260, 1, 'BS', 'BUREAU DE SUIVI  ', NULL, NULL, NULL, 1, '2018-04-24 18:35:02'),
(1498593900, 1, 'DC', 'DIRECTION DU CABINET ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1519598220, 1, 'INEADE', 'INSTITUT NATIONAL D’ETUDES ET D’ACTIONS POUR LE DéVELOPPEMENT DE L’EDUCATION ', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1520159440, 1, 'BM', 'BUREAU MINISTRE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1534367450, 1, 'SNEF', 'SNEF', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1538921320, 1, 'DPRE', 'DIRECTION DE LA PLANIFICATION ET DE LA RéFORME DE L’EDUCATION ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1539479260, 1, 'ELAN', 'ELAN', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1544151360, 1, 'DEE', 'DIRECTION DE L’ENSEIGNEMENT ELéMENTAIRE ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1548757860, 1, 'ODES', 'ODES', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1551270300, 1, 'IGEF', 'INSPECTION GéNéRALE DE L’EDUCATION ET DE LA FORMATION', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1552521340, 1, 'SIENS (INSPECTEUR)', 'SIENS (INSPECTEUR)', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1553748820, 1, 'DAJLD', 'DIVISION DES AFFAIRES JURIDIQUES, DES LIAISONS ET DE LA DOCUMENTATION', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1562092850, 1, 'SG', 'SECRÉTARIAT GENERAL ', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1563582550, 1, 'DFC', 'DIRECTION DE LA FORMATION ET DE LA COMMUNICATION ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1579405730, 1, 'DAGE', 'DIRECTION DE L’ADMINISTRATION GéNéRALE ET DE L’EQUIPEMENT ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1580935920, 1, 'SYDELS/O', 'SYDELS/O', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1613085340, 1, 'SEPE', 'SEPE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1628800130, 1, 'RAP', 'RENFORCEMENT DE L’APPUI à LA PROTECTION DES ENFANTS DANS L’ÉDUCATION AU SéNéGAL, ', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1633457810, 1, 'UDEN', 'UDEN', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1644208050, 1, 'PNLE', 'USAID/PROGRAMME LECTURE POUR TOUS', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1645970020, 1, 'OIS/RD', 'OIS/RD', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1650150940, 1, 'DCMS', 'DIVISION DU CONTRôLE MéDICAL SCOLAIRE ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1652109370, 1, 'PAAME', 'PROJET D’AMéLIORATION DES APPRENTISSAGES  EN MATHéMATIQUES  à  ÉLéMENTAIRE', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1660624970, 1, 'PAEF-PLUS', 'PROJET D\'APPUI à L\'éDUCATION FéMININE ET à L\'EMPOWERMENT DES FEMMES POUR DéVELOPPEMENT LOCAL INCLUSIF ', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1663332180, 1, NULL, 'INSPECTION INTERNE ', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1664374540, 1, 'SNECS (PRIVE)', 'SNECS (PRIVE)', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1679698450, 1, 'MFPAA', 'MFPAA', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1683648240, 1, 'SNEEL', 'SNEEL', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1730246120, 1, 'IAAF', 'INSPECTION DES AFFAIRES ADMINISTRATIVES ET FINANCIERES', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1739484590, 1, 'UES', 'UES', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1748212410, 1, 'SNEEPS ', 'SNEEPS ', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1756789820, 1, 'CDEFS', 'CDEFS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1770461530, 1, 'DEA', 'DIVISION DE L’ENSEIGNEMENT ARABE ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1774601620, 1, NULL, 'DIVISION STATISTIQUE ET PROSPECTIVE', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1832722740, 1, 'DEP', 'DIVISION L’ENSEIGNEMENT PRIVé ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1833708360, 1, 'FIDUEF', 'FIDUEF', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1834475420, 1, 'RNPT', 'RESSOURCES NUMERIQUES POUR TOUS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1836840650, 1, 'SUNIR', 'SUNIR', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1837022140, 1, 'SNELAS/CNTS', 'SNELAS/CNTS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1844845400, 1, 'OIS', 'OIS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1854629610, 1, 'DEXCO', 'DIRECTION DES EXAMENS ET CONCOURS ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1866441510, 1, 'DEMSG', 'DIRECTION DE L’ENSEIGNEMENT MOYEN ET SECONDAIRE GéNéRAL ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1869782370, 1, 'PAMOD', 'PROGRAMME D APPUI A LA MODERNISATION DES DAARA', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(1883711110, 1, 'SELS', 'SELS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1917617710, 1, ' DSAJ', 'DIVISION DES SPORTS ET DES ACTIVITéS DE JEUNESSE', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1924360000, 1, 'SELS/A', 'SELS/A', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1931094230, 1, 'ADEPT', 'ADEPT', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1932406510, 1, 'ODES/A', 'ODES/A', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1932617310, 1, 'ADEM', 'APPUI AU DéVELOPPEMENT DE L EDUCATION MOYEN', NULL, NULL, NULL, 1, '2018-04-24 18:35:02'),
(1934180100, 1, 'IS', 'INSTITUT ISLAMIQUE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(1935263440, 1, 'SNEEL/CNTS', 'SNEEL/CNTS', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1943061330, 1, 'PROZAP', 'PROJET ZéRO ABRI PROVISOIRE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1943635930, 1, 'CBM', 'CONTROLEUR BUDGéTAIRE MINISTéRIEL', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(1951121090, 1, 'DRTS', 'DIVISION DE LA RADIODIFFUSION ET TéLéVISION SCOLAIRE ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1965302150, 1, 'SAES (SUPERIEUR)', 'SAES (SUPERIEUR)', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1969608540, 1, 'APTE – SéNéGAL', 'AMéLIORATION DES PERFORMANCES DE TRAVAIL ET D’ENTREPRENARIAT AU SéNéGAL ', NULL, NULL, NULL, 1, '2018-04-24 18:35:02'),
(1978518180, 1, 'CPLA', 'CPLA ()', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1982782740, 1, 'DALN', 'DIRECTION DE L’ALPHABéTISATION ET DES LANGUES NATIONALES ', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(1983988190, 1, 'REEL', 'REEL', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1988832660, 1, 'SNEEL/FC', 'SNEEL/FC', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(1990403960, 1, 'DCS', 'DIRECTION DES CONSTRUCTION SCOLAIRES', NULL, NULL, NULL, 1, '2018-04-24 18:35:03'),
(2019473000, 2, 'IEFTHC', 'IEF THIES COMMUNE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2030762030, 2, 'IEFSAR', 'IEF SARAYA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2035468280, 2, NULL, 'IA KAOLACK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2038618300, 2, NULL, 'IA PIKINE-GUEDIAWAYE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2043757800, 2, 'IEFTIV', 'IEF TIVAOUANE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2057393910, 2, 'IEFKOUMP', 'IEF KOUMPENTOUM', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2058711010, 2, 'IMEZIG', 'IME ZIGUINCHOR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2073287220, 2, 'IEFZIG', 'IEF ZIGUINCHOR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2076670230, 2, 'CRFPEK', 'CRFPE KAOLACK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2084501980, 2, 'CRFPESL', 'CRFPE SAINT-LOUIS', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2087341840, 2, 'CAOSPMT', 'CAOSP MATAM', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2088182320, 2, 'IEFVELI', 'IEF VELINGARA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2092178660, 2, '', 'INSPECTION MEDICALE DES ECOLES DE LOUGA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2116667920, 2, 'IEFBK', 'IEF BAKEL', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2120422990, 2, 'IEFTC', 'IEF TAMBA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2124859800, 2, 'IEFKLC', 'IEF KAOLACK COMMUNE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2125515030, 2, 'IEFSAL', 'IEF SALEMATA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2126610070, 2, 'IEFBIG1', 'IEF BIGNONA1', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2127913720, 2, 'IEFDIAM', 'IEF DIAMNIADIO', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2134858950, 2, 'IEFMALH', 'IEF MALEM HODAR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2135592030, 2, 'IMEDK', 'IME DAKAR', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(2143524180, 2, 'IMEFK', 'IME FATICK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2146725910, 2, 'IEFSED', 'IEF SEDHIOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2148362780, 2, NULL, 'IA RUFISQUE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2152725660, 2, NULL, 'IA FATICK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2164976080, 2, 'IEFKD', 'IEF KEDOUGOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2166818170, 2, 'CAOSPSL', 'CAOSP SAINT-LOUIS', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2189313480, 2, 'IEFPIK', 'IEF PIKINE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2195182510, 2, 'IMETC', 'IME TAMBA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2210454430, 2, 'IEFALM', 'IEF ALMADIES', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2215582600, 2, 'IEFPOD', 'IEF PODOR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2218324850, 2, 'CAOSPFK', 'CAOSP FATICK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2219600970, 2, 'CAOSPRUF', 'CAOSP RUFISQUE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(2221618710, 2, 'IEFMYF', 'IEF MEDINA YORO FOULAH', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2224033760, 2, NULL, 'IA SAINT-LOUIS', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2226888890, 2, NULL, 'IA DAKAR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2235608110, 2, 'IEFGUE', 'IEF GUEDIAWAYE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2251861030, 2, 'IMESL', 'IME SAINT-LOUIS', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2255259320, 2, 'CAOSPDL', 'CAOSP DIOURBEL', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(2268785040, 2, 'IEFBIG2', 'IEF BIGNONA2', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2284707490, 2, 'CAOSPDK', 'CAOSP DAKAR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2286586930, 2, 'IEFBAM', 'IEF BAMBEY', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(2288321810, 2, 'IEFMBA', 'IEF MBACKE', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(2288800120, 2, 'IEFSTLC', 'IEF SAINT-LOUIS COMMUNE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2291667800, 2, 'CRFPEMT', 'CRFPE MATAM', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2315970530, 2, 'IMESED', 'IME SEDHIOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2316676310, 2, 'IEFMB1', 'IEF MBOUR 1', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2324180900, 2, NULL, 'IA MATAM', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2335731470, 2, 'IEFKAN', 'IEF KANEL', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2337441770, 2, 'IEFRF', 'IEF RANEROU FERLO', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2338115310, 2, 'CAOSPLG', 'CAOSP LOUGA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2339171060, 2, NULL, 'IA KOLDA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2356624180, 2, 'CRFPESD', 'CRFPE SEDHIOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2359760430, 2, 'IEFDKP', 'IEF DAKAR PLATEAU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2363966110, 2, 'CRFPEDK', 'CRFPE DAKAR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2372924460, 2, 'CRFPETH', 'CRFPE DE THIES', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2375467660, 2, 'IEFKLD', 'IEF KAOLACK DEPARTEMENT', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2379764280, 2, 'IMEKD', 'IME KOLDA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2382024590, 2, 'IEFGUING', 'IEF GUINGUINEO', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2389697890, 2, 'IEFBOUN', 'IEF BOUNKILING', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2413736640, 2, NULL, 'IA LOUGA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2413782410, 2, 'IEFLG', 'IEF LOUGA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2420217820, 2, 'CAOSPTC', 'CAOSP TAMBA		', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2420679050, 2, 'IEFMT', 'IEF MATAM', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2420738380, 2, 'IEFSANG', 'IEF SANGALKAM', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2430208740, 2, 'IEFKF', 'IEF KAFFRINE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2438657860, 2, 'CAOSPKL', 'CAOSP KAOLACK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2446889400, 2, 'CAOSPKG', 'CAOSP KEDOUGOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2448417930, 2, 'IMEKF', 'IME KAFFRINE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2464496660, 2, 'IEFGOUD', 'IEF GOUDIRY', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2475412190, 2, 'IEFOUSS', 'IEF OUSSOUYE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2492944400, 2, 'CRFPEKF', 'CRFPE KAFFRINE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2496480910, 2, 'IEFFOUND', 'IEF FOUNDIOUGNE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2513435360, 2, NULL, 'IA SEDHIOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2517636280, 2, 'IEFSTLD', 'IEF SAINT-LOUIS DPT', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2519457240, 2, 'CAOSPZG', 'CAOSP ZIGUINCHOR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2521950630, 2, NULL, 'IA THIES', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2523814950, 2, 'IEFKOUN', 'IEF KOUNGHEUL', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2524623140, 2, NULL, 'IA TAMBA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2530528050, 2, '', 'INSTITUT NATIONAL DE FORMATION ET D\'EDUCATION DES JEUNES AVEUGLES', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(2545000030, 2, 'IEFGOS', 'IEF GOSSAS', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2553293250, 2, 'IMETH', 'IME THIES', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2553444740, 2, 'IEFTHIA', 'IEF THIAROYE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2572021210, 2, 'CRFPEKG', 'CRFPE KEDOUGOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2599109080, 2, 'IEFTHD', 'IEF THIES DEPARTEMENT', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2613623540, 2, 'CAOSPTH', 'CAOSP THIES', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2639045090, 2, 'IEFNIOR', 'IEF NIORO DU RIP', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2644489840, 2, 'IMEDL', 'IME DIOURBEL', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(2650198890, 2, NULL, 'IA KAFFRINE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2655789760, 2, 'IMEKD', 'IME KEDOUGOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2657264140, 2, 'IEFPA', 'IEF PARCELLES ASSAINIES', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2658070130, 2, NULL, 'IA ZIGUINCHOR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2661087930, 2, 'CRFPEKD', 'CRFPE KOLDA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2662357880, 2, NULL, 'IA KEDOUGOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2667808430, 2, 'IMERUF', 'IME RUFISQUE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(2669023930, 2, 'CRFPELG', 'CRFPE LOUGA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2670395360, 2, 'IEFRUFC', 'IEF RUFISQUE COMMUNE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2674052660, 2, 'IEFKL', 'IEF KOLDA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2691640490, 2, 'IEFGDK', 'IEF GRAND DAKAR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2720771800, 2, 'CAOSPSD', 'CAOSP SEDHIOU', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2728118710, 2, 'IEFBIR', 'IEF BIRKELANE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2742184310, 2, 'IMEKL', 'IME KOALACK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2755568180, 2, 'CAOSPKF', 'CAOSP KAFFRINE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2756370070, 2, 'IMEPK', 'IME PIKINE GUEDIAWAYE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(2761915290, 2, 'CRFPETC', 'CRFPE DE TAMBA', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(2773523080, 2, 'IEFDIOF', 'IEF DIOFIOR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2781190470, 2, NULL, 'IA DIOURBEL', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2793122150, 2, 'IEFMB2', 'IEF MBOUR 2', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2829465350, 2, 'CRFPEZG', 'CRFPE ZIGUINCHOR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2850021450, 2, 'IEFKEB', 'IEF KEBEMER', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2860448340, 2, 'IEFGOUD', 'IEF GOUDOMP', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2894864020, 2, 'CRFPEDL', 'CRFPE DIOURBEL', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(2895709760, 2, 'IEFPET', 'IEF PETE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2926943430, 2, 'IEFDAG', 'IEF DAGANA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2939226180, 2, 'CRFPEFK', 'CRFPE FATICK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2945283900, 2, 'CAOSPPG', 'CAOSP PIKINE-GUEDIAWAYE', NULL, NULL, NULL, 1, '2019-08-02 09:59:16'),
(2960709840, 2, 'IEFLING', 'IEF LINGUERE', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2972951230, 2, 'CAOSPKD', 'CAOSP KOLDA', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2973067000, 2, 'IEFKM', 'IEF KEUR MASSAR', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2982213000, 2, 'IEFFK', 'IEF FATICK', NULL, NULL, NULL, 1, '2018-05-14 15:12:07'),
(2982858500, 2, 'IEFDL', 'IEF DIOURBEL', NULL, NULL, NULL, 1, '2018-04-24 18:35:04'),
(2991731900, 2, 'IEFMT', 'IME MATAM', NULL, NULL, NULL, 1, '2018-05-14 15:12:07');

-- --------------------------------------------------------

--
-- Structure de la table `structure_old`
--

CREATE TABLE `structure_old` (
  `code_str` bigint(20) NOT NULL,
  `libelle` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `structure_old`
--

INSERT INTO `structure_old` (`code_str`, `libelle`) VALUES
(1026726200, 'CENTRE NATIONAL DE RESSOURCES EDUCATIONNELLE'),
(1050362770, 'DIRECTION DES EQUIPEMENTS SCOLAIRES'),
(1094533540, 'PROGRAMME DAPPUI AU SYST?®ME EDUCATIF DE BASE AU S?©N?©GAL  '),
(1111789570, 'CELLULE INFORMATIQUE DU MINIST?®RE DE LEDUCATION¬†¬† '),
(1115779360, 'DIVISION DES CANTINES SCOLAIRES '),
(1130379380, 'PROGRAMME D APPUI A L EDUCATION DE BASE DE LA CASAMANCE '),
(1154914640, 'SECRETARIAT GENERAL PERMANENT DE LA COMMISSION NATIONALE POUR'),
(1174469590, 'CELLULE DE PASSATION DES MARCHES'),
(1186970740, 'DIRECTION DES RESSOURCES HUMAINES¬†¬†'),
(1290902230, 'SIMEN'),
(1348495690, 'CENTRE NATIONAL DE LORIENTATION SCOLAIRE ET PROFESSIONNELLE '),
(1352127250, 'DIRECTION DE L EDUCATION PRESCOLAIRE'),
(1352932430, 'PROJET D APPUI A L EDUCATION DES FILLES'),
(1432067520, 'INSPECTION DES DAARAS'),
(1449931990, 'CHARG?© DES OP?©RATIONS FINANCI?®RES'),
(1474712690, 'PROJET DAPPUI ?† LA MODERNISATION DES DAARA  '),
(1478898750, 'DIRECTION DE LEDUCATION PR?©SCOLAIRE'),
(1493742260, 'BUREAU DE SUIVI¬†¬†'),
(1498593900, 'DIRECTION DU CABINET '),
(1519598220, 'INSTITUT NATIONAL DETUDES ET DACTIONS POUR LE D?©VELOPPEMENT DE LEDUCATION '),
(1538921320, 'DIRECTION DE LA PLANIFICATION ET DE LA R?©FORME DE LEDUCATION '),
(1544151360, 'DIRECTION DE LENSEIGNEMENT EL?©MENTAIRE '),
(1551270300, 'INSPECTION G?©N?©RALE DE LEDUCATION ET DE LA FORMATION'),
(1553748820, 'DIVISION DES AFFAIRES JURIDIQUES, DES LIAISONS ET DE LA DOCUMENTATION'),
(1562092850, 'SECR?âTARIAT GENERAL '),
(1563582550, 'DIRECTION DE LA FORMATION ET DE LA COMMUNICATION '),
(1579405730, 'DIRECTION DE LADMINISTRATION G?©N?©RALE ET DE LEQUIPEMENT '),
(1628800130, 'RENFORCEMENT DE LAPPUI ?† LA PROTECTION DES ENFANTS DANS L?âDUCATION AU S?©N?©GAL, '),
(1644208050, 'USAID/PROGRAMME NATIONAL DE LECTURE '),
(1650150940, 'DIVISION DU CONTR?¥LE M?©DICAL SCOLAIRE '),
(1652109370, 'PROJET DAM?©LIORATION DES APPRENTISSAGES  EN MATH?©MATIQUES  ?†  ?âL?©MENTAIRE'),
(1660624970, 'PROJET DAPPUI ?† L?©DUCATION F?©MININE ET ?† LEMPOWERMENT DES FEMMES POUR D?©VELOPPEMENT LOCAL INCLUSIF '),
(1730246120, 'INSPECTION DES AFFAIRES ADMINISTRATIVES ET FINANCIERES'),
(1770461530, 'DIVISION DE LENSEIGNEMENT ARABE '),
(1832722740, 'DIVISION LENSEIGNEMENT PRIV?© '),
(1854629610, 'DIRECTION DES EXAMENS ET CONCOURS '),
(1866441510, 'DIRECTION DE LENSEIGNEMENT MOYEN ET SECONDAIRE G?©N?©RAL '),
(1869782370, 'PROGRAMME D APPUI A LA MODERNISATION DES DAARA'),
(1917617710, 'DIVISION DES SPORTS ET DES ACTIVIT?©S DE JEUNESSE'),
(1932617310, 'APPUI AU D?©VELOPPEMENT DE L EDUCATION MOYEN'),
(1943635930, 'CONTROLEUR BUDG?©TAIRE MINIST?©RIEL'),
(1951121090, 'DIVISION DE LA RADIODIFFUSION ET T?©L?©VISION SCOLAIRE '),
(1969608540, 'AM?©LIORATION DES PERFORMANCES DE TRAVAIL ET DENTREPRENARIAT AU S?©N?©GAL '),
(1982782740, 'DIRECTION DE LALPHAB?©TISATION ET DES LANGUES NATIONALES '),
(1990403960, 'DIRECTION DES CONSTRUCTION SCOLAIRES');

-- --------------------------------------------------------

--
-- Structure de la table `sys_menu`
--

CREATE TABLE `sys_menu` (
  `id_menu` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `etat` enum('-1','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sys_menu`
--

INSERT INTO `sys_menu` (`id_menu`, `code`, `libelle`, `etat`) VALUES
(1, 'DASH', 'DASHBOARD', '1'),
(2, 'SECURITE', 'SECURITE', '1'),
(14, 'CONFIGURATION', 'CONFIGURATION', '1'),
(15, 'RENOUVELLEMENT', 'renouvellement', '1'),
(16, 'COMMANDE', 'commande', '1');

-- --------------------------------------------------------

--
-- Structure de la table `sys_sous_menu`
--

CREATE TABLE `sys_sous_menu` (
  `id_sous_menu` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `etat` enum('-1','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sys_sous_menu`
--

INSERT INTO `sys_sous_menu` (`id_sous_menu`, `id_menu`, `code`, `libelle`, `etat`) VALUES
(1, 2, 'USR', 'Utilisateurs', '1'),
(2, 2, 'MENU', 'Menu', '1'),
(3, 2, 'LST_MENU', 'Liste Menu', '1'),
(4, 2, 'LST_S_MENU', 'Liste sous menus', '1'),
(5, 2, 'PROFIL', 'Profil', '1'),
(6, 1, 'DASH', 'Dashboard', '1'),
(21, 2, 'AGENT', 'AGENT', '1'),
(26, 14, 'CARTE', 'Carte', '1'),
(27, 14, 'VEHICULE', 'Vehicule', '1'),
(28, 14, 'MARQUE', 'Marque', '1'),
(29, 16, 'COMMANDE', 'Commande', '1'),
(30, 15, 'RENOUVELLEMENT', 'renouvellement', '1');

-- --------------------------------------------------------

--
-- Structure de la table `sys_type_action`
--

CREATE TABLE `sys_type_action` (
  `id_actions` int(11) NOT NULL,
  `id_type_profil` int(11) UNSIGNED NOT NULL,
  `id_sous_menu` int(11) NOT NULL,
  `d_read` enum('-1','1') NOT NULL DEFAULT '-1',
  `d_add` enum('-1','1') NOT NULL DEFAULT '-1',
  `d_upd` enum('-1','1') NOT NULL DEFAULT '-1',
  `d_del` enum('-1','1') NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sys_type_action`
--

INSERT INTO `sys_type_action` (`id_actions`, `id_type_profil`, `id_sous_menu`, `d_read`, `d_add`, `d_upd`, `d_del`) VALUES
(1, 1, 3, '1', '1', '1', '1'),
(2, 1, 4, '1', '1', '1', '1'),
(3, 1, 5, '1', '1', '1', '1'),
(4, 1, 1, '1', '1', '1', '1'),
(5, 1, 2, '1', '1', '1', '1'),
(6, 1, 6, '1', '1', '1', '1'),
(7, 1, 8, '-1', '-1', '-1', '-1'),
(8, 1, 7, '-1', '-1', '-1', '-1'),
(9, 1, 9, '-1', '-1', '-1', '-1'),
(10, 1, 10, '-1', '-1', '-1', '-1'),
(11, 1, 11, '-1', '-1', '-1', '-1'),
(12, 1, 12, '-1', '-1', '-1', '-1'),
(13, 1, 13, '-1', '-1', '-1', '-1'),
(16, 1, 16, '-1', '-1', '-1', '-1'),
(18, 2, 8, '-1', '-1', '-1', '-1'),
(21, 1, 19, '-1', '-1', '-1', '-1'),
(22, 1, 21, '1', '1', '1', '1'),
(23, 4, 6, '1', '1', '1', '1'),
(27, 5, 6, '1', '1', '1', '1'),
(28, 5, 1, '1', '1', '1', '1'),
(29, 5, 5, '-1', '-1', '-1', '-1'),
(30, 5, 21, '1', '1', '1', '1'),
(31, 5, 7, '1', '1', '1', '1'),
(32, 5, 16, '1', '1', '1', '-1'),
(37, 2, 6, '1', '1', '1', '1'),
(38, 2, 1, '1', '1', '-1', '-1'),
(39, 2, 21, '1', '1', '-1', '-1'),
(40, 2, 7, '1', '1', '1', '1'),
(44, 1, 22, '-1', '-1', '-1', '-1'),
(45, 1, 23, '-1', '-1', '-1', '-1'),
(46, 1, 24, '-1', '-1', '-1', '-1'),
(47, 6, 6, '1', '1', '1', '-1'),
(48, 6, 7, '1', '1', '1', '-1'),
(52, 6, 22, '1', '1', '1', '-1'),
(53, 6, 23, '1', '1', '1', '-1'),
(54, 6, 24, '1', '1', '1', '-1'),
(55, 6, 21, '1', '1', '1', '-1'),
(56, 5, 22, '1', '1', '1', '-1'),
(57, 5, 23, '1', '1', '1', '-1'),
(58, 5, 24, '1', '1', '1', '-1'),
(59, 1, 25, '-1', '-1', '-1', '-1'),
(60, 4, 25, '1', '1', '1', '1'),
(61, 4, 22, '1', '1', '1', '1'),
(62, 4, 24, '1', '1', '1', '-1'),
(64, 5, 25, '1', '1', '1', '1'),
(65, 1, 26, '1', '1', '1', '1'),
(66, 1, 27, '1', '1', '1', '1'),
(67, 1, 28, '1', '1', '1', '1'),
(68, 1, 29, '1', '1', '1', '1'),
(69, 1, 30, '1', '1', '1', '1'),
(70, 7, 29, '1', '1', '1', '1'),
(71, 7, 6, '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Structure de la table `sys_type_profil`
--

CREATE TABLE `sys_type_profil` (
  `id_type_profil` int(10) NOT NULL,
  `libelle_type_profil` varchar(250) NOT NULL,
  `etat` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sys_type_profil`
--

INSERT INTO `sys_type_profil` (`id_type_profil`, `libelle_type_profil`, `etat`) VALUES
(1, 'Administrateur', '1'),
(7, 'DRH', '1');

-- --------------------------------------------------------

--
-- Structure de la table `sys_user`
--

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL,
  `ien` varchar(20) NOT NULL,
  `id_profil` int(11) NOT NULL,
  `code_str` bigint(20) DEFAULT NULL,
  `code_acces` varchar(255) DEFAULT NULL,
  `statut` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sys_user`
--

INSERT INTO `sys_user` (`id`, `ien`, `id_profil`, `code_str`, `code_acces`, `statut`) VALUES
(2, '956ND48W', 1, 1290902230, 'passer', '1'),
(3, '387dmvh9', 1, 1290902230, 'passer', '1'),
(5, '01WK8DA0', 1, 1290902230, NULL, '1'),
(6, '856OS0XE', 1, 1290902230, NULL, '1'),
(7, '493CACBT', 7, 1186970740, NULL, '1');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE `vehicule` (
  `id_vehicule` int(11) NOT NULL,
  `matricule_vehicule` varchar(45) DEFAULT NULL,
  `modele` varchar(255) DEFAULT NULL,
  `annee` varchar(4) DEFAULT NULL,
  `id_marque` int(11) NOT NULL,
  `numero_chassis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_personne`
--

CREATE TABLE `vehicule_personne` (
  `id_vehicule_personne` int(11) NOT NULL,
  `id_vehicule` int(11) DEFAULT NULL,
  `ien` varchar(8) DEFAULT NULL,
  `etat_affectation` enum('-1','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affectation_carte`
--
ALTER TABLE `affectation_carte`
  ADD PRIMARY KEY (`id_affectation`),
  ADD KEY `id_carte_idx` (`id_carte`),
  ADD KEY `id_vehicule_idx` (`id_vehicule`);

--
-- Index pour la table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ien` (`ien`);

--
-- Index pour la table `carte`
--
ALTER TABLE `carte`
  ADD PRIMARY KEY (`id_carte`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD UNIQUE KEY `date_cmd` (`date_cmd`,`IEN`),
  ADD KEY `fk_commande_Personnel1_idx` (`IEN`),
  ADD KEY `fk_commande_livraison1_idx` (`id_livraison`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id_livraison`),
  ADD UNIQUE KEY `date_livraison` (`date_livraison`,`code_str`),
  ADD KEY `fk_livraison_Structure_idx` (`code_str`),
  ADD KEY `fk_livraison_Personnel1_idx` (`Personnel_IEN`);

--
-- Index pour la table `livraison_ticket`
--
ALTER TABLE `livraison_ticket`
  ADD PRIMARY KEY (`id_livraison`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `renouvellement`
--
ALTER TABLE `renouvellement`
  ADD PRIMARY KEY (`id_renouvellement`),
  ADD KEY `fk_renouvellement_carte1_idx` (`id_carte`);

--
-- Index pour la table `structure`
--
ALTER TABLE `structure`
  ADD PRIMARY KEY (`code_str`);

--
-- Index pour la table `structure_old`
--
ALTER TABLE `structure_old`
  ADD PRIMARY KEY (`code_str`);

--
-- Index pour la table `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Index pour la table `sys_sous_menu`
--
ALTER TABLE `sys_sous_menu`
  ADD PRIMARY KEY (`id_sous_menu`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Index pour la table `sys_type_action`
--
ALTER TABLE `sys_type_action`
  ADD PRIMARY KEY (`id_actions`),
  ADD KEY `id_sous_menu` (`id_sous_menu`),
  ADD KEY `id_type_profil` (`id_type_profil`),
  ADD KEY `id_type_profil_2` (`id_type_profil`),
  ADD KEY `id_sous_menu_2` (`id_sous_menu`);

--
-- Index pour la table `sys_type_profil`
--
ALTER TABLE `sys_type_profil`
  ADD PRIMARY KEY (`id_type_profil`),
  ADD KEY `id_type_profil` (`id_type_profil`);

--
-- Index pour la table `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ien` (`ien`),
  ADD KEY `id_profil` (`id_profil`);

--
-- Index pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`id_vehicule`),
  ADD KEY `fk_vehicule_marque_idx` (`id_marque`);

--
-- Index pour la table `vehicule_personne`
--
ALTER TABLE `vehicule_personne`
  ADD PRIMARY KEY (`id_vehicule_personne`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `affectation_carte`
--
ALTER TABLE `affectation_carte`
  MODIFY `id_affectation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `carte`
--
ALTER TABLE `carte`
  MODIFY `id_carte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `id_livraison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `livraison_ticket`
--
ALTER TABLE `livraison_ticket`
  MODIFY `id_livraison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT pour la table `renouvellement`
--
ALTER TABLE `renouvellement`
  MODIFY `id_renouvellement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `structure_old`
--
ALTER TABLE `structure_old`
  MODIFY `code_str` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1990403961;

--
-- AUTO_INCREMENT pour la table `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `sys_sous_menu`
--
ALTER TABLE `sys_sous_menu`
  MODIFY `id_sous_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `sys_type_action`
--
ALTER TABLE `sys_type_action`
  MODIFY `id_actions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT pour la table `sys_type_profil`
--
ALTER TABLE `sys_type_profil`
  MODIFY `id_type_profil` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `id_vehicule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `vehicule_personne`
--
ALTER TABLE `vehicule_personne`
  MODIFY `id_vehicule_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affectation_carte`
--
ALTER TABLE `affectation_carte`
  ADD CONSTRAINT `id_carte` FOREIGN KEY (`id_carte`) REFERENCES `carte` (`id_carte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_vehicule` FOREIGN KEY (`id_vehicule`) REFERENCES `vehicule` (`id_vehicule`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `fk_livraison_Structure` FOREIGN KEY (`code_str`) REFERENCES `structure_old` (`code_str`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
