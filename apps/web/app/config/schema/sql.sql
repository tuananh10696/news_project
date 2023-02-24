-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2023 年 2 月 24 日 10:20
-- サーバのバージョン： 5.7.34
-- PHP のバージョン: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- データベース: `news_project`
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
(1, '2023-02-16 17:22:04', '2023-02-22 14:43:28', 1, 0, 1, 'publish', 'Nature', NULL, NULL, 'gray'),
(2, '2023-02-16 17:22:10', '2023-02-22 14:43:56', 1, 0, 2, 'publish', 'Life', NULL, NULL, 'gray'),
(3, '2023-02-16 17:52:19', '2023-02-21 11:56:58', 2, 0, 1, 'publish', 'インタビュー', NULL, NULL, 'fuchsia'),
(4, '2023-02-16 17:52:29', '2023-02-16 08:52:29', 2, 0, 2, 'publish', 'イベントレポート', NULL, NULL, NULL),
(5, '2023-02-16 17:52:38', '2023-02-16 08:52:38', 2, 0, 3, 'publish', '情報記事', NULL, NULL, NULL),
(6, '2023-02-22 14:44:02', '2023-02-22 05:44:02', 1, 0, 3, 'publish', 'Travel', NULL, NULL, 'gray');

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
  `status` enum('publish','draft') NOT NULL DEFAULT 'publish',
  `title` varchar(255) DEFAULT NULL,
  `notes` text,
  `start_datetime` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
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
  `popular` varchar(20) DEFAULT '',
  `top_slide_display` tinyint(1) DEFAULT NULL,
  `top_slide` varchar(10) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `infos`
--

INSERT INTO `infos` (`id`, `created`, `modified`, `page_config_id`, `position`, `status`, `title`, `notes`, `start_datetime`, `date`, `image`, `file`, `file_name`, `file_size`, `file_extension`, `meta_description`, `meta_keywords`, `regist_user_id`, `category_id`, `index_type`, `multi_position`, `parent_info_id`, `value_text`, `popular`, `top_slide_display`, `top_slide`) VALUES
(1, '2023-02-22 14:47:55', '2023-02-24 18:14:22', 1, 2, 'publish', '10 \'kỳ quan thiên nhiên\' đẹp nhất Việt Nam', 'Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.', '2023-02-22 14:55:00', '2023-02-22', 'img_1_d2a39cf0-689d-4e7a-a69b-ede3dad675e2.jpeg', NULL, NULL, NULL, NULL, NULL, '', NULL, 6, NULL, NULL, NULL, 'vuichoi', '1', NULL, NULL),
(2, '2023-02-22 15:20:21', '2023-02-24 18:57:19', 1, 4, 'publish', 'Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách', 'Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.', '2023-02-22 15:20:00', '2023-02-22', 'img_2_0158dc19-ce05-4568-94f3-2bfbfb9f7a0b.jpg', NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, NULL, 'hoctap', '1', 1, NULL),
(3, '2023-02-22 15:20:23', '2023-02-24 17:37:18', 1, 3, 'publish', 'testttt', 'Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đ', '2023-02-22 15:20:00', '2023-02-22', 'img_3_6dcc573c-214d-40b2-b537-290522803cc4.jpeg', NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, NULL, 'congviec', '1', NULL, NULL),
(4, '2023-02-22 18:34:22', '2023-02-24 19:05:08', 1, 1, 'publish', 'Ba Bể có những dãy núi  đá vôi dựng đứng', 'abc', '2023-02-22 18:33:00', '2023-02-22', 'img_4_a41470ff-00e8-42bf-aebd-495f40a2ffcb.jpeg', NULL, NULL, NULL, NULL, NULL, '', NULL, 2, NULL, NULL, NULL, 'hoctap', '1', 1, '1');

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
  `image2` varchar(200) DEFAULT NULL,
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

--
-- テーブルのデータのダンプ `info_contents`
--

