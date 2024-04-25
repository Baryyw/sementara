-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2024 at 12:03 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` bigint UNSIGNED NOT NULL,
  `follower_id` int NOT NULL,
  `following_id` int NOT NULL,
  `is_accepted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `follower_id`, `following_id`, `is_accepted`, `created_at`, `updated_at`) VALUES
(1, 10, 11, 1, '2024-04-21 19:53:50', '2024-04-21 19:53:50'),
(12, 10, 2, 0, '2024-04-21 20:01:04', '2024-04-21 20:01:04'),
(13, 10, 1, 0, '2024-04-21 20:02:55', '2024-04-21 20:02:55'),
(15, 1, 10, 1, '2024-04-21 20:02:55', '2024-04-21 21:20:51'),
(16, 2, 10, 1, '2024-04-21 20:02:55', '2024-04-21 21:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_20_044745_create_posts_table', 2),
(6, '2024_04_20_055904_create_attachments_table', 3),
(7, '2024_04_22_024425_create_follows_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 6, 'Token', '8e93514d1a6d1a78b4b899f32a3bf34eb58c8da5238f7326d40c4c075a5f46ed', '[\"*\"]', NULL, NULL, '2024-04-19 21:00:48', '2024-04-19 21:00:48'),
(2, 'App\\Models\\User', 7, 'Token', 'fad65038352ba037c103e21d55ce521d005ffb60381befb6c1b2841aa41dcdb8', '[\"*\"]', NULL, NULL, '2024-04-19 21:01:13', '2024-04-19 21:01:13'),
(3, 'App\\Models\\User', 8, 'Token', '8601ba6f9b123679bc5dd1005f846528d9eccb955edc1b538ab83cffe94707f0', '[\"*\"]', NULL, NULL, '2024-04-19 21:02:14', '2024-04-19 21:02:14'),
(4, 'App\\Models\\User', 9, 'Token', 'bc706d378c23df1ddd7cc390a10afa058a573bb210a9c77a764559a4f1515473', '[\"*\"]', NULL, NULL, '2024-04-19 21:02:17', '2024-04-19 21:02:17'),
(5, 'App\\Models\\User', 10, 'Token', '6f27df35cd443ba0b9096dbdf6e1ed55057c9a0e1dfa8211f4cf807f0b17fef2', '[\"*\"]', NULL, NULL, '2024-04-19 21:11:00', '2024-04-19 21:11:00'),
(6, 'App\\Models\\User', 10, 'Token', 'f339e6450653984e843a31c8c98c058ec2865ead883f4396ab64481b99860b1c', '[\"*\"]', '2024-04-19 21:40:10', NULL, '2024-04-19 21:35:56', '2024-04-19 21:40:10'),
(7, 'App\\Models\\User', 10, 'Token', '202327e5cfe1c5d8fa8762a337fb3d7e1c09c5a89f3a23efbca29e46bbadd96a', '[\"*\"]', '2024-04-19 21:40:54', NULL, '2024-04-19 21:40:23', '2024-04-19 21:40:54'),
(8, 'App\\Models\\User', 10, 'Token', 'c462bc133d8542aed4b6c2ebecbb24efa40acf0cb539e33e4146c435f8e8c72b', '[\"*\"]', NULL, NULL, '2024-04-19 21:40:48', '2024-04-19 21:40:48'),
(10, 'App\\Models\\User', 10, 'Token', '736be6d367bdcb02a95607688ebd3982290d6644e19e91d615f593378911c7b9', '[\"*\"]', NULL, NULL, '2024-04-19 21:42:57', '2024-04-19 21:42:57'),
(11, 'App\\Models\\User', 10, 'Token', 'b076af7111b58db8dfcae9b2ddb770ea5115e1881d2d112a93ac69c9787b21f3', '[\"*\"]', NULL, NULL, '2024-04-19 21:43:56', '2024-04-19 21:43:56'),
(12, 'App\\Models\\User', 10, 'Token', 'fe5a96e6d5107b24da87a475ead5cad4ff82c058571d77c4759f946b0a6cabcd', '[\"*\"]', NULL, NULL, '2024-04-19 21:43:58', '2024-04-19 21:43:58'),
(15, 'App\\Models\\User', 10, 'Token', '0748244f84478d0eb97be51ba0db676090e97d05b66ef8ef1b853f2e06e96d4c', '[\"*\"]', '2024-04-22 18:09:01', NULL, '2024-04-19 22:23:36', '2024-04-22 18:09:01'),
(16, 'App\\Models\\User', 10, 'Token', 'd3104be7d77b8a2c9ed243257137e71b9e3a2e5212ddc4266afe2ebd4d52f992', '[\"*\"]', '2024-04-21 17:49:34', NULL, '2024-04-21 17:37:47', '2024-04-21 17:49:34'),
(19, 'App\\Models\\User', 10, 'Token', '3c0d5a23b0b94628cb5ec038998ed97c332a042c9d843c6181fda620a6b9ba79', '[\"*\"]', '2024-04-21 22:22:13', NULL, '2024-04-21 19:34:39', '2024-04-21 22:22:13'),
(21, 'App\\Models\\User', 10, 'Token', '9667724f0266fa598748e6f3f6abfb54ac099f6b3daebbb9654271f9950e0541', '[\"*\"]', NULL, NULL, '2024-04-21 22:47:33', '2024-04-21 22:47:33'),
(22, 'App\\Models\\User', 10, 'Token', '5bbdb6e7571b10cfe97497ebc36a13a53eb9aff053dae0f08e2a2dba2ebf3548', '[\"*\"]', NULL, NULL, '2024-04-21 22:47:51', '2024-04-21 22:47:51'),
(24, 'App\\Models\\User', 10, 'Token', '93605f1dee230fe5e7ff9b04ba46459d4032b7af0d914a56ffed605f0fb889ee', '[\"*\"]', NULL, NULL, '2024-04-22 17:58:10', '2024-04-22 17:58:10'),
(25, 'App\\Models\\User', 10, 'Token', '83cbb6c4940a14365184f8ae17339bcb1e923c9c8ce80f4203a87e14fda93a80', '[\"*\"]', NULL, NULL, '2024-04-22 18:01:24', '2024-04-22 18:01:24'),
(26, 'App\\Models\\User', 10, 'Token', 'b039a1df9740130e19f5182eb0899f85a74858ddb38ae8b9bc7f89ec3760f58e', '[\"*\"]', NULL, NULL, '2024-04-22 18:14:23', '2024-04-22 18:14:23'),
(27, 'App\\Models\\User', 10, 'Token', 'f2a6ee9d559615f029a435d97a421727bf78df74b91f348c4ce8a5675651434f', '[\"*\"]', NULL, NULL, '2024-04-22 18:15:17', '2024-04-22 18:15:17'),
(28, 'App\\Models\\User', 10, 'Token', '5bf10440e0946fa40b4f886b16a3d9271aa7c3dde2ee452aa2de95cb21de7e52', '[\"*\"]', NULL, NULL, '2024-04-22 18:17:17', '2024-04-22 18:17:17'),
(29, 'App\\Models\\User', 10, 'Token', '8d1efac1d827367590c34d66c208ae168ab715d0db2b9032907e14fff065cbd3', '[\"*\"]', NULL, NULL, '2024-04-22 18:18:40', '2024-04-22 18:18:40'),
(33, 'App\\Models\\User', 10, 'Token', '5cad27ce2d04b19f8ca93c2033f7e99e79e2d1178e8ff0d64abf19c63fbbd86d', '[\"*\"]', NULL, NULL, '2024-04-22 18:53:14', '2024-04-22 18:53:14'),
(34, 'App\\Models\\User', 10, 'Token', '19c1a25e4fb4b79b0b925d263b9dd8d02c32eee0ffdb5d32709e55269aa3a47e', '[\"*\"]', NULL, NULL, '2024-04-22 18:53:15', '2024-04-22 18:53:15'),
(35, 'App\\Models\\User', 10, 'Token', 'bd3ef5a91ef8da1a6e92b75dd419d5d1b2fa4594619c5af39a32c83172d71c65', '[\"*\"]', NULL, NULL, '2024-04-22 18:55:13', '2024-04-22 18:55:13'),
(36, 'App\\Models\\User', 10, 'Token', '487b12b043d889a26fd03aea3724b4333cafddfc22ee9a10904a5e07abf1cca3', '[\"*\"]', NULL, NULL, '2024-04-22 18:57:41', '2024-04-22 18:57:41'),
(37, 'App\\Models\\User', 10, 'Token', 'e9bd2b6ed28f6b954659a730a55682cc798ebd3f78918a26d7aa24713f717223', '[\"*\"]', NULL, NULL, '2024-04-22 18:57:51', '2024-04-22 18:57:51'),
(38, 'App\\Models\\User', 10, 'Token', '1d405bea05ede3c94760c488ad705d6b039c0e233e5b78fd99e81af8a93310b9', '[\"*\"]', NULL, NULL, '2024-04-22 18:59:17', '2024-04-22 18:59:17'),
(39, 'App\\Models\\User', 10, 'Token', '7754d03233f8582a858087c2d80b0d76cd7a989215dd4fe7619727f642ccbbb1', '[\"*\"]', NULL, NULL, '2024-04-22 18:59:58', '2024-04-22 18:59:58'),
(40, 'App\\Models\\User', 10, 'Token', 'cf00a08b03f157d966120d7064115d43de83ecdaba84a3b41ee797bf6f65a780', '[\"*\"]', NULL, NULL, '2024-04-22 19:00:38', '2024-04-22 19:00:38'),
(41, 'App\\Models\\User', 22, 'Token', 'ee843ad295f7b6c93fbdcebb8350a47e1366a6533f2fa91ff198237e8d02f6fe', '[\"*\"]', NULL, NULL, '2024-04-22 21:45:19', '2024-04-22 21:45:19'),
(42, 'App\\Models\\User', 23, 'Token', '95d0b3c21f184120651aa5fbab13f2913dd9a6a1da18a91c18d4c999a69ce1e0', '[\"*\"]', NULL, NULL, '2024-04-22 22:01:31', '2024-04-22 22:01:31'),
(43, 'App\\Models\\User', 24, 'Token', '5e68074946fc4e74e4349fc0dface5f91ec210c8ba4367f45c39d925d04bf066', '[\"*\"]', NULL, NULL, '2024-04-22 22:09:04', '2024-04-22 22:09:04'),
(44, 'App\\Models\\User', 25, 'Token', '6b45269b19e878484c87ea001ad40262a286a4ab62bb8204c33edc356564ee78', '[\"*\"]', NULL, NULL, '2024-04-22 22:36:49', '2024-04-22 22:36:49'),
(45, 'App\\Models\\User', 26, 'Token', '38c495a7dcc1cdc1fe5361a1579a5cf102b2c9e7be77d9fbde009aa824054d8a', '[\"*\"]', NULL, NULL, '2024-04-22 23:31:05', '2024-04-22 23:31:05'),
(46, 'App\\Models\\User', 27, 'Token', 'cde580ae50b18d2025edad857d262cdccfae41d7e34482ebdef22fb05357eacc', '[\"*\"]', NULL, NULL, '2024-04-22 23:55:49', '2024-04-22 23:55:49'),
(47, 'App\\Models\\User', 28, 'Token', 'a260f32cdb12ba4da7d8ddbe97cae353f40fc01f1a9ea769b1d938a4824f37fe', '[\"*\"]', NULL, NULL, '2024-04-22 23:56:36', '2024-04-22 23:56:36'),
(48, 'App\\Models\\User', 29, 'Token', '2053203b3ed5b5a8d73a8b9553281581b3a8b77c236e99fa7c9a449d6d0bfd9b', '[\"*\"]', NULL, NULL, '2024-04-22 23:57:05', '2024-04-22 23:57:05'),
(49, 'App\\Models\\User', 30, 'Token', 'b50b52b88b881a78ee6cefba72833defcef4ceb2eb531548b983ed2dfe6f51a1', '[\"*\"]', NULL, NULL, '2024-04-22 23:57:35', '2024-04-22 23:57:35'),
(50, 'App\\Models\\User', 31, 'Token', '330f7d9804a9c17db776b4e78a62267717a5fa016fb947650d6ec1970448f319', '[\"*\"]', NULL, NULL, '2024-04-22 23:58:09', '2024-04-22 23:58:09'),
(51, 'App\\Models\\User', 32, 'Token', '838fcaa0214c376cc590bbdb2ab4e5af90c53246e9d713f34024a3fd691f3a60', '[\"*\"]', NULL, NULL, '2024-04-22 23:58:48', '2024-04-22 23:58:48'),
(52, 'App\\Models\\User', 33, 'Token', '842145e492063e208b53a7068ce666ef9e60d8fa78688564e67010019eb0409c', '[\"*\"]', NULL, NULL, '2024-04-23 00:01:38', '2024-04-23 00:01:38'),
(53, 'App\\Models\\User', 34, 'Token', '806274e14032bd2dba89e06b594d334f9785c2d465668ac1d71b5112f8036abd', '[\"*\"]', NULL, NULL, '2024-04-23 00:02:31', '2024-04-23 00:02:31'),
(54, 'App\\Models\\User', 35, 'Token', '06b01c9cc783deb2668c3a597b95b66fa7b0a91b07a22a76fc800e11541128d6', '[\"*\"]', NULL, NULL, '2024-04-23 00:07:39', '2024-04-23 00:07:39'),
(55, 'App\\Models\\User', 36, 'Token', '17aacb0b4d42754eea48d7196c154e8608544cf3752bd2818abc380eed4301a6', '[\"*\"]', '2024-04-23 18:26:59', NULL, '2024-04-23 17:58:43', '2024-04-23 18:26:59'),
(56, 'App\\Models\\User', 10, 'Token', 'e679b32cd6c0e19b0825990b77d5ddcf9355d14c70d2363e4c8c22a913a9ffd0', '[\"*\"]', NULL, NULL, '2024-04-23 18:39:40', '2024-04-23 18:39:40'),
(57, 'App\\Models\\User', 10, 'Token', '3bb6d1321b55de76262027344ee8d8b6af80a4c81144a2244ca1d0713da37995', '[\"*\"]', NULL, NULL, '2024-04-23 18:59:35', '2024-04-23 18:59:35'),
(58, 'App\\Models\\User', 10, 'Token', '492dd8e9e022cefc0ed1af50c0835cc08018ea17235e2ee50459295ef7f30ddc', '[\"*\"]', NULL, NULL, '2024-04-23 19:00:08', '2024-04-23 19:00:08'),
(59, 'App\\Models\\User', 10, 'Token', '95aeaf8166ea6e6e0b630379c51f8c01df8222af2eb2f6d8caead339a15624e4', '[\"*\"]', NULL, NULL, '2024-04-23 19:00:34', '2024-04-23 19:00:34'),
(60, 'App\\Models\\User', 10, 'Token', '1d8eb847cd3b1dc15dc53fc87330df406f4b592d22de8ea518e0c42ffe0a6335', '[\"*\"]', NULL, NULL, '2024-04-23 19:00:37', '2024-04-23 19:00:37'),
(61, 'App\\Models\\User', 10, 'Token', 'afee4833daf12721b36eae3caf9e740d9f26aec5ef4b512127dbcdd115276c06', '[\"*\"]', NULL, NULL, '2024-04-23 19:01:01', '2024-04-23 19:01:01'),
(62, 'App\\Models\\User', 10, 'Token', '3542defe9d502cc965e612783429e319c9e6f10924210c6ba346060892c9a406', '[\"*\"]', NULL, NULL, '2024-04-23 19:01:42', '2024-04-23 19:01:42'),
(63, 'App\\Models\\User', 10, 'Token', 'a1832d40950612b1358433ec1870202b084e3807ff02152a9dffb910ffd6cc14', '[\"*\"]', NULL, NULL, '2024-04-23 19:02:38', '2024-04-23 19:02:38'),
(64, 'App\\Models\\User', 10, 'Token', '711dee784867f97de278f0dac7cd2cbf3a26d531bae953b7055893d499871913', '[\"*\"]', NULL, NULL, '2024-04-23 19:02:46', '2024-04-23 19:02:46'),
(65, 'App\\Models\\User', 10, 'Token', '03e43d64d0e41288a22f839b070f5fbddd8d07cccbec364e649c674807337496', '[\"*\"]', NULL, NULL, '2024-04-23 19:02:51', '2024-04-23 19:02:51'),
(66, 'App\\Models\\User', 10, 'Token', 'e2c16d639eac9ffc2037e23d2df6043aa837de7855a5d9f87118277c04b2c3bf', '[\"*\"]', NULL, NULL, '2024-04-23 19:03:15', '2024-04-23 19:03:15'),
(67, 'App\\Models\\User', 10, 'Token', '920e584feef1cbf7f9b73f30468301a203ab712c21b6bad9c5bdf20dee378b43', '[\"*\"]', '2024-04-23 19:24:00', NULL, '2024-04-23 19:04:19', '2024-04-23 19:24:00'),
(68, 'App\\Models\\User', 10, 'Token', '3088662cbd89e2a880e92ba93a0b7f250e63faffdb133a29fbdd5fc3d05b6ae0', '[\"*\"]', '2024-04-23 19:36:01', NULL, '2024-04-23 19:35:37', '2024-04-23 19:36:01'),
(69, 'App\\Models\\User', 10, 'Token', 'aa7a0affe1ed67ecd4c6418ecf8e58899c21a60f41829fca51fb7a280a99b574', '[\"*\"]', '2024-04-23 19:38:38', NULL, '2024-04-23 19:38:22', '2024-04-23 19:38:38'),
(70, 'App\\Models\\User', 10, 'Token', 'a80f9ef2c8d8a17ecb86c5e592c81701a3be12379c3ebd5e898be1872d56ddf9', '[\"*\"]', NULL, NULL, '2024-04-23 19:39:13', '2024-04-23 19:39:13'),
(71, 'App\\Models\\User', 10, 'Token', '4c7f1e797b2faa5aba142d6bd2cf9f6fa82bd378ff153b19059c16cb76177bf3', '[\"*\"]', NULL, NULL, '2024-04-23 19:41:58', '2024-04-23 19:41:58'),
(72, 'App\\Models\\User', 10, 'Token', 'd41a135abce5c7971523f7e36b5afbfed8c01dbd1f04093ec5ef6e0ed09ab765', '[\"*\"]', '2024-04-23 19:42:59', NULL, '2024-04-23 19:42:50', '2024-04-23 19:42:59'),
(73, 'App\\Models\\User', 10, 'Token', '082053b53ef0946dd38f0edf2051fbad234c42b1cc95016fc7001f05666b746d', '[\"*\"]', NULL, NULL, '2024-04-23 19:42:53', '2024-04-23 19:42:53'),
(74, 'App\\Models\\User', 10, 'Token', '927a6b6c35061aca1da390505c87702ebc5613ee4a2f8f4c3289db7859881a45', '[\"*\"]', '2024-04-23 19:44:53', NULL, '2024-04-23 19:43:26', '2024-04-23 19:44:53'),
(75, 'App\\Models\\User', 10, 'Token', 'efba9ae9e2f8ab6bed33b62c92dcca903245fec8e07d22859c5e6ded3dcfe09a', '[\"*\"]', '2024-04-23 19:47:32', NULL, '2024-04-23 19:46:36', '2024-04-23 19:47:32'),
(76, 'App\\Models\\User', 1, 'Token', 'ae031a7131eb7c9dc20ea3d8a1328e53e1f513c0cf40941e1431e2210c53f1ed', '[\"*\"]', '2024-04-23 20:08:11', NULL, '2024-04-23 20:07:15', '2024-04-23 20:08:11'),
(77, 'App\\Models\\User', 1, 'Token', '1b7fea22c94fb9f9c2560a9e1942b1b51f0ac7e0d36e74e8bee9e8ca7ce85670', '[\"*\"]', '2024-04-23 20:10:07', NULL, '2024-04-23 20:09:14', '2024-04-23 20:10:07'),
(78, 'App\\Models\\User', 1, 'Token', '6aac9d68d46abd3cb3165dfb010d251860e94aaf58f38dc9e0a46713602568f6', '[\"*\"]', '2024-04-23 20:12:23', NULL, '2024-04-23 20:12:20', '2024-04-23 20:12:23'),
(79, 'App\\Models\\User', 1, 'Token', 'db49e8a39282325fde43252ab688df75155d862f5a6566b205c296b5e7dff5e7', '[\"*\"]', '2024-04-23 20:13:09', NULL, '2024-04-23 20:13:08', '2024-04-23 20:13:09'),
(80, 'App\\Models\\User', 1, 'Token', '325b4155cb83bab760af65e56656741872b5d3f939ef81d7e8523581ca155c60', '[\"*\"]', '2024-04-23 20:16:09', NULL, '2024-04-23 20:13:29', '2024-04-23 20:16:09'),
(83, 'App\\Models\\User', 1, 'Token', '97c252d2cb8ceb3c85ce8b92f08b55b6df3d861ecb44069fee70b4940094f3ee', '[\"*\"]', '2024-04-23 20:30:51', NULL, '2024-04-23 20:30:47', '2024-04-23 20:30:51'),
(84, 'App\\Models\\User', 37, 'Token', 'ad54111b41d0455bceb7d73db01e8afb1da6665b8e26dbd4c6c090ee3ff6a64c', '[\"*\"]', '2024-04-23 20:31:59', NULL, '2024-04-23 20:31:50', '2024-04-23 20:31:59'),
(85, 'App\\Models\\User', 38, 'Token', 'dc87a827da4564349647e9689bc3dbbc0eb2165fda6896d084eb8c873ec0948b', '[\"*\"]', '2024-04-23 20:35:23', NULL, '2024-04-23 20:35:18', '2024-04-23 20:35:23'),
(86, 'App\\Models\\User', 39, 'Token', 'bec7b403d69d9cc7e22d17c1c1756cc18c197c1584ab35b5c7675030e11d1c70', '[\"*\"]', '2024-04-23 20:36:07', NULL, '2024-04-23 20:36:02', '2024-04-23 20:36:07'),
(87, 'App\\Models\\User', 1, 'Token', 'f3b0e9e2cdd21c3b2704a69fe3138ea7886c6234174f75e5def11355a180f99d', '[\"*\"]', '2024-04-23 20:41:48', NULL, '2024-04-23 20:41:37', '2024-04-23 20:41:48'),
(88, 'App\\Models\\User', 1, 'Token', 'd9118b5b330b81e760d782894102f17d44bb6e7872aa755ebf33c9af3ec9c60b', '[\"*\"]', '2024-04-23 20:47:16', NULL, '2024-04-23 20:47:15', '2024-04-23 20:47:16'),
(89, 'App\\Models\\User', 40, 'Token', '5e36b7e6f782225bcdc19a6a5261836c41a955c786848b2a6cfa9dcaf4256d6e', '[\"*\"]', '2024-04-23 20:47:39', NULL, '2024-04-23 20:47:35', '2024-04-23 20:47:39'),
(90, 'App\\Models\\User', 1, 'Token', '6b3365f530a77fa2cf9c0632a9293e7a65c54434a059165d291e5fb3d6b97849', '[\"*\"]', '2024-04-23 20:55:33', NULL, '2024-04-23 20:55:32', '2024-04-23 20:55:33'),
(91, 'App\\Models\\User', 1, 'Token', '42359720734226297e12ff9bb1e383a620bffbcc0d5faa8541defdbb80255074', '[\"*\"]', '2024-04-23 20:56:06', NULL, '2024-04-23 20:56:04', '2024-04-23 20:56:06'),
(92, 'App\\Models\\User', 1, 'Token', 'b32c7d6a9139ee39fe37802cfb4c2840cb65d1c3fa3c4ad20391e64fffe2b897', '[\"*\"]', '2024-04-23 20:56:31', NULL, '2024-04-23 20:56:30', '2024-04-23 20:56:31'),
(93, 'App\\Models\\User', 41, 'Token', '9e5290363fe59b61672618e0f80aaa8dc8cb3cce47776299d33173d0209bcae1', '[\"*\"]', '2024-04-23 20:56:51', NULL, '2024-04-23 20:56:47', '2024-04-23 20:56:51'),
(94, 'App\\Models\\User', 1, 'Token', '15f1354fde0a913e4b2fc90eea89bec03b2e49302bad4e15f7570ab61c1c6f37', '[\"*\"]', '2024-04-23 21:11:05', NULL, '2024-04-23 21:10:47', '2024-04-23 21:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `caption`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 'INI CAPTION', '10', '2024-04-19 23:10:47', '2024-04-19 23:10:47'),
(6, 'INI CAPTION', '10', '2024-04-19 23:16:50', '2024-04-19 23:16:50'),
(7, 'Inventore consequuntur qui et deleniti est omnis est.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(8, 'Commodi a omnis quis ducimus.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(9, 'Explicabo consequatur eos praesentium autem excepturi assumenda.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(10, 'Ducimus commodi hic ipsa assumenda voluptate labore.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(11, 'In consectetur expedita blanditiis aut a.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(12, 'Eum quaerat repudiandae perferendis suscipit nemo et et commodi.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(13, 'Reiciendis ut sed nostrum nobis corrupti.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(14, 'Sed nemo in nisi ad voluptates.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(15, 'Necessitatibus cupiditate unde harum laborum quis rem possimus ut.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(16, 'Aut adipisci qui placeat rerum doloremque.', '10', '2024-04-21 18:57:43', '2024-04-21 18:57:43'),
(17, 'INI CAPTION', '10', '2024-04-22 18:09:01', '2024-04-22 18:09:01'),
(18, 'INI CAPTION', '10', '2024-04-22 18:20:26', '2024-04-22 18:20:26'),
(19, 'INI CAPTION', '10', '2024-04-22 18:20:41', '2024-04-22 18:20:41'),
(20, 'INI CAPTION', '10', '2024-04-22 18:20:55', '2024-04-22 18:20:55'),
(21, 'INI CAPTION', '10', '2024-04-22 18:20:59', '2024-04-22 18:20:59'),
(22, 'INI CAPTION', '10', '2024-04-22 18:21:05', '2024-04-22 18:21:05'),
(23, 'INI CAPTION', '10', '2024-04-22 18:21:32', '2024-04-22 18:21:32'),
(24, 'INI CAPTION', '10', '2024-04-22 18:22:09', '2024-04-22 18:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_attachments`
--

CREATE TABLE `post_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `storage_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_attachments`
--

INSERT INTO `post_attachments` (`id`, `storage_path`, `posts_id`, `created_at`, `updated_at`) VALUES
(1, 'uploads/aEZB1IzOPL8m8LVaackwd1VOeVwQ3eltVFYveqBt.png', 5, '2024-04-19 23:10:47', '2024-04-19 23:10:47'),
(2, 'uploads/uMyqSpu2GP46S1iCTOgtip3zNjc1qFHWVZfxsPue.png', 5, '2024-04-19 23:10:47', '2024-04-19 23:10:47'),
(3, 'uploads/lHTNyZ25KX9PLcyCIyU55ukbYjJ4yxdEnHlqZ3eY.png', 6, '2024-04-19 23:16:50', '2024-04-19 23:16:50'),
(4, 'uploads/GFU4VeZ3xM7DvApWqLeh7oStZLgFMDMK28kLVFnR.png', 6, '2024-04-19 23:16:50', '2024-04-19 23:16:50'),
(5, 'uploads/BI2187F3qMlfAvxD7liOTZKxjxTSJBFU0uswVFJt.png', 17, NULL, NULL),
(6, 'uploads/cV5FboWxiE6uK8WEZRHZE2crnf6UJg8Fw5Qyg2ma.png', 17, NULL, NULL),
(7, 'uploads/ODzXpgCiDp18ehFv7I5e8TUC3J0ioWQ9TcaHdTXr.png', 18, NULL, NULL),
(8, 'uploads/5AtzXeKeY7POATkdq1Oqi1C9LGNHxqseExAPVFpY.png', 18, NULL, NULL),
(9, 'uploads/2rfpUhpCAkdvWXWKVNrSCMnTRYQzJlPofhvZyWq9.png', 19, NULL, NULL),
(10, 'uploads/9Ecs1IehrKygFEgCfv99IV80ZkCPNRecbQRhAdi2.png', 19, NULL, NULL),
(11, 'uploads/gOvXHwEqbqgLn6vbaqVf7xzAMhBGqt8CqGb5DSBP.png', 20, NULL, NULL),
(12, 'uploads/xWKqcNm6CzrfcSSEVPVlWIrKuxLQ5Rug8k4WAL88.png', 20, NULL, NULL),
(13, 'uploads/PL2gTljD8CaHzvDzYKbXXxw2MYhvX3kUe6zGLPJx.png', 21, NULL, NULL),
(14, 'uploads/A9JujldiOcGrH954F5v5DycejTmeVSozNGC1HQKR.png', 21, NULL, NULL),
(15, 'uploads/atX4FO0fgRNkUOHxs02lvaaNem6ArDu4B79ToKZd.png', 22, NULL, NULL),
(16, 'uploads/CnWudscxSd2u7ZN4lQcQZPr3k3YJWewqPUEULRQi.png', 22, NULL, NULL),
(17, 'uploads/Zw56jqCJw5CoBKDRZsOYhRADluHBOFRLoPj91gpo.png', 23, NULL, NULL),
(18, 'uploads/9Zsai1cJTxVRGJi4lc7xrcn5iUGQh7cDhu8DkOht.png', 23, NULL, NULL),
(19, 'uploads/7vMq4mbl11LHIz7LZubMFG86Pt0jDsmpZD2yn06W.png', 24, NULL, NULL),
(20, 'uploads/1IC6RlOckHRKshPDu8NIDPJasX4huzhk1OByRO2O.png', 24, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `password`, `bio`, `is_private`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '$2y$12$3/eRwBJ6voQaHXE3dUQBOumAHZNAlfOUBelllvat8h3Ugcr1J.zum', 'Administrator', 0, '2024-04-19 20:49:43', '2024-04-19 20:49:43'),
(2, 'tes', '.hehee', '$2y$12$D9B4jsFZUy/6rIuyoPFDvuzCw5IS.9MFedtRpU4WMS8cE1D5eZDg6', 'jejeje', 1, '2024-04-19 20:50:27', '2024-04-19 20:50:27'),
(3, 'tes', '.hehe1e', '$2y$12$qSm.mXYgIo3JXDQmLfLzo.DGt61Lf0nWGY1BJLzOMpr/12.2UsL5W', 'jejeje', 1, '2024-04-19 20:58:39', '2024-04-19 20:58:39'),
(4, 'tes', '.hdehe1e', '$2y$12$hNDmi7d5emY6U1m9odDBpuBtcp/egyEPBW2n8fTaH3lKjNAmpMwGO', 'jejeje', 1, '2024-04-19 20:59:14', '2024-04-19 20:59:14'),
(5, 'tes', '.hdehe1ed', '$2y$12$2e.CYQrRz6FX/idWS9r.5uktKkzxpK/mVjI8Ubr3ltSzMZ.77XVH6', 'jejeje', 1, '2024-04-19 20:59:30', '2024-04-19 20:59:30'),
(6, 'tes', '.hdehe1edd', '$2y$12$SW8.5vQZOJScS6Y1MWcC1OGK5cJoD9Ro6rgjb8d5xdrHlnHWCOUfe', 'jejeje', 1, '2024-04-19 21:00:48', '2024-04-19 21:00:48'),
(7, 'tes', '.hdehe1edddw', '$2y$12$u367cDvHE5ACAfqQpKgNfeSWgeT9E4PWxUgFyRzM8cNygfzpKNlIO', 'jejeje', 1, '2024-04-19 21:01:12', '2024-04-19 21:01:12'),
(8, 'tes', '.hdehe1edddws', '$2y$12$1B6NvJCUJWSCGVb0MNU3oeCdJjCYb0o/GglKJnE.5jZ7yYOM9RhI.', 'jejeje', 1, '2024-04-19 21:02:14', '2024-04-19 21:02:14'),
(9, 'tes', '.hdehe1edddwss', '$2y$12$hxyGCiNlgRx0fIGN8rjrTOZ5qG/azH8QZky9i2vH0LWZZLWFGI4OG', 'jejeje', 1, '2024-04-19 21:02:17', '2024-04-19 21:02:17'),
(10, 'tes', 'akbar', '$2y$12$3/eRwBJ6voQaHXE3dUQBOumAHZNAlfOUBelllvat8h3Ugcr1J.zum', 'jejeje', 1, '2024-04-19 21:11:00', '2024-04-19 21:11:00'),
(11, 'tes', 'akbar1', '$2y$12$r2xitoZlaJoPQvNPzoGjVeD8uWV/mzyH77TUyj93hBLqnVrM5vzni', 'jejeje', 1, '2024-04-19 21:45:01', '2024-04-19 21:45:01'),
(12, 'Neva McKenzie', 'champlin.ardith', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Qui quibusdam enim voluptatem vitae voluptatum quia.', 0, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(13, 'Lonnie Waters', 'shania18', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Labore repellendus nemo eum vitae expedita praesentium quam.', 1, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(14, 'Zander Roob', 'kody.oberbrunner', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Aut quis numquam enim qui.', 1, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(15, 'Prof. Tyrique Funk', 'marquis.turcotte', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Cumque fuga rerum doloremque blanditiis qui.', 0, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(16, 'Raymond Luettgen', 'elenor20', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Aut quam ut laudantium quam.', 1, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(17, 'Gwendolyn Bosco II', 'gerlach.alexandrea', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Iure aliquam necessitatibus sequi sed non voluptas quod.', 0, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(18, 'Freida Aufderhar', 'buddy13', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Rerum ab animi beatae facere doloremque.', 1, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(19, 'Prof. Roger Frami Sr.', 'lynch.timmothy', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Et repellendus est ipsam et.', 1, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(20, 'Mr. Kelton Effertz III', 'yessenia.donnelly', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Nisi vel excepturi aut nemo quasi officiis velit commodi.', 0, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(21, 'Kenneth Skiles', 'hilda41', '$2y$12$DREyRhoTG22PPYCXEulVXeh0diYODC3qJxw7Qvb2Ij0N8IXinx0be', 'Sapiente odit voluptatum et ut quia blanditiis est.', 1, '2024-04-21 19:22:54', '2024-04-21 19:22:54'),
(22, 'tes', 'akbar11', '$2y$12$s8ysaCyeBEspSNg4azrvs.qO.PuVhhqrg.DZBtpv8oB3a4NRzxFVm', 'jejeje', 1, '2024-04-22 21:45:18', '2024-04-22 21:45:18'),
(23, 'muhammad akbar', 'react', '$2y$12$9owuCW.ejssGbIMfb0AjguQFBey61qhD70yJ/eCQkp2.kmdYVaJzm', 'Bio Ini', 1, '2024-04-22 22:01:31', '2024-04-22 22:01:31'),
(24, 'Muhammad Akbar', 'React_Admin', '$2y$12$tmM.RyE1rsfzdls1OvTc2uMFo.dkaO8FCOgtrXrzvKfibeNgnbEp2', 'Admin Bio', 1, '2024-04-22 22:09:04', '2024-04-22 22:09:04'),
(25, 'MhmmdAkbar', 'Baryyw', '$2y$12$9Fw8DENdNqrRG7gYQ01ak.3u5c.OQ.OCOK.LqhnIGz32N/aqBZP6u', 'Ini Bio', 1, '2024-04-22 22:36:49', '2024-04-22 22:36:49'),
(26, 'f', 'idi', '$2y$12$4aweSj40WRlV3KpoJX8R..zbx/FsSLo4eSZ6G2M.NkVkehoVvH6R6', 'wkwkw', 1, '2024-04-22 23:31:05', '2024-04-22 23:31:05'),
(27, 'AKBAR', 'indonesian', '$2y$12$QSnmzVeIpo0d.11jLX0bU.a6djpsx.RzNF3IeT.rAZdqlI2harHLi', 'wdbhwd', 0, '2024-04-22 23:55:49', '2024-04-22 23:55:49'),
(28, 'wdnwdj', '12345678', '$2y$12$kB2iXU3aM9RS4iP6d672x.WQ9umWzNfBBzd3pN3NAuz7fewqSrIQW', 'wdnwd', 0, '2024-04-22 23:56:36', '2024-04-22 23:56:36'),
(29, 'dnednnedj', '234567892', '$2y$12$m.GvZPNVtj0OAZ3hnItXu.N/s.RjubBDmkWhPKUeskOQ2UAG6y7um', 'db', 0, '2024-04-22 23:57:05', '2024-04-22 23:57:05'),
(30, '24354675869', '24354657687', '$2y$12$.cxf.nE/GKe5Rt.DB0MkG.9hdsjZDYVKJiyhEHLGh6idhqHy29g6S', 'ewg', 0, '2024-04-22 23:57:35', '2024-04-22 23:57:35'),
(31, '23453647586', '123456789d', '$2y$12$mtWPrfwQYU3NDB5S06iAre15J.YVws8Vuit04vtB.qU6KF3yNS.Ru', 'wwdsbhw', 0, '2024-04-22 23:58:09', '2024-04-22 23:58:09'),
(32, 'sqfgkwjsq', 'dweudwjandsxndd', '$2y$12$L5pIskdFCLIYtU4apKfgueDgmsAJKPvoKBAf6pKAha5R5U4LGmaRC', 'dede', 0, '2024-04-22 23:58:48', '2024-04-22 23:58:48'),
(33, 'dwefduwghjd', 'eehdjkl', '$2y$12$DswPc2wCtT.SrJ2/3BGG8.zZl6Oo95N7ShQCGmd1YCSyYXkUtvByy', 'dghjk', 0, '2024-04-23 00:01:38', '2024-04-23 00:01:38'),
(34, '1234567tfcxdrtyj', 'werthtrds', '$2y$12$oFwnf8r6as6DkjGy2EBA5uQ/23wU9rfeISu.1LH1tOVDN19FK3qyO', 'fff', 0, '2024-04-23 00:02:31', '2024-04-23 00:02:31'),
(35, '23456yujbvcxs', 'rju655resx', '$2y$12$Z0O4yqDZQm7z7MIv.Gsoa.rfImhYZen2xvllbY67R5TqbdrDIias2', 'fghytr', 0, '2024-04-23 00:07:39', '2024-04-23 00:07:39'),
(36, 'tretrtretr', 'rtretret', '$2y$12$q6LIn2A6NY7zgdoXpwGXPOg97AHlb5caI7lj0SidCmJi58AP7aXvC', 'tretre', 0, '2024-04-23 17:58:43', '2024-04-23 17:58:43'),
(37, 'Muhammad Akbar', 'Administrator', '$2y$12$QNAr127DN.Rwcuw5DW/0jufJoegZUvhHsmE0aYPb0SLo47kUIkfQe', 'frewfretfge', 0, '2024-04-23 20:31:50', '2024-04-23 20:31:50'),
(38, 'Muhammad Akbarr', 'rewew', '$2y$12$KWRB9luurfo5/xaWc6p1zuJP3qJDB0Vpd2WeK2CGWrYHnjrnfQOwe', 'rrfrf', 0, '2024-04-23 20:35:18', '2024-04-23 20:35:18'),
(39, 'fwewf', 'fwfew', '$2y$12$vsc5sLb2Z8zdWsScNXdjV.Mx0pUmch5LjZ9x7u8QNDOFA/cpbmDNS', 'fwef', 0, '2024-04-23 20:36:02', '2024-04-23 20:36:02'),
(40, 'Muhammad Akbarr', '1212312321', '$2y$12$gki3T.dKqorn1MmDPR9UqeSM.5.op6J1U5NC.5MthOz882W/NCYjC', '312312312', 0, '2024-04-23 20:47:35', '2024-04-23 20:47:35'),
(41, 'fgbvtrgttg', 'tgtgtrgt', '$2y$12$DzScaSSgXasKJoEFyIvdZuRkueHS16K51RyueUwdU7Lwc3iRZd3em', 'grtgtrg', 0, '2024-04-23 20:56:47', '2024-04-23 20:56:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_attachments`
--
ALTER TABLE `post_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `post_attachments`
--
ALTER TABLE `post_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
