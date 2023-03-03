-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2023 年 3 月 03 日 10:39
-- サーバのバージョン： 5.7.34
-- PHP のバージョン: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- データベース: `shioya_iju`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `admins`
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
-- テーブルのデータのダンプ `admins`
--

INSERT INTO `admins` (`id`, `created`, `modified`, `name`, `username`, `password`, `role`) VALUES
(1, '2022-12-08 17:55:21', '2022-12-08 17:55:21', '管理者', 'caters_admin', '$2y$10$7X.icRPhUBnFrsoBR784y.VMC9IrXxbbinEff3WMGa0N.WG3D8kH6', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `append_items`
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
  `max_length` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_required` decimal(10,0) UNSIGNED NOT NULL DEFAULT '0',
  `mst_list_slug` varchar(40) DEFAULT NULL,
  `value_default` varchar(100) DEFAULT NULL,
  `attention` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
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
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `created`, `modified`, `page_config_id`, `parent_category_id`, `position`, `status`, `name`, `identifier`, `image`, `cate_color`) VALUES
(1, '2023-03-03 00:08:58', '2023-03-03 00:08:58', 1, 0, 1, 'publish', 'カテゴリカテゴリカテゴリ', NULL, NULL, NULL),
(2, '2023-03-03 00:48:36', '2023-03-03 00:48:36', 2, 0, 1, 'publish', 'column', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `infos`
--

CREATE TABLE `infos` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `page_config_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'publish',
  `title` varchar(255) NOT NULL,
  `notes` text,
  `start_datetime` datetime DEFAULT NULL,
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
-- テーブルのデータのダンプ `infos`
--

INSERT INTO `infos` (`id`, `created`, `modified`, `page_config_id`, `position`, `status`, `title`, `notes`, `start_datetime`, `start_date`, `start_time`, `end_date`, `end_time`, `image`, `file`, `file_name`, `file_size`, `file_extension`, `meta_description`, `meta_keywords`, `regist_user_id`, `category_id`, `index_type`, `multi_position`, `parent_info_id`, `value_text`, `popular`, `top_slide_display`) VALUES
(1, '2023-03-03 00:11:34', '2023-03-03 00:53:50', 1, 1, 'publish', 'タイトルタイトルタイトルタイトル', NULL, '2023-03-03 00:00:00', NULL, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2023-03-03 00:49:20', '2023-03-03 00:59:07', 2, 2, 'publish', 'タイトル', 'タイトルタイトルタイトルタイトルタイトル\r\n\r\nタイトルタイトルタイトルタイトルタイトル', '2023-03-03 00:00:00', NULL, '0', NULL, '0', 'img_2_1f6513b2-1654-489c-9f08-be6455c12b28.jpeg', NULL, NULL, NULL, NULL, NULL, '', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2023-03-03 00:59:07', '2023-03-03 01:02:48', 2, 1, 'publish', 'aaaasddf', 'aa', '2023-03-03 00:00:00', NULL, '0', NULL, '0', 'img_4_9e654aff-8347-4915-817d-5ab885ae7acb.jpeg', NULL, NULL, NULL, NULL, NULL, '', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `info_append_items`
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
-- テーブルの構造 `info_categories`
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
-- テーブルの構造 `info_contents`
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
  `image_2` varchar(100) DEFAULT NULL,
  `image_3` varchar(100) DEFAULT NULL,
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

--
-- テーブルのデータのダンプ `info_contents`
--

INSERT INTO `info_contents` (`id`, `created`, `modified`, `info_id`, `block_type`, `position`, `title`, `h2`, `content`, `image`, `image_2`, `image_3`, `image_pos`, `file`, `file_size`, `file_name`, `file_extension`, `section_sequence_id`, `option_value`, `option_value2`, `option_value3`, `before_text`, `after_text`) VALUES
(1, '2023-03-03 00:11:34', '2023-03-03 00:11:34', 1, '7', 1, NULL, '※横幅700以上を推奨。1200x1200以内に縮小されます。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(2, '2023-03-03 00:11:34', '2023-03-03 00:11:34', 1, '1', 2, '＜H3＞見出しが入ります。＜H3＞見出しが入ります。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(3, '2023-03-03 00:11:34', '2023-03-03 00:11:34', 1, '2', 3, NULL, NULL, '<p><strong>本文</strong></p><p><u>本文</u></p><p><s>本文</s></p><p><i>本文</i></p><p><span style=\"color:hsl(0, 75%, 60%);\">本文</span></p><p><span style=\"color:hsl(180, 75%, 60%);\">本文</span></p><ul><li>本文</li><li>本文</li></ul><p>&nbsp;</p><ol><li>本文</li><li>本文</li></ol><p class=\"text-right\">本文</p><p class=\"text-center\">本文本文</p><p>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td>本文本文</td><td>本文本文</td><td>本文本文</td><td>本文本文</td></tr><tr><td>本文本文</td><td>本文本文</td><td>本文本文</td><td>本文本文</td></tr></tbody></table></figure><p>&nbsp;</p><p>本文本文</p><p>本文本文</p><p>本文本文</p><p>本文本文</p><p>本文本文</p><p>本文本文</p><p>本文本文</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', NULL, NULL, NULL),
(4, '2023-03-03 00:11:34', '2023-03-03 00:11:36', 1, '3', 4, NULL, NULL, '', 'img_4_a1f4ec29-8168-4183-8961-c90f86a495c1.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '_self', NULL, NULL, NULL, NULL),
(5, '2023-03-03 00:11:36', '2023-03-03 00:11:36', 1, '4', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e_f_5_8446eee7-6f11-4107-806a-cff862c3bfb0.pdf', 98045, '勤怠届原紙 勤怠届原紙 勤怠届原紙 勤怠届原紙 勤怠届原紙 勤怠届原紙 勤怠届原紙 ', 'pdf', 0, NULL, NULL, NULL, NULL, NULL),
(6, '2023-03-03 00:11:36', '2023-03-03 00:11:36', 1, '8', 6, 'リンクボタン', NULL, 'https://shioya-iju.caters.jp/user_admin/infos/edit/29?sch_page_id=1&sch_category_id=0&pos=0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '_self', NULL, NULL, NULL),
(7, '2023-03-03 00:11:36', '2023-03-03 00:11:36', 1, '9', 7, '', NULL, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(8, '2023-03-03 00:11:36', '2023-03-03 00:11:36', 1, '15', 8, '', NULL, 'memo', NULL, NULL, NULL, '', NULL, 0, '', NULL, 0, NULL, '', '', NULL, NULL),
(9, '2023-03-03 00:53:24', '2023-03-03 00:56:53', 2, '7', 1, NULL, '※横幅700以上を推奨。1200x1200以内に縮小されます。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(10, '2023-03-03 00:53:24', '2023-03-03 00:56:53', 2, '1', 2, '＜H3＞見出しが入ります。＜H3＞見出しが入ります。', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(11, '2023-03-03 00:53:24', '2023-03-03 00:56:53', 2, '2', 3, NULL, NULL, '<p><strong>本文</strong></p><p><u>本文</u></p><p><s>本文</s></p><p><i>本文</i></p><p><span style=\"color:hsl(0,75%,60%);\">本文</span></p><p><span style=\"color:hsl(180,75%,60%);\">本文</span></p><ul><li>本文</li><li>本文</li></ul><p>&nbsp;</p><ol><li>本文</li><li>本文</li></ol><p class=\"text-right\">本文</p><p class=\"text-center\">本文本文</p><p>&nbsp;</p><figure class=\"table\"><table><tbody><tr><td>本文本文</td><td>本文本文</td><td>本文本文</td><td>本文本文</td></tr><tr><td>本文本文</td><td>本文本文</td><td>本文本文</td><td>本文本文</td></tr></tbody></table></figure><p>&nbsp;</p><p>本文本文</p><p>本文本文</p><p>本文本文</p><p>本文本文</p><p>本文本文</p><p>本文本文</p><p>本文本文</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', NULL, NULL, NULL),
(12, '2023-03-03 00:53:24', '2023-03-03 00:56:53', 2, '3', 4, NULL, NULL, '', 'img_12_16b09297-802e-4346-88b4-b214b4194724.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '_self', NULL, NULL, NULL, NULL),
(13, '2023-03-03 00:53:25', '2023-03-03 00:56:53', 2, '4', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e_f_13_9d5d27e5-1cbc-438c-82fb-7eb901b3cc07.xlsx', 5425, 'file_example_XLSX_10', 'xlsx', 0, NULL, NULL, NULL, NULL, NULL),
(14, '2023-03-03 00:53:25', '2023-03-03 00:56:53', 2, '8', 6, 'リンクボタン', NULL, 'https://www.clapp.edu.kh/home', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '_self', NULL, NULL, NULL),
(15, '2023-03-03 00:53:25', '2023-03-03 00:56:53', 2, '9', 7, '', NULL, '', 'img_15_af955beb-2cbf-4ba6-9631-b3bc1864e021.jpeg', NULL, NULL, '', NULL, 0, '', NULL, 0, NULL, '', '', NULL, NULL),
(16, '2023-03-03 00:53:26', '2023-03-03 00:56:53', 2, '15', 8, '', NULL, 'memo', NULL, NULL, NULL, '', NULL, 0, '', NULL, 0, NULL, '', '', NULL, NULL),
(17, '2023-03-03 00:53:26', '2023-03-03 00:56:53', 2, '16', 9, '', NULL, '※jpeg , jpg , gif , png ファイルのみ\r\n※横幅700以上を推奨。1200x1200以内に縮小されます。\r\n※ファイルサイズ5MB以内', 'img_17_bf828ac5-d43e-4cfd-9984-1b94554ceff7.jpeg', NULL, NULL, '', NULL, 0, '', NULL, 0, NULL, '', 'left', NULL, NULL),
(18, '2023-03-03 00:53:27', '2023-03-03 00:56:53', 2, '16', 10, '', NULL, '※jpeg , jpg , gif , png ファイルのみ\r\n※横幅700以上を推奨。1200x1200以内に縮小されます。\r\n※ファイルサイズ5MB以内', 'img_18_98574fa9-a992-4e64-909f-40064e8cadec.jpeg', NULL, NULL, '', NULL, 0, '', NULL, 0, NULL, '', 'right', NULL, NULL),
(19, '2023-03-03 00:53:27', '2023-03-03 00:56:53', 2, '17', 11, 'Ba Be', NULL, '※jpeg , jpg , gif , png ファイルのみ\r\n※横幅700以上を推奨。1200x1200以内に縮小されます。\r\n※ファイルサイズ5MB以内', 'img_19_8f1a93b5-67eb-4208-9dc1-7049194952bd.jpeg', NULL, NULL, '', NULL, 0, '', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(20, '2023-03-03 00:53:27', '2023-03-03 00:56:53', 2, '19', 12, NULL, NULL, 'https://www.youtube.com/watch?v=qcwFrYFVhoA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1', 'youtube', NULL, NULL),
(21, '2023-03-03 00:59:07', '2023-03-03 00:59:07', 4, '19', 1, NULL, NULL, 'https://www.youtube.com/watch?v=qcwFrYFVhoA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1', 'youtube', NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `info_stock_tables`
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
-- テーブルの構造 `info_tags`
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
-- テーブルの構造 `info_tops`
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
-- テーブルの構造 `kvs`
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
-- テーブルの構造 `mst_lists`
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
-- テーブルの構造 `page_configs`
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
-- テーブルのデータのダンプ `page_configs`
--

INSERT INTO `page_configs` (`id`, `created`, `modified`, `site_config_id`, `position`, `page_title`, `slug`, `header`, `footer`, `is_public_date`, `is_public_time`, `page_template_id`, `description`, `keywords`, `is_category`, `is_category_sort`, `is_category_multiple`, `is_category_multilevel`, `modified_category_role`, `max_multilevel`, `disable_position_order`, `disable_preview`, `is_auto_menu`, `list_style`, `root_dir_type`, `link_color`, `parent_config_id`) VALUES
(1, '2023-02-02 06:46:26', '2023-02-02 15:57:37', 1, 1, 'お知らせ', 'news', NULL, NULL, NULL, NULL, NULL, '', '', 'Y', 'N', '0', '0', 1, 0, '0', '0', '1', '1', '0', '#000000', 0),
(2, '2023-02-03 05:42:59', '2023-02-03 05:42:59', 1, 2, 'コラム', 'column', NULL, NULL, NULL, NULL, NULL, '', '', 'Y', 'N', '0', '0', 0, 0, '0', '0', '1', '1', '0', '#000000', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `page_config_extensions`
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
-- テーブルの構造 `page_config_items`
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
  `viewable_role` varchar(100) NOT NULL DEFAULT 'staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `page_config_items`
--

INSERT INTO `page_config_items` (`id`, `created`, `modified`, `page_config_id`, `position`, `parts_type`, `item_key`, `status`, `memo`, `title`, `sub_title`, `editable_role`, `viewable_role`) VALUES
(16, '2023-02-02 06:47:17', '2023-02-02 17:15:36', 1, 1, 'main', 'title', 'Y', '', '', '', 'staff', 'staff'),
(17, '2023-02-02 08:19:03', '2023-02-02 08:19:03', 1, 2, 'main', 'category', 'Y', '', '', '', 'staff', 'staff'),
(18, '2023-02-02 08:32:40', '2023-02-02 08:32:40', 1, 3, 'block', 'all', 'Y', '', '', '', 'staff', 'staff'),
(19, '2023-02-02 08:32:53', '2023-02-02 08:32:53', 1, 4, 'block', 'image', 'Y', '', '', '', 'staff', 'staff'),
(20, '2023-02-02 08:33:04', '2023-02-02 08:33:04', 1, 5, 'block', 'content', 'Y', '', '', '', 'staff', 'staff'),
(21, '2023-02-02 08:34:07', '2023-02-02 08:34:07', 1, 6, 'block', 'line', 'Y', '', '', '', 'staff', 'staff'),
(22, '2023-02-02 08:34:19', '2023-02-02 08:34:19', 1, 7, 'block', 'file', 'Y', '', '', '', 'staff', 'staff'),
(23, '2023-02-02 08:34:41', '2023-02-02 08:34:44', 1, 8, 'block', 'button', 'Y', '', '', '', 'staff', 'staff'),
(24, '2023-02-02 08:36:13', '2023-02-02 08:37:41', 1, 9, 'block', 'title', 'Y', '', '小見出し（H3）', '', 'staff', 'staff'),
(25, '2023-02-02 08:36:36', '2023-02-02 08:37:47', 1, 10, 'block', 'h2', 'Y', '', '大見出し（H2）', '', 'staff', 'staff'),
(26, '2023-02-03 00:34:19', '2023-02-03 00:34:20', 1, 11, 'block', 'memo', 'Y', '', 'メモ', '', 'staff', 'staff'),
(27, '2023-02-03 05:46:14', '2023-02-03 05:46:14', 2, 12, 'main', 'title', 'Y', '', '', '', 'staff', 'staff'),
(28, '2023-02-03 05:46:32', '2023-02-03 05:46:32', 2, 13, 'main', 'image', 'Y', '', '', '', 'staff', 'staff'),
(29, '2023-02-03 05:46:40', '2023-02-03 05:47:06', 2, 14, 'main', 'notes', 'Y', '', '', '', 'staff', 'staff'),
(30, '2023-02-03 05:47:40', '2023-02-03 05:47:40', 2, 15, 'main', 'category', 'Y', '', '', '', 'staff', 'staff'),
(31, '2023-02-03 05:47:59', '2023-02-03 05:47:59', 2, 16, 'block', 'all', 'Y', '', '', '', 'staff', 'staff'),
(32, '2023-02-03 05:49:26', '2023-02-03 05:49:38', 2, 17, 'block', 'h2', 'Y', '', '', '', 'staff', 'staff'),
(33, '2023-02-03 05:49:33', '2023-02-03 05:57:01', 2, 18, 'block', 'title', 'Y', '', '', '', 'staff', 'staff'),
(34, '2023-02-03 05:57:31', '2023-02-03 05:57:31', 2, 19, 'block', 'content', 'Y', '', '', '', 'staff', 'staff'),
(35, '2023-02-03 05:57:40', '2023-02-03 05:57:40', 2, 20, 'block', 'memo', 'Y', '', '', '', 'staff', 'staff'),
(36, '2023-02-03 05:58:41', '2023-02-03 05:58:41', 2, 21, 'block', 'with_image', 'Y', '', '', '', 'staff', 'staff'),
(37, '2023-02-03 05:59:03', '2023-02-03 05:59:03', 2, 22, 'section', 'all', 'Y', '', '', '', 'staff', 'staff'),
(38, '2023-02-03 05:59:23', '2023-02-03 05:59:37', 2, 23, 'section', 'section', 'Y', '', '', '', 'staff', 'staff'),
(39, '2023-02-03 06:00:10', '2023-02-03 06:00:10', 2, 24, 'block', 'button', 'Y', '', '', '', 'staff', 'staff'),
(40, '2023-02-03 06:00:28', '2023-02-03 06:00:28', 2, 25, 'block', 'line', 'Y', '', '', '', 'staff', 'staff'),
(41, '2023-02-03 06:00:36', '2023-02-03 06:00:36', 2, 26, 'block', 'file', 'Y', '', '', '', 'staff', 'staff'),
(42, '2023-02-03 06:01:39', '2023-02-03 06:03:09', 2, 27, 'block', 'kaiwa', 'Y', '', '会話', '', 'staff', 'staff'),
(43, '2023-02-03 06:02:57', '2023-02-03 06:02:57', 2, 28, 'block', 'user_intro', 'Y', '', 'ユーザ紹介', '', 'staff', 'staff'),
(44, '2023-02-03 07:51:39', '2023-02-03 07:51:39', 2, 29, 'block', 'image', 'Y', '', '', '', 'staff', 'staff'),
(45, '2023-03-03 00:50:17', '2023-03-03 00:50:17', 2, 19, 'block', 'VIDEO', 'Y', '', '', '', 'staff', 'staff');

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

-- --------------------------------------------------------

--
-- テーブルの構造 `schedules`
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
-- テーブルの構造 `section_sequences`
--

CREATE TABLE `section_sequences` (
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `info_content_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `site_configs`
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
-- テーブルのデータのダンプ `site_configs`
--

INSERT INTO `site_configs` (`id`, `created`, `modified`, `position`, `status`, `site_name`, `slug`, `is_root`) VALUES
(1, '2022-12-08 18:30:49', '2022-12-08 18:30:49', 1, 'publish', '【プロポ】塩谷町移住定住促進サイト', '', '1');

-- --------------------------------------------------------

--
-- テーブルの構造 `tags`
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
-- テーブルの構造 `user`
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
-- テーブルの構造 `useradmins`
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
  `id` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `useradmin_id` int(11) NOT NULL,
  `site_config_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `useradmin_sites`
--

INSERT INTO `useradmin_sites` (`id`, `created`, `modified`, `useradmin_id`, `site_config_id`) VALUES
(1, '2022-12-08 18:30:57', '2022-12-08 18:30:57', 1, 1),
(2, '2022-12-08 18:30:57', '2022-12-08 18:30:57', 2, 1);

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
-- テーブルのインデックス `user`
--
ALTER TABLE `user`
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
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `append_items`
--
ALTER TABLE `append_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `infos`
--
ALTER TABLE `infos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `info_append_items`
--
ALTER TABLE `info_append_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_categories`
--
ALTER TABLE `info_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_contents`
--
ALTER TABLE `info_contents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- テーブルの AUTO_INCREMENT `info_stock_tables`
--
ALTER TABLE `info_stock_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_tags`
--
ALTER TABLE `info_tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_tops`
--
ALTER TABLE `info_tops`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `kvs`
--
ALTER TABLE `kvs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `mst_lists`
--
ALTER TABLE `mst_lists`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `page_configs`
--
ALTER TABLE `page_configs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `page_config_extensions`
--
ALTER TABLE `page_config_extensions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `page_config_items`
--
ALTER TABLE `page_config_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- テーブルの AUTO_INCREMENT `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `section_sequences`
--
ALTER TABLE `section_sequences`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `site_configs`
--
ALTER TABLE `site_configs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `useradmins`
--
ALTER TABLE `useradmins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `useradmin_sites`
--
ALTER TABLE `useradmin_sites`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;
