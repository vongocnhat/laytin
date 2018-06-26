-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2018 at 05:12 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crawler`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Phản Động', NULL),
(2, 'Tin Tức', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `pubDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourceOfNews` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `category_id`, `title`, `link`, `description`, `pubDate`, `sourceOfNews`, `active`) VALUES
(1, 1, 'TSHT_20180602', 'http://daiphatthanhvietnam.com/?p=12570', NULL, '2018-06-02 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(2, 1, 'TGNN20180602_ThienY_HP_ML', 'http://daiphatthanhvietnam.com/?p=12619', NULL, '2018-06-02 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(3, 1, 'TCXV_20180601', 'http://daiphatthanhvietnam.com/?p=12603', NULL, '2018-06-01 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(4, 1, 'CQN20180531', 'http://daiphatthanhvietnam.com/?p=12708', NULL, '2018-05-31 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(5, 1, 'TSBT_20180530', 'http://daiphatthanhvietnam.com/?p=12524', NULL, '2018-05-30 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(6, 1, 'DHcQN_20180528', 'http://daiphatthanhvietnam.com/?p=12521', NULL, '2018-05-28 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(7, 1, 'NVDHN_20180527', 'http://daiphatthanhvietnam.com/?p=12518', NULL, '2018-05-27 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(8, 1, 'TGNN_20180526PL_Gs Luu Trung Khao', 'http://daiphatthanhvietnam.com/?p=12496', NULL, '2018-05-26 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(9, 1, 'TSHT_20180526', 'http://daiphatthanhvietnam.com/?p=12466', NULL, '2018-05-26 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(10, 1, 'VQHK&TG_20180526', 'http://daiphatthanhvietnam.com/?p=12463', NULL, '2018-05-26 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(11, 1, 'TCXV_20180525', 'http://daiphatthanhvietnam.com/?p=12493', NULL, '2018-05-25 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(12, 1, 'TSBT_20180523', 'http://daiphatthanhvietnam.com/?p=12406', NULL, '2018-05-23 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(13, 1, 'DHcQN_20180521', 'http://daiphatthanhvietnam.com/?p=12370', NULL, '2018-05-21 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(14, 1, 'TSHT_20180519', 'http://daiphatthanhvietnam.com/?p=12395', NULL, '2018-05-19 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(15, 1, 'TGNN_20180519-HoiLuan_HP_ThienY_NguyenChinhKet', 'http://daiphatthanhvietnam.com/?p=12380', NULL, '2018-05-19 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(16, 1, 'VQHK&TG_20180519', 'http://daiphatthanhvietnam.com/?p=12374', NULL, '2018-05-19 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(17, 1, 'TCXV_20180518', 'http://daiphatthanhvietnam.com/?p=12490', NULL, '2018-05-18 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(18, 1, 'CQN_20180517', 'http://daiphatthanhvietnam.com/?p=12704', NULL, '2018-05-17 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(19, 1, 'TSBT_20180516', 'http://daiphatthanhvietnam.com/?p=12403', NULL, '2018-05-16 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(20, 1, 'NVDHN_20180513', 'http://daiphatthanhvietnam.com/?p=12383', NULL, '2018-05-13 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(21, 1, 'TCXV_20170714-The gioi trong tuan qua', 'http://daiphatthanhvietnam.com/?p=8886', NULL, '2017-07-14 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(22, 1, 'Trở ngại ngoại giao vì ông Trump nói chuyện với TT Đài Loan?', 'http://daiphatthanhvietnam.com/?p=6237', NULL, '2016-12-07 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(23, 1, 'Những người bạn của Đài Loan ‘bảo vệ’ ông Trump', 'http://daiphatthanhvietnam.com/?p=6235', NULL, '2016-12-07 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(24, 1, 'Ô. Trump “tháu cáy” dùng Đài Loan “đánh” Trung Cộng?', 'http://daiphatthanhvietnam.com/?p=6231', NULL, '2016-12-07 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(25, 1, 'Tái kiểm phiếu: Tự bôi tro trát trấu vào mặt', 'http://daiphatthanhvietnam.com/?p=6111', NULL, '2016-11-28 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(26, 1, 'LM Nguyễn Văn Khải nói về “bác Hồ của chúng ta” trong lễ tưởng niệm ông Ngô Đình Diệm', 'http://daiphatthanhvietnam.com/?p=5831', NULL, '2016-11-12 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(27, 1, 'Tìm về lịch sử – Hoành Sơn Nhất Đái', 'http://daiphatthanhvietnam.com/?p=5439', NULL, '2016-10-22 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(28, 1, 'Donald Trump ” độc cô cầu bại”', 'http://daiphatthanhvietnam.com/?p=5419', NULL, '2016-10-17 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(29, 1, 'Các anh một chính phủ khốn nạn!!!', 'http://daiphatthanhvietnam.com/?p=5348', NULL, '2016-10-12 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(30, 1, 'Tự Do Báo Chí: Thế Lực và Trách Nhiệm của Đệ Tứ Quyền', 'http://daiphatthanhvietnam.com/?p=5313', NULL, '2016-10-11 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(31, 1, 'Hãy vô hiệu hóa các thỏa thuận giữa chính phủ VN và Formosa trước khi kiện Formosa ra tòa án quốc tế!', 'http://daiphatthanhvietnam.com/?p=5301', NULL, '2016-10-10 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(32, 1, '“Sấm Trạng Trình” nói gì về sự sụp đổ của nhà Sản?', 'http://daiphatthanhvietnam.com/?p=5293', NULL, '2016-10-10 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(33, 1, 'Cộng sản giết chết tình mẫu tử', 'http://daiphatthanhvietnam.com/?p=5288', NULL, '2016-10-10 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(34, 1, 'Bài giảng của LM Nam Phong', 'http://daiphatthanhvietnam.com/?p=5247', NULL, '2016-10-09 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(35, 1, 'Hỡi người biểu tình, hãy luôn cảnh giác…', 'http://daiphatthanhvietnam.com/?p=5199', NULL, '2016-10-05 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(36, 1, 'Vì sao Nguyễn Như Phong lại tự đút đầu vào “tử địa”?', 'http://daiphatthanhvietnam.com/?p=5182', NULL, '2016-10-03 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(37, 1, 'Quỳnh Lưu, tiếng thét vỡ bờ!', 'http://daiphatthanhvietnam.com/?p=5180', NULL, '2016-10-03 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(38, 1, 'ĐMHCM đường “Bác” đi trùng điệp bất nhân (P4)', 'http://daiphatthanhvietnam.com/?p=5178', NULL, '2016-10-03 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(39, 1, 'Chính quyền Việt Nam có dám biến Hà Tĩnh thành một “Thiên An Môn” Trung Quốc?', 'http://daiphatthanhvietnam.com/?p=5176', NULL, '2016-10-03 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(40, 1, 'Ngoại giao cây tre: Trễ quá rồi bác Trọng ơi!', 'http://daiphatthanhvietnam.com/?p=5143', NULL, '2016-10-02 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(41, 1, 'RadioMEHCG-2018-06-22-Friday', 'http://daiphatthanhvietnam.com/?p=12779', NULL, '2018-06-22 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(42, 1, 'RadioMEHCG-2018-06-21-Thursday', 'http://daiphatthanhvietnam.com/?p=12774', NULL, '2018-06-21 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(43, 1, 'RadioMEHCG-2018-06-20-Wednesday', 'http://daiphatthanhvietnam.com/?p=12771', NULL, '2018-06-20 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(44, 1, 'RadioMEHCG-2018-06-19-Tuesday', 'http://daiphatthanhvietnam.com/?p=12768', NULL, '2018-06-19 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(45, 1, 'RadioMeHCG-2018-06-18-Monday', 'http://daiphatthanhvietnam.com/?p=12782', NULL, '2018-06-18 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(46, 1, 'RadioMeHCG-2018-06-17-Sunday', 'http://daiphatthanhvietnam.com/?p=12765', NULL, '2018-06-17 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(47, 1, 'RadioMeHCG-2018-06-16-Saturday', 'http://daiphatthanhvietnam.com/?p=12762', NULL, '2018-06-16 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(48, 1, 'RadioMEHCG-2018-06-15-Friday', 'http://daiphatthanhvietnam.com/?p=12698', NULL, '2018-06-15 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(49, 1, 'RadioMEHCG-2018-06-14-Thursday', 'http://daiphatthanhvietnam.com/?p=12695', NULL, '2018-06-14 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(50, 1, 'RadioMEHCG-2018-06-13-Wednesday', 'http://daiphatthanhvietnam.com/?p=12692', NULL, '2018-06-13 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(51, 1, 'RadioMEHCG-2018-06-12-Tuesday', 'http://daiphatthanhvietnam.com/?p=12689', NULL, '2018-06-12 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(52, 1, 'RadioMeHCG-2018-06-11-Monday', 'http://daiphatthanhvietnam.com/?p=12686', NULL, '2018-06-11 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(53, 1, 'RadioMEHCG-2018-06-10-Sunday', 'http://daiphatthanhvietnam.com/?p=12683', NULL, '2018-06-10 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(54, 1, 'RadioMEHCG-2018-06-09-Saturday', 'http://daiphatthanhvietnam.com/?p=12680', NULL, '2018-06-09 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(55, 1, 'RadioMEHCG-2018-06-08-Friday', 'http://daiphatthanhvietnam.com/?p=12677', NULL, '2018-06-08 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(56, 1, 'RadioMEHCG-2018-06-07-Thursday', 'http://daiphatthanhvietnam.com/?p=12674', NULL, '2018-06-07 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(57, 1, 'RadioMEHCG-2018-06-06-Wednesday', 'http://daiphatthanhvietnam.com/?p=12589', NULL, '2018-06-06 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(58, 1, 'RadioMEHCG-2018-06-05-Tuesday', 'http://daiphatthanhvietnam.com/?p=12586', NULL, '2018-06-05 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(59, 1, 'RadioMeHCG-2018-06-04-Monday', 'http://daiphatthanhvietnam.com/?p=12592', NULL, '2018-06-04 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(60, 1, 'RadioMeHCG-2018-06-03-Sunday', 'http://daiphatthanhvietnam.com/?p=12583', NULL, '2018-06-03 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(61, 1, 'RadioMeHCG-2018-06-02-Saturday', 'http://daiphatthanhvietnam.com/?p=12580', NULL, '2018-06-02 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(62, 1, 'RadioMEHCG-2018-05-31-Thursday', 'http://daiphatthanhvietnam.com/?p=12576', NULL, '2018-05-31 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(63, 1, 'RadioMEHCG-2018-05-30-Wednesday', 'http://daiphatthanhvietnam.com/?p=12556', NULL, '2018-05-30 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(64, 1, 'RadioMEHCG-2018-05-30-Wednesday', 'http://daiphatthanhvietnam.com/?p=12573', NULL, '2018-05-30 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(65, 1, 'RadioMEHCG-2018-05-29-Tuesday', 'http://daiphatthanhvietnam.com/?p=12553', NULL, '2018-05-29 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(66, 1, 'RadioMeHCG-2018-05-28-Monday', 'http://daiphatthanhvietnam.com/?p=12550', NULL, '2018-05-28 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(67, 1, 'RadioMEHCG-2018-05-27-Sunday', 'http://daiphatthanhvietnam.com/?p=12484', NULL, '2018-05-27 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(68, 1, 'RadioMeHCG-2018-05-26-Saturday', 'http://daiphatthanhvietnam.com/?p=12481', NULL, '2018-05-26 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(69, 1, 'RadioMEHCG-2018-05-25-Friday', 'http://daiphatthanhvietnam.com/?p=12478', NULL, '2018-05-25 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(70, 1, 'RadioMEHCG-2018-05-24-Thursday', 'http://daiphatthanhvietnam.com/?p=12475', NULL, '2018-05-24 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(71, 1, 'RadioMEHCG-2018-05-23-Wednesday', 'http://daiphatthanhvietnam.com/?p=12472', NULL, '2018-05-23 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(72, 1, 'RadioMEHCG-2018-05-22-Tuesday', 'http://daiphatthanhvietnam.com/?p=12469', NULL, '2018-05-22 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(73, 1, 'RadioMeHCG-2018-05-07-Monday', 'http://daiphatthanhvietnam.com/?p=12359', NULL, '2018-05-07 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(74, 1, 'RadioMEHCG-2018-05-06-Sunday', 'http://daiphatthanhvietnam.com/?p=12337', NULL, '2018-05-06 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(75, 1, 'RadioMeHCG-2018-05-05- Saturday', 'http://daiphatthanhvietnam.com/?p=12334', NULL, '2018-05-05 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(76, 1, 'RadioMEHCG-2018-05-04-Friday', 'http://daiphatthanhvietnam.com/?p=12312', NULL, '2018-05-04 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(77, 1, 'RadioMEHCG-2018-05-03-Thursday', 'http://daiphatthanhvietnam.com/?p=12309', NULL, '2018-05-03 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(78, 1, 'RadioMEHCG-2018-05-02-Wednesday', 'http://daiphatthanhvietnam.com/?p=12288', NULL, '2018-05-02 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(79, 1, 'RadioMEHCG-2018-05-01-Tuesday', 'http://daiphatthanhvietnam.com/?p=12285', NULL, '2018-05-01 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(80, 1, 'RadioMeHCG-2018-04-30-Monday', 'http://daiphatthanhvietnam.com/?p=12270', NULL, '2018-04-30 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(81, 1, 'YH&DS_20180622-Benh Tim', 'http://daiphatthanhvietnam.com/?p=12785', NULL, '2018-06-22 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(82, 1, 'TTGD_20180616-TuTu', 'http://daiphatthanhvietnam.com/?p=12734', NULL, '2018-06-16 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(83, 1, 'TVMY_20180614', 'http://daiphatthanhvietnam.com/?p=12653', NULL, '2018-06-14 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(84, 1, 'YH&DS_20180608-Cach phong benh cho nguoi lon tuoi', 'http://daiphatthanhvietnam.com/?p=12647', NULL, '2018-06-08 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(85, 1, 'TTTG_20180608', 'http://daiphatthanhvietnam.com/?p=12636', NULL, '2018-06-08 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(86, 1, 'NAGD20180607-Lau Kho qua Ca Ot', 'http://daiphatthanhvietnam.com/?p=12714', NULL, '2018-06-07 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(87, 1, 'TVMY_20180607', 'http://daiphatthanhvietnam.com/?p=12650', NULL, '2018-06-07 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(88, 1, 'TTGD_20180602-Phong ngua te nga', 'http://daiphatthanhvietnam.com/?p=12718', NULL, '2018-06-02 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(89, 1, 'YH&DS_20180601-Ung Thu Co Tu Cung', 'http://daiphatthanhvietnam.com/?p=12659', NULL, '2018-06-01 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(90, 1, 'TTTG_20180601', 'http://daiphatthanhvietnam.com/?p=12600', NULL, '2018-06-01 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(91, 1, 'TVMY_20180531', 'http://daiphatthanhvietnam.com/?p=12656', NULL, '2018-05-31 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(92, 1, 'TVMY_20180524', 'http://daiphatthanhvietnam.com/?p=12460', NULL, '2018-05-24 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(93, 1, 'NAGD_20180524-BoBiaChay', 'http://daiphatthanhvietnam.com/?p=12451', NULL, '2018-05-24 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(94, 1, 'KTNN_20180520', 'http://daiphatthanhvietnam.com/?p=12505', NULL, '2018-05-20 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(95, 1, 'LichSu064 20180519-Thang4-5,1945', 'http://daiphatthanhvietnam.com/?p=12499', NULL, '2018-05-19 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(96, 1, 'YH&DS_20180518-Benh Phu chan', 'http://daiphatthanhvietnam.com/?p=12436', NULL, '2018-05-18 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(97, 1, 'TTTG_20180518', 'http://daiphatthanhvietnam.com/?p=12389', NULL, '2018-05-18 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(98, 1, 'TVMY_20180517', 'http://daiphatthanhvietnam.com/?p=12457', NULL, '2018-05-17 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(99, 1, 'NAGD_20180517-LauGaNauNam', 'http://daiphatthanhvietnam.com/?p=12448', NULL, '2018-05-17 00:00:00', 'http://daiphatthanhvietnam.com/', 1),
(100, 1, 'KTNN_20180513', 'http://daiphatthanhvietnam.com/?p=12502', NULL, '2018-05-13 00:00:00', 'http://daiphatthanhvietnam.com/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_websites`
--

