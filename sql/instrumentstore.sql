-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 09, 2023 lúc 06:35 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `instrumentstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Quáº§n Ã¡o ná»¯', 1),
(4, 'Quáº§n Ã¡o nam', 1),
(5, 'Quáº§n Ã¡o tráº» em', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(42, 32, '2023-05-06', '2023-05-09', 'Complete');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(42, 42, 20, 1, '1890000', 'Äáº¦M XÃ’E THáº®T DÃ‚Y EO', '0b23237d24.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(19, 'Äáº¦M XÃ’E THáº®T DÃ‚Y EO', '1590000', '1500000', '20f4f45a0c.jpg', 32, '2023-05-06', 2, 567, 'Äáº§m xÃ²e cá»• trÃ²n, tay Ã¡o kiá»ƒu sÃ¡t nÃ¡ch, eo chun cÃ³ dÃ¢y rÃºt dá»… dÃ ng Ä‘iá»u chá»‰nh. TÃ¹ng vÃ¡y dÃ i qua gá»‘i táº¡o xÃ²e. Váº£i há»a tiáº¿t hoa.\r\n\r\nCháº¥t liá»‡u lá»¥a má»m mÃ¡t, há»£p tiáº¿t trá»i ngÃ y hÃ¨ oi bá»©c, mÃ u sáº¯c ngá»t ngÃ o, cÃ³ lá»›p lÃ³t cÃ¹ng mÃ u kÃ­n Ä‘Ã¡o giá»¯ form dÃ¡ng á»•n Ä‘á»‹nh. Äáº§m hoa dÃ¡ng chá»¯ A khi tháº¯t Ä‘ai táº¡o ra dÃ¡ng chiáº¿t eo hiá»‡u quáº£. Má»™t item xinh xáº¯n cho nÃ ng diá»‡n xuá»‘ng phá»‘ trÃ  chiá»u cÃ¹ng báº¡n bÃ¨ hay nhá»¯ng chuyáº¿n du lá»‹ch sáº¯p tá»›i Ä‘áº¥y. ', 1, 23),
(20, 'Äáº¦M XÃ’E THáº®T DÃ‚Y EO', '1890000', '1890000', '0b23237d24.jpg', 32, '2023-05-06', 2, 433, 'Äáº§m lá»¥a cá»• thuyá»n, vai chá»m, dÃ¡ng Ä‘áº§m Ã´m Ä‘á»™ dÃ i qua Ä‘áº§u gá»‘i. Thiáº¿t káº¿ rÃºt dÃ¢y 1 bÃªn táº¡o Ä‘iá»ƒm nháº¥n cho pháº§n eo thÃªm thon gá»n. \r\n\r\nMá»™t thiáº¿t káº¿ thoáº£i mÃ¡i, mÃ¡t máº» cho nhá»¯ng ngÃ y hÃ¨ rá»±c rá»¡. Cháº¥t liá»‡u lá»¥a má»m nháº¹ thÆ°á»›t tha. Chi tiáº¿t nháº¥n eo gÃ³p pháº§n mang Ä‘áº¿n váº» Ä‘áº¹p Ä‘áº§y dá»‹u dÃ ng vÃ  ná»¯ tÃ­nh cho nhá»¯ng quÃ½ cÃ´. Sáº½ ráº¥t tuyá»‡t náº¿u nÃ ng chá»n diá»‡n thiáº¿t káº¿ nÃ y vÃ o nhá»¯ng ngÃ y dáº¡o phá»‘ hay chuyáº¿n du lá»‹ch biá»ƒn Ä‘Ã³.', 1, 1),
(22, 'Äáº¦M XÃ’E PHá»I REN HOA', '1990000', '1990000', 'ee4f67f716.jpg', 32, '2023-05-09', 2, 34, 'Äáº§m xoÃ¨ phá»‘i ren hoa vá»›i thiáº¿t káº¿ tinh táº¿ vÃ  sang trá»ng, Ä‘Æ°á»£c cháº¿ tÃ¡c tá»« cháº¥t liá»‡u tuytsi cÃ¹ng lá»›p váº£i ren hoa cao cáº¥p, sáº£n pháº©m mang Ä‘áº¿n cho ngÆ°á»i máº·c cáº£m giÃ¡c thoáº£i mÃ¡i vÃ  dá»… chá»‹u trÃªn cÆ¡ thá»ƒ.\r\n\r\nPháº§n vai cá»§a Ä‘áº§m Ä‘Æ°á»£c thiáº¿t káº¿ vá»›i Ä‘Æ°á»ng may lá»¥a xuyÃªn tháº¥u, táº¡o nÃªn nÃ©t Ä‘áº¹p quyáº¿n rÅ© cho sáº£n pháº©m vÃ  giÃºp tÃ´n lÃªn dÃ¡ng hÃ¬nh cá»§a ngÆ°á»i diá»‡n. Chi tiáº¿t thÃ¢n Ã¡o 2 lá»›p váº£i vá»›i lá»›p váº£i ren hoa bÃªn ngoÃ i Ä‘Æ°á»£c tÃ´ Ä‘iá»ƒm giÃºp sáº£n pháº©m trá»Ÿ nÃªn Ä‘á»™c Ä‘Ã¡o vÃ  Ä‘áº¹p máº¯t hÆ¡n. ThÃ¢n vÃ¡y xoÃ¨ nháº¹ vá» Ä‘uÃ´i, giÃºp ngÆ°á»i máº·c trÃ´ng tháº­t thanh lá»‹ch vÃ  duyÃªn dÃ¡ng.\r\n\r\nThiáº¿t káº¿ lÃ  má»™t lá»±a chá»n hoÃ n háº£o cho cÃ¡c buá»•i tiá»‡c, sá»± kiá»‡n hay cÃ¡c dá»‹p quan trá»ng khÃ¡c. Sáº£n pháº©m mang Ä‘áº¿n sá»± tá»± tin vÃ  quÃ½ phÃ¡i cho ngÆ°á»i máº·c, Ä‘á»“ng thá»i tÃ´n lÃªn váº» Ä‘áº¹p cá»§a ngÆ°á»i diá»‡n.', 1, 0),
(23, 'Äáº¦M SÆ  MI EO NHÃšM', '1905000', '1905000', '73ff9129c1.jpg', 32, '2023-05-09', 2, 23, 'Tá»« dÃ¡ng Ä‘áº§m sÆ¡ mi truyá»n thá»‘ng, cÃ¡c nhÃ  má»‘t IVY Ä‘Ã£ biáº¿n táº¥u thiáº¿t káº¿ pháº§n eo Ä‘áº§m may nhÃºm vá»«a táº¡o sá»± khÃ¡c biá»‡t, vá»«a tÃ´n dÃ¡ng ngÆ°á»i máº·c. Tay Ä‘áº§m lá»­ng Ä‘Æ°á»£c Ä‘Ã­nh thÃªm hÃ ng khuy kim loáº¡i, bá»Ÿi váº­y khi diá»‡n chiáº¿c Ä‘áº§m nÃ y nÃ ng cháº³ng cáº§n phá»‘i phá»¥ kiá»‡n cáº§u kÃ¬ mÃ  trÃ´ng váº«n tháº­t sang trá»ng. Äáº§m dÃ¡ng xÃ²e nháº¹, Ä‘á»™ dÃ i ngang Ä‘áº§u gá»‘i.\r\n\r\nChiáº¿c Ä‘áº§m sÆ¡ mi vá»›i cháº¥t liá»‡u váº£i tuysi cao cáº¥p, dÃ y dáº·n, Ã­t nhÄƒn giá»¯ phom dÃ¡ng Ä‘áº¹p.\r\n\r\nVá»›i chiáº¿c Ä‘áº§m mÃ u sáº¯c nhÃ£ nháº·n vÃ  tráº» trung nÃ y, cÃ¡c nÃ ng cÃ³ thá»ƒ lá»±a chá»n káº¿t há»£p cÃ¹ng tÃºi xÃ¡ch báº£n nhá» vÃ  giÃ y cao gÃ³t, phÃ¹ há»£p Ä‘á»ƒ Ä‘i lÃ m hoáº·c Ä‘i chÆ¡i lá»‹ch sá»±. ', 1, 0),
(24, 'CHÃ‚N VÃY Xáº¾P LY Lá»†CH 1 BÃŠN', '495000', '495000', '38292b1e49.jpg', 32, '2023-05-09', 2, 54, 'ChÃ¢n vÃ¡y 2 lá»›p dÃ¡ng ngáº¯n, xáº¿p ly lá»‡ch 1 bÃªn phá»‘i hÃ ng khuy táº¡o Ä‘iá»ƒm nháº¥n. Cháº¥t liá»‡u tuysi dÃ y dáº·n, Ä‘á»©ng phom. Thiáº¿t káº¿ chÃ¢n vÃ¡y tráº» trung dÃ nh cho nÃ ng diá»‡n trong nhiá»u dá»‹p, dá»… dÃ ng mix&match cÃ¹ng nhiá»u kiá»ƒu Ã¡o vá»›i cÃ¡c phong cÃ¡ch khÃ¡c nhau.\r\n\r\nLÆ°u Ã½: MÃ u sáº¯c sáº£n pháº©m thá»±c táº¿ sáº½ cÃ³ sá»± chÃªnh lá»‡ch nhá» so vá»›i áº£nh do Ä‘iá»u kiá»‡n Ã¡nh sÃ¡ng khi chá»¥p vÃ  mÃ u sáº¯c hiá»ƒn thá»‹ qua mÃ n hÃ¬nh mÃ¡y tÃ­nh/ Ä‘iá»‡n thoáº¡i. ', 1, 0),
(25, 'SET ÃO 2 DÃ‚Y VÃ€ QUáº¦N PHá»I BÃˆO', '377000', '377000', '50b2fff419.jpg', 32, '2023-05-09', 5, 43, 'Ão 2 dÃ¢y báº£n to, thiáº¿t káº¿ Ã¡o viá»n chun táº¡o Ä‘á»™ xÃ²e nháº¹. Quáº§n cáº¡p chun dÃ¡ng ngáº¯n. Cháº¥t liá»‡u linen thoÃ¡ng mÃ¡t cÃ¹ng mÃ u sáº¯c Ä‘Ã¡ng yÃªu vÃ  chi tiáº¿t bÃ¨o nhÃºm táº¡o Ä‘iá»m nháº¥n.\r\n\r\nSet Ä‘á»“ máº·c nhÃ  lÃ  sá»± lá»±a chá»n hoÃ n háº£o cá»§a máº¹ dÃ nh cho bÃ©.', 1, 0),
(26, 'SET VÃY GÃ€ CON', '324000', '324000', '76305aa7ae.jpg', 32, '2023-05-09', 5, 56, 'Set Ä‘á»“ Ä‘Æ°á»£c lÃ m tá»« cháº¥t liá»‡u váº£i cotton khÃ¡ng khuáº©n. ÄÃ¢y lÃ  sá»± káº¿t há»£p giá»¯a cháº¥t liá»‡u cotton organic vÃ  lá»›p khÃ¡ng khuáº©n máº¡nh máº½ Ä‘Æ°á»£c phá»§ lÃªn trong quÃ¡ trÃ¬nh hoÃ n thiá»‡n váº£i cuá»‘i cÃ¹ng. Bá»Ÿi váº­y cotton khÃ¡ng khuáº©n khÃ´ng chá»‰ mang láº¡i sá»± thoÃ¡ng mÃ¡t mÃ  cÃ²n ráº¥t an toÃ n vá»›i lÃ n da nháº¡y cáº£m cá»§a bÃ©.\r\n\r\nÃo cá»• trÃ²n tay ngáº¯n phá»“ng nháº¹. ChÃ¢n vÃ¡y Ä‘uÃ´i cÃ¡ xÃ²e in hÃ¬nh há»a tiáº¿t gÃ  con Ä‘Ã¡ng yÃªu.', 1, 0),
(27, 'SET THUN I LOVE ART', '234000', '234000', '70d8f003a5.jpg', 32, '2023-05-09', 5, 23, 'Bá»™ thun gá»“m Ã¡o vÃ  quáº§n ngáº¯n. Cháº¥t liá»‡u má»m máº¡i, tháº¥m hÃºt má»“ hÃ´i tá»‘t. Ão Ä‘Æ°á»£c in hÃ¬nh ngá»™ nghÄ©nh phÃ­a trÆ°á»›c. Thiáº¿t káº¿ quáº§n bao gá»“m há»a tiáº¿t báº¯t máº¯t. Cáº¡p quáº§n chun cÃ³ dÃ£n tá»‘t, phÃ­a trÆ°á»›c cÃ³ tÃºi chÃ©o. Quáº§n Ä‘Æ°á»£c giao ngáº«u nhiÃªn giá»¯a 2 phiÃªn báº£n mÃ u khÃ¡c nhau.\r\n\r\nMÃ u sáº¯c: Ão Tráº¯ng - Quáº§n há»a tiáº¿t Xanh lÆ¡/ há»a tiáº¿t Tráº¯ng', 1, 0),
(28, 'ÃO THUN IN HÃŒNH', '450000', '450000', 'b558c94153.jpg', 32, '2023-05-09', 4, 34, 'Ão thun tay ngáº¯n Ä‘á»™ dÃ i vá»«a pháº£i mang phong cÃ¡ch tráº» trung nÄƒng Ä‘á»™ng.\r\n\r\nHá»a tiáº¿t Ä‘Æ°á»£c in trÃªn Ã¡o sáº½ giÃºp chÃ ng ná»•i báº­t giá»¯a Ä‘Ã¡m Ä‘Ã´ng. LÃ  sáº£n pháº©m phÃ¹ há»£p cho nhá»¯ng buá»•i Ä‘i chÆ¡i hay hoáº¡t Ä‘á»™ng thá»ƒ thao.', 1, 0),
(29, 'ÃO THUN EMOTION', '90000', '90000', '96be6d51c2.jpg', 32, '2023-05-09', 4, 32, 'Ão thun nam cá»• trÃ²n, tay ngáº¯n. DÃ¡ng xuÃ´ng. ThÃªu chá»¯ Emotion máº·t trÆ°á»›c. \r\n\r\nCháº¥t liá»‡u váº£i thun má»m má»‹n cÃ³ Ä‘áº·c tÃ­nh tháº¥m hÃºt má»“ hÃ´i nhanh chÃ³ng, táº¡o cáº£m giÃ¡c thÃ´ng thoÃ¡ng, dá»… chá»‹u khi máº·c. Dá»… giáº·t sáº¡ch, nhanh khÃ´ vÃ  kháº£ nÄƒng bá»n mÃ u cao trong thá»i gian dÃ i. ÄÆ°á»ng may cháº¯c cháº¯n vÃ  tá»‰ má»‰, chá»‘ng bung Ä‘á»©t. Form Ã¡o Ã´m nháº¹, táº¡o sá»± thoáº£i mÃ¡i khi váº­n Ä‘á»™ng, Ä‘á»“ng thá»i tÃ´n lÃªn Ä‘Æ°á»ng nÃ©t sÄƒn cháº¯c vÃ  nam tÃ­nh cá»§a cÆ¡ thá»ƒ.\r\n\r\nMÃ u sáº¯c: Xanh TÃ­m Than', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`) VALUES
(1, 'admin@gmail.com', 'Nguyễn Lập An Khương', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, ''),
(31, 'lapankhuongnguyen@gmail.com', 'khuong nguyen', '2021-12-06', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'CanTho'),
(32, 'huedothi50984@gmail.com', 'Do Hue', '2023-05-10', 'c20ad4d76fe97759aa27a0c99bff6710', 1, 1, '101 MAIN ST PORT CHESTER NY 10573-4210 USA');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
