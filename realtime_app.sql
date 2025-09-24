-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2025 at 08:31 AM
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
  `name` varchar(255) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `minimum_bid_price` decimal(4,2) NOT NULL DEFAULT 0.00,
  `status` enum('upcoming','open','closed','awarded') NOT NULL DEFAULT 'upcoming',
  `winner_bid_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_slots`
--

INSERT INTO `ad_slots` (`id`, `name`, `start_time`, `end_time`, `minimum_bid_price`, `status`, `winner_bid_id`, `created_at`, `updated_at`) VALUES
(1, 'Slot #1', '2025-09-24 06:31:41', '2025-09-24 06:34:41', 10.00, 'upcoming', NULL, '2025-09-24 06:29:41', '2025-09-24 06:29:41'),
(2, 'Slot #2', '2025-09-24 06:33:41', '2025-09-24 06:36:41', 10.00, 'upcoming', NULL, '2025-09-24 06:29:41', '2025-09-24 06:29:41'),
(3, 'Slot #3', '2025-09-24 06:35:41', '2025-09-24 06:38:41', 10.00, 'upcoming', NULL, '2025-09-24 06:29:41', '2025-09-24 06:29:41'),
(4, 'Slot #4', '2025-09-24 06:37:41', '2025-09-24 06:40:41', 10.00, 'upcoming', NULL, '2025-09-24 06:29:41', '2025-09-24 06:29:41'),
(5, 'Slot #5', '2025-09-24 06:39:41', '2025-09-24 06:42:41', 10.00, 'upcoming', NULL, '2025-09-24 06:29:41', '2025-09-24 06:29:41');

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
  `is_admin` enum('1','0') NOT NULL DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Evans O\'Reilly', 'davis.miles@example.net', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'C6dyXdTnJF', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(2, 'Nayeli Dicki', 'mae.oreilly@example.com', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'b4XEl8NdR2', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(3, 'Archibald Hand', 'nils16@example.org', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'GXYkn4w98y', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(4, 'Prof. Arthur McLaughlin Jr.', 'qbalistreri@example.org', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'IiFfwipk8F', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(5, 'Prof. Jarrell Keeling', 'ybaumbach@example.com', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'iHFv5KnLD5', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(6, 'Christian Schoen', 'jackson.schumm@example.net', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'WsWz2jHEXS', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(7, 'Mr. Russ Herman I', 'gloria.feeney@example.com', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'EDRDJfNEpI', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(8, 'Beaulah Spencer', 'marielle66@example.org', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'nWC2WBlbWt', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(9, 'Giovani Mitchell', 'bconroy@example.org', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'slQEAseaPG', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(10, 'Lera Hyatt Jr.', 'iankunding@example.org', '2025-09-24 06:29:40', '$2y$12$DlcVfE20Bn/7qMId1qjmLu1iuSgZinA4QKGcVEdFzpUNm5AUeIKca', '0', 'uLodHDR2eT', '2025-09-24 06:29:40', '2025-09-24 06:29:40'),
(11, 'Admin', 'admin@example.com', NULL, '$2y$12$e14J6mxFjzftmLA80CTczOatEUCMH45fAK.hIK8vCRTFdngEYjcLy', '1', NULL, '2025-09-24 06:29:41', '2025-09-24 06:29:41'),
(12, 'User', 'user1@example.com', NULL, '$2y$12$q65YdwUxqSXlZ2XQwtCaE.R.nbToy8M3fLusqbux46aNu.yZS7IhG', '0', NULL, '2025-09-24 06:29:41', '2025-09-24 06:29:41');

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
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_slots`
--
ALTER TABLE `ad_slots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ad_slots_name_unique` (`name`),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `winners`
--
ALTER TABLE `winners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
