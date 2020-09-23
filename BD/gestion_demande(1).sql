-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 23 sep. 2020 à 17:05
-- Version du serveur :  10.4.6-MariaDB
-- Version de PHP :  7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion_demande`
--

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
(25, '833VN6A8', 'GUEYE', 'Amadou', 'amadou.gueye22@education.sn', 1290902230);

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `id_demande` int(11) NOT NULL,
  `numero_demande` varchar(100) NOT NULL,
  `objet_demande` varchar(255) NOT NULL,
  `date_demande` datetime NOT NULL,
  `etat_demande` enum('0','1') NOT NULL DEFAULT '0',
  `id_partenaire` int(11) NOT NULL,
  `id_type_structure` int(11) NOT NULL,
  `code_str` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

CREATE TABLE `partenaire` (
  `id_partenaire` int(11) NOT NULL,
  `nom_partenaire` varchar(100) NOT NULL,
  `tel_partenaire` varchar(17) NOT NULL,
  `email_partenaire` varchar(150) NOT NULL,
  `adr_partenaire` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `partenaire`
--

INSERT INTO `partenaire` (`id_partenaire`, `nom_partenaire`, `tel_partenaire`, `email_partenaire`, `adr_partenaire`, `date_enregistrement`) VALUES
(3, 'Orange', '772255635', 'Senelec@Senelec.sn', 'Dakar', '2020-08-19 02:48:01'),
(4, 'Senelec', '772255635', 'Senelec@Senelec.sn', 'Rufisque', '2020-08-19 10:02:53');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `id` int(11) NOT NULL,
  `ien` varchar(8) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(100) CHARACTER SET utf8 NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8 NOT NULL,
  `code_str` bigint(20) NOT NULL,
  `email_pro` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`id`, `ien`, `prenom`, `nom`, `code_str`, `email_pro`) VALUES
(3, '956ND48W', 'Adama', 'FALL', 1290902230, 'amada.fall@education.sn'),
(4, '833VN6A8', 'Amadou', 'GUEYE', 1290902230, 'amadou.gueye22@education');

-- --------------------------------------------------------

--
-- Structure de la table `structure`
--

CREATE TABLE `structure` (
  `code_str` bigint(20) NOT NULL,
  `libelle_structure` varchar(255) NOT NULL,
  `adresse_str` text DEFAULT NULL,
  `etat_str` char(10) DEFAULT NULL,
  `code_ia` smallint(6) DEFAULT NULL,
  `code_ief` smallint(6) DEFAULT NULL,
  `code_commune` smallint(6) DEFAULT NULL,
  `categorie_structure` tinyint(4) DEFAULT NULL,
  `libelle_ia` varchar(250) DEFAULT NULL,
  `libelle_ief` varchar(250) DEFAULT NULL,
  `libelle_commune` varchar(250) DEFAULT NULL,
  `cycle` varchar(50) DEFAULT NULL,
  `id_cycle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `structure`
--

