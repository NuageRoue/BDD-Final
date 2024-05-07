-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 07 mai 2024 à 07:14
-- Version du serveur : 5.7.24
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `site_avis_jeu`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_article` bigint(20) UNSIGNED NOT NULL,
  `contenu_article` text NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_derniereModif` datetime NOT NULL,
  `note` smallint(6) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `id_jeu` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id_comment` bigint(20) UNSIGNED NOT NULL,
  `contenu_commentaire` text NOT NULL,
  `date_creation` datetime NOT NULL,
  `note` smallint(6) NOT NULL,
  `id_article` bigint(20) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `id_user` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gamestyle`
--

CREATE TABLE `gamestyle` (
  `id_jeu` bigint(20) UNSIGNED NOT NULL,
  `id_style` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `imagearticle`
--

CREATE TABLE `imagearticle` (
  `id_image` bigint(20) UNSIGNED NOT NULL,
  `nom_image` varchar(255) NOT NULL,
  `id_article` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jeu`
--

CREATE TABLE `jeu` (
  `id_jeu` bigint(20) UNSIGNED NOT NULL,
  `nom_jeu` varchar(255) NOT NULL,
  `date_sortie` date NOT NULL,
  `synopsis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `onplatform`
--

CREATE TABLE `onplatform` (
  `id_jeu` bigint(20) UNSIGNED NOT NULL,
  `id_support` bigint(20) NOT NULL,
  `prix` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `platform`
--

CREATE TABLE `platform` (
  `id_platform` bigint(20) UNSIGNED NOT NULL,
  `platform` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `style`
--

CREATE TABLE `style` (
  `id_style` bigint(20) UNSIGNED NOT NULL,
  `nom_style` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `rank` enum('') NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(319) NOT NULL,
  `birth_date` date NOT NULL,
  `banned` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD UNIQUE KEY `article_id_jeu_unique` (`id_jeu`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Index pour la table `gamestyle`
--
ALTER TABLE `gamestyle`
  ADD PRIMARY KEY (`id_jeu`,`id_style`);

--
-- Index pour la table `imagearticle`
--
ALTER TABLE `imagearticle`
  ADD PRIMARY KEY (`id_image`);

--
-- Index pour la table `jeu`
--
ALTER TABLE `jeu`
  ADD PRIMARY KEY (`id_jeu`);

--
-- Index pour la table `onplatform`
--
ALTER TABLE `onplatform`
  ADD PRIMARY KEY (`id_jeu`,`id_support`);

--
-- Index pour la table `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`id_platform`);

--
-- Index pour la table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`id_style`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_username_unique` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gamestyle`
--
ALTER TABLE `gamestyle`
  MODIFY `id_jeu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `imagearticle`
--
ALTER TABLE `imagearticle`
  MODIFY `id_image` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jeu`
--
ALTER TABLE `jeu`
  MODIFY `id_jeu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `onplatform`
--
ALTER TABLE `onplatform`
  MODIFY `id_jeu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `platform`
--
ALTER TABLE `platform`
  MODIFY `id_platform` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `style`
--
ALTER TABLE `style`
  MODIFY `id_style` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `jeu`
--
ALTER TABLE `jeu`
  ADD CONSTRAINT `jeu_id_jeu_foreign` FOREIGN KEY (`id_jeu`) REFERENCES `gamestyle` (`id_jeu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
