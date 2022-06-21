-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2022 at 06:41 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meetings`
--

-- --------------------------------------------------------

--
-- Table structure for table `coding_teams`
--

CREATE TABLE `coding_teams` (
  `team_code` int(11) NOT NULL,
  `team_name` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `coding_teams`
--

INSERT INTO `coding_teams` (`team_code`, `team_name`) VALUES
(1, 'Ui Team'),
(2, 'Ui Team'),
(3, 'Mobile Team'),
(5, 'React Team');

-- --------------------------------------------------------

--
-- Table structure for table `team_meetings`
--

CREATE TABLE `team_meetings` (
  `meeting_code` int(11) NOT NULL,
  `team_code` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `about_meeting` varchar(500) COLLATE utf8_bin NOT NULL,
  `meeting_room` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `team_meetings`
--

INSERT INTO `team_meetings` (`meeting_code`, `team_code`, `start_time`, `end_time`, `about_meeting`, `meeting_room`) VALUES
(1, 1, '2022-06-01 00:00:00', '2022-06-01 09:00:00', 'chat and have coffee', 'coffee room'),
(2, 2, '2022-06-02 05:00:00', '2022-06-02 12:26:00', 'eat cake', 'Tea room'),
(3, 1, '2022-06-01 00:00:00', '2022-06-01 09:00:00', 'chat and have coffee', 'coffee room'),
(4, 2, '2022-06-02 05:00:00', '2022-06-02 12:26:00', 'eat cake', 'Tea room'),
(5, 1, '2022-05-31 21:00:00', '2022-06-01 06:00:00', 'chat and have coffee', 'coffee room');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coding_teams`
--
ALTER TABLE `coding_teams`
  ADD PRIMARY KEY (`team_code`);

--
-- Indexes for table `team_meetings`
--
ALTER TABLE `team_meetings`
  ADD PRIMARY KEY (`meeting_code`),
  ADD KEY `team_code` (`team_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coding_teams`
--
ALTER TABLE `coding_teams`
  MODIFY `team_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `team_meetings`
--
ALTER TABLE `team_meetings`
  MODIFY `meeting_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_meetings`
--
ALTER TABLE `team_meetings`
  ADD CONSTRAINT `meeting _to_team_code` FOREIGN KEY (`team_code`) REFERENCES `coding_teams` (`team_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
