-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2022 at 09:31 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pokemon_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(10, '2022_11_25_073509_create_pokemon_likes_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('2d0862c7220fd52773000cde6e1c04f8d369cf7a60bac2372c165ee2dd3033a0e6c70bd93119cb7b', 5, 1, 'accessToken', '[]', 0, '2022-11-23 22:03:49', '2022-11-23 22:03:49', '2023-11-24 06:03:49'),
('39156ad16ec835aae48a996e53423dca12ae75d56fc7aa760226249e16167e82c55a2ab3cac826ed', 4, 1, 'accessToken', '[]', 0, '2022-11-26 00:29:17', '2022-11-26 00:29:17', '2023-11-26 08:29:17'),
('3ed4619ead161d5f9873fb15613b6e004e10961cfe359abd4ce3662e16e871c4ec02a4598b76356f', 7, 1, 'accessToken', '[]', 0, '2022-11-23 22:09:11', '2022-11-23 22:09:11', '2023-11-24 06:09:11'),
('60416d593f6e04031b772426b16853cb2d884a2e72738a50f712dbffd3c93f39b72a0b4f5c781394', 4, 1, 'accessToken', '[]', 0, '2022-11-24 22:40:19', '2022-11-24 22:40:20', '2023-11-25 06:40:19'),
('7063cd1a2eed75dcc91d8f945c27b964a678045b65303b5db4d7e4110f3885ee24b299657602f006', 7, 1, 'accessToken', '[]', 0, '2022-11-23 22:45:44', '2022-11-23 22:45:44', '2023-11-24 06:45:44'),
('7264eea57d0ca496a8a8d2aabd3d97fe69cb4cb04379d2218073c275c65b2a7124368befa33bc7a6', 8, 1, 'accessToken', '[]', 0, '2022-11-23 22:09:31', '2022-11-23 22:09:31', '2023-11-24 06:09:31'),
('7dc9b3d26e7d00c344d7afad01906c3adc5fa91b7260816de911a610351f68fd1d07573ecc18d2e7', 6, 1, 'accessToken', '[]', 0, '2022-11-23 22:06:53', '2022-11-23 22:06:54', '2023-11-24 06:06:53'),
('80d4adde404b12a4dee221a6f61944b9d5c5906298928b9dd3da09cc6f8a321765143499fa9e1339', 7, 1, 'accessToken', '[]', 0, '2022-11-23 22:45:23', '2022-11-23 22:45:23', '2023-11-24 06:45:23'),
('889cbf6f69dcedf53dee91897e37bfa159f1d1cd614d9585bdaf74e4e6062b59841446cd11f84269', 4, 1, 'accessToken', '[]', 0, '2022-11-26 00:29:40', '2022-11-26 00:29:40', '2023-11-26 08:29:40'),
('8f62fd345f26b7b72f1c6bc25f3aa99122379bc969fa3d7da88cf2cffedf6aea7c3f0f6ae49344aa', 4, 1, 'accessToken', '[]', 0, '2022-11-24 01:22:33', '2022-11-24 01:22:33', '2023-11-24 09:22:33'),
('9c2268d5e5eca6545e0e75e973dbd14aa7bd101ed2d94dc959eeaadb53c9c295bd2ae659a8d63415', 9, 1, 'accessToken', '[]', 0, '2022-11-23 22:10:29', '2022-11-23 22:10:29', '2023-11-24 06:10:29'),
('be0b2b943cea148872d071a024d00dc7fe719e5c846640b0f5cab671fbf1409e0d53c3003097f774', 4, 1, 'accessToken', '[]', 0, '2022-11-24 01:25:24', '2022-11-24 01:25:24', '2023-11-24 09:25:24'),
('c56cb0285e41ea6fa0d2041a849fd73a8f7be002fcec76c1f1a42734590f07e76b284cf08ee38f0c', 4, 1, 'accessToken', '[]', 0, '2022-11-26 00:27:55', '2022-11-26 00:27:55', '2023-11-26 08:27:55'),
('c88dbc37776723f049c2d481cb0ad4cb27e5c1492d80eeaf5dc507c65d69376f4f2238ccb9f41148', 4, 1, 'accessToken', '[]', 0, '2022-11-24 03:46:10', '2022-11-24 03:46:10', '2023-11-24 11:46:10'),
('d04b8fbace9bcccafec72ba132217e8b490f5d1eab8c9caeb85a1b5a3e6a943541a0779bcad6b0e3', 4, 1, 'accessToken', '[]', 0, '2022-11-26 00:29:32', '2022-11-26 00:29:32', '2023-11-26 08:29:32'),
('d1cc4223ff5b02bd776213063f5a1479a9c067aed65cd0bd97074918b4a08659c74b4acbdee3a700', 4, 1, 'accessToken', '[]', 0, '2022-11-24 03:34:22', '2022-11-24 03:34:22', '2023-11-24 11:34:22'),
('d2eff27c636c2c34de6944c6fac80324fef7530a6e4ab82ad51f2d478d3ae0e37a60272d087bec27', 4, 1, 'accessToken', '[]', 0, '2022-11-24 03:42:11', '2022-11-24 03:42:11', '2023-11-24 11:42:11'),
('dba8325c10ba15df264848228ea2356326c41cc8e85c54d5ff8e4ff8325397f8f32f6f14381910b6', 4, 1, 'accessToken', '[]', 0, '2022-11-24 01:22:29', '2022-11-24 01:22:29', '2023-11-24 09:22:29'),
('e46f6d150e12f3074db0c927c9217c002f2b6ce20fe7c42d99d8d74eef62deb032bd28a08331c7eb', 4, 1, 'accessToken', '[]', 0, '2022-11-24 03:36:00', '2022-11-24 03:36:00', '2023-11-24 11:36:00'),
('e62373533e1e33b608958443dc2ad212d362948e3963b0d9327d7ca2ce401bfa97cdb1ef8c5a163a', 4, 1, 'accessToken', '[]', 0, '2022-11-23 22:02:32', '2022-11-23 22:02:32', '2023-11-24 06:02:32'),
('eb144c9a6952e9a4a8ba56ac8b354a623f5ae96e2e9383cfdd3deb634524aed4c32eeb0a44f77e10', 4, 1, 'accessToken', '[]', 0, '2022-11-24 03:44:26', '2022-11-24 03:44:26', '2023-11-24 11:44:26'),
('f325f98e0b1e6cc05a76b1b60392f33232e32bb71a075fafe85d484270222a738c701dd501623faf', 7, 1, 'accessToken', '[]', 0, '2022-11-23 22:45:37', '2022-11-23 22:45:37', '2023-11-24 06:45:37'),
('f9835c26ee43b32ffa0b19834a4580c8adc41802a663f32dd2ff4c16ed150dc2843f3dd3cdb4b3e6', 4, 1, 'accessToken', '[]', 0, '2022-11-26 00:14:52', '2022-11-26 00:14:52', '2023-11-26 08:14:52'),
('fb392e1be5937d80137408bdce90fae3670f7445986a6613787f4198954ad79c5bb776f8f53f22e0', 3, 1, 'accessToken', '[]', 0, '2022-11-23 22:00:10', '2022-11-23 22:00:11', '2023-11-24 06:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'yjZSg6VEKG6pKEkZB7y0fw4MOQNwKbpzM0TGTY3T', NULL, 'http://localhost', 1, 0, 0, '2022-11-23 01:44:35', '2022-11-23 01:44:35'),
(2, NULL, 'Laravel Password Grant Client', 'zP7ilJPchXjTHwHVFdg4GpHmamPrwysDuPjcJHcQ', 'users', 'http://localhost', 0, 1, 0, '2022-11-23 01:44:35', '2022-11-23 01:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-23 01:44:35', '2022-11-23 01:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pokemon_likes`
--

CREATE TABLE `pokemon_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pokemon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `liked` tinyint(1) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pokemon_likes`
--

INSERT INTO `pokemon_likes` (`id`, `pokemon`, `liked`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Bulbasaur', 0, 4, '2022-11-25 02:10:37', '2022-11-25 04:31:28'),
(2, 'Charmeleon', 0, 4, '2022-11-25 02:11:09', '2022-11-25 02:11:45'),
(3, 'Venusaur', 1, 4, '2022-11-25 03:47:57', '2022-11-25 05:31:29'),
(4, 'Ivysaur', 1, 1, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(5, 'Ivysaur', 0, 2, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(6, 'Ivysaur', 0, 3, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(7, 'Ivysaur', 0, 4, '2022-11-25 04:29:28', '2022-11-25 23:39:45'),
(8, 'Ivysaur', 1, 5, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(9, 'venusaur', 1, 5, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(10, 'ditto', 0, 5, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(11, 'wartortle', 0, 5, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(12, 'blastoise', 1, 5, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(13, 'kakuna', 0, 5, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(14, 'raticate', 0, 5, '2022-11-25 04:29:28', '2022-11-25 04:29:28'),
(15, 'blastoise', 0, 4, '2022-11-25 23:36:02', '2022-11-25 23:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `birthday`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sample', 'sample last', '1998-07-24', 'sample@sample.com', NULL, '$2y$10$t/76iZ0sigXDtZtNGYHXK.sGo6cYAK874FBFUbOjSRy/qokKGeXmi', NULL, '2022-11-23 21:58:14', '2022-11-23 21:58:14'),
(2, 'sample', 'sample', '2022-07-21', 'sample@sample.cm', NULL, '$2y$10$/uEeFGZI1mwuNuylj0skwOt6Uc61jYK/cg7EunOdWRcaN0OjNy.8O', NULL, '2022-11-23 21:58:59', '2022-11-23 21:58:59'),
(3, 'sample', 'sample', '2022-07-21', 'sample@sample.cpm', NULL, '$2y$10$OwZ4d5N8b9SaIVLoBYvHtO7c8a55b/k3qEA2jpVSore1aPEEVKNHu', NULL, '2022-11-23 22:00:07', '2022-11-23 22:00:07'),
(4, 'First name', 'Last name', '2022-11-09', 'sample@sample.cqwem', NULL, '$2y$10$1l9ljurEAu.8Lks7joqygOI6mifqOrPZmflUh09Zf3hh4DU9yd3kC', NULL, '2022-11-23 22:02:30', '2022-11-26 00:29:40'),
(5, 'First', 'last', '2022-07-21', 'first@last.com', NULL, '$2y$10$l5u3Vl25NboblwxGBqaxLOzVOs6CjYcCYjKmaR/MM.7KPVsQ8WBte', NULL, '2022-11-23 22:03:47', '2022-11-23 22:03:47'),
(6, 'sample', 'sample', '2022-07-21', 'sample123@gmai.com', NULL, '$2y$10$C1JCN70itTNZCdFX1RsrvuoPn82pNLpnf82IIa0y3gRFSYeMlsl1y', NULL, '2022-11-23 22:06:51', '2022-11-23 22:06:51'),
(7, 'qwe', 'wqwe', '2022-07-21', 'qwe@asdfasd.com', NULL, '$2y$10$1oB21ilSUOiWtiGlhZzKj.FSLtWT7wQ4MktqeUhtBA0Fc3GhMJfcW', NULL, '2022-11-23 22:09:09', '2022-11-23 22:09:09'),
(8, 'sasasdf', 'asdfasdf', '2022-07-21', 'asdfasdf@asdfasdfadfasdf', NULL, '$2y$10$PDrnKvPZ9ZJ3EupACrWsseBr7xFtXrCQQMEcjj8KfwaaRmI1tEwKi', NULL, '2022-11-23 22:09:31', '2022-11-23 22:09:31'),
(9, 'asdfasdf', 'asdfasdf', '2022-07-21', 'asdfasdf@asdfasdf', NULL, '$2y$10$5Q5X63qzmK7AMr50vjimx.6iRu9jTnvUDuZkJHOBdNcOY5vAmlQV2', NULL, '2022-11-23 22:10:27', '2022-11-23 22:10:27');

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pokemon_likes`
--
ALTER TABLE `pokemon_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pokemon_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pokemon_likes`
--
ALTER TABLE `pokemon_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pokemon_likes`
--
ALTER TABLE `pokemon_likes`
  ADD CONSTRAINT `pokemon_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
