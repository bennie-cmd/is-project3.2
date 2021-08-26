-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 26, 2021 at 01:06 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_ls`
--

-- --------------------------------------------------------

--
-- Table structure for table `leave_details`
--

DROP TABLE IF EXISTS `leave_details`;
CREATE TABLE IF NOT EXISTS `leave_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(10) NOT NULL,
  `startdate` varchar(250) NOT NULL,
  `enddate` varchar(250) NOT NULL,
  `type` varchar(50) NOT NULL,
  `reasons` varchar(500) NOT NULL,
  `remaining_days` int(30) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `isread` int(1) NOT NULL DEFAULT '0',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk` (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_details`
--

INSERT INTO `leave_details` (`id`, `employee_id`, `startdate`, `enddate`, `type`, `reasons`, `remaining_days`, `status`, `isread`, `posting_date`, `deleted`) VALUES
(7, '#78', '01-08-2021', '28-08-2021', 'Study', 'BBIT', 28, 0, 0, '2021-08-19 18:12:39', 0),
(6, '#78', '20-08-2021', '31-08-2021', 'Maternity/Paternity', 'Blessed with a Bouncing Baby Boy ', 12, 0, 0, '2021-08-19 17:58:49', 0),
(9, '#78', '03-08-2021', '27-08-2021', 'Sick', 'covid-vaccine', 25, 0, 0, '2021-08-19 18:25:38', 0),
(10, '7874', '18-08-2021', '27-08-2021', 'Absence', 'hbhdbv', 10, 0, 1, '2021-08-20 17:25:56', 0);

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE IF NOT EXISTS `leave_types` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `total_days` varchar(250) NOT NULL,
  `policy` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `total_days`, `policy`, `date_created`) VALUES
(1, 'Maternity/Paternity leave', '90', 'Congratulations, this policy is created to cater for the maternity, paternity for employees. the maximum days-period is 90 days. After exceeding this amount of days you have to use up your other leave types.', '2021-08-19 17:43:37'),
(2, 'Sick Leave', '30', 'May you Get well Soon, this policy is created to provide recovery time, hopefully you get back soon. the maximum days-period is 30 days. After exceeding this amount of days you have to use up your other leave types.', '2021-08-19 17:47:04'),
(3, 'Study Leave', '1440', 'This policy is created to cater for the a study leave period of 4 years. the maximum days-period is 1440 days. After exceeding this amount of days you have to report back to the organization.', '2021-08-19 17:53:34'),
(4, 'Absence Leave', '14', 'This policy is created to help employees, have a short break from the. The maximum days-period is 2 weeks. After exceeding this amount of days you have to use up your other leave types.', '2021-08-19 17:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `employee_id` varchar(10) NOT NULL,
  `department` text NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_hired` date NOT NULL,
  `password` varchar(70) NOT NULL,
  `user_type` varchar(10) NOT NULL DEFAULT 'employee',
  `available_days` int(10) NOT NULL DEFAULT '30',
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `password_2` (`password`),
  KEY `password_3` (`password`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`employee_id`, `department`, `firstname`, `lastname`, `email`, `date_hired`, `password`, `user_type`, `available_days`) VALUES
('123', 'Production', 'Bennet', 'Kambona', 'bennetotieno@gmail.com', '2021-08-04', '202cb962ac59075b964b07152d234b70', 'admin', 30),
('098', 'Finance', 'ab', 'cd', 'abcd@gmail.com', '2021-08-06', '024d7f84fff11dd7e8d9c510137a2381', 'employee', 30),
('7874', 'Finance', 'urri', 'ree', 'urri@gmail.com', '2021-08-09', '305ddad049f65a2c241dbb6e6f746c54', 'employee', 30),
('#78', 'Finance', 'James', 'Ouko', 'james@gmail.com', '2021-08-12', '35f4a8d465e6e1edc05f3d8ab658c551', 'employee', 30);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
