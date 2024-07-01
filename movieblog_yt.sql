-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 09:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movieblog_yt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'lazydeveloper.us@gmail.com', '$2y$12$rzx9rmIcKCuaK.Ixvxio9e/HLpUasDyCayuyeYbJgR7yxC0m.2XOe', '2023-11-16 10:55:24', '2023-11-16 10:55:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_status` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `cat_status`, `created_at`, `updated_at`) VALUES
(1, 'kollywood', '1', '2023-11-17 12:17:38', '2023-11-17 12:17:38'),
(2, 'shywood', '1', '2023-11-20 06:34:23', '2023-11-20 07:35:32'),
(4, 'lazywood', '1', '2024-01-31 04:53:48', '2024-01-31 04:53:48'),
(5, 'Tamil', '1', '2024-01-31 06:40:05', '2024-01-31 06:40:05'),
(6, 'Hindi', '1', '2024-01-31 06:40:11', '2024-01-31 06:40:11'),
(7, 'Malyalam', '1', '2024-01-31 06:40:18', '2024-01-31 06:40:18'),
(8, 'English', '1', '2024-01-31 06:40:30', '2024-01-31 06:40:30'),
(9, 'Romance', '1', '2024-01-31 06:40:43', '2024-01-31 06:40:43'),
(10, 'Adult', '1', '2024-01-31 06:40:58', '2024-01-31 06:40:58'),
(11, 'Urdu', '1', '2024-01-31 06:41:32', '2024-01-31 06:41:32'),
(12, 'Comedy', '1', '2024-01-31 06:44:02', '2024-01-31 06:44:02'),
(13, 'Horror', '1', '2024-01-31 06:44:23', '2024-01-31 06:44:23'),
(14, 'Thriller', '1', '2024-01-31 06:44:34', '2024-01-31 06:44:34'),
(15, 'LazyDeveloperr', '1', '2024-07-01 01:06:17', '2024-07-01 01:06:17');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_16_161803_admin', 1),
(6, '2023_11_17_173910_create_categories_table', 2),
(8, '2023_12_07_152313_create_posts_table', 3);

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
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `video_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `movie_info` longtext DEFAULT NULL,
  `screenshots` longtext DEFAULT NULL,
  `download_description` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `date`, `category_id`, `video_type`, `status`, `slug`, `movie_info`, `screenshots`, `download_description`, `thumbnail`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(4, 'The Beast Below (2022) WEB-DL Hindi Dubbed (ORG) Full-Movie 480p [400MB] | 720p [1.2GB] | 1080p [2.3GB]', NULL, 1, '4k', '1', 'the-beast-below-2022-web-dl-hindi-dubbed-org-full-movie-480p-400mb-720p-1-2gb-1080p-2-3gb', '<p><span style=\"font-size:14px;\">✨ &nbsp;<strong>Name </strong>: LazyDeveloper 2024&nbsp;</span></p><p><span style=\"font-size:14px;\">🎉 <strong>Release Year : </strong>2024</span></p><p><span style=\"font-size:14px;\">🎁 <strong>Language : </strong>Hindi - English - Hindi - Urdu - Spanish</span></p><p><span style=\"font-size:14px;\">📸 <strong>Quality : [ </strong>720p - 1080p - 1440p - 4k ]&nbsp;</span></p><p><span style=\"font-size:14px;\">🎭 <strong>Genres : </strong>Coding - SciFi - Technology</span></p><p>&nbsp;</p><div class=\"page-break\" style=\"page-break-after:always;\"><span style=\"display:none;\">&nbsp;</span></div><p>&nbsp;</p><p><span style=\"font-size:18px;\">Contact @</span><a href=\"https://telegram.me/LazyDeveloperr\"><span style=\"color:hsl(0,75%,60%);font-size:18px;\"><strong><u>LazyDeveloperr </u></strong></span></a><span style=\"font-size:18px;\">to buy updated version code of this site . See Demo from here 👉 </span><a href=\"https://moviesadda.pro\"><span style=\"font-size:18px;\">CLICK HERE</span></a></p><div class=\"page-break\" style=\"page-break-after:always;\"><span style=\"display:none;\">&nbsp;</span></div><p>&nbsp;</p>', '<figure class=\"image\"><img style=\"aspect-ratio:800/333;\" src=\"http://localhost:8000/storage/upload/1719684497YbrfgD3xnI.png\"><figure class=\"image\"><img style=\"aspect-ratio:800/333;\" src=\"http://localhost:8000/storage/upload/1719684497Q6kGgKNe0K.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:800/333;\" src=\"http://localhost:8000/storage/upload/1719684497qnuRQlMA6k.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:800/333;\" src=\"http://localhost:8000/storage/upload/1719684497sg8GMksmQR.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:800/333;\" src=\"http://localhost:8000/storage/upload/1719684497v3p1SFN4GQ.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:800/333;\" src=\"http://localhost:8000/storage/upload/1719684497nhnCndJ7SO.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:800/333;\" src=\"http://localhost:8000/storage/upload/17196844973FGO6AIjDA.png\"></figure></figure>\n', '<h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(27, 27, 27);border-width:0px;color:rgb(85, 85, 85);font-family:Roboto;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-size:22px;font-stretch:inherit;font-style:normal;font-variant-alternates:inherit;font-variant-caps:normal;font-variant-east-asian:inherit;font-variant-ligatures:normal;font-variant-numeric:inherit;font-variant-position:inherit;font-variation-settings:inherit;font-weight:normal;letter-spacing:normal;line-height:1.3;margin:0px 0px 12px;orphans:2;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(0,128,128);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\">Season 4 (Hindi-English) 480p </span></span><span style=\"color:rgb(51,102,255);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\">x264</span></span><span style=\"color:rgb(0,128,128);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\"> Esusb [200MB]</span></span></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(27, 27, 27);border-width:0px;color:rgb(161, 161, 170);font-family:Roboto;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-size:16px;font-stretch:inherit;font-style:normal;font-variant-alternates:inherit;font-variant-caps:normal;font-variant-east-asian:inherit;font-variant-ligatures:normal;font-variant-numeric:inherit;font-variant-position:inherit;font-variation-settings:inherit;font-weight:400;letter-spacing:normal;line-height:inherit;margin:0px 0px 20px;orphans:2;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><a class=\"maxbutton-1 maxbutton\" style=\"background-color:rgb(224, 224, 224);border-radius:8px;border:2px outset rgb(0, 0, 0);box-shadow:rgb(255, 255, 255) 0px 0px 2px 0px;color:rgb(206, 206, 206);display:inline-block;font:inherit;height:45px;margin:0px;padding:0px;position:relative;text-decoration:none;transition:color 0.25s ease-in 0s;vertical-align:middle;width:200px;\" href=\"https://indiainfo4u.in/?id=N3diQXhOWHpPZDUyRFZTL3dJTy9zU1lNRjNqWGtsczFNN0lNS1BhbDRVQjErOTN2eDArY0RXbEdDQmg1VTlFS3V4ZEtCR2lVczRpczFCcHVwSjZKUnRLMVNEcGc3ZnlTRGRZZXN2SXlwV2c9\" target=\"_blank\" rel=\"nofollow noreferrer noopener\"><span style=\"background-color:unset;color:rgb(0,0,0);font-family:;\"><span class=\"mb-text\" style=\"border-width:0px;box-sizing:border-box;display:block;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-stretch:inherit;font-style:normal;font-variant:inherit;font-variation-settings:inherit;line-height:1em;margin:0px;padding:12px 0px 0px;text-align:center;vertical-align:baseline;\" trebuchet=\"\"><strong>Download Links</strong></span></span></a></p><h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(27, 27, 27);border-width:0px;color:rgb(85, 85, 85);font-family:Roboto;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-size:22px;font-stretch:inherit;font-style:normal;font-variant-alternates:inherit;font-variant-caps:normal;font-variant-east-asian:inherit;font-variant-ligatures:normal;font-variant-numeric:inherit;font-variant-position:inherit;font-variation-settings:inherit;font-weight:normal;letter-spacing:normal;line-height:1.3;margin:0px 0px 12px;orphans:2;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(0,128,128);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\">Season 4 (Hindi-English) 720p </span></span><span style=\"color:rgb(51,102,255);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\">x264</span></span><span style=\"color:rgb(0,128,128);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\"> Esusb [550MB]</span></span></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(27, 27, 27);border-width:0px;color:rgb(161, 161, 170);font-family:Roboto;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-size:16px;font-stretch:inherit;font-style:normal;font-variant-alternates:inherit;font-variant-caps:normal;font-variant-east-asian:inherit;font-variant-ligatures:normal;font-variant-numeric:inherit;font-variant-position:inherit;font-variation-settings:inherit;font-weight:400;letter-spacing:normal;line-height:inherit;margin:0px 0px 20px;orphans:2;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><a class=\"maxbutton-1 maxbutton\" style=\"background-color:rgb(224, 224, 224);border-radius:8px;border:2px outset rgb(0, 0, 0);box-shadow:rgb(255, 255, 255) 0px 0px 2px 0px;color:rgb(206, 206, 206);display:inline-block;font:inherit;height:45px;margin:0px;padding:0px;position:relative;text-decoration:none;transition:color 0.25s ease-in 0s;vertical-align:middle;width:200px;\" href=\"https://indiainfo4u.in/?id=N3diQXhOWHpPZDUyRFZTL3dJTy9zU1lNRjNqWGtsczFNN0lNS1BhbDRVQjErOTN2eDArY0RXbEdDQmg1VTlFS3V4ZEtCR2lVczRpczFCcHVwSjZKUmsyS3dydXZ1aE9LeitZODdTOElRNDA9\" target=\"_blank\" rel=\"nofollow noreferrer noopener\"><span style=\"background-color:unset;color:rgb(0,0,0);font-family:;\"><span class=\"mb-text\" style=\"border-width:0px;box-sizing:border-box;display:block;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-stretch:inherit;font-style:normal;font-variant:inherit;font-variation-settings:inherit;line-height:1em;margin:0px;padding:12px 0px 0px;text-align:center;vertical-align:baseline;\" trebuchet=\"\"><strong>Download Links</strong></span></span></a></p><h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(27, 27, 27);border-width:0px;color:rgb(85, 85, 85);font-family:Roboto;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-size:22px;font-stretch:inherit;font-style:normal;font-variant-alternates:inherit;font-variant-caps:normal;font-variant-east-asian:inherit;font-variant-ligatures:normal;font-variant-numeric:inherit;font-variant-position:inherit;font-variation-settings:inherit;font-weight:normal;letter-spacing:normal;line-height:1.3;margin:0px 0px 12px;orphans:2;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(0,128,128);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\">Season 4 (Hindi-English) 1080p</span></span><span style=\"color:rgb(51,102,255);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\"> x264 </span></span><span style=\"color:rgb(0,128,128);\"><span style=\"border-width:0px;font:inherit;margin:0px;padding:0px;vertical-align:baseline;\">Esusb [1.2GB]</span></span></h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(27, 27, 27);border-width:0px;color:rgb(161, 161, 170);font-family:Roboto;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-size:16px;font-stretch:inherit;font-style:normal;font-variant-alternates:inherit;font-variant-caps:normal;font-variant-east-asian:inherit;font-variant-ligatures:normal;font-variant-numeric:inherit;font-variant-position:inherit;font-variation-settings:inherit;font-weight:400;letter-spacing:normal;line-height:inherit;margin:0px 0px 20px;orphans:2;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><a class=\"maxbutton-1 maxbutton\" style=\"background-color:rgb(224, 224, 224);border-radius:8px;border:2px outset rgb(0, 0, 0);box-shadow:rgb(255, 255, 255) 0px 0px 2px 0px;color:rgb(206, 206, 206);display:inline-block;font:inherit;height:45px;margin:0px;padding:0px;position:relative;text-decoration:none;transition:color 0.25s ease-in 0s;vertical-align:middle;width:200px;\" href=\"https://indiainfo4u.in/?id=N3diQXhOWHpPZDUyRFZTL3dJTy9zU1lNRjNqWGtsczFNN0lNS1BhbDRVQjErOTN2eDArY0RXbEdDQmg1VTlFS3V4ZEtCR2lVczRpczFCcHVwSjZKUm1zMzlvZmRraXllWXY5S25CaFJxc3c9\" target=\"_blank\" rel=\"nofollow noreferrer noopener\"><span style=\"background-color:unset;color:rgb(0,0,0);font-family:;\"><span class=\"mb-text\" style=\"border-width:0px;box-sizing:border-box;display:block;font-feature-settings:inherit;font-kerning:inherit;font-optical-sizing:inherit;font-stretch:inherit;font-style:normal;font-variant:inherit;font-variation-settings:inherit;line-height:1em;margin:0px;padding:12px 0px 0px;text-align:center;vertical-align:baseline;\" trebuchet=\"\"><strong>Download Links</strong></span></span></a></p>', '1706701165.jpg', 'The Beast Below (2022) Full Movie Dubbed in HINDI (Dual Audio) [WEB-DL] .', 'The Beast Below (2022) Full Movie Dubbed in HINDI (Dual Audio) [WEB-DL] : An adventure comedy that follows a once-famous singer who returns to his hometown and takes part in a water field drilling contest, hoping to win a large cash prize. But what they do not realise is that a mysterious beast lurks underground.', 'The Beast Below (2022) Full Movie Dubbed in HINDI (Dual Audio) [WEB-DL]', '2024-01-31 06:09:26', '2024-06-30 01:31:36'),
(5, '18+ Outlawed (2018) Dual Audio [Hindi + English] WeB-DL 480p [350MB] | 720p [1GB] | 1080p [2GB]', '2024-01-31', 4, '4k', '1', '18-outlawed-2018-dual-audio-hindi-english-web-dl-480p-350mb-720p-1gb-1080p-2gb', NULL, NULL, '<p>Download Outlawed (2018) Dual Audio (Hindi-EnglishEnglish movie and available in 1080p &amp; 720p &amp; 480p qualities. This is one of the best movie based on Action, Adventure, Thriller. This movie is now available in Hindi. Download Outlawed (2018) Dual Audio (Hindi-English) Full Movie. This is a English movie and available in<p>&nbsp;</p><figure class=\"image\"><img style=\"aspect-ratio:350/200;\" width=\"350\" height=\"200\" src=\"http://127.0.0.1:8000/storage/upload/17194815934sAaqdyvxy.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:350/200;\" width=\"350\" height=\"200\" src=\"http://127.0.0.1:8000/storage/upload/17194815937WaEfGmOjp.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:350/200;\" width=\"350\" height=\"200\" src=\"http://127.0.0.1:8000/storage/upload/1719481593f7Aa5cUaVH.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:350/200;\" width=\"350\" height=\"200\" src=\"http://127.0.0.1:8000/storage/upload/1719481593bvqot55ioH.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:350/200;\" width=\"350\" height=\"200\" src=\"http://127.0.0.1:8000/storage/upload/17194815934J8me5o6P5.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:350/200;\" width=\"350\" height=\"200\" src=\"http://127.0.0.1:8000/storage/upload/17194815931Y0y12miXT.png\"></figure></p>\n', '1719481593.jpg', '18+ Outlawed (2018) Dual Audio [Hindi + English] WeB-DL 480p [350MB] | 720p [1GB] | 1080p [2GB]', '18+ Outlawed (2018) Dual Audio [Hindi + English] WeB-DL 480p [350MB] | 720p [1GB] | 1080p [2GB]\r\n18+ Outlawed (2018) Dual Audio [Hindi + English] WeB-DL 480p [350MB] | 720p [1GB] | 1080p [2GB]\r\n18+ Outlawed (2018) Dual Audio [Hindi + English] WeB-DL 480p [350MB] | 720p [1GB] | 1080p [2GB]', '18+ Outlawed (2018) Dual Audio [Hindi + English] WeB-DL 480p [350MB] | 720p [1GB] | 1080p [2GB]', '2024-01-31 06:12:08', '2024-06-27 04:16:33'),
(7, 'King of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]', '2024-01-31', 4, '4k', '1', 'king-of-the-lost-world-2004-dual-audio-hindi-english-bluray-480p-250mb-720p-700mb-1080p-2gb-2', NULL, NULL, '<p>King of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]</p>\n', '1706701507.jpg', 'King of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]', 'King of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]\r\nKing of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]', 'King of the Lost World (2004) Dual Audio [Hindi + English] BluRay 480p [250MB] | 720p [700MB] | 1080p [2GB]', '2024-01-31 06:15:07', '2024-01-31 06:15:07'),
(9, 'Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]', '2024-01-31', 4, '4k', '1', 'welcome-to-marwen-2018-dual-audio-hindi-english-web-dl-480p-400mb-720p-1gb-1080p-2gb-2', NULL, NULL, '<p>Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]vvv</p>\n', '1706701578.jpg', 'Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]', 'Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]v', 'Welcome to Marwen (2018) Dual Audio [Hindi + English] WeB-DL 480p [400MB] | 720p [1GB] | 1080p [2GB]', '2024-01-31 06:16:18', '2024-01-31 06:16:18'),
(10, 'Beyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]', '2024-01-31', 1, '4k', '1', 'beyond-redemption-2015-dual-audio-hindi-english-web-dl-480p-300mb-720p-850mb-1080p-1-9gb', NULL, NULL, '<p>Beyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]</p>\n', '1706701675.jpg', 'Beyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]', 'Beyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]\r\nBeyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]', 'Beyond Redemption (2015) Dual Audio [Hindi + English] WeB-DL 480p [300MB] | 720p [850MB] | 1080p [1.9GB]', '2024-01-31 06:17:55', '2024-01-31 06:17:55'),
(12, 'LazyDeveloper is my fav dev. He is New but perfect to me.......', '2024-01-31', 4, '12k', '2', 'lazydeveloper-is-my-fav-dev-he-is-new-but-perfect-to-me', NULL, NULL, '<blockquote><p>&nbsp;</p><p><span style=\"color:hsl(0, 0%, 0%);font-size:45px;\"><strong>LazyDeveloper is my fav dev. He is New but perfect to me.......</strong></span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><figure class=\"image\"><img style=\"aspect-ratio:1024/1024;\" width=\"1024\" height=\"1024\" src=\"http://127.0.0.1:8000/storage/upload/1706714545cJMc6U3o9O.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:1024/1024;\" width=\"1024\" height=\"1024\" src=\"http://127.0.0.1:8000/storage/upload/1706714547T3LOywfGja.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:1024/1024;\" width=\"1024\" height=\"1024\" src=\"http://127.0.0.1:8000/storage/upload/17067145472MMtwU77MD.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:1024/1024;\" width=\"1024\" height=\"1024\" src=\"http://127.0.0.1:8000/storage/upload/1706714547cDZJM3Uce9.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:1024/1024;\" width=\"1024\" height=\"1024\" src=\"http://127.0.0.1:8000/storage/upload/17067145472XI1brUM8h.png\"></figure><figure class=\"image\"><img style=\"aspect-ratio:1024/1024;\" width=\"1024\" height=\"1024\" src=\"http://127.0.0.1:8000/storage/upload/17067145471lYqN7csTN.png\"></figure><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p style=\"text-align:center;\"><a href=\"https::youtube.com/@LazyDeveloperr\" download=\"file\"><span style=\"color:hsl(0, 75%, 60%);font-size:35px;\"><strong>SUBSCRIBE FOR MORE</strong></span></a></p></blockquote>\n', '1706714545.jpg', 'kaadu', 'hiii hello', 'new lazywood,', '2024-01-31 09:52:27', '2024-06-30 10:49:16');

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
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
