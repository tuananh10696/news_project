-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 13, 2023 at 10:12 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `shioya_iju`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(40) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `created`, `modified`, `name`, `username`, `password`, `role`) VALUES
(1, '2022-12-08 17:55:21', '2022-12-08 17:55:21', '管理者', 'caters_admin', '$2y$10$7X.icRPhUBnFrsoBR784y.VMC9IrXxbbinEff3WMGa0N.WG3D8kH6', 0);

-- --------------------------------------------------------

--
-- Table structure for table `append_items`
--

CREATE TABLE `append_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_config_id` int(11) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `slug` varchar(30) NOT NULL DEFAULT '',
  `value_type` decimal(10,0) NOT NULL DEFAULT '0',
  `item_type` varchar(255) DEFAULT NULL,
  `max_length` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_required` decimal(10,0) UNSIGNED NOT NULL DEFAULT '0',
  `mst_list_slug` varchar(40) DEFAULT NULL,
  `value_default` varchar(100) DEFAULT NULL,
  `attention` varchar(100) DEFAULT NULL,
  `after_field` varchar(255) DEFAULT NULL,
  `edit_pos` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_config_id` int(11) UNSIGNED NOT NULL,
  `parent_category_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `name` varchar(40) NOT NULL,
  `identifier` varchar(30) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cate_color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created`, `modified`, `page_config_id`, `parent_category_id`, `position`, `status`, `name`, `identifier`, `image`, `cate_color`) VALUES
