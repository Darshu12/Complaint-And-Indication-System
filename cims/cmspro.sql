-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2024 at 02:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmspro`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `AdminName` varchar(200) NOT NULL,
  `EmailId` varchar(150) NOT NULL,
  `ContactNumber` bigint(12) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `AdminName`, `EmailId`, `ContactNumber`, `password`, `updationDate`) VALUES
(1, 'admin', 'Admin', 'admin@gmail.com', 1234567890, 'Darshita1212', '18-10-2016 04:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'E-commerce', 'E-commerce', '2020-06-21 07:06:04', '2020-06-27 18:56:17'),
(2, 'Other', 'Other', '2020-06-22 18:30:00', '2020-06-27 18:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `remarkDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(11, 3, 'in process', 'colsed', '2024-03-29 08:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaintNumber` int(11) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`complaintNumber`, `studentId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 2, 1, 'Online Shopping', ' Complaint', 'Delhi', 'Test Complaint', 'This is test complaint', '', '2020-06-28 13:20:55', 'closed', '2020-06-28 13:27:41'),
(2, 4, 1, 'Online Shopping', ' Complaint', 'Punjab', '1', 'axsafadwtrewqwertytgfdsa', '', '2024-03-29 04:48:58', NULL, NULL),
(3, 4, 1, 'Select Subcategory', '', 'Delhi', '2', '', '', '2024-03-29 04:49:21', 'in process', '2024-03-29 08:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `contactdata`
--

CREATE TABLE `contactdata` (
  `id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `attachement` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactdata`
--

INSERT INTO `contactdata` (`id`, `firstname`, `lastname`, `phone`, `email`, `message`, `attachement`) VALUES
(12, 'darshi', 'trivedi', '9586615214  ', 'yojoshi640@gmail.com', 'hy', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `FacultyName` varchar(20) DEFAULT NULL,
  `Department` varchar(150) DEFAULT NULL,
  `EmailId` varchar(150) DEFAULT NULL,
  `ContactNumber` bigint(12) DEFAULT NULL,
  `UserName` varchar(12) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsActive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `FacultyName`, `Department`, `EmailId`, `ContactNumber`, `UserName`, `Password`, `RegDate`, `LastUpdationDate`, `IsActive`) VALUES
(3, 'darshita', 'dcs', 'trivedidarshi1212@gmail.com', 9016405530, 'darshita', 'darshita123', '2024-03-27 05:28:41', '2024-03-27 05:30:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `facultyremark`
--

CREATE TABLE `facultyremark` (
  `id` int(11) NOT NULL,
  `ComplainNumber` bigint(12) DEFAULT NULL,
  `ComplainStatus` varchar(20) DEFAULT NULL,
  `ComplainRemark` mediumtext DEFAULT NULL,
  `RemarkBy` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `IndicationNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `facultyremark`
--

INSERT INTO `facultyremark` (`id`, `ComplainNumber`, `ComplainStatus`, `ComplainRemark`, `RemarkBy`, `PostingDate`, `IndicationNumber`) VALUES
(1, 1, 'closed', 'Complaint closed.', 2, '2020-06-28 13:27:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forwardhistory`
--

CREATE TABLE `forwardhistory` (
  `id` int(11) NOT NULL,
  `ComplaintNumber` bigint(12) DEFAULT NULL,
  `ForwardFrom` int(6) DEFAULT NULL,
  `ForwardTo` int(6) DEFAULT NULL,
  `ForwadDate` timestamp NULL DEFAULT current_timestamp(),
  `IndicationNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `forwardhistory`
--

INSERT INTO `forwardhistory` (`id`, `ComplaintNumber`, `ForwardFrom`, `ForwardTo`, `ForwadDate`, `IndicationNumber`) VALUES
(1, 1, 1, 2, '2020-06-28 13:22:58', 0),
(2, 2, 1, 3, '2024-03-29 04:51:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `indication`
--

CREATE TABLE `indication` (
  `IndicationNumber` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `subcategory` varchar(50) NOT NULL,
  `IndicationType` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `noc` varchar(50) NOT NULL,
  `IndicationDetails` mediumtext NOT NULL,
  `IndicationFile` varchar(250) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(50) NOT NULL,
  `lastupdationDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicationremark`
--

CREATE TABLE `indicationremark` (
  `IndicationNumber` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `remark` mediumint(9) NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `stateDescription` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(1, 'Delhi', 'India Capital', '2020-06-27 19:18:02', NULL),
(2, 'Punjab', 'Punjab', '2020-06-27 19:18:14', NULL),
(3, 'Haryana', 'HR', '2020-06-27 19:18:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `studentImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `eid` int(10) NOT NULL,
  `course` varchar(20) NOT NULL,
  `semester` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `studentImage`, `regDate`, `updationDate`, `status`, `eid`, `course`, `semester`) VALUES
(2, 'Test user', 'testuser@gmail.com', 'Test@123', 1234567899, 'New Delhi', 'Delhi', 'India', 110091, 'Test@123', '2020-06-28 13:19:15', NULL, 1, 0, '', 0),
(4, 'yogesh', 'yojoshi640@gmail.com', 'yogi', 9016405530, NULL, NULL, NULL, NULL, NULL, '2024-03-29 04:47:45', NULL, 1, 1022245, 'B.SC(DATA SCINCE)', 4),
(7, 'shub', 'shubham.patel@buckbox.tech', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:32:31', NULL, 1, 789654, 'B.SC(IT)', 1),
(8, 'shub', 'shubham.patel@buckbox.tech', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:33:39', NULL, 1, 789654, 'B.SC(IT)', 1),
(9, 'shub', 'shubham.patel@buckbox.tech', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:33:42', NULL, 1, 789654, 'B.SC(IT)', 1),
(10, 'shub', 'shubham.patel@buckbox.tech', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:35:42', NULL, 1, 789654, 'B.SC(IT)', 1),
(11, 'shub', 'shubham.patel@buckbox.tech', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:35:46', NULL, 1, 789654, 'B.SC(IT)', 1),
(12, 'shub', 'shubham.patel@buckbox.tech', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:36:04', NULL, 1, 789654, 'B.SC(IT)', 1),
(13, 'shub', 'shubham.patel@buckbox.tech', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:36:59', NULL, 1, 789654, 'B.SC(IT)', 1),
(14, 'yogesh', 'yop90934@yopmail.com', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:37:33', NULL, 1, 789, 'B.SC(CA&IT)', 1),
(15, 'yogesh', 'yop90934@yopmail.com', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:38:01', NULL, 1, 789, 'B.SC(CA&IT)', 1),
(16, 'yogesh', 'yop90934@yopmail.com', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:41:22', NULL, 1, 789, 'B.SC(CA&IT)', 1),
(17, 'yogesh', 'yop90934@yopmail.com', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:41:24', NULL, 1, 789, 'B.SC(CA&IT)', 1),
(18, 'yogesh', 'yop90934@yopmail.com', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:41:24', NULL, 1, 789, 'B.SC(CA&IT)', 1),
(19, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:18', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(20, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:44', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(21, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:45', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(22, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:46', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(23, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:46', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(24, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:46', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(25, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:46', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(26, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:46', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(27, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:47', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(28, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:47:47', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(29, 'shub', 'yop0394@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:48:49', NULL, 1, 789654, 'B.SC(CA&IT)', 1),
(30, 'shub', 'yop3131@yopmail.com', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 10:57:11', NULL, 1, 789654, 'MSC(IT)', 2),
(31, 'darshita', 'yop3232@yopmail.com', '123', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 11:00:31', NULL, 1, 789654, 'B.SC(DATA SCINCE)', 1),
(32, 'shub', 'yop5555@yopmail.com', '1234', 3645697865, NULL, NULL, NULL, NULL, NULL, '2024-03-29 11:08:49', NULL, 1, 789654, 'B.SC(DATA SCINCE)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `studentlog`
--

CREATE TABLE `studentlog` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `studentname` varchar(20) NOT NULL,
  `studentip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `studentlog`
--

INSERT INTO `studentlog` (`id`, `sid`, `studentname`, `studentip`, `loginTime`, `logout`, `status`) VALUES
(22, 3, 'yojoshi640@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-28 09:54:28', '', 1),
(23, 3, 'yojoshi640@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-28 09:57:33', '28-03-2024 03:32:41 PM', 1),
(24, 3, 'yojoshi640@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-28 10:02:48', '28-03-2024 03:32:50 PM', 1),
(25, 4, 'yojoshi640@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-29 04:48:20', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Online Shopping', '2020-03-28 07:11:07', '2020-06-27 18:56:39'),
(2, 1, 'E-wllaet', '2020-03-28 07:11:20', '2020-06-27 18:56:44'),
(3, 2, 'other', '2020-06-24 07:06:44', '2020-06-24 07:21:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `contactdata`
--
ALTER TABLE `contactdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facultyremark`
--
ALTER TABLE `facultyremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forwardhistory`
--
ALTER TABLE `forwardhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userEmail` (`userEmail`);

--
-- Indexes for table `studentlog`
--
ALTER TABLE `studentlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contactdata`
--
ALTER TABLE `contactdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `facultyremark`
--
ALTER TABLE `facultyremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forwardhistory`
--
ALTER TABLE `forwardhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `studentlog`
--
ALTER TABLE `studentlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
