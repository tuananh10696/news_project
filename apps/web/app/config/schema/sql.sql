-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2023 年 1 月 04 日 09:13
-- サーバのバージョン： 5.7.34
-- PHP のバージョン: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- データベース: `atom`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `admins`
--

INSERT INTO `admins` (`id`, `created`, `modified`, `name`, `username`, `password`, `role`) VALUES
(1, '2022-12-08 17:55:21', '2022-12-08 17:55:21', '管理者', 'caters_admin', '$2y$10$7X.icRPhUBnFrsoBR784y.VMC9IrXxbbinEff3WMGa0N.WG3D8kH6', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `append_items`
--

CREATE TABLE `append_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `page_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `slug` varchar(30) NOT NULL DEFAULT '',
  `value_type` decimal(10,0) NOT NULL DEFAULT '0',
  `max_length` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_required` decimal(10,0) UNSIGNED NOT NULL DEFAULT '0',
  `mst_list_slug` varchar(40) NOT NULL DEFAULT '',
  `value_default` varchar(100) NOT NULL DEFAULT '',
  `attention` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `append_items`
--

INSERT INTO `append_items` (`id`, `created`, `modified`, `page_config_id`, `position`, `name`, `slug`, `value_type`, `max_length`, `is_required`, `mst_list_slug`, `value_default`, `attention`) VALUES
(1, '2022-12-16 16:56:30', '2022-12-27 08:41:05', 5, 1, '部署', 'place', '2', 30, '1', '0', '', ''),
(2, '2022-12-16 16:57:31', '2022-12-28 01:34:50', 5, 2, '役職', 'level', '2', 20, '1', '0', '', ''),
(4, '2022-12-16 16:59:33', '2022-12-16 16:59:33', 5, 3, '詳細画像', 'image', '32', 0, '1', '0', '', ''),
(5, '2022-12-20 17:59:03', '2022-12-20 17:59:03', 2, 2, '会社名', 'company', '2', 50, '1', '0', '', ''),
(6, '2022-12-20 17:59:47', '2022-12-20 17:59:47', 2, 3, '代表者名', 'daihyou', '2', 20, '1', '0', '', ''),
(7, '2022-12-20 18:19:30', '2023-01-04 00:27:13', 2, 4, 'YoutubeのURL・ID', 'yt', '2', 255, '0', '0', '', ''),
(8, '2022-12-20 18:38:44', '2023-01-04 06:47:16', 2, 5, '詳細画像（PC版）', 'image', '32', 0, '1', '0', '', ''),
(9, '2022-12-22 10:06:30', '2022-12-28 01:02:35', 6, 1, '担当', 'tanto_title', '2', 50, '1', '0', '', ''),
(10, '2022-12-22 10:06:56', '2022-12-22 10:06:56', 6, 2, '会社名', 'company', '2', 50, '1', '0', '', ''),
(11, '2022-12-26 18:18:29', '2022-12-27 12:29:31', 2, 1, '見出し', 'title', '3', 200, '1', '0', '', ''),
(12, '2023-01-04 06:47:30', '2023-01-04 06:47:30', 2, 6, '詳細画像（SP版）', 'image_sp', '32', 0, '1', '0', '', ''),
(13, '2023-01-04 07:21:43', '2023-01-04 07:24:03', 7, 1, '会社名', 'cp_name', '2', 200, '1', '0', '', ''),
(14, '2023-01-04 07:22:31', '2023-01-04 07:23:56', 7, 2, '所在地', 'cp_address', '2', 100, '0', '0', '', ''),
(15, '2023-01-04 07:23:15', '2023-01-04 07:23:49', 7, 3, '業種', 'cp_industry', '2', 100, '0', '0', '', ''),
(16, '2023-01-04 07:23:41', '2023-01-04 07:23:41', 7, 4, 'Webサイト', 'cp_web', '2', 300, '0', '0', '', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `page_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `parent_category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `name` varchar(40) NOT NULL DEFAULT '',
  `identifier` varchar(30) NOT NULL DEFAULT '',
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `created`, `modified`, `page_config_id`, `parent_category_id`, `position`, `status`, `name`, `identifier`, `image`) VALUES
(1, '2022-12-20 11:31:18', '2022-12-28 02:59:07', 2, 0, 1, 'publish', 'クラウド在庫管理システム', '@wms', 'img_1_9bf979c8-f7bd-4d38-9def-234752fe53cf.png'),
(2, '2022-12-20 12:07:04', '2022-12-27 12:13:07', 2, 0, 2, 'publish', 'クラウド検品システム', 'barcorrect', 'img_2_1f1c30cd-a3d4-41e4-8d04-8ecd853c0537.jpg'),
(3, '2022-12-20 12:08:00', '2022-12-27 12:13:15', 2, 0, 3, 'publish', 'レンタル品管理システム', 'レンタルプラス', 'img_3_714d467b-18ed-44bc-bb25-9bbb997c3971.jpeg'),
(4, '2022-12-20 12:08:18', '2022-12-28 02:59:45', 2, 0, 4, 'publish', '仕分検品システム', 'PASSSORT', 'img_4_9b03afb9-5a4b-450e-91f8-a67f9ec223d0.png'),
(5, '2022-12-20 12:08:40', '2022-12-27 12:13:49', 2, 0, 5, 'publish', 'デジタルアソートシステム', '仕分道', 'img_5_f08f45f8-8093-4b60-9ef3-55a1932350b4.png'),
(6, '2022-12-20 12:09:02', '2022-12-27 12:14:01', 2, 0, 6, 'publish', 'デジタルピッキングシステム', 'digipica', 'img_6_6eef2651-929e-45b6-8a6d-016adf6777c9.png'),
(7, '2022-12-20 12:09:23', '2022-12-27 12:14:19', 2, 0, 7, 'publish', 'マルチピッキングカート', 'TREMAS', 'img_7_fdf1ad43-1a6f-46dd-ae8a-62e7e987c187.jpg');

-- --------------------------------------------------------

--
-- テーブルの構造 `infos`
--

CREATE TABLE `infos` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `page_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'draft',
  `title` varchar(100) NOT NULL DEFAULT '',
  `notes` text,
  `start_datetime` datetime DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT '1900-01-01',
  `start_time` decimal(10,0) NOT NULL DEFAULT '0',
  `end_date` date NOT NULL DEFAULT '1900-01-01',
  `end_time` decimal(10,0) NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '',
  `meta_description` varchar(200) NOT NULL DEFAULT '',
  `meta_keywords` varchar(200) NOT NULL DEFAULT '',
  `regist_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `index_type` decimal(10,0) NOT NULL DEFAULT '0',
  `multi_position` bigint(20) NOT NULL DEFAULT '0',
  `parent_info_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value_text` varchar(255) DEFAULT NULL,
  `popular` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `infos`
--

INSERT INTO `infos` (`id`, `created`, `modified`, `page_config_id`, `position`, `status`, `title`, `notes`, `start_datetime`, `start_date`, `start_time`, `end_date`, `end_time`, `image`, `meta_description`, `meta_keywords`, `regist_user_id`, `category_id`, `index_type`, `multi_position`, `parent_info_id`, `value_text`, `popular`) VALUES
(1, '2023-01-04 08:49:03', '2023-01-04 08:49:04', 2, 2, 'draft', 'erewr', 'rer', '2023-01-04 00:00:00', '1900-01-01', '0', '1900-01-01', '0', 'img_1_f140e964-18ab-44a3-a813-916f8271d4e2.jpeg', '', '', 1, 1, '0', 0, 0, NULL, NULL),
(3, '2023-01-04 08:53:13', '2023-01-04 08:57:27', 7, 2, 'draft', '', NULL, '2023-01-04 00:00:00', '1900-01-01', '0', '1900-01-01', '0', '', '', '', 1, 0, '0', 0, 1, NULL, NULL),
(4, '2023-01-04 09:05:05', '2023-01-04 09:05:07', 2, 1, 'draft', 'test', 'aaad', '2023-01-04 00:00:00', '1900-01-01', '0', '1900-01-01', '0', 'img_4_e586f9ac-0adc-4ac0-a6f8-71483456a051.jpeg', '', '', 1, 4, '0', 0, 0, NULL, NULL),
(5, '2023-01-04 09:05:38', '2023-01-04 09:05:38', 7, 1, 'draft', '', NULL, '2023-01-04 00:00:00', '1900-01-01', '0', '1900-01-01', '0', '', '', '', 1, 0, '0', 0, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `info_append_items`
--

CREATE TABLE `info_append_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `append_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value_text` varchar(200) NOT NULL DEFAULT '',
  `value_textarea` text NOT NULL,
  `value_date` date NOT NULL DEFAULT '1900-01-01',
  `value_datetime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `value_time` time NOT NULL DEFAULT '00:00:00',
  `value_int` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value_key` varchar(30) NOT NULL DEFAULT '',
  `file` varchar(100) NOT NULL DEFAULT '',
  `file_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `file_name` varchar(100) NOT NULL DEFAULT '',
  `file_extension` varchar(10) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `info_append_items`
--

INSERT INTO `info_append_items` (`id`, `created`, `modified`, `info_id`, `append_item_id`, `value_text`, `value_textarea`, `value_date`, `value_datetime`, `value_time`, `value_int`, `value_key`, `file`, `file_size`, `file_name`, `file_extension`, `image`) VALUES
(1, '2023-01-04 08:49:03', '2023-01-04 08:49:03', 1, 11, '', 'ewrew', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(2, '2023-01-04 08:49:03', '2023-01-04 08:49:03', 1, 5, 'rewrwe', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(3, '2023-01-04 08:49:03', '2023-01-04 08:49:03', 1, 6, 'rewrew', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(4, '2023-01-04 08:49:03', '2023-01-04 08:49:03', 1, 7, '', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(5, '2023-01-04 08:49:03', '2023-01-04 08:49:04', 1, 8, '', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', 'append_img_5_220a434e-e11a-4085-8887-cba0d3f39f7d.jpeg'),
(6, '2023-01-04 08:49:04', '2023-01-04 08:49:04', 1, 12, '', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', 'append_img_6_33f38cd5-1619-49c3-ae45-869804920e74.jpeg'),
(7, '2023-01-04 08:49:19', '2023-01-04 08:49:19', 2, 13, 'a', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(8, '2023-01-04 08:49:19', '2023-01-04 08:49:19', 2, 14, 'b', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(9, '2023-01-04 08:49:20', '2023-01-04 08:49:20', 2, 15, 'c', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(10, '2023-01-04 08:49:20', '2023-01-04 08:49:20', 2, 16, 'caters', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(11, '2023-01-04 08:53:13', '2023-01-04 08:57:27', 3, 13, 'aaabbb', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(12, '2023-01-04 08:53:13', '2023-01-04 08:57:27', 3, 14, '職務', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(13, '2023-01-04 08:53:13', '2023-01-04 08:57:27', 3, 15, '業種', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(14, '2023-01-04 08:53:13', '2023-01-04 08:57:27', 3, 16, '建物種類', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(15, '2023-01-04 09:05:05', '2023-01-04 09:05:05', 4, 11, '', 'dss', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(16, '2023-01-04 09:05:05', '2023-01-04 09:05:05', 4, 5, 'dsfdsf', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(17, '2023-01-04 09:05:05', '2023-01-04 09:05:05', 4, 6, 'fdsfsdf', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(18, '2023-01-04 09:05:05', '2023-01-04 09:05:05', 4, 7, '', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(19, '2023-01-04 09:05:05', '2023-01-04 09:05:06', 4, 8, '', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', 'append_img_19_d602b958-a9d2-4671-9a63-fd32518ad7bc.jpeg'),
(20, '2023-01-04 09:05:06', '2023-01-04 09:05:06', 4, 12, '', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', 'append_img_20_37922362-8337-4802-9190-b26f1c639a28.jpeg'),
(21, '2023-01-04 09:05:38', '2023-01-04 09:05:38', 5, 13, '会社名', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(22, '2023-01-04 09:05:38', '2023-01-04 09:05:38', 5, 14, '所在地', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(23, '2023-01-04 09:05:38', '2023-01-04 09:05:38', 5, 15, '業種', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', ''),
(24, '2023-01-04 09:05:38', '2023-01-04 09:05:38', 5, 16, 'Webサイト', '', '1970-01-01', '1900-01-01 00:00:00', '00:00:00', 0, '', '', 0, '', '', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `info_categories`
--

CREATE TABLE `info_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `info_contents`
--

CREATE TABLE `info_contents` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `block_type` decimal(10,0) NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text,
  `image` varchar(100) NOT NULL DEFAULT '',
  `image_2` varchar(100) DEFAULT NULL,
  `image_3` varchar(100) DEFAULT NULL,
  `image_pos` varchar(10) NOT NULL DEFAULT '',
  `file` varchar(100) NOT NULL DEFAULT '',
  `file_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `file_name` varchar(100) NOT NULL DEFAULT '',
  `file_extension` varchar(10) NOT NULL DEFAULT '',
  `section_sequence_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `option_value` varchar(255) NOT NULL DEFAULT '',
  `option_value2` varchar(40) NOT NULL DEFAULT '',
  `option_value3` varchar(40) NOT NULL DEFAULT '',
  `before_text` text,
  `after_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `info_contents`
--

INSERT INTO `info_contents` (`id`, `created`, `modified`, `info_id`, `block_type`, `position`, `title`, `content`, `image`, `image_2`, `image_3`, `image_pos`, `file`, `file_size`, `file_name`, `file_extension`, `section_sequence_id`, `option_value`, `option_value2`, `option_value3`, `before_text`, `after_text`) VALUES
(1, '2023-01-04 08:57:03', '2023-01-04 08:57:27', 3, '25', 1, '', NULL, 'img_1_310abfb3-6148-495e-a7d7-97ccdfd963d2.jpeg', '', '', '', '', 0, '', '', 0, '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `info_stock_tables`
--

CREATE TABLE `info_stock_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_slug` varchar(40) NOT NULL DEFAULT '',
  `model_name` varchar(40) NOT NULL DEFAULT '',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `info_tags`
--

CREATE TABLE `info_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `info_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tag_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `info_tops`
--

CREATE TABLE `info_tops` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `page_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `info_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `kvs`
--

CREATE TABLE `kvs` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `key_name` varchar(40) NOT NULL DEFAULT '',
  `val` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `member_chat`
--

CREATE TABLE `member_chat` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info_content_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `content` text,
  `info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `mst_lists`
--

CREATE TABLE `mst_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `position` decimal(10,0) NOT NULL COMMENT '表示順',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `ltrl_cd` varchar(60) DEFAULT NULL,
  `ltrl_val` varchar(60) DEFAULT NULL,
  `ltrl_sub_val` text,
  `slug` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `sys_cd` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `page_configs`
--

CREATE TABLE `page_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `site_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_title` varchar(100) NOT NULL DEFAULT '',
  `slug` varchar(40) NOT NULL DEFAULT '',
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `is_public_date` decimal(10,0) NOT NULL DEFAULT '0',
  `is_public_time` decimal(10,0) NOT NULL DEFAULT '0',
  `page_template_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
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
  `link_color` varchar(10) NOT NULL DEFAULT '',
  `parent_config_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `page_configs`
--

INSERT INTO `page_configs` (`id`, `created`, `modified`, `site_config_id`, `position`, `page_title`, `slug`, `header`, `footer`, `is_public_date`, `is_public_time`, `page_template_id`, `description`, `keywords`, `is_category`, `is_category_sort`, `is_category_multiple`, `is_category_multilevel`, `modified_category_role`, `max_multilevel`, `disable_position_order`, `disable_preview`, `is_auto_menu`, `list_style`, `root_dir_type`, `link_color`, `parent_config_id`) VALUES
(1, '2022-12-12 16:23:14', '2022-12-16 09:20:37', 1, 1, '新着情報', 'topics', '', '', '0', '0', 0, '', '', 'N', 'N', '0', '0', 1, 0, '0', '0', '1', '2', '0', '#000000', NULL),
(2, '2022-12-14 19:19:27', '2022-12-20 11:00:13', 1, 2, '導入事例', 'case', '', '', '0', '0', 0, '', '', 'Y', 'N', '0', '0', 1, 0, '0', '0', '1', '2', '0', '#000000', NULL),
(3, '2022-12-14 19:20:03', '2022-12-15 09:51:38', 1, 3, 'コラム', 'column', '', '', '0', '0', 0, '', '', 'N', 'N', '0', '0', 1, 0, '0', '0', '1', '1', '0', '#000000', NULL),
(5, '2022-12-16 09:56:13', '2022-12-23 18:17:10', 1, 4, '社員紹介', 'staff', '', '', '0', '0', 0, '', '', 'N', 'N', '0', '0', 1, 0, '0', '0', '1', '1', '0', '#000000', 0),
(6, '2022-12-22 09:55:12', '2022-12-22 12:20:03', 1, 5, '座談会メンバー', 'discussion_member', '', '', '0', '0', 0, '', '', 'N', 'N', '0', '0', 0, 0, '1', '1', '0', '1', '0', '#000000', 2),
(7, '2023-01-04 07:19:36', '2023-01-04 08:52:52', 1, 6, 'クライアント', 'client', '', '', '0', '0', 0, '', '', 'N', 'N', '0', '0', 1, 0, '0', '0', '1', '1', '0', '#000000', 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `page_config_extensions`
--

CREATE TABLE `page_config_extensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `page_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `type` decimal(10,0) NOT NULL DEFAULT '0',
  `option_value` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `page_config_extensions`
--

INSERT INTO `page_config_extensions` (`id`, `created`, `modified`, `page_config_id`, `position`, `status`, `type`, `option_value`, `name`, `link`) VALUES
(1, '2022-12-22 10:07:46', '2022-12-22 12:22:14', 2, 1, 'publish', '1', '', '座談会メンバー', '/user_admin/infos/?page_slug=discussion_member&parent_id=[%parent_id%]'),
(2, '2023-01-04 07:18:19', '2023-01-04 08:30:33', 2, 2, 'publish', '1', '', 'クライアント', '/user_admin/infos/edit/0?page_slug=client&parent_id=[%parent_id%]');

-- --------------------------------------------------------

--
-- テーブルの構造 `page_config_items`
--

CREATE TABLE `page_config_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `page_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `parts_type` enum('main','block','section') NOT NULL DEFAULT 'main',
  `item_key` varchar(40) NOT NULL DEFAULT '',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `memo` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(30) NOT NULL DEFAULT '',
  `sub_title` varchar(30) NOT NULL DEFAULT '',
  `editable_role` varchar(100) NOT NULL DEFAULT 'staff',
  `viewable_role` varchar(100) NOT NULL DEFAULT 'staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `page_config_items`
--

INSERT INTO `page_config_items` (`id`, `created`, `modified`, `page_config_id`, `position`, `parts_type`, `item_key`, `status`, `memo`, `title`, `sub_title`, `editable_role`, `viewable_role`) VALUES
(1, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 1, 'main', 'date', 'Y', '', '', '', 'staff', 'staff'),
(2, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 2, 'main', 'slug', 'N', '', '', '', 'staff', 'staff'),
(3, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 3, 'main', 'category', 'N', '', '', '', 'staff', 'staff'),
(4, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 4, 'main', 'title', 'Y', '', '', '', 'staff', 'staff'),
(5, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 5, 'main', 'notes', 'N', '', '', '', 'staff', 'staff'),
(6, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 6, 'main', 'image', 'N', '', '', '', 'staff', 'staff'),
(7, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 7, 'main', 'image_title', 'N', '', '', '', 'staff', 'staff'),
(8, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 8, 'main', 'view_table_content', 'N', '', '', '', 'staff', 'staff'),
(9, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 9, 'main', 'top_info', 'N', '', '', '', 'staff', 'staff'),
(10, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 10, 'main', 'index_type', 'N', '', '', '', 'staff', 'staff'),
(11, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 11, 'main', 'hash_tag', 'N', '', '', '', 'staff', 'staff'),
(12, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 12, 'main', 'meta', 'N', '', '', '', 'staff', 'staff'),
(13, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 13, 'main', 'status', 'Y', '', '', '', 'staff', 'staff'),
(14, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 14, 'block', 'all', 'Y', '', '', '', 'staff', 'staff'),
(15, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 16, 'block', 'title_h2', 'Y', '', '', '', 'staff', 'staff'),
(16, '2022-10-07 15:03:06', '2022-12-15 10:33:57', 1, 17, 'block', 'title', 'Y', '', '小見出し（H3）', '', 'staff', 'staff'),
(17, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 18, 'block', 'title_h4', 'Y', '', '', '', 'staff', 'staff'),
(18, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 19, 'block', 'title_h5', 'N', '', '', '', 'staff', 'staff'),
(19, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 20, 'block', 'content', 'Y', '', '', '', 'staff', 'staff'),
(20, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 21, 'block', 'wysiwyg_old', 'N', '', '', '', 'staff', 'staff'),
(21, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 22, 'block', 'image', 'Y', '', '', '', 'staff', 'staff'),
(22, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 23, 'block', 'file', 'Y', '', '', '', 'staff', 'staff'),
(23, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 24, 'block', 'button', 'Y', '', '', '', 'staff', 'staff'),
(24, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 25, 'block', 'button2', 'N', '', '', '', 'staff', 'staff'),
(25, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 27, 'block', 'line', 'N', '', '', '', 'staff', 'staff'),
(26, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 26, 'block', 'with_image', 'Y', '', '', '', 'staff', 'staff'),
(27, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 28, 'block', 'dialogue', 'N', '', '', '', 'staff', 'staff'),
(28, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 29, 'block', 'information', 'N', '', '', '', 'staff', 'staff'),
(29, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 30, 'section', 'all', 'N', '', '', '', 'staff', 'staff'),
(30, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 31, 'section', 'section_relation', 'N', '', '', '', 'staff', 'staff'),
(31, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 32, 'section', 'section', 'N', '', '', '', 'staff', 'staff'),
(32, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 1, 33, 'section', 'section_file', 'N', '', '', '', 'staff', 'staff'),
(33, '2022-10-14 16:31:40', '2022-10-14 16:35:13', 1, 15, 'block', 'title_h1', 'N', '', '', '', 'admin', 'admin'),
(34, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 37, 'main', 'date', 'N', '', '', '', 'staff', 'staff'),
(36, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 1, 'main', 'category', 'Y', '', '', '', 'staff', 'staff'),
(37, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 2, 'main', 'title', 'Y', '', '', '', 'staff', 'staff'),
(38, '2022-10-18 09:04:03', '2023-01-04 06:11:51', 2, 5, 'main', 'notes', 'Y', '', '詳細キャプション', '', 'staff', 'staff'),
(39, '2022-10-18 09:04:03', '2022-12-20 18:00:37', 2, 3, 'main', 'image', 'Y', '', '一覧画像', '', 'staff', 'staff'),
(41, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 17, 'main', 'view_table_content', 'N', '', '', '', 'staff', 'staff'),
(42, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 18, 'main', 'top_info', 'N', '', '', '', 'staff', 'staff'),
(43, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 19, 'main', 'index_type', 'N', '', '', '', 'staff', 'staff'),
(44, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 20, 'main', 'hash_tag', 'N', '', '', '', 'staff', 'staff'),
(45, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 21, 'main', 'meta', 'N', '', '', '', 'staff', 'staff'),
(46, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 22, 'main', 'status', 'N', '', '', '', 'staff', 'staff'),
(47, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 6, 'block', 'all', 'Y', '', '', '', 'staff', 'staff'),
(48, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 23, 'block', 'title_h1', 'N', '', '', '', 'staff', 'staff'),
(49, '2022-10-18 09:04:03', '2022-12-20 19:03:09', 2, 7, 'block', 'title', 'Y', '', '', '', 'staff', 'staff'),
(50, '2022-10-18 09:04:03', '2022-12-20 19:03:21', 2, 8, 'block', 'title_h4', 'Y', '', '', '', 'staff', 'staff'),
(51, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 24, 'block', 'title_h4', 'N', '', '', '', 'staff', 'staff'),
(52, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 25, 'block', 'title_h5', 'N', '', '', '', 'staff', 'staff'),
(53, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 10, 'block', 'content', 'Y', '', '', '', 'staff', 'staff'),
(54, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 26, 'block', 'wysiwyg_old', 'N', '', '', '', 'staff', 'staff'),
(55, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 27, 'block', 'image', 'N', '', '', '', 'staff', 'staff'),
(56, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 28, 'block', 'file', 'N', '', '', '', 'staff', 'staff'),
(57, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 29, 'block', 'button', 'N', '', '', '', 'staff', 'staff'),
(58, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 30, 'block', 'button2', 'N', '', '', '', 'staff', 'staff'),
(59, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 31, 'block', 'line', 'N', '', '', '', 'staff', 'staff'),
(60, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 11, 'block', 'with_image', 'Y', '', '', '', 'staff', 'staff'),
(61, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 32, 'block', 'dialogue', 'N', '', '', '', 'staff', 'staff'),
(62, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 33, 'block', 'information', 'N', '', '', '', 'staff', 'staff'),
(63, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 34, 'section', 'all', 'N', '', '', '', 'staff', 'staff'),
(64, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 35, 'section', 'section_relation', 'N', '', '', '', 'staff', 'staff'),
(65, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 36, 'section', 'section', 'N', '', '', '', 'staff', 'staff'),
(66, '2022-10-18 09:04:03', '2022-10-18 09:04:03', 2, 37, 'section', 'section_file', 'N', '', '', '', 'staff', 'staff'),
(67, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 1, 'main', 'date', 'Y', '', '', '', 'staff', 'staff'),
(68, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 2, 'main', 'slug', 'N', '', '', '', 'staff', 'staff'),
(69, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 3, 'main', 'category', 'N', '', '', '', 'staff', 'staff'),
(70, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 4, 'main', 'title', 'Y', '', '', '', 'staff', 'staff'),
(71, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 5, 'main', 'notes', 'Y', '', '', '', 'staff', 'staff'),
(72, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 6, 'main', 'image', 'Y', '', '', '', 'staff', 'staff'),
(73, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 7, 'main', 'image_title', 'N', '', '', '', 'staff', 'staff'),
(74, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 8, 'main', 'view_table_content', 'N', '', '', '', 'staff', 'staff'),
(75, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 9, 'main', 'top_info', 'N', '', '', '', 'staff', 'staff'),
(76, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 10, 'main', 'index_type', 'N', '', '', '', 'staff', 'staff'),
(77, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 11, 'main', 'hash_tag', 'N', '', '', '', 'staff', 'staff'),
(78, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 12, 'main', 'meta', 'N', '', '', '', 'staff', 'staff'),
(79, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 13, 'main', 'status', 'Y', '', '', '', 'staff', 'staff'),
(80, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 14, 'block', 'all', 'Y', '', '', '', 'staff', 'staff'),
(81, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 15, 'block', 'title_h1', 'N', '', '', '', 'staff', 'staff'),
(82, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 16, 'block', 'title_h2', 'Y', '', '', '', 'staff', 'staff'),
(83, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 17, 'block', 'title', 'Y', '', '', '', 'staff', 'staff'),
(84, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 18, 'block', 'title_h4', 'Y', '', '', '', 'staff', 'staff'),
(85, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 19, 'block', 'title_h5', 'N', '', '', '', 'staff', 'staff'),
(86, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 20, 'block', 'content', 'Y', '', '', '', 'staff', 'staff'),
(87, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 21, 'block', 'wysiwyg_old', 'N', '', '', '', 'staff', 'staff'),
(88, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 22, 'block', 'image', 'Y', '', '', '', 'staff', 'staff'),
(89, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 23, 'block', 'file', 'Y', '', '', '', 'staff', 'staff'),
(90, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 24, 'block', 'button', 'Y', '', '', '', 'staff', 'staff'),
(91, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 25, 'block', 'button2', 'N', '', '', '', 'staff', 'staff'),
(92, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 26, 'block', 'line', 'N', '', '', '', 'staff', 'staff'),
(93, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 27, 'block', 'with_image', 'Y', '', '', '', 'staff', 'staff'),
(94, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 28, 'block', 'dialogue', 'N', '', '', '', 'staff', 'staff'),
(95, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 29, 'block', 'information', 'N', '', '', '', 'staff', 'staff'),
(96, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 30, 'section', 'all', 'N', '', '', '', 'staff', 'staff'),
(97, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 31, 'section', 'section_relation', 'N', '', '', '', 'staff', 'staff'),
(98, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 32, 'section', 'section', 'N', '', '', '', 'staff', 'staff'),
(99, '2022-10-20 14:15:50', '2022-10-20 14:15:50', 3, 33, 'section', 'section_file', 'N', '', '', '', 'staff', 'staff'),
(100, '2022-10-07 15:03:06', '2022-10-07 15:03:06', 2, 16, 'main', 'image_title', 'N', '', '', '', 'staff', 'staff'),
(101, '2022-12-15 12:27:14', '2022-12-15 12:28:40', 4, 1, 'block', 'all', 'Y', '', '', '', 'staff', 'staff'),
(102, '2022-12-15 12:27:43', '2022-12-15 12:27:43', 4, 2, 'main', 'title', 'N', '', '', '', 'staff', 'staff'),
(103, '2022-12-16 09:58:32', '2022-12-16 09:58:32', 5, 1, 'main', 'image', 'Y', '', '一覧画像', '', 'staff', 'staff'),
(108, '2022-12-16 10:09:09', '2022-12-26 12:07:56', 5, 2, 'block', 'title_h4', 'Y', 'question', 'Q.', '', 'staff', 'staff'),
(109, '2022-12-16 10:10:31', '2022-12-16 10:10:31', 5, 3, 'block', 'content', 'Y', '', 'A.', '', 'staff', 'staff'),
(110, '2022-12-16 18:20:02', '2022-12-16 18:20:02', 5, 4, 'block', 'all', 'Y', '', '', '', 'staff', 'staff'),
(111, '2022-12-21 12:12:40', '2022-12-21 12:12:40', 2, 12, 'block', 'before_after', 'Y', '', 'Before・After', '', 'staff', 'staff'),
(112, '2022-12-21 14:51:51', '2022-12-21 14:52:23', 2, 13, 'block', 'DISCUSSION_CHAT', 'Y', '', '', '', 'staff', 'staff'),
(113, '2022-12-21 14:52:03', '2022-12-21 14:52:03', 2, 14, 'block', 'DISCUSSION_MEMBER', 'Y', '', '', '', 'staff', 'staff'),
(114, '2022-12-22 10:01:07', '2022-12-22 10:01:07', 6, 1, 'main', 'title', 'Y', '', 'お名前', '', 'staff', 'staff'),
(115, '2022-12-22 10:05:31', '2022-12-27 13:14:58', 6, 2, 'main', 'image', 'Y', '', 'アバター', '', 'staff', 'staff'),
(118, '2022-12-23 12:53:19', '2022-12-23 12:53:37', 2, 15, 'block', 'MANY_IMG', 'N', '', '', '', 'staff', 'staff'),
(119, '2022-12-26 12:08:04', '2022-12-26 12:08:04', 5, 5, 'main', 'notes', 'Y', '', '', '', 'staff', 'staff'),
(120, '2022-12-26 14:52:42', '2022-12-26 14:52:42', 2, 9, 'block', 'text_img', 'N', '', '', '', 'staff', 'staff'),
(121, '2022-12-26 17:52:04', '2022-12-26 17:52:04', 6, 3, 'main', 'radio', 'Y', '', '色', '', 'staff', 'staff'),
(122, '2022-12-27 13:18:39', '2022-12-27 13:19:02', 6, 4, 'main', 'date', 'N', '', '', '', 'staff', 'staff'),
(123, '2023-01-04 07:26:01', '2023-01-04 07:28:40', 7, 1, 'block', 'MANY_IMG', 'Y', '', '', '', 'staff', 'staff'),
(124, '2023-01-04 07:27:36', '2023-01-04 07:27:36', 7, 2, 'block', 'all', 'Y', '', '', '', 'staff', 'staff');

-- --------------------------------------------------------

--
-- テーブルの構造 `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20221208022223, 'Initial', '2022-12-08 08:55:06', '2022-12-08 08:55:07', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `date` date NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `memo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `schedules`
--

INSERT INTO `schedules` (`id`, `created`, `modified`, `date`, `status`, `memo`) VALUES
(1, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-01', '1', ''),
(2, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-02', '1', ''),
(3, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-08', '1', ''),
(4, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-09', '1', ''),
(5, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-10', '1', ''),
(6, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-15', '1', ''),
(7, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-16', '1', ''),
(8, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-22', '1', ''),
(9, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-23', '1', ''),
(10, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-29', '1', ''),
(11, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-01-30', '1', ''),
(12, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-05', '1', ''),
(13, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-06', '1', ''),
(14, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-11', '1', ''),
(15, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-12', '1', ''),
(16, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-13', '1', ''),
(17, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-19', '1', ''),
(18, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-20', '1', ''),
(19, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-23', '1', ''),
(20, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-26', '1', ''),
(21, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-02-27', '1', ''),
(22, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-03-05', '1', ''),
(23, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-03-06', '1', ''),
(24, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-03-12', '1', ''),
(25, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-03-13', '1', ''),
(26, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-03-19', '1', ''),
(27, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-03-20', '1', ''),
(28, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-03-26', '1', ''),
(29, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-03-27', '1', ''),
(30, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-02', '1', ''),
(31, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-03', '1', ''),
(32, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-09', '1', ''),
(33, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-10', '1', ''),
(34, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-16', '1', ''),
(35, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-17', '1', ''),
(36, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-23', '1', ''),
(37, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-24', '1', ''),
(38, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-29', '1', ''),
(39, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-04-30', '1', ''),
(40, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-01', '1', ''),
(41, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-03', '1', ''),
(42, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-04', '1', ''),
(43, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-05', '1', ''),
(44, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-07', '1', ''),
(45, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-08', '1', ''),
(46, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-14', '1', ''),
(47, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-15', '1', ''),
(48, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-21', '1', ''),
(49, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-22', '1', ''),
(50, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-28', '1', ''),
(51, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-05-29', '1', ''),
(52, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-06-04', '1', ''),
(53, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-06-05', '1', ''),
(54, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-06-11', '1', ''),
(55, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-06-12', '1', ''),
(56, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-06-18', '1', ''),
(57, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-06-19', '1', ''),
(58, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-06-25', '1', ''),
(59, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-06-26', '1', ''),
(60, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-02', '1', ''),
(61, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-03', '1', ''),
(62, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-09', '1', ''),
(63, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-10', '1', ''),
(64, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-16', '1', ''),
(65, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-17', '1', ''),
(66, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-18', '1', ''),
(67, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-23', '1', ''),
(68, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-24', '1', ''),
(69, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-30', '1', ''),
(70, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-07-31', '1', ''),
(71, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-06', '1', ''),
(72, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-07', '1', ''),
(73, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-11', '1', ''),
(74, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-13', '1', ''),
(75, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-14', '1', ''),
(76, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-20', '1', ''),
(77, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-21', '1', ''),
(78, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-27', '1', ''),
(79, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-08-28', '1', ''),
(80, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-03', '1', ''),
(81, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-04', '1', ''),
(82, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-10', '1', ''),
(83, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-11', '1', ''),
(84, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-17', '1', ''),
(85, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-18', '1', ''),
(86, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-19', '1', ''),
(87, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-24', '1', ''),
(88, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-09-25', '1', ''),
(89, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-01', '1', ''),
(90, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-02', '1', ''),
(91, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-08', '1', ''),
(92, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-09', '1', ''),
(93, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-10', '1', ''),
(94, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-15', '1', ''),
(95, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-16', '1', ''),
(96, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-22', '1', ''),
(97, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-23', '1', ''),
(98, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-29', '1', ''),
(99, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-10-30', '1', ''),
(100, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-03', '1', ''),
(101, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-05', '1', ''),
(102, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-06', '1', ''),
(103, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-12', '1', ''),
(104, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-13', '1', ''),
(105, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-19', '1', ''),
(106, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-20', '1', ''),
(107, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-23', '1', ''),
(108, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-26', '1', ''),
(109, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-11-27', '1', ''),
(110, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-03', '1', ''),
(111, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-04', '1', ''),
(112, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-10', '1', ''),
(113, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-11', '1', ''),
(114, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-17', '1', ''),
(115, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-18', '1', ''),
(116, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-24', '1', ''),
(117, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-25', '1', ''),
(118, '2022-12-08 18:06:21', '2022-12-08 18:06:21', '2022-12-31', '1', ''),
(119, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-01', '1', ''),
(120, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-02', '1', ''),
(121, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-07', '1', ''),
(122, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-08', '1', ''),
(123, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-09', '1', ''),
(124, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-14', '1', ''),
(125, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-15', '1', ''),
(126, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-21', '1', ''),
(127, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-22', '1', ''),
(128, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-28', '1', ''),
(129, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-01-29', '1', ''),
(130, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-04', '1', ''),
(131, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-05', '1', ''),
(132, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-11', '1', ''),
(133, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-12', '1', ''),
(134, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-18', '1', ''),
(135, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-19', '1', ''),
(136, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-23', '1', ''),
(137, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-25', '1', ''),
(138, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-02-26', '1', ''),
(139, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-03-04', '1', ''),
(140, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-03-05', '1', ''),
(141, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-03-11', '1', ''),
(142, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-03-12', '1', ''),
(143, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-03-18', '1', ''),
(144, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-03-19', '1', ''),
(145, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-03-25', '1', ''),
(146, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-03-26', '1', ''),
(147, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-01', '1', ''),
(148, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-02', '1', ''),
(149, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-08', '1', ''),
(150, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-09', '1', ''),
(151, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-15', '1', ''),
(152, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-16', '1', ''),
(153, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-22', '1', ''),
(154, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-23', '1', ''),
(155, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-29', '1', ''),
(156, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-04-30', '1', ''),
(157, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-03', '1', ''),
(158, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-04', '1', ''),
(159, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-05', '1', ''),
(160, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-06', '1', ''),
(161, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-07', '1', ''),
(162, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-13', '1', ''),
(163, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-14', '1', ''),
(164, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-20', '1', ''),
(165, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-21', '1', ''),
(166, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-27', '1', ''),
(167, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-05-28', '1', ''),
(168, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-06-03', '1', ''),
(169, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-06-04', '1', ''),
(170, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-06-10', '1', ''),
(171, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-06-11', '1', ''),
(172, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-06-17', '1', ''),
(173, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-06-18', '1', ''),
(174, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-06-24', '1', ''),
(175, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-06-25', '1', ''),
(176, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-01', '1', ''),
(177, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-02', '1', ''),
(178, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-08', '1', ''),
(179, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-09', '1', ''),
(180, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-15', '1', ''),
(181, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-16', '1', ''),
(182, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-17', '1', ''),
(183, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-22', '1', ''),
(184, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-23', '1', ''),
(185, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-29', '1', ''),
(186, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-07-30', '1', ''),
(187, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-05', '1', ''),
(188, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-06', '1', ''),
(189, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-11', '1', ''),
(190, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-12', '1', ''),
(191, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-13', '1', ''),
(192, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-19', '1', ''),
(193, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-20', '1', ''),
(194, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-26', '1', ''),
(195, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-08-27', '1', ''),
(196, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-02', '1', ''),
(197, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-03', '1', ''),
(198, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-09', '1', ''),
(199, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-10', '1', ''),
(200, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-16', '1', ''),
(201, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-17', '1', ''),
(202, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-18', '1', ''),
(203, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-23', '1', ''),
(204, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-24', '1', ''),
(205, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-09-30', '1', ''),
(206, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-01', '1', ''),
(207, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-07', '1', ''),
(208, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-08', '1', ''),
(209, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-09', '1', ''),
(210, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-14', '1', ''),
(211, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-15', '1', ''),
(212, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-21', '1', ''),
(213, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-22', '1', ''),
(214, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-28', '1', ''),
(215, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-10-29', '1', ''),
(216, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-03', '1', ''),
(217, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-04', '1', ''),
(218, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-05', '1', ''),
(219, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-11', '1', ''),
(220, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-12', '1', ''),
(221, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-18', '1', ''),
(222, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-19', '1', ''),
(223, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-23', '1', ''),
(224, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-25', '1', ''),
(225, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-11-26', '1', ''),
(226, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-02', '1', ''),
(227, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-03', '1', ''),
(228, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-09', '1', ''),
(229, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-10', '1', ''),
(230, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-16', '1', ''),
(231, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-17', '1', ''),
(232, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-23', '1', ''),
(233, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-24', '1', ''),
(234, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-30', '1', ''),
(235, '2022-12-08 18:28:51', '2022-12-08 18:28:51', '2023-12-31', '1', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `section_sequences`
--

CREATE TABLE `section_sequences` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `info_content_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `section_sequences`
--

INSERT INTO `section_sequences` (`id`, `created`, `modified`, `info_content_id`) VALUES
(1, '2022-12-14 19:04:37', '2022-12-14 19:04:37', 0),
(2, '2022-12-15 10:43:35', '2022-12-15 10:43:35', 0),
(3, '2022-12-27 09:01:38', '2022-12-27 09:01:38', 0),
(4, '2022-12-27 09:02:07', '2022-12-27 09:02:07', 0),
(5, '2022-12-27 09:02:11', '2022-12-27 09:02:11', 0),
(6, '2022-12-27 09:02:40', '2022-12-27 10:51:09', 118);

-- --------------------------------------------------------

--
-- テーブルの構造 `site_configs`
--

CREATE TABLE `site_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'draft',
  `site_name` varchar(100) NOT NULL DEFAULT '',
  `slug` varchar(40) NOT NULL DEFAULT '',
  `is_root` decimal(10,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `site_configs`
--

INSERT INTO `site_configs` (`id`, `created`, `modified`, `position`, `status`, `site_name`, `slug`, `is_root`) VALUES
(1, '2022-12-08 18:30:49', '2022-12-08 18:30:49', 1, 'publish', 'アトムエンジニアリング', '', '1');

-- --------------------------------------------------------

--
-- テーブルの構造 `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `tag` varchar(40) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `page_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `useradmins`
--

CREATE TABLE `useradmins` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `email` varchar(200) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(200) NOT NULL DEFAULT '',
  `temp_password` varchar(40) NOT NULL DEFAULT '',
  `temp_pass_expired` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `temp_key` varchar(200) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `face_image` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `useradmins`
--

INSERT INTO `useradmins` (`id`, `created`, `modified`, `email`, `username`, `password`, `temp_password`, `temp_pass_expired`, `temp_key`, `name`, `status`, `face_image`, `role`) VALUES
(1, '2022-12-08 18:28:07', '2022-12-08 18:30:57', '', 'develop', '', 'caters040917', '1900-01-01 00:00:00', '', '開発', 'publish', '', 0),
(2, '2022-12-08 18:28:07', '2022-12-08 18:30:57', '', 'admin', '', 'g05kHonV', '1900-01-01 00:00:00', '', '管理者', 'publish', '', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `useradmin_sites`
--

CREATE TABLE `useradmin_sites` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `useradmin_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `site_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `useradmin_sites`
--

INSERT INTO `useradmin_sites` (`id`, `created`, `modified`, `useradmin_id`, `site_config_id`) VALUES
(1, '2022-12-08 18:30:57', '2022-12-08 18:30:57', 1, 1),
(2, '2022-12-08 18:30:57', '2022-12-08 18:30:57', 2, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `__page_config_items`
--

CREATE TABLE `__page_config_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modifed` datetime DEFAULT NULL,
  `page_config_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `parts_type` varchar(10) NOT NULL DEFAULT 'main',
  `item_key` varchar(40) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT 'Y',
  `memo` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(30) NOT NULL DEFAULT '',
  `sub_title` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `__page_config_items`
--

INSERT INTO `__page_config_items` (`id`, `created`, `modifed`, `page_config_id`, `position`, `parts_type`, `item_key`, `status`, `memo`, `title`, `sub_title`) VALUES
(1, '2022-12-14 19:00:40', NULL, 1, 1, 'block', 'all', 'Y', '', '', ''),
(2, '2022-12-14 19:03:45', NULL, 1, 22, 'main', 'title', 'Y', '', '', ''),
(3, '2022-12-14 19:03:53', NULL, 1, 3, 'main', 'notes', '0', '', '', ''),
(4, '2022-12-14 19:04:08', NULL, 1, 4, 'main', 'image', '0', '', '一覧画像', ''),
(5, '2022-12-14 19:04:16', NULL, 1, 5, 'main', 'image_title', 'N', '', '', ''),
(6, '2022-12-14 19:04:22', NULL, 1, 6, 'main', 'index_type', '0', '', '', ''),
(7, '2022-12-14 19:05:06', NULL, 1, 7, 'main', 'hash_tag', '0', '', '', ''),
(8, '2022-12-14 19:05:14', NULL, 1, 8, 'main', 'meta', '0', '', '', ''),
(9, '2022-12-14 19:05:32', NULL, 1, 9, 'block', 'title', 'Y', '', '小見出し（H3）', ''),
(10, '2022-12-14 19:05:43', NULL, 1, 10, 'block', 'title_h4', 'Y', '', '小見出し（H4）', ''),
(11, '2022-12-14 19:05:52', NULL, 1, 11, 'block', 'content', 'Y', '', '', ''),
(12, '2022-12-14 19:06:11', NULL, 1, 12, 'block', 'image', 'Y', '', '', ''),
(13, '2022-12-14 19:06:19', NULL, 1, 13, 'block', 'file', 'Y', '', '', ''),
(14, '2022-12-14 19:06:37', NULL, 1, 14, 'block', 'button', 'Y', '', '', ''),
(15, '2022-12-14 19:06:45', NULL, 1, 15, 'block', 'line', '0', '', '', ''),
(16, '2022-12-14 19:06:55', NULL, 1, 16, 'block', 'with_image', 'Y', '', '', ''),
(17, '2022-12-14 19:07:44', NULL, 1, 17, 'section', 'all', 'Y', '', '', ''),
(18, '2022-12-14 19:08:12', NULL, 1, 18, 'section', 'section', '0', '', '', ''),
(19, '2022-12-14 19:08:23', NULL, 1, 19, 'section', 'section_file', '0', '', '', ''),
(20, '2022-12-14 19:08:40', NULL, 1, 20, 'section', 'section_relation', '0', '', '', ''),
(21, '2022-12-14 19:10:32', NULL, 1, 21, 'block', 'title_h2', 'Y', '', '', ''),
(22, '2022-12-15 08:47:43', NULL, 1, 2, 'main', 'category', 'N', '', '', '');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- テーブルのインデックス `append_items`
--
ALTER TABLE `append_items`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `infos`
--
ALTER TABLE `infos`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `info_append_items`
--
ALTER TABLE `info_append_items`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `info_categories`
--
ALTER TABLE `info_categories`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `info_contents`
--
ALTER TABLE `info_contents`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `info_stock_tables`
--
ALTER TABLE `info_stock_tables`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `info_tags`
--
ALTER TABLE `info_tags`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `info_tops`
--
ALTER TABLE `info_tops`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `kvs`
--
ALTER TABLE `kvs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `member_chat`
--
ALTER TABLE `member_chat`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `mst_lists`
--
ALTER TABLE `mst_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sys_cd` (`sys_cd`,`slug`,`ltrl_cd`),
  ADD KEY `sys_cd_2` (`sys_cd`,`slug`);

--
-- テーブルのインデックス `page_configs`
--
ALTER TABLE `page_configs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `page_config_extensions`
--
ALTER TABLE `page_config_extensions`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `page_config_items`
--
ALTER TABLE `page_config_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_config_id` (`page_config_id`);

--
-- テーブルのインデックス `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- テーブルのインデックス `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `section_sequences`
--
ALTER TABLE `section_sequences`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `site_configs`
--
ALTER TABLE `site_configs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `useradmins`
--
ALTER TABLE `useradmins`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `useradmin_sites`
--
ALTER TABLE `useradmin_sites`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `__page_config_items`
--
ALTER TABLE `__page_config_items`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `append_items`
--
ALTER TABLE `append_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- テーブルの AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `infos`
--
ALTER TABLE `infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `info_append_items`
--
ALTER TABLE `info_append_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- テーブルの AUTO_INCREMENT `info_categories`
--
ALTER TABLE `info_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_contents`
--
ALTER TABLE `info_contents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `info_stock_tables`
--
ALTER TABLE `info_stock_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_tags`
--
ALTER TABLE `info_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_tops`
--
ALTER TABLE `info_tops`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `kvs`
--
ALTER TABLE `kvs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `member_chat`
--
ALTER TABLE `member_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `mst_lists`
--
ALTER TABLE `mst_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `page_configs`
--
ALTER TABLE `page_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `page_config_extensions`
--
ALTER TABLE `page_config_extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `page_config_items`
--
ALTER TABLE `page_config_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- テーブルの AUTO_INCREMENT `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- テーブルの AUTO_INCREMENT `section_sequences`
--
ALTER TABLE `section_sequences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `site_configs`
--
ALTER TABLE `site_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `useradmins`
--
ALTER TABLE `useradmins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `useradmin_sites`
--
ALTER TABLE `useradmin_sites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `__page_config_items`
--
ALTER TABLE `__page_config_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;