INSERT INTO `info_contents` (`id`, `created`, `modified`, `info_id`, `block_type`, `position`, `title`, `h2`, `content`, `image`, `image2`, `img_alt`, `image_pos`, `file`, `file_size`, `file_name`, `file_extension`, `section_sequence_id`, `option_value`, `option_value2`, `option_value3`, `before_text`, `after_text`) VALUES
(1, '2023-02-22 14:47:55', '2023-02-24 18:14:22', 1, '2', 1, NULL, NULL, '<p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.</p><p><strong>rải nghiệm thiên nhiên</strong></p><p><u>rải nghiệm thiên nhiên</u></p><p><s>rải nghiệm thiên nhiên</s></p><p><i>rải nghiệm thiên nhiên</i></p><p><span style=\"color:hsl(30,75%,60%);\">rải nghiệm thiên nhiên</span></p><p><span style=\"color:hsl(210,75%,60%);\">rải nghiệm thiên nhiên</span></p><p><a href=\"https://github.com/\">rải nghiệm thiên nhiên</a></p><ul><li>rải nghiệm thiên nhiên</li><li>rải nghiệm thiên nhiên</li></ul><p>&nbsp;</p><ol style=\"list-style-type:decimal;\"><li>rải nghiệm thiên nhiên</li><li>rải nghiệm thiên nhiên</li></ol>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(2, '2023-02-22 14:47:55', '2023-02-24 18:14:22', 1, '7', 2, NULL, 'Vườn quốc gia Ba Bể', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(3, '2023-02-22 14:47:55', '2023-02-24 18:14:22', 1, '2', 3, NULL, NULL, '<p><span style=\"color:rgb(17,17,17);\">Ba Bể có những dãy núi đá vôi dựng đứng, nhiều thung lũng lớn và rừng cây xanh rì bao bọc là điểm đến lý tưởng cho du khách mê phiêu lưu, khám phá. Các thác nước, hang động, hồ ở đây tạo nên một khung cảnh thiên nhiên kỳ thú với hơn 550 loài động thực vật quý hiếm. Khám phá Ba Bể bằng thuyền hay trekking hoặc đạp xe xuyên rừng chắc chắn sẽ cho bạn nhiều trải nghiệm đáng nhớ, sau đó hãy nghỉ ngơi, nạp năng lượng ở những căn homestay, nhà nghỉ trong các bản Tày địa phương.</span></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(4, '2023-02-22 14:47:55', '2023-02-24 18:14:22', 1, '3', 4, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo, odit?', 'img_4_2f763102-bf80-4793-808b-556b5a5f703e.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '', NULL, NULL, NULL),
(5, '2023-02-22 14:47:55', '2023-02-24 18:14:22', 1, '7', 5, NULL, 'Thác Bản Giốc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(6, '2023-02-22 14:47:55', '2023-02-24 18:14:22', 1, '2', 6, NULL, NULL, '<p><span style=\"color:rgb(17,17,17);\">Bản Giốc là một trong những thác nước đẹp và nổi tiếng nhất Việt Nam và hình ảnh của thắng cảnh này xuất hiện ở vô số các nhà nghỉ, trọ cho du khách. Dòng nước từ Quây Sơn đổ xuống tạo nên thác Bản Giốc đánh dấu hai bờ biên giới Việt Nam và Trung Quốc với khung cảnh ấn tượng. Du khách có thể tham quan thác bằng bè tre, đi sát gần thác để cảm nhận những dòng nước đổ ầm ào tạo bọt tung trắng xóa.</span></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(7, '2023-02-22 14:47:55', '2023-02-24 18:14:22', 1, '3', 7, NULL, NULL, '', 'img_7_9becfd89-b9d2-426f-b535-827f1de24a0f.jpeg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '', NULL, NULL, NULL),
(9, '2023-02-22 14:47:56', '2023-02-24 18:14:22', 1, '18', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(10, '2023-02-22 15:46:29', '2023-02-24 17:37:18', 3, '3', 1, NULL, NULL, '', 'img_10_ec3ce434-3af8-4b02-8e9c-38563290bbc9.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '_self', NULL, NULL, NULL),
(11, '2023-02-22 15:58:41', '2023-02-24 18:57:19', 2, '7', 1, NULL, 'Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(12, '2023-02-22 15:58:41', '2023-02-24 18:57:19', 2, '3', 2, NULL, NULL, '', 'img_12_452a1345-dd75-4274-8f2d-4f10f0505ad1.jpeg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '', NULL, NULL, NULL),
(13, '2023-02-22 15:58:42', '2023-02-24 18:57:19', 2, '2', 3, NULL, NULL, '<p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(14, '2023-02-22 15:58:42', '2023-02-24 18:57:19', 2, '3', 4, NULL, NULL, '', 'img_14_c428bb58-0994-45af-b31c-fef108f774b2.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '', NULL, NULL, NULL),
(16, '2023-02-22 16:21:29', '2023-02-24 18:14:22', 1, '1', 10, 'Vườn quốc gia Phong Nha Kẻ Bàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(17, '2023-02-22 16:21:29', '2023-02-24 18:14:22', 1, '7', 8, NULL, 'Vườn quốc gia Phong Nha Kẻ Bàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(21, '2023-02-22 17:30:00', '2023-02-24 17:37:18', 3, '8', 2, 'test link button', NULL, 'https://www.youtube.com/channel/UCwnSfrWJqhkyxJR3Cp38MMg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '_blank', NULL, NULL, NULL),
(22, '2023-02-22 17:30:00', '2023-02-24 17:37:18', 3, '9', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(23, '2023-02-22 17:30:00', '2023-02-24 17:37:18', 3, '2', 4, NULL, NULL, '<p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.</p><p><strong>rải nghiệm thiên nhiên</strong></p><p><u>rải nghiệm thiên nhiên</u></p><p><s>rải nghiệm thiên nhiên</s></p><p><i>rải nghiệm thiên nhiên</i></p><p><span style=\"color:hsl(30,75%,60%);\">rải nghiệm thiên nhiên</span></p><p><span style=\"color:hsl(210,75%,60%);\">rải nghiệm thiên nhiên</span></p><p><a href=\"https://github.com/\">rải nghiệm thiên nhiên</a></p><ul><li>rải nghiệm thiên nhiên</li><li>rải nghiệm thiên nhiên</li></ul><p>&nbsp;</p><ol style=\"list-style-type:decimal;\"><li>rải nghiệm thiên nhiên</li><li>rải nghiệm thiên nhiên</li></ol>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(24, '2023-02-22 17:30:00', '2023-02-24 17:37:18', 3, '4', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e_f_24_cfe5c4d9-86e3-4bee-b026-117a5e7d6446.doc', 100352, 'file-sample_100kB', 'doc', 0, NULL, NULL, NULL, NULL, NULL),
(25, '2023-02-22 17:47:32', '2023-02-24 17:37:18', 3, '4', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e_f_25_3aff0c9f-9ed5-4004-b41f-dc28d227ec16.pdf', 3028, '<script>alert(111)<:script>', 'pdf', 0, NULL, NULL, NULL, NULL, NULL),
(26, '2023-02-22 17:47:32', '2023-02-24 17:37:18', 3, '4', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e_f_26_29afb187-e1dc-4b07-a416-fc772a4e7257.xlsx', 5425, 'file_example_XLSX_10', 'xlsx', 0, NULL, NULL, NULL, NULL, NULL),
(27, '2023-02-22 17:57:40', '2023-02-24 18:14:22', 1, '19', 11, NULL, NULL, 'https://www.youtube.com/watch?v=vC4dLeqnvAw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1', 'youtube', NULL, NULL),
(28, '2023-02-22 18:13:48', '2023-02-24 17:37:19', 3, '20', 8, '', NULL, '', 'img_28_23fda520-9b4b-418f-9a5a-911b7eb875b7.jpg', 'img_28_35d6976b-8dbe-41c6-8ab0-47e58047e656.png', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(29, '2023-02-22 18:34:22', '2023-02-24 19:05:08', 4, '20', 1, 'Ba Bể có gì ?', NULL, 'Ba Bể có những dãy núi\r\n đá vôi dựng đứng, nhiều thung lũng lớn và rừng cây xanh rì bao bọc là điểm đến lý tưởng cho du khách mê phiêu lưu, khám phá. Các thác nước, hang động, hồ ở \r\nđây tạo nên một khung cảnh thiên nhiên kỳ thú với hơn 550 loài động thực vật quý hiếm. Khám phá Ba Bể bằng thuyền hay trekking hoặc đạp xe xuyên rừng chắc chắn sẽ cho bạn nhiều trải nghiệm đáng nhớ, sau đó hãy nghỉ ngơi, nạp năng lượng ở những căn homestay, nhà nghỉ trong các bản Tày địa phương.', 'img_29_f176086d-755d-46b5-a586-5348ede49f88.jpg', 'img_29_94249d6e-1925-4258-af4e-b0e53dd60e90.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(30, '2023-02-22 18:55:26', '2023-02-24 19:05:08', 4, '20', 2, 'Ba Bể có gì ?', NULL, 'Ba Bể có những dãy núi\r\n đá vôi dựng đứng, nhiều thung lũng lớn và rừng cây xanh rì bao bọc là điểm đến lý tưởng cho du khách mê phiêu lưu, khám phá. Các thác nước, hang động, hồ ở \r\nđây tạo nên một khung cảnh thiên nhiên kỳ thú với hơn 550 loài động thực vật quý hiếm. Khám phá Ba Bể bằng thuyền hay trekking hoặc đạp xe xuyên rừng chắc chắn sẽ cho bạn nhiều trải nghiệm đáng nhớ, sau đó hãy nghỉ ngơi, nạp năng lượng ở những căn homestay, nhà nghỉ trong các bản Tày địa phương.Ba Bể có những dãy núi\r\n', 'img_30_9086f7ea-09d9-482d-b1e5-bc50e2f4f1c8.jpeg', 'img_30_13e52395-9618-40af-a25c-43cc774568ac.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);

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
-- テーブルの構造 `multi_images`
--

CREATE TABLE `multi_images` (
  `id` int(11) NOT NULL,
  `info_content_id` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `multi_images`
--

INSERT INTO `multi_images` (`id`, `info_content_id`, `image`) VALUES
(6, 9, 'img_6_22afc223-f087-4aa8-a9ef-9b262f496fcb.jpeg'),
(7, 9, 'img_7_5434a62d-814b-4786-b20c-acf87671fa5a.jpg'),
(8, 9, 'img_8_2bd08a9a-b489-4e11-9980-28a25fb4da19.jpg'),
(11, 9, 'img_11_f3af2a25-ceff-417f-8447-37e063e6d048.jpeg');

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
(1, '2023-02-16 17:09:31', '2023-02-16 17:09:41', 1, 1, 'お知らせ', 'news', NULL, NULL, NULL, NULL, NULL, '', '', 'Y', 'N', '0', '0', 0, 0, '0', '0', '1', '1', '0', '#000000', 0);

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
  `viewable_role` varchar(100) NOT NULL DEFAULT 'staff',
  `item_type` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `max_length` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `page_config_items`
--

INSERT INTO `page_config_items` (`id`, `created`, `modified`, `page_config_id`, `position`, `parts_type`, `item_key`, `status`, `memo`, `title`, `sub_title`, `editable_role`, `viewable_role`, `item_type`, `is_required`, `max_length`) VALUES
(1, '2023-02-16 17:10:12', '2023-02-24 09:51:04', 1, 4, 'main', 'title', 'Y', NULL, 'タイトル', '', 'staff', 'staff', 'text', 1, 100),
(2, '2023-02-16 17:10:32', '2023-02-24 09:51:04', 1, 5, 'main', 'category_id', 'Y', NULL, 'カテゴリー', '', 'staff', 'staff', 'select', 1, 0),
(3, '2023-02-16 17:11:18', '2023-02-24 09:51:04', 1, 9, 'block', 'image', 'Y', NULL, '画像', '', 'staff', 'staff', '3', 0, 0),
(4, '2023-02-16 17:12:02', '2023-02-24 09:51:04', 1, 8, 'block', 'content', 'Y', NULL, '概要', '', 'staff', 'staff', '2', 0, 3000),
(5, '2023-02-16 17:13:06', '2023-02-24 09:51:04', 1, 12, 'block', 'title', 'Y', NULL, '区切り線', '', 'staff', 'staff', '9', 0, 0),
(6, '2023-02-16 17:13:31', '2023-02-24 09:51:04', 1, 10, 'block', 'file', 'Y', NULL, 'ファイル添付', '', 'staff', 'staff', '4', 0, 0),
(7, '2023-02-16 17:14:38', '2023-02-24 09:51:04', 1, 11, 'block', 'option_value2', 'Y', NULL, 'ボタン', '', 'staff', 'staff', '8', 0, 40),
(8, '2023-02-16 17:15:37', '2023-02-24 09:51:04', 1, 7, 'block', 'title', 'Y', NULL, '小見出し', '', 'staff', 'staff', '1', 0, 100),
(9, '2023-02-16 17:16:09', '2023-02-24 09:51:04', 1, 6, 'block', 'h2', 'Y', NULL, 'H3', '', 'staff', 'staff', '7', 0, 100),
(10, '2023-02-16 17:16:44', '2023-02-24 09:51:04', 1, 13, 'block', 'content', 'Y', NULL, 'メモ', '', 'staff', 'staff', '15', 0, 500),
(11, '2023-02-16 17:44:21', '2023-02-16 08:44:21', 2, 1, 'main', 'title', 'Y', NULL, 'タイトル', '', 'staff', 'staff', 'text', 1, 100),
(12, '2023-02-16 17:44:57', '2023-02-16 08:44:57', 2, 2, 'main', 'category_id', 'Y', NULL, ' カテゴリ', '', 'staff', 'staff', 'select', 1, 0),
(13, '2023-02-16 17:45:36', '2023-02-16 17:53:21', 2, 3, 'main', 'notes', 'Y', NULL, '概要', '', 'staff', 'staff', 'textarea', 0, 500),
(14, '2023-02-16 17:45:53', '2023-02-16 08:45:53', 2, 4, 'main', 'image', 'Y', NULL, '画像', '', 'staff', 'staff', 'image', 1, 0),
(15, '2023-02-16 17:46:28', '2023-02-16 08:46:28', 2, 5, 'block', 'h2', 'Y', NULL, '大見出し', '', 'staff', 'staff', '7', 0, 100),
(16, '2023-02-16 17:46:55', '2023-02-16 08:46:55', 2, 6, 'block', 'title', 'Y', NULL, '中見出し', '', 'staff', 'staff', '1', 0, 100),
(17, '2023-02-16 17:47:30', '2023-02-16 08:47:30', 2, 7, 'block', 'content', 'Y', NULL, '本文', '', 'staff', 'staff', '2', 0, 1000),
(18, '2023-02-16 17:48:06', '2023-02-16 08:48:06', 2, 8, 'block', 'image', 'Y', NULL, '画像', '', 'staff', 'staff', '3', 0, 0),
(19, '2023-02-16 17:48:31', '2023-02-16 08:48:31', 2, 9, 'block', 'file', 'Y', NULL, 'ファイル添付', '', 'staff', 'staff', '4', 0, 0),
(20, '2023-02-16 17:48:51', '2023-02-16 08:48:51', 2, 10, 'block', 'title', 'Y', NULL, '区切り線', '', 'staff', 'staff', '9', 0, 0),
(21, '2023-02-16 17:49:25', '2023-02-16 08:49:25', 2, 11, 'block', 'image', 'Y', NULL, '画像回り込み用', '', 'staff', 'staff', '11', 0, 0),
(22, '2023-02-16 17:49:54', '2023-02-16 08:49:54', 2, 12, 'block', 'option_value2', 'Y', NULL, 'ボタン', '', 'staff', 'staff', '8', 0, 40),
(23, '2023-02-16 17:50:38', '2023-02-16 08:50:38', 2, 13, 'block', 'content', 'Y', NULL, '会話', '', 'staff', 'staff', '16', 0, 500),
(24, '2023-02-16 17:51:10', '2023-02-16 08:51:10', 2, 14, 'block', 'content', 'Y', NULL, 'ユーザー紹介', '', 'staff', 'staff', '17', 0, 500),
(25, '2023-02-16 17:51:29', '2023-02-16 17:58:41', 2, 15, 'block', 'content', 'Y', NULL, 'メモ', '', 'staff', 'staff', '15', 0, 500),
(26, '2023-02-16 17:51:38', '2023-02-16 08:51:38', 2, 16, 'section', NULL, 'Y', NULL, '', '', 'staff', 'staff', '10', 0, 0),
(28, '2023-02-20 15:54:44', '2023-02-24 09:51:04', 1, 14, 'block', 'image', 'Y', NULL, '複数画像', '', 'staff', 'staff', '18', 0, 0),
(29, '2023-02-22 14:44:48', '2023-02-24 09:51:04', 1, 15, 'main', 'image', 'Y', NULL, '', '', 'staff', 'staff', 'image', 1, 0),
(30, '2023-02-22 14:50:59', '2023-02-24 09:51:04', 1, 3, 'main', 'start_datetime', 'Y', NULL, '', '', 'staff', 'staff', 'datetime', 0, 0),
(31, '2023-02-22 14:58:19', '2023-02-24 09:51:04', 1, 16, 'main', 'notes', 'Y', NULL, 'Content', '', 'staff', 'staff', 'text', 1, 200),
(36, '2023-02-22 18:12:26', '2023-02-24 09:51:04', 1, 17, 'block', 'option_value', 'Y', NULL, '', '', 'staff', 'staff', '20', 0, 0),
(37, '2023-02-24 11:51:59', '2023-02-24 09:51:04', 1, 2, 'main', 'popular', 'Y', NULL, 'News Type', '', 'staff', 'staff', 'radio', 0, 0),
(38, '2023-02-24 16:50:35', '2023-02-24 09:51:04', 1, 18, 'main', 'value_text', 'Y', NULL, 'Tags', '', 'staff', 'staff', 'text', 0, 100),
(40, '2023-02-24 18:47:10', '2023-02-24 09:51:04', 1, 1, 'main', 'top_slide', 'Y', NULL, 'Top Slide', '', 'staff', 'staff', 'checkbox', 0, 0);

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

--
-- テーブルのデータのダンプ `section_sequences`
--

INSERT INTO `section_sequences` (`id`, `created`, `modified`, `info_content_id`) VALUES
(1, '2023-02-15 10:43:00', '2023-02-15 10:43:00', 0),
(2, '2023-02-15 10:43:11', '2023-02-15 10:43:11', 0),
(3, '2023-02-15 10:48:04', '2023-02-15 10:48:04', 0),
(4, '2023-02-15 10:56:05', '2023-02-15 10:56:05', 0),
(5, '2023-02-15 11:08:24', '2023-02-15 11:08:45', 16),
(6, '2023-02-15 11:10:52', '2023-02-15 11:10:52', 0),
(7, '2023-02-15 11:13:57', '2023-02-15 11:13:57', 0),
(8, '2023-02-15 11:34:24', '2023-02-15 11:34:24', 0),
(9, '2023-02-16 18:01:21', '2023-02-16 18:02:38', 25),
(10, '2023-02-22 09:01:25', '2023-02-22 10:01:32', 38);

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
(1, '2022-12-08 18:30:49', '2023-02-22 12:29:23', 1, 'publish', 'daily', '', '1');

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
-- テーブルのインデックス `multi_images`
--
ALTER TABLE `multi_images`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
-- テーブルの AUTO_INCREMENT `multi_images`
--
ALTER TABLE `multi_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- テーブルの AUTO_INCREMENT `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `section_sequences`
--
ALTER TABLE `section_sequences`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
