-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 31 mars 2022 à 15:57
-- Version du serveur :  10.3.34-MariaDB-0ubuntu0.20.04.1
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
  `prix_achat` int(11) NOT NULL,
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
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `raison`, `adresse`, `ville`, `cp`, `tel`, `genre`) VALUES
(1, '', '', 'GUITARLAND', '145 Rue des poins levés', 'Amiens', '80000', '0322457815', ''),
(2, '', '', 'WOODSTOCK', '105 bd vaucluse', 'Beauvais', '60000', '0345781236', ''),
(3, '', '', 'LOCAVIOLON', '10 allée de l\'ecce tarre', 'Reims', '51100', '0163985247', ''),
(6, 'user', 'Jean', '', '18 Quai des Orfèvres', 'Paris', '75001', '0582937145', 'Mme'),
(7, 'admin', 'admin', NULL, NULL, NULL, NULL, NULL, 'M');

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
  `prix_tot` decimal(10,2) DEFAULT NULL,
  `date_reglem` date DEFAULT NULL,
  `date_fact` date DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_livraison` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville_livraison` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_livraison` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse_facturation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville_facturation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_facturation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `client_id`, `livraison_id`, `date`, `reduc`, `prix_tot`, `date_reglem`, `date_fact`, `etat`, `adresse_livraison`, `ville_livraison`, `cp_livraison`, `adresse_facturation`, `ville_facturation`, `cp_facturation`) VALUES
(140, 6, NULL, '2022-03-22', NULL, '2867.55', NULL, '2022-03-22', '75001', '18 Quai des Orfèvres', 'Paris', '75001', '18 Quai des Orfèvres', 'Paris', '75001');

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
(3, 6, 'WATIN', 'Sylvain', '0322568974');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `id` int(11) NOT NULL,
  `produits_id` int(11) DEFAULT NULL,
  `commande_id` int(11) NOT NULL,
  `qtite_commande` int(11) NOT NULL,
  `prix_vente` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contenir`
--

INSERT INTO `contenir` (`id`, `produits_id`, `commande_id`, `qtite_commande`, `prix_vente`) VALUES
(81, 14, 140, 2, '656.00'),
(82, 21, 140, 4, '98.00'),
(83, 3, 140, 1, '429.00'),
(84, 19, 140, 1, '598.00');

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
  `num_bon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `sousrubrique_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `prixht` decimal(10,2) DEFAULT NULL,
  `caracteristiques` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `sousrubrique_id`, `description`, `nom`, `photo`, `stock`, `prixht`, `caracteristiques`) VALUES
