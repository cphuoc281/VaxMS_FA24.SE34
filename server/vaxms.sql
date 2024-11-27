-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Nov 27, 2024 at 06:29 AM
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
-- Database: `vaxms`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` bigint NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `login_type` enum('standard','google','phone') DEFAULT 'standard',
  `activation_key` varchar(100) DEFAULT NULL,
  `actived` bit(1) DEFAULT NULL,
  `authority_id` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `remember_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `email`, `password`, `google_id`, `phone_number`, `login_type`, `activation_key`, `actived`, `authority_id`, `created_date`, `remember_key`) VALUES
(1, 'admin@vaxms.com', 'admin', NULL, '0123456789', 'standard', NULL, b'1', 1, '2024-08-27 00:00:00', NULL),
(2, 'doctor@vaxms.com', 'hashed_password', NULL, '0987654321', 'standard', NULL, b'1', 2, '2024-08-27 16:20:27', NULL),
(3, 'nurse@vaxms.com', 'hashed_password', NULL, '0223344556', 'standard', NULL, b'1', 3, '2024-08-27 16:20:27', NULL),
(4, 'customer1@vaxms.com', '123', NULL, '0998877665', 'standard', NULL, b'1', 4, '2024-08-27 16:20:27', NULL),
(5, 'support@vaxms.com', '123', NULL, '0112233445', 'standard', NULL, b'1', 5, '2024-08-27 16:20:27', NULL),
(6, 'hieutran02102804@gmail.com', NULL, NULL, NULL, 'google', NULL, b'1', 4, '2024-09-08 00:00:00', NULL),
(7, 'ducanhlv142@gmail.com', NULL, NULL, NULL, 'google', NULL, b'1', 5, '2024-11-06 00:00:00', NULL),
(8, 'vanduc140202@gmail.com', '$2a$10$IaeE6sz.Tx/nvHnOS7CZ7eLcWw6XJTEE9vqP17CVfCaizdPf3UBvm', NULL, NULL, 'standard', NULL, b'1', 4, '2024-11-06 00:00:00', '265717'),
(9, 'danggiahuy17092023@gmail.com', NULL, NULL, NULL, 'google', NULL, b'1', 1, '2024-11-09 00:00:00', NULL),
(10, 'vulqde160216@fpt.edu.vn', '$2a$10$dncv7O5x71YZWpDehC4.1OchEWVY1.Un5eXvdxYfqGFU0KkZdoSBO', NULL, NULL, 'standard', NULL, b'1', 4, '2024-11-21 00:00:00', NULL),
(11, 'duclvde160146@fpt.edu.vn', NULL, NULL, NULL, 'google', NULL, b'1', 4, '2024-11-22 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `age_groups`
--

CREATE TABLE `age_groups` (
  `age_group_id` bigint NOT NULL,
  `age_range` varchar(50) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `age_groups`
--

INSERT INTO `age_groups` (`age_group_id`, `age_range`, `created_date`) VALUES
(1, '0-6 months', '2024-08-27 16:20:27'),
(2, '0-12 months', '2024-08-27 16:20:27'),
(3, '0-24 months', '2024-08-27 16:20:27'),
(4, '6-24 months', '2024-08-27 16:20:27'),
(5, '12-24 months', '2024-08-27 16:20:27'),
(6, '4-6 years', '2024-08-27 16:20:27'),
(7, '7-18 years', '2024-08-27 16:20:27'),
(8, 'Women planning to become pregnant', '2024-08-27 16:20:27'),
(9, 'Adults', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `authority_id` bigint NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`authority_id`, `name`) VALUES
(1, 'Admin'),
(2, 'Doctor'),
(3, 'Nurse'),
(4, 'Customer'),
(5, 'Support Staff');

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

CREATE TABLE `centers` (
  `center_id` bigint NOT NULL,
  `center_name` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `ward` varchar(100) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`center_id`, `center_name`, `city`, `district`, `ward`, `street`, `created_date`) VALUES
(1, 'Central Health Center', 'Ho Chi Minh', 'District 1', 'Ward 1', '123 Le Loi', '2024-08-27 16:20:27'),
(2, 'City Clinic', 'Ha Noi', 'Ba Dinh', 'Ward 2', '456 Kim Ma', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `chatting`
--

CREATE TABLE `chatting` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `receiver` bigint DEFAULT NULL,
  `sender` bigint DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `is_file` bit(1) DEFAULT NULL,
  `is_handled_by_staff` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chatting`
--

INSERT INTO `chatting` (`id`, `content`, `created_date`, `receiver`, `sender`, `file_name`, `is_file`, `is_handled_by_staff`) VALUES
(1, 'hehehe', '2024-09-09 16:42:13', NULL, 4, NULL, NULL, 0),
(2, 'oke babayt', '2024-09-09 16:43:34', NULL, 4, NULL, NULL, 0),
(3, 'hehehe oke đấy', '2024-09-09 16:43:44', NULL, 4, NULL, NULL, 0),
(4, 'hihi', '2024-11-09 01:52:07', NULL, 9, NULL, b'0', 0),
(5, 'mất phí', '2024-11-10 05:38:57', NULL, 9, NULL, b'0', 0),
(6, 'thạt', '2024-11-10 05:39:57', NULL, 9, NULL, b'0', 0),
(7, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731192206/gmnzzobuownifxo1iupq.jpg', '2024-11-10 05:43:23', NULL, 9, 'logo.jpg', b'1', 0),
(8, 'xin chào', '2024-11-10 05:43:31', NULL, 9, NULL, b'0', 0),
(9, 'hihi', '2024-11-10 05:46:46', NULL, 9, NULL, b'0', 0),
(10, 'sao vậy', '2024-11-10 05:58:45', NULL, 9, NULL, b'0', 0),
(11, 'hả', '2024-11-10 05:58:51', NULL, 9, NULL, b'0', 0),
(12, 'why', '2024-11-10 06:05:26', NULL, 9, NULL, b'0', 0),
(13, 'ko sao', '2024-11-10 06:05:47', 9, 7, NULL, b'0', 0),
(14, 'ok', '2024-11-10 13:40:54', 9, 7, NULL, b'0', 0),
(15, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731221406/mhmp79ikcleyrnndk6ls.png', '2024-11-10 13:50:02', 9, 7, 'Screenshot 2024-10-04 053027.png', b'1', 0),
(16, 'hi', '2024-11-10 13:50:04', 9, 7, NULL, b'0', 0),
(17, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731221424/mwf8xwbhelmeujdm1juc.jpg', '2024-11-10 13:50:20', NULL, 9, '449743767_3733127606956998_3523661321994865781_n.jpg', b'1', 0),
(18, 'hi', '2024-11-10 14:22:19', NULL, 9, NULL, b'0', 0),
(19, 'hahahah', '2024-11-10 14:22:38', NULL, 9, NULL, b'0', 0),
(20, 'ok', '2024-11-10 14:22:49', 9, 7, NULL, b'0', 0),
(21, 'ahha', '2024-11-10 16:21:27', NULL, 9, NULL, b'0', 0),
(22, 'OK Phét day', '2024-11-10 16:54:54', NULL, 9, NULL, b'0', 0),
(23, 'la toi day ', '2024-11-10 17:57:54', NULL, 9, NULL, b'0', 0),
(24, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731236282/ra90v5rtfmyh3qzhugnm.jpg', '2024-11-10 17:58:02', NULL, 9, 'logo.jpg', b'1', 0),
(25, 'ban la tot r', '2024-11-10 17:59:12', 9, 7, NULL, b'0', 0),
(26, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731236382/fcxdnp0mo7juaxllgsnb.png', '2024-11-10 17:59:42', 9, 7, 'Screenshot 2024-10-09 041219.png', b'1', 0),
(27, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731238903/dmyzdnyzskqypyc1vqxh.jpg', '2024-11-10 18:41:43', NULL, 9, 'gradient-ui-ux-background_23-2149051555.jpg', b'1', 0),
(28, 'ai nha', '2024-11-10 18:41:51', NULL, 9, NULL, b'0', 0),
(29, 'dc lun ý chứ', '2024-11-10 18:42:30', 9, 7, NULL, b'0', 0),
(30, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731238976/uixbwmoyx32ndrd0amhf.png', '2024-11-10 18:42:57', 9, 7, 'Screenshot 2024-11-10 183238.png', b'1', 0),
(31, 'chào bạn , tôi có vấn đề', '2024-11-10 20:39:35', NULL, 9, NULL, b'0', 0),
(32, 'chào bạn tôi cần tư vấn về mũi tiêm này', '2024-11-15 14:43:18', NULL, 8, NULL, b'0', 0),
(33, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731656643/yr2w20tjqmsrylezdwey.gif', '2024-11-15 14:43:59', NULL, 8, '218d83badf5b5eccbda8281e5447d01c.gif', b'1', 0),
(34, 'chào bạn đbạn cần làm ....', '2024-11-15 14:44:46', 8, 7, NULL, b'0', 0),
(35, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1731656708/voqzhs8otmiqiltmt18j.png', '2024-11-15 14:45:03', 8, 7, 'Screenshot 2024-11-14 230310.png', b'1', 0),
(36, 'hihi', '2024-11-21 18:37:56', NULL, 8, NULL, b'0', 0),
(37, 'ne eh', '2024-11-21 20:44:12', NULL, 8, NULL, b'0', 0),
(38, 'ulalâl ', '2024-11-21 20:44:20', NULL, 8, NULL, b'0', 0),
(39, 'manm bo', '2024-11-21 20:44:23', NULL, 8, NULL, b'0', 0),
(40, 'ok', '2024-11-21 21:05:54', 8, 7, NULL, b'0', 0),
(41, 'ok nha b pi', '2024-11-21 21:06:37', NULL, 8, NULL, b'0', 0),
(42, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732198000/p2niuxhdqueg7dvugwqo.gif', '2024-11-21 21:06:41', NULL, 8, '1ab4e6a7041358d80dd6809fd4b97395.gif', b'1', 0),
(43, 'van dai', '2024-11-21 21:14:04', 8, 7, NULL, b'0', 0),
(44, 'ko ni', '2024-11-21 21:14:30', NULL, 8, NULL, b'0', 0),
(45, 'toi nghi ok r', '2024-11-21 21:44:48', 8, 7, NULL, b'0', 0),
(46, 'the thi to', '2024-11-21 21:45:11', NULL, 8, NULL, b'0', 0),
(47, 'hekllo', '2024-11-21 21:51:24', NULL, 10, NULL, b'0', 0),
(48, 'hi', '2024-11-26 22:30:00', NULL, 8, NULL, b'0', 0),
(49, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732635020/g9s5sm828bjpejn8nkxp.webp', '2024-11-26 22:30:14', NULL, 8, 'bhoc1.webp', b'1', 0),
(50, 'ghghg', '2024-11-26 22:33:39', NULL, 8, NULL, b'0', 0),
(51, 'dsdsds', '2024-11-26 22:33:41', NULL, 8, NULL, b'0', 0),
(52, 'dsdsds', '2024-11-26 22:33:42', NULL, 8, NULL, b'0', 0),
(53, 'sdáda', '2024-11-26 22:34:46', NULL, 8, NULL, b'0', 0),
(54, 'dd', '2024-11-26 22:34:48', NULL, 8, NULL, b'0', 0),
(55, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732635304/u2jlu1tc6zogz2kwrnma.jpg', '2024-11-26 22:34:59', NULL, 8, '449743767_3733127606956998_3523661321994865781_n.jpg', b'1', 0),
(56, 'gug', '2024-11-27 01:43:10', NULL, 8, NULL, b'0', 0),
(57, 'fgsdg', '2024-11-27 01:43:11', NULL, 8, NULL, b'0', 0),
(58, 'ok ch', '2024-11-27 02:08:55', 8, 7, NULL, b'0', 0),
(59, 'hihih', '2024-11-27 02:12:17', NULL, 8, NULL, b'0', 0),
(60, 'ok', '2024-11-27 02:12:51', 8, 7, NULL, b'0', 0),
(61, 'yes sir', '2024-11-27 02:14:33', 8, 7, NULL, b'0', 0),
(62, 'ok nha', '2024-11-27 02:32:22', 8, 7, NULL, b'0', 0),
(63, 'sda', '2024-11-27 02:32:33', NULL, 8, NULL, b'0', 0),
(64, 'dsads', '2024-11-27 02:33:40', 10, 7, NULL, b'0', 0),
(65, 'hihi', '2024-11-27 02:34:24', 10, 7, NULL, b'0', 0),
(66, 'dsds', '2024-11-27 02:45:45', 9, 7, NULL, b'0', 0),
(67, 'toi noi ne', '2024-11-27 02:46:05', 8, 7, NULL, b'0', 0),
(68, 'noi di', '2024-11-27 02:46:11', NULL, 8, NULL, b'0', 0),
(69, 'sadsda', '2024-11-27 03:02:13', NULL, 8, NULL, b'0', 0),
(70, 'hihih ', '2024-11-27 03:02:15', NULL, 8, NULL, b'0', 0),
(71, 'nam moi vui ve', '2024-11-27 03:02:18', NULL, 8, NULL, b'0', 0),
(72, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732651369/pn9trovkqiioyyd4d1td.jpg', '2024-11-27 03:02:42', NULL, 8, '449743767_3733127606956998_3523661321994865781_n.jpg', b'1', 0),
(73, 'huhu', '2024-11-27 03:49:48', NULL, 8, NULL, b'0', 0),
(74, 'hu hu khec khwec', '2024-11-27 08:01:54', NULL, 8, NULL, b'0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `vaccine_id` bigint DEFAULT NULL,
  `news_id` bigint DEFAULT NULL,
  `parent_comment_id` bigint DEFAULT NULL,
  `content` text,
  `likes_count` int DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `account_id`, `vaccine_id`, `news_id`, `parent_comment_id`, `content`, `likes_count`, `created_date`) VALUES
(1, 4, 1, NULL, NULL, 'Great vaccine!', 10, '2024-08-27 16:20:27'),
(2, 4, NULL, 1, NULL, 'Very informative news!', 5, '2024-08-27 16:20:27'),
(3, 5, 1, NULL, NULL, 'This vaccine is highly effective.', 15, '2024-11-24 12:00:00'),
(4, 6, 2, NULL, NULL, 'Thank you for the update!', 8, '2024-11-24 13:00:00'),
(5, 7, NULL, 2, NULL, 'This news is very helpful!', 12, '2024-11-24 14:00:00'),
(6, 8, NULL, 1, NULL, 'Very informative content.', 10, '2024-11-24 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_profile`
--

CREATE TABLE `customer_profile` (
  `profile_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` enum('Male','Female','Other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ward` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `insurance_status` tinyint(1) DEFAULT NULL,
  `contact_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contact_relationship` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contact_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_profile`
--

INSERT INTO `customer_profile` (`profile_id`, `customer_id`, `full_name`, `gender`, `birthdate`, `phone`, `avatar`, `city`, `district`, `ward`, `street`, `insurance_status`, `contact_name`, `contact_relationship`, `contact_phone`, `created_date`) VALUES
(1, 4, 'Nguyen Van A update', 'Female', '1990-01-01', '0998877665', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1725792995/z49uuk74vw7cei6hjhwi.jpg', 'Tỉnh Cao Bằng', 'Huyện Trùng Khánh', 'xã nghi lộc', '123 Le Loi', 0, 'Tran Thi B', 'Vợ', '0123456789', '2024-08-27 16:20:27'),
(3, 11, NULL, NULL, NULL, '89898989', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 8, 'le van duc', 'Male', '2003-03-14', '0898696123', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732651050/lt3ssa3qtfcz6ndbqjm6.jpg', 'Tỉnh Bắc Kạn', 'Huyện Ba Bể', 'Ward 4', '456 Tran Hung Dao', 0, NULL, NULL, NULL, '2024-11-24 09:00:00'),
(6, 9, 'Tran Van C', 'Male', '1990-05-15', '0932112233', NULL, 'Ho Chi Minh', 'District 3', 'Ward 5', '789 Ly Thuong Kiet', 0, 'Tran Thi D', 'Wife', '0945566778', '2024-11-24 10:00:00'),
(7, 10, 'Pham Quang H', 'Male', '1992-07-18', '0912345678', NULL, 'Da Nang', 'Hai Chau', 'Ward 6', '123 Ngo Quyen', 1, 'Pham Thi H', 'Sister', '0954321765', '2024-11-24 11:00:00'),
(8, 11, 'Vu Thi K', 'Female', '1995-09-22', '0933445566', NULL, 'Can Tho', 'Ninh Kieu', 'Ward 7', '789 Le Lai', 0, 'Nguyen Van T', 'Father', '0987564321', '2024-11-24 12:00:00'),
(9, 4, 'Le Van L', 'Male', '1985-08-08', '0922334455', NULL, 'Hai Phong', 'Ngo Quyen', 'Ward 8', '345 Tran Phu', 1, 'Le Thi M', 'Mother', '0976543210', '2024-11-24 13:00:00'),
(10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_schedule`
--

CREATE TABLE `customer_schedule` (
  `id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `vaccine_schedule_id` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `pay_status` tinyint(1) DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `customer_schedule_pay` varchar(255) DEFAULT NULL,
  `vaccine_schedule_time_id` bigint DEFAULT NULL,
  `counter_change` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_schedule`
--

INSERT INTO `customer_schedule` (`id`, `account_id`, `vaccine_schedule_id`, `created_date`, `pay_status`, `status`, `address`, `dob`, `full_name`, `phone`, `customer_schedule_pay`, `vaccine_schedule_time_id`, `counter_change`) VALUES
(1, 4, 1, '2024-08-27 16:20:27', 1, 'confirmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, 2, '2024-08-27 16:20:27', 0, 'cancelled', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, 3, '2024-08-28 23:12:11', 0, 'cancelled', '123 Le Loi, Ward 1, District 1, Ho Chi Minh', '2000-06-01', 'Trần thị bình', '0123456789', NULL, NULL, NULL),
(4, 4, 3, '2024-09-08 20:35:08', 1, 'pending', '123 Le Loi, xã nghi lộc, Huyện Trùng Khánh, Tỉnh Cao Bằng', '1990-01-01', 'Nguyen Van A update', '0123456789', NULL, NULL, NULL),
(5, 4, 4, '2024-11-24 09:30:00', 1, 'confirmed', '123 Le Loi, District 1, Ho Chi Minh', '1990-01-01', 'Nguyen Van A', '0901234567', 'Momo', 1, 0),
(6, 5, 5, '2024-11-24 10:30:00', 1, 'confirmed', '456 Kim Ma, Ba Dinh, Ha Noi', '1985-05-15', 'Tran Thi B', '0912345678', 'VNPay', 3, 1),
(7, 6, 6, '2024-11-24 11:30:00', 0, 'pending', '789 Le Lai, District 3, Ho Chi Minh', '1992-07-18', 'Pham Quang H', '0987654321', 'Thanh toán trực tiếp', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `experience_years` int DEFAULT NULL,
  `bio` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `account_id`, `specialization`, `experience_years`, `bio`, `created_date`, `avatar`, `full_name`) VALUES
(1, 2, 'Immunology', 10, 'Specialized in immunology and vaccines.', '2024-08-27 16:20:27', NULL, 'Hoàng mạnh hải'),
(2, 6, 'Pediatrics', 12, 'Specialized in child care and immunization. dfdf', '2024-11-24 09:00:00', NULL, 'Pham Quang Binh'),
(4, 8, 'Allergy & Immunology', 10, 'Expert in allergy testing and treatments.', '2024-11-24 11:00:00', NULL, 'Nguyen Van Dung'),
(5, 9, 'General Practice', 8, 'Focused on overall health and preventive care.', '2024-11-24 12:00:00', NULL, 'Le Van Hieu');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint NOT NULL,
  `customer_schedule_id` bigint NOT NULL,
  `feedback_type` enum('general','doctor','nurse') DEFAULT 'general',
  `doctor_id` bigint DEFAULT NULL,
  `nurse_id` bigint DEFAULT NULL,
  `content` text,
  `rating` tinyint(1) DEFAULT NULL,
  `response` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `customer_schedule_id`, `feedback_type`, `doctor_id`, `nurse_id`, `content`, `rating`, `response`, `created_date`) VALUES
(1, 1, 'doctor', 1, NULL, 'Doctor was very knowledgeable and helpful.', 1, NULL, '2024-08-27 16:20:27'),
(2, 1, 'nurse', NULL, 1, 'Nurse was very caring and professional.', 2, NULL, '2024-08-27 16:20:27'),
(3, 1, 'general', NULL, NULL, 'The process was fast and efficient.', 1, 'Thank you for your feedback!', '2024-11-24 09:00:00'),
(4, 2, 'doctor', 2, NULL, 'Doctor was extremely professional and caring.', 2, NULL, '2024-11-24 10:00:00'),
(5, 3, 'nurse', NULL, 1, 'The nurse explained everything clearly.', 1, NULL, '2024-11-24 11:00:00'),
(6, 4, 'general', NULL, NULL, 'The center was very clean and organized.', 2, NULL, '2024-11-24 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `name`, `country`, `created_date`) VALUES
(1, 'Pfizer', 'USA', '2024-08-27 16:20:27'),
(2, 'Moderna', 'USA', '2024-08-27 16:20:27'),
(3, 'AstraZeneca', 'UK', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author_id` bigint NOT NULL,
  `topic_id` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `title`, `content`, `image`, `author_id`, `topic_id`, `created_date`) VALUES
(1, 'COVID-19 Vaccination Updates', 'Latest updates on COVID-19 vaccination', 'https://vnvc.vn/wp-content/uploads/2024/09/tiem-1-mui-phe-cau-co-duoc-khong.jpg', 1, 3, '2024-08-27 16:20:27'),
(2, 'Health Benefits of Regular Vaccination', 'Vaccination is crucial for maintaining public health...', 'https://vnvc.vn/wp-content/uploads/2024/08/vac-xin-bach-hau-ho-ga-uon-van-nguoi-lon.jpg', 1, 2, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `news_sources`
--

CREATE TABLE `news_sources` (
  `source_id` bigint NOT NULL,
  `news_id` bigint NOT NULL,
  `source_name` varchar(255) NOT NULL,
  `source_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `news_sources`
--

INSERT INTO `news_sources` (`source_id`, `news_id`, `source_name`, `source_url`) VALUES
(1, 1, 'WHO', 'https://www.who.int'),
(2, 2, 'CDC', 'https://www.cdc.gov');

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE `nurses` (
  `nurse_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `experience_years` int DEFAULT NULL,
  `bio` text,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nurses`
--

INSERT INTO `nurses` (`nurse_id`, `account_id`, `qualification`, `experience_years`, `bio`, `created_date`, `avatar`, `full_name`) VALUES
(1, 3, 'Nursing', 5, 'Experienced nurse in vaccine administration.', '2024-08-27 16:20:27', NULL, 'Lê Thị Hoài'),
(2, 7, 'General Nursing', 7, 'Experienced nurse in vaccine administration and patient care.', '2024-11-24 09:00:00', 'http://example.com/nurse_avatar.jpg', 'Nguyen Thi Hoa'),
(3, 8, 'Pediatric Nursing', 5, 'Specialized in child care and vaccination.', '2024-11-24 10:00:00', 'http://example.com/nurse_avatar2.jpg', 'Le Van Minh'),
(4, 9, 'Critical Care Nursing', 8, 'Expert in emergency and critical care.', '2024-11-24 11:00:00', NULL, 'Tran Thi Mai');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` bigint NOT NULL,
  `customer_schedule_id` bigint NOT NULL,
  `amount` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `request_id` varchar(255) DEFAULT NULL,
  `pay_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `customer_schedule_id`, `amount`, `created_date`, `created_by`, `order_id`, `request_id`, `pay_type`) VALUES
(1, 1, 20, '2024-08-27 16:20:27', 4, NULL, NULL, NULL),
(2, 2, 22, '2024-08-27 16:20:27', 4, NULL, NULL, NULL),
(3, 3, 300000, '2024-09-08 20:35:08', 4, '1725802464269', '1725802464269', NULL),
(4, 1, 300000, '2024-11-24 09:40:00', 4, '123456789', '987654321', 'Momo'),
(5, 3, 500000, '2024-11-24 10:40:00', 5, '223344556', '665544332', 'VNPay'),
(6, 2, 700000, '2024-11-24 11:40:00', 6, '1122334455', '9988776655', 'Thanh toán trực tiếp');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_detail_id` bigint NOT NULL,
  `payment_id` bigint NOT NULL,
  `method_id` bigint NOT NULL,
  `amount` int NOT NULL,
  `transaction_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_detail_id`, `payment_id`, `method_id`, `amount`, `transaction_date`) VALUES
(1, 1, 1, 20, '2024-08-27 16:20:27'),
(2, 2, 2, 22, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `method_id` bigint NOT NULL,
  `method_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`method_id`, `method_name`) VALUES
(1, 'Momo'),
(2, 'VNPay'),
(3, 'Thanh toán trực tiếp');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topic_id` bigint NOT NULL,
  `topic_name` varchar(100) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_name`, `created_date`) VALUES
(1, 'Health', '2024-08-27 16:20:27'),
(2, 'Vaccination', '2024-08-27 16:20:27'),
(3, 'COVID-19', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_id` bigint NOT NULL,
  `manufacturer_id` bigint NOT NULL,
  `age_group_id` bigint NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `inventory` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`id`, `name`, `type_id`, `manufacturer_id`, `age_group_id`, `description`, `image`, `price`, `created_date`, `inventory`, `status`) VALUES
(1, 'Pfizer-BioNTech COVID-19 Vaccine', 1, 1, 1, 'Effective against COVID-19', 'https://vnvc.vn/wp-content/uploads/2024/08/Pneumovax-23.jpg', 20, '2024-08-27 16:20:27', 49000, NULL),
(2, 'Moderna COVID-19 Vaccine', 1, 2, 2, 'mRNA vaccine for COVID-19', 'https://vnvc.vn/wp-content/uploads/2019/11/vaccine-Prevenar-13.jpg', 300000, '2024-08-27 16:20:27', 49000, NULL),
(3, 'AstraZeneca COVID-19 Vaccine', 1, 3, 3, 'Viral vector vaccine for COVID-19', 'https://vnvc.vn/wp-content/uploads/2017/04/Synflorix-1.jpg', 18, '2024-08-27 16:20:27', 50000, NULL),
(4, 'MMR Vaccine', 4, 2, 4, 'Protects against measles, mumps, and rubella', 'https://vnvc.vn/wp-content/uploads/2024/08/MMR.jpg', 50, '2024-08-27 16:20:27', 100, 'DELETE'),
(5, 'Polio Vaccine', 5, 1, 2, 'Oral polio vaccine for infants', 'https://vnvc.vn/wp-content/uploads/2024/08/Polio.jpg', 30, '2024-08-27 16:20:27', 200, 'Available'),
(6, 'Chickenpox Vaccine', 6, 3, 6, 'Prevents chickenpox infections', 'https://vnvc.vn/wp-content/uploads/2024/08/Chickenpox.jpg', 100, '2024-08-27 16:20:27', 150, 'Available'),
(7, 'Pneumococcal Vaccine', 7, 1, 1, 'Prevents pneumococcal infections', 'https://vnvc.vn/wp-content/uploads/2024/08/Pneumococcal.jpg', 250, '2024-08-27 16:20:27', 120, 'Available'),
(8, 'HPV Vaccine', 8, 2, 8, 'Protects against human papillomavirus', 'https://vnvc.vn/wp-content/uploads/2024/08/HPV.jpg', 600, '2024-08-27 16:20:27', 80, 'Available'),
(9, 'Tdap Vaccine', 9, 1, 9, 'Boosts immunity against tetanus, diphtheria, and pertussis', 'https://vnvc.vn/wp-content/uploads/2024/08/Tdap.jpg', 75, '2024-08-27 16:20:27', 130, 'Available'),
(10, 'Rotavirus Vaccine', 10, 3, 1, 'Protects against rotavirus', 'https://vnvc.vn/wp-content/uploads/2024/08/Rotavirus.jpg', 90, '2024-08-27 16:20:27', 200, 'Available'),
(11, 'Hepatitis A Vaccine', 11, 1, 3, 'Prevents hepatitis A infections', 'https://vnvc.vn/wp-content/uploads/2024/08/HepA.jpg', 180, '2024-08-27 16:20:27', 150, 'Available'),
(12, 'Japanese Encephalitis Vaccine', 12, 2, 5, 'Effective against Japanese encephalitis', 'https://vnvc.vn/wp-content/uploads/2024/08/JapaneseEncephalitis.jpg', 300, '2024-08-27 16:20:27', 100, 'Available'),
(13, 'Yellow Fever Vaccine', 13, 3, 7, 'Recommended for travelers to certain countries', 'https://vnvc.vn/wp-content/uploads/2024/08/YellowFever.jpg', 400, '2024-08-27 16:20:27', 50, 'Available'),
(14, 'Meningococcal Vaccine', 14, 2, 6, 'Protects against meningococcal diseases', 'https://vnvc.vn/wp-content/uploads/2024/08/Meningococcal.jpg', 350, '2024-08-27 16:20:27', 70, 'Available'),
(15, 'Rabies Vaccine', 15, 3, 9, 'Prevents rabies after exposure', 'https://vnvc.vn/wp-content/uploads/2024/08/Rabies.jpg', 500, '2024-08-27 16:20:27', 60, 'Available'),
(16, 'Typhoid Vaccine', 16, 2, 8, 'Prevents typhoid fever', 'https://vnvc.vn/wp-content/uploads/2024/08/Typhoid.jpg', 200, '2024-08-27 16:20:27', 90, 'Available'),
(17, 'Dengue Vaccine', 17, 1, 7, 'Protects against dengue fever', 'https://vnvc.vn/wp-content/uploads/2024/08/Dengue.jpg', 650, '2024-08-27 16:20:27', 40, 'Available'),
(18, 'Shingles Vaccine', 18, 3, 9, 'Prevents shingles in older adults', 'https://vnvc.vn/wp-content/uploads/2024/08/Shingles.jpg', 700, '2024-08-27 16:20:27', 30, 'Available'),
(19, 'BCG Vaccine', 19, 1, 5, 'Protects against tuberculosis', 'https://vnvc.vn/wp-content/uploads/2024/08/BCG.jpg', 150, '2024-08-27 16:20:27', 100, 'Available'),
(20, 'Cholera Vaccine', 20, 2, 6, 'Prevents cholera infections', 'https://vnvc.vn/wp-content/uploads/2024/08/Cholera.jpg', 100, '2024-08-27 16:20:27', 80, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_distribution`
--

CREATE TABLE `vaccine_distribution` (
  `distribution_id` bigint NOT NULL,
  `inventory_id` bigint NOT NULL,
  `distribution_type` enum('imports','export') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int NOT NULL,
  `distribution_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine_distribution`
--

INSERT INTO `vaccine_distribution` (`distribution_id`, `inventory_id`, `distribution_type`, `quantity`, `distribution_date`) VALUES
(1, 1, 'export', 10050000, '2024-08-27 16:20:27'),
(2, 2, 'export', 50000, '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_inventory`
--

CREATE TABLE `vaccine_inventory` (
  `inventory_id` bigint NOT NULL,
  `vaccine_id` bigint NOT NULL,
  `center_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `import_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `export_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine_inventory`
--

INSERT INTO `vaccine_inventory` (`inventory_id`, `vaccine_id`, `center_id`, `quantity`, `import_date`, `export_date`, `created_date`, `status`) VALUES
(1, 1, 1, 100, '2024-08-27 16:20:27', NULL, '2024-08-27 16:20:27', NULL),
(2, 2, 2, 150, '2024-08-27 16:20:27', NULL, '2024-08-27 16:20:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_schedule`
--

CREATE TABLE `vaccine_schedule` (
  `id` bigint NOT NULL,
  `vaccine_id` bigint NOT NULL,
  `center_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `limit_people` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `id_pre_schedule` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine_schedule`
--

INSERT INTO `vaccine_schedule` (`id`, `vaccine_id`, `center_id`, `created_by`, `start_date`, `end_date`, `limit_people`, `created_date`, `description`, `id_pre_schedule`) VALUES
(1, 1, 1, 1, '2024-09-01 08:00:00', '2024-09-01 12:00:00', 50000, '2024-08-27 16:20:27', NULL, NULL),
(2, 2, 2, 1, '2024-09-02 09:00:00', '2024-09-02 13:00:00', 60, '2024-08-27 16:20:27', NULL, NULL),
(3, 2, 1, 1, '2024-08-30 07:20:00', '2024-09-20 17:45:00', 200, '2024-08-28 17:49:40', NULL, NULL),
(4, 1, 1, 1, '2024-12-01 08:00:00', '2024-12-01 12:00:00', 50000, '2024-11-24 09:00:00', 'Pfizer vaccine schedule for children.', NULL),
(5, 2, 2, 1, '2024-12-05 09:00:00', '2024-12-05 13:00:00', 50000, '2024-11-24 10:00:00', 'Moderna vaccine schedule for adults.', NULL),
(6, 3, 1, 1, '2024-12-10 14:00:00', '2024-12-10 18:00:00', 50000, '2024-11-24 11:00:00', 'AstraZeneca schedule for the elderly.', NULL),
(7, 3, 1, 1, '2024-12-10 14:00:00', '2024-12-10 18:00:00', 50000, '2024-11-24 11:00:00', 'AstraZeneca schedule for the elderly.', NULL),
(8, 1, 1, 1, '2024-11-25 00:00:00', '2024-12-01 00:00:00', 1000, '2024-11-25 12:59:09', '', NULL),
(9, 2, 1, 1, '2024-11-27 00:00:00', '2024-11-30 00:00:00', 1000, '2024-11-26 22:17:36', 'good', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_schedule_doctor`
--

CREATE TABLE `vaccine_schedule_doctor` (
  `id` bigint NOT NULL,
  `inject_date` date DEFAULT NULL,
  `doctor_doctor_id` bigint DEFAULT NULL,
  `vaccine_schedule_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine_schedule_doctor`
--

INSERT INTO `vaccine_schedule_doctor` (`id`, `inject_date`, `doctor_doctor_id`, `vaccine_schedule_id`) VALUES
(1, '2024-12-01', 1, 7),
(2, '2024-12-01', 1, 7),
(3, '2024-12-02', 1, 7),
(4, '2024-12-02', 2, 7),
(5, '2024-12-03', 2, 7),
(6, '2024-12-03', 2, 7),
(7, '2024-12-04', 1, 7),
(8, '2024-12-04', 2, 7),
(9, '2024-11-25', 2, 8),
(11, '2024-11-27', 2, 9),
(12, '2024-11-27', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_schedule_nurse`
--

CREATE TABLE `vaccine_schedule_nurse` (
  `id` bigint NOT NULL,
  `inject_date` date DEFAULT NULL,
  `nurse_nurse_id` bigint DEFAULT NULL,
  `vaccine_schedule_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine_schedule_nurse`
--

INSERT INTO `vaccine_schedule_nurse` (`id`, `inject_date`, `nurse_nurse_id`, `vaccine_schedule_id`) VALUES
(1, '2024-12-01', 1, 7),
(2, '2024-12-01', 1, 7),
(3, '2024-12-02', 1, 7),
(4, '2024-12-02', 2, 7),
(5, '2024-12-03', 2, 7),
(6, '2024-12-03', 2, 7),
(7, '2024-12-04', 1, 7),
(8, '2024-12-04', 2, 7),
(9, '2024-11-25', 2, 8),
(11, '2024-11-27', 2, 9),
(12, '2024-11-27', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_schedule_time`
--

CREATE TABLE `vaccine_schedule_time` (
  `id` bigint NOT NULL,
  `end` time DEFAULT NULL,
  `inject_date` date DEFAULT NULL,
  `limit_people` int DEFAULT NULL,
  `start` time DEFAULT NULL,
  `vaccine_schedule_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine_schedule_time`
--

INSERT INTO `vaccine_schedule_time` (`id`, `end`, `inject_date`, `limit_people`, `start`, `vaccine_schedule_id`) VALUES
(1, '08:10:00', '2024-12-01', 6, '08:00:00', 7),
(2, '08:20:00', '2024-12-01', 6, '08:10:00', 7),
(3, '08:30:00', '2024-12-01', 6, '08:20:00', 7),
(4, '08:40:00', '2024-12-01', 6, '08:30:00', 7),
(5, '08:50:00', '2024-12-01', 6, '08:40:00', 7),
(6, '09:00:00', '2024-12-01', 6, '08:50:00', 7),
(7, '09:10:00', '2024-12-01', 6, '09:00:00', 7),
(8, '09:20:00', '2024-12-01', 6, '09:10:00', 7),
(9, '09:30:00', '2024-12-01', 6, '09:20:00', 7),
(10, '09:40:00', '2024-12-01', 6, '09:30:00', 7),
(11, '09:50:00', '2024-12-01', 6, '09:40:00', 7),
(12, '10:00:00', '2024-12-01', 6, '09:50:00', 7),
(13, '13:10:00', '2024-12-01', 6, '13:00:00', 7),
(14, '13:20:00', '2024-12-01', 6, '13:10:00', 7),
(15, '13:30:00', '2024-12-01', 6, '13:20:00', 7),
(16, '13:40:00', '2024-12-01', 6, '13:30:00', 7),
(17, '13:50:00', '2024-12-01', 6, '13:40:00', 7),
(18, '14:00:00', '2024-12-01', 6, '13:50:00', 7),
(19, '14:10:00', '2024-12-01', 6, '14:00:00', 7),
(20, '14:20:00', '2024-12-01', 6, '14:10:00', 7),
(21, '14:30:00', '2024-12-01', 6, '14:20:00', 7),
(22, '14:40:00', '2024-12-01', 6, '14:30:00', 7),
(23, '14:50:00', '2024-12-01', 6, '14:40:00', 7),
(24, '15:00:00', '2024-12-01', 6, '14:50:00', 7),
(25, '09:00:00', '2024-11-25', 20, '08:00:00', 8),
(26, '10:00:00', '2024-11-25', 20, '09:00:00', 8),
(27, '11:00:00', '2024-11-25', 20, '10:00:00', 8),
(28, '12:00:00', '2024-11-25', 20, '11:00:00', 8),
(29, '13:00:00', '2024-11-25', 20, '12:00:00', 8),
(30, '14:00:00', '2024-11-25', 20, '13:00:00', 8),
(31, '15:00:00', '2024-11-25', 20, '14:00:00', 8),
(32, '16:00:00', '2024-11-25', 20, '15:00:00', 8),
(33, '17:00:00', '2024-11-25', 20, '16:00:00', 8),
(34, '18:00:00', '2024-11-25', 20, '17:00:00', 8);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_types`
--

CREATE TABLE `vaccine_types` (
  `type_id` bigint NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vaccine_types`
--

INSERT INTO `vaccine_types` (`type_id`, `type_name`, `created_date`) VALUES
(1, 'COVID-19', '2024-08-27 16:20:27'),
(2, 'Influenza', '2024-08-27 16:20:27'),
(3, 'Hepatitis B', '2024-08-27 16:20:27'),
(4, 'Measles, Mumps, Rubella (MMR)', '2024-08-27 16:20:27'),
(5, 'Polio', '2024-08-27 16:20:27'),
(6, 'Chickenpox', '2024-08-27 16:20:27'),
(7, 'Pneumococcal', '2024-08-27 16:20:27'),
(8, 'Human Papillomavirus (HPV)', '2024-08-27 16:20:27'),
(9, 'Tetanus, Diphtheria, Pertussis (Tdap)', '2024-08-27 16:20:27'),
(10, 'Rotavirus', '2024-08-27 16:20:27'),
(11, 'Hepatitis A', '2024-08-27 16:20:27'),
(12, 'Japanese Encephalitis', '2024-08-27 16:20:27'),
(13, 'Yellow Fever', '2024-08-27 16:20:27'),
(14, 'Meningococcal', '2024-08-27 16:20:27'),
(15, 'Rabies', '2024-08-27 16:20:27'),
(16, 'Typhoid', '2024-08-27 16:20:27'),
(17, 'Dengue Fever', '2024-08-27 16:20:27'),
(18, 'Shingles (Herpes Zoster)', '2024-08-27 16:20:27'),
(19, 'Tuberculosis (BCG)', '2024-08-27 16:20:27'),
(20, 'Cholera', '2024-08-27 16:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `work_schedules`
--

CREATE TABLE `work_schedules` (
  `id` bigint NOT NULL,
  `doctor_id` bigint NOT NULL,
  `working_date` date NOT NULL,
  `working_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `authority_id` (`authority_id`);

--
-- Indexes for table `age_groups`
--
ALTER TABLE `age_groups`
  ADD PRIMARY KEY (`age_group_id`);

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`authority_id`);

--
-- Indexes for table `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`center_id`);

--
-- Indexes for table `chatting`
--
ALTER TABLE `chatting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5a0buj5ilrqnmip5f9haa2l8u` (`receiver`),
  ADD KEY `FKk9xq8rksng78v0hphidblb4tr` (`sender`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Indexes for table `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customer_schedule`
--
ALTER TABLE `customer_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vaccine_schedule_id` (`vaccine_schedule_id`),
  ADD KEY `FK9s8hdufulsy5da6um3nvdmn9x` (`vaccine_schedule_time_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_schedule_id` (`customer_schedule_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `nurse_id` (`nurse_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `news_sources`
--
ALTER TABLE `news_sources`
  ADD PRIMARY KEY (`source_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`nurse_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_schedule_id` (`customer_schedule_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_detail_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `method_id` (`method_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`method_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`),
  ADD KEY `age_group_id` (`age_group_id`);

--
-- Indexes for table `vaccine_distribution`
--
ALTER TABLE `vaccine_distribution`
  ADD PRIMARY KEY (`distribution_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `vaccine_inventory`
--
ALTER TABLE `vaccine_inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `center_id` (`center_id`);

--
-- Indexes for table `vaccine_schedule`
--
ALTER TABLE `vaccine_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `center_id` (`center_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `vaccine_schedule_doctor`
--
ALTER TABLE `vaccine_schedule_doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK19bwyih15mtgql6i7l822k7mu` (`doctor_doctor_id`),
  ADD KEY `FKgh34kyf04n6s72refd0cwo8af` (`vaccine_schedule_id`);

--
-- Indexes for table `vaccine_schedule_nurse`
--
ALTER TABLE `vaccine_schedule_nurse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKne53wgix2mugikcgasfvh4bkp` (`nurse_nurse_id`),
  ADD KEY `FKmljekex2s20d6d2pmf15q8u45` (`vaccine_schedule_id`);

--
-- Indexes for table `vaccine_schedule_time`
--
ALTER TABLE `vaccine_schedule_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8mqx80v1rjwsivvgn757983nc` (`vaccine_schedule_id`);

--
-- Indexes for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `work_schedules`
--
ALTER TABLE `work_schedules`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `age_groups`
--
ALTER TABLE `age_groups`
  MODIFY `age_group_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `authority`
--
ALTER TABLE `authority`
  MODIFY `authority_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `centers`
--
ALTER TABLE `centers`
  MODIFY `center_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chatting`
--
ALTER TABLE `chatting`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_profile`
--
ALTER TABLE `customer_profile`
  MODIFY `profile_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_schedule`
--
ALTER TABLE `customer_schedule`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `news_sources`
--
ALTER TABLE `news_sources`
  MODIFY `source_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nurses`
--
ALTER TABLE `nurses`
  MODIFY `nurse_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `payment_detail_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `method_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vaccine`
--
ALTER TABLE `vaccine`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `vaccine_distribution`
--
ALTER TABLE `vaccine_distribution`
  MODIFY `distribution_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vaccine_inventory`
--
ALTER TABLE `vaccine_inventory`
  MODIFY `inventory_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vaccine_schedule`
--
ALTER TABLE `vaccine_schedule`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vaccine_schedule_doctor`
--
ALTER TABLE `vaccine_schedule_doctor`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vaccine_schedule_nurse`
--
ALTER TABLE `vaccine_schedule_nurse`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vaccine_schedule_time`
--
ALTER TABLE `vaccine_schedule_time`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `vaccine_types`
--
ALTER TABLE `vaccine_types`
  MODIFY `type_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `work_schedules`
--
ALTER TABLE `work_schedules`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`authority_id`);

--
-- Constraints for table `chatting`
--
ALTER TABLE `chatting`
  ADD CONSTRAINT `FK5a0buj5ilrqnmip5f9haa2l8u` FOREIGN KEY (`receiver`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `FKk9xq8rksng78v0hphidblb4tr` FOREIGN KEY (`sender`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`),
  ADD CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_profile`
--
ALTER TABLE `customer_profile`
  ADD CONSTRAINT `customer_profile_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `customer_schedule`
--
ALTER TABLE `customer_schedule`
  ADD CONSTRAINT `customer_schedule_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `customer_schedule_ibfk_2` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`),
  ADD CONSTRAINT `FK9s8hdufulsy5da6um3nvdmn9x` FOREIGN KEY (`vaccine_schedule_time_id`) REFERENCES `vaccine_schedule_time` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_schedule_id`) REFERENCES `customer_schedule` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`nurse_id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`);

--
-- Constraints for table `news_sources`
--
ALTER TABLE `news_sources`
  ADD CONSTRAINT `news_sources_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`);

--
-- Constraints for table `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_schedule_id`) REFERENCES `customer_schedule` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `payment_details_ibfk_2` FOREIGN KEY (`method_id`) REFERENCES `payment_methods` (`method_id`);

--
-- Constraints for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD CONSTRAINT `vaccine_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `vaccine_types` (`type_id`),
  ADD CONSTRAINT `vaccine_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`manufacturer_id`),
  ADD CONSTRAINT `vaccine_ibfk_3` FOREIGN KEY (`age_group_id`) REFERENCES `age_groups` (`age_group_id`);

--
-- Constraints for table `vaccine_distribution`
--
ALTER TABLE `vaccine_distribution`
  ADD CONSTRAINT `vaccine_distribution_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `vaccine_inventory` (`inventory_id`);

--
-- Constraints for table `vaccine_inventory`
--
ALTER TABLE `vaccine_inventory`
  ADD CONSTRAINT `vaccine_inventory_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`),
  ADD CONSTRAINT `vaccine_inventory_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `centers` (`center_id`);

--
-- Constraints for table `vaccine_schedule`
--
ALTER TABLE `vaccine_schedule`
  ADD CONSTRAINT `vaccine_schedule_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`),
  ADD CONSTRAINT `vaccine_schedule_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `centers` (`center_id`),
  ADD CONSTRAINT `vaccine_schedule_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `vaccine_schedule_doctor`
--
ALTER TABLE `vaccine_schedule_doctor`
  ADD CONSTRAINT `FK19bwyih15mtgql6i7l822k7mu` FOREIGN KEY (`doctor_doctor_id`) REFERENCES `doctors` (`doctor_id`),
  ADD CONSTRAINT `FKgh34kyf04n6s72refd0cwo8af` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`);

--
-- Constraints for table `vaccine_schedule_nurse`
--
ALTER TABLE `vaccine_schedule_nurse`
  ADD CONSTRAINT `FKmljekex2s20d6d2pmf15q8u45` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`),
  ADD CONSTRAINT `FKne53wgix2mugikcgasfvh4bkp` FOREIGN KEY (`nurse_nurse_id`) REFERENCES `nurses` (`nurse_id`);

--
-- Constraints for table `vaccine_schedule_time`
--
ALTER TABLE `vaccine_schedule_time`
  ADD CONSTRAINT `FK8mqx80v1rjwsivvgn757983nc` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
