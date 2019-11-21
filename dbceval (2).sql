-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2019 at 05:44 AM
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
(1, 'John Mosesz', 'Pangilinan', 'Tiamzon', 'jptiam', '$2b$10$UBt8pJCt3oq2HA7XLCYtgup26340x.ZifTPAvpv/aE2JmhTs8mU2a', '2019-10-22 09:50:26', '2019-11-16 03:02:54', 1),
(2, 'sample', 'sample', 'sample', 'sample', '$2a$10$NVKcBFf4QVN1fYJbJa430uIemDSm9UuY1NWIUdkpjw/0uwwV/1uaS', '2019-10-22 09:52:01', '2019-11-15 11:31:39', 1),
(3, 'John Moses', 'Pangilinan', 'Tiamzon', 'jmptia', '$2a$10$/iWbeaSyjIB13ifUpFnv1eaf4DDckxudiCMHbyave9i463sDOzcLu', '2019-11-15 12:32:43', '0000-00-00 00:00:00', 1),
(4, 'Junkevin Louis', 'Barrios', 'Jong', 'junkev', '$2a$10$F5H3CXaIypmtji4k5vWjk.yyzJenpWNxzEqthDXtU.Z4GH9BTQJZK', '2019-11-15 12:42:51', '0000-00-00 00:00:00', 1);

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
(1, 1, '2019-10-11 10:03:41', '2019-11-15 12:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblarea`
--

CREATE TABLE `tblarea` (
  `id` int(11) NOT NULL,
  `area` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Active, 0 = Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblarea`
--

INSERT INTO `tblarea` (`id`, `area`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Manila', 1, '2019-11-18 07:56:56', '2019-11-18 08:40:05'),
(2, 'Marikina', 1, '2019-11-18 09:38:26', '0000-00-00 00:00:00');

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
(5, '3', 'Test', 0, '2019-10-30 11:18:58', '2019-11-15 13:27:20'),
(6, '2,3,4,5', 'Business Administration', 1, '2019-11-15 13:27:08', '0000-00-00 00:00:00'),
(7, '1,2,4', 'Civil Engineering', 1, '2019-11-15 13:40:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourserank`
--

CREATE TABLE `tblcourserank` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcourserank`
--

INSERT INTO `tblcourserank` (`id`, `user_id`, `rank`, `course_id`, `school_id`, `created_at`) VALUES
(1, 112, 1, 1, 1, '2019-11-10 10:13:21'),
(2, 112, 2, 2, 1, '2019-11-10 10:13:21'),
(3, 16, 1, 1, 1, '2019-11-14 08:25:05'),
(4, 16, 2, 2, 1, '2019-11-14 08:25:05'),
(5, 17, 1, 1, 1, '2019-11-15 12:15:21'),
(6, 18, 1, 1, 1, '2019-11-15 13:20:26'),
(7, 18, 2, 2, 1, '2019-11-15 13:20:26'),
(8, 19, 1, 1, 1, '2019-11-15 13:48:42'),
(9, 20, 1, 1, 1, '2019-11-15 13:52:48'),
(10, 20, 2, 2, 1, '2019-11-15 13:52:48'),
(11, 20, 3, 7, 1, '2019-11-15 13:52:48'),
(12, 21, 1, 1, 1, '2019-11-18 11:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbldbbackup`
--

CREATE TABLE `tbldbbackup` (
  `id` int(11) NOT NULL,
  `dummy` varchar(6) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldbbackup`
--

INSERT INTO `tbldbbackup` (`id`, `dummy`, `updated_at`) VALUES
(1, 'update', '2019-11-09 10:07:41');

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
(41, 1, 'jmptiamzon logged off.', 0, '2019-10-31 07:37:05'),
(42, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-01 11:48:26'),
(43, 1, 'jmptiamzon logged off.', 0, '2019-11-01 11:48:28'),
(44, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-09 07:00:00'),
(45, 1, 'jmptiamzon changed the application status.', 0, '2019-11-09 12:52:04'),
(46, 1, 'jmptiamzon changed the application status.', 0, '2019-11-09 12:52:11'),
(47, 1, 'jmptiamzon logged off.', 0, '2019-11-09 13:41:55'),
(48, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-10 07:14:08'),
(49, 1, 'jmptiamzon logged off.', 0, '2019-11-10 07:22:48'),
(50, 3, 'User with id 3 went to home page.', 1, '2019-11-10 08:24:41'),
(51, 3, 'User with id 3 went to home page.', 1, '2019-11-10 08:33:10'),
(52, 3, 'User with id 3 went to home page.', 1, '2019-11-10 08:34:24'),
(53, 3, 'User undefined went to home page.', 1, '2019-11-10 08:38:23'),
(54, 3, 'User undefined went to home page.', 1, '2019-11-10 08:38:36'),
(55, 0, 'User 3 went to home page.', 1, '2019-11-10 08:38:49'),
(56, 0, 'User 3 went to home page.', 1, '2019-11-10 08:39:03'),
(57, 0, 'User d4bi4qf73d8vveso3ux8c went to home page.', 1, '2019-11-10 08:39:17'),
(58, 4, 'User d4bi4qf73d8vveso3ux8c went to home page.', 1, '2019-11-10 08:39:29'),
(59, 4, 'User d4bi4qf73d8vveso3ux8c went to home page.', 1, '2019-11-10 08:40:30'),
(60, 4, 'User d4bi4qf73d8vveso3ux8c went to about page.', 1, '2019-11-10 08:40:31'),
(61, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 08:45:46'),
(62, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 08:46:09'),
(63, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 08:53:41'),
(64, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 08:58:47'),
(65, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 08:59:20'),
(66, 4, 'User d4bi4qf73d8vveso3ux8c submitted the initial assessment.', 1, '2019-11-10 09:09:40'),
(67, 4, 'User d4bi4qf73d8vveso3ux8c submitted the mid assessment.', 1, '2019-11-10 09:09:44'),
(68, 4, 'User d4bi4qf73d8vveso3ux8c submitted the mid assessment.', 1, '2019-11-10 09:37:12'),
(69, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 09:56:22'),
(70, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 09:56:40'),
(71, 4, 'User d4bi4qf73d8vveso3ux8c submitted the initial assessment.', 1, '2019-11-10 09:56:48'),
(72, 4, 'User d4bi4qf73d8vveso3ux8c submitted the mid assessment.', 1, '2019-11-10 09:56:50'),
(73, 4, 'User d4bi4qf73d8vveso3ux8c submitted the mid assessment.', 1, '2019-11-10 09:56:53'),
(74, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 10:05:12'),
(75, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 10:05:48'),
(76, 4, 'User d4bi4qf73d8vveso3ux8c submitted the initial assessment.', 1, '2019-11-10 10:05:56'),
(77, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 10:07:50'),
(78, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 10:08:36'),
(79, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 10:09:03'),
(80, 4, 'User d4bi4qf73d8vveso3ux8c went to assessment page.', 1, '2019-11-10 10:13:02'),
(81, 4, 'User d4bi4qf73d8vveso3ux8c submitted the initial assessment.', 1, '2019-11-10 10:13:14'),
(82, 4, 'User d4bi4qf73d8vveso3ux8c submitted the mid assessment.', 1, '2019-11-10 10:13:18'),
(83, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-10 10:15:26'),
(84, 1, 'jmptiamzon logged off.', 0, '2019-11-10 10:54:49'),
(85, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-11 01:53:15'),
(86, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:18:28'),
(87, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:20:09'),
(88, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:21:04'),
(89, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:23:30'),
(90, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:28:15'),
(91, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:32:58'),
(92, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:33:38'),
(93, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:34:12'),
(94, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:35:20'),
(95, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:35:36'),
(96, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:36:01'),
(97, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:36:33'),
(98, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:36:42'),
(99, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:37:10'),
(100, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:37:32'),
(101, 0, 'User ydfjek0k6ldhnvnu6layor went to home page.', 1, '2019-11-11 02:38:13'),
(102, 0, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 05:54:37'),
(103, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 05:56:14'),
(104, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 06:00:03'),
(105, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 06:02:51'),
(106, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 06:03:44'),
(107, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 06:06:35'),
(108, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 06:09:24'),
(109, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 06:10:11'),
(110, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 06:10:47'),
(111, 5, 'User dxpkxyjju8jo0uipsyec1 went to assessment page.', 1, '2019-11-12 06:14:29'),
(112, 5, 'User dxpkxyjju8jo0uipsyec1 went to feature page.', 1, '2019-11-12 06:14:32'),
(113, 5, 'User dxpkxyjju8jo0uipsyec1 went to about page.', 1, '2019-11-12 06:14:32'),
(114, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-12 06:14:33'),
(115, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-12 06:15:08'),
(116, 0, 'User j2m9yjkffqk8jco90yx37 went to home page.', 1, '2019-11-12 06:59:06'),
(117, 1, 'User j2m9yjkffqk8jco90yx37 went to home page.', 1, '2019-11-12 06:59:16'),
(118, 1, 'User j2m9yjkffqk8jco90yx37 went to assessment page.', 1, '2019-11-12 06:59:19'),
(119, 1, 'User j2m9yjkffqk8jco90yx37 submitted the initial assessment.', 1, '2019-11-12 06:59:34'),
(120, 1, 'User j2m9yjkffqk8jco90yx37 submitted the mid assessment.', 1, '2019-11-12 06:59:38'),
(121, 1, 'User j2m9yjkffqk8jco90yx37 submitted the mid assessment.', 1, '2019-11-12 06:59:41'),
(122, 1, 'User j2m9yjkffqk8jco90yx37 went to assessment page.', 1, '2019-11-12 07:44:04'),
(123, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 01:42:13'),
(124, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 01:42:34'),
(125, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 01:44:04'),
(126, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 01:46:26'),
(127, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 01:47:53'),
(128, 1, 'jmptiamzon logged off.', 0, '2019-11-13 01:48:12'),
(129, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-13 01:48:20'),
(130, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 01:49:11'),
(131, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 01:50:23'),
(132, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 01:51:35'),
(133, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 02:18:10'),
(134, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 02:19:54'),
(135, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 02:20:26'),
(136, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-13 02:21:19'),
(137, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:42:14'),
(138, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:46:13'),
(139, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:46:30'),
(140, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:47:29'),
(141, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:48:21'),
(142, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:49:08'),
(143, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:49:23'),
(144, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:53:01'),
(145, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 02:54:07'),
(146, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-13 04:47:23'),
(147, 1, 'jmptiamzon updated a course with id 1.', 0, '2019-11-13 06:05:58'),
(148, 1, 'jmptiamzon logged off.', 0, '2019-11-13 07:20:14'),
(149, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-13 07:34:09'),
(150, 1, 'jmptiamzon changed the application status.', 0, '2019-11-13 07:34:23'),
(151, 1, 'jmptiamzon changed the application status.', 0, '2019-11-13 07:34:26'),
(152, 1, 'jmptiamzon logged off.', 0, '2019-11-13 07:39:21'),
(153, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 07:39:44'),
(154, 5, 'User dxpkxyjju8jo0uipsyec1 went to assessment page.', 1, '2019-11-13 07:40:16'),
(155, 5, 'User dxpkxyjju8jo0uipsyec1 went to assessment page.', 1, '2019-11-13 08:05:57'),
(156, 5, 'User dxpkxyjju8jo0uipsyec1 went to assessment page.', 1, '2019-11-13 08:06:45'),
(157, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:29:49'),
(158, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:31:01'),
(159, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:31:07'),
(160, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:32:50'),
(161, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-13 08:33:04'),
(162, 1, 'jmptiamzon changed the application status.', 0, '2019-11-13 08:35:35'),
(163, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:35:48'),
(164, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:36:06'),
(165, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:36:48'),
(166, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:38:59'),
(167, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:39:25'),
(168, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:39:44'),
(169, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:00'),
(170, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:21'),
(171, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:22'),
(172, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:22'),
(173, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:22'),
(174, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:23'),
(175, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:23'),
(176, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:23'),
(177, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:23'),
(178, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:24'),
(179, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:24'),
(180, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:24'),
(181, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:25'),
(182, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:25'),
(183, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:25'),
(184, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:25'),
(185, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:26'),
(186, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:26'),
(187, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:26'),
(188, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:27'),
(189, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:27'),
(190, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:28'),
(191, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:28'),
(192, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:28'),
(193, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:29'),
(194, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:29'),
(195, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:29'),
(196, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:30'),
(197, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:30'),
(198, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:30'),
(199, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:30'),
(200, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:31'),
(201, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:31'),
(202, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:32'),
(203, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:32'),
(204, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:34'),
(205, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:34'),
(206, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:40:36'),
(207, 5, 'User dxpkxyjju8jo0uipsyec1 went to about page.', 1, '2019-11-13 08:40:54'),
(208, 1, 'jmptiamzon changed the application status.', 0, '2019-11-13 08:41:03'),
(209, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 08:41:08'),
(210, 5, 'User dxpkxyjju8jo0uipsyec1 went to assessment page.', 1, '2019-11-13 08:41:15'),
(211, 5, 'User dxpkxyjju8jo0uipsyec1 went to assessment page.', 1, '2019-11-13 09:00:16'),
(212, 5, 'User dxpkxyjju8jo0uipsyec1 went to assessment page.', 1, '2019-11-13 09:06:20'),
(213, 1, 'jmptiamzon logged off.', 0, '2019-11-13 09:07:40'),
(214, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 09:09:31'),
(215, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 09:13:33'),
(216, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 09:21:41'),
(217, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 09:21:51'),
(218, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 09:22:19'),
(219, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:19:30'),
(220, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:19:48'),
(221, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:19:53'),
(222, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:21:06'),
(223, 5, 'User dxpkxyjju8jo0uipsyec1 went to about page.', 1, '2019-11-13 10:21:38'),
(224, 5, 'User dxpkxyjju8jo0uipsyec1 went to feature page.', 1, '2019-11-13 10:22:14'),
(225, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:22:17'),
(226, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:22:53'),
(227, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:25:18'),
(228, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:45:08'),
(229, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 10:48:43'),
(230, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 11:05:15'),
(231, 5, 'User dxpkxyjju8jo0uipsyec1 went to home page.', 1, '2019-11-13 11:05:24'),
(232, 0, 'User gyocoem83548z1s5qap3hu went to home page.', 1, '2019-11-14 02:23:50'),
(233, 3, 'User gyocoem83548z1s5qap3hu went to home page.', 1, '2019-11-14 02:27:05'),
(234, 3, 'User gyocoem83548z1s5qap3hu went to assessment page.', 1, '2019-11-14 02:30:31'),
(235, 3, 'User gyocoem83548z1s5qap3hu went to assessment page.', 1, '2019-11-14 02:38:48'),
(236, 3, 'User gyocoem83548z1s5qap3hu went to assessment page.', 1, '2019-11-14 06:20:49'),
(237, 3, 'User gyocoem83548z1s5qap3hu went to home page.', 1, '2019-11-14 06:20:54'),
(238, 3, 'User gyocoem83548z1s5qap3hu went to about page.', 1, '2019-11-14 06:21:06'),
(239, 3, 'User gyocoem83548z1s5qap3hu went to assessment page.', 1, '2019-11-14 06:21:40'),
(240, 3, 'User gyocoem83548z1s5qap3hu submitted the initial assessment.', 1, '2019-11-14 06:21:57'),
(241, 3, 'User gyocoem83548z1s5qap3hu submitted the mid assessment.', 1, '2019-11-14 06:22:01'),
(242, 3, 'User gyocoem83548z1s5qap3hu submitted the mid assessment.', 1, '2019-11-14 06:22:06'),
(243, 3, 'User gyocoem83548z1s5qap3hu went to assessment page.', 1, '2019-11-14 06:24:26'),
(244, 0, 'User acdx47pyfjduwqy9dropli went to home page.', 1, '2019-11-14 06:24:38'),
(245, 4, 'User acdx47pyfjduwqy9dropli went to assessment page.', 1, '2019-11-14 06:24:40'),
(246, 4, 'User acdx47pyfjduwqy9dropli submitted the initial assessment.', 1, '2019-11-14 06:25:02'),
(247, 4, 'User acdx47pyfjduwqy9dropli submitted the mid assessment.', 1, '2019-11-14 06:25:07'),
(248, 4, 'User acdx47pyfjduwqy9dropli submitted the mid assessment.', 1, '2019-11-14 06:25:12'),
(249, 4, 'User acdx47pyfjduwqy9dropli went to assessment page.', 1, '2019-11-14 06:26:02'),
(250, 4, 'User acdx47pyfjduwqy9dropli went to assessment page.', 1, '2019-11-14 06:26:24'),
(251, 0, 'User m9xcfq9vj29pnro56k68f went to home page.', 1, '2019-11-14 06:26:32'),
(252, 5, 'User m9xcfq9vj29pnro56k68f went to assessment page.', 1, '2019-11-14 06:26:33'),
(253, 5, 'User m9xcfq9vj29pnro56k68f submitted the initial assessment.', 1, '2019-11-14 06:26:44'),
(254, 5, 'User m9xcfq9vj29pnro56k68f submitted the mid assessment.', 1, '2019-11-14 06:26:47'),
(255, 5, 'User m9xcfq9vj29pnro56k68f submitted the mid assessment.', 1, '2019-11-14 06:26:50'),
(256, 0, 'User 257v4x8acoyoushz6nc79j went to home page.', 1, '2019-11-14 06:27:35'),
(257, 6, 'User 257v4x8acoyoushz6nc79j went to home page.', 1, '2019-11-14 06:28:21'),
(258, 6, 'User 257v4x8acoyoushz6nc79j went to home page.', 1, '2019-11-14 06:28:49'),
(259, 6, 'User 257v4x8acoyoushz6nc79j went to home page.', 1, '2019-11-14 06:29:03'),
(260, 6, 'User 257v4x8acoyoushz6nc79j went to home page.', 1, '2019-11-14 06:31:32'),
(261, 6, 'User 257v4x8acoyoushz6nc79j went to home page.', 1, '2019-11-14 06:32:02'),
(262, 6, 'User 257v4x8acoyoushz6nc79j went to home page.', 1, '2019-11-14 06:32:13'),
(263, 6, 'User 257v4x8acoyoushz6nc79j went to assessment page.', 1, '2019-11-14 06:32:23'),
(264, 6, 'User 257v4x8acoyoushz6nc79j submitted the initial assessment.', 1, '2019-11-14 06:32:35'),
(265, 6, 'User 257v4x8acoyoushz6nc79j submitted the mid assessment.', 1, '2019-11-14 06:32:38'),
(266, 6, 'User 257v4x8acoyoushz6nc79j submitted the mid assessment.', 1, '2019-11-14 06:32:42'),
(267, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-14 06:33:45'),
(268, 1, 'jmptiamzon changed the application status.', 0, '2019-11-14 06:45:19'),
(269, 0, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:45:25'),
(270, 0, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:45:26'),
(271, 7, 'User ej3fd7bzurrx7oz02er7dr went to feature page.', 1, '2019-11-14 06:45:33'),
(272, 7, 'User ej3fd7bzurrx7oz02er7dr went to about page.', 1, '2019-11-14 06:45:34'),
(273, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:45:35'),
(274, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:45:40'),
(275, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:45:40'),
(276, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:45:45'),
(277, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:46:31'),
(278, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:47:06'),
(279, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:47:33'),
(280, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:47:56'),
(281, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:48:32'),
(282, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:48:50'),
(283, 7, 'User ej3fd7bzurrx7oz02er7dr went to about page.', 1, '2019-11-14 06:49:57'),
(284, 7, 'User ej3fd7bzurrx7oz02er7dr went to feature page.', 1, '2019-11-14 06:49:58'),
(285, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:49:59'),
(286, 7, 'User ej3fd7bzurrx7oz02er7dr went to about page.', 1, '2019-11-14 06:50:00'),
(287, 7, 'User ej3fd7bzurrx7oz02er7dr went to feature page.', 1, '2019-11-14 06:50:01'),
(288, 7, 'User ej3fd7bzurrx7oz02er7dr went to about page.', 1, '2019-11-14 06:54:50'),
(289, 7, 'User ej3fd7bzurrx7oz02er7dr went to feature page.', 1, '2019-11-14 06:54:50'),
(290, 7, 'User ej3fd7bzurrx7oz02er7dr went to assessment page.', 1, '2019-11-14 06:54:51'),
(291, 7, 'User ej3fd7bzurrx7oz02er7dr went to feature page.', 1, '2019-11-14 06:54:52'),
(292, 7, 'User ej3fd7bzurrx7oz02er7dr went to about page.', 1, '2019-11-14 06:54:52'),
(293, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:54:53'),
(294, 7, 'User ej3fd7bzurrx7oz02er7dr went to about page.', 1, '2019-11-14 06:54:54'),
(295, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:54:54'),
(296, 7, 'User ej3fd7bzurrx7oz02er7dr went to home page.', 1, '2019-11-14 06:55:21'),
(297, 7, 'User ej3fd7bzurrx7oz02er7dr went to about page.', 1, '2019-11-14 06:55:26'),
(298, 7, 'User ej3fd7bzurrx7oz02er7dr went to assessment page.', 1, '2019-11-14 06:55:27'),
(299, 1, 'jmptiamzon logged off.', 0, '2019-11-14 08:02:33'),
(300, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-14 08:02:39'),
(301, 1, 'jmptiamzon changed the application status.', 0, '2019-11-14 08:06:56'),
(302, 0, 'User 2pv3zl7rjh47iem3a8zj7d went to home page.', 1, '2019-11-14 08:07:04'),
(303, 9, 'User 2pv3zl7rjh47iem3a8zj7d went to assessment page.', 1, '2019-11-14 08:07:06'),
(304, 9, 'User 2pv3zl7rjh47iem3a8zj7d submitted the initial assessment.', 1, '2019-11-14 08:07:46'),
(305, 9, 'User 2pv3zl7rjh47iem3a8zj7d submitted the mid assessment.', 1, '2019-11-14 08:07:51'),
(306, 9, 'User 2pv3zl7rjh47iem3a8zj7d submitted the mid assessment.', 1, '2019-11-14 08:07:56'),
(307, 0, 'User 4b9ssxnbo8atqv5vocnfu went to home page.', 1, '2019-11-14 08:11:27'),
(308, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:11:28'),
(309, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the initial assessment.', 1, '2019-11-14 08:11:42'),
(310, 8, 'User kf6ifyanxff0wbn24dcvc went to home page.', 1, '2019-11-14 08:11:42'),
(311, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the mid assessment.', 1, '2019-11-14 08:11:44'),
(312, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the mid assessment.', 1, '2019-11-14 08:11:46'),
(313, 8, 'User kf6ifyanxff0wbn24dcvc went to home page.', 1, '2019-11-14 08:13:53'),
(314, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:13:53'),
(315, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the initial assessment.', 1, '2019-11-14 08:14:00'),
(316, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the mid assessment.', 1, '2019-11-14 08:14:03'),
(317, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the mid assessment.', 1, '2019-11-14 08:14:05'),
(318, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:15:16'),
(319, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the initial assessment.', 1, '2019-11-14 08:15:24'),
(320, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the mid assessment.', 1, '2019-11-14 08:15:26'),
(321, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the mid assessment.', 1, '2019-11-14 08:15:29'),
(322, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:16:41'),
(323, 8, 'User kf6ifyanxff0wbn24dcvc went to home page.', 1, '2019-11-14 08:16:47'),
(324, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the initial assessment.', 1, '2019-11-14 08:16:48'),
(325, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the mid assessment.', 1, '2019-11-14 08:16:52'),
(326, 10, 'User 4b9ssxnbo8atqv5vocnfu submitted the mid assessment.', 1, '2019-11-14 08:16:55'),
(327, 8, 'User kf6ifyanxff0wbn24dcvc went to assessment page.', 1, '2019-11-14 08:17:32'),
(328, 8, 'User kf6ifyanxff0wbn24dcvc submitted the initial assessment.', 1, '2019-11-14 08:18:07'),
(329, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:18:09'),
(330, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:18:11'),
(331, 8, 'User kf6ifyanxff0wbn24dcvc went to assessment page.', 1, '2019-11-14 08:19:12'),
(332, 8, 'User kf6ifyanxff0wbn24dcvc submitted the initial assessment.', 1, '2019-11-14 08:19:20'),
(333, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:19:22'),
(334, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:19:23'),
(335, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:19:24'),
(336, 8, 'User kf6ifyanxff0wbn24dcvc went to assessment page.', 1, '2019-11-14 08:20:30'),
(337, 8, 'User kf6ifyanxff0wbn24dcvc submitted the initial assessment.', 1, '2019-11-14 08:20:41'),
(338, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:20:43'),
(339, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:20:43'),
(340, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:20:44'),
(341, 8, 'User kf6ifyanxff0wbn24dcvc submitted the initial assessment.', 1, '2019-11-14 08:22:01'),
(342, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:22:01'),
(343, 8, 'User kf6ifyanxff0wbn24dcvc went to assessment page.', 1, '2019-11-14 08:22:26'),
(344, 8, 'User kf6ifyanxff0wbn24dcvc submitted the initial assessment.', 1, '2019-11-14 08:22:33'),
(345, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:22:35'),
(346, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:22:37'),
(347, 8, 'User kf6ifyanxff0wbn24dcvc went to assessment page.', 1, '2019-11-14 08:23:12'),
(348, 8, 'User kf6ifyanxff0wbn24dcvc submitted the initial assessment.', 1, '2019-11-14 08:23:20'),
(349, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:23:22'),
(350, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:23:24'),
(351, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:23:25'),
(352, 8, 'User kf6ifyanxff0wbn24dcvc went to assessment page.', 1, '2019-11-14 08:24:53'),
(353, 8, 'User kf6ifyanxff0wbn24dcvc submitted the initial assessment.', 1, '2019-11-14 08:25:01'),
(354, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:25:03'),
(355, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:25:04'),
(356, 8, 'User kf6ifyanxff0wbn24dcvc submitted the mid assessment.', 1, '2019-11-14 08:25:05'),
(357, 10, 'User 4b9ssxnbo8atqv5vocnfu went to assessment page.', 1, '2019-11-14 08:26:47'),
(358, 8, 'User kf6ifyanxff0wbn24dcvc went to assessment page.', 1, '2019-11-14 08:26:48'),
(359, 1, 'jmptiamzon logged off.', 0, '2019-11-14 08:34:10'),
(360, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-15 05:50:36'),
(361, 0, 'User wx2vb9iylkq2byx34hew went to home page.', 1, '2019-11-15 07:29:42'),
(362, 1, 'jmptiamzon logged off.', 0, '2019-11-15 11:23:52'),
(363, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-15 11:24:51'),
(364, 0, 'User nw3vyybonb19yx24vmv went to home page.', 1, '2019-11-15 11:25:00'),
(365, 1, 'jmptiamzon updated administrator user with id 2.', 0, '2019-11-15 11:31:39'),
(366, 1, 'jmptiamzon logged off.', 0, '2019-11-15 11:56:55'),
(367, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-15 11:57:38'),
(368, 1, 'jmptiamzon logged off.', 0, '2019-11-15 12:07:39'),
(369, 0, 'User tf56oecct1xhlvo0egdkg went to home page.', 1, '2019-11-15 12:07:52'),
(370, 14, 'User tf56oecct1xhlvo0egdkg went to home page.', 1, '2019-11-15 12:08:18'),
(371, 14, 'User tf56oecct1xhlvo0egdkg went to home page.', 1, '2019-11-15 12:08:53'),
(372, 14, 'User tf56oecct1xhlvo0egdkg went to about page.', 1, '2019-11-15 12:08:54'),
(373, 14, 'User tf56oecct1xhlvo0egdkg went to home page.', 1, '2019-11-15 12:09:27'),
(374, 14, 'User tf56oecct1xhlvo0egdkg went to about page.', 1, '2019-11-15 12:12:30'),
(375, 14, 'User tf56oecct1xhlvo0egdkg went to about page.', 1, '2019-11-15 12:13:11'),
(376, 14, 'User tf56oecct1xhlvo0egdkg went to about page.', 1, '2019-11-15 12:13:19'),
(377, 14, 'User tf56oecct1xhlvo0egdkg went to feature page.', 1, '2019-11-15 12:14:18'),
(378, 14, 'User tf56oecct1xhlvo0egdkg went to assessment page.', 1, '2019-11-15 12:15:04'),
(379, 14, 'User tf56oecct1xhlvo0egdkg submitted the initial assessment.', 1, '2019-11-15 12:15:13'),
(380, 14, 'User tf56oecct1xhlvo0egdkg submitted the mid assessment.', 1, '2019-11-15 12:15:17'),
(381, 14, 'User tf56oecct1xhlvo0egdkg submitted the mid assessment.', 1, '2019-11-15 12:15:21'),
(382, 0, 'User mmyj998wniddz67mk4rf39 went to home page.', 1, '2019-11-15 12:19:43'),
(383, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-15 12:19:49'),
(384, 1, 'jmptiamzon changed the application status.', 0, '2019-11-15 12:19:53'),
(385, 1, 'jmptiamzon changed the application status.', 0, '2019-11-15 12:20:40'),
(386, 1, 'jmptiamzon added a new administrator user.', 0, '2019-11-15 12:32:43'),
(387, 0, 'User 4khiivq5nkh9aynmc61yhm went to assessment page.', 1, '2019-11-15 13:20:12'),
(388, 16, 'User 4khiivq5nkh9aynmc61yhm submitted the initial assessment.', 1, '2019-11-15 13:20:20'),
(389, 16, 'User 4khiivq5nkh9aynmc61yhm submitted the mid assessment.', 1, '2019-11-15 13:20:22'),
(390, 16, 'User 4khiivq5nkh9aynmc61yhm submitted the mid assessment.', 1, '2019-11-15 13:20:26'),
(391, 16, 'User 4khiivq5nkh9aynmc61yhm went to assessment page.', 1, '2019-11-15 13:21:19'),
(392, 1, 'jmptiamzon added a new course.', 0, '2019-11-15 13:27:09'),
(393, 1, 'jmptiamzon updated a course with id 5.', 0, '2019-11-15 13:27:20'),
(394, 1, 'jmptiamzon updated a school data with id 5.', 0, '2019-11-15 13:29:45'),
(395, 1, 'jmptiamzon updated a school data with id 5.', 0, '2019-11-15 13:29:47'),
(396, 1, 'jmptiamzon updated a school data with id 5.', 0, '2019-11-15 13:29:50'),
(397, 1, 'jmptiamzon added a new course.', 0, '2019-11-15 13:40:04'),
(398, 1, 'jmptiamzon added a new question.', 0, '2019-11-15 13:41:01'),
(399, 0, 'User 8o5hfrblsxuog7zbqosets went to home page.', 1, '2019-11-15 13:41:09'),
(400, 17, 'User 8o5hfrblsxuog7zbqosets went to assessment page.', 1, '2019-11-15 13:41:10'),
(401, 17, 'User 8o5hfrblsxuog7zbqosets submitted the initial assessment.', 1, '2019-11-15 13:41:23'),
(402, 17, 'User 8o5hfrblsxuog7zbqosets submitted the mid assessment.', 1, '2019-11-15 13:41:26'),
(403, 17, 'User 8o5hfrblsxuog7zbqosets went to assessment page.', 1, '2019-11-15 13:41:47'),
(404, 17, 'User 8o5hfrblsxuog7zbqosets went to assessment page.', 1, '2019-11-15 13:43:33'),
(405, 17, 'User 8o5hfrblsxuog7zbqosets went to assessment page.', 1, '2019-11-15 13:44:56'),
(406, 17, 'User 8o5hfrblsxuog7zbqosets went to assessment page.', 1, '2019-11-15 13:48:03'),
(407, 17, 'User 8o5hfrblsxuog7zbqosets submitted the initial assessment.', 1, '2019-11-15 13:48:11'),
(408, 17, 'User 8o5hfrblsxuog7zbqosets submitted the mid assessment.', 1, '2019-11-15 13:48:14'),
(409, 0, 'User wvjp12advcfgj3bz6kr78 went to assessment page.', 1, '2019-11-15 13:52:20'),
(410, 18, 'User wvjp12advcfgj3bz6kr78 went to assessment page.', 1, '2019-11-15 13:52:29'),
(411, 18, 'User wvjp12advcfgj3bz6kr78 submitted the initial assessment.', 1, '2019-11-15 13:52:41'),
(412, 18, 'User wvjp12advcfgj3bz6kr78 submitted the mid assessment.', 1, '2019-11-15 13:52:44'),
(413, 18, 'User wvjp12advcfgj3bz6kr78 submitted the mid assessment.', 1, '2019-11-15 13:52:48'),
(414, 18, 'User wvjp12advcfgj3bz6kr78 went to assessment page.', 1, '2019-11-15 13:53:36'),
(415, 18, 'User wvjp12advcfgj3bz6kr78 went to assessment page.', 1, '2019-11-15 13:56:59'),
(416, 1, 'jmptiamzon logged off.', 0, '2019-11-15 13:57:15'),
(417, 18, 'User wvjp12advcfgj3bz6kr78 went to assessment page.', 1, '2019-11-15 14:02:46'),
(418, 18, 'User wvjp12advcfgj3bz6kr78 went to assessment page.', 1, '2019-11-15 14:02:52'),
(419, 18, 'User wvjp12advcfgj3bz6kr78 submitted the initial assessment.', 1, '2019-11-15 14:03:11'),
(420, 18, 'User wvjp12advcfgj3bz6kr78 submitted the mid assessment.', 1, '2019-11-15 14:03:12'),
(421, 18, 'User wvjp12advcfgj3bz6kr78 went to assessment page.', 1, '2019-11-15 14:05:22'),
(422, 1, 'jmptiamzon successfully logged in.', 0, '2019-11-15 14:19:00'),
(423, 1, 'jmptiamzon created a database backup.', 0, '2019-11-15 14:48:43'),
(424, 1, 'jmptiamzon created a database backup.', 0, '2019-11-15 14:49:53'),
(425, 1, 'jmptiamzon created a database backup.', 0, '2019-11-15 14:52:46'),
(426, 1, 'jmptiamzon updated own account.', 0, '2019-11-16 03:02:54'),
(427, 1, 'jptiam logged off.', 0, '2019-11-16 03:29:08'),
(428, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:29:18'),
(429, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:29:42'),
(430, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:34:32'),
(431, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:34:42'),
(432, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:35:27'),
(433, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:35:50'),
(434, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:36:31'),
(435, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:36:50'),
(436, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:37:17'),
(437, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:37:28'),
(438, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:37:45'),
(439, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:40:39'),
(440, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:41:01'),
(441, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:43:24'),
(442, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 03:43:28'),
(443, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:44:22'),
(444, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:45:42'),
(445, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:46:42'),
(446, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 03:46:44'),
(447, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:47:31'),
(448, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:48:27'),
(449, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 03:48:30'),
(450, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:52:46'),
(451, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:53:39'),
(452, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:53:46'),
(453, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 03:53:48'),
(454, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:54:25'),
(455, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:54:32'),
(456, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 03:54:33'),
(457, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:56:18'),
(458, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:56:28'),
(459, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 03:56:31'),
(460, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 03:57:15'),
(461, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 03:57:23'),
(462, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 03:57:24'),
(463, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:03:37'),
(464, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:04:55'),
(465, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:05:02'),
(466, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:05:03'),
(467, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:08:23'),
(468, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:09:42'),
(469, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:09:48'),
(470, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:09:51'),
(471, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:10:18'),
(472, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:10:27'),
(473, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:10:28'),
(474, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:11:32'),
(475, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:11:40'),
(476, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:11:44'),
(477, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:12:08'),
(478, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:13:53'),
(479, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:13:59'),
(480, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:14:01'),
(481, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:19:23'),
(482, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:19:29'),
(483, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:19:30'),
(484, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:19:55'),
(485, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:20:05'),
(486, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:20:07'),
(487, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:23:19'),
(488, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:23:39'),
(489, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:23:41'),
(490, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:24:18'),
(491, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the initial assessment.', 1, '2019-11-16 04:24:30'),
(492, 0, 'User lmr2p3vppzmt8ntbkbp7rd submitted the mid assessment.', 1, '2019-11-16 04:24:31'),
(493, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:24:41'),
(494, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:26:28'),
(495, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to assessment page.', 1, '2019-11-16 04:26:53'),
(496, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to home page.', 1, '2019-11-16 04:27:18'),
(497, 0, 'User lmr2p3vppzmt8ntbkbp7rd went to home page.', 1, '2019-11-16 04:27:34'),
(498, 1, 'jptiam successfully logged in.', 0, '2019-11-18 06:19:05'),
(499, 1, 'jptiam added a new administrator user.', 0, '2019-11-18 07:56:56'),
(500, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:30:38'),
(501, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:30:41'),
(502, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:30:48'),
(503, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:30:52'),
(504, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:33:44'),
(505, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:35:12'),
(506, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:37:20'),
(507, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:38:05'),
(508, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:38:25'),
(509, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:38:51'),
(510, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:39:15'),
(511, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:39:59'),
(512, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:40:02'),
(513, 1, 'jptiam updated an area with id 1.', 0, '2019-11-18 08:40:05'),
(514, 1, 'jptiam added a new school data.', 0, '2019-11-18 09:24:53'),
(515, 1, 'jptiam updated a school data with id 5.', 0, '2019-11-18 09:25:12'),
(516, 1, 'jptiam added a new area.', 0, '2019-11-18 09:38:27'),
(517, 1, 'jptiam updated a school data with id 6.', 0, '2019-11-18 09:38:44'),
(518, 1, 'jptiam logged off.', 0, '2019-11-18 09:48:57'),
(519, 0, 'User 4ieql4ctnykhx048nui2t7 went to home page.', 1, '2019-11-18 09:49:05'),
(520, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 09:49:14'),
(521, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:26:30'),
(522, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:27:46'),
(523, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:35:27'),
(524, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:37:30'),
(525, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:38:32'),
(526, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:42:01'),
(527, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:42:40'),
(528, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:46:21'),
(529, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:47:34'),
(530, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:47:54'),
(531, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:50:37'),
(532, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:52:05'),
(533, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:52:24'),
(534, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:53:21'),
(535, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 10:53:41'),
(536, 20, 'User 4ieql4ctnykhx048nui2t7 went to home page.', 1, '2019-11-18 10:53:49'),
(537, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:53:50'),
(538, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 10:54:26'),
(539, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:54:36'),
(540, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 10:56:32'),
(541, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:01:01'),
(542, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:09:26'),
(543, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 11:09:40'),
(544, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:09:58'),
(545, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 11:12:04'),
(546, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:12:38'),
(547, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 11:13:24'),
(548, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:14:37'),
(549, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 11:15:10'),
(550, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:16:17'),
(551, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 11:16:49'),
(552, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:18:50'),
(553, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:19:36'),
(554, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 11:19:50'),
(555, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the mid assessment.', 1, '2019-11-18 11:19:52'),
(556, 20, 'User 4ieql4ctnykhx048nui2t7 went to assessment page.', 1, '2019-11-18 11:22:39'),
(557, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the initial assessment.', 1, '2019-11-18 11:23:18'),
(558, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the mid assessment.', 1, '2019-11-18 11:23:21'),
(559, 20, 'User 4ieql4ctnykhx048nui2t7 submitted the mid assessment.', 1, '2019-11-18 11:23:22'),
(560, 1, 'jptiam successfully logged in.', 0, '2019-11-18 11:26:26'),
(561, 1, 'jptiam logged off.', 0, '2019-11-18 11:28:16'),
(562, 1, 'jptiam successfully logged in.', 0, '2019-11-18 12:12:04'),
(563, 1, 'jptiam logged off.', 0, '2019-11-18 12:19:32'),
(564, 1, 'jptiam successfully logged in.', 0, '2019-11-18 12:28:30'),
(565, 1, 'jptiam logged off.', 0, '2019-11-18 12:29:18');

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
(44, 2, 1, 1, '2019-11-16 03:28:00', '0000-00-00 00:00:00'),
(47, 1, 1, 1, '2019-11-18 12:19:18', '0000-00-00 00:00:00'),
(48, 1, 2, 1, '2019-11-18 12:19:18', '0000-00-00 00:00:00');

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
(3, 'Test', 1, '5', '2019-10-30 11:19:09', '0000-00-00 00:00:00'),
(4, 'I\'m interested in Math and Sciences.', 1, '1,2,7', '2019-11-15 13:41:01', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblschool`
--

CREATE TABLE `tblschool` (
  `id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
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

INSERT INTO `tblschool` (`id`, `area_id`, `school_name`, `min_tuition`, `max_tuition`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'FEU Institute of Technology', 500000, 1000000, 1, '2019-10-09 09:17:56', '2019-11-18 08:59:47'),
(2, 1, 'Centro Escolar University', 500000, 1000000, 1, '2019-10-09 09:49:48', '2019-11-18 08:59:53'),
(3, 1, 'FEU Manila', 500000, 1000000, 1, '2019-10-12 01:35:50', '2019-11-18 08:59:56'),
(4, 1, 'San Beda University', 600000, 1000000, 1, '2019-10-22 10:15:00', '2019-11-18 08:59:58'),
(5, 1, 'Polytechnic University of the Philippines', 0, 20000, 1, '2019-10-27 07:39:21', '2019-11-18 09:25:11'),
(6, 2, 'Pamantasan ng Lungsod ng Marikina', 0, 20000, 1, '2019-11-18 09:24:53', '2019-11-18 09:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `tblsurvey`
--

CREATE TABLE `tblsurvey` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsurvey`
--

INSERT INTO `tblsurvey` (`id`, `user_id`, `school_name`, `course_name`, `created_at`) VALUES
(1, 1, 'FEU Institute of Technology', 'Computer Science', '2019-11-13 10:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_course` varchar(255) DEFAULT NULL,
  `area_id` int(11) NOT NULL,
  `annual_income` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `visitor_id`, `full_name`, `gender`, `age`, `email`, `first_course`, `area_id`, `annual_income`, `created_at`) VALUES
(1, 1, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-12 06:59:41'),
(2, 3, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 06:22:06'),
(3, 4, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 06:25:12'),
(4, 5, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 06:26:50'),
(5, 6, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 06:32:42'),
(6, 9, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 08:07:56'),
(7, 10, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 08:11:47'),
(8, 10, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 08:14:05'),
(9, 10, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 08:15:29'),
(10, 10, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 08:16:54'),
(11, 8, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 08:18:11'),
(12, 8, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 0, 0, '2019-11-14 08:19:24'),
(13, 8, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 1, 0, '2019-11-14 08:20:45'),
(14, 8, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 1, 0, '2019-11-14 08:22:37'),
(15, 8, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 1, 0, '2019-11-14 08:23:24'),
(16, 8, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 1, 0, '2019-11-14 08:25:05'),
(17, 14, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 1, 0, '2019-11-15 12:15:20'),
(18, 16, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 1, 0, '2019-11-15 13:20:25'),
(19, 17, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 1, 0, '2019-11-15 13:48:22'),
(20, 18, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', NULL, 1, 0, '2019-11-15 13:52:48'),
(21, 20, 'John Moses Tiamzon', 'Male', 21, 'jmptiamzon@gmail.com', 'sadksaklj', 1, 1000000, '2019-11-18 11:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitors`
--

CREATE TABLE `tblvisitors` (
  `id` int(11) NOT NULL,
  `user_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvisitors`
--

INSERT INTO `tblvisitors` (`id`, `user_token`, `created_at`) VALUES
(1, 'j2m9yjkffqk8jco90yx37', '2019-11-12 06:59:06'),
(2, 'cmsaj5y3pyifn3oq74tyb', '2019-11-13 05:13:38'),
(3, 'gyocoem83548z1s5qap3hu', '2019-11-14 02:23:50'),
(4, 'acdx47pyfjduwqy9dropli', '2019-11-14 06:24:38'),
(5, 'm9xcfq9vj29pnro56k68f', '2019-11-14 06:26:32'),
(6, '257v4x8acoyoushz6nc79j', '2019-11-14 06:27:35'),
(7, 'ej3fd7bzurrx7oz02er7dr', '2019-11-14 06:45:25'),
(8, 'kf6ifyanxff0wbn24dcvc', '2019-11-14 08:05:00'),
(9, '2pv3zl7rjh47iem3a8zj7d', '2019-11-14 08:07:04'),
(10, '4b9ssxnbo8atqv5vocnfu', '2019-11-14 08:11:27'),
(11, 'wx2vb9iylkq2byx34hew', '2019-11-15 07:29:42'),
(12, 'x1xb1eyoifjchsmk6rm1zv', '2019-11-15 11:24:00'),
(13, 'nw3vyybonb19yx24vmv', '2019-11-15 11:25:00'),
(14, 'tf56oecct1xhlvo0egdkg', '2019-11-15 12:07:52'),
(15, 'sc4ydl9q8y956etf5zik1q', '2019-11-15 12:20:07'),
(16, '4khiivq5nkh9aynmc61yhm', '2019-11-15 13:20:12'),
(17, '8o5hfrblsxuog7zbqosets', '2019-11-15 13:41:09'),
(18, 'wvjp12advcfgj3bz6kr78', '2019-11-15 13:52:20'),
(19, 'lmr2p3vppzmt8ntbkbp7rd', '2019-11-16 03:29:15'),
(20, '4ieql4ctnykhx048nui2t7', '2019-11-18 09:49:05');

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
-- Indexes for table `tblarea`
--
ALTER TABLE `tblarea`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcourserank`
--
ALTER TABLE `tblcourserank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldbbackup`
--
ALTER TABLE `tbldbbackup`
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
-- Indexes for table `tblsurvey`
--
ALTER TABLE `tblsurvey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvisitors`
--
ALTER TABLE `tblvisitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblappstatus`
--
ALTER TABLE `tblappstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblarea`
--
ALTER TABLE `tblarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcourse`
--
ALTER TABLE `tblcourse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcourserank`
--
ALTER TABLE `tblcourserank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbldbbackup`
--
ALTER TABLE `tbldbbackup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbllogs`
--
ALTER TABLE `tbllogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT for table `tblltree`
--
ALTER TABLE `tblltree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tblquestions`
--
ALTER TABLE `tblquestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblschool`
--
ALTER TABLE `tblschool`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblsurvey`
--
ALTER TABLE `tblsurvey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblvisitors`
--
ALTER TABLE `tblvisitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
