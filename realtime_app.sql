-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2025 at 07:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtime_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad_slots`
--

CREATE TABLE `ad_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `minimum_bid_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` enum('upcoming','open','closed','awarded') NOT NULL DEFAULT 'upcoming',
  `winner_bid_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_slots`
--

INSERT INTO `ad_slots` (`id`, `name`, `start_time`, `end_time`, `minimum_bid_price`, `status`, `winner_bid_id`, `created_at`, `updated_at`) VALUES
(1, 'Slot #1', '2025-09-23 10:43:20', '2025-09-23 10:46:20', 10.00, 'closed', NULL, '2025-09-23 10:41:20', '2025-09-23 10:47:00'),
(2, 'Slot #2', '2025-09-23 10:45:20', '2025-09-23 10:48:20', 10.00, 'closed', NULL, '2025-09-23 10:41:20', '2025-09-23 10:49:00'),
(3, 'Slot #3', '2025-09-23 10:47:20', '2025-09-23 10:50:20', 10.00, 'closed', NULL, '2025-09-23 10:41:20', '2025-09-23 10:51:00'),
(4, 'Slot #4', '2025-09-23 10:49:20', '2025-09-23 10:52:20', 10.00, 'closed', NULL, '2025-09-23 10:41:20', '2025-09-23 10:53:00'),
(5, 'Slot #5', '2025-09-23 10:51:20', '2025-09-23 10:54:20', 10.00, 'closed', NULL, '2025-09-23 10:41:20', '2025-09-23 10:55:00'),
(6, 'Slot #10', '2025-09-23 10:47:20', '2025-09-24 10:50:20', 10.00, 'open', NULL, '2025-09-23 10:41:20', '2025-09-23 10:51:00'),
(7, 'Slot #11', '2025-09-23 10:49:20', '2025-09-23 10:52:20', 10.00, 'awarded', 2, '2025-09-23 10:41:20', '2025-09-23 11:33:01'),
(8, 'Slot #12', '2025-09-23 10:51:20', '2025-09-24 10:54:20', 10.00, 'open', NULL, '2025-09-23 10:41:20', '2025-09-23 10:55:00'),
(9, 'Slot #13', '2025-09-24 10:47:20', '2025-09-25 10:50:20', 10.00, 'upcoming', NULL, '2025-09-23 10:41:20', '2025-09-23 10:51:00'),
(10, 'Slot #14', '2025-09-24 10:49:20', '2025-09-25 10:52:20', 10.00, 'upcoming', NULL, '2025-09-23 10:41:20', '2025-09-23 10:53:00'),
(11, 'Slot #15', '2025-09-24 10:51:20', '2025-09-25 10:54:20', 10.00, 'upcoming', NULL, '2025-09-23 10:41:20', '2025-09-23 10:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ad_slot_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `user_id`, `ad_slot_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 12, 7, 25.00, '2025-09-23 11:24:34', '2025-09-23 11:24:34'),
(2, 2, 7, 100.00, '2025-09-23 11:25:45', '2025-09-23 11:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_23_142742_create_ad_slots_table', 1),
(5, '2025_09_23_142821_create_bids_table', 1),
(6, '2025_09_23_142918_create_winners_table', 1),
(7, '2025_09_23_144613_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 12, 'api-token', 'bc6d278c28650bfe6c81dc857f4b3ca41aebf450508d14cffa4059aae85f5f7b', '[\"*\"]', NULL, NULL, '2025-09-23 10:41:29', '2025-09-23 10:41:29'),
(2, 'App\\Models\\User', 12, 'api-token', '209328a94beff8e43321d224ec7a83b987081648575a95d619a332d96eeaf6c4', '[\"*\"]', '2025-09-23 11:11:15', NULL, '2025-09-23 10:54:13', '2025-09-23 11:11:15'),
(3, 'App\\Models\\User', 12, 'api-token', '61c7a7526e2b16211983a556e3c7d4ac6c27562dc7952a67891cc9a28d2f92cf', '[\"*\"]', '2025-09-23 11:34:32', NULL, '2025-09-23 11:12:27', '2025-09-23 11:34:32');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Merritt Greenfelder', 'savion24@example.org', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', 'yzu7rA43UB', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(2, 'Santino Robel', 'rogelio.sawayn@example.net', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', '2gRaRpBy4y', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(3, 'Sid Grady', 'guido74@example.net', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', 'cqT9BGw8Mb', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(4, 'Verdie Russel', 'ardella.wunsch@example.net', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', 'ZgkHYozaqR', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(5, 'Clifton Kling', 'vlehner@example.com', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', 'jDmwmUN72q', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(6, 'Shyanne Murazik', 'xboyle@example.net', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', 'j1laTg3DAq', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(7, 'Milton Dickinson', 'lyric58@example.net', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', 'gYt76ghi6b', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(8, 'Sabrina Collier', 'lyda55@example.com', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', 'N8DNMqKXvu', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(9, 'Ms. Carolanne Reilly', 'citlalli.swift@example.net', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', 'GsSP1CsqNt', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(10, 'Mrs. Natalia Reichert', 'anicolas@example.net', '2025-09-23 10:41:20', '$2y$12$S7E1WmAOYNZssILo/AKLJOzrI1fl6TDqMYIck6IL1Vub2yHK9W6UO', '8wp6MZozMU', '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(11, 'Admin', 'admin@example.com', NULL, '$2y$12$/oO/KeMg6gKtcC8T7K8CZu1es7HU/nh.hmbvC0iosvy6eCvEBhskO', NULL, '2025-09-23 10:41:20', '2025-09-23 10:41:20'),
(12, 'User', 'user1@example.com', NULL, '$2y$12$RDA9L2WyPAAfcjZGOjxW5.7i5KT0jfnedvZhr5hK9IdWJdZK0O6iW', NULL, '2025-09-23 10:41:20', '2025-09-23 10:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `winners`
--

CREATE TABLE `winners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_slot_id` bigint(20) UNSIGNED NOT NULL,
  `bid_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `winners`
--

INSERT INTO `winners` (`id`, `ad_slot_id`, `bid_id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 7, 2, 2, 100.00, '2025-09-23 11:33:01', '2025-09-23 11:33:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_slots`
--
ALTER TABLE `ad_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_slots_start_time_end_time_index` (`start_time`,`end_time`),
  ADD KEY `ad_slots_winner_bid_id_index` (`winner_bid_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bids_user_id_foreign` (`user_id`),
  ADD KEY `bids_ad_slot_id_created_at_index` (`ad_slot_id`,`created_at`),
  ADD KEY `bids_ad_slot_id_amount_index` (`ad_slot_id`,`amount`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `winners`
--
ALTER TABLE `winners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `winners_ad_slot_id_unique` (`ad_slot_id`),
  ADD KEY `winners_bid_id_foreign` (`bid_id`),
  ADD KEY `winners_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad_slots`
--
ALTER TABLE `ad_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `winners`
--
ALTER TABLE `winners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ad_slot_id_foreign` FOREIGN KEY (`ad_slot_id`) REFERENCES `ad_slots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bids_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `winners`
--
ALTER TABLE `winners`
  ADD CONSTRAINT `winners_ad_slot_id_foreign` FOREIGN KEY (`ad_slot_id`) REFERENCES `ad_slots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `winners_bid_id_foreign` FOREIGN KEY (`bid_id`) REFERENCES `bids` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `winners_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
