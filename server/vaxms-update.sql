/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : vaxms

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 21/11/2024 19:18:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `account_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `google_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_type` enum('standard','google','phone') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'standard',
  `activation_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actived` bit(1) NULL DEFAULT NULL,
  `authority_id` bigint NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  `remember_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `phone_number`(`phone_number` ASC) USING BTREE,
  INDEX `authority_id`(`authority_id` ASC) USING BTREE,
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`authority_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'admin@vaxms.com', 'admin', NULL, '0123456789', 'standard', NULL, b'1', 1, '2024-08-27 16:20:27', NULL);
INSERT INTO `account` VALUES (2, 'doctor@vaxms.com', 'hashed_password', NULL, '0987654321', 'standard', NULL, b'1', 2, '2024-08-27 16:20:27', NULL);
INSERT INTO `account` VALUES (3, 'nurse@vaxms.com', 'hashed_password', NULL, '0223344556', 'standard', NULL, b'1', 3, '2024-08-27 16:20:27', NULL);
INSERT INTO `account` VALUES (4, 'customer1111@vaxms.com', '123', NULL, '0998877665', 'standard', NULL, b'1', 4, '2024-08-27 16:20:27', NULL);
INSERT INTO `account` VALUES (5, 'support@vaxms.com', '123', NULL, '0112233445', 'standard', NULL, b'1', 5, '2024-08-27 16:20:27', NULL);
INSERT INTO `account` VALUES (6, 'hieutran02102804@gmail.com', NULL, NULL, NULL, 'google', NULL, b'1', 4, '2024-09-08 00:00:00', NULL);
INSERT INTO `account` VALUES (8, 'tran@gmail.com', '123', NULL, '0872112113', 'standard', NULL, NULL, 4, '2024-11-21 11:21:46', NULL);
INSERT INTO `account` VALUES (45, 'doctor1@vaxms.com', 'password123', NULL, '0901000001', 'standard', NULL, b'1', 2, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (46, 'doctor2@vaxms.com', 'password123', NULL, '0901000002', 'standard', NULL, b'1', 2, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (47, 'doctor49@vaxms.com', 'password123', NULL, '0901000049', 'standard', NULL, b'1', 2, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (48, 'doctor50@vaxms.com', 'password123', NULL, '0901000050', 'standard', NULL, b'1', 2, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (49, 'nurse1@vaxms.com', 'password123', NULL, '0902000001', 'standard', NULL, b'1', 3, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (50, 'nurse2@vaxms.com', 'password123', NULL, '0902000002', 'standard', NULL, b'1', 3, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (51, 'nurse49@vaxms.com', 'password123', NULL, '0902000049', 'standard', NULL, b'1', 3, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (52, 'nurse50@vaxms.com', 'password123', NULL, '0902000050', 'standard', NULL, b'1', 3, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (53, 'customer1@vaxms.com', 'password123', NULL, '0903000001', 'standard', NULL, b'1', 4, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (54, 'customer2@vaxms.com', 'password123', NULL, '0903000002', 'standard', NULL, b'1', 4, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (55, 'customer49@vaxms.com', 'password123', NULL, '0903000049', 'standard', NULL, b'1', 4, '2024-11-21 16:33:23', NULL);
INSERT INTO `account` VALUES (56, 'customer50@vaxms.com', 'password123', NULL, '0903000050', 'standard', NULL, b'1', 4, '2024-11-21 16:33:23', NULL);

-- ----------------------------
-- Table structure for age_groups
-- ----------------------------
DROP TABLE IF EXISTS `age_groups`;
CREATE TABLE `age_groups`  (
  `age_group_id` bigint NOT NULL AUTO_INCREMENT,
  `age_range` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`age_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of age_groups
