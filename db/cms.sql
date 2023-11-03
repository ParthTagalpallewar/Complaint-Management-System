-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 02:30 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '07-04-2023 07:55:25 PM'),
(2, 'admin1', 'admin1234', '');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `remarkDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(1, 30, 'in process', 'Hi this for demo', '2023-03-31 15:03:38'),
(2, 38, 'in process', 'I think you need to meet mr. belsere regarding your scholarship issuse', '2023-04-07 13:49:22'),
(3, 40, 'in process', 'etwtyqrywrteur', '2023-04-28 07:26:41'),
(4, 44, 'closed', 'ok we will take action againts it', '2023-05-03 14:29:55'),
(5, 45, 'in process', ' Go student section for any query regarding scholarship ', '2023-05-11 17:15:17');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `departmentDescription` longtext,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `departmentName`, `departmentDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Information Technology', 'Information Technology', '2023-04-02 04:48:08', '2023-04-02 13:09:00'),
(2, 'Computer Engineering', 'Computer Engineering', '2023-04-04 22:30:00', '2023-04-05 13:18:00'),
(3, 'Civil Enginnering', 'Its all about field work , like construction', '2023-04-07 14:20:04', NULL),
(4, 'Electrical Engineering', 'It all about electrical equipment', '2023-05-03 14:31:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `rollno` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `department`, `year`, `complaintType`, `rollno`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(29, 4, 0, '3rd-year', 'other', '20CM007', 'refund', 'i want my fund return', '', '2023-03-26 15:26:51', NULL, NULL),
(30, 4, 0, '3rd-year', 'other', '20CM007', 'refund', 'i want my fund return', '', '2023-03-26 15:31:51', NULL, NULL),
(31, 5, 0, '3rd-year', '-1', '20CM007', 'Rechacking', 'qeygwuhgjngbkfklekf,.dm bnm', 'krutika.txt', '2023-03-30 05:35:02', NULL, NULL),
(32, 5, 0, '2nd-year', 'other', '21IF007', 'Rechacking', 'sbcdnmsbmfngklmhlcvhdsjsgnklhlfdhfewjthoerijy', '', '2023-04-03 08:51:40', NULL, NULL),
(33, 5, 0, '3rd-year', '-1', '20CM007', 'Rechacking', ' Process for rechange', '', '2023-04-03 11:20:40', NULL, NULL),
(34, 5, 0, '3rd-year', 'other', '20CM007', 'Rechacking', 'hhdfkjgkljrelhkl', '', '2023-04-05 15:07:20', NULL, NULL),
(35, 5, 0, '3rd-year', '-1', '21IF007', 'Rechacking', 'fdhwjbdfkjqnfk', 'DBMS.docx', '2023-04-05 15:26:44', NULL, NULL),
(36, 5, 1, '', 'General Query', '21IF007', 'refund', 'dgjdhfkjlfm;lwfuiyofgwkhd', '', '2023-04-05 15:49:42', NULL, NULL),
(37, 5, 2, '', 'General Query', '21IF007', 'scholarship', 'hsrbjbgkjrjrioyu5ouyehtj', '', '2023-04-05 16:08:53', NULL, NULL),
(38, 5, 1, '1st year', 'General Query', '21IF007', 'scholarship', 'bmwbdkwqnlkmlw', '', '2023-04-05 16:21:05', 'in process', '2023-04-07 13:49:22'),
(39, 5, 1, '2nd-year', 'General Query', '20IF065', 'Refund', 'sir , I paid extra fees during registration process  so , I want my fees back from collage', '', '2023-04-05 18:35:03', NULL, NULL),
(40, 6, 1, '3rd-year', 'General Query', '20IF001', 'scholarship', 'i want know about date of last day', '', '2023-04-05 18:39:07', 'in process', '2023-04-28 07:26:41'),
(41, 6, 1, '3rd-year', ' Complaint', '20IF001', 'classroom', 'our class room are not cleaned', 'php MP url.txt', '2023-04-05 18:41:46', NULL, NULL),
(42, 15, 2, '3rd-year', 'General Query', '20CM007', 'scholarship', 'Date of scholarship', '', '2023-04-16 15:25:51', NULL, NULL),
(43, 26, 2, '3rd-year', 'General Query', '20CM007', 'Refund', 'Refund about my ', '', '2023-04-21 07:25:08', NULL, NULL),
(44, 36, 3, '3rd-year', ' Complaint', '20EE057', 'Garbege', 'Room no 108 have a lots of garbege', '', '2023-05-03 14:27:39', 'closed', '2023-05-03 14:29:55'),
(45, 40, 2, '3rd-year', 'General Query', '20CM007', 'scholarship', 'I want know about scholarship', '', '2023-05-11 17:05:54', 'in process', '2023-05-11 17:15:17');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(32, 4, 'shreyapande@gmail.com', 0x3a3a3100000000000000000000000000, '2023-03-26 15:24:02', '', 1),
(33, 4, 'shreyapande@gmail.com', 0x3a3a3100000000000000000000000000, '2023-03-26 18:17:21', '', 1),
(34, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-03-30 05:33:28', '', 1),
(35, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-03-30 05:39:11', '', 1),
(36, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-03-30 05:43:30', '', 1),
(37, 0, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-03-30 06:09:22', '', 0),
(38, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-03-30 06:09:30', '30-03-2023 03:14:10 PM', 1),
(39, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-03-31 13:56:09', '', 1),
(40, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-02 13:10:01', '', 1),
(41, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-02 13:35:02', '', 1),
(42, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-02 14:14:12', '02-04-2023 07:49:20 PM', 1),
(43, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-03 08:49:42', '03-04-2023 02:24:11 PM', 1),
(44, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-03 11:19:29', '', 1),
(45, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-05 12:54:35', '05-04-2023 09:58:20 PM', 1),
(46, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-05 18:34:34', '06-04-2023 12:06:54 AM', 1),
(47, 6, 'aarti@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-05 18:37:55', '', 1),
(48, 6, 'aarti@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-05 19:06:07', '', 1),
(49, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-07 13:30:39', '07-04-2023 07:01:07 PM', 1),
(50, 5, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-07 13:49:54', '', 1),
(51, 0, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-07 14:21:09', '', 0),
(52, 0, 'dsai5655@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-07 14:21:19', '', 0),
(53, 0, 'aarti@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-07 14:21:27', '', 0),
(54, 6, 'aarti@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-07 14:21:41', '07-04-2023 07:54:05 PM', 1),
(55, 9, 'shreyapande@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-15 06:54:09', '15-04-2023 12:24:28 PM', 1),
(56, 11, 'shreyaborode@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-15 06:56:22', '15-04-2023 12:30:50 PM', 1),
(57, 15, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-16 15:24:44', '16-04-2023 08:56:10 PM', 1),
(58, 15, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-16 15:28:34', '', 1),
(59, 0, 'tanviwaharmare49@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 07:56:53', '', 0),
(60, 0, 'tanviwaghmare49@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 07:57:21', '', 0),
(61, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:00:36', '', 0),
(62, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:00:51', '', 0),
(63, 18, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:03:11', '18-04-2023 01:34:54 PM', 1),
(64, 0, 'shravanishinganwadikar@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:15:20', '', 0),
(65, 0, 'shravanishinganwadikar@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:19:41', '18-04-2023 02:09:06 PM', 0),
(66, 0, 'shreyavborode@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:40:28', '', 0),
(67, 17, 'tanviwaghmare49@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:48:18', '18-04-2023 02:18:23 PM', 1),
(68, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:49:16', '', 0),
(69, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:51:06', '', 0),
(70, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:51:15', '', 0),
(71, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:51:54', '', 0),
(72, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 08:52:02', '', 0),
(73, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 10:20:05', '', 0),
(74, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 10:22:34', '', 0),
(75, 24, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-18 10:23:34', '', 1),
(76, 25, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-20 17:06:04', '20-04-2023 10:40:25 PM', 1),
(77, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-21 06:24:19', '', 0),
(78, 26, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-21 06:25:17', '', 1),
(79, 26, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-21 07:23:49', '21-04-2023 12:55:24 PM', 1),
(80, 26, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-21 07:31:47', '21-04-2023 01:04:00 PM', 1),
(81, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-26 10:33:15', '', 0),
(82, 32, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-26 10:34:51', '26-04-2023 04:04:55 PM', 1),
(83, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-26 10:43:39', '', 0),
(84, 33, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-26 10:44:26', '26-04-2023 04:14:29 PM', 1),
(85, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-26 10:47:14', '', 0),
(86, 35, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-26 11:02:34', '26-04-2023 04:32:38 PM', 1),
(87, 41, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-28 06:15:37', '', 1),
(88, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-28 06:21:08', '', 0),
(89, 44, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-28 06:27:55', '28-04-2023 12:02:21 PM', 1),
(90, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-28 06:40:49', '', 0),
(91, 46, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-04-28 06:41:11', '28-04-2023 12:11:24 PM', 1),
(92, 36, 'shrutikavin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-03 14:24:29', '03-05-2023 07:58:16 PM', 1),
(93, 40, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-05 07:55:49', '05-05-2023 01:26:24 PM', 1),
(94, 0, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-11 16:57:59', '', 0),
(95, 40, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-11 17:00:10', '11-05-2023 10:38:30 PM', 1),
(96, 40, 'purvad704@gmail.com', 0x3a3a3100000000000000000000000000, '2023-05-30 12:10:20', '30-05-2023 05:43:09 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext,
  `department` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `rollno` varchar(255) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `status11` varchar(255) NOT NULL,
  `cpassword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `department`, `city`, `rollno`, `userImage`, `regDate`, `updationDate`, `status`, `token`, `status11`, `cpassword`) VALUES
(6, 'aarti Deshmukh', 'aarti@gmail.com', '3b712de48137572f3849aabd5666a4e3', 456738902, 'Amravati', 'Information Technology', 'Amaravati', '20IF001', NULL, '2023-04-05 18:37:29', NULL, 1, '', '', NULL),
(7, 'Shreya pande', 'shreyapande@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 12345, NULL, NULL, NULL, NULL, NULL, '2023-04-07 14:36:47', NULL, 1, '', '', NULL),
(9, 'Shreya pande', 'shreyapande@gmail.com', 'd0970714757783e6cf17b26fb8e2298f', 2345623456, NULL, NULL, NULL, '20CM040', NULL, '2023-04-15 06:51:17', NULL, 1, '', '', NULL),
(10, 'Shreya pande', 'shreyapande@gmail.com', 'd0970714757783e6cf17b26fb8e2298f', 2345623456, NULL, NULL, NULL, '20CM040', NULL, '2023-04-15 06:51:39', NULL, 1, '', '', NULL),
(13, 'Tejasvini Wankhede', 'teju@gmail.com', 'cf2a5424877cea5696db372e3c67c925', 1234567890, NULL, NULL, NULL, '20CM066', NULL, '2023-04-15 07:06:36', NULL, 1, '', '', NULL),
(17, 'Tanvi Waghmare', 'tanviwaghmare49@gmail.com', 'ecaf95bf52abf259a05477dd887b9ff8', 9022506656, NULL, NULL, NULL, NULL, NULL, '2023-04-18 07:55:48', NULL, 1, 'fe9341d55c87fc6d796c0e707e14a8', 'active', 'ecaf95bf52abf259a05477dd887b9ff8'),
(20, 'Shravani Shinganwadikar', 'shravanishinganwadikar@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 7709118827, NULL, NULL, NULL, NULL, NULL, '2023-04-18 08:19:23', NULL, 1, '18737052fc892d912958fb78400b40', 'inactive', '827ccb0eea8a706c4c34a16891f84e7b'),
(21, 'Shreya Borode', 'shreyavborode@gmail.com', '4a3232c59ecda21ac71bebe3b329bf36', 2233445566, NULL, NULL, NULL, NULL, NULL, '2023-04-18 08:39:55', NULL, 1, '7caf30bde62ea175d1b05b66af804f', 'inactive', '4a3232c59ecda21ac71bebe3b329bf36'),
(29, 'xyz', 'xyz@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 223344, NULL, NULL, NULL, '20CM007', NULL, '2023-04-26 07:43:10', NULL, 1, '9132f0eb95fd2e9d7b99f1d4e9ac3a', 'inactive', '827ccb0eea8a706c4c34a16891f84e7b'),
(30, 'pqr', 'pqr@gmail.com', '202cb962ac59075b964b07152d234b70', 0, NULL, NULL, NULL, '20CM007', NULL, '2023-04-26 07:44:28', NULL, 1, 'a64fd70cad307b229a0dce6b963422', 'inactive', '202cb962ac59075b964b07152d234b70'),
(36, 'Shrutika vinchurkar', 'shrutikavin@gmail.com', '866edb65985fefe70f0321557773c4b7', 7666594966, NULL, NULL, NULL, '20EE057', NULL, '2023-05-03 14:23:43', NULL, 1, '42bb8a0a200d6f19426adf1f34637d', 'active', '866edb65985fefe70f0321557773c4b7'),
(37, 'Shreya Pande', 'xyz@gmail.com', '25d55ad283aa400af464c76d713c07ad', 9579147633, NULL, NULL, NULL, '20CM009', NULL, '2023-05-05 06:55:33', NULL, 1, '6aeb83a19c6296dced3e61604a7da9', 'inactive', '25d55ad283aa400af464c76d713c07ad'),
(38, 'aaa', 'aaa@gmail.com', 'c20ad4d76fe97759aa27a0c99bff6710', 4567890432, NULL, NULL, NULL, '20EE057', NULL, '2023-05-05 07:08:19', NULL, 1, 'a96b7a4763e562152106ec333e0a30', 'inactive', 'c20ad4d76fe97759aa27a0c99bff6710'),
(39, 'www', 'www@gmail.com', '25d55ad283aa400af464c76d713c07ad', 9022506656, NULL, NULL, NULL, '20CM004', NULL, '2023-05-05 07:32:22', NULL, 1, '9b4030125cd0529a7dc03b3973b3df', 'inactive', '25d55ad283aa400af464c76d713c07ad'),
(40, 'Purva Mangesh Deshmukh', 'purvad704@gmail.com', '25d55ad283aa400af464c76d713c07ad', 9579147633, NULL, NULL, NULL, '20CM007', NULL, '2023-05-05 07:55:16', NULL, 1, 'fa6b396081ce693ce2de04c2862932', 'active', '25d55ad283aa400af464c76d713c07ad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
