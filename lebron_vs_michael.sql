-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 04, 2025 at 08:00 AM
-- Server version: 5.7.36
-- PHP Version: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lebron_vs_michael`
--Created by: Javan B.A. Smith
--

-- --------------------------------------------------------

--
-- Table structure for table `accomplishments`
--

CREATE TABLE `accomplishments` (
  `PlayerID` int(11) NOT NULL,
  `Finals_Appearance` int(11) DEFAULT NULL,
  `Championships` int(11) DEFAULT NULL,
  `Finals_MVP` int(11) DEFAULT NULL,
  `RegularSeasonMVP` int(11) DEFAULT NULL,
  `AllNBA` int(11) DEFAULT NULL,
  `AllStar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accomplishments`
--

INSERT INTO `accomplishments` (`PlayerID`, `Finals_Appearance`, `Championships`, `Finals_MVP`, `RegularSeasonMVP`, `AllNBA`, `AllStar`) VALUES
(1, 10, 4, 4, 4, 20, 20),
(2, 6, 6, 6, 5, 11, 14);

-- --------------------------------------------------------

--
-- Table structure for table `playerprofile`
--

CREATE TABLE `playerprofile` (
  `PlayerID` int(11) NOT NULL,
  `Player_Name` varchar(100) NOT NULL,
  `Player_Birthdate` date NOT NULL,
  `Player_Height_meters` decimal(5,2) NOT NULL,
  `Player_Weight_lbs` decimal(5,2) NOT NULL,
  `Player_Position` varchar(100) NOT NULL,
  `Player_YearsPro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playerprofile`
--

INSERT INTO `playerprofile` (`PlayerID`, `Player_Name`, `Player_Birthdate`, `Player_Height_meters`, `Player_Weight_lbs`, `Player_Position`, `Player_YearsPro`) VALUES
(1, 'Lebron James', '1984-12-30', '2.06', '250.00', 'Small Forward', 22),
(2, 'Michael Jordan', '1963-02-17', '1.98', '198.00', 'Shooting Guard', 15);

-- --------------------------------------------------------

--
-- Table structure for table `regularseasontotals`
--

CREATE TABLE `regularseasontotals` (
  `PlayerID` int(11) NOT NULL,
  `TotalPoints` int(11) NOT NULL,
  `TotalAssists` int(11) NOT NULL,
  `TotalRebounds` int(11) NOT NULL,
  `TotalSteals` int(11) NOT NULL,
  `TotalBlocks` int(11) NOT NULL,
  `TotalTurnovers` int(11) NOT NULL,
  `FieldGoalsMade` int(11) NOT NULL,
  `FieldGoalsAttempted` int(11) NOT NULL,
  `ThreePointersMade` int(11) NOT NULL,
  `ThreePointersAttempted` int(11) NOT NULL,
  `FreeThrowsMade` int(11) NOT NULL,
  `FreeThrowsAttempted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regularseasontotals`
--

INSERT INTO `regularseasontotals` (`PlayerID`, `TotalPoints`, `TotalAssists`, `TotalRebounds`, `TotalSteals`, `TotalBlocks`, `TotalTurnovers`, `FieldGoalsMade`, `FieldGoalsAttempted`, `ThreePointersMade`, `ThreePointersAttempted`, `FreeThrowsMade`, `FreeThrowsAttempted`) VALUES
(1, 41192, 11276, 11412, 2298, 1128, 5325, 15112, 29861, 2476, 7099, 8492, 11537),
(2, 32292, 5633, 6672, 2514, 893, 2924, 12192, 24537, 581, 1778, 7327, 8772);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomplishments`
--
ALTER TABLE `accomplishments`
  ADD KEY `PlayerID` (`PlayerID`);

--
-- Indexes for table `playerprofile`
--
ALTER TABLE `playerprofile`
  ADD PRIMARY KEY (`PlayerID`);

--
-- Indexes for table `regularseasontotals`
--
ALTER TABLE `regularseasontotals`
  ADD KEY `PlayerID` (`PlayerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accomplishments`
--
ALTER TABLE `accomplishments`
  MODIFY `PlayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `playerprofile`
--
ALTER TABLE `playerprofile`
  MODIFY `PlayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `regularseasontotals`
--
ALTER TABLE `regularseasontotals`
  MODIFY `PlayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accomplishments`
--
ALTER TABLE `accomplishments`
  ADD CONSTRAINT `accomplishments_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `playerprofile` (`PlayerID`);

--
-- Constraints for table `regularseasontotals`
--
ALTER TABLE `regularseasontotals`
  ADD CONSTRAINT `regularseasontotals_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `playerprofile` (`PlayerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
