-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : lun. 10 juin 2024 à 18:05
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `examen_gestion_des_inscription`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id_classe` int NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(30) NOT NULL,
  `fillière` int NOT NULL,
  `niveau` int NOT NULL,
  PRIMARY KEY (`id_classe`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `Libelle`, `fillière`, `niveau`) VALUES
(9, 'Classe 003', 3, 2),
(10, 'Classe 004', 3, 0),
(11, 'Classe 101', 0, 0),
(12, 'Classe 101', 2, 2),
(13, 'Classe 101', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int NOT NULL AUTO_INCREMENT,
  `matricule` varchar(30) NOT NULL,
  `nomComplet` varchar(30) NOT NULL,
  `tuteur` varchar(30) NOT NULL,
  `classe_id` int NOT NULL,
  PRIMARY KEY (`id_etudiant`),
  UNIQUE KEY `matricule` (`matricule`),
  KEY `classe_id` (`classe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1995 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `matricule`, `nomComplet`, `tuteur`, `classe_id`) VALUES
(1994, 'BA1918', 'KOUNGBA', 'NGBO', 304),
(345, 'M321', 'MBELETY', 'NDAOULET', 101),
(1993, 'AA1945', 'YAKAMBE', 'MBOUTOUMA', 236),
(211, 'ZE45', 'DOROGBA-TE', 'TIWA', 202);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id_inscription` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `montant` double NOT NULL,
  `anneeScolaire` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `etudiant_id` int NOT NULL,
  PRIMARY KEY (`id_inscription`),
  KEY `etudiant_id` (`etudiant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id_inscription`, `date`, `montant`, `anneeScolaire`, `etudiant_id`) VALUES
(1, '2023-09-13', 90000, '2023', 1),
(2, '2024-03-05', 100000, '2023', 0),
(3, '2024-03-05', 120000, '2002', 0),
(4, '2024-03-05', 120000, '2024', 0),
(5, '2024-03-05', 120000, '2004', 0),
(6, '2024-03-06', 90000, '2023', 14);

-- --------------------------------------------------------

--
-- Structure de la table `lien_classe_professeur`
--

DROP TABLE IF EXISTS `lien_classe_professeur`;
CREATE TABLE IF NOT EXISTS `lien_classe_professeur` (
  `id_lien` int NOT NULL AUTO_INCREMENT,
  `professeur_id` int NOT NULL,
  `classe_id` int NOT NULL,
  PRIMARY KEY (`id_lien`),
  KEY `professeur_id` (`professeur_id`),
  KEY `classe_id` (`classe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `lien_classe_professeur`
--

INSERT INTO `lien_classe_professeur` (`id_lien`, `professeur_id`, `classe_id`) VALUES
(0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id_prof` int NOT NULL AUTO_INCREMENT,
  `nci` varchar(30) NOT NULL,
  `nomComplet` varchar(30) NOT NULL,
  `grade` tinyint NOT NULL,
  PRIMARY KEY (`id_prof`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id_prof`, `nci`, `nomComplet`, `grade`) VALUES
(3, 'AA002', 'BAILA WANE', 1),
(4, 'BB00221', 'Aly NIANG', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
