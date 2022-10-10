/*
Navicat MySQL Data Transfer

Source Server         : laragon_DB
Source Server Version : 50733
Source Host           : localhost:3306
Source Database       : graphql-laravel

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2022-10-10 17:12:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `departments`
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_title_unique` (`title`),
  UNIQUE KEY `departments_email_unique` (`email`),
  KEY `departments_manager_id_foreign` (`manager_id`),
  CONSTRAINT `departments_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'Development', 'dev@gamil.com', '1', null, null);
INSERT INTO `departments` VALUES ('2', 'operation22', 'operation@gmail.com', '2', null, '2022-10-10 14:01:58');
INSERT INTO `departments` VALUES ('12', 'test', 'test@gmail.com', null, '2022-10-10 14:02:52', '2022-10-10 14:02:52');

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_12_14_000001_create_personal_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('5', '2022_10_09_091653_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('6', '2014_10_12_000000_create_departments_table', '2');
INSERT INTO `migrations` VALUES ('7', '2022_10_10_104950_add_department_id_to_users', '3');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `personal_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '5', 'Mr. Cletus Streich Sr.', 'She said this last remark. \'Of course you know about it, you know--\' She had not gone much farther before she made her draw back in their mouths; and the choking of the.', '2022-10-09 10:59:56', '2022-10-09 10:59:56');
INSERT INTO `posts` VALUES ('2', '1', 'Jaylan Greenholt', 'How I wonder what I say,\' the Mock Turtle said: \'no wise fish would go through,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about.', '2022-10-09 10:59:57', '2022-10-09 10:59:57');
INSERT INTO `posts` VALUES ('3', '2', 'Ralph Koepp', 'Duchess: \'what a clear way you go,\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a butterfly, I should understand that better,\' Alice said very humbly; \'I won\'t.', '2022-10-09 10:59:57', '2022-10-09 10:59:57');
INSERT INTO `posts` VALUES ('4', '4', 'Ernesto Harris', 'Alice, in a sorrowful tone; \'at least there\'s no use speaking to a shriek, \'and just as usual. I wonder what Latitude or Longitude I\'ve got back to the Gryphon. \'How the.', '2022-10-09 10:59:57', '2022-10-09 10:59:57');
INSERT INTO `posts` VALUES ('5', '1', 'Matilda Romaguera', 'Mock Turtle said: \'no wise fish would go round a deal faster than it does.\' \'Which would NOT be an old crab, HE was.\' \'I never went to him,\' the Mock Turtle: \'nine the next, and.', '2022-10-09 10:59:57', '2022-10-09 10:59:57');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_department_id_foreign` (`department_id`),
  CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Prof. Liam Klocko', 'njohnson@example.org', '2022-10-09 10:59:56', '$2y$10$eXiHnvhgDO2NgRnxGwMGROFOCLe2CnZ/1TeJAj.l7x95qhldlPxsu', 'a6Pksg7Qgp', '2022-10-09 10:59:56', '2022-10-09 10:59:56', '1');
INSERT INTO `users` VALUES ('2', 'Prof. Jovany Schuppe', 'howe.vena@example.org', '2022-10-09 10:59:56', '$2y$10$eXiHnvhgDO2NgRnxGwMGROFOCLe2CnZ/1TeJAj.l7x95qhldlPxsu', '2L5lTrFLTw', '2022-10-09 10:59:56', '2022-10-09 10:59:56', '1');
INSERT INTO `users` VALUES ('3', 'Mr. Zander Bode Jr.', 'jokeefe@example.org', '2022-10-09 10:59:56', '$2y$10$eXiHnvhgDO2NgRnxGwMGROFOCLe2CnZ/1TeJAj.l7x95qhldlPxsu', 'VFLR7SozaV', '2022-10-09 10:59:56', '2022-10-09 10:59:56', '2');
INSERT INTO `users` VALUES ('4', 'Cristopher O\'Hara', 'sadye14@example.net', '2022-10-09 10:59:56', '$2y$10$eXiHnvhgDO2NgRnxGwMGROFOCLe2CnZ/1TeJAj.l7x95qhldlPxsu', 'o5MeNBdo5D', '2022-10-09 10:59:56', '2022-10-09 10:59:56', '2');
INSERT INTO `users` VALUES ('5', 'Dr. Rhett Reichel Jr.', 'christelle76@example.com', '2022-10-09 10:59:56', '$2y$10$eXiHnvhgDO2NgRnxGwMGROFOCLe2CnZ/1TeJAj.l7x95qhldlPxsu', 'E4TXRI82qp', '2022-10-09 10:59:56', '2022-10-09 10:59:56', '2');
INSERT INTO `users` VALUES ('6', 'John Doe', 'Johndoe@gmail.com', null, '$2y$10$OeedtkFGMsQkcioNPGbPw.FmkIMyWV6V3MRBzD3xxUgGdRNcq28Se', null, '2022-10-09 12:49:05', '2022-10-09 12:49:05', null);
