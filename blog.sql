-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 13 jan. 2022 à 19:49
-- Version du serveur : 8.0.27
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `idarticle` int NOT NULL,
  `titre` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `utilisateur_idutilisateur` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idarticle`, `titre`, `description`, `utilisateur_idutilisateur`) VALUES
(2, 'jeux vidéo', 'Les meilleurs jeux vidéos sont ici.', 3),
(3, 'jeux de societe', 'Les meilleurs jeux de societes sont ici.', 3),
(4, 'Videos jeux videos', 'Les gameplays sont super cool', 5),
(6, 'Video vlog', 'Meilleur vlog', 5);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idcategorie` int NOT NULL,
  `nomcat` varchar(45) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idcategorie`, `nomcat`) VALUES
(1, 'Jeux'),
(3, 'video');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_article`
--

CREATE TABLE `categorie_article` (
  `categorie_idcategorie` int NOT NULL,
  `article_idarticle` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie_article`
--

INSERT INTO `categorie_article` (`categorie_idcategorie`, `article_idarticle`) VALUES
(1, 2),
(1, 3),
(3, 4),
(3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idutilisateur` int NOT NULL,
  `nom` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `mdp` varchar(45) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `nom`, `prenom`, `email`, `mdp`) VALUES
(3, 'ay', 'akin', 'akin@akin.com', 'mdpakin'),
(4, 'paul', 'marco', 'marco@marco.com', 'mdpmarco'),
(5, 'erde', 'seb', 'seb@seb.com', 'mdpseb'),
(6, 'ramzi', 'sumbant', 'sumant@sumant.com', 'mdpsumbat'),
(7, 'otmar', 'herbst', 'herbst@herbst.com', 'mdpherbst');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`idarticle`),
  ADD KEY `fk_article_utilisateur_idx` (`utilisateur_idutilisateur`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idcategorie`);

--
-- Index pour la table `categorie_article`
--
ALTER TABLE `categorie_article`
  ADD PRIMARY KEY (`categorie_idcategorie`,`article_idarticle`),
  ADD KEY `fk_categorie_has_article_article1_idx` (`article_idarticle`),
  ADD KEY `fk_categorie_has_article_categorie1_idx` (`categorie_idcategorie`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idutilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `idarticle` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idcategorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idutilisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_utilisateur` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`);

--
-- Contraintes pour la table `categorie_article`
--
ALTER TABLE `categorie_article`
  ADD CONSTRAINT `fk_categorie_has_article_article1` FOREIGN KEY (`article_idarticle`) REFERENCES `article` (`idarticle`),
  ADD CONSTRAINT `fk_categorie_has_article_categorie1` FOREIGN KEY (`categorie_idcategorie`) REFERENCES `categorie` (`idcategorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
