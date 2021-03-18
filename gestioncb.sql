-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 27, 2021 at 10:55 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestioncb`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `datenaissance` varchar(10) NOT NULL,
  `adresse` varchar(70) NOT NULL,
  `tel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `datenaissance`, `adresse`, `tel`) VALUES
(1, 'Gahbiche', 'Med Habib', '01-06-1983', 'Hammam Lif Ben Arous', 98452306),
(2, 'Ben Nasr', 'Saber', '12-02-1983', 'Ras Jebal', 53108123),
(4, 'Hedhly', 'Houcem', '2018-12-01', '90 CitÃ© Ben Arous Zarzouna', 52313532),
(11, 'Ben Salah', 'Mohamed', '2018-12-22', 'Manzel Abderrahmen', 55333221),
(19, 'Ben Foulen', 'Ahmed', '2018-12-12', 'Manouba', 50655422);

-- --------------------------------------------------------

--
-- Table structure for table `comptes`
--

DROP TABLE IF EXISTS `comptes`;
CREATE TABLE IF NOT EXISTS `comptes` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `codebank` mediumint(5) UNSIGNED NOT NULL,
  `codeguichet` mediumint(5) UNSIGNED NOT NULL,
  `clerib` tinyint(2) UNSIGNED NOT NULL,
  `titulaire` tinyint(3) UNSIGNED NOT NULL,
  `solde` float NOT NULL,
  `devise` enum('TND','EUR','USD','CAD') NOT NULL,
  `datecreation` varchar(10) NOT NULL,
  `etat` enum('Actif','Inactif') NOT NULL DEFAULT 'Actif',
  PRIMARY KEY (`id`),
  KEY `compte_titulaire` (`titulaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comptes`
--
ALTER TABLE `comptes`
  ADD CONSTRAINT `compte_titulaire` FOREIGN KEY (`titulaire`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