(1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Yamaha c-40 Guitare Classique', 'Guitare C-40.png', 25, '139.00', 'Yamaha c-40 Guitare Classique'),
(3, 15, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Piano P-45', 'Piano P-45.png', 10, '429.00', 'Yamaha P-45 Piano numérique'),
(8, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Table mixage analogique X1204', 'Table mixage analogique X1204.png', 5, '179.00', 'Behringer Xenyx X1204 USB Table de mixage'),
(9, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Millenium Focus 22 Drum Set Black', 'Millenium Focus 22 Drum.png', 2, '258.00', 'Batterie Acoustique Millenium Focus 22 Drum Set Black'),
(10, 11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Etui rigide Thomann E-Guitar Case ABS', 'Etui rigide Thomann E-Guitar Case ABS.png', 25, '66.00', 'Thomann E-Guitar Case ABS'),
(11, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Housse Thomann Stage Piano Bag', 'Housse Thomann Stage Piano Bag.png', 25, '45.00', 'Thomann Stage Piano Bag'),
(12, 18, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Sono caisson HK Audio Sonar 115 Sub D', 'Sono caisson HK Audio Sonar 115 Sub D.png', 13, '656.00', 'HK Audio Sonar 115 Sub D'),
(13, 17, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Thomann Jazz Bb', 'Thomann Jazz Bb.png', 0, '582.00', 'Thomann Jazz Bb- Tenor Trombone'),
(14, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Harley Benton Victory Plus BK Vintage Series', 'Harley Benton Victory Plus.png', 13, '656.00', 'Harley Benton Victory Plus BK Vintage Series'),
(15, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Harley Benton D-120CE BK', 'Harley Benton D-120CE BK.png', 10, '79.00', 'Harley Benton D-120CE BK'),
(16, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Harley Benton JB-75MN SB Vintage Series', 'Harley Benton JB-75MN.png', 5, '168.00', 'Harley Benton JB-75MN SB Vintage Series'),
(17, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Harley Benton B-30NT Acoustic Bass Series', 'Harley Benton B-30NT.png', 5, '148.00', 'Harley Benton B-30NT Acoustic Bass Series'),
(18, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Thomann Concert Ukulele De Luxe', 'Thomann Concert Ukulele De Luxe.png', 10, '149.00', 'Thomann Concert Ukulele De Luxe'),
(19, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Millenium MPS-850 E-Drum Set', 'Millenium MPS-850 E-Drum.png', 3, '598.00', 'Millenium MPS-850 E-Drum Set'),
(20, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Harley Benton Flight Case Wood Guitar', 'Harley Benton Flight Case Wood Guitar.png', 5, '129.00', 'Harley Benton Flight Case Wood Guitar'),
(21, 12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Shure SM58 LC', 'Shure SM58 LC.png', 25, '98.00', 'Shure SM58 LC'),
(22, 14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Yamaha C 3 X PE Grand Piano', 'Yamaha C 3 X PE Grand Piano.png', 2, '28790.00', 'Yamaha C 3 X PE Grand Piano'),
(23, 16, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Thomann TAS-180 Alto Sax', 'Thomann TAS-180 Alto Sax.png', 20, '298.00', 'Thomann TAS-180 Alto Sax'),
(24, 19, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'Harley Benton HB-10G', 'Harley Benton HB-10G.png', 15, '49.00', 'Harley Benton HB-10G'),
(25, 20, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'The sssnake IPP1030', 'the sssnake IPP1030.png', 1, '3.44', 'The sssnake IPP1030'),
(26, 21, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'The sssnake PC 20 Power Audio', 'the sssnake PC 20 Power Audio.png', 40, '68.00', 'The sssnake PC 20 Power Audio'),
(27, 22, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed eros urna. In vitae lorem in leo tempor maximus. Nullam tincidunt sem vel felis tempor molestie. Morbi id lacus laoreet, vulputate ex vitae, feugiat felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.', 'The sssnake SK366-2-BLK Midi', 'the sssnake SK366-2-BLK Midi.png', 40, '3.90', 'The sssnake SK366-2-BLK Midi'),
(28, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent bibendum diam et purus tempus ultricies. In justo tellus, ullamcorper non tellus a, sollicitudin euismod lacus.', 'Millenium Youngster Drum Set Bundle', 'Millenium Youngster Drum Set Bundle.jpg', 5, '119.00', 'Complete Drum Set for Children\r\nPerfect for drummers as of 3 years old\r\nShell material: Hardwood\r\nBlack hardware\r\nDrum shell with robust film finish\r\nColour: Green Sparkle');

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE `rubrique` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rubrique`
--

INSERT INTO `rubrique` (`id`, `nom`, `description`, `photos`) VALUES
(1, 'Batterie', '	Viens jouer de la baguette!', 'CATEGORIES Batterie.png'),
(2, 'Cases', 'Des caissons à n\'en plus finir', 'CATEGORIES Cases.png'),
(3, 'Cordes', 'Viens gratter de la corde', 'CATEGORIES Cordes.png'),
(4, 'Studio', 'Parfait pour la futur nouvelle star', 'CATEGORIES Studio.png'),
(5, 'Claviers', 'Joue ton meilleur \"Harry potter thème\"', 'CATEGORIES Claviers.png'),
(6, 'Vents', 'Souffle aussi fort que le loup', 'CATEGORIES Vents.png'),
(7, 'Sono', 'David ? c\'est toi ?', 'CATEGORIES Sono.png'),
(8, 'Cables', 'Pour en finir avec le pétage de cables !', 'CATEGORIES Cable.png');

-- --------------------------------------------------------

--
-- Structure de la table `sous_rubrique`
--

CREATE TABLE `sous_rubrique` (
  `id` int(11) NOT NULL,
  `rubrique_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='\r\n';

--
-- Déchargement des données de la table `sous_rubrique`
--

INSERT INTO `sous_rubrique` (`id`, `rubrique_id`, `nom`, `description`, `photos`) VALUES
(1, 3, 'Guitares Electriques', '', 'Guitare_electrique.png'),
(2, 3, 'Guitares Acoustiques', '', 'Guitare_acoustique.png'),
(3, 3, 'Guitares Electro Acoustiques', '', 'Guitare_electro_acoustique.png'),
(4, 3, 'Basses Electriques', '', 'Basse_electrique.png'),
(5, 3, 'Basses Acoustiques', '', 'Basse_acoustique.png'),
(6, 3, 'Ukulélés', '', 'Ukulele.png'),
(7, 1, 'Batteries Acoustiques', '', 'Batterie_Acoustique.png'),
(8, 1, 'Bateries Electroniques', '', 'Batterie_Electronique.png'),
(9, 2, 'Housses', '', 'Housses.png'),
(10, 2, 'Flight Cases', '', 'Rigide.png'),
(11, 2, 'Etuis Rigide', '', 'Etuis_rigide.png'),
(12, 4, 'Micro     ', 'Prise de son', 'Micro.png'),
(13, 4, 'Mixage', 'Table de mixage', 'Mixage.png'),
(14, 5, 'Pianos à queues', '', 'Piano_a_queue.png'),
(15, 5, 'Pianos synthétiseurs', '', 'Piano_synthetiseur.png'),
(16, 6, 'Saxophones', '', 'Saxo.png'),
(17, 6, 'Trombones', '', 'Trombonne.png'),
(18, 7, 'Caissons de basses', '', 'Caisson_basse.png'),
(19, 7, 'Ampli à guitare', '', 'Ampli.png'),
(20, 8, 'Câbles pour instruments', NULL, 'Cable_instru.png'),
(21, 8, 'Câbles pour microphones', NULL, 'Cable_micro.png'),
(22, 8, 'Câbles MIDI', NULL, 'Cable_mdi.png');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `client_id`) VALUES
(19, 'user@user', '[]', '$2y$13$aCy/6xmFVHV9EKQ4Q364Ze67amSvMvqLKqzY66H5h2zXEZaMxUK.W', 1, 6),
(20, 'admin@admin', '[\"ROLE_ADMIN\"]', '$2y$13$q2ccX5xB/XWFJR9yApur0uCDziJTA12UIUwRuFD9AQLahPJFcEiMW', 0, 7);

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
  ADD KEY `IDX_6EEAA67D8E54FB25` (`livraison_id`);

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
  ADD KEY `IDX_3C914DFDCD11A2CF` (`produits_id`),
  ADD KEY `IDX_3C914DFD82EA2E54` (`commande_id`);

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
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

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
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD KEY `IDX_8D93D64919EB6921` (`client_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT pour la table `commercial`
--
ALTER TABLE `commercial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `contenir`
--
ALTER TABLE `contenir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

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
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  ADD CONSTRAINT `FK_3C914DFD82EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
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

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D64919EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
