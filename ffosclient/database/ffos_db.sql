-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 10:05 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `ffos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Sandwiches', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vehicula ipsum nec nibh condimentum congue. Nulla finibus libero vel magna consectetur, sit amet laoreet est aliquam. Nam viverra urna tincidunt lorem tincidunt, eu pellentesque risus blandit.', 1, 0, '2022-05-30 08:41:47', '2022-05-30 08:55:20'),
(2, 'Drinks', 'In id vestibulum ipsum. Cras ut lacus a quam iaculis euismod sit amet eu orci.', 1, 0, '2022-05-30 08:42:12', '2022-05-30 08:42:12'),
(3, 'Meals', 'Cras lobortis porta commodo. Donec at nibh congue, posuere mauris eget, tincidunt massa.', 1, 0, '2022-05-30 08:43:05', '2022-05-30 08:43:05'),
(4, 'Desert', 'Suspendisse nec aliquet metus. Duis et feugiat ipsum. Quisque dignissim at nibh in vehicula. Integer semper ligula porta accumsan dictum.', 1, 0, '2022-05-30 08:43:21', '2022-05-30 08:43:21'),
(5, 'Floats', 'Maecenas venenatis dolor ipsum, sit amet porta augue ultricies in. In augue elit, blandit vel quam sit amet, tincidunt condimentum arcu.', 1, 0, '2022-05-30 08:43:34', '2022-05-30 08:43:34'),
(6, 'Add-ons', 'Phasellus vitae rutrum quam, ac vestibulum dui. Ut at nisl mi. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 1, 0, '2022-05-30 08:43:53', '2022-05-30 08:43:53'),
(7, 'test', 'etst - updated', 0, 1, '2022-05-30 08:44:01', '2022-05-30 08:44:16'),
(8, 'Combo Meals', 'Donec nec pharetra elit. Donec id mattis mauris. Proin molestie neque eget augue vulputate, in feugiat turpis commodo. Sed aliquam nibh ac metus pretium, a lacinia ligula consequat. Ut ac arcu sit amet ex gravida efficitur a nec ante.', 1, 0, '2022-05-30 08:44:37', '2022-05-30 08:44:37'),
(9, 'Group Meals', 'Donec ac sapien gravida, varius diam non, gravida tellus. Quisque ornare augue turpis, malesuada porta erat vulputate eget.', 1, 0, '2022-05-30 08:44:56', '2022-05-30 08:44:56');

-- --------------------------------------------------------

--
-- Table structure for table `menu_list`
--

CREATE TABLE `menu_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_list`
--

INSERT INTO `menu_list` (`id`, `category_id`, `code`, `name`, `description`, `price`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 'B1', 'Regular Burger', 'Cras egestas velit eget libero cursus consectetur. Curabitur ligula ligula, ultricies sed elit a, laoreet viverra ante.', 85.00, 1, 0, '2022-05-30 09:06:02', '2022-05-30 09:06:02'),
(2, 3, 'M1', 'Fried Chicken with Rice', 'Proin quis orci nisl. Suspendisse a luctus felis, at blandit magna. Integer sit amet sem urna. Morbi ut neque turpis.', 115.00, 1, 0, '2022-05-30 09:07:42', '2022-05-30 09:15:15'),
(3, 3, 'M2', 'Fried Chicken with 2 Rice', 'Nulla in elementum enim, non pulvinar tortor. Proin aliquet, lacus eu condimentum feugiat, quam odio egestas augue, cursus laoreet ipsum massa vitae purus', 145.00, 1, 0, '2022-05-30 09:08:34', '2022-05-30 09:15:23'),
(4, 9, 'GM1', '6pcs Chicken, Spag, 5 drinks', 'Integer laoreet pharetra augue, sed luctus nulla iaculis eget. Sed vel augue imperdiet est vehicula tristique non vel ante. In malesuada auctor mattis. ', 455.00, 1, 0, '2022-05-30 09:09:53', '2022-05-30 09:09:53'),
(5, 2, 'D1', 'Coke 12oz', 'Cras at risus nec neque semper consectetur. Quisque eget neque imperdiet odio molestie eleifend. Suspendisse sit amet sodales nibh.', 25.00, 1, 0, '2022-05-30 09:11:13', '2022-05-30 09:11:13'),
(6, 2, 'D2', 'Royal 12oz.', 'Cras at risus nec neque semper consectetur. Quisque eget neque imperdiet odio molestie eleifend. Suspendisse sit amet sodales nibh.', 25.00, 1, 0, '2022-05-30 09:11:38', '2022-05-30 09:11:38'),
(7, 5, 'F1', 'Coke Float', 'Cras a metus sed enim gravida placerat a id eros. Aliquam nisi erat, mattis at lacus a, malesuada volutpat urna. Nulla lobortis nibh eget mi scelerisque interdum.', 75.00, 1, 0, '2022-05-30 09:12:07', '2022-05-30 09:12:07'),
(8, 5, 'F2', 'Coffee Float', 'Vestibulum ornare elit et felis malesuada suscipit non consectetur est. Suspendisse vel dui interdum, viverra massa non, hendrerit nisl', 80.00, 1, 0, '2022-05-30 09:12:33', '2022-05-30 09:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `menu_id` int(30) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `menu_id`, `price`, `quantity`) VALUES
(1, 7, 75.00, 2),
(1, 4, 455.00, 2),
(2, 3, 145.00, 2),
(2, 2, 115.00, 1),
(2, 5, 25.00, 2),
(2, 6, 25.00, 1),
(3, 3, 145.00, 2),
(3, 2, 115.00, 1),
(3, 5, 25.00, 2),
(3, 6, 25.00, 1),
(4, 2, 115.00, 1),
(5, 5, 25.00, 2),
(5, 4, 455.00, 1),
(6, 1, 85.00, 5),
(7, 2, 115.00, 2),
(8, 4, 455.00, 1),
(9, 5, 25.00, 2),
(9, 4, 455.00, 1),
(9, 1, 85.00, 2),
(10, 5, 25.00, 2),
(10, 1, 85.00, 2),
(11, 4, 455.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `queue` varchar(50) NOT NULL,
  `total_amount` float(12,2) NOT NULL DEFAULT 0.00,
  `tendered_amount` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Queued,\r\n1 = Served',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `user_id`, `code`, `queue`, `total_amount`, `tendered_amount`, `status`, `date_created`, `date_updated`) VALUES
(1, 1, '2022053000001', '00001', 1060.00, 1100.00, 1, '2022-05-30 13:18:45', '2022-05-30 15:43:14'),
(3, 1, '2022053000003', '00003', 480.00, 500.00, 0, '2022-05-30 14:13:12', '2022-05-30 14:13:12'),
(4, 1, '2022053000004', '00004', 115.00, 120.00, 0, '2022-05-30 14:14:10', '2022-05-30 14:14:10'),
(5, 1, '2022053000005', '00005', 505.00, 505.00, 1, '2022-05-30 14:14:38', '2022-05-30 15:29:23'),
(6, 1, '2022053000006', '00006', 425.00, 500.00, 1, '2022-05-30 14:17:37', '2022-05-30 15:28:42'),
(7, 1, '2022053000002', '00002', 230.00, 500.00, 1, '2022-05-30 15:37:52', '2022-05-30 15:43:20'),
(8, 1, '2022053000007', '00007', 455.00, 500.00, 1, '2022-05-30 15:38:24', '2022-05-30 15:38:34'),
(9, 1, '2022053000008', '00008', 675.00, 1000.00, 0, '2022-05-30 15:43:41', '2022-05-30 15:43:41'),
(10, 1, '2022053000009', '00009', 220.00, 250.00, 0, '2022-05-30 15:43:54', '2022-05-30 15:43:54'),
(11, 3, '2022053000010', '00010', 455.00, 500.00, 0, '2022-05-30 15:57:53', '2022-05-30 15:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Fast Food Ordering System'),
(6, 'short_name', 'FFOS - PHP'),
(11, 'logo', 'uploads/logo.png?v=1653870746'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1653870818'),
(17, 'phone', '456-987-1231'),
(18, 'mobile', '09123456987 / 094563212222 '),
(19, 'email', 'info@musicschool.com'),
(20, 'address', 'Here St, Down There City, Anywhere Here, 2306 -updated');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='2';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', '', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2022-05-16 14:17:49'),
(3, 'Claire', 'C', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatars/3.png?v=1653723045', NULL, 2, '2022-05-28 15:30:45', '2022-05-30 15:56:49'),
(4, 'Mark', 'D', 'Cooper', 'mcooper', 'c7162ff89c647f444fcaa5c635dac8c3', 'uploads/avatars/4.png?v=1653897375', NULL, 3, '2022-05-30 15:56:15', '2022-05-30 15:56:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_list`
--
ALTER TABLE `menu_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu_list`
--
ALTER TABLE `menu_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_list`
--
ALTER TABLE `menu_list`
  ADD CONSTRAINT `category_id_fk_ml` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `user_id_fk_ol` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;
