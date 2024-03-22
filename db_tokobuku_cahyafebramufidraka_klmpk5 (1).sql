-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 11:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokobuku_cahyafebramufidraka_klmpk5`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `Name` varchar(25) NOT NULL,
  `IDAuthor` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `URL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `year` int(5) NOT NULL,
  `tiltle` varchar(15) NOT NULL,
  `price` text NOT NULL,
  `ISBN` int(15) NOT NULL,
  `IDAuthor` int(11) NOT NULL,
  `IDPublisher` int(11) NOT NULL,
  `IDShop` int(11) NOT NULL,
  `IDWarehouse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Name` varchar(25) NOT NULL,
  `IDCustomer` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `Name` varchar(25) NOT NULL,
  `IDPublisher` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` int(18) NOT NULL,
  `URL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopping-basket`
--

CREATE TABLE `shopping-basket` (
  `basketID` int(11) NOT NULL,
  `IDCustomer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `address` varchar(50) NOT NULL,
  `phone` int(18) NOT NULL,
  `code` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`IDAuthor`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `IDShop` (`IDShop`),
  ADD KEY `IDWarehouse` (`IDWarehouse`),
  ADD KEY `IDAuthor` (`IDAuthor`),
  ADD KEY `IDPublisher` (`IDPublisher`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`IDCustomer`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`IDPublisher`);

--
-- Indexes for table `shopping-basket`
--
ALTER TABLE `shopping-basket`
  ADD PRIMARY KEY (`basketID`),
  ADD KEY `IDCustomer` (`IDCustomer`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `IDAuthor` FOREIGN KEY (`IDAuthor`) REFERENCES `author` (`IDAuthor`),
  ADD CONSTRAINT `IDPublisher` FOREIGN KEY (`IDPublisher`) REFERENCES `publisher` (`IDPublisher`),
  ADD CONSTRAINT `IDShop` FOREIGN KEY (`IDShop`) REFERENCES `shopping-basket` (`basketID`),
  ADD CONSTRAINT `IDWarehouse` FOREIGN KEY (`IDWarehouse`) REFERENCES `warehouse` (`code`);

--
-- Constraints for table `shopping-basket`
--
ALTER TABLE `shopping-basket`
  ADD CONSTRAINT `IDCustomer` FOREIGN KEY (`IDCustomer`) REFERENCES `customer` (`IDCustomer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
