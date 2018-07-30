-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 29, 2012 at 01:44 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `user` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user`, `name`, `passwd`, `role`) VALUES
('admin', 'admin', 'user', 'manager'),
('chacha', 'chacha', 'chacha', 'user'),
('chetan', 'chetan', 'chetan', 'user'),
('deepak', 'singh', '12345', 'user'),
('goyal', 'santos', '800435', 'user'),
('india', 'india', '1234', 'user'),
('jamuna', 'jamuna prasad', 'prasad', 'user'),
('loveshsethi90', 'lovesh sethi', 'koi', 'user'),
('narendra', 'narendra', '800435', 'user'),
('raj', 'raj ', 'sam', 'user'),
('santos', 'santos', 'aaaa', 'user'),
('satish', 'satish kumar', 'family', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `pid` int(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `price` decimal(5,0) NOT NULL,
  `category` varchar(20) NOT NULL,
  `stock` int(4) NOT NULL,
  `reorder` int(4) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `name`, `company`, `price`, `category`, `stock`, `reorder`) VALUES
(101, 'fdd', 'sony', '550', 'hardware', 13, 0),
(102, 'hdd', 'samsung', '499', 'hardware', 26, 0),
(103, 'motherboard', 'msi', '2399', 'hardware', 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `purchaseid` int(3) NOT NULL AUTO_INCREMENT,
  `pid` int(3) NOT NULL,
  `user` varchar(20) NOT NULL,
  `dop` date NOT NULL DEFAULT '2011-01-01',
  `paytype` varchar(10) NOT NULL,
  `pno` varchar(20) NOT NULL,
  `ptype` varchar(2) NOT NULL,
  `reason` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`purchaseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchaseid`, `pid`, `user`, `dop`, `paytype`, `pno`, `ptype`, `reason`) VALUES
(5, 103, 'india', '2011-04-08', 'bank', '65478965456', 'v', 'null'),
(7, 102, 'india', '2011-04-08', 'cc', '6666666666', 'v', 'null'),
(8, 101, 'india', '2011-04-08', 'cc', '6666666666', 'v', 'null'),
(10, 102, 'india', '2011-04-08', 'cc', '65478965456', 'v', 'null'),
(12, 103, 'jamuna', '2011-04-21', 'bank', '1500045425542', 'v', 'null'),
(14, 101, 'santos', '2011-04-25', 'db', 'ghgghgdg', 'v', 'null'),
(17, 101, 'santos', '2011-04-25', 'db', '986095680', 'v', 'null'),
(23, 101, 'chacha', '2011-04-25', 'cc', '87954539', 'v', 'null'),
(25, 101, 'raj', '2011-05-03', 'cc', '214563', 'v', 'null');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
