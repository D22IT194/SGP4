-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 06:44 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(1, 9, 1, 4),
(3, 9, 4, 6),
(4, 9, 12, 2),
(8, 13, 28, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(5, 'Milk', 'mlk'),
(6, 'Cheese', 'cheese');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 27, 2),
(15, 9, 28, 5),
(16, 9, 29, 2),
(17, 9, 30, 3),
(18, 10, 32, 3),
(19, 10, 33, 4),
(20, 10, 31, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(27, 5, 'Nandini Goodlife - Toned Milk, 500 ml Pouch', '<p>Goodlife Smart Homogenised Double Toned Milk UHT processed milk with Min 1.5% fat and Min 9.0% SNF fortified with vitamins A and D. Suitable for preparing tea/coffee, milk shakes and milk delights for people leading a fitness conscious lifestyle. Not a day passes by when we do not need milk on a regular basis.</p>\r\n\r\n<p>If there are children in the house, milk is a must. Your morning tea or coffee is incomplete without it; breakfast cornflakes calls for it too. Besides its regular use, milk can be used for so many other things. Whip up a batch of cookies or bake some delicious cakes with milk. Scrambled eggs are so much fluffier and tastier, thanks to a dash of milk. Not to forget homemade milkshakes. There is so much you can do with just a cup of milk!</p>\r\n', 'nandini-goodlife-toned-milk-500-ml-pouch', 27, 'nandini-goodlife-toned-milk-500-ml-pouch.jpg', '2022-05-14', 3),
(28, 5, 'Nandini Slim - Skimmed Milk, 1 L Carton', '<p>Nandini Good Life Slim Skimmed Milk is an entire pack of nutrition necessary for your health development and growth. It is equally nutritional like the total milk with Vitamin A and D. There is completely no fat containing all over.</p>\r\n', 'nandini-slim-skimmed-milk-1-l-carton', 60, 'nandini-slim-skimmed-milk-1-l-carton.jpg', '2022-05-13', 6),
(29, 5, 'Amul Homogenized Milk, 500 ml Carton', '<p>Amul Homogenised Toned Milk: Amul Taaza has been processed to give smooth consistency preventing cream layer formation on top, It has been sterilised at a high temperature and packed aseptically to give safe and nutritious milk which stays fresh until opened.</p>\r\n', 'amul-homogenized-milk-500-ml-carton', 37, 'amul-homogenized-milk-500-ml-carton.jpg', '0000-00-00', 0),
(30, 5, 'Amul Taaza Fresh Toned Milk, 500 ml Carton', '<p>Amul Taaza fresh toned milk is an excellent quality milk from Gujarat. It can be consumed directly from the pack. No need to boil, it has virtually zero bacteria. No need to refrigerate till open. stays fresh for 2 days after opening if kept in refrigerator. There is no powder, water or preservatives added. It comes in a tamper evident and easy-to-carry pack. This milk is excellent for making tea, coffee, adding to your breakfast cereals and preparing desserts or sweets.</p>\r\n', 'amul-taaza-fresh-toned-milk-500-ml-carton', 35, 'amul-taaza-fresh-toned-milk-500-ml-carton.jpg', '0000-00-00', 0),
(31, 6, 'Britannia Cheese Slices, 200 g (10 Slices x 20 g Each)', '<p>Made with the goodness of cow&#39;s milk, Britannia Cheese Slices are deliciously soft &amp; creamy that add the perfect cheesy flavour to food. Every slice is individually wrapped to preserve freshness &amp; taste. Satisfy your cheesy cravings with Britannia Cheese that has authentic flavour &amp; rich yellow colour. Loaded with the power of milk proteins and calcium, Britannia cheese melts easily to give a perfect taste. Believing in delivering fresh and healthy products, Britannia manufactures some of India&#39;s widest range of cheese slices, cheese cubes, cheese blocks, cheese spread, pizza cheese and much more.</p>\r\n', 'britannia-cheese-slices-200-g-10-slices-x-20-g-each', 129, 'britannia-cheese-slices-200-g-10-slices-x-20-g-each.jpg', '0000-00-00', 0),
(32, 6, 'Milky Mist Cheese - Mozzarella Pizza, 200 g Pouch', '<p>Milky Mist cheese Mozzarella Pizza is soft fresh cheese prepared from Cow&#39;s milk. It has a mild flavor with a flexible and rubbery texture.</p>\r\n', 'milky-mist-cheese-mozzarella-pizza-200-g-pouch', 121, 'milky-mist-cheese-mozzarella-pizza-200-g-pouch.jpg', '0000-00-00', 0),
(33, 6, 'Amul Cheese Spread - Yummy Plain, 200 g Tub', '<p>Amul Cheese Spread - Yummy Plain is a good supply of calcium and milk proteins. It is finished from soft cheese, cheddar cheese and common salt. It is especially easy to use and simple to spread. It is light, low-calorie, low-fat &amp; low-cholesterol bread spread. It has 26% less fat and calorie content as contrasted to butter or margarine. It is perfect for adding delectable taste to rotis, parathas, omelettes, dosas, nans, kulchas, pakoras, samosas and many other Indian dishes.</p>\r\n', 'amul-cheese-spread-yummy-plain-200-g-tub', 90, 'amul-cheese-spread-yummy-plain-200-g-tub.jpg', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2022-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2022-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$8wY63GX/y9Bq780GBMpxCesV9n1H6WyCqcA2hNy2uhC59hEnOpNaS', 1, 'Meet', 'Sanghvi', '', '', 'userpic.jpg', 1, '', '', '2022-05-01'),
(13, 'smit@gmail.com', '$2y$10$6JFbx072wzjjWIC6KeOOi.3Ql3BL0SzdtiiEijJ8XKAHXz/R.czL6', 0, 'smit', 'surti', 'surat', '9988776655', '', 1, 'hvU5VaZmq9Ry', '', '2022-05-13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