-- ----------------------------
INSERT INTO `age_groups` VALUES (1, '0-6 months', '2024-08-27 16:20:27');
INSERT INTO `age_groups` VALUES (2, '0-12 months', '2024-08-27 16:20:27');
INSERT INTO `age_groups` VALUES (3, '0-24 months', '2024-08-27 16:20:27');
INSERT INTO `age_groups` VALUES (4, '6-24 months', '2024-08-27 16:20:27');
INSERT INTO `age_groups` VALUES (5, '12-24 months', '2024-08-27 16:20:27');
INSERT INTO `age_groups` VALUES (6, '4-6 years', '2024-08-27 16:20:27');
INSERT INTO `age_groups` VALUES (7, '7-18 years', '2024-08-27 16:20:27');
INSERT INTO `age_groups` VALUES (8, 'Women planning to become pregnant', '2024-08-27 16:20:27');
INSERT INTO `age_groups` VALUES (9, 'Adults', '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `authority_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`authority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1, 'Admin');
INSERT INTO `authority` VALUES (2, 'Doctor');
INSERT INTO `authority` VALUES (3, 'Nurse');
INSERT INTO `authority` VALUES (4, 'Customer');
INSERT INTO `authority` VALUES (5, 'Support Staff');

-- ----------------------------
-- Table structure for centers
-- ----------------------------
DROP TABLE IF EXISTS `centers`;
CREATE TABLE `centers`  (
  `center_id` bigint NOT NULL AUTO_INCREMENT,
  `center_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ward` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`center_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of centers
-- ----------------------------
INSERT INTO `centers` VALUES (1, 'Central Health Center', 'Ho Chi Minh', 'District 1', 'Ward 1', '123 Le Loi', '2024-08-27 16:20:27');
INSERT INTO `centers` VALUES (2, 'City Clinic', 'Ha Noi', 'Ba Dinh', 'Ward 2', '456 Kim Ma', '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for chatting
-- ----------------------------
DROP TABLE IF EXISTS `chatting`;
CREATE TABLE `chatting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  `receiver` bigint NULL DEFAULT NULL,
  `sender` bigint NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_file` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5a0buj5ilrqnmip5f9haa2l8u`(`receiver` ASC) USING BTREE,
  INDEX `FKk9xq8rksng78v0hphidblb4tr`(`sender` ASC) USING BTREE,
  CONSTRAINT `FK5a0buj5ilrqnmip5f9haa2l8u` FOREIGN KEY (`receiver`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKk9xq8rksng78v0hphidblb4tr` FOREIGN KEY (`sender`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chatting
-- ----------------------------
INSERT INTO `chatting` VALUES (1, 'hehehe', '2024-09-09 16:42:13', NULL, 4, NULL, NULL);
INSERT INTO `chatting` VALUES (2, 'oke babayt', '2024-09-09 16:43:34', NULL, 4, NULL, NULL);
INSERT INTO `chatting` VALUES (3, 'hehehe oke đấy', '2024-09-09 16:43:44', NULL, 4, NULL, NULL);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `vaccine_id` bigint NULL DEFAULT NULL,
  `news_id` bigint NULL DEFAULT NULL,
  `parent_comment_id` bigint NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `likes_count` int NULL DEFAULT 0,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `account_id`(`account_id` ASC) USING BTREE,
  INDEX `vaccine_id`(`vaccine_id` ASC) USING BTREE,
  INDEX `news_id`(`news_id` ASC) USING BTREE,
  INDEX `parent_comment_id`(`parent_comment_id` ASC) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`comment_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 4, 1, NULL, NULL, 'Great vaccine!', 10, '2024-08-27 16:20:27');
INSERT INTO `comments` VALUES (2, 4, NULL, 1, NULL, 'Very informative news!', 5, '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for customer_profile
-- ----------------------------
DROP TABLE IF EXISTS `customer_profile`;
CREATE TABLE `customer_profile`  (
  `profile_id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` enum('Male','Female','Other') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthdate` date NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ward` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `insurance_status` tinyint(1) NULL DEFAULT NULL,
  `contact_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_relationship` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`profile_id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE,
  INDEX `customer_id`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `customer_profile_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_profile
-- ----------------------------
INSERT INTO `customer_profile` VALUES (1, 4, 'Tran Van Bao An', 'Male', '1998-01-01', '0998877662', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732178881/djxvgmopo3tfnd0ytaoq.jpg', 'Tỉnh Cao Bằng111 ', 'Huyện Trùng Khánh 111', 'xã nghi lộc 111', 'hahaha', 0, 'Tran Thi B update', 'Vợ', '0123456789', '2024-08-27 16:20:27');
INSERT INTO `customer_profile` VALUES (5, 4, 'Hoang Van E11111', 'Male', '1959-11-21', '0998877665', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732181657/qmdxpnxcfwpxgzxxmzig.jpg', 'Da Nang', 'District 11', 'Ward 12', '29 Tran Hung Dao', 0, 'Tran Van E', 'Parent', '0904149948', '2024-11-21 16:33:23');
INSERT INTO `customer_profile` VALUES (6, 6, 'Hoang Van G1111', 'Male', '1972-11-21', '', 'https://example.com/avatars/customer6.jpg', 'Ha Noi', 'District 12', 'Ward 15', '64 Nguyen Hue', 0, 'Tran Van G', 'Parent', '0902707038', '2024-11-21 16:33:23');
INSERT INTO `customer_profile` VALUES (7, 8, 'Hoang Van I', 'Male', '1984-11-21', '0872112113', 'https://example.com/avatars/customer8.jpg', 'Da Nang', 'District 3', 'Ward 15', '18 Tran Hung Dao', 1, 'Tran Van I', 'Child', '0905756775', '2024-11-21 16:33:23');
INSERT INTO `customer_profile` VALUES (8, 53, 'Do Thi B1111', 'Female', '1972-11-21', '0903000001', 'https://example.com/avatars/customer53.jpg', 'Da Nang', 'District 5', 'Ward 1', '10 Le Loi', 1, 'Nguyen Thi B', 'Spouse', '0905631311', '2024-11-21 16:33:23');
INSERT INTO `customer_profile` VALUES (9, 54, 'Hoang Van C', 'Male', '1981-11-21', '0903000002', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732191118/lgfzh5mdurkn7fsuxyyu.jpg', 'Ho Chi Minh', 'District 7', 'Ward 11', '19 Le Loi', 1, 'Tran Van C', 'Spouse', '0906223969', '2024-11-21 16:33:23');

-- ----------------------------
-- Table structure for customer_schedule
-- ----------------------------
DROP TABLE IF EXISTS `customer_schedule`;
CREATE TABLE `customer_schedule`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `vaccine_schedule_id` bigint NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  `pay_status` tinyint(1) NULL DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_schedule_pay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vaccine_schedule_time_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_id`(`account_id` ASC) USING BTREE,
  INDEX `vaccine_schedule_id`(`vaccine_schedule_id` ASC) USING BTREE,
  INDEX `FK9s8hdufulsy5da6um3nvdmn9x`(`vaccine_schedule_time_id` ASC) USING BTREE,
  CONSTRAINT `FK9s8hdufulsy5da6um3nvdmn9x` FOREIGN KEY (`vaccine_schedule_time_id`) REFERENCES `vaccine_schedule_time` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_schedule_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customer_schedule_ibfk_2` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_schedule
-- ----------------------------
INSERT INTO `customer_schedule` VALUES (1, 4, 1, '2024-08-27 16:20:27', 1, 'confirmed', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer_schedule` VALUES (2, 4, 2, '2024-08-27 16:20:27', 0, 'cancelled', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `customer_schedule` VALUES (3, 4, 3, '2024-08-28 23:12:11', 0, 'cancelled', '123 Le Loi, Ward 1, District 1, Ho Chi Minh', '2000-06-01', 'Trần thị bình', '0123456789', NULL, NULL);
INSERT INTO `customer_schedule` VALUES (6, 4, 3, '2024-09-08 20:35:08', 1, 'pending', '123 Le Loi, xã nghi lộc, Huyện Trùng Khánh, Tỉnh Cao Bằng', '1990-01-01', 'Nguyen Van A update', '0123456789', NULL, NULL);

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors`  (
  `doctor_id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `specialization` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `experience_years` int NULL DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`doctor_id`) USING BTREE,
  INDEX `account_id`(`account_id` ASC) USING BTREE,
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctors
-- ----------------------------
INSERT INTO `doctors` VALUES (1, 2, 'test', 1, 'Experienced cardiologist with expertise in treating heart disease.1111', NULL, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732180502/jqxkw9e9ujzgrhv4sjil.jpg', 'Nguyễn Thị Hoài');
INSERT INTO `doctors` VALUES (11, 2, 'Internal Medicine', 14, 'Experienced doctor specializing in vaccine administration with 19 years of practice.', '2024-11-21 16:33:23', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732181963/ocq5hjwfzuw5k5sggk2v.jpg', 'Dr. Nguyen Van C');
INSERT INTO `doctors` VALUES (12, 45, 'Pediatrics', 9, 'Experienced doctor specializing in vaccine administration with 9 years of practice.', '2024-11-21 16:33:23', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732191193/w4k2upkngiuge07wzubx.jpg', 'Dr. Tran Thi T');
INSERT INTO `doctors` VALUES (13, 46, 'Pediatrics', 16, 'Experienced doctor specializing in vaccine administration with 15 years of practice.', '2024-11-21 16:33:23', 'https://example.com/avatars/doctor46.jpg', 'Dr. Nguyen Van U');
INSERT INTO `doctors` VALUES (14, 47, 'Family Medicine', 9, 'Experienced doctor specializing in vaccine administration with 10 years of practice.', '2024-11-21 16:33:23', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732181943/esfbb9vgtcthklj4smwo.jpg', 'Dr. Tran Thi V');
INSERT INTO `doctors` VALUES (15, 48, 'Internal Medicine', 9, 'Experienced doctor specializing in vaccine administration with 10 years of practice.', '2024-11-21 16:33:23', 'https://example.com/avatars/doctor48.jpg', 'Dr. Nguyen Van W21212');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_schedule_id` bigint NOT NULL,
  `feedback_type` enum('general','doctor','nurse') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'general',
  `doctor_id` bigint NULL DEFAULT NULL,
  `nurse_id` bigint NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rating` tinyint(1) NULL DEFAULT NULL,
  `response` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_schedule_id`(`customer_schedule_id` ASC) USING BTREE,
  INDEX `doctor_id`(`doctor_id` ASC) USING BTREE,
  INDEX `nurse_id`(`nurse_id` ASC) USING BTREE,
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_schedule_id`) REFERENCES `customer_schedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`nurse_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 1, 'doctor', 1, NULL, 'Doctor was very knowledgeable and helpful.', 5, NULL, '2024-08-27 16:20:27');
INSERT INTO `feedback` VALUES (2, 1, 'nurse', NULL, 1, 'Nurse was very caring and professional.', 4, NULL, '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for manufacturers
-- ----------------------------
DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers`  (
  `manufacturer_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`manufacturer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manufacturers
-- ----------------------------
INSERT INTO `manufacturers` VALUES (1, 'Pfizer', 'USA', '2024-08-27 16:20:27');
INSERT INTO `manufacturers` VALUES (2, 'Moderna', 'USA', '2024-08-27 16:20:27');
INSERT INTO `manufacturers` VALUES (3, 'AstraZeneca', 'UK', '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `news_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_id` bigint NOT NULL,
  `topic_id` bigint NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`news_id`) USING BTREE,
  INDEX `author_id`(`author_id` ASC) USING BTREE,
  INDEX `topic_id`(`topic_id` ASC) USING BTREE,
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, 'COVID-19 Vaccination Updates', 'Latest updates on COVID-19 vaccination', 'https://vnvc.vn/wp-content/uploads/2024/09/tiem-1-mui-phe-cau-co-duoc-khong.jpg', 1, 3, '2024-08-27 16:20:27');
INSERT INTO `news` VALUES (2, 'Health Benefits of Regular Vaccination', 'Vaccination is crucial for maintaining public health...', 'https://vnvc.vn/wp-content/uploads/2024/08/vac-xin-bach-hau-ho-ga-uon-van-nguoi-lon.jpg', 1, 2, '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for news_sources
-- ----------------------------
DROP TABLE IF EXISTS `news_sources`;
CREATE TABLE `news_sources`  (
  `source_id` bigint NOT NULL AUTO_INCREMENT,
  `news_id` bigint NOT NULL,
  `source_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `source_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`source_id`) USING BTREE,
  INDEX `news_id`(`news_id` ASC) USING BTREE,
  CONSTRAINT `news_sources_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_sources
-- ----------------------------
INSERT INTO `news_sources` VALUES (1, 1, 'WHO', 'https://www.who.int');
INSERT INTO `news_sources` VALUES (2, 2, 'CDC', 'https://www.cdc.gov');

-- ----------------------------
-- Table structure for nurses
-- ----------------------------
DROP TABLE IF EXISTS `nurses`;
CREATE TABLE `nurses`  (
  `nurse_id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `qualification` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `experience_years` int NULL DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nurse_id`) USING BTREE,
  INDEX `account_id`(`account_id` ASC) USING BTREE,
  CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nurses
-- ----------------------------
INSERT INTO `nurses` VALUES (1, 3, 'Y tá năm nào', 10121212, 'Y tá năm nàosâsasadsdsdsd', '2024-08-27 16:20:27', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1732180815/yfgotgjszdaapmvocgh3.jpg', 'Y tá năm nào');
INSERT INTO `nurses` VALUES (11, 3, 'RN', 5, 'Dedicated nurse with 12 years of experience in vaccination and patient care.', '2024-11-21 16:33:23', 'https://example.com/avatars/nurse3.jpg', 'Nurse Pham Van D');
INSERT INTO `nurses` VALUES (12, 49, 'RN', 13, 'Dedicated nurse with 9 years of experience in vaccination and patient care.', '2024-11-21 16:33:23', 'https://example.com/avatars/nurse49.jpg', 'Nurse Pham Van X');
INSERT INTO `nurses` VALUES (13, 50, 'BSN', 8, 'Dedicated nurse with 9 years of experience in vaccination and patient care.', '2024-11-21 16:33:23', 'https://example.com/avatars/nurse50.jpg', 'Nurse Le Thi Y');
INSERT INTO `nurses` VALUES (14, 51, 'BSN', 11, 'Dedicated nurse with 10 years of experience in vaccination and patient care.', '2024-11-21 16:33:23', 'https://example.com/avatars/nurse51.jpg', 'Nurse Pham Van Z');
INSERT INTO `nurses` VALUES (15, 52, 'RN', 5, 'Dedicated nurse with 16 years of experience in vaccination and patient care.', '2024-11-21 16:33:23', 'https://example.com/avatars/nurse52.jpg', 'Nurse Le Thi A');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_schedule_id` bigint NOT NULL,
  `amount` int NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  `created_by` bigint NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_schedule_id`(`customer_schedule_id` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_schedule_id`) REFERENCES `customer_schedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 1, 20, '2024-08-27 16:20:27', 4, NULL, NULL, NULL);
INSERT INTO `payment` VALUES (2, 2, 22, '2024-08-27 16:20:27', 4, NULL, NULL, NULL);
INSERT INTO `payment` VALUES (4, 6, 300000, '2024-09-08 20:35:08', 4, '1725802464269', '1725802464269', NULL);

-- ----------------------------
-- Table structure for payment_details
-- ----------------------------
DROP TABLE IF EXISTS `payment_details`;
CREATE TABLE `payment_details`  (
  `payment_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `payment_id` bigint NOT NULL,
  `method_id` bigint NOT NULL,
  `amount` int NOT NULL,
  `transaction_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`payment_detail_id`) USING BTREE,
  INDEX `payment_id`(`payment_id` ASC) USING BTREE,
  INDEX `method_id`(`method_id` ASC) USING BTREE,
  CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payment_details_ibfk_2` FOREIGN KEY (`method_id`) REFERENCES `payment_methods` (`method_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_details
-- ----------------------------
INSERT INTO `payment_details` VALUES (1, 1, 1, 20, '2024-08-27 16:20:27');
INSERT INTO `payment_details` VALUES (2, 2, 2, 22, '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods`  (
  `method_id` bigint NOT NULL AUTO_INCREMENT,
  `method_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`method_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
INSERT INTO `payment_methods` VALUES (1, 'Credit Card');
INSERT INTO `payment_methods` VALUES (2, 'Bank Transfer');
INSERT INTO `payment_methods` VALUES (3, 'Cash');

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics`  (
  `topic_id` bigint NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES (1, 'Health', '2024-08-27 16:20:27');
INSERT INTO `topics` VALUES (2, 'Vaccination', '2024-08-27 16:20:27');
INSERT INTO `topics` VALUES (3, 'COVID-19', '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for vaccine
-- ----------------------------
DROP TABLE IF EXISTS `vaccine`;
CREATE TABLE `vaccine`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_id` bigint NOT NULL,
  `manufacturer_id` bigint NOT NULL,
  `age_group_id` bigint NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  `inventory` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id` ASC) USING BTREE,
  INDEX `manufacturer_id`(`manufacturer_id` ASC) USING BTREE,
  INDEX `age_group_id`(`age_group_id` ASC) USING BTREE,
  CONSTRAINT `vaccine_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `vaccine_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vaccine_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`manufacturer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vaccine_ibfk_3` FOREIGN KEY (`age_group_id`) REFERENCES `age_groups` (`age_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vaccine
-- ----------------------------
INSERT INTO `vaccine` VALUES (1, 'Pfizer-BioNTech COVID-19 Vaccine', 1, 1, 1, 'Effective against COVID-19', 'https://vnvc.vn/wp-content/uploads/2024/08/Pneumovax-23.jpg', 20, '2024-08-27 16:20:27', NULL, NULL);
INSERT INTO `vaccine` VALUES (2, 'Moderna COVID-19 Vaccine', 1, 2, 2, 'mRNA vaccine for COVID-19', 'https://vnvc.vn/wp-content/uploads/2019/11/vaccine-Prevenar-13.jpg', 300000, '2024-08-27 16:20:27', NULL, NULL);
INSERT INTO `vaccine` VALUES (3, 'AstraZeneca COVID-19 Vaccine', 1, 3, 3, 'Viral vector vaccine for COVID-19', 'https://vnvc.vn/wp-content/uploads/2017/04/Synflorix-1.jpg', 18, '2024-08-27 16:20:27', NULL, NULL);

-- ----------------------------
-- Table structure for vaccine_distribution
-- ----------------------------
DROP TABLE IF EXISTS `vaccine_distribution`;
CREATE TABLE `vaccine_distribution`  (
  `distribution_id` bigint NOT NULL AUTO_INCREMENT,
  `inventory_id` bigint NOT NULL,
  `distribution_type` enum('imports','export') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `distribution_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`distribution_id`) USING BTREE,
  INDEX `inventory_id`(`inventory_id` ASC) USING BTREE,
  CONSTRAINT `vaccine_distribution_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `vaccine_inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vaccine_distribution
-- ----------------------------
INSERT INTO `vaccine_distribution` VALUES (1, 1, 'export', 100, '2024-08-27 16:20:27');
INSERT INTO `vaccine_distribution` VALUES (2, 2, 'export', 150, '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for vaccine_inventory
-- ----------------------------
DROP TABLE IF EXISTS `vaccine_inventory`;
CREATE TABLE `vaccine_inventory`  (
  `inventory_id` bigint NOT NULL AUTO_INCREMENT,
  `vaccine_id` bigint NOT NULL,
  `center_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `import_date` datetime NULL DEFAULT current_timestamp,
  `export_date` datetime NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`) USING BTREE,
  INDEX `vaccine_id`(`vaccine_id` ASC) USING BTREE,
  INDEX `center_id`(`center_id` ASC) USING BTREE,
  CONSTRAINT `vaccine_inventory_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vaccine_inventory_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `centers` (`center_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vaccine_inventory
-- ----------------------------
INSERT INTO `vaccine_inventory` VALUES (1, 1, 1, 100, '2024-08-27 16:20:27', NULL, '2024-08-27 16:20:27', NULL);
INSERT INTO `vaccine_inventory` VALUES (2, 2, 2, 150, '2024-08-27 16:20:27', NULL, '2024-08-27 16:20:27', NULL);

-- ----------------------------
-- Table structure for vaccine_schedule
-- ----------------------------
DROP TABLE IF EXISTS `vaccine_schedule`;
CREATE TABLE `vaccine_schedule`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vaccine_id` bigint NOT NULL,
  `center_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `limit_people` int NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_pre_schedule` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vaccine_id`(`vaccine_id` ASC) USING BTREE,
  INDEX `center_id`(`center_id` ASC) USING BTREE,
  INDEX `created_by`(`created_by` ASC) USING BTREE,
  CONSTRAINT `vaccine_schedule_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vaccine_schedule_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `centers` (`center_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vaccine_schedule_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vaccine_schedule
-- ----------------------------
INSERT INTO `vaccine_schedule` VALUES (1, 1, 1, 1, '2024-09-01 08:00:00', '2024-09-01 12:00:00', 50, '2024-08-27 16:20:27', NULL, NULL);
INSERT INTO `vaccine_schedule` VALUES (2, 2, 2, 1, '2024-09-02 09:00:00', '2024-09-02 13:00:00', 60, '2024-08-27 16:20:27', NULL, NULL);
INSERT INTO `vaccine_schedule` VALUES (3, 2, 1, 1, '2024-08-30 07:20:00', '2024-09-20 17:45:00', 200, '2024-08-28 17:49:40', NULL, NULL);

-- ----------------------------
-- Table structure for vaccine_schedule_doctor
-- ----------------------------
DROP TABLE IF EXISTS `vaccine_schedule_doctor`;
CREATE TABLE `vaccine_schedule_doctor`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inject_date` date NULL DEFAULT NULL,
  `doctor_doctor_id` bigint NULL DEFAULT NULL,
  `vaccine_schedule_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK19bwyih15mtgql6i7l822k7mu`(`doctor_doctor_id` ASC) USING BTREE,
  INDEX `FKgh34kyf04n6s72refd0cwo8af`(`vaccine_schedule_id` ASC) USING BTREE,
  CONSTRAINT `FK19bwyih15mtgql6i7l822k7mu` FOREIGN KEY (`doctor_doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKgh34kyf04n6s72refd0cwo8af` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vaccine_schedule_doctor
-- ----------------------------

-- ----------------------------
-- Table structure for vaccine_schedule_nurse
-- ----------------------------
DROP TABLE IF EXISTS `vaccine_schedule_nurse`;
CREATE TABLE `vaccine_schedule_nurse`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `inject_date` date NULL DEFAULT NULL,
  `nurse_nurse_id` bigint NULL DEFAULT NULL,
  `vaccine_schedule_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKne53wgix2mugikcgasfvh4bkp`(`nurse_nurse_id` ASC) USING BTREE,
  INDEX `FKmljekex2s20d6d2pmf15q8u45`(`vaccine_schedule_id` ASC) USING BTREE,
  CONSTRAINT `FKmljekex2s20d6d2pmf15q8u45` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKne53wgix2mugikcgasfvh4bkp` FOREIGN KEY (`nurse_nurse_id`) REFERENCES `nurses` (`nurse_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vaccine_schedule_nurse
-- ----------------------------

-- ----------------------------
-- Table structure for vaccine_schedule_time
-- ----------------------------
DROP TABLE IF EXISTS `vaccine_schedule_time`;
CREATE TABLE `vaccine_schedule_time`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end` time NULL DEFAULT NULL,
  `inject_date` date NULL DEFAULT NULL,
  `limit_people` int NULL DEFAULT NULL,
  `start` time NULL DEFAULT NULL,
  `vaccine_schedule_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8mqx80v1rjwsivvgn757983nc`(`vaccine_schedule_id` ASC) USING BTREE,
  CONSTRAINT `FK8mqx80v1rjwsivvgn757983nc` FOREIGN KEY (`vaccine_schedule_id`) REFERENCES `vaccine_schedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vaccine_schedule_time
-- ----------------------------

-- ----------------------------
-- Table structure for vaccine_types
-- ----------------------------
DROP TABLE IF EXISTS `vaccine_types`;
CREATE TABLE `vaccine_types`  (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vaccine_types
-- ----------------------------
INSERT INTO `vaccine_types` VALUES (1, 'COVID-19', '2024-08-27 16:20:27');
INSERT INTO `vaccine_types` VALUES (2, 'Influenza', '2024-08-27 16:20:27');
INSERT INTO `vaccine_types` VALUES (3, 'Hepatitis B', '2024-08-27 16:20:27');

-- ----------------------------
-- Table structure for work_schedules
-- ----------------------------
DROP TABLE IF EXISTS `work_schedules`;
CREATE TABLE `work_schedules`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint NOT NULL,
  `working_date` date NOT NULL,
  `working_time` time NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_schedules
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
