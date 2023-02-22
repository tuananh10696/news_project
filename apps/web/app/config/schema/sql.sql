-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2023 年 2 月 22 日 10:06
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
(1, '2023-02-22 14:47:55', '2023-02-22 17:57:40', 1, '2', 1, NULL, NULL, '<p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.</p><p><strong>rải nghiệm thiên nhiên</strong></p><p><u>rải nghiệm thiên nhiên</u></p><p><s>rải nghiệm thiên nhiên</s></p><p><i>rải nghiệm thiên nhiên</i></p><p><span style=\"color:hsl(30,75%,60%);\">rải nghiệm thiên nhiên</span></p><p><span style=\"color:hsl(210,75%,60%);\">rải nghiệm thiên nhiên</span></p><p><a href=\"https://github.com/\">rải nghiệm thiên nhiên</a></p><ul><li>rải nghiệm thiên nhiên</li><li>rải nghiệm thiên nhiên</li></ul><p>&nbsp;</p><ol style=\"list-style-type:decimal;\"><li>rải nghiệm thiên nhiên</li><li>rải nghiệm thiên nhiên</li></ol>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(2, '2023-02-22 14:47:55', '2023-02-22 17:57:40', 1, '7', 2, NULL, 'Vườn quốc gia Ba Bể', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(3, '2023-02-22 14:47:55', '2023-02-22 17:57:40', 1, '2', 3, NULL, NULL, '<p><span style=\"color:rgb(17,17,17);\">Ba Bể có những dãy núi đá vôi dựng đứng, nhiều thung lũng lớn và rừng cây xanh rì bao bọc là điểm đến lý tưởng cho du khách mê phiêu lưu, khám phá. Các thác nước, hang động, hồ ở đây tạo nên một khung cảnh thiên nhiên kỳ thú với hơn 550 loài động thực vật quý hiếm. Khám phá Ba Bể bằng thuyền hay trekking hoặc đạp xe xuyên rừng chắc chắn sẽ cho bạn nhiều trải nghiệm đáng nhớ, sau đó hãy nghỉ ngơi, nạp năng lượng ở những căn homestay, nhà nghỉ trong các bản Tày địa phương.</span></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(4, '2023-02-22 14:47:55', '2023-02-22 17:57:40', 1, '3', 4, NULL, NULL, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo, odit?', 'img_4_2f763102-bf80-4793-808b-556b5a5f703e.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '', NULL, NULL, NULL),
(5, '2023-02-22 14:47:55', '2023-02-22 17:57:40', 1, '7', 5, NULL, 'Thác Bản Giốc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(6, '2023-02-22 14:47:55', '2023-02-22 17:57:40', 1, '2', 6, NULL, NULL, '<p><span style=\"color:rgb(17,17,17);\">Bản Giốc là một trong những thác nước đẹp và nổi tiếng nhất Việt Nam và hình ảnh của thắng cảnh này xuất hiện ở vô số các nhà nghỉ, trọ cho du khách. Dòng nước từ Quây Sơn đổ xuống tạo nên thác Bản Giốc đánh dấu hai bờ biên giới Việt Nam và Trung Quốc với khung cảnh ấn tượng. Du khách có thể tham quan thác bằng bè tre, đi sát gần thác để cảm nhận những dòng nước đổ ầm ào tạo bọt tung trắng xóa.</span></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(7, '2023-02-22 14:47:55', '2023-02-22 17:57:40', 1, '3', 7, NULL, NULL, '', 'img_7_9becfd89-b9d2-426f-b535-827f1de24a0f.jpeg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '', NULL, NULL, NULL),
(9, '2023-02-22 14:47:56', '2023-02-22 17:57:40', 1, '18', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(10, '2023-02-22 15:46:29', '2023-02-22 18:15:32', 3, '3', 1, NULL, NULL, '', 'img_10_ec3ce434-3af8-4b02-8e9c-38563290bbc9.jpg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '_self', NULL, NULL, NULL),
(11, '2023-02-22 15:58:41', '2023-02-22 16:47:40', 2, '7', 1, NULL, 'Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(12, '2023-02-22 15:58:41', '2023-02-22 16:47:40', 2, '3', 2, NULL, NULL, '', 'img_12_77721523-ade0-4fff-b1cf-ee8ea2ece09b.jpeg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '', NULL, NULL, NULL),
(13, '2023-02-22 15:58:42', '2023-02-22 16:47:40', 2, '2', 3, NULL, NULL, '<p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p><p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du kháchWebsite du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(14, '2023-02-22 15:58:42', '2023-02-22 16:47:42', 2, '3', 4, NULL, NULL, '', 'img_14_f01ead2b-df46-4954-b35a-233ad2331b84.jpeg', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, '_self', '', NULL, NULL, NULL),
(16, '2023-02-22 16:21:29', '2023-02-22 17:57:40', 1, '1', 10, 'Vườn quốc gia Phong Nha Kẻ Bàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(17, '2023-02-22 16:21:29', '2023-02-22 17:57:40', 1, '7', 8, NULL, 'Vườn quốc gia Phong Nha Kẻ Bàng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(21, '2023-02-22 17:30:00', '2023-02-22 18:15:32', 3, '8', 2, 'test link button', NULL, 'https://www.youtube.com/channel/UCwnSfrWJqhkyxJR3Cp38MMg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '_blank', NULL, NULL, NULL),
(22, '2023-02-22 17:30:00', '2023-02-22 18:15:32', 3, '9', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(23, '2023-02-22 17:30:00', '2023-02-22 18:15:32', 3, '2', 4, NULL, NULL, '<p>Website du lịch nổi tiếng Lonely Planet mới chọn 10 nơi đẹp nhất từ bắc vào nam đem tới cho du khách những trải nghiệm thiên nhiên thú vị nhất.</p><p><strong>rải nghiệm thiên nhiên</strong></p><p><u>rải nghiệm thiên nhiên</u></p><p><s>rải nghiệm thiên nhiên</s></p><p><i>rải nghiệm thiên nhiên</i></p><p><span style=\"color:hsl(30,75%,60%);\">rải nghiệm thiên nhiên</span></p><p><span style=\"color:hsl(210,75%,60%);\">rải nghiệm thiên nhiên</span></p><p><a href=\"https://github.com/\">rải nghiệm thiên nhiên</a></p><ul><li>rải nghiệm thiên nhiên</li><li>rải nghiệm thiên nhiên</li></ul><p>&nbsp;</p><ol style=\"list-style-type:decimal;\"><li>rải nghiệm thiên nhiên</li><li>rải nghiệm thiên nhiên</li></ol>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(24, '2023-02-22 17:30:00', '2023-02-22 18:15:32', 3, '4', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e_f_24_cfe5c4d9-86e3-4bee-b026-117a5e7d6446.doc', 100352, 'file-sample_100kB', 'doc', 0, NULL, NULL, NULL, NULL, NULL),
(25, '2023-02-22 17:47:32', '2023-02-22 18:15:32', 3, '4', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e_f_25_3aff0c9f-9ed5-4004-b41f-dc28d227ec16.pdf', 3028, '<script>alert(111)<:script>', 'pdf', 0, NULL, NULL, NULL, NULL, NULL),
(26, '2023-02-22 17:47:32', '2023-02-22 18:15:32', 3, '4', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'e_f_26_29afb187-e1dc-4b07-a416-fc772a4e7257.xlsx', 5425, 'file_example_XLSX_10', 'xlsx', 0, NULL, NULL, NULL, NULL, NULL),
(27, '2023-02-22 17:57:40', '2023-02-22 17:57:40', 1, '19', 11, NULL, NULL, 'https://www.youtube.com/watch?v=DhBmLublgC0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1', 'youtube', NULL, NULL),
(28, '2023-02-22 18:13:48', '2023-02-22 18:15:32', 3, '20', 8, '', NULL, '', 'img_28_23fda520-9b4b-418f-9a5a-911b7eb875b7.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(29, '2023-02-22 18:34:22', '2023-02-22 19:05:37', 4, '20', 1, ' nhà nghỉ trong các ', NULL, 'Ba Bể có những dãy núi\r\n đá vôi dựng đứng, nhiều thung lũng lớn và rừng cây xanh rì bao bọc là điểm đến lý tưởng cho du khách mê phiêu lưu, khám phá. Các thác nước, hang động, hồ ở \r\nđây tạo nên một khung cảnh thiên nhiên kỳ thú với hơn 550 loài động thực vật quý hiếm. Khám phá Ba Bể bằng thuyền hay trekking hoặc đạp xe xuyên rừng chắc chắn sẽ cho bạn nhiều trải nghiệm đáng nhớ, sau đó hãy nghỉ ngơi, nạp năng lượng ở những căn homestay, nhà nghỉ trong các bản Tày địa phương.', 'img_29_f176086d-755d-46b5-a586-5348ede49f88.jpg', 'img_29_94249d6e-1925-4258-af4e-b0e53dd60e90.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(30, '2023-02-22 18:55:26', '2023-02-22 19:05:37', 4, '20', 2, ' nhà nghỉ trong các ', NULL, 'Ba Bể có những dãy núi\r\n đá vôi dựng đứng, nhiều thung lũng lớn và rừng cây xanh rì bao bọc là điểm đến lý tưởng cho du khách mê phiêu lưu, khám phá. Các thác nước, hang động, hồ ở \r\nđây tạo nên một khung cảnh thiên nhiên kỳ thú với hơn 550 loài động thực vật quý hiếm. Khám phá Ba Bể bằng thuyền hay trekking hoặc đạp xe xuyên rừng chắc chắn sẽ cho bạn nhiều trải nghiệm đáng nhớ, sau đó hãy nghỉ ngơi, nạp năng lượng ở những căn homestay, nhà nghỉ trong các bản Tày địa phương.Ba Bể có những dãy núi\r\n', 'img_30_9086f7ea-09d9-482d-b1e5-bc50e2f4f1c8.jpeg', 'img_30_13e52395-9618-40af-a25c-43cc774568ac.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `info_contents`
--
ALTER TABLE `info_contents`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `info_contents`
--
ALTER TABLE `info_contents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;
