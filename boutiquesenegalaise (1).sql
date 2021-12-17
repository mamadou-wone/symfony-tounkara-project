-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 16 déc. 2021 à 19:28
-- Version du serveur :  8.0.27-0ubuntu0.20.04.1
-- Version de PHP : 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutiquesenegalaise`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `company`, `address`, `postal`, `city`, `country`, `phone`, `lastname`) VALUES
(3, 1, 'domicile', 'Abdoul magib', NULL, 'djily mbaye', NULL, 'Dakar', 'SN', '777858565', 'biteye'),
(4, 2, 'premiere commande', 'magib', NULL, 'djily mbaye', NULL, 'dakar', 'SN', '777858565', 'biteye'),
(5, 6, 'ouakam', 'thioro', NULL, 'leana', NULL, 'dakar', 'SN', '776767676', 'diallo');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `descripion`, `price`) VALUES
(1, 'tiac-tiac', 'Livraision rapide et sécurisé', 2000),
(2, 'proximo', 'rapide a moins de 24h', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'femme'),
(2, 'homme'),
(3, 'enfant'),
(4, 'accessoirs'),
(5, 'test'),
(6, 'test2'),
(7, 'babouch');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210618144615', '2021-06-18 14:46:25', 40),
('DoctrineMigrations\\Version20210618221854', '2021-06-18 22:19:03', 51),
('DoctrineMigrations\\Version20210618223821', '2021-06-18 22:38:32', 97),
('DoctrineMigrations\\Version20210618230444', '2021-06-18 23:04:57', 73),
('DoctrineMigrations\\Version20210618231530', '2021-06-18 23:15:33', 34),
('DoctrineMigrations\\Version20210619224240', '2021-06-19 22:42:55', 128),
('DoctrineMigrations\\Version20210619234122', '2021-06-19 23:41:27', 48),
('DoctrineMigrations\\Version20210620011502', '2021-06-20 01:15:19', 76),
('DoctrineMigrations\\Version20210620092047', '2021-06-20 09:20:57', 183),
('DoctrineMigrations\\Version20210620122457', '2021-06-20 12:25:04', 60),
('DoctrineMigrations\\Version20210620164636', '2021-06-20 16:46:45', 47),
('DoctrineMigrations\\Version20210620170739', '2021-06-20 17:07:45', 44),
('DoctrineMigrations\\Version20210621230636', '2021-06-21 23:06:45', 68),
('DoctrineMigrations\\Version20210621231523', '2021-06-21 23:15:28', 83),
('DoctrineMigrations\\Version20210621231806', '2021-06-21 23:18:09', 197),
('DoctrineMigrations\\Version20210623013402', '2021-06-23 01:34:06', 343),
('DoctrineMigrations\\Version20210623014758', '2021-06-23 01:48:02', 178),
('DoctrineMigrations\\Version20211216191549', '2021-12-16 19:16:09', 272);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `create_at` datetime NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `create_at`, `carrier_name`, `carrier_price`, `delivery`, `is_paid`, `reference`) VALUES
(1, 1, '2021-06-20 13:26:51', 'tiac-tiac', 2000, 'Abdoul magib biteye<br/>777858565<br/>Dakar<br/>SN', 0, '20062021-60cf76f12786S'),
(2, 1, '2021-06-20 13:27:44', 'tiac-tiac', 2000, 'Abdoul magib biteye<br/>777858565<br/>Dakar<br/>SN', 0, '20062021-60cf76f12786Z'),
(3, 1, '2021-06-20 17:12:17', 'proximo', 1000, 'Abdoul magib biteye<br/>777858565<br>Dakar<br>SN', 0, '20062021-60cf76f12786e'),
(4, 1, '2021-06-20 18:58:59', 'proximo', 1000, 'Abdoul magib biteye<br/>777858565<br>Dakar<br>SN', 0, '20062021-60cf8ff3350fc'),
(5, 2, '2021-06-20 21:47:50', 'proximo', 1000, 'magib biteye<br/>777858565<br>dakar<br>SN', 0, '20062021-60cfb786386f7'),
(6, 1, '2021-06-23 17:27:24', 'tiac-tiac', 2000, 'Abdoul magib biteye<br/>777858565<br>Dakar<br>SN', 0, '23062021-60d36efc7f905'),
(7, 6, '2021-12-16 14:13:39', 'tiac-tiac', 2000, 'thioro diallo<br/>776767676<br>dakar<br>SN', 0, '16122021-61bb499393132'),
(8, 6, '2021-12-16 14:13:55', 'tiac-tiac', 2000, 'thioro diallo<br/>776767676<br>dakar<br>SN', 0, '16122021-61bb49a3ad5d0'),
(9, 6, '2021-12-16 16:25:43', 'proximo', 1000, 'thioro diallo<br/>776767676<br>dakar<br>SN', 0, '16122021-61bb68876e7c9');

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `my_order_id` int NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(1, 1, 'modele 2', 1, 10000, 10000),
(2, 2, 'modele 2', 1, 10000, 10000),
(3, 3, 'modele 2', 2, 10000, 20000),
(4, 4, 'model 1', 1, 3000000, 3000000),
(5, 4, 'modele 2', 1, 10000, 10000),
(6, 4, 'modele 3', 4, 400000, 1600000),
(7, 5, 'modele 2', 1, 10000, 10000),
(8, 6, 'model 1', 5, 3000000, 15000000),
(9, 6, 'modele 2', 1, 10000, 10000),
(10, 6, 'modele 6', 1, 2000000, 2000000),
(11, 7, 'accessoirs', 2, 1200000, 2400000),
(12, 7, 'modele 6', 1, 2000000, 2000000),
(13, 8, 'accessoirs', 2, 1200000, 2400000),
(14, 8, 'modele 6', 1, 2000000, 2000000),
(15, 9, 'modele 7', 2, 1000000, 2000000);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `subtitle`, `slug`, `illustration`, `description`, `price`) VALUES
(1, 2, 'model 1', 'tenu tres belle', 'model-1', 'a305df727ef166862078710d136f6399e7e51e4a.jpeg', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.', 3000000),
(2, 1, 'modele 2', 'tenu tres belle', 'modele-2', 'a40b5b03b6fa5c89167eaebab2ac3ed431b38479.jpeg', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.', 10000),
(3, 1, 'modele 3', 'tenu tres recommandé', 'modele-3', '22a9749e7a08fb25306b838be03721dd5ede530f.jpeg', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.', 400000),
(4, 2, 'boubou homme', 'manshalla', 'modele4', '8eab02417afff9dbd4d1a832ea10dadec77adbee.jpeg', 'tres classse pour tous les ceremonies', 9000000),
(5, 2, 'modele 5', 'tres top', 'modele-5', '007cbdc28c9421be3896d102a0f713d74a0082c8.jpeg', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.', 1200000),
(6, 2, 'modele 6', 'manshallah', 'modele-6', '7f0d61037c0e327df85c0fcc2472763d703bc655.jpeg', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.', 2000000),
(7, 3, 'modele 7', 'c\'est mignon', 'modele-7', 'a297ae1c7ad5b47badfd3a2bfba4602c3b9e082d.jpeg', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.', 1000000),
(8, 3, 'modele 8', 'belle', 'modele-8', '8722765f78b986974f7c97b051f27a0ed1ada710.jpeg', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.', 3230000),
(9, 3, 'modele 9', 'bon homme', 'modele-9', '4a24a7dbde60ad2dd0fa7427bd9a1e89f130b6f5.jpeg', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.', 123989000),
(10, 4, 'accessoirs', 'lam', 'accessoirs', 'fa123da0b912eeb1d71ff087a87a9cbab12cb0d7.jpeg', 'Contrairement à une opinion répandue, le Lorem Ipsum n\'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de', 1200000),
(11, 4, 'accessoirs', 'chaussur', 'accessoirs', 'a9915c018d6675bbf0475097fbc78d6bab892438.jpeg', 'Contrairement à une opinion répandue, le Lorem Ipsum n\'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de', 2300000),
(12, 4, 'accessoirs', 'sac', 'accessoirs', '972c4d791d50bc2674601cf673d8762ddac80872.jpeg', 'Contrairement à une opinion répandue, le Lorem Ipsum n\'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de', 400000),
(13, 4, 'accessoirs', 'dalleu', 'accessoirs', '4d1bb85be32c80622b5177262db0baafb6949347.jpeg', 'Contrairement à une opinion répandue, le Lorem Ipsum n\'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de', 200000),
(14, 2, 'modele Massane', 'gentle boy', 'modele-massane', 'e2b9bed01e05a1d5d47233314c30b78454b26431.jpeg', 'exemple de despription', 200000000),
(15, 1, 'grand boubou traditionnelle', 'tenue acessoire traditionelle', 'grand-boubou-traditionnelle', 'f96a0bac09e7227e01fa76c1e4ce9c6de4ddfbc0.jpeg', 'Contrairement à une opinion répandue, le Lorem Ipsum n\'est pas… Contrairement à une opinion répandue, le Lorem Ipsum n\'est pas…', 100000),
(16, 2, 'Boubou traditionnelle homme', 'ensemble Boubou traditionnelle', 'boubou-traditionnelle-homme', 'eff3e1d9676e4e67bc1fd8db3663230a732fac1e.jpeg', 'boubou tres classe pour homme et peut partir dans tous les ceremonies', 8000000);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'saintespritt@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$WACNMb3OCg45Nf4ghrnyxQ$z2wJHNR2toY1ih1n6tvIYaGYKj8QroeuuVcm53MNgwU', 'Mamadou lamine', 'Diop'),
(2, 'biteyeMagib@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$pywE6R9EkzZCqBAgNnWZHQ$r7qD9joZ0akTyO5bYfM3CGHVgFsbM6xnU3ZCcdWwKwY', 'Magib', 'Biteye'),
(3, 'mamadoulaminediop93@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Ei0xorihcNEK6KD3ujrPew$I8Rt9uy1KokWxDtq4XPXgVkGxOdYkwKo+HMW8kZxbSI', 'Mamadou lamine', 'Diop'),
(4, 'penda@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$iqzNyHNNFwGfXdZeNrqk6w$eQXyts0xINjL0OuT5wgFlanNZIG9bwxIdvvwX6b2+1c', 'tst', 'tst'),
(5, 'test@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$y9FuuO9QM0bsCmb/a5A1og$m/8IWWY8n7qsIss5FGRqHlE0ySSOB+TLJ/1mWnaCVTU', 'test', 'test'),
(6, 'thioro@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$oaglPXyA86//SiOYkM2Ykg$z/hATdJJ7Y6VFRA5S3NJRPrvwnHNUXBJrdt6RFuA+y4', 'Thioro', 'diallo');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
