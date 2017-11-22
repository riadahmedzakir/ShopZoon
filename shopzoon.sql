-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 15, 2017 at 11:00 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopzoon`
--

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
CREATE TABLE IF NOT EXISTS `authority` (
  `authority_id` int(100) NOT NULL AUTO_INCREMENT,
  `authority_table` varchar(100) NOT NULL,
  `authority_column` varchar(100) NOT NULL,
  `authority_column_access` varchar(100) NOT NULL,
  `no` int(10) DEFAULT NULL,
  PRIMARY KEY (`authority_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`authority_id`, `authority_table`, `authority_column`, `authority_column_access`, `no`) VALUES
(48, 'people', 'password', 'None', NULL),
(45, 'authority', 'authority_column_access', 'Admin', NULL),
(43, 'authority', 'authority_column', 'Admin', NULL),
(42, 'authority', 'authority_table', 'Admin', NULL),
(41, 'authority', 'authority_id', 'Admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
CREATE TABLE IF NOT EXISTS `people` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `passcode` varchar(10) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `location` varchar(100) NOT NULL,
  `cookies` varchar(100) DEFAULT NULL,
  `logfail` int(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `rating` float DEFAULT '100',
  `area` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cookies` (`cookies`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `fname`, `lname`, `username`, `email`, `password`, `passcode`, `phone`, `location`, `cookies`, `logfail`, `type`, `active`, `rating`, `area`) VALUES
(15, 'Pronab', 'Halder', 'Pronab1505487284198', 'pronabhalder103@gmail.com', 'as', NULL, NULL, 'Nikunjo 2, Dhaka', NULL, 0, 'Staff', 1, 100, NULL),
(14, 'Vikram', 'Halder', 'Vikram1505487264865', 'vikramhalder103@gmail.com', 'as', NULL, NULL, 'Nikunjo 2, Dhaka', NULL, 0, 'Admin', 1, 100, NULL),
(16, 'Vik', 'Pro', 'Vik1505487305230', 'vikram@gmail.com', 'as', NULL, NULL, 'Nikunjo 2, Dhaka', NULL, NULL, 'Deliver', 0, 100, NULL),
(17, 'Customer', 'Name', 'Customer1505487327062', 'customer@gmail.com', 'as', NULL, NULL, 'Nikunjo 2, Dhaka', NULL, NULL, 'Customar', 1, 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_catagory` int(100) DEFAULT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `product_discount` varchar(100) DEFAULT NULL,
  `product_size` varchar(100) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_img_catagory` varchar(100) DEFAULT NULL,
  `product_season` varchar(100) DEFAULT NULL,
  `product_time` varchar(100) NOT NULL,
  `product_limit` int(10) DEFAULT NULL,
  `product_discription` text,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_catagory`, `product_title`, `product_code`, `product_price`, `product_discount`, `product_size`, `product_image`, `product_img_catagory`, `product_season`, `product_time`, `product_limit`, `product_discription`) VALUES
(20, 2, 'Casual Shirt for Men', 'M-129-38648', '930', '0', 'All', 'product2017_08_10_23_30_56.png', 'Normal', '', 'Aug 10, 2017 11:30:56 PM', 75, 'Grab stylish casual shirt at an affordable price for you. It has attractive design will adorn yourself with gorgeous look and make you stand out.'),
(21, 2, 'Exclusive Indian ND Cotton Punjabi', 'M-325-38875', '2300', '20', 'All', 'product2017_08_11_21_28_04.png', 'Normal', '', 'Aug 11, 2017 9:28:04 PM', 97, 'Grab a stylish Punjabi at an affordable price for upcoming festival. Creative designs to adorn yourself with gorgeous look and to make you stand out.'),
(24, 2, 'Attractive Design Polo T-shirt', 'M-146-38155', '460', '0', 'All', 'product2017_08_11_21_32_34.png', 'Normal', '', 'Aug 11, 2017 9:32:34 PM', 1, 'Exclusive Polo t-shirt in cool color that will satisfy your mind. It feels you cool and comfortable with wonderful fabric and trendy style.'),
(23, 2, 'Cotton Panjabi for Men', 'M-90-16559', '1400', '36', 'All', 'product2017_08_11_21_30_56.png', 'Normal', '', 'Aug 11, 2017 9:30:56 PM', 50, ' Grab a stylish punjabi for you at an affordable price. Creative designs which adorn you with gorgeous look and make you stand out.'),
(22, 2, 'Contrast Purple Panjabi ', 'M-289-23204', '999', '0', 'All', 'product2017_08_11_21_29_42.png', 'Normal', '', 'Aug 11, 2017 9:29:42 PM', 321, 'Grab a stylish Panjabi at an affordable price for you. Creative designs to adorn yourself with gorgeous look and to make you stand out. High quality assured.'),
(25, 2, 'Gabardine Long Pant - Lee', 'M-334-38594', '740', '0', 'All', 'product2017_08_11_21_34_34.png', 'Normal', '', 'Aug 11, 2017 9:34:34 PM', 97, 'Grab a stylish pant at an affordable price for you. Its creative design will adorn you with a gorgeous look and will make you stand out.'),
(26, 2, 'Skinny Gabardine Gents Pant ', 'S-51-3505', '740', '5', 'All', 'product2017_08_11_21_36_00.png', 'Normal', '', 'Aug 11, 2017 9:36:00 PM', 1, 'Gabardine pant for gents in slim skinny fit with back and front pocket style. Available in cool color and high quality'),
(27, 7, 'Diamond Finger Ring 0.15 CT', 'M-342-31774', '30000', '25', 'All', 'product2017_08_12_00_19_32.png', 'Banner', '', 'Aug 12, 2017 12:19:32 AM', 80, 'A circle of radiant finger ring with beautiful diamonds to create an irresistible wedding or eternity ring. A captivating symbol of your eternal love. This is an elegant and stylish token of love for the most important person in your life.'),
(28, 3, 'Indian Designer Embroidery Dress ', 'M-399-39085', '2550', '10', 'All', 'product2017_08_21_00_59_50.png', 'Normal', '', 'Aug 21, 2017 12:59:51 AM', 1, 'Buy fashionable and trendy un-stitched embroidery dress set. Extraordinary design with quality finishing. Grab the latest designer collection. High quality imported replica version'),
(29, 3, 'Cotton floor Touch Replica Set', 'M-399-9952', '2250', '0', 'All', 'product2017_08_21_01_01_35.png', 'Normal', '', 'Aug 21, 2017 1:01:35 AM', 40, 'Indian Replica Salwar Kamiz Set in heavy embroidery! Extraordinary design and exclusive work. Comfortable to wear and good looking at the same time. Exactly what you need to get a perfect look.'),
(30, 3, 'Brasso Cotton Anarkoli Set', 'M-223-18903', '3000', '0', 'All', 'product2017_08_21_01_03_39.png', 'Normal', '', 'Aug 21, 2017 1:03:39 AM', 211, 'Exclusive printed anarkoli set. Extraordinary design and exclusive work. Comfortable to wear and good looking at the same time. Exactly what you need to get a perfect look.'),
(31, 4, 'Superman Kids Tent', 'M-420-38721', '1420', '0', 'All', 'product2017_08_21_01_05_17.png', 'Normal', '', 'Aug 21, 2017 1:05:17 AM', 231, 'Exclusive superman kids tent for your children which is very popular over the world for playing ball house game and it also will surprise your '),
(32, 4, 'Bashundhara Baby Diaper', 'M-374-32914', '105', '0', 'All', 'product2017_08_21_01_06_25.png', 'Normal', '', 'Aug 21, 2017 1:06:25 AM', 226, 'Inner layer which is reinforced with extra absorbent particles, specially intensified in discharging areas, prevent the fluid to leak out even under the weight of the baby.'),
(33, 4, 'Bashundhara Baby Diaper 8 Pcs', 'M-374-32930', '695', '1', 'All', 'product2017_08_21_01_07_59.png', 'Normal', '', 'Aug 21, 2017 1:08:00 AM', 112, 'Inner layer which is reinforced with extra absorbent particles, specially intensified in discharging areas, prevent the fluid to leak out even under the weight of the baby.'),
(36, 1, '123', '123', '123', '17', 'All', 'product2017_08_26_00_30_38.png', 'Banner', '', 'Aug 26, 2017 12:30:38 AM', 561, '23');

-- --------------------------------------------------------

--
-- Table structure for table `product_buynow`
--

DROP TABLE IF EXISTS `product_buynow`;
CREATE TABLE IF NOT EXISTS `product_buynow` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `customer_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `deliver_id` int(100) DEFAULT NULL,
  `payment_id` int(100) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_cancel`
--

DROP TABLE IF EXISTS `product_cancel`;
CREATE TABLE IF NOT EXISTS `product_cancel` (
  `payment_id` int(100) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) DEFAULT '0',
  `customer_id` int(100) DEFAULT '0',
  `product_id` int(100) DEFAULT '0',
  `payment_type` varchar(100) NOT NULL,
  `payment_address` varchar(100) NOT NULL,
  `transaction_id` varchar(100) DEFAULT 'NULL',
  `amount` int(100) NOT NULL,
  `success` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_cancel`
--

INSERT INTO `product_cancel` (`payment_id`, `order_id`, `customer_id`, `product_id`, `payment_type`, `payment_address`, `transaction_id`, `amount`, `success`) VALUES
(1, '14_1505490283355', 14, 28, 'Payza', 'asdfgnm', '2345', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_catagory`
--

DROP TABLE IF EXISTS `product_catagory`;
CREATE TABLE IF NOT EXISTS `product_catagory` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `product_catagory` varchar(100) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_catagory`
--

INSERT INTO `product_catagory` (`id`, `product_catagory`, `active`) VALUES
(2, 'Men Clothing', 1),
(3, 'Women Clothing', 1),
(4, 'Kids Zone', 1),
(5, 'Gents Watch', 1),
(6, 'Ladies Watch', 1),
(7, 'Jewelry Collection', 1),
(8, 'Fashion Accessories', 1),
(17, 'Mobile Phone', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_comment`
--

DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE IF NOT EXISTS `product_comment` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `product_id` int(100) NOT NULL,
  `people_id` int(100) NOT NULL,
  `text` varchar(5000) NOT NULL,
  `datetime` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
CREATE TABLE IF NOT EXISTS `product_order` (
  `order_id` varchar(100) NOT NULL,
  `customer_id` int(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(100) NOT NULL,
  `customer_district` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `deliver_id` int(100) DEFAULT '0',
  `product_id` int(100) NOT NULL,
  `product_qty` int(100) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_delivery_cost` int(100) NOT NULL,
  `product_total_cost` int(100) NOT NULL,
  `payment_id` int(100) DEFAULT '0',
  `action` varchar(100) NOT NULL DEFAULT 'order',
  `order_date` varchar(100) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_payment`
--

DROP TABLE IF EXISTS `product_payment`;
CREATE TABLE IF NOT EXISTS `product_payment` (
  `payment_id` int(100) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) DEFAULT '0',
  `customer_id` int(100) DEFAULT '0',
  `product_id` int(100) DEFAULT '0',
  `payment_type` varchar(100) NOT NULL,
  `payment_address` varchar(100) NOT NULL,
  `transaction_id` varchar(100) DEFAULT 'NULL',
  `amount` int(100) NOT NULL,
  `success` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
