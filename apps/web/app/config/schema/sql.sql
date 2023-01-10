-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2023 年 1 月 10 日 09:56
-- サーバのバージョン： 5.7.34
-- PHP のバージョン: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- データベース: `news`
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
(1, '2023-01-06 06:43:03', '2023-01-06 06:44:28', 1, 0, 1, 'publish', 'Đời Sống', '', NULL),
(2, '2023-01-06 06:43:38', '2023-01-06 06:43:38', 1, 0, 2, 'publish', 'Du Lịch - Ẩm Thực', '', NULL),
(3, '2023-01-06 06:44:07', '2023-01-06 06:44:07', 1, 0, 3, 'publish', 'Thể Thao', '', NULL),
(4, '2023-01-06 06:44:21', '2023-01-06 06:44:21', 1, 0, 4, 'publish', 'Công Nghệ', '', NULL),
(5, '2023-01-06 06:44:35', '2023-01-06 06:44:35', 1, 0, 5, 'publish', 'Xe', '', NULL),
(6, '2023-01-10 01:14:45', '2023-01-10 01:14:45', 1, 0, 6, 'publish', 'test category', '', NULL);

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
  `status` varchar(10) NOT NULL DEFAULT 'publish',
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
  `popular` tinyint(1) DEFAULT NULL,
  `top_slide_display` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `infos`
--