(1, '2023-02-06 05:28:28', '2023-02-06 05:28:28', 1, 0, 1, 'publish', 'お知らせ', '', NULL, NULL),
(2, '2023-02-06 05:28:36', '2023-02-06 05:28:36', 1, 0, 2, 'publish', 'イベント', '', NULL, NULL),
(3, '2023-02-10 06:09:00', '2023-02-10 06:09:00', 2, 0, 1, 'publish', 'test', NULL, NULL, NULL),
(4, '2023-02-10 06:09:39', '2023-02-10 06:09:39', 2, 0, 2, 'publish', 'test', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `infos`
--

CREATE TABLE `infos` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_config_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `title` varchar(255) DEFAULT NULL,
  `notes` text,
  `start_datetime` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` decimal(10,0) NOT NULL DEFAULT '0',
  `end_date` date DEFAULT NULL,
  `end_time` decimal(10,0) NOT NULL DEFAULT '0',
  `image` varchar(100) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_extension` varchar(5) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `meta_keywords` varchar(200) DEFAULT NULL,
  `regist_user_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `index_type` decimal(10,0) DEFAULT NULL,
  `multi_position` bigint(20) DEFAULT NULL,
  `parent_info_id` int(10) UNSIGNED DEFAULT NULL,
  `value_text` varchar(255) DEFAULT NULL,
  `popular` tinyint(1) DEFAULT NULL,
  `top_slide_display` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `infos`
--

INSERT INTO `infos` (`id`, `created`, `modified`, `page_config_id`, `position`, `status`, `title`, `notes`, `start_datetime`, `date`, `start_date`, `start_time`, `end_date`, `end_time`, `image`, `file`, `file_name`, `file_size`, `file_extension`, `meta_description`, `meta_keywords`, `regist_user_id`, `category_id`, `index_type`, `multi_position`, `parent_info_id`, `value_text`, `popular`, `top_slide_display`) VALUES
(1, '2023-02-13 16:47:52', '2023-02-13 10:05:57', 1, 2, 'publish', 'test', NULL, NULL, '2023-02-17', NULL, '0', NULL, '0', 'img_1_dbb0a209-fba8-4cf9-991e-5280ae94aaec.jpg', 'img_1_84b3a345-9778-4fcb-b9af-e0f63464a0ec.pdf', 'dummy (3)', 34839, 'pdf', NULL, '', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2023-02-13 19:05:57', '2023-02-13 19:08:18', 1, 1, 'draft', 'aaaaa', NULL, NULL, '2023-02-13', NULL, '0', NULL, '0', 'img_2_5029a7df-3a58-4061-a5c6-24779caa01db.png', 'img_2_754af56f-39ec-4a19-9030-e26698eb41f2.pdf', '1234567890', 13264, 'pdf', NULL, '', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `info_append_items`
--

CREATE TABLE `info_append_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info_id` int(11) UNSIGNED NOT NULL,
  `append_item_id` int(11) UNSIGNED NOT NULL,
  `value_text` varchar(200) DEFAULT NULL,
  `value_textarea` text,
  `value_date` date DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_time` time DEFAULT NULL,
  `value_int` int(10) DEFAULT NULL,
  `value_key` varchar(30) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `file_size` int(10) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `info_categories`
--

CREATE TABLE `info_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `info_contents`
--

CREATE TABLE `info_contents` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info_id` int(11) NOT NULL,
  `block_type` decimal(10,0) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `h2` varchar(100) DEFAULT NULL,
  `content` text,
  `image` varchar(100) DEFAULT NULL,
  `img_alt` varchar(255) DEFAULT NULL,
  `image_pos` varchar(10) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `file_size` int(10) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `section_sequence_id` int(10) DEFAULT '0',
  `option_value` varchar(255) DEFAULT NULL,
  `option_value2` varchar(40) DEFAULT NULL,
  `option_value3` varchar(40) DEFAULT NULL,
  `before_text` text,
  `after_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `info_stock_tables`
--

CREATE TABLE `info_stock_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info_id` int(11) NOT NULL,
  `page_slug` varchar(40) DEFAULT NULL,
  `model_name` varchar(40) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `info_tags`
--

CREATE TABLE `info_tags` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `info_tops`
--

CREATE TABLE `info_tops` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_config_id` int(11) NOT NULL,
  `position` int(10) NOT NULL DEFAULT '0',
  `info_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kvs`
--

CREATE TABLE `kvs` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(50) DEFAULT NULL,
  `key_name` varchar(40) DEFAULT NULL,
  `val` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mst_lists`
--

CREATE TABLE `mst_lists` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `position` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '表示順',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `ltrl_cd` varchar(60) DEFAULT NULL,
  `ltrl_val` varchar(60) DEFAULT NULL,
  `ltrl_sub_val` text,
  `slug` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sys_cd` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_configs`
--

CREATE TABLE `page_configs` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `site_config_id` int(11) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_title` varchar(100) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `header` text,
  `footer` text,
  `is_public_date` decimal(10,0) DEFAULT NULL,
  `is_public_time` decimal(10,0) DEFAULT NULL,
  `page_template_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `is_category` varchar(10) NOT NULL DEFAULT 'N',
  `is_category_sort` varchar(10) NOT NULL DEFAULT 'N',
  `is_category_multiple` decimal(10,0) NOT NULL DEFAULT '0',
  `is_category_multilevel` decimal(10,0) NOT NULL DEFAULT '0',
  `modified_category_role` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `max_multilevel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `disable_position_order` decimal(10,0) NOT NULL DEFAULT '0',
  `disable_preview` decimal(10,0) NOT NULL DEFAULT '0',
  `is_auto_menu` decimal(10,0) NOT NULL DEFAULT '0',
  `list_style` decimal(10,0) NOT NULL DEFAULT '1',
  `root_dir_type` decimal(10,0) NOT NULL DEFAULT '0',
  `link_color` varchar(10) DEFAULT NULL,
  `parent_config_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_configs`
--

INSERT INTO `page_configs` (`id`, `created`, `modified`, `site_config_id`, `position`, `page_title`, `slug`, `header`, `footer`, `is_public_date`, `is_public_time`, `page_template_id`, `description`, `keywords`, `is_category`, `is_category_sort`, `is_category_multiple`, `is_category_multilevel`, `modified_category_role`, `max_multilevel`, `disable_position_order`, `disable_preview`, `is_auto_menu`, `list_style`, `root_dir_type`, `link_color`, `parent_config_id`) VALUES
(1, '2023-02-13 16:43:56', '2023-02-13 07:43:56', 1, 1, 'お知らせ', 'news', NULL, NULL, NULL, NULL, NULL, '', '', 'Y', 'N', '0', '0', 1, 0, '0', '0', '1', '1', '0', '#000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `page_config_extensions`
--

CREATE TABLE `page_config_extensions` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_config_id` int(11) NOT NULL,
  `position` int(10) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `type` decimal(10,0) DEFAULT NULL,
  `option_value` varchar(100) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `page_config_items`
--

CREATE TABLE `page_config_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_config_id` int(11) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `parts_type` enum('main','block','section') NOT NULL DEFAULT 'main',
  `item_key` varchar(40) DEFAULT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `memo` varchar(40) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `sub_title` varchar(30) DEFAULT NULL,
  `editable_role` varchar(100) NOT NULL DEFAULT 'staff',
  `viewable_role` varchar(100) NOT NULL DEFAULT 'staff',
  `item_type` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `max_length` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_config_items`
--

INSERT INTO `page_config_items` (`id`, `created`, `modified`, `page_config_id`, `position`, `parts_type`, `item_key`, `status`, `memo`, `title`, `sub_title`, `editable_role`, `viewable_role`, `item_type`, `is_required`, `max_length`) VALUES
(1, '2023-02-13 16:49:22', '2023-02-13 08:02:52', 1, 3, 'main', 'title', 'Y', '', 'タイトル', '', 'staff', 'staff', 'text', 1, 200),
(2, '2023-02-13 16:51:06', '2023-02-14 18:13:51', 1, 4, 'main', 'category_id', 'N', '', 'カテゴリ', '', 'staff', 'staff', 'select', 1, 0),
(3, '2023-02-13 17:02:02', '2023-02-13 08:02:54', 1, 1, 'main', 'date', 'Y', '', '登録日', '', 'staff', 'staff', 'date', 1, 0),
(4, '2023-02-13 17:02:48', '2023-02-13 08:02:54', 1, 2, 'main', 'status', 'Y', '', '記事表示', '', 'staff', 'staff', 'radio', 1, 0),
(5, '2023-02-13 17:43:09', '2023-02-14 18:13:53', 1, 5, 'main', 'file', 'N', '', 'ファイル', '', 'staff', 'staff', 'file', 1, 0),
(7, '2023-02-14 15:14:07', '2023-02-14 15:16:21', 2, 1, 'main', 'top_slide_display', 'Y', '', 'radio', '', 'staff', 'staff', 'radio', 1, 0),
(9, '2023-02-14 16:19:37', '2023-02-15 00:59:42', 1, 10, 'block', 'image', 'Y', '', '画像', '', 'staff', 'staff', '3', 0, 0),
(10, '2023-02-14 17:51:50', '2023-02-15 00:59:42', 1, 6, 'block', 'h2', 'Y', '', '', '', 'staff', 'staff', '7', 0, 0),
(11, '2023-02-14 17:52:03', '2023-02-15 00:59:42', 1, 7, 'block', 'h3', 'Y', '', '', '', 'staff', 'staff', '1', 0, 0),
(12, '2023-02-14 17:52:13', '2023-02-15 00:59:42', 1, 8, 'block', 'h4', 'Y', '', '', '', 'staff', 'staff', '5', 0, 0),
(13, '2023-02-14 17:52:24', '2023-02-15 00:59:42', 1, 9, 'block', 'content', 'Y', '', '', '', 'staff', 'staff', '2', 0, 0),
(14, '2023-02-14 17:52:35', '2023-02-15 00:59:42', 1, 11, 'block', 'file', 'Y', '', '', '', 'staff', 'staff', '4', 0, 0),
(15, '2023-02-14 17:53:01', '2023-02-15 00:59:42', 1, 12, 'block', 'button', 'Y', '', '', '', 'staff', 'staff', '8', 0, 0),
(16, '2023-02-14 17:53:19', '2023-02-15 00:59:42', 1, 13, 'block', 'line', 'Y', '', '', '', 'staff', 'staff', '9', 0, 0),
(17, '2023-02-14 17:53:43', '2023-02-15 00:59:42', 1, 14, 'block', 'with_image', 'Y', '', '', '', 'staff', 'staff', '11', 0, 0),
(18, '2023-02-14 18:08:20', '2023-02-15 00:59:42', 1, 15, 'block', 'mm', 'Y', '', '', '', 'staff', 'staff', '15', 0, 0),
(19, '2023-02-14 18:08:31', '2023-02-15 10:22:46', 1, 16, 'block', 'kw', 'Y', '', '', '', 'staff', 'staff', '16', 0, 0),
(25, '2023-02-15 10:21:13', '2023-02-15 11:07:54', 1, 17, 'main', 'image', 'Y', NULL, '', '', 'staff', 'staff', 'image', 1, 0),
(26, '2023-02-15 10:21:28', '2023-02-15 10:54:26', 1, 18, 'section', '', 'Y', NULL, '', '', 'staff', 'staff', '10', 0, 0),
(27, '2023-02-15 10:21:47', '2023-02-15 01:21:47', 1, 19, 'block', 'user_kaiwa', 'Y', NULL, '', '', 'staff', 'staff', '17', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `memo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `section_sequences`
--

CREATE TABLE `section_sequences` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info_content_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `site_configs`
--

CREATE TABLE `site_configs` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'draft',
  `site_name` varchar(100) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `is_root` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site_configs`
--

INSERT INTO `site_configs` (`id`, `created`, `modified`, `position`, `status`, `site_name`, `slug`, `is_root`) VALUES
(1, '2022-12-08 18:30:49', '2022-12-08 18:30:49', 1, 'publish', '【プロポ】塩谷町移住定住促進サイト', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tag` varchar(40) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_config_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(40) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('publish','draft') NOT NULL DEFAULT 'publish',
  `temp_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `useradmins`
--

CREATE TABLE `useradmins` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(200) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `temp_password` varchar(40) DEFAULT NULL,
  `temp_pass_expired` datetime DEFAULT NULL,
  `temp_key` varchar(200) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `face_image` varchar(100) DEFAULT NULL,
  `role` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `useradmins`
--

INSERT INTO `useradmins` (`id`, `created`, `modified`, `email`, `username`, `password`, `temp_password`, `temp_pass_expired`, `temp_key`, `name`, `status`, `face_image`, `role`) VALUES
(1, '2022-12-08 18:28:07', '2022-12-08 18:30:57', '', 'develop', '', 'caters040917', '1900-01-01 00:00:00', '', '開発', 'publish', '', 0),
(2, '2022-12-08 18:28:07', '2022-12-08 18:30:57', '', 'admin', '', 'g05kHonV', '1900-01-01 00:00:00', '', '管理者', 'publish', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `useradmin_sites`
--

CREATE TABLE `useradmin_sites` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `useradmin_id` int(11) NOT NULL,
  `site_config_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `useradmin_sites`
--

INSERT INTO `useradmin_sites` (`id`, `created`, `modified`, `useradmin_id`, `site_config_id`) VALUES
(1, '2022-12-08 18:30:57', '2022-12-08 18:30:57', 1, 1),
(2, '2022-12-08 18:30:57', '2022-12-08 18:30:57', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `append_items`
--
ALTER TABLE `append_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `infos`
--
ALTER TABLE `infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_append_items`
--
ALTER TABLE `info_append_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_categories`
--
ALTER TABLE `info_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_contents`
--
ALTER TABLE `info_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_stock_tables`
--
ALTER TABLE `info_stock_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_tags`
--
ALTER TABLE `info_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_tops`
--
ALTER TABLE `info_tops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kvs`
--
ALTER TABLE `kvs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_lists`
--
ALTER TABLE `mst_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sys_cd` (`sys_cd`,`slug`,`ltrl_cd`),
  ADD KEY `sys_cd_2` (`sys_cd`,`slug`);

--
-- Indexes for table `page_configs`
--
ALTER TABLE `page_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_config_extensions`
--
ALTER TABLE `page_config_extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_config_items`
--
ALTER TABLE `page_config_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_config_id` (`page_config_id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_sequences`
--
ALTER TABLE `section_sequences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_configs`
--
ALTER TABLE `site_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useradmins`
--
ALTER TABLE `useradmins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useradmin_sites`
--
ALTER TABLE `useradmin_sites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `append_items`
--
ALTER TABLE `append_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `infos`
--
ALTER TABLE `infos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `info_append_items`
--
ALTER TABLE `info_append_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `info_categories`
--
ALTER TABLE `info_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_contents`
--
ALTER TABLE `info_contents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_stock_tables`
--
ALTER TABLE `info_stock_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_tags`
--
ALTER TABLE `info_tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_tops`
--
ALTER TABLE `info_tops`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kvs`
--
ALTER TABLE `kvs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mst_lists`
--
ALTER TABLE `mst_lists`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_configs`
--
ALTER TABLE `page_configs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_config_extensions`
--
ALTER TABLE `page_config_extensions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_config_items`
--
ALTER TABLE `page_config_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_sequences`
--
ALTER TABLE `section_sequences`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_configs`
--
ALTER TABLE `site_configs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `useradmins`
--
ALTER TABLE `useradmins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `useradmin_sites`
--
ALTER TABLE `useradmin_sites`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
