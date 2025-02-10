-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 12:06 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `urban`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_cost` decimal(6,2) NOT NULL,
  `order_status` varchar(100) NOT NULL DEFAULT 'on_hold',
  `user_id` int(11) NOT NULL,
  `user_phone` int(11) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_category` varchar(100) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_image3` varchar(255) NOT NULL,
  `product_image4` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_special_offer` int(2) NOT NULL,
  `product_color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_category`, `product_description`, `product_image`, `product_image2`, `product_image3`, `product_image4`, `product_price`, `product_special_offer`, `product_color`) VALUES
(1, 'Sports Shoes', 'shoes', 'awesome shoes for outdoor activity', 'featured1.jpg', 'featured1.jpg', 'featured1.jpg', 'featured1.jpg', '3999.00', 0, 'green'),
(2, 'Classic Sweatshirt', 'tshirts', 'Embroided sweatshirt | Green print | Winter wear ', 'featured2.jpg', 'featured2.jpg\r\n', 'featured2.jpg', 'featured2.jpg', '1699.00', 0, 'Green'),
(3, 'Summer T-shirt', 'tshirts', 'High quality cotton T-shirt | Plain white | Summer wear ', 'featured3.jpg', 'featured3.jpg', 'featured3.jpg', 'featured3.jpg', '449.00', 0, 'White'),
(4, 'Bag', 'bags', 'High quality leather bag | Suitable for daily usage | Classic brown design ', 'featured4.jpg', 'featured4.jpg', 'featured4.jpg', 'featured4.jpg', '1599.00', 0, 'Brown'),
(5, 'Denim Jacket', 'jackets', 'Designer Denim Jacket | Black |', 'Featured5.jpg', 'Featured5.jpg', 'Featured5.jpg', 'Featured5.jpg', '1500.00', 0, 'Black'),
(6, 'Baseball Colar Jacket', 'jackets', 'Baseball Colar Jacket | Winter Wear | Immaculate design for good looks | White in color', 'Featured6.jpg', 'Featured6.jpg', 'Featured6.jpg', 'Featured6.jpg', '1999.00', 0, 'White'),
(7, 'Winter Class Hoodie', 'jackets', 'Winter wear well-designed hoodie | Comfortable to wear | Premium clothing', 'featured7.jpg', 'featured7.jpg', 'featured7.jpg', 'featured7.jpg', '2499.00', 0, 'Black'),
(8, 'Modern Embroided Sweatshirt', 'jackets', 'Embroided Sweatshirt | 30% Polyster | Latest design', 'featured8.jpg', 'featured8.jpg', 'featured8.jpg', 'featured8.jpg', '1199.00', 0, 'Blue'),
(9, 'Brooklyn 1986 Sweatshirt', 'tshirts', 'Brooklyn Nets Sweatshirt | Winter Wear | Black in color | Modern Fashion', 'featured9.jpg', 'featured9.jpg', 'featured9.jpg', 'featured9.jpg', '1349.00', 0, 'Black'),
(10, 'Women\'s T-shirt', 'tshirts', 'Light Blue tshirt | Special women\'s edition | Premium quality cotton', 'featured10.jpg', 'featured10.jpg', 'featured10.jpg', 'featured10.jpg', '1299.00', 0, 'Blue'),
(11, 'The Butterfly Org T-shirt', 'tshirts', 'Limited edition Butterfly Org Tshirt | Black in color | ', 'featured11.jpg', 'featured11.jpg', 'featured11.jpg', 'featured11.jpg', '799.00', 0, 'Black'),
(12, 'Graphic T-shirt', 'tshirts', 'Modern Graphic T-shirt | Premium Cotton| Latest fashion | ', 'featured12.jpg', 'featured12.jpg', 'featured12.jpg', 'featured12.jpg', '899.00', 0, 'White'),
(13, 'Polo Sneaker', 'shoes', 'Yellow colored Sneakers | Has regular styling | Lace-ups details | Comfortable on feets', 'shoes1.jpg', 'shoes1.jpg', 'shoes1.jpg', 'shoes1.jpg', '1172.00', 0, 'Yellow'),
(14, 'Polo Sneaker Black', 'shoes', 'Regular styling | Lace-ups details | Black in color', 'shoes2.jpg', 'shoes2.jpg', 'shoes2.jpg', 'shoes2.jpg', '1100.00', 0, 'Black'),
(15, 'Nike Air Winflow', 'shoes', 'A pair of blue shoes, has regular Styling, lace-ups detail\r\nTextile upper\r\nCushioned footbed\r\nTextured and patterned outsole\r\nA rubber outsole with a Waffle-inspired pattern provides road-ready traction.\r\nPremium white color.', 'shoes3.jpg', 'shoes3.jpg', 'shoes3.jpg', 'shoes3.jpg', '7540.00', 0, 'White'),
(16, 'Mast & Harbor Sneakers', 'shoes', 'Has regular Styling, lace-ups detail\r\nMesh Upper\r\nCushioned footbed\r\nTextured and patterned EVA outsole', 'shoes4.jpg', 'shoes4.jpg', 'shoes4.jpg', 'shoes4.jpg', '1275.00', 0, 'Green'),
(17, 'ColorFit Icon Buzz Smartwatch', 'watches', 'ColorFit Icon Buzz Bluetooth Calling Smart Watch with Voice Assistance | 1.69 TFT LCD display | Up to 7-day battery\r\n100+ watch faces: More than 100 cloud-based & customisable watch faces \r\nIP67 Waterproof\r\n  ', 'watch1.jpg', 'watch2.jpg', 'watch3.jpg', 'watch4.jpg', '2499.00', 0, 'White'),
(18, 'Realme Black TechLife', 'watches', 'The realme TechLife Watch S100 not only catches your eye with its 1.69(4.3cm) Large Color Display, but also comes with a host of innovative health and fitness features\r\nJust slip it on, and you can jump-start your day with any of its 110+ Stylish Watch Fa', 'watch2.jpg', 'watch2.jpg', 'watch2.jpg', 'watch2.jpg', '1899.00', 0, 'Black'),
(19, 'Noise Colorfit Smartwatch', 'watches', 'HD Superbright Display | Body and Skin Temperature monitor | IP68 Water Resistant', 'watch3.jpg', 'watch3.jpg', 'watch3.jpg', 'watch3.jpg', '2099.00', 0, 'Black'),
(20, 'Realme Techscrap Smartwatch', 'watches', 'The realme TechLife Watch S100 not only catches your eye with its 1.69(4.3cm) Large Color Display, but also comes with a host of innovative health and fitness features | Comes with a 12-day battery life.', 'watch4.jpg', 'watch4.jpg', 'watch4.jpg', 'watch4.jpg', '2399.00', 0, 'Orange'),
(21, 'Peter England Grey Suit', 'fashion', 'Look sharp and make an impact in this Grey Solid two-piece suit from Peter England by Peter England. Cut in a streamlined Slim Fit , this suit promises maximum comfort and style.', 'clothes1.jpg', 'clothes1.jpg', 'clothes1.jpg', 'clothes1.jpg', '4399.00', 0, 'Grey'),
(22, 'Vintage T-shirt', 'fashion', 'Vintage Tshirt for men\r\nRegular length\r\nFull, regular sleeves\r\nKnitted cotton fabric\r\n', 'clothes2.jpg', 'clothes2.jpg', 'clothes2.jpg', 'clothes2.jpg', '766.00', 0, 'White'),
(23, 'Burberry Trench Coat', 'fashion', 'Solid knee length trench coat, has a notch lapel collar, 6 pockets ,has a button closure, long sleeves, polyester lining', 'clothes3.jpg', 'clothes3.jpg', 'clothes3.jpg', 'clothes3.jpg', '4599.00', 0, 'Brown'),
(24, 'Denim Shirt', 'fashion', 'Blue denim washed casual shirt, has a spread collar, a full button placket, long sleeves with roll-up tabs, chest pocket, curved hem\r\nThe article ages uniquely as you treat it, acquiring your personalised feel.', 'clothes4.jpg', 'clothes4.jpg', 'clothes4.jpg', 'clothes4.jpg', '899.00', 0, 'Blue');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UX_Constraint` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