INSERT INTO `infos` (`id`, `created`, `modified`, `page_config_id`, `position`, `status`, `title`, `notes`, `start_datetime`, `start_date`, `start_time`, `end_date`, `end_time`, `image`, `meta_description`, `meta_keywords`, `regist_user_id`, `category_id`, `index_type`, `multi_position`, `parent_info_id`, `value_text`, `popular`, `top_slide_display`) VALUES
(1, '2023-01-06 08:53:16', '2023-01-10 05:50:55', 1, 5, 'publish', 'Mời bạn đọc tham gia cuộc thi ảnh \"Nét đẹp lao động Tết\"', 'Cuộc thi ảnh \"Nét đẹp lao động Tết\" năm 2023 được tổ chức với mong muốn tìm kiếm những bức ảnh ghi lại khoảnh khắc trong công tác chuyên môn, lao động, sản xuất và hoạt động xây dựng.', '2023-01-06 00:00:00', '2023-01-10', '0', '1900-01-01', '0', 'img_1_49567829-f394-4e5f-9bf6-627d303a8a2b.jpeg', '', '', 1, 1, '0', 0, 0, NULL, NULL, NULL),
(2, '2023-01-10 01:45:14', '2023-01-10 01:45:26', 1, 4, 'publish', 'test news', 'day la test', '2023-01-10 00:00:00', '2023-01-10', '0', '1900-01-01', '0', 'img_2_8276037c-0f0e-49d7-9c08-27101540dae3.jpeg', '', '', 1, 2, '0', 0, 0, NULL, NULL, NULL),
(3, '2023-01-10 02:31:34', '2023-01-10 05:54:28', 1, 3, 'publish', 'test doi song news', '一覧概要\r\n一覧概要一覧概要一覧概要一覧概要\r\n一覧概要一覧概要一覧概要一覧概要一覧概要一覧概要一覧概要\r\n一覧概要\r\n一覧概要', '2023-01-10 00:00:00', '2023-01-10', '0', '1900-01-01', '0', 'img_3_b125cbfb-5400-488c-931f-efea22dc0d63.jpeg', '', '', 1, 1, '0', 0, 0, NULL, NULL, NULL),
(4, '2023-01-10 06:06:03', '2023-01-10 06:06:03', 1, 2, 'publish', 'sap den tet roi', 'hallo', '2023-01-10 00:00:00', '2023-01-10', '0', '1900-01-01', '0', 'img_4_1051d15f-82a0-420d-b6e9-0cb46df31e9d.jpeg', '', '', 1, 3, '0', 0, 0, NULL, NULL, NULL),
(5, '2023-01-10 08:35:04', '2023-01-10 09:38:37', 1, 1, 'publish', 'Lộ thông tin đặt trước Galaxy S23 series sẽ được tặng Galaxy Buds2 Pro?', 'Sau sự cố “xác nhận” ngày ra mắt Galaxy S23 series là vào ngày 01/02/2023, website bán lẻ của châu Âu Euronics lại “vô tình đăng tải” thông tin nhận đặt trước dòng sản phẩm này với các ưu đãi kèm theo. Theo đó, hình ảnh được chụp lại (đã bị xóa) từ web bán lẻ cho thấy khi người dùng đặt mua trước series Galaxy S23 thì sẽ được tặng kèm Galaxy Buds2 Pro. Tất nhiên, không ngoại trừ khả năng các ưu đãi tương tự sẽ được áp dụng ở các quốc gia khác theo thông lệ hàng năm của Samsung.', '2023-01-09 00:00:00', '2023-01-10', '0', '1900-01-01', '0', 'img_5_7fc58b63-b3d2-42f4-8d99-04c2720c4478.jpeg', '', '', 1, 4, '0', 0, 0, NULL, NULL, NULL);

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
(1, '2023-01-06 08:53:16', '2023-01-10 05:50:55', 1, '1', 2, 'ĐỐI TƯỢNG THAM GIA', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(2, '2023-01-06 08:53:16', '2023-01-10 05:50:55', 1, '2', 3, '', '<p>- Công dân quốc tịch Việt Nam</p><p>- Trường hợp công dân dự thi chưa đủ 18 tuổi phải có sự đồng ý của người giám hộ (ba, mẹ hoặc người thân trong gia đình từ 18 tuổi trở lên) và giấy tờ căn cước công dân trong trường hợp được nhận thưởng.</p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(3, '2023-01-10 02:30:34', '2023-01-10 05:50:55', 1, '1', 4, 'THỜI GIAN CHƯƠNG TRÌNH', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(4, '2023-01-10 02:30:34', '2023-01-10 05:50:55', 1, '2', 5, '', '<ul><li>Từ 20h00 ngày 06/1/2023 đến 23h59 ngày 6/2/2023</li><li>&nbsp;Chuyên mục phát động cuộc thi chính thức của chương trình <a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://dantri.com.vn/tet-2023/net-dep-lao-dong.htm\">TẠI ĐÂY</a></li></ul>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(5, '2023-01-10 02:30:34', '2023-01-10 05:50:55', 1, '3', 6, '', '', 'img_5_747bccd6-a380-42d9-b070-26b35bad9a81.jpeg', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(6, '2023-01-10 02:30:37', '2023-01-10 05:50:55', 1, '2', 7, '', '<p><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự thi theo các bước sau</span></p><p><span style=\"background-color:hsl(0,75%,60%);color:rgb(51,51,51);\">Thí sinh tham gia dự thi theo các bước sau</span></p><p><span style=\"color:rgb(51,51,51);\"><strong>Thí sinh tham gia dự thi theo các bước sau</strong></span></p><p><span style=\"color:rgb(51,51,51);\"><i>Thí sinh tham gia dự thi theo các bước sau</i></span></p><p><span style=\"color:rgb(51,51,51);\"><u>Thí sinh tham gia dự thi theo các bước sau</u></span></p><p><span style=\"color:rgb(51,51,51);\"><s>Thí sinh tham gia dự thi theo các bước sau</s></span></p><ul><li><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự thi theo các bước sau</span></li><li><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự thi theo các bước sau</span></li></ul><p class=\"text-center\"><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự thi theo các bước sau</span></p><p class=\"text-right\"><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự thi theo các bước sau</span><a href=\"gogole.com\"><span style=\"color:rgb(51,51,51);\">test link</span></a></p><p><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"http://backlog.caters.jp:8969/backlog/dashboard?from_globalbar\"><span style=\"color:rgb(51,51,51);\">link test</span></a></p><figure class=\"table\"><table><thead><tr><th><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự&nbsp;</span></th><th><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự&nbsp;</span></th><th><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự&nbsp;</span></th><th><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự&nbsp;</span></th></tr></thead><tbody><tr><td><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự&nbsp;</span></td><td><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự&nbsp;</span></td><td><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự&nbsp;</span></td><td><span style=\"color:rgb(51,51,51);\">Thí sinh tham gia dự&nbsp;</span></td></tr></tbody></table></figure>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(7, '2023-01-10 05:01:08', '2023-01-10 05:50:55', 1, '5', 1, 'ĐỐI TƯỢNG THAM GIA', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(8, '2023-01-10 05:04:16', '2023-01-10 05:54:26', 3, '3', 1, '', '', 'img_8_5716c24e-842c-41ef-977c-b44a5945adb4.jpeg', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(9, '2023-01-10 05:04:16', '2023-01-10 05:54:26', 3, '2', 2, '', '<p>My hero when I was a kid was my mom.</p><p>&nbsp;Same for everyone I knew. Moms are untouchable. They’re elegant, smart, beautiful, kind…everything we want to be. At 29 years old, my favorite compliment is being told that I look like my mom. Seeing myself in her image, like this daughter up top, makes me so proud of how far I’ve come, and so thankful for where I come from.the refractor telescope uses a convex lens to focus the light on the eyepiece.</p><p>The reflector telescope has a concave lens which means it telescope sits on. The mount is the actual tripod and the wedge is the device that lets you attach the telescope to the mount.</p><p>Moms are like…buttons? Moms are like glue. Moms are like pizza crusts. Moms are the ones who make sure things happen—from birth to school lunch.</p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(10, '2023-01-10 05:05:12', '2023-01-10 05:54:26', 3, '11', 3, '', 'Cách chấm điểm cuộc thi ảnh \"Nét đẹp lao động Tết\": 04 hạng mục Giải Chung cuộc (01 Giải Nhất; 02 giải nhì; 03 giải ba; 05 giải khuyến khích) được chấm chọn dựa trên số lượt tương tác từ độc giả trên bài đăng tác phẩm dự thi tại trang chính thức của cuộc thi trên chuyên trang Xây Tết của Báo Điện tử Dân trí (50% số điểm) và điểm số từ Ban giám khảo (50% số điểm).\r\nCách chấm điểm cuộc thi ảnh \"Nét đẹp lao động Tết\": 04 hạng mục Giải Chung cuộc (01 Giải Nhất; 02 giải nhì; 03 giải ba; 05 giải khuyến khích) được chấm chọn dựa trên số lượt tương tác từ độc giả trên bài đăng tác phẩm dự thi tại trang chính thức của cuộc thi trên chuyên trang Xây Tết của Báo Điện tử Dân trí (50% số điểm) và điểm số từ Ban giám khảo (50% số điểm).\r\n', 'img_10_58b7c0c5-d58e-46d6-83f6-8a7510f6283e.jpeg', NULL, NULL, 'left', '', 0, '', '', 0, '', '', '', NULL, NULL),
(11, '2023-01-10 05:05:13', '2023-01-10 05:54:26', 3, '11', 4, '', 'My hero when I was a kid was my mom.\r\n\r\n Same for everyone I knew. Moms are untouchable. They’re elegant, smart, beautiful, kind…everything we want to be. At 29 years old, my favorite compliment is being told that I look like my mom. Seeing myself in her image, like this daughter up top, makes me so proud of how far I’ve come, and so thankful for where I come from.the refractor telescope uses a convex lens to focus the light on the eyepiece.\r\n\r\nThe reflector telescope has a concave lens which means ', 'img_11_24ecd3b3-fdae-4b8b-9a90-33d92e7f3c26.jpeg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(12, '2023-01-10 05:53:25', '2023-01-10 05:54:26', 3, '2', 5, '', '<p><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"http://backlog.caters.jp:8969/backlog/dashboard?from_globalbar\">tai day</a></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(13, '2023-01-10 09:01:30', '2023-01-10 09:38:37', 5, '1', 1, 'Lộ thông tin đặt trước Galaxy S23 series h2', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(14, '2023-01-10 09:01:30', '2023-01-10 09:38:37', 5, '5', 2, 'Lộ thông tin đặt trước Galaxy S23 series h3', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(15, '2023-01-10 09:01:30', '2023-01-10 09:38:37', 5, '25', 8, '', NULL, 'img_15_b681071c-3998-41e7-9e98-024870be731c.jpeg', 'img_15_cadc1d73-eb2b-4033-9288-c9757ff40422.jpeg', 'img_15_d245fb9b-4214-4add-9f0c-38b50d4f3190.jpeg', '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(16, '2023-01-10 09:01:31', '2023-01-10 09:38:37', 5, '2', 3, '', '<p><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"http://news.local/\">test link</a></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(17, '2023-01-10 09:01:31', '2023-01-10 09:38:37', 5, '3', 4, '', '', 'img_17_44c445db-f41f-4ebd-8fdd-dc9f05dab694.jpeg', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(18, '2023-01-10 09:01:32', '2023-01-10 09:38:37', 5, '4', 5, '', NULL, '', NULL, NULL, '', 'e_f_18_5ae8e4fb-b078-4fde-8c55-c450ac40440b.xlsx', 5425, 'file_example_XLSX_10', 'xlsx', 0, '', '', '', NULL, NULL),
(19, '2023-01-10 09:01:32', '2023-01-10 09:38:37', 5, '4', 6, '', NULL, '', NULL, NULL, '', 'e_f_19_905e39a9-8de7-466c-be22-a754bed1c7d0.pdf', 655620, '18_01能力試験Ｎ１リスト', 'pdf', 0, '', '', '', NULL, NULL),
(20, '2023-01-10 09:01:32', '2023-01-10 09:38:37', 5, '4', 7, '', NULL, '', NULL, NULL, '', 'e_f_20_f31a32de-a67d-4731-9bd4-361fe500095c.doc', 100352, 'file-sample_100kB', 'doc', 0, '', '', '', NULL, NULL),
(22, '2023-01-10 09:38:20', '2023-01-10 09:38:37', 5, '25', 9, '', NULL, 'img_22_2801beb4-4ea5-4f3e-a137-6e292d10b353.jpeg', 'img_22_1dcad925-3097-4146-971a-ad0c45966b66.jpeg', NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL);

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
(1, '2023-01-06 06:11:16', '2023-01-10 05:44:17', 1, 1, 'NEWS', 'news', '', '', '0', '0', 0, '', '', 'Y', 'N', '0', '0', 1, 0, '0', '0', '1', '1', '0', '#000000', 0);

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
(1, '2023-01-06 06:11:40', '2023-01-06 06:11:40', 1, 1, 'main', 'all', 'Y', '', '', '', 'staff', 'staff'),
(2, '2023-01-06 06:12:31', '2023-01-06 06:12:31', 1, 2, 'main', 'title', 'Y', '', '', '', 'staff', 'staff'),
(3, '2023-01-06 06:12:38', '2023-01-06 06:12:38', 1, 3, 'main', 'notes', 'Y', '', '', '', 'staff', 'staff'),
(4, '2023-01-06 06:12:43', '2023-01-06 06:12:43', 1, 4, 'main', 'image', 'Y', '', '', '', 'staff', 'staff'),
(5, '2023-01-06 06:12:55', '2023-01-06 06:12:55', 1, 5, 'block', 'image', 'Y', '', '', '', 'staff', 'staff'),
(6, '2023-01-06 06:13:07', '2023-01-06 06:13:07', 1, 6, 'block', 'content', 'Y', '', '', '', 'staff', 'staff'),
(7, '2023-01-06 06:13:21', '2023-01-06 06:18:00', 1, 7, 'block', 'title', 'Y', '', '', '', 'staff', 'staff'),
(8, '2023-01-06 06:13:28', '2023-01-06 06:17:52', 1, 8, 'block', 'title_h4', 'Y', '', '', '', 'staff', 'staff'),
(9, '2023-01-06 06:15:01', '2023-01-06 06:15:01', 1, 9, 'block', 'all', 'Y', '', '', '', 'staff', 'staff'),
(10, '2023-01-06 06:18:50', '2023-01-06 06:18:50', 1, 10, 'block', 'file', 'Y', '', '', '', 'staff', 'staff'),
(11, '2023-01-06 06:19:07', '2023-01-06 06:19:07', 1, 11, 'block', 'with_image', 'Y', '', '', '', 'staff', 'staff'),
(12, '2023-01-06 06:22:59', '2023-01-06 06:22:59', 1, 12, 'block', 'MANY_IMG', 'Y', '', '', '', 'staff', 'staff'),
(13, '2023-01-06 06:26:22', '2023-01-06 06:26:22', 1, 13, 'main', 'category', 'Y', '', '', '', 'staff', 'staff');

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
(1, '2022-12-08 18:30:49', '2022-12-08 18:30:49', 1, 'publish', 'NEWS', '', '1');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `infos`
--
ALTER TABLE `infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `info_append_items`
--
ALTER TABLE `info_append_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_categories`
--
ALTER TABLE `info_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `info_contents`
--
ALTER TABLE `info_contents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `page_config_extensions`
--
ALTER TABLE `page_config_extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `page_config_items`
--
ALTER TABLE `page_config_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- テーブルの AUTO_INCREMENT `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `section_sequences`
--
ALTER TABLE `section_sequences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
