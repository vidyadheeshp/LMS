-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2022 at 09:53 AM
-- Server version: 5.5.34
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `LMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `department_master`
--

CREATE TABLE IF NOT EXISTS `department_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(128) NOT NULL,
  `short_name` varchar(20) NOT NULL,
  `strength` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `designation_master`
--

CREATE TABLE IF NOT EXISTS `designation_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `design_name` varchar(64) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_master`
--

CREATE TABLE IF NOT EXISTS `employee_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(12) NOT NULL,
  `name` varchar(64) NOT NULL,
  `design_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `address` text NOT NULL,
  `dept_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL COMMENT '-1 = unregistered user    0- Ex-user   1- Existing User (Active)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE IF NOT EXISTS `leave_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` int(11) NOT NULL,
  `type_of_leave` int(11) NOT NULL,
  `alt` int(11) NOT NULL COMMENT 'alternative person id',
  `reason` int(11) NOT NULL COMMENT 'Leave reason (note)',
  `approval_status` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leave_entitle`
--

CREATE TABLE IF NOT EXISTS `leave_entitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `CL` int(11) NOT NULL COMMENT 'Casual Leave',
  `DL` int(11) NOT NULL COMMENT 'Duty Leave',
  `EL` int(11) NOT NULL COMMENT 'Earned Leave (Extended))',
  `RH` int(11) NOT NULL COMMENT 'Restritcted Hoiday',
  `ML` int(11) NOT NULL COMMENT 'Medical Leave',
  `CL_t` int(11) NOT NULL COMMENT 'CL taken',
  `DL_t` int(11) NOT NULL COMMENT 'DL Taken',
  `EL_t` int(11) NOT NULL COMMENT 'EL Taken',
  `RH_t` int(11) NOT NULL COMMENT 'RH Taken',
  `ML_t` int(11) NOT NULL COMMENT 'ML Taken',
  `WP` int(11) NOT NULL COMMENT 'Leave Without Pay',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `meta_aproval_status`
--

CREATE TABLE IF NOT EXISTS `meta_aproval_status` (
  `id` int(11) NOT NULL,
  `approval_status_name` varchar(32) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meta_leave_types`
--

CREATE TABLE IF NOT EXISTS `meta_leave_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
