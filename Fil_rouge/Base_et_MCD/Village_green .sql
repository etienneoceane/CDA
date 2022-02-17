-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 17 fév. 2022 à 11:31
-- Version du serveur :  10.3.32-MariaDB-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Village_green`
--

-- --------------------------------------------------------

--
-- Structure de la table `approvisionner`
--

CREATE TABLE `approvisionner` (
  `id` int(11) NOT NULL,
  `prix_achat` int(11) DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `date_liv` date DEFAULT NULL,
  `qtite` int(11) DEFAULT NULL,
  `fournisseurs_id` int(11) DEFAULT NULL,
  `produits_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `approvisionner`
--

INSERT INTO `approvisionner` (`id`, `prix_achat`, `date_commande`, `date_liv`, `qtite`, `fournisseurs_id`, `produits_id`) VALUES
(1, 27000, '2022-02-17', '2022-02-17', 200, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raison` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `raison`, `adresse`, `ville`, `cp`, `tel`, `mail`) VALUES
(1, '', '', 'GUITARLAND', '145 Rue des poins levés', 'Amiens', '80000', '0322457815', 'bernard.thomas@testdonnes.com'),
(2, '', '', 'WOODSTOCK', '105 bd vaucluse', 'Beauvais', '60000', '0345781236', 'musiquewoodstock@gmail.com'),
(3, '', '', 'LOCAVIOLON', '10 allée de l\'ecce tarre', 'Reims', '51100', '0163985247', 'mlocaviolon.ent@gmail.com'),
(4, '', '', 'PIANO&CIE', '18 Quai des Orfèvres', 'Paris', '75001', '0582937145', 'piano_cie_orf@outlook.com');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `livraison_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reduc` int(11) DEFAULT NULL,
  `prix_tot` int(11) DEFAULT NULL,
  `date_reglem` date DEFAULT NULL,
  `date_fact` date DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_livraison` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville_livraison` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_livraison` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_facturation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville_facturation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_facturation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenir_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `client_id`, `livraison_id`, `date`, `reduc`, `prix_tot`, `date_reglem`, `date_fact`, `etat`, `adresse_livraison`, `ville_livraison`, `cp_livraison`, `adresse_facturation`, `ville_facturation`, `cp_facturation`, `contenir_id`) VALUES