CREATE TABLE `detail_websites` (
  `id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `containerTag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `titleTag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptionTag` text COLLATE utf8mb4_unicode_ci,
  `pubDateTag` text COLLATE utf8mb4_unicode_ci,
  `attr_pub_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_websites`
--

INSERT INTO `detail_websites` (`id`, `website_id`, `containerTag`, `titleTag`, `descriptionTag`, `pubDateTag`, `attr_pub_date`, `active`) VALUES
(2, 2, '.dot-brdr', '.caption-ucan > h3 > a', '.caption-ucan > p + p', '.date-indo', NULL, 1),
(3, 3, 'article', '.post-title a', '.resumo span', '.published', NULL, 1),
(4, 4, '.type-post', '.entry-title a', '.entry-summary p', '.entry-date', NULL, 1),
(5, 5, '.status-publish', '.pagetitle a', NULL, '.posttitle small', NULL, 1),
(6, 6, 'ul', 'li a', NULL, NULL, NULL, 1),
(7, 7, 'ul', 'li a', NULL, NULL, NULL, 1),
(8, 8, 'ul', 'li a', NULL, NULL, NULL, 1),
(9, 9, 'td', 'a', NULL, NULL, NULL, 1),
(10, 10, 'td', 'a', NULL, NULL, NULL, 1),
(11, 11, 'td', 'a', NULL, NULL, NULL, 1),
(12, 12, 'ul', 'li a', NULL, NULL, NULL, 1),
(13, 13, 'ul li', 'a', NULL, NULL, NULL, 1),
(14, 14, 'article', '.entry-title a', NULL, '.entry-date span', NULL, 1),
(15, 15, '.article-text', '.page-header h2 a', '.item-headinfo + p', 'time', NULL, 1),
(16, 16, '.threadbit', '.threadtitle a', NULL, '.label', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `key_words`
--

CREATE TABLE `key_words` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `key_words`
--

INSERT INTO `key_words` (`id`, `category_id`, `name`, `active`) VALUES
(1, 2, 'nam', 1),
(2, 2, 'nữ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$10$nQWcWJmW4sOMuAuvGo5JUeChCDtscifk/2X49JBGoryDYIjHqkhWW', '2018-06-16 17:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `r_s_s_e_s`
--

CREATE TABLE `r_s_s_e_s` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ignoreRSS` text COLLATE utf8mb4_unicode_ci,
  `website` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `r_s_s_e_s`
--

INSERT INTO `r_s_s_e_s` (`id`, `category_id`, `link`, `ignoreRSS`, `website`) VALUES
(1, NULL, 'https://www.24h.com.vn/guest/RSS/', '//24h.com.vn/upload/rss/euro2016.rss', NULL),
(2, NULL, 'https://vnexpress.net/rss', NULL, 'https://vnexpress.net');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'admin@gmail.com', '$2y$10$00wkObG.g/iNVNU2L1z2eeZHV9zhEaiUNVDA4lxTEKXGVlVcydBxq', 'lcaVTvPww1lxenKQJSi1NEsqC6fJcMF6zo0F8qvSPA91zHtRwhaDZ04l3u1z', '2018-06-16 16:18:05', '2018-06-17 05:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

CREATE TABLE `websites` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `domainName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuTag` text COLLATE utf8mb4_unicode_ci,
  `numberPage` int(11) NOT NULL,
  `limitOfOnePage` int(11) DEFAULT NULL,
  `stringFirstPage` text COLLATE utf8mb4_unicode_ci,
  `stringLastPage` text COLLATE utf8mb4_unicode_ci,
  `ignoreWebsite` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `category_id`, `domainName`, `menuTag`, `numberPage`, `limitOfOnePage`, `stringFirstPage`, `stringLastPage`, `ignoreWebsite`, `active`) VALUES
(2, 1, 'http://vietnam.ucanews.com/', '.navestyle > li > a', 2, 0, '/page/', NULL, 'http://vietnam.ucanews.com;\r\nhttp://vietnam.ucanews.com/about-us/;\r\nhttp://vietnam.ucanews.com/multimedia/;\r\nhttp://directory.ucanews.com/country/vietnam/34', 1),
(3, 1, 'http://www.dslamvien.com', '#menu-main-nav li a', 2, 0, NULL, NULL, 'http://www.dslamvien.com/p/tin-viet-nam.html', 1),
(4, 1, 'https://tiengdanviet.net/', '#menu-primary li a', 1, 0, NULL, NULL, NULL, 1),
(5, 1, 'https://duockhoa74.com/', NULL, 2, 0, NULL, NULL, NULL, 1),
(6, 1, 'https://www.tinparis.net/in_paris.html', NULL, 2, 20, NULL, NULL, NULL, 1),
(7, 1, 'http://tinparis.net/in_thegioi.html', NULL, 2, 20, NULL, NULL, NULL, 1),
(8, 1, 'http://tinparis.net/in_thoisu.html', NULL, 2, 20, NULL, NULL, NULL, 1),
(9, 1, 'https://www.tinparis.net/tinla/tinla1.html', NULL, 2, 20, NULL, NULL, NULL, 1),
(10, 1, 'https://www.tinparis.net/chanhtri/chanhtr1.html', NULL, 2, 20, NULL, NULL, NULL, 1),
(11, 1, 'https://www.tinparis.net/vanhoa/vanhoa1.html', NULL, 2, 20, NULL, NULL, NULL, 1),
(12, 1, 'https://www.tinparis.net/thamluan/thamlu1.html', NULL, 2, 20, NULL, NULL, NULL, 1),
(13, 1, 'https://www.tinparis.net/CSxahoi/XahoiCSVN1.html', NULL, 2, 20, NULL, NULL, NULL, 1),
(14, 1, 'http://daiphatthanhvietnam.com/', '#main-menu li a', 2, 0, '&paged=', NULL, NULL, 1),
(15, 1, 'http://chinhluanhaingoai.net', '#moonavigator li a', 1, 0, NULL, NULL, NULL, 1),
(16, 1, 'http://khaiphong.net/forum.php/', '#forum7 .forumtitle a,#forum8 .forumtitle a,#forum9 .forumtitle a,#forum10 .forumtitle a,#forum11 .forumtitle a', 1, 0, NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `detail_websites`
--
ALTER TABLE `detail_websites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domainname` (`website_id`);

--
-- Indexes for table `key_words`
--
ALTER TABLE `key_words`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `r_s_s_e_s`
--
ALTER TABLE `r_s_s_e_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `websites`
--
ALTER TABLE `websites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domainname` (`domainName`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `detail_websites`
--
ALTER TABLE `detail_websites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `key_words`
--
ALTER TABLE `key_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_s_s_e_s`
--
ALTER TABLE `r_s_s_e_s`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `detail_websites`
--
ALTER TABLE `detail_websites`
  ADD CONSTRAINT `detail_websites_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`);

--
-- Constraints for table `key_words`
--
ALTER TABLE `key_words`
  ADD CONSTRAINT `key_words_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `r_s_s_e_s`
--
ALTER TABLE `r_s_s_e_s`
  ADD CONSTRAINT `r_s_s_e_s_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `websites`
--
ALTER TABLE `websites`
  ADD CONSTRAINT `websites_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