INSERT INTO `structure` (`code_str`, `libelle_structure`, `adresse_str`, `etat_str`, `code_ia`, `code_ief`, `code_commune`, `categorie_structure`, `libelle_ia`, `libelle_ief`, `libelle_commune`, `cycle`, `id_cycle`) VALUES
(1024639920, 'CG MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1025022210, 'ODELS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1026726200, 'CENTRE NATIONAL DE RESSOURCES EDUCATIONNELLE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1033359650, 'PMN MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1050362770, 'DIRECTION DES EQUIPEMENTS SCOLAIRES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1064609020, 'ONFP MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1068292930, 'DC MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1090399160, 'SADEF', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1093653390, 'SELS/OR', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1094533540, 'PROGRAMME D’APPUI AU SYSTEME EDUCATIF DE BASE AU SéNéGAL  ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1111789570, 'CELLULE INFORMATIQUE DU MINISTèRE DE L’EDUCATION   ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1115779360, 'DIVISION DES CANTINES SCOLAIRES ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1116353790, 'PF2E MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1127546280, 'CUSEMS 2', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1130379380, 'PROGRAMME D APPUI A L EDUCATION DE BASE DE LA CASAMANCE ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1138847950, 'FORCE NATIONAL DES ENSEIGNANTS POUR LE RENOUVEAU DE L\'EDUCATION', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1154914640, 'SECRETARIAT GENERAL PERMANENT DE LA COMMISSION NATIONALE POUR  L’UNESCO', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1159343490, 'PROJET D’AMéLIORATION DE LA QUALITé ET DE L’EQUITé DE L’EDUCATION DE BASE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1173765310, 'SCEMES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1174469590, 'CELLULE DE PASSATION DES MARCHES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1182141030, 'SUDES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1182320250, 'SYPROS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1186970740, 'DIRECTION DES RESSOURCES HUMAINES  ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1187282660, 'APDA MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1197848500, 'CJ MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1215466110, 'SDEA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1225263010, 'SAEMSS/CUSEMS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1236701180, 'ANAMO MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1240984960, 'DART MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1248131190, 'CUSEMS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1265389050, 'ADES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1290902230, 'SYSTEME D\'INFORMATION ET MANAGEMENT DE L\'EDUCATION NATIONALE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1294167480, 'SYDELS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1311273430, 'OPES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1346757130, 'SEPPI', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1348495690, 'CENTRE NATIONAL DE L’ORIENTATION SCOLAIRE ET PROFESSIONNELLE ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1352932430, 'PROJET D APPUI A L EDUCATION DES FILLES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1359989150, 'UDEPL (PRIVE)', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1383411610, 'IAAF MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1392688860, 'IMPRIMERIE DE L\'EDUCATION NATIONALE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1420082910, 'SNELAS/FC', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1432067520, 'INSPECTION DES DAARAS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1449931990, 'CHARGé DES OPéRATIONS FINANCIèRES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1466847420, 'PROJET POUR LA PRéSERVATION DES MANUELS SCOLAIRES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1478898750, 'DIRECTION DE L’EDUCATION PRéSCOLAIRE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1481958550, 'SAEMESS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1493351950, 'IT MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1493742260, 'BUREAU DE SUIVI  ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1498593900, 'DIRECTION DU CABINET ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1519598220, 'INSTITUT NATIONAL D’ETUDES ET D’ACTIONS POUR LE DéVELOPPEMENT DE L’EDUCATION ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1520159440, 'BUREAU MINISTRE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1534367450, 'SNEF', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1538921320, 'DIRECTION DE LA PLANIFICATION ET DE LA RéFORME DE L’EDUCATION ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1539479260, 'ELAN', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1539928540, 'SG MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1544151360, 'DIRECTION DE L’ENSEIGNEMENT ELéMENTAIRE ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1548757860, 'ODES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1551270300, 'INSPECTION GéNéRALE DE L’EDUCATION ET DE LA FORMATION', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1552521340, 'SIENS (INSPECTEUR)', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1553748820, 'DIVISION DES AFFAIRES JURIDIQUES, DES LIAISONS ET DE LA DOCUMENTATION', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1562092850, 'SECRÉTARIAT GENERAL ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1563582550, 'DIRECTION DE LA FORMATION ET DE LA COMMUNICATION ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1579405730, 'DIRECTION DE L’ADMINISTRATION GéNéRALE ET DE L’EQUIPEMENT ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1579420290, 'CNQP MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1580935920, 'SYDELS/O', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1613085340, 'SEPE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1628800130, 'RENFORCEMENT DE L’APPUI à LA PROTECTION DES ENFANTS DANS L’ÉDUCATION AU SéNéGAL, ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1633457810, 'UDEN', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1644208050, 'USAID/PROGRAMME LECTURE POUR TOUS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1645970020, 'OIS/RD', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1650150940, 'DIVISION DU CONTRôLE MéDICAL SCOLAIRE ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1652109370, 'PROJET D’AMéLIORATION DES APPRENTISSAGES  EN MATHéMATIQUES  à  ÉLéMENTAIRE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1660624970, 'PROJET D\'APPUI à L\'éDUCATION FéMININE ET à L\'EMPOWERMENT DES FEMMES POUR DéVELOPPEMENT LOCAL INCLUSIF ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1663777050, '3FPT MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1664374540, 'SNECS (PRIVE)', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1679698450, 'MFPAA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1683648240, 'SNEEL', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1687120370, 'DE MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1730246120, 'INSPECTION DES AFFAIRES ADMINISTRATIVES ET FINANCIERES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1733157280, 'DA MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1735737510, 'CEP MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1739484590, 'UES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1742654110, 'SNOP MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1743705410, 'CNID MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1748212410, 'SNEEPS ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1756789820, 'CDEFS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1770461530, 'DIVISION DE L’ENSEIGNEMENT ARABE ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1832722740, 'DIVISION L’ENSEIGNEMENT PRIVé ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1833708360, 'FIDUEF', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1834475420, 'RESSOURCES NUMERIQUES POUR TOUS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1836840650, 'SUNIR', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1837022140, 'SNELAS/CNTS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1843720410, 'PROMET', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1844845400, 'OIS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1854629610, 'DIRECTION DES EXAMENS ET CONCOURS ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1866441510, 'DIRECTION DE L’ENSEIGNEMENT MOYEN ET SECONDAIRE GéNéRAL ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1868460180, 'PEJA MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1869782370, 'PROGRAMME D APPUI A LA MODERNISATION DES DAARA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1872351910, 'PADES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1883711110, 'SELS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1894858300, 'DAGE MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1917617710, 'DIVISION DES SPORTS ET DES ACTIVITéS DE JEUNESSE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1924360000, 'SELS/A', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1926207910, 'CPM MEFPA', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1931094230, 'ADEPT', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1932406510, 'ODES/A', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1932617310, 'APPUI AU DéVELOPPEMENT DE L EDUCATION MOYEN', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1934180100, 'INSTITUT ISLAMIQUE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1935263440, 'SNEEL/CNTS', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1943061330, 'PROJET ZéRO ABRI PROVISOIRE', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1943635930, 'CONTROLEUR BUDGéTAIRE MINISTéRIEL', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1951121090, 'DIVISION DE LA RADIODIFFUSION ET TéLéVISION SCOLAIRE ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1965302150, 'SAES (SUPERIEUR)', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1969608540, 'AMéLIORATION DES PERFORMANCES DE TRAVAIL ET D’ENTREPRENARIAT AU SéNéGAL ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1978518180, 'CPLA ()', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1982782740, 'DIRECTION DE L’ALPHABéTISATION ET DES LANGUES NATIONALES ', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1983988190, 'REEL', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1988832660, 'SNEEL/FC', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(1990403960, 'DIRECTION DES CONSTRUCTION SCOLAIRES', NULL, '1', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(2019473000, 'IEF THIES COMMUNE', NULL, '1', 190, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2030762030, 'IEF SARAYA', NULL, '1', 322, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2035468280, 'IA KAOLACK', NULL, '1', 253, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2038618300, 'IA PIKINE-GUEDIAWAYE', NULL, '1', 235, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2043757800, 'IEF TIVAOUANE', NULL, '1', 211, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2057393910, 'IEF KOUMPENTOUM', NULL, '1', 295, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2058711010, 'IME ZIGUINCHOR', NULL, '1', 251, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2073287220, 'IEF ZIGUINCHOR', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2076670230, 'CRFPE KAOLACK', NULL, '1', 253, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2084501980, 'CRFPE SAINT-LOUIS', NULL, '1', 249, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2087341840, 'CAOSP MATAM', NULL, '1', 247, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2088182320, 'IEF VELINGARA', NULL, '1', 332, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2116667920, 'IEF BAKEL', NULL, '1', 261, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2120422990, 'IEF TAMBA', NULL, '1', 329, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2124859800, 'IEF KAOLACK COMMUNE', NULL, '1', 284, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2125515030, 'IEF SALEMATA', NULL, '1', 320, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2126610070, 'IEF BIGNONA1', NULL, '1', 263, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2127913720, 'IEF DIAMNIADIO', NULL, '1', 147, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2134858950, 'IEF MALEM HODAR', NULL, '1', 252, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2135592030, 'IME DAKAR', NULL, '1', 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2143524180, 'IME FATICK', NULL, '1', 88, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2146725910, 'IEF SEDHIOU', NULL, '1', 324, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2148362780, 'IA RUFISQUE', NULL, '1', 145, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2152725660, 'IA FATICK', NULL, '1', 88, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2164976080, 'IEF KEDOUGOU', NULL, '1', 289, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2166818170, 'CAOSP SAINT-LOUIS', NULL, '1', 249, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2189313480, 'IEF PIKINE', NULL, '1', 235, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2195182510, 'IME TAMBA', NULL, '1', 250, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2210454430, 'IEF ALMADIES', NULL, '1', 4, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2215582600, 'IEF PODOR', NULL, '1', 316, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2218324850, 'CAOSP FATICK', NULL, '1', 88, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2219600970, 'CAOSP RUFISQUE', NULL, '1', 145, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2221618710, 'IEF MEDINA YORO FOULAH', NULL, '1', 309, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2224033760, 'IA SAINT-LOUIS', NULL, '1', 249, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2226888890, 'IA DAKAR', NULL, '1', 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2235608110, 'IEF GUEDIAWAYE', NULL, '1', 276, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2251861030, 'IME SAINT-LOUIS', NULL, '1', 249, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2255259320, 'CAOSP DIOURBEL', NULL, '1', 32, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2268785040, 'IEF BIGNONA2', NULL, '1', 264, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2284707490, 'CAOSP DAKAR', NULL, '1', 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2286586930, 'IEF BAMBEY', NULL, '1', 67, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2288321810, 'IEF MBACKE', NULL, '1', 67, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2288800120, 'IEF SAINT-LOUIS COMMUNE', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2291667800, 'CRFPE MATAM', NULL, '1', 247, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2315970530, 'IME SEDHIOU', NULL, '1', 248, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2316676310, 'IEF MBOUR 1', NULL, '1', 168, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2324180900, 'IA MATAM', NULL, '1', 247, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2335731470, 'IEF KANEL', NULL, '1', 282, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2337441770, 'IEF RANEROU FERLO', NULL, '1', 318, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2338115310, 'CAOSP LOUGA', NULL, '1', 257, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2339171060, 'IA KOLDA', NULL, '1', 256, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2356624180, 'CRFPE SEDHIOU', NULL, '1', 248, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2359760430, 'IEF DAKAR PLATEAU', NULL, '1', 10, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2363966110, 'CRFPE DAKAR', NULL, '1', 145, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2372924460, 'CRFPE DE THIES', NULL, '1', 166, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2375467660, 'IEF KAOLACK DEPARTEMENT', NULL, '1', 285, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2379764280, 'IME KOLDA', NULL, '1', 256, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2382024590, 'IEF GUINGUINEO', NULL, '1', 278, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2389697890, 'IEF BOUNKILING', NULL, '1', 268, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2413736640, 'IA LOUGA', NULL, '1', 257, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2413782410, 'IEF LOUGA', NULL, '1', 301, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2420217820, 'CAOSP TAMBA		', NULL, '1', 250, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2420679050, 'IEF MATAM', NULL, '1', 307, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2420738380, 'IEF SANGALKAM', NULL, '1', 159, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2430208740, 'IEF KAFFRINE', NULL, '1', 252, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2438657860, 'CAOSP KAOLACK', NULL, '1', 253, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2446889400, 'CAOSP KEDOUGOU', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2448417930, 'IME KAFFRINE', NULL, '1', 252, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2464496660, 'IEF GOUDIRY', NULL, '1', 272, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2475412190, 'IEF OUSSOUYE', NULL, '1', 313, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2492944400, 'CRFPE KAFFRINE', NULL, '1', 280, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2496480910, 'IEF FOUNDIOUGNE', NULL, '1', 114, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2513435360, 'IA SEDHIOU', NULL, '1', 248, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2517636280, 'IEF SAINT-LOUIS DPT', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2519457240, 'CAOSP ZIGUINCHOR', NULL, '1', 251, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2521950630, 'IA THIES', NULL, '1', 166, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2523814950, 'IEF KOUNGHEUL', NULL, '1', 297, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2524623140, 'IA TAMBA', NULL, '1', 250, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2545000030, 'IEF GOSSAS', NULL, '1', 136, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2553293250, 'IME THIES', NULL, '1', 166, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2553444740, 'IEF THIAROYE', NULL, '1', 235, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2572021210, 'CRFPE KEDOUGOU', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2599109080, 'IEF THIES DEPARTEMENT', NULL, '1', 194, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2613623540, 'CAOSP THIES', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2639045090, 'IEF NIORO DU RIP', NULL, '1', 311, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2644489840, 'IME DIOURBEL', NULL, '1', 32, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2650198890, 'IA KAFFRINE', NULL, '1', 252, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2655789760, 'IME KEDOUGOU', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2657264140, 'IEF PARCELLES ASSAINIES', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2658070130, 'IA ZIGUINCHOR', NULL, '1', 251, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2661087930, 'CRFPE KOLDA', NULL, '1', 256, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2662357880, 'IA KEDOUGOU', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2667808430, 'IME RUFISQUE', NULL, '1', 145, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2669023930, 'CRFPE LOUGA', NULL, '1', 257, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2670395360, 'IEF RUFISQUE COMMUNE', NULL, '1', 155, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2674052660, 'IEF KOLDA', NULL, '1', 256, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2691640490, 'IEF GRAND DAKAR', NULL, '1', 17, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2720771800, 'CAOSP SEDHIOU', NULL, '1', 248, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2728118710, 'IEF BIRKELANE', NULL, '1', 266, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2742184310, 'IME KOALACK', NULL, '1', 253, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2755568180, 'CAOSP KAFFRINE', NULL, '1', 252, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2756370070, 'IME PIKINE GUEDIAWAYE', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2761915290, 'CRFPE DE TAMBA', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2773523080, 'IEF DIOFIOR', NULL, '1', 88, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2781190470, 'IA DIOURBEL', NULL, '1', 32, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2793122150, 'IEF MBOUR 2', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2829465350, 'CRFPE ZIGUINCHOR', NULL, '1', 251, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2850021450, 'IEF KEBEMER', NULL, '1', 287, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2860448340, 'IEF GOUDOMP', NULL, '1', 274, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2894864020, 'CRFPE DIOURBEL', NULL, '1', 32, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2895709760, 'IEF PETE', NULL, '1', 333, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2926943430, 'IEF DAGANA', NULL, '1', 29, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2939226180, 'CRFPE FATICK', NULL, '1', 88, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2945283900, 'CAOSP PIKINE-GUEDIAWAYE', NULL, '1', 235, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2960709840, 'IEF LINGUERE', NULL, '1', 299, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2972951230, 'CAOSP KOLDA', NULL, '1', 256, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2973067000, 'IEF KEUR MASSAR', NULL, '1', 235, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2982213000, 'IEF FATICK', NULL, '1', 101, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2982858500, 'IEF DIOURBEL', NULL, '1', 51, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(2991731900, 'IME MATAM', NULL, '1', 247, NULL, NULL, 2, NULL, NULL, NULL, NULL, 0),
(3019784861, 'CEM BIRKELANE', 'BIRKELANE', '1', 252, 266, 343, 3, 'IA Kaffrine', 'IEF Birkelane', 'Com Birkelane', 'Moyen', 3),
(3029940401, 'CFA MAKA SACOUMBA', 'MAKA SACOUMBA', '1', 252, 266, 339, 3, 'IA Kaffrine', 'IEF Birkelane', 'Com Mabo', 'Moyen', 3),
(3039499461, 'CEM SAGNA', 'SAGNA', '1', 252, 304, 373, 3, 'IA Kaffrine', 'IEF Malem Hodar', 'Com Sagna', 'Moyen', 3),
(3044944071, 'CEM DIANKE SOUF', 'DIANKE SOUF', '1', 252, 304, 372, 3, 'IA Kaffrine', 'IEF Malem Hodar', 'Com Dianke Souf', 'Moyen', 3),
(3063289581, 'CEM SEGRE SECCO', 'SEGRE SECCO', '1', 252, 266, 341, 3, 'IA Kaffrine', 'IEF Birkelane', 'Com Ndiognick', 'Moyen', 3),
(3069039621, 'CEM GAINTH PATHE', 'GAINTH PATHE', '1', 252, 297, 363, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Gainthe Pathe', 'Moyen', 3),
(3113585881, 'CEM KEUR MBOUCKI', 'KEUR MBOUCKI', '1', 252, 266, 336, 3, 'IA Kaffrine', 'IEF Birkelane', 'Com Keur Mbouki', 'Moyen', 3),
(3160484661, 'CEM NGODIBA', 'NGODIBA', '1', 252, 280, 347, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kahi', 'Moyen', 3),
(3238813951, 'CEM KOUMBIDIA SOCE', 'KOUMBIDIA SOCE', '1', 252, 297, 358, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Saly Escale', 'Moyen', 3),
(3240240141, 'CEM THIERERE', 'BIRKELANE', '1', 252, 266, 343, 3, 'IA Kaffrine', 'IEF Birkelane', 'Com Birkelane', 'Moyen', 3),
(3279808941, 'CEM MAKA YOP', 'MAKA YOP', '1', 252, 297, 364, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Maka Yop', 'Moyen', 3),
(3286246901, 'CFA KOUNGHEUL', 'ESCALE KOUNGHEUL', '1', 252, 297, 366, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Koungheul', 'Moyen', 3),
(3287387631, 'CEM TOUBA MBELLA', 'TOUBA MBELLA', '1', 252, 266, 337, 3, 'IA Kaffrine', 'IEF Birkelane', 'Com Touba Mbella', 'Moyen', 3),
(3326044721, 'CEM KAFFRINE COMMUNE', 'MBAMBA', '1', 252, 280, 353, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kaffrine', 'Moyen', 3),
(3327832491, 'CEM LOUR ESCALE', 'LOUR ESCALE', '1', 252, 297, 360, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Lour Escale', 'Moyen', 3),
(3518898741, 'CFA KAFFRINE', 'DIAMAGUENE NDIOBENE', '1', 252, 280, 353, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kaffrine', 'Moyen', 3),
(3545165931, 'CEM SEGRE GATTA', 'SEGRE GATTA', '1', 252, 266, 342, 3, 'IA Kaffrine', 'IEF Birkelane', 'Com Ségré gatta', 'Moyen', 3),
(3565415781, 'CEM KAFFRINE 2', 'PAYS', '1', 252, 280, 353, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kaffrine', 'Moyen', 3),
(3581615171, 'CEM KOUNGHEUL COMMUNE', 'ESCALE KOUNGHEUL', '1', 252, 297, 366, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Koungheul', 'Moyen', 3),
(3624052081, 'CEM MEDINATOU SALAM2', '', '1', 252, 280, 352, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Medinatoul Salam 2', 'Moyen', 3),
(3632152061, 'CEM COMMUNE 2', 'ESCALE KOUNGHEUL', '1', 252, 297, 366, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Koungheul', 'Moyen', 3),
(3640614991, 'CEM DIAMAGUENE TP', 'DIAMAGUENE TP', '1', 252, 280, 353, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kaffrine', 'Moyen', 3),
(3668612511, 'CEM DIOCKOUL MBELBOUCK', 'DIOCKOUL MBELBOUCK', '1', 252, 280, 350, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Diokoul Mbelbouck', 'Moyen', 3),
(3728444671, 'CEM1 BABACAR COBAR NDAO', 'ESCALE KAFFRINE', '1', 252, 280, 353, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kaffrine', 'Moyen', 3),
(3789023611, 'CEM NDIOBENE SAMBA LAMO', 'NDIOBENE SAMBA LAMO', '1', 252, 304, 369, 3, 'IA Kaffrine', 'IEF Malem Hodar', 'Com Ndiobene samba lamo', 'Moyen', 3),
(3826476441, 'BST KAFFRINE', 'MBAMBA', '1', 252, 280, 353, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kaffrine', 'Moyen', 3),
(3877546751, 'CEM2 BABACAR COBAR NDAO', 'ESCALE KAFFRINE', '1', 252, 280, 353, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kaffrine', 'Moyen', 3),
(3878896491, 'CEM NIAHENE', 'NIAHENE', '1', 252, 304, 373, 3, 'IA Kaffrine', 'IEF Malem Hodar', 'Com Sagna', 'Moyen', 3),
(3917460201, 'CEM NDIOGNICK', 'NDIOGNICK', '1', 252, 266, 341, 3, 'IA Kaffrine', 'IEF Birkelane', 'Com Ndiognick', 'Moyen', 3),
(3936857631, 'CEM DAROU MINAM2', 'DAROU MINAM2', '1', 252, 304, 368, 3, 'IA Kaffrine', 'IEF Malem Hodar', 'Com Darou Minam 2', 'Moyen', 3),
(3938174871, 'CEM KATHIOTTE', 'KATHIOTTE', '1', 252, 280, 351, 3, 'IA Kaffrine', 'IEF Kaffrine', 'Com Kathiote', 'Moyen', 3),
(3996582431, 'CEM MISSIRA WADENE', 'MISSIRA WADENE', '1', 252, 297, 365, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Missirah Wadene', 'Moyen', 3),
(3998742571, 'CEM IDA MOURIDE', 'IDA MOURIDE', '1', 252, 297, 357, 3, 'IA Kaffrine', 'IEF Koungheul', 'Com Ida Mouride', 'Moyen', 3);

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
(3, 'CONFIGURATION', 'CONFIGURATION', '1'),
(7, 'PARTENAIRE', 'PARTENAIRES', '1'),
(8, 'DEMANDE', 'DEMANDE', '1'),
(9, 'STRUCTURE', 'STRUCTURE', '1');

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
(7, 2, 'AGENT', 'AGENT', '1'),
(13, 7, 'LST_PARTENAIRES', 'Liste Partenaires', '1'),
(14, 3, 'CONF', 'Configuration', '1'),
(15, 8, 'LST_DEMANDE', 'Liste Demandes', '1'),
(16, 8, 'LST_TYPE_DEMANDE', 'Liste Types Demandes', '1'),
(17, 9, 'LST_STRUCTURE', 'Liste Structures', '1');

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
(13, 1, 13, '1', '1', '1', '1'),
(16, 1, 16, '1', '1', '1', '1'),
(18, 2, 8, '-1', '-1', '-1', '-1'),
(21, 1, 19, '-1', '-1', '-1', '-1'),
(22, 1, 21, '-1', '-1', '-1', '-1'),
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
(65, 1, 26, '-1', '-1', '-1', '-1'),
(66, 1, 27, '-1', '-1', '-1', '-1'),
(67, 1, 28, '-1', '-1', '-1', '-1'),
(71, 7, 6, '1', '1', '1', '1'),
(0, 1, 14, '1', '1', '1', '1'),
(0, 1, 15, '1', '1', '1', '1'),
(0, 1, 17, '1', '1', '1', '1');

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
(3, '833VN6A8', 1, 1290902230, 'passer', '1');

-- --------------------------------------------------------

--
-- Structure de la table `type_demande`
--

CREATE TABLE `type_demande` (
  `id_type_demande` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `id_partenaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_demande`
--

INSERT INTO `type_demande` (`id_type_demande`, `libelle`, `id_partenaire`) VALUES
(1, 'DEMANDE', 3),
(2, 'demande de classement', 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `id_partenaire` (`id_partenaire`),
  ADD KEY `id_type_structure` (`id_type_structure`),
  ADD KEY `code_str` (`code_str`);

--
-- Index pour la table `partenaire`
--
ALTER TABLE `partenaire`
  ADD PRIMARY KEY (`id_partenaire`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `structure`
--
ALTER TABLE `structure`
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
  ADD PRIMARY KEY (`id_sous_menu`);

--
-- Index pour la table `type_demande`
--
ALTER TABLE `type_demande`
  ADD PRIMARY KEY (`id_type_demande`),
  ADD KEY `id_partenaire` (`id_partenaire`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demande`
--
ALTER TABLE `demande`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partenaire`
--
ALTER TABLE `partenaire`
  MODIFY `id_partenaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `personnel`
--
ALTER TABLE `personnel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `sys_sous_menu`
--
ALTER TABLE `sys_sous_menu`
  MODIFY `id_sous_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `type_demande`
--
ALTER TABLE `type_demande`
  MODIFY `id_type_demande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `type_demande`
--
ALTER TABLE `type_demande`
  ADD CONSTRAINT `type_demande_ibfk_1` FOREIGN KEY (`id_partenaire`) REFERENCES `partenaire` (`id_partenaire`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
