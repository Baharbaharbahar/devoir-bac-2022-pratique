-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 16 mai 2024 à 16:34
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bac2022`
--

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `numPermis` varchar(8) NOT NULL,
  `idModele` int(11) NOT NULL,
  `dateTest` datetime NOT NULL,
  `securite` int(11) NOT NULL,
  `conduite` int(11) NOT NULL,
  `confort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `modelevoiture`
--

CREATE TABLE `modelevoiture` (
  `idModele` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `modelevoiture`
--

INSERT INTO `modelevoiture` (`idModele`, `libelle`) VALUES
(15, 'WALLYS IRIS'),
(26, 'WALLYS 619'),
(38, 'WALLYS 216 ');

-- --------------------------------------------------------

--
-- Structure de la table `testeur`
--

CREATE TABLE `testeur` (
  `numPermis` varchar(8) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `genre` enum('F','M') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `testeur`
--

INSERT INTO `testeur` (`numPermis`, `nom`, `prenom`, `genre`) VALUES
('21/12345', 'Brini', 'Samir', 'M'),
('33/44444', 'Zaghdane', 'Olfa', 'F'),
('58/98765', 'Krimi', 'Fethi', 'M');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`numPermis`,`idModele`),
  ADD KEY `numPermis` (`numPermis`,`idModele`),
  ADD KEY `fki` (`idModele`);

--
-- Index pour la table `modelevoiture`
--
ALTER TABLE `modelevoiture`
  ADD PRIMARY KEY (`idModele`);

--
-- Index pour la table `testeur`
--
ALTER TABLE `testeur`
  ADD PRIMARY KEY (`numPermis`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `fk` FOREIGN KEY (`numPermis`) REFERENCES `testeur` (`numPermis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fki` FOREIGN KEY (`idModele`) REFERENCES `modelevoiture` (`idModele`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