(1, 1, 1, '2022-02-17', NULL, 278, '2022-02-17', '2022-02-17', 'en préparation', '12 rue des magnolias', 'PARIS', '95000', '12 rue des magnolias', 'PARIS', '95000', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

CREATE TABLE `commercial` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commercial`
--

INSERT INTO `commercial` (`id`, `client_id`, `nom`, `prenom`, `tel`) VALUES
(1, 1, 'BERNARD', 'Thomas', '0345725145'),
(2, 3, 'MAGNOLIA', 'Orphée', '0645781236'),
(3, 4, 'WATIN', 'Sylvain', '0322568974');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `id` int(11) NOT NULL,
  `qtite_commande` int(11) NOT NULL,
  `prix_vente` int(11) DEFAULT NULL,
  `produits_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contenir`
--

INSERT INTO `contenir` (`id`, `qtite_commande`, `prix_vente`, `produits_id`) VALUES
(1, 2, 278, 1);

-- --------------------------------------------------------

--
-- Structure de la table `expedition`
--

CREATE TABLE `expedition` (
  `id` int(11) NOT NULL,
  `livraison_id` int(11) DEFAULT NULL,
  `produits_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `expedition`
--

INSERT INTO `expedition` (`id`, `livraison_id`, `produits_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raison` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `prenom`, `adresse`, `ville`, `cp`, `tel`, `contact_nom`, `contact_prenom`, `raison`) VALUES
(1, 'Armozo', 'Galotino', '06 rue laymes', 'Paris', '75003', '0173751178', 'Vermesh', 'Salome', 'ARMOZO'),
(2, 'Bolies', 'Paul', '63 bd marguerite levant', 'Paris', '75009', '0785848682', 'DUPONT', 'François', 'Aarpège');

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id` int(11) NOT NULL,
  `num_bon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id`, `num_bon`, `date`, `etat`) VALUES
(1, '1', '2022-02-17', 'en préparation');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `sousrubrique_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `prixht` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `sousrubrique_id`, `description`, `nom`, `photo`, `stock`, `prixht`) VALUES
(1, 1, 'Yamaha c-40 Guitare Classique', 'Guitare C-40', 'C-40.jpeg', 25, '139'),
(2, 17, 'Startone SSL-45 Bb-Tenor Trombone', 'Trombone SSL-45', 'SSL-45.jpg', 17, '138'),
(3, 15, 'Yamaha P-45 Piano numérique', 'Piano P-45', 'P-45.jpg', 10, '429'),
(8, 13, 'Behringer Xenyx X1204 USB Table de mixage', 'Table mixage analogique X1204', 'X1204.jpg', 5, '179'),
(9, 7, 'Batterie Acoustique Millenium Focus 22 Drum Set Black', 'Millenium Focus 22 Drum Set Black', 'Batterie22.jpeg', 2, '258'),
(10, 10, 'Thomann E-Guitar Case ABS', 'Etui rigide Thomann E-Guitar Case ABS', 'Etuiguitarelec.jpg', 25, '66'),
(11, 9, 'Thomann Stage Piano Bag', 'Housse Thomann Stage Piano Bag', 'houssepiano.jpg', 25, '45'),
(12, 18, 'HK Audio Sonar 115 Sub D', 'Sono caisson HK Audio Sonar 115 Sub D', 'Sonocaissonbasse.jpg', 13, '656');

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE `rubrique` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rubrique`
--

INSERT INTO `rubrique` (`id`, `nom`, `description`) VALUES
(1, 'Batterie', '	Viens jouer de la baguette!'),
(2, 'Cases', 'Des caissons à n\'en plus finir'),
(3, 'Cordes', 'Viens gratter de la corde'),
(4, 'Studio', 'Parfait pour la futur nouvelle star'),
(5, 'Claviers', 'Joue ton meilleur \"Harry potter thème\"'),
(6, 'Instruments à vent', 'Souffle aussi fort que le loup'),
(7, 'Sono', 'David ? c\'est toi ?');

-- --------------------------------------------------------

--
-- Structure de la table `sous_rubrique`
--

CREATE TABLE `sous_rubrique` (
  `id` int(11) NOT NULL,
  `rubrique_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sous_rubrique`
--

INSERT INTO `sous_rubrique` (`id`, `rubrique_id`, `nom`, `description`) VALUES
(1, 3, 'Guitares Electriques', ''),
(2, 3, 'Guitares Acoustiques', ''),
(3, 3, 'Guitares Electro-Acoustiques', ''),
(4, 3, 'Basses Electriques', ''),
(5, 3, 'Basses Acoustiques', ''),
(6, 3, 'Ukulélés', ''),
(7, 1, 'Batteries Acoustiques', ''),
(8, 1, 'Bateries Electroniques', ''),
(9, 2, 'Housses', ''),
(10, 2, 'Rigides', ''),
(11, 2, 'Etuis Rigides', ''),
(12, 4, 'Micro     ', 'Prise de son'),
(13, 4, 'Mixage', 'Table de mixage'),
(14, 5, 'Pianos à queues', ''),
(15, 5, 'Pianos synthétiseurs', ''),
(16, 6, 'Saxophones', ''),
(17, 6, 'Trombones', ''),
(18, 7, 'Caissons de basses', ''),
(19, 7, 'Ampli à guitare', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `approvisionner`
--
ALTER TABLE `approvisionner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4240C2B827ACDDFD` (`fournisseurs_id`),
  ADD KEY `IDX_4240C2B8CD11A2CF` (`produits_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67D19EB6921` (`client_id`),
  ADD KEY `IDX_6EEAA67D8E54FB25` (`livraison_id`),
  ADD KEY `IDX_6EEAA67D1982B715` (`contenir_id`);

--
-- Index pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7653F3AE19EB6921` (`client_id`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3C914DFDCD11A2CF` (`produits_id`);

--
-- Index pour la table `expedition`
--
ALTER TABLE `expedition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_692907E8E54FB25` (`livraison_id`),
  ADD KEY `IDX_692907ECD11A2CF` (`produits_id`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC27BEE02DA1` (`sousrubrique_id`);

--
-- Index pour la table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_87EA3D293BD38833` (`rubrique_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `approvisionner`
--
ALTER TABLE `approvisionner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `commercial`
--
ALTER TABLE `commercial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `contenir`
--
ALTER TABLE `contenir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `expedition`
--
ALTER TABLE `expedition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `approvisionner`
--
ALTER TABLE `approvisionner`
  ADD CONSTRAINT `FK_4240C2B827ACDDFD` FOREIGN KEY (`fournisseurs_id`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `FK_4240C2B8CD11A2CF` FOREIGN KEY (`produits_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67D1982B715` FOREIGN KEY (`contenir_id`) REFERENCES `contenir` (`id`),
  ADD CONSTRAINT `FK_6EEAA67D19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_6EEAA67D8E54FB25` FOREIGN KEY (`livraison_id`) REFERENCES `livraison` (`id`);

--
-- Contraintes pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD CONSTRAINT `FK_7653F3AE19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `FK_3C914DFDCD11A2CF` FOREIGN KEY (`produits_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `expedition`
--
ALTER TABLE `expedition`
  ADD CONSTRAINT `FK_692907E8E54FB25` FOREIGN KEY (`livraison_id`) REFERENCES `livraison` (`id`),
  ADD CONSTRAINT `FK_692907ECD11A2CF` FOREIGN KEY (`produits_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27BEE02DA1` FOREIGN KEY (`sousrubrique_id`) REFERENCES `sous_rubrique` (`id`);

--
-- Contraintes pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  ADD CONSTRAINT `FK_87EA3D293BD38833` FOREIGN KEY (`rubrique_id`) REFERENCES `rubrique` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
