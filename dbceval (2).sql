-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 10:57 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbceval`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Active = 1, Inactive = 0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `created_at`, `updated_at`, `status`) VALUES
(1, 'John Mosesz', 'Pangilinan', 'Tiamzon', 'jmptiamzon', '$2b$10$UBt8pJCt3oq2HA7XLCYtgup26340x.ZifTPAvpv/aE2JmhTs8mU2a', '2019-10-22 09:50:26', '2019-10-22 10:37:50', 1),
(2, 'sample', 'sample', 'sample', 'sample', '$2b$10$0zxWOrhMzovHScv4MAUspeyJyQUcjnGOdPYfsv/e7BL6GsC1GzJrW', '2019-10-22 09:52:01', '2019-10-27 07:12:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblappstatus`
--

CREATE TABLE `tblappstatus` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblappstatus`
--

INSERT INTO `tblappstatus` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-10-11 10:03:41', '2019-10-22 10:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourse`
--

CREATE TABLE `tblcourse` (
  `id` int(11) NOT NULL,
  `school_id` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcourse`
--

INSERT INTO `tblcourse` (`id`, `school_id`, `course_name`, `status`, `created_at`, `updated_at`) VALUES
(1, '1,2,4,5', 'Computer Science', 1, '2019-10-15 09:57:16', '2019-10-27 08:50:59'),
(2, '1,2,4,5', 'Information Technology', 1, '2019-10-15 10:38:29', '2019-10-27 08:50:51'),
(3, '2,3,4', 'Psychology', 1, '2019-10-15 11:35:40', '2019-10-23 08:44:41'),
(4, '3,4', 'Law', 1, '2019-10-22 10:19:53', '2019-10-23 08:44:52'),
(5, '3', 'Test', 1, '2019-10-30 11:18:58', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbllogs`
--

CREATE TABLE `tbllogs` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `msg_log` varchar(255) NOT NULL,
  `user_type` tinyint(1) NOT NULL COMMENT '0 = Admin, 1 = User ',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllogs`
--

INSERT INTO `tbllogs` (`id`, `user`, `msg_log`, `user_type`, `created_at`) VALUES
(1, 1, 'jmptiamzon logged off.', 0, '2019-10-23 08:03:08'),
(2, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-23 08:03:13'),
(3, 1, 'jmptiamzon updated a course with id 1.', 0, '2019-10-23 08:44:12'),
(4, 1, 'jmptiamzon updated a course with id 2.', 0, '2019-10-23 08:44:30'),
(5, 1, 'jmptiamzon updated a course with id 3.', 0, '2019-10-23 08:44:41'),
(6, 1, 'jmptiamzon updated a course with id 4.', 0, '2019-10-23 08:44:52'),
(7, 1, 'jmptiamzon logged off.', 0, '2019-10-23 10:32:03'),
(8, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-23 10:32:10'),
(9, 1, 'jmptiamzon logged off.', 0, '2019-10-23 11:48:09'),
(10, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-24 02:09:31'),
(11, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-27 06:13:14'),
(12, 1, 'jmptiamzon updated a question with id 1.', 0, '2019-10-27 06:52:42'),
(13, 1, 'jmptiamzon updated a question with id 1.', 0, '2019-10-27 06:52:46'),
(14, 1, 'jmptiamzon updated a question with id 1.', 0, '2019-10-27 07:05:46'),
(15, 1, 'jmptiamzon updated a question with id 1.', 0, '2019-10-27 07:05:50'),
(16, 1, 'jmptiamzon updated a question with id 1.', 0, '2019-10-27 07:06:11'),
(17, 1, 'jmptiamzon updated a question with id 1.', 0, '2019-10-27 07:06:16'),
(18, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-10-27 07:12:04'),
(19, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-10-27 07:12:08'),
(20, 1, 'jmptiamzon updated a course with id 1.', 0, '2019-10-27 07:35:56'),
(21, 1, 'jmptiamzon updated a course with id 1.', 0, '2019-10-27 07:35:59'),
(22, 1, 'jmptiamzon updated a school data with id 1.', 0, '2019-10-27 07:38:46'),
(23, 1, 'jmptiamzon added a new school data.', 0, '2019-10-27 07:39:21'),
(24, 1, 'jmptiamzon updated a course with id 2.', 0, '2019-10-27 08:50:51'),
(25, 1, 'jmptiamzon updated a course with id 1.', 0, '2019-10-27 08:50:59'),
(26, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-28 13:41:55'),
(27, 1, 'jmptiamzon logged off.', 0, '2019-10-29 05:52:47'),
(28, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-29 05:52:51'),
(29, 1, 'jmptiamzon logged off.', 0, '2019-10-29 11:51:07'),
(30, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-29 11:51:13'),
(31, 1, 'jmptiamzon logged off.', 0, '2019-10-30 04:29:57'),
(32, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-30 04:30:02'),
(33, 1, 'jmptiamzon added a new course.', 0, '2019-10-30 11:18:58'),
(34, 1, 'jmptiamzon added a new question.', 0, '2019-10-30 11:19:09'),
(35, 1, 'jmptiamzon logged off.', 0, '2019-10-30 12:26:21'),
(36, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-30 13:13:20'),
(37, 1, 'jmptiamzon logged off.', 0, '2019-10-30 13:23:47'),
(38, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-31 00:51:07'),
(39, 1, 'jmptiamzon logged off.', 0, '2019-10-31 06:51:37'),
(40, 1, 'jmptiamzon successfully logged in.', 0, '2019-10-31 07:35:06'),
(41, 1, 'jmptiamzon logged off.', 0, '2019-10-31 07:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `tblltree`
--

CREATE TABLE `tblltree` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblltree`
--

INSERT INTO `tblltree` (`id`, `school_id`, `question_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2019-10-31 03:18:37', '0000-00-00 00:00:00'),
(2, 1, 2, 1, '2019-10-31 03:18:37', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblquestions`
--

CREATE TABLE `tblquestions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Inactive',
  `course_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblquestions`
--

INSERT INTO `tblquestions` (`id`, `question`, `status`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 'I\'m interested in graphic and/or Web design.\n', 1, '1', '2019-10-23 10:02:10', '2019-10-27 07:06:15'),
(2, 'I\'m interested in problem solving and/or analysis.\n', 1, '1,2,3,4', '2019-10-23 10:03:56', '0000-00-00 00:00:00'),
(3, 'Test', 1, '5', '2019-10-30 11:19:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblschool`
--

CREATE TABLE `tblschool` (
  `id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `min_tuition` bigint(20) NOT NULL,
  `max_tuition` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblschool`
--

INSERT INTO `tblschool` (`id`, `school_name`, `min_tuition`, `max_tuition`, `status`, `created_at`, `updated_at`) VALUES
(1, 'FEU Institute of Technology', 500000, 1000000, 1, '2019-10-09 09:17:56', '2019-10-27 07:38:45'),
(2, 'Centro Escolar University', 500000, 1000000, 1, '2019-10-09 09:49:48', '0000-00-00 00:00:00'),
(3, 'FEU Manila', 500000, 1000000, 1, '2019-10-12 01:35:50', '2019-10-22 10:09:57'),
(4, 'San Beda University', 600000, 1000000, 1, '2019-10-22 10:15:00', '2019-10-22 10:15:36'),
(5, 'Polytechnic University of the Philippines', 0, 20000, 1, '2019-10-27 07:39:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`) VALUES
(1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblappstatus`
--
ALTER TABLE `tblappstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbllogs`
--
ALTER TABLE `tbllogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblltree`
--
ALTER TABLE `tblltree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblquestions`
--
ALTER TABLE `tblquestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblschool`
--
ALTER TABLE `tblschool`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblappstatus`
--
ALTER TABLE `tblappstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcourse`
--
ALTER TABLE `tblcourse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbllogs`
--
ALTER TABLE `tbllogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tblltree`
--
ALTER TABLE `tblltree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblquestions`
--
ALTER TABLE `tblquestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblschool`
--
ALTER TABLE `tblschool`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
