-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 10:45 AM
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
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(3) NOT NULL,
  `car_name` varchar(30) NOT NULL,
  `brand_id` int(3) NOT NULL,
  `type_id` int(3) NOT NULL,
  `color` varchar(20) NOT NULL,
  `model` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `car_name`, `brand_id`, `type_id`, `color`, `model`, `description`) VALUES
(1, 'Porsche Boxster', 6, 4, 'Red', '2017', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent venenatis in odio quis cursus. Pel'),
(2, 'Audi A5', 1, 4, 'Red', '2017', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent venenatis in odio quis cursus. Pel'),
(3, 'Mercedes-Benz CLS', 4, 4, 'Blue', '2019', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent venenatis in odio quis cursus. Pel'),
(4, 'Audi A7', 1, 6, 'Blue', '2019', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent venenatis in odio quis cursus. Pel');

-- --------------------------------------------------------

--
-- Table structure for table `car_brands`
--

CREATE TABLE `car_brands` (
  `brand_id` int(3) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `brand_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `car_brands`
--

INSERT INTO `car_brands` (`brand_id`, `brand_name`, `brand_image`) VALUES
(1, 'Audi', 'Audi-A4-Avant-1.jpg'),
(2, 'BMW', 'bmw-3-series-sedan.jpg'),
(3, 'Lexus', '2016-Lexus-RX-350-BM-01.jpg'),
(4, 'Mercedes Benz', 'Mercedes-C-Class-Estate-1.jpg'),
(5, 'MINI', '2016-MINI-Cooper-S-Clubman-ALL4.jpg'),
(6, 'Porsche', 'P14_0596_a4_rgb-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `car_types`
--

CREATE TABLE `car_types` (
  `type_id` int(3) NOT NULL,
  `type_label` varchar(50) NOT NULL,
  `type_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `car_types`
--

INSERT INTO `car_types` (`type_id`, `type_label`, `type_description`) VALUES
(1, 'Sedan', 'A sedan has four doors and a traditional trunk.'),
(4, 'Coupe', 'A coupe has historically been considered a two-door car with a trunk and a solid roof.'),
(6, 'HATCHBACK', 'Traditionally, the term \"hatchback\" has meant a compact or subcompact sedan with a squared-off roof and a rear flip-up hatch door that provides access to the vehicle\'s cargo area instead of a conventional trunk.');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(10) NOT NULL,
  `client_email` varchar(100) DEFAULT NULL,
  `full_name` varchar(30) NOT NULL,
  `client_phone` varchar(20) NOT NULL,
  `Aadhar number` int(12) NOT NULL,
  `Driving license` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `client_email`, `full_name`, `client_phone`, `Aadhar number`, `Driving license`, `email`) VALUES
(6, NULL, 'PAVANKUMAR', '8495811023', 0, 0, ''),
(7, NULL, 'Pava', '0123456789', 0, 0, ''),
(8, 'diarohi83@gmail.com', 'Pavankumar', '08495811023', 0, 0, ''),
(9, 'dirohi83@gmail.com', 'Pavan', '08495811024', 0, 0, ''),
(10, 'praveenohi83@gmail.com', 'Praveern', '08495811054', 0, 0, ''),
(11, 'praveenohi83@gmail.com', 'Praveern', '08495811054', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `city_check` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
    IF NEW.city != 'Bengaluru' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'City has to be Bengaluru, since currently the rental services are only available in Bengaluru';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(10) NOT NULL,
  `client_id` int(10) NOT NULL,
  `car_id` int(3) NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `pickup_location` varchar(50) NOT NULL,
  `return_location` varchar(50) NOT NULL,
  `canceled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `client_id`, `car_id`, `pickup_date`, `return_date`, `pickup_location`, `return_location`, `canceled`) VALUES
(6, 6, 3, '2024-10-21', '2024-10-23', 'benglore', 'Mysore', 0),
(7, 7, 1, '2024-11-07', '2024-11-11', 'benglore', 'marathalli', 0),
(8, 8, 1, '2024-11-15', '2024-11-16', 'benglore', 'bidar', 0),
(9, 9, 3, '2024-11-16', '2024-11-17', 'benglore', 'bidar', 0),
(10, 10, 2, '2024-11-15', '2024-11-16', 'benglore', 'bidar', 0),
(11, 11, 2, '2024-11-15', '2024-11-16', 'benglore', 'bidar', 0);

--
-- Triggers `reservations`
--
DELIMITER $$
CREATE TRIGGER `check_valid_pickup_date` BEFORE INSERT ON `reservations` FOR EACH ROW BEGIN
    IF NEW.pickup_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid booking date: Value must be CURDATE() or higher.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `created_at`) VALUES
(8, 'pvn__kuma', '$2y$10$GenZltKtTuSbn1SaOWV7ouNqJUI..VvohOvrdvQzvnj25C3UPRw7u', 'abc@gmail.com', '2024-11-07 17:36:41'),
(9, 'pavan', '$2y$10$sW0TzOfgOH2oiIXxOD8i8uk6dJGNSucqw4QKL4UH8U6pd8i66zT4.', 'pav@gmil.com', '2024-11-12 05:41:39'),
(10, 'am102', '$2y$10$KrdFtp0rSku.7KWw7xb/NOTgGVaXlo8NuFbvgnj3RYkpo4hi5goT6', '102@gmail.com', '2024-11-14 05:43:30'),
(12, 'neeraj', '$2y$10$6I04OqE0XNNEIvnvasoF/ufFBOn38Mhu9hIMjVg.Xtuz1GqGVhu/.', 'mg@gmail.com', '2024-11-14 06:56:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_brands`
--
ALTER TABLE `car_brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `car_types`
--
ALTER TABLE `car_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_brands`
--
ALTER TABLE `car_brands`
  MODIFY `brand_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `car_types`
--
ALTER TABLE `car_types`
  MODIFY `type_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
