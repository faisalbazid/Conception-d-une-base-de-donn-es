-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 02 mars 2022 à 11:59
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `crebas`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ClientCode` varchar(254) NOT NULL,
  `Nom` varchar(254) DEFAULT NULL,
  `Prenom` varchar(254) DEFAULT NULL,
  `Adress` varchar(254) DEFAULT NULL,
  `Phone` varchar(254) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `Password` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `Reference` int(11) NOT NULL,
  `ClientCode` varchar(254) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `DeliveryAdresse` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

CREATE TABLE `detailcommande` (
  `ProduitCode` int(11) NOT NULL,
  `Reference` int(11) NOT NULL,
  `OrderQuantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `ProduitCode` int(11) NOT NULL,
  `Libelle` varchar(254) DEFAULT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `Prixunitaire` double DEFAULT NULL,
  `QuantiteStock` int(11) DEFAULT NULL,
  `Image` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientCode`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`Reference`),
  ADD KEY `FK_Association2` (`ClientCode`);

--
-- Index pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD PRIMARY KEY (`ProduitCode`,`Reference`),
  ADD KEY `FK_Association1` (`Reference`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`ProduitCode`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_Association2` FOREIGN KEY (`ClientCode`) REFERENCES `client` (`ClientCode`);

--
-- Contraintes pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD CONSTRAINT `FK_Association1` FOREIGN KEY (`Reference`) REFERENCES `commande` (`Reference`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
