-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2023 年 1 月 06 日 06:04
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
(1, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '3', 1, '', '', 'img_1_81ef459f-d167-4d84-b1f2-bf1cf555adcb.jpg', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(2, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '2', 2, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">株式会社アトムエンジニアリング（本社：栃木県宇都宮市、代表取締役：片岡秀樹）は、ネット通販や物流現場の出荷・仕分け作業において、ロボット・表示器・ソーターなどの設備を使用せずにスマートフォンで仕分け業務を改善する「PASSSORT(パスソート)」のクラウド版をリリースしました。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">クラウド化により、新規にPCなどを購入する必要がなく、低コストでご利用いただけるようになりました。</span></p><p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">【URL】</span><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/passsort/\">https://www.atm-net.co.jp/pro/passsort/</a></p><p>&nbsp;</p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(3, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '1', 3, '1.仕分システム『PASSSORT』クラウド化について', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(4, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '2', 4, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">仕分け作業と検品作業においてスマートフォンを使用するため、インターネット環境があればどこでも作業ができます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">受注データの取り込みや作業進捗などの管理業務は既存PCのWebブラウザ上で作業を行い、サーバーなどが不要になります。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(5, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '3', 5, '', '', 'img_5_5d7c62bb-b951-45b1-ae74-9f4667b297cd.png', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(6, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '1', 6, '2.PASSSORT5つの特徴', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(7, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '5', 7, '◆低コストでシステム導入', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(8, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '2', 8, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">導入の際に購入が必要な機材はスマートフォンとスキャナのみです。最小限の初期費用と月額利用料で導入いただけます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">仕分け間口が増えても追加機器を購入する必要がありません。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(9, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '5', 9, '◆現場に応じたフレキシブルな対応が可能', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(10, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '2', 10, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">スマートフォンを使用することにより、固定設備だけではなく、カゴ車やオリコンなど、場所を問わずに作業をすることができ、お客様の環境や運用にあわせフレキシブルに対応することができます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">スマートフォンからの音声に従って作業ができるので、画面を見ることなく、手元に集中して仕分け作業を効率的に進めることができます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(11, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '3', 11, '', '', 'img_11_bb1653a3-3204-45f6-8e0f-3accba966bf8.png', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(12, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '5', 12, '◆複数商品を複数人で同時作業が可能', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(13, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '2', 13, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">スマートフォンが複数台あれば複数の商品を同時に仕分けることが出来ますので、効率的に仕分作業を進めることが出来ます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(14, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '5', 14, '◆連携機能', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(15, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '2', 15, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムや販売管理システムなどの受注データや出荷指示データと連携することが出来ます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(16, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '5', 16, '◆簡単導入', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(17, '2023-01-05 10:11:38', '2023-01-05 10:17:12', 1, '2', 17, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">利用する機器が少なく操作も簡単なので、簡単に導入することができます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また小規模で利用を始めて、徐々に導入規模を拡大することも出来るといった拡張性の高さがあります。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(18, '2023-01-05 10:16:44', '2023-01-05 10:17:12', 1, '1', 18, '販売ターゲット', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(19, '2023-01-05 10:16:44', '2023-01-05 10:17:12', 1, '2', 19, '', '<ul><li><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">EC・ネット通販業</span></li><li><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">3PL・倉庫業</span></li><li><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">卸・小売</span></li></ul><p>など</p><p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">下記URLよりPASSSORTの導入事例をご覧いただけます。</span><br><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/passsort/\">https://www.atm-net.co.jp/pro/passsort/</a><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">製品に関するお問合せは下記です</span><br><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/contact/\">https://www.atm-net.co.jp/contact/</a></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(20, '2023-01-05 10:16:44', '2023-01-05 10:17:12', 1, '1', 20, 'アトムエンジニアリングについて', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(21, '2023-01-05 10:16:44', '2023-01-05 10:17:12', 1, '2', 21, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">アトムエンジニアリングは物流や製造現場で起こっている問題や悩みを解決し、生産性向上を実現したいと考えパッケージ製品の開発やシステム提案をおこなっています。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">新規でのシステム導入はもちろん、システムの入れ替えや作業の一部分のみ改善など今までの導入経験で培ったノウハウを最大限に利用し、現場改善をおこなっています。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(22, '2023-01-05 10:16:44', '2023-01-05 10:17:12', 1, '1', 22, '会社概要', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(23, '2023-01-05 10:16:44', '2023-01-05 10:17:12', 1, '2', 23, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">会社名：株式会社アトムエンジニアリング</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">所在地：栃木県宇都宮市御幸ケ原町10-44</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">代表者：片岡 秀樹</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">設立：昭和58年</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">URL：</span><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/\">https://www.atm-net.co.jp/</a><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">事業内容：クラウド在庫管理システム「@wms」、及びその他クラウド製品、サービスの提供。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">パッケージ・システムの開発、販売。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">アプリケーション・ソフトウェアの開発、販売。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">コンピューター及び周辺機器に関するハードウェアの販売、保守。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">物流及び通信機器に関するハードウェアの販売。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(24, '2023-01-05 10:16:44', '2023-01-05 10:17:12', 1, '1', 24, 'お客様からのお問い合わせ先', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(25, '2023-01-05 10:16:44', '2023-01-05 10:17:12', 1, '2', 25, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">株式会社アトムエンジニアリング</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">TEL：028-662-0808（9:00～18:00）</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">e-mail：eigyou@atm-net.co.jp（営業）</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(26, '2023-01-05 10:27:02', '2023-01-05 10:27:02', 2, '3', 1, '', '', 'img_26_b7b2832a-fddb-4a39-8dec-275c3ad070a0.jpg', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(27, '2023-01-05 10:27:02', '2023-01-05 10:27:02', 2, '2', 2, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">平素は格別のお引き立てを賜り厚く御礼申し上げます。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">さて、弊社では年末年始にあたり、下記のとおり年末年始休業とさせていただきます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">期間中、お客様には大変ご不便をおかけ致しますが、何卒ご容赦いただきますようお願い申し上げます。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">今年一年のご愛顧に心より感謝申し上げますとともに、来年も変わらぬお引き立てのほど、</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">よろしくお願い申し上げます。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">＜年末年始休業期間＞</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">2022年12月28日(水)　から　2023年1月4日(水)　まで</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">※2023年1月5日(木)から通常通り営業いたします。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">Webからの資料等のご請求は受け付けておりますが、ご返信及び資料等の</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">ご送付は1月5日より順次対応させて頂きます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">不便をおかけしますが、何卒よろしくお願い申し上げます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(28, '2023-01-05 10:27:46', '2023-01-05 10:27:46', 3, '3', 1, '', '', 'img_28_c0d714a5-7c6c-4c81-885e-ba36852f4dfd.jpg', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(29, '2023-01-05 10:27:46', '2023-01-05 10:27:46', 3, '2', 2, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">明けましておめでとうございます。 平素はご愛顧を賜わり、厚く御礼申し上げます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">昨今、納期遅延や各種値上げが発生しており、物流業務の効率化もますます重要になっています。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">弊社といたしましては、このような物流改善のお力になれるようシステムを通して</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">更なるサービス向上に務めて参りますので、より一層のご支援、お引立てを賜りますようお願い申し上げます。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">最後に皆様のご健康とご多幸をお祈りし、新年のご挨拶とさせていただきます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">本年も宜しくお願い申し上げます。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">株式会社アトムエンジニアリング</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">片岡　秀樹</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(31, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '22', 1, '', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', '・出荷してはいけないロットの指定ができなかった\r\n・上位システムとの連携が面倒だった\r\n・システム更新費用が高額だった', '・ロット管理の質が向上しトレーサビリティの強化を実現した\r\n・上位システムとのリアルタイム連携が実現した\r\n・クラウドシステムの導入で費用の削減ができた'),
(32, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '1', 2, '導入事例インタビュー', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(33, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '5', 3, '導入前はどのような課題がありましたか？', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(34, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '11', 4, '', '■システム導入ご担当者様\r\n弊社には元々、3つの課題がありました。\r\n1つが機能面と2つ目がコスト面。3つ目に保守面の課題を抱えていました。\r\n1つ目の機能面についてですが、導入したシステムの規模が我々の実務に合っていなかったことを実感していました。\r\n保守面に関しては、我々もそれほど使いこなせていなかったので柔軟な対応を希望していたのですが、やはりそこがシステム会社さんとの共有ができてなかった所に課題があったのかなと思います。\r\nコスト面は、やはり使いこなせていなかった部分に対する過剰な機能、サービス。\r\nそれに加えてWindowsの更新、これに依存するシステム更新費が高額になっていたの3点です。', 'img_34_a2099220-9058-4497-8be1-f6a7fd7e95c5.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(35, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '5', 5, 'システム導入を決めたポイントを教えて下さい。', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(36, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '11', 6, '', '■システム導入ご担当者様\r\nポイントも3つあります。1つ目は運用全体を把握してくれたので、柔軟な、我々の実務に合わせた提案をしてくれたことです。\r\n2つ目は運用に加えて、我々の発想・想定にないような実務を提案してくれたことです。\r\n3つ目はクラウドシステムの提案です。\r\nオンプレ型からクラウド型に変わったことで（サーバーを置く必要がなく）有効なスペース活用ができるようになりました。また、サーバーの購入コスト、メンテナンスの手間、こういった煩わしさを全部解消してくれたというのが大きな要因です。\r\n\r\n■物流管理ご担当者様\r\n以前のシステムでは（出荷）NGのロットの指定ができなかったので、不具合があっても人的ミスで出荷してしまうことがありました。\r\n@wmsでは、（出荷）NGのロットの指定ができるようになったので、出荷する以前にこの製品は出してはいけないというのが分かるようになったのが有効かなと感じています。\r\n\r\nまた、@wmsではロットを実績でとれるようになったため、作業スピードが格段にあがり、ピッキングのミスが減少し、品質の向上が見られるようになりました。', 'img_36_e3404694-9771-4d69-b668-df24dcd47881.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(37, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '5', 7, 'システム導入の効果を教えて下さい。', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(38, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '11', 8, '', '■システム導入ご担当者様\r\n作業効率の向上、品質の向上がみられ、人に依存することなく、機械に縛られることもなく、柔軟性が非常に高い運用になりました。\r\n総括的にみれば、安心して業務を行うことができるようになったことが大きな効果として挙げられます。\r\n\r\n■物流管理ご担当者様\r\n以前はシステム間連携で、入荷の情報、出荷の情報などのやり取りを同時にできなかったため、特に入荷の情報に関しては12時（に送信）という時間指定がありました。\r\nそのため、その時間に入荷の情報を送れなかった場合、手動で連携を取る必要がありました。\r\n今回、システムを変えたことにより販売管理システムと@wmsがリアルタイムで連携することができるようになったので、手動での調整が要らなくなりました。', 'img_38_21282cab-5d15-4866-9f0c-73640c550212.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(39, '2023-01-05 10:42:02', '2023-01-05 11:36:24', 4, '2', 9, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,153,102);\">ニイヌマ株式会社様、本日は誠にありがとうございました。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,153,102);\">システム導入検討をしている方は是非アトムエンジニアリングまでご連絡ください。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(40, '2023-01-05 10:42:57', '2023-01-05 10:42:57', 5, '25', 1, '', NULL, 'img_40_c3e6095a-d254-4e3f-b245-474ba4149b5d.jpg', 'img_40_2e5f9a4b-850b-4e5d-8b4a-df27b3c2e8bf.jpg', 'img_40_60a02e3a-d1d8-4c61-a9e1-8f638e137485.jpg', '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(41, '2023-01-05 11:26:03', '2023-01-05 11:36:24', 4, '1', 10, 'システム導入後の座談会', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(42, '2023-01-05 11:26:03', '2023-01-05 11:36:24', 4, '23', 11, '', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(43, '2023-01-05 11:26:03', '2023-01-05 11:36:24', 4, '24', 12, '', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(44, '2023-01-05 11:26:03', '2023-01-05 11:36:24', 4, '26', 13, '', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(45, '2023-01-05 11:44:30', '2023-01-05 11:48:23', 11, '22', 1, '', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', '・出荷件数が多い時には作業生産性が低下\r\n・ピッキングの際の倉庫内の移動距離が長い', '・トータルピッキングにより倉庫内の移動距離を短縮\r\n・システム導入の初期費用を削減\r\n・作業者実績の管理を効率化'),
(46, '2023-01-05 11:44:30', '2023-01-05 11:48:23', 11, '1', 2, '導入事例インタビュー', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(47, '2023-01-05 11:44:30', '2023-01-05 11:48:23', 11, '5', 3, '導入前はどのような課題がありましたか？', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(48, '2023-01-05 11:44:30', '2023-01-05 11:48:23', 11, '11', 4, '', 'PASSSORTの導入前も商品をバーコードで管理していましたが、出荷作業の際には、シングルピッキングで1件のご注文をピッキングから梱包までを1人で対応していました。\r\n\r\nその当時の課題としては、1日で多くの出荷件数を対応しようとすると生産性が落ちてしまうという点です。\r\n出荷件数が多くなった場合、それに対応するため、人員を増やすと、商品が保管されているレイアウトの関係で、スペースが狭く作業効率が悪くなることが原因でした。', 'img_48_35df6150-e49c-4ee4-885d-eabedd520f50.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(49, '2023-01-05 11:44:30', '2023-01-05 11:48:23', 11, '5', 5, 'システム導入を決めたポイントを教えて下さい。', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(50, '2023-01-05 11:44:30', '2023-01-05 11:48:23', 11, '11', 6, '', 'アトムさんからの提案でポイントだったことは\r\n\r\n1つ目は、フリーロケーションで在庫管理をしている倉庫からトータルピッキングで持ってきた商品を仕分けることができる。\r\n2つ目としては、既存のWMSを使用しながら、PCだけで出荷方法の幅を広げることができる柔軟性がある。\r\n3つ目としては、表示器など機器も不要で初期投資を抑えることができる。\r\n\r\nこの3つのポイントがありました。', 'img_50_9ac4568b-b0cb-4553-a644-6d949533211a.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(51, '2023-01-05 11:44:30', '2023-01-05 11:48:23', 11, '11', 8, '', '1品1品バーコードをスキャンして仕分けることができる仕組みが効果的だと感じています。\r\nまた、以前はシングルピッキングをしていましたが、現状では、トータルピッキングにより複数の商品を一度に倉庫から持ってこられるので、倉庫内を移動する歩数を削減でき、生産性をアップすることができました。\r\n\r\nさらに、作業者実績も出力できるので、生産性などの管理も同時に行えます。', 'img_51_179777c3-56f5-4092-b473-f29ca90267ae.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(52, '2023-01-05 11:44:30', '2023-01-05 11:48:23', 11, '2', 9, '', '<p><span style=\"color:#339966;\">株式会社mighty様、本日は誠にありがとうございました。</span><br><span style=\"color:#339966;\">システム導入をご検討されている方はアトムエンジニアリングまでご連絡ください。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(54, '2023-01-05 11:46:34', '2023-01-05 11:48:23', 11, '5', 7, 'システム導入の効果を教えて下さい。', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(55, '2023-01-05 11:46:50', '2023-01-05 11:48:23', 11, '26', 10, '', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(56, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '22', 1, '', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', '・振分時間・コスト削減・振分ミスに課題があった', '・出荷作業時間を約53％削減\r\n・出荷検品作業の負担を軽減\r\n・商品知識がないスタッフでも作業が可能\r\n・販売店様の入荷検品の負担を軽減'),
(57, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '1', 2, '導入事例インタビュー', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(58, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '5', 3, '導入前はどのような課題がありましたか？', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(59, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '11', 4, '', '従来の方法は出荷の際に紙の振分表を基に摘み取り式で行っておりました。\r\n弊社としては振分時間・コスト削減・振分ミスが大きな課題でした。\r\n\r\n物流展で実際にPASSSORTを拝見させて頂き、弊社でも実用が可能か打ち合わせを行わせていただきました。', 'img_59_9ed7d50b-fc21-4113-98ba-3ad27304e2fb.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(60, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '5', 5, 'システム導入を決めたポイントを教えて下さい。', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(61, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '11', 6, '', 'PASSSORTの魅力は、弊社が課題としていた時間・コスト削減・振分ミスに対応できる機能が十分揃っていた事です。\r\n商品知識がないスタッフでも、スマートフォンの操作で、すぐに振分を行う事が出来るのが大きなポイントだと感じます。\r\n\r\nまた、振分後の間口検品機能が非常に効果的です。\r\n弊社では、今まで振分を行った後、出荷場で検品作業を行っておりました。\r\n入荷品が多くなれば、必然的に出荷応援で人員を補填する必要がありましたが、間口検品を行う事で、出荷日当日の検品負担が軽減され、その課題はすぐに解決しました。', 'img_61_62e224a2-a71b-459c-9c7c-d7b30977d8f5.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(62, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '5', 7, 'システム導入の効果を教えて下さい。', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(63, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '11', 8, '', '従来の方法と比較した結果、現時点で作業時間が約５３％削減できたという結果が出ました。\r\n結果が出た要因として、振分時間・人員削減が考えられます。\r\n弊社で出荷日をコントロールできる商品に関しては、入荷から出荷までのスピードが上がりました。\r\n\r\nまた、従来の方法では、伝票枚数なども多くなり販売店様の検品などの負担になっていた部分もありましたが、そういった点も改善されました。\r\nPASSSORTの導入により振分だけでなく、出荷場での効率も大きく改善され、目に見える結果に大満足です。', 'img_63_c4848f02-dfde-4137-8949-d3925f6a0a01.jpg', NULL, NULL, 'right', '', 0, '', '', 0, '', '', '', NULL, NULL),
(64, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '2', 9, '', '<p><span style=\"color:#339966;\">谷山商事株式会社様、本日は誠にありがとうございました。</span><br><span style=\"color:#339966;\">システム導入をご検討されている方はアトムエンジニアリングまでご連絡ください。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(65, '2023-01-05 11:53:52', '2023-01-05 11:53:52', 13, '26', 10, '', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(68, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 3, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">導入を検討しているシステムが自社の業種・規模に対応しているのかを確認することが重要です。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">業種・規模によって在庫管理の業務フローや必要な機能も変わり、使わない機能が多いと導入費用も高くなり、システムも使いにくくなります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また、自社に合ったパッケージなのかを確認するためには、製品を紹介しているWebサイトで導入事例や機能などを確認したり、実際に電話やお問い合わせフォームで問い合わせたりする方法も効果的です。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(70, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 5, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムを誰が、何処で、何を管理するために利用するか事前に明確に規定しておくことが重要です。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">利用する人や場所によって必要なシステムの機能や機器なども変わるためです。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">自社の条件とパッケージの対応できる内容が合っているかを事前に確認し、実際の機器を使用したデモを依頼するといった方法が効果的です。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(72, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 7, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">管理したい商品・在庫の単位などに在庫管理システムが対応しているのか事前に確認する必要もあります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">自社が利用を検討している在庫管理システムが希望の単位に対応していない場合には、何か対応方法があるか、システム会社に問い合わせることも重要です。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(74, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 9, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">現場の作業スタッフが検品業務を行う場合、現場目線で効果的な検品方法を選択することが重要になります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">タブレット・スマートフォンなど、実際に検品で使用する機器の操作が複雑であったり、画面が見づらかったりすると生産性が落ちてしまうことも考えられます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">出荷精度など物流品質とバランスを取りながら、適切な検品方法や機器を選択することが重要になります。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(76, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 11, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムをクラウド型にするのか？オンプレ型にするのかを事前に検討することは重要です。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">各々メリットとデメリットがあるので、それを十分に理解した上で、自社の運用にあったシステムを導入する必要があります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">一般的には、クラウド型は初期導入費用が安く、月額の利用料を一定額負担する必要がありますが、サーバーなどを自社で保有する必要がありません。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">オンプレ型は、初期導入費用は比較的高いですが、サーバーなどを自社に設置することによりセキュリティ面を強化しやすい点が挙げられます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">ただし、サーバーなどの故障やメンテナンスなど、ある程度自社での管理が必要となります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また、セキュリティなどに関する社内ルールを確認し、それに準拠する必要もあるので、それらを考慮して製品の比較検討をする必要があります。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(78, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 13, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">システムを導入した後にどのようなアフターフォローを受けられるのかも在庫管理システムを安心して導入する上では重要になります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">システムを導入して実際に運用をしていくことで運用に合わない面などが見えることもあるためです。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">充実したアフターフォローを得られるか判断するために、システム導入の商談を進める中でレスポンスの早さや対応の丁寧さなども確認する必要があります。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(80, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 15, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムを導入してもサポートが充実していないと、安心して運用することができません。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">システムが上手く動かない時に電話やメールでサポートが受けられるか？</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">自社の業務時間がサポート時間に含まれているかなど確認することも重要です。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(81, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '1', 16, 'まとめ', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(82, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 17, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムの機能面や費用面での比較も重要ですが、実際に運用を行い、長く使い続けることを考えるとスピーディーで丁寧なサポートも重要になります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">実際の現場の運用方法を考慮した上で、在庫管理システムの提供会社に相談してみてはいかがでしょうか。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(83, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '1', 18, '物流ソリューション一覧', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(84, '2023-01-05 11:59:58', '2023-01-06 00:08:50', 15, '2', 19, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">アトムエンジニアリングの物流ソリューションをご紹介します</span></p><figure class=\"table\"><table><thead><tr><th><p class=\"text-center\">課題</p></th><th><p class=\"text-center\">対応方法</p></th><th><p class=\"text-center\">ソリューション</p></th></tr></thead><tbody><tr><td>ご出荷を防止したい</td><td><span style=\"color:rgb(0,0,0);\">ハンディターミナルやスマートフォンでバーコードを照合</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫の先入れ先出しをしたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷日、製造日、賞味期限などの日付を管理し、先入先出による出荷引当を実施</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫管理の精度を上げたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷・入庫・出庫時にハンディターミナルやスマートフォンでバーコードを照合</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫のロット管理、賞味期限管理を行いたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷時にロットや賞味期限をシステムに登録し、履歴を管理</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">バーコードを利用した出荷検品だけ行いたい</span></td><td><span style=\"color:rgb(0,0,0);\">ハンディターミナルやスマートフォンを活用したバーコード検品が可能な検品システムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/barcorrect/\">検品システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">トレーサビリティの対応をしたい</span></td><td><span style=\"color:rgb(0,0,0);\">商品の賞味期限やロット番号を管理し、出荷履歴が見えるシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">ピッキング作業の時間を短縮したい</span></td><td><span style=\"color:rgb(0,0,0);\">表示器を使用したデジタルピッキングシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/digipica/\">デジタルピッキングシステム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">仕分け作業の時間短縮をしたい</span></td><td><span style=\"color:rgb(0,0,0);\">表示器を使用したデジタルアソートシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/shiwakedou/\">デジタルアソートシステム</a></td></tr></tbody></table></figure>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(85, '2023-01-05 12:10:57', '2023-01-06 00:08:50', 15, '1', 1, '7つのポイント', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(86, '2023-01-05 12:10:57', '2023-01-06 00:08:50', 15, '5', 2, '対応業種・規模', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(87, '2023-01-05 12:10:57', '2023-01-06 00:08:50', 15, '5', 4, 'システムを利用する範囲の規定', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(88, '2023-01-05 12:10:57', '2023-01-06 00:08:50', 15, '5', 6, '管理したい商品・在庫の単位への対応', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(89, '2023-01-05 12:10:57', '2023-01-06 00:08:50', 15, '5', 8, '対応できる検品方法の確認', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(90, '2023-01-05 12:10:57', '2023-01-06 00:08:50', 15, '5', 10, 'クラウド型・オンプレ型の選択', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(91, '2023-01-05 12:10:57', '2023-01-06 00:08:50', 15, '5', 12, '導入後のアフターフォロー', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(92, '2023-01-05 12:10:57', '2023-01-06 00:08:50', 15, '5', 14, 'サポート体制', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(93, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 1, 'ハンディターミナルを活用したピッキング', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(94, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 2, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムなどを活用し、ハンディターミナルの画面にピッキング指示を表示。ピッキングする際に棚や商品のバーコードをハンディターミナルで読み取ることでピッキングミスを防止できます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(95, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 3, 'タブレット・スマートフォンを活用したピッキング', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(96, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 4, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムなどを活用し、スマートフォンなどの画面にピッキング作業の内容を表示。商品をピッキングする際に棚や商品のバーコードをスマートフォンなどと連係させた小型のスキャナなどで読み取ることでピッキングミスを防止できます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(97, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 5, 'ピッキングカートを活用したピッキング', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(98, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 6, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムなどと連係しピッキングする商品の場所がピッキングカートの画面に表示されるので、その指示内容にしたがってピッキング作業を行えます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">一般的には、一度に複数の出荷先のピッキングが行えるよう商品を保管するボックスがカートに複数ついているので、複数のオーダーのピッキングを一度に行えます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">（比較的狭い倉庫でも導入できる</span><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/tremas/\">コンパクトなピッキングカートはこちら</a><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">）</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(99, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 7, '音声によるピッキング', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(100, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 8, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">在庫管理システムなどを活用し、作業スタッフが身に着けているヘッドフォンに音声でピッキング指示を伝えます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">作業端末を目視で確認する必要がないためピッキング作業に集中でき、業務の効率化を実現します。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(101, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 9, 'デジタル表示器を活用したピッキング', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(102, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 10, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">デジタルピッキングシステムを導入し、ピッキングする各間口にデジタル表示器を設置します。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">ピッキング指示をシステムに取り込むと、ピッキングする商品が入った間口の表示器のランプが点灯。デジタル表示器にピッキングする個数も表示されるので、直感的・スピーディーに作業が行えます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(103, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 11, 'スマートグラスを活用したピッキング', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(104, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 12, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">ピッキングの指示データをスマートグラスなどに投影するARの技術を活用したピッキングの利用も始まっています。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">機器を手で持つ必要がないので、ハンズフリーで作業が行え、ピッキングをスピーディーに行うことができます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(105, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 13, 'プロジェクターを活用したピッキング', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(106, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 14, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">プロジェクターを使用してピッキングする棚を照らすプロジェクションピッキングの利用も始まっています。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">直感的に作業が行え、表示器なども必要としないので、小さい部品など間口の数が多い棚にも設置することが可能です。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(107, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 15, '物流ロボットを活用したピッキング', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(108, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 16, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">作業するスタッフの所に、商品が入った棚ごと持ってくる物流ロボットを活用する倉庫も増えており、これにより作業スタッフの倉庫内の移動距離を大幅に短縮することができます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また、作業するスタッフと一緒に倉庫内を動き回り、物流ロボットに設置された複数の棚に出荷先ごとにピッキングした商品を投入するタイプの物流ロボットも活用が増えています。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(109, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 17, 'まとめ', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(110, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 18, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">ピッキング作業を正確、スピーディーに行えるようになると、倉庫作業の生産性向上・物流品質の改善を実現することができます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">倉庫作業の見直しを検討している方は、ピッキングシステムの導入を検討してみてはいかがでしょうか？</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(111, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '1', 19, '物流ソリューション一覧', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(112, '2023-01-05 12:14:12', '2023-01-06 00:08:43', 16, '2', 20, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">アトムエンジニアリングの物流ソリューションをご紹介します</span></p><figure class=\"table\"><table><thead><tr><th><p class=\"text-center\">課題</p></th><th><p class=\"text-center\">対応方法</p></th><th><p class=\"text-center\">ソリューション</p></th></tr></thead><tbody><tr><td>ご出荷を防止したい</td><td><span style=\"color:rgb(0,0,0);\">ハンディターミナルやスマートフォンでバーコードを照合</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫の先入れ先出しをしたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷日、製造日、賞味期限などの日付を管理し、先入先出による出荷引当を実施</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫管理の精度を上げたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷・入庫・出庫時にハンディターミナルやスマートフォンでバーコードを照合</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫のロット管理、賞味期限管理を行いたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷時にロットや賞味期限をシステムに登録し、履歴を管理</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">バーコードを利用した出荷検品だけ行いたい</span></td><td><span style=\"color:rgb(0,0,0);\">ハンディターミナルやスマートフォンを活用したバーコード検品が可能な検品システムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/barcorrect/\">検品システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">トレーサビリティの対応をしたい</span></td><td><span style=\"color:rgb(0,0,0);\">商品の賞味期限やロット番号を管理し、出荷履歴が見えるシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">ピッキング作業の時間を短縮したい</span></td><td><span style=\"color:rgb(0,0,0);\">表示器を使用したデジタルピッキングシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/digipica/\">デジタルピッキングシステム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">仕分け作業の時間短縮をしたい</span></td><td><span style=\"color:rgb(0,0,0);\">表示器を使用したデジタルアソートシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/shiwakedou/\">デジタルアソートシステム</a></td></tr></tbody></table></figure>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(113, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '1', 1, 'ロケーション番号を付ける', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(114, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '2', 2, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">作業スタッフが迷わない倉庫にするためにはロケーション管理が重要になります。商品の保管場所に対してロケーション番号を割り振ることで商品の保管場所を具体的に指示できるようになり、今自分が倉庫の何処にいるのかも分かりやすくなります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">ロケーション番号は拠点・エリア・列・連・段・間口ごとに番号を割り振る方法が一般的です。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(115, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '1', 3, '倉庫内の見通しを良くする', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(116, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '2', 4, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">作業スタッフが商品を探しやすくするために整理整頓などを行い、倉庫内の見通しを良くすることも重要です。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また、比較的高い場所にロケーション番号を表示することで、遠くからでも確認することができるようになります。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(117, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '1', 5, '作業動線を決める', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(118, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '2', 6, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">倉庫内の作業動線を事前に決めてルール化することで、比較的スムーズにピッキング作業に慣れることができ、これにより倉庫内で迷うことも減ります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また、作業のルールを決め、それを守ってもらうようにすることで、作業ミスも軽減することができます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(119, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '1', 7, '商品をまとめて保管する', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(120, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '2', 8, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">同じカテゴリーの商品は一ヶ所にまとめて保管しておくことで、作業スタッフがどの場所にあるのかを覚えやすく、作業もスピーディーになります。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また、その際には似た商品を間違ってピッキングしないように、類似商品だけは離れた棚に保管したり、間違えやすい商品があることを作業スタッフ間で情報共有することも重要になります。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(121, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '1', 9, '看板の表示内容を工夫する', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(122, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '2', 10, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">見やすい看板を設置することで、倉庫内で迷わないようにします。ロケーション番号の数字を大きく表示したり、必要のない情報を減らしシンプルにすることで視認性を向上できます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また、倉庫の柱や壁の高い場所に倉庫エリアの大まかなイラストが描かれた看板を設置するのも効果的です。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(123, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '1', 11, '看板の色を工夫する', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(124, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '2', 12, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">道路標識のように目を引く色を使って看板の表示を目立たせる工夫も効果的で、これにより看板を見つけやすくなり、倉庫内で迷うことも減らせます。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">また、黒地に黄色の文字、遠くからでも目立つ赤い色など色の工夫をすることで、遠くからでも目立つ看板にすることができます。</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(125, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '1', 13, 'まとめ', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(126, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '2', 14, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">新人スタッフなどが倉庫内で迷わないようにするためには、一定のルールを基に分かりやすいロケーション番号を割り振る。倉庫内の見通しを良くするために整理整頓を行う。分かりやすい、見やすい看板を設置するなどが効果的です。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">倉庫内作業の改善をしたいという方は参考にされてみてはいかがでしょうか？</span></p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(127, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '1', 15, '物流ソリューション一覧', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(128, '2023-01-05 12:19:22', '2023-01-06 00:21:31', 17, '2', 16, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">アトムエンジニアリングの物流ソリューションをご紹介します</span></p><figure class=\"table\"><table><thead><tr><th><p class=\"text-center\">課題</p></th><th><p class=\"text-center\">対応方法</p></th><th><p class=\"text-center\">ソリューション</p></th></tr></thead><tbody><tr><td>ご出荷を防止したい</td><td><span style=\"color:rgb(0,0,0);\">ハンディターミナルやスマートフォンでバーコードを照合</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫の先入れ先出しをしたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷日、製造日、賞味期限などの日付を管理し、先入先出による出荷引当を実施</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫管理の精度を上げたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷・入庫・出庫時にハンディターミナルやスマートフォンでバーコードを照合</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">在庫のロット管理、賞味期限管理を行いたい</span></td><td><span style=\"color:rgb(0,0,0);\">入荷時にロットや賞味期限をシステムに登録し、履歴を管理</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">バーコードを利用した出荷検品だけ行いたい</span></td><td><span style=\"color:rgb(0,0,0);\">ハンディターミナルやスマートフォンを活用したバーコード検品が可能な検品システムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/barcorrect/\">検品システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">トレーサビリティの対応をしたい</span></td><td><span style=\"color:rgb(0,0,0);\">商品の賞味期限やロット番号を管理し、出荷履歴が見えるシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.zaikokanri.com/\">在庫管理システム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">ピッキング作業の時間を短縮したい</span></td><td><span style=\"color:rgb(0,0,0);\">表示器を使用したデジタルピッキングシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/digipica/\">デジタルピッキングシステム</a></td></tr><tr><td><span style=\"color:rgb(0,0,0);\">仕分け作業の時間短縮をしたい</span></td><td><span style=\"color:rgb(0,0,0);\">表示器を使用したデジタルアソートシステムの導入</span></td><td><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/pro/shiwakedou/\">デジタルアソートシステム</a></td></tr></tbody></table></figure>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(129, '2023-01-05 12:32:06', '2023-01-05 12:33:40', 18, '5', 1, 'どんな仕事をしていますか？', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(130, '2023-01-05 12:32:06', '2023-01-05 12:33:40', 18, '2', 2, '', '商品を一括管理し、各配送先に仕分を行い出荷するまでの入出荷管理システムの開発をしています。', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(131, '2023-01-05 12:32:06', '2023-01-05 12:33:40', 18, '5', 3, '仕事上、心がけていることは？', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(132, '2023-01-05 12:32:06', '2023-01-05 12:33:40', 18, '2', 4, '', '疑問や思ったこと等があった場合、遠慮して蓋をしてしまうのではなく積極的に発言し自分の考えを周囲に伝えるように心がけています。', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(133, '2023-01-05 12:32:06', '2023-01-05 12:33:40', 18, '5', 5, 'どんな仕事をしていますか？', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(134, '2023-01-05 12:32:06', '2023-01-05 12:33:40', 18, '2', 6, '', '商品を一括管理し、各配送先に仕分を行い出荷するまでの入出荷管理システムの開発をしています。', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(135, '2023-01-05 12:32:06', '2023-01-05 12:33:40', 18, '5', 7, '仕事上、心がけていることは？', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(136, '2023-01-05 12:32:06', '2023-01-05 12:33:40', 18, '2', 8, '', '疑問や思ったこと等があった場合、遠慮して蓋をしてしまうのではなく積極的に発言し自分の考えを周囲に伝えるように心がけています。', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(137, '2023-01-06 01:07:58', '2023-01-06 01:07:58', 20, '1', 1, 'H2見出し', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(138, '2023-01-06 01:07:58', '2023-01-06 01:07:58', 20, '5', 2, 'H3見出し', NULL, '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(139, '2023-01-06 01:07:58', '2023-01-06 01:07:58', 20, '2', 3, '', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">先日、宇都宮大学で物流におけるICTの活用について物流管理士でもある弊社スタッフが講義を行いました。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">この講義は、身の回りにあるICTについて具体的な事例を紹介し、どのように利用されているのかを分かりやすく説明する内容となっています。</span><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">今回は、在庫管理システムや物流システムの概要・活用方法や実際に物流システムを導入した企業の導入事例動画などを紹介しました。</span><br><br><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">今後も、地元との繋がりを大切にし、教育機関など地域社会にも貢献できるよう活動を続けて参ります。</span></p><p>&nbsp;</p><ul><li><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">リスト</span></li><li><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">リスト</span></li><li><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">リスト</span></li></ul><p>&nbsp;</p><p><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.atm-net.co.jp/topics/2022/121871/\"><span style=\"background-color:rgb(255,255,255);color:rgb(51,51,51);\">リンク</span></a></p><figure class=\"table\"><table><thead><tr><th>見出し</th><th>見出し</th><th>見出し</th></tr></thead><tbody><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table></figure><p>&nbsp;</p>', '', NULL, NULL, '', '', 0, '', '', 0, '', '', '', NULL, NULL),
(140, '2023-01-06 01:07:58', '2023-01-06 01:07:58', 20, '3', 4, '', '', 'img_140_2c1aa663-41df-4e81-af6b-a672977eaa54.jpg', NULL, NULL, '', '', 0, '', '', 0, '_self', '', '', NULL, NULL),
(141, '2023-01-06 01:07:58', '2023-01-06 01:07:58', 20, '11', 5, '', '右回り込み右回り込み右回り込み右回り込み右回り込み右回り込み右回り込み右回り込み右回り込み右回り込み右回り込み', 'img_141_040c94ba-aaf6-4174-b82e-e467a7785bc3.jpg', NULL, NULL, 'left', '', 0, '', '', 0, '', '', '', NULL, NULL),
(142, '2023-01-06 01:07:58', '2023-01-06 01:07:58', 20, '8', 6, 'リンクボタン', 'https://www.atm-net.co.jp/topics/2022/121871/', '', NULL, NULL, '', '', 0, '', '', 0, '', '_self', '', NULL, NULL),
(143, '2023-01-06 01:07:58', '2023-01-06 01:07:58', 20, '4', 7, '', NULL, '', NULL, NULL, '', 'e_f_143_d720aa92-a7d6-421d-92af-c4b93bbef6c0.xlsx', 7786, 'Excelテスト1', 'xlsx', 0, '', '', '', NULL, NULL),
(144, '2023-01-06 01:47:57', '2023-01-06 01:47:57', 12, '25', 1, '', NULL, 'img_144_e32159cf-3eaf-4c5c-89f5-6686618463b4.jpg', 'img_144_cb6f4654-5c25-445f-b3e0-762cddf0824e.jpg', '', '', '', 0, '', '', 0, '', '', '', NULL, NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `infos`
--
ALTER TABLE `infos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `page_config_extensions`
--
ALTER TABLE `page_config_extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `page_config_items`
--
ALTER TABLE `page_config_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
