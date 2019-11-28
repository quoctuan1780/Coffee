-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2017 at 08:34 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 12, '2017-03-21', 520000, 'COD', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 11, '2017-03-21', 420000, 'COD', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam "Bánh trung thu Bơ Sữa HongKong".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'AMERICANO', 1, 'Americano được pha chế bằng cách thêm nước vào một hoặc hai shot Espresso để pha loãng độ đặc của cà phê, từ đó mang lại hương vị nhẹ nhàng, không gắt mạnh và vẫn thơm nồng nàn.', 39000, 37000, 'americano_39k.jpg', 'ly', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(2, 'BẠC SỈU', 1, 'Theo chân những người gốc Hoa đến định cư tại Sài Gòn, Bạc sỉu là cách gọi tắt của "Bạc tẩy sỉu phé" trong tiếng Quảng Đông, chính là: Ly sữa trắng kèm một chút cà phê.', 29000, 0, 'bacsiu_29k.jpg', 'ly', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'CÀ PHÊ ĐEN', 1, 'Một tách cà phê đen thơm ngào ngạt, phảng phất mùi cacao là món quà tự thưởng tuyệt vời nhất cho những ai mê đắm tinh chất nguyên bản nhất của cà phê. Một tách cà phê trầm lắng, thi vị giữa dòng đời vồn vã.', 29000, 0, 'cafeden_29k.jpg', 'ly', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'CÀ PHÊ SỮA', 1, 'Cà phê phin kết hợp cũng sữa đặc là một sáng tạo đầy tự hào của người Việt, được xem món uống thương hiệu của Việt Nam.', 29000, 0, 'cafesua_29k.jpg', 'ly', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'CAPPUCINNO', 1, 'Cappucino được gọi vui là thức uống "một-phần-ba" - 1/3 Espresso, 1/3 Sữa nóng, 1/3 Foam.', 45000, 0, 'cappucinno_45k.jpg', 'ly', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'CARAMEL MACCHIATO', 1, 'Vị thơm béo của bọt sữa và sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng, và vị ngọt đậm của sốt caramel.', 55000, 0, 'caramelmacchiato_55k.jpg', 'ly', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'COLD BREW CAM SẢ', 1, '', 45000, 42000, 'cold_brew_cam_sa_45k.jpg', 'ly', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, 'COLD BREW PHÚC BỒN TỬ', 1, '', 50000, 0, 'coldbrewphucbontu_50k.png', 'ly', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'COLD BREW SỮA TƯƠI', 1, '', 50000, 0, 'coldbrewsuatuoi_50k.jpg', 'ly', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(11, 'COLD BREW SỮA TƯƠI MACCHIATO', 1, '', 50000, 45000, 'coldbresuatuoimacchiato_50k.jpg', 'ly', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, 'COLD BREW TRUYỀN THỐNG', 1, '', 45000, 0, 'coldbrewtruyenthong_45k.jpg', 'ly', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'ESPRESSO', 1, 'Một cốc Espresso nguyên bản được bắt đầu bởi những hạt Arabica chất lượng, phối trộn với tỉ lệ cân đối hạt Robusta, cho ra vị ngọt caramel, vị chua dịu và sánh đặc. Để đạt được sự kết hợp này, chúng tôi xay tươi hạt cà phê cho mỗi lần pha.', 35000, 0, 'espresso_35k.jpg', 'ly', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'LATTE', 1, 'Khi chuẩn bị Latte, cà phê Espresso và sữa nóng được trộn lẫn vào nhau, bên trên vẫn là lớp foam nhưng mỏng và nhẹ hơn Cappucinno.', 45000, 0, 'latte_45k.jpg', 'ly', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'MOCHA', 1, 'Cà phê Mocha được ví von đơn giản là Sốt Sô cô la được pha cùng một tách Espresso.', 49000, 0, 'mocha_49k.jpg', 'ly', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'SÔ-CÔ-LA ĐÁ', 1, 'Cacao nguyên chất hoà cùng sữa tươi béo ngậy. Vị ngọt tự nhiên, không gắt cổ, để lại một chút đắng nhẹ, cay cay trên đầu lưỡi.', 55000, 0, 'iced_chocolate_55k.jpg', 'ly', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'TRÀ CHERRY MACCHIATO', 2, '', 55000, 0, 'tracherrymacchiato_55k.jpg', 'ly', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, 'TRÀ ĐÀO CAM SẢ', 2, 'Vị thanh ngọt của đào Hy Lạp, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này. Sản phẩm hiện có 2 phiên bản Nóng và Lạnh phù hợp cho mọi thời gian trong năm.', 45000, 0, 'tradaocamsa_45k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'TRÀ ĐEN MACCHIATO', 2, 'Trà đen được ủ mới mỗi ngày, giữ nguyên được vị chát mạnh mẽ đặc trưng của lá trà, phủ bên trên là lớp Macchiato "homemade" bồng bềnh quyến rũ vị phô mai mặn mặn mà béo béo.', 42000, 0, 'tradenmacchiato_42k.jpg', 'ly', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'TRÀ GẠO RANG MACCHIATO', 2, 'Trà gạo rang, hay còn gọi là Genmaicha, hay Trà xanh gạo lứt có nguồn gốc từ Nhật Bản. Tại The Coffee House, chúng tôi nhấn nhá cho Genmaicha thêm lớp Macchiato để tăng thêm mùi vị cũng như trải nghiệm của chính bạn.', 48000, 0, 'tragaorangmacchiato_48k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, 'TRÀ MATCHA LATTE', 2, 'Với màu xanh mát mắt của bột trà Matcha, vị ngọt nhẹ nhàng, pha trộn cùng sữa tươi và lớp foam mềm mịn, Matcha Latte là thức uống yêu thích của tất cả mọi người khi ghé The Coffee House.', 59000, 53000, 'tramatchalatte_59k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'TRÀ MATCHA MACCHIATO', 2, 'Bột trà xanh Matcha thơm lừng hảo hạng cùng lớp Macchiato béo ngậy là một sự kết hợp tuyệt vời.', 45000, 0, 'tramatchamachiato_45k.jpg', 'ly', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'TRÀ OOLONG SEN AN NHIÊN', 2, '', 45000, 0, 'traoolongsenannhien_45k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'TRÀ OOLONG VẢI NHƯ Ý', 2, '', 45000, 40000, 'traoolongvainhuy_45k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'TRÀ PHÚC BỒN TỬ', 2, '', 49000, 0, 'traphucbontu_49k.png', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'TRÀ XOÀI MACCHIATO', 2, '', 55000, 0, 'traxoaimachiato_55k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, 'TRÀ XOÀI MACCHIATO 2', 2, '', 55000, 45000, 'traxoaimachiato2_55k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, 'CHANH SẢ ĐÁ XAY', 3, '', 49000, 0, 'chanhsadaxay_49k.jpg', 'ly', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, 'CHOCOLATE ĐÁ XAY', 3, 'Vị đắng của cà phê kết hợp cùng vị cacao ngọt ngàocủa sô-cô-la, vị sữa tươi ngọt béo, đem đến trải nghiệm vị giác cực kỳ thú vị.', 59000, 0, 'chocolate_daxay_59k.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, 'COOKIES ĐÁ XAY', 3, 'Những mẩu bánh cookies giòn rụm kết hợp ăn ý với sữa tươi và kem tươi béo ngọt, đem đến cảm giác lạ miệng gây thích thú. Một món uống phá cách dễ thương.', 59000, 0, 'cookies_ice_blended_59k.jpg', 'ly', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(31, 'ĐÀO VIỆT QUẤT ĐÁ XAY', 3, '', 59000, 0, 'daovietquatdaxay_59k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, 'MATCHA ĐÁ XAY', 3, 'Matcha thanh, nhẫn, và đắng nhẹ được nhân đôi sảng khoái khi uống lạnh. Nhấn nhá thêm những nét bùi béo của kem và sữa. Gây thương nhớ vô cùng!', 59000, 0, 'matchadaxay_59k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'ỔI HỒNG VIỆT QUẤT ĐÁ XAY', 3, '', 59000, 50000, 'oihongvietquatdaxay_59k.jpg', 'ly', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, 'PHÚC BỒN TỬ CAM ĐÁ XAY', 3, '', 59000, 0, 'phucbontucamdaxay_59k.png', 'ly', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
 

(35, 'SINH TỐ CAM XOÀI', 4, 'Vị mứt cam xoài hòa trộn độc đáo với sữa chua, cho cảm giác chua ngọt rất sướng. Điểm nhấn là những mẩu bánh cookie giòn tan giúp sự thưởng thức thêm thú vị.', 59000, 43000, 'sinhtocamxoai_59k.jpg', 'ly', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, 'SINH TỐ VIỆT QUẤT', 4, 'Mứt Việt Quất chua thanh, ngòn ngọt, phối hợp nhịp nhàng với dòng sữa chua bổ dưỡng. Là món sinh tố thơm ngon mà cả đầu lưỡi và làn da đều thích.', 59000, 0, 'sinhtovietquat_59k.jpg', 'ly', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, 'BÁNH BÔNG LAN TRỨNG MUỐI', 5, '', 29000, 0, 'banhbonglantrungmuoi_29k.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, 'BÁNH CHOCOLATE', 5, '', 29000, 0, 'banhchocolate_29k.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, 'BÁNH CROISSANT BƠ TỎI', 5, '', 29000, 0, 'banhcroissantbotoi_29k.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, 'BÁNH GẤU CHOCOLATE', 5, '', 39000, 34000, 'banhgauchocolate_39k.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(41, 'BÁNH MATCHA', 5, '', 29000, 0, 'banhmatcha_29k.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, 'BÁNH MÌ CHÀ BÔNG PHÔ MAI', 5, '', 32000, 26000, 'banhmichabongphomai_32k.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, 'BÁNH PASSION CHEESE', 5, '', 29000, 0, 'banhpassioncheese_29k.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, 'BÁNH TIRAMISU', 5, '', 29000, 22000, 'banhtiramisu_29k.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00');


-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg'),
(5, '', 'banner5.jpg'),
(6, '', 'banner6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cà phê','2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(2, 'Trà và Macchiato','2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Thức uống đá xay','2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Thức uống sinh tố','2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Bánh và Snack','2016-10-28 04:00:00', '2016-10-27 04:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Hương Hương', 'huonghuong08.php@gmail.com', '$2y$10$rGY4KT6ZSMmLnxIbmTXrsu2xdgRxm8x0UTwCyYCAzrJ320kYheSRq', '23456789', 'Hoàng Diệu 2', NULL, '2017-03-23 07:17:33', '2017-03-23 07:17:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
	ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);

ALTER TABLE `bill_detail`
	ADD CONSTRAINT `bill_details_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

ALTER TABLE `bill_detail`
	ADD CONSTRAINT `bill_details_id_bill_foreign` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id`);

ALTER TABLE `bills`
	ADD CONSTRAINT `bills_customer_id_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);
	

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

