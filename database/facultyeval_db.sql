-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2024 at 02:32 PM
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
-- Database: `facultyeval_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_list`
--

CREATE TABLE `academic_list` (
  `id` int(30) NOT NULL,
  `year` text NOT NULL,
  `semester` int(30) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=Pending,1=Start,2=Closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_list`
--

INSERT INTO `academic_list` (`id`, `year`, `semester`, `is_default`, `status`) VALUES
(1, '2024-2025', 1, 1, 1),
(2, '2024-2025', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `class_list`
--

CREATE TABLE `class_list` (
  `id` int(30) NOT NULL,
  `curriculum` text NOT NULL,
  `level` text NOT NULL,
  `section` text NOT NULL,
  `academic_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_list`
--

INSERT INTO `class_list` (`id`, `curriculum`, `level`, `section`, `academic_id`) VALUES
(1, 'BSCS', '3', 'A', 1),
(2, 'BSCS', '3', 'B', 1),
(3, 'BSCS', '3', 'C', 1);

-- --------------------------------------------------------

--
-- Table structure for table `criteria_list`
--

CREATE TABLE `criteria_list` (
  `id` int(30) NOT NULL,
  `criteria` text NOT NULL,
  `order_by` int(30) NOT NULL,
  `criteria_rate` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria_list`
--

INSERT INTO `criteria_list` (`id`, `criteria`, `order_by`, `criteria_rate`) VALUES
(1, 'A. Commitment (20%)', 0, 20.00),
(2, 'B. Knowledge of Subject (20%)', 1, 20.00),
(3, 'C. Teaching for independent Learning (30%)', 2, 30.00),
(4, 'D. Management of Learning (30%)', 3, 30.00);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_answers`
--

CREATE TABLE `evaluation_answers` (
  `evaluation_id` int(30) NOT NULL,
  `question_id` int(30) NOT NULL,
  `rate` int(20) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_answers`
--

INSERT INTO `evaluation_answers` (`evaluation_id`, `question_id`, `rate`, `academic_id`, `faculty_id`) VALUES
(1, 1, 5, 1, 1),
(1, 2, 5, 1, 1),
(1, 3, 5, 1, 1),
(1, 4, 5, 1, 1),
(1, 5, 5, 1, 1),
(1, 6, 5, 1, 1),
(1, 7, 5, 1, 1),
(1, 8, 5, 1, 1),
(1, 9, 5, 1, 1),
(1, 10, 5, 1, 1),
(1, 11, 5, 1, 1),
(1, 12, 5, 1, 1),
(1, 13, 5, 1, 1),
(1, 14, 5, 1, 1),
(1, 15, 5, 1, 1),
(1, 16, 5, 1, 1),
(1, 17, 5, 1, 1),
(1, 18, 5, 1, 1),
(1, 19, 5, 1, 1),
(1, 20, 5, 1, 1),
(2, 1, 5, 1, 1),
(2, 2, 5, 1, 1),
(2, 3, 5, 1, 1),
(2, 4, 5, 1, 1),
(2, 5, 5, 1, 1),
(2, 6, 5, 1, 1),
(2, 7, 5, 1, 1),
(2, 8, 5, 1, 1),
(2, 9, 5, 1, 1),
(2, 10, 5, 1, 1),
(2, 11, 5, 1, 1),
(2, 12, 5, 1, 1),
(2, 13, 5, 1, 1),
(2, 14, 5, 1, 1),
(2, 15, 5, 1, 1),
(2, 16, 5, 1, 1),
(2, 17, 5, 1, 1),
(2, 18, 5, 1, 1),
(2, 19, 5, 1, 1),
(2, 20, 5, 1, 1),
(3, 1, 5, 1, 2),
(3, 2, 5, 1, 2),
(3, 3, 5, 1, 2),
(3, 4, 5, 1, 2),
(3, 5, 5, 1, 2),
(3, 6, 5, 1, 2),
(3, 7, 5, 1, 2),
(3, 8, 5, 1, 2),
(3, 9, 5, 1, 2),
(3, 10, 5, 1, 2),
(3, 11, 5, 1, 2),
(3, 12, 5, 1, 2),
(3, 13, 5, 1, 2),
(3, 14, 5, 1, 2),
(3, 15, 5, 1, 2),
(3, 16, 5, 1, 2),
(3, 17, 5, 1, 2),
(3, 18, 5, 1, 2),
(3, 19, 5, 1, 2),
(3, 20, 5, 1, 2),
(4, 1, 5, 1, 2),
(4, 2, 5, 1, 2),
(4, 3, 5, 1, 2),
(4, 4, 5, 1, 2),
(4, 5, 5, 1, 2),
(4, 6, 5, 1, 2),
(4, 7, 5, 1, 2),
(4, 8, 5, 1, 2),
(4, 9, 5, 1, 2),
(4, 10, 5, 1, 2),
(4, 11, 5, 1, 2),
(4, 12, 5, 1, 2),
(4, 13, 5, 1, 2),
(4, 14, 5, 1, 2),
(4, 15, 5, 1, 2),
(4, 16, 5, 1, 2),
(4, 17, 5, 1, 2),
(4, 18, 5, 1, 2),
(4, 19, 5, 1, 2),
(4, 20, 5, 1, 2),
(5, 1, 5, 1, 2),
(5, 2, 5, 1, 2),
(5, 3, 5, 1, 2),
(5, 4, 5, 1, 2),
(5, 5, 5, 1, 2),
(5, 6, 5, 1, 2),
(5, 7, 5, 1, 2),
(5, 8, 5, 1, 2),
(5, 9, 5, 1, 2),
(5, 10, 5, 1, 2),
(5, 11, 5, 1, 2),
(5, 12, 5, 1, 2),
(5, 13, 5, 1, 2),
(5, 14, 5, 1, 2),
(5, 15, 5, 1, 2),
(5, 16, 5, 1, 2),
(5, 17, 5, 1, 2),
(5, 18, 5, 1, 2),
(5, 19, 5, 1, 2),
(5, 20, 5, 1, 2),
(6, 1, 4, 1, 2),
(6, 2, 4, 1, 2),
(6, 3, 4, 1, 2),
(6, 4, 4, 1, 2),
(6, 5, 4, 1, 2),
(6, 6, 4, 1, 2),
(6, 7, 4, 1, 2),
(6, 8, 4, 1, 2),
(6, 9, 4, 1, 2),
(6, 10, 4, 1, 2),
(6, 11, 4, 1, 2),
(6, 12, 4, 1, 2),
(6, 13, 4, 1, 2),
(6, 14, 4, 1, 2),
(6, 15, 4, 1, 2),
(6, 16, 4, 1, 2),
(6, 17, 4, 1, 2),
(6, 18, 4, 1, 2),
(6, 19, 4, 1, 2),
(6, 20, 4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_list`
--

CREATE TABLE `evaluation_list` (
  `evaluation_id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `restriction_id` int(30) NOT NULL,
  `date_taken` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_list`
--

INSERT INTO `evaluation_list` (`evaluation_id`, `academic_id`, `class_id`, `student_id`, `subject_id`, `faculty_id`, `restriction_id`, `date_taken`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2024-12-16 12:08:45'),
(2, 1, 1, 2, 1, 1, 1, '2024-12-16 12:09:16'),
(3, 1, 1, 1, 2, 2, 2, '2024-12-16 12:43:10'),
(4, 1, 1, 2, 2, 2, 2, '2024-12-16 12:43:29'),
(5, 1, 1, 4, 2, 2, 2, '2024-12-16 12:45:13'),
(6, 1, 2, 6, 2, 2, 3, '2024-12-16 13:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_list`
--

CREATE TABLE `faculty_list` (
  `id` int(30) NOT NULL,
  `school_id` varchar(100) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `academic_id` int(30) NOT NULL,
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_list`
--

INSERT INTO `faculty_list` (`id`, `school_id`, `firstname`, `lastname`, `email`, `password`, `academic_id`, `avatar`, `date_created`) VALUES
(1, '12345', 'Melbrick', 'Evallar', 'evallar@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 'no-image-available.png', '2024-10-08 15:02:02'),
(2, '12-324512', 'Josephine', 'Bulilan', 'phine@gmail.com', '202cb962ac59075b964b07152d234b70', 1, '1733678760_phine.jpg', '2024-12-09 01:26:47'),
(3, '12-412213', 'Coravil Joy', 'Avila', 'coravil@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 'no-image-available.png', '2024-12-15 23:54:29'),
(4, '23-9876', 'Esmael', 'Maliberan', 'malibs@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 'no-image-available.png', '2024-12-16 12:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `question_list`
--

CREATE TABLE `question_list` (
  `id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `question` text NOT NULL,
  `order_by` int(30) NOT NULL,
  `criteria_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_list`
--

INSERT INTO `question_list` (`id`, `academic_id`, `question`, `order_by`, `criteria_id`) VALUES
(1, 1, '1. Demonstrate sensitivity to students ability to attend and absorb content information.', 0, 1),
(2, 1, '2. Integrates sensitivity his/her learning objectives with those of the students in a collaborative process.', 1, 1),
(3, 1, '3. Makes self-available to students beyond official time.', 2, 1),
(4, 1, '4. Regularly comes to class on time, well-groomed and well prepared to complete assigned responsibilities.', 3, 1),
(5, 1, '5. Keeps accurate records of students performance and prompt submission of the same.', 4, 1),
(6, 1, '1.	Demonstrated mastery of the subject matter (explain the subject matter without relying solely on the prescribed textbook).', 5, 2),
(7, 1, '2.	Draws and share information on the state on the art of theory and practice in his/her discipline.', 6, 2),
(8, 1, '3.	Integrates subject to practical circumstances and learning intents/purposes of students.', 7, 2),
(9, 1, '4.	Explains the relevance of present topics to the previous lessons, and relates the subject matter to relevant current issues and/or daily life activities.', 8, 2),
(10, 1, '5.	Demonstrates up-to-date knowledge and/or awareness on current trends and issues of the subject.', 9, 2),
(11, 1, '1.	Creates teaching strategies that allow students to practice using concepts they need to understand (interactive discussion).', 10, 3),
(12, 1, '2.	Enhances students’ self-esteem and/or gives due recognition to students’ performance/potentials.', 11, 3),
(13, 1, '3.	Allows students’ to create their own course with objectives and realistically defined students-professor rules and make them accountable for their performance.', 12, 3),
(14, 1, '4.	Allows students to think independently and make their own decisions and holding them accountable for their performance based largely on their success in executing decisions.', 13, 3),
(15, 1, '5.	Encourages students to learn beyond what is required and help/guide the students how to apply the concepts learned.', 14, 3),
(16, 1, '1.	Creates opportunities for intensive and/or extensive contribution of students in the class activities (e.g. breaks class into dyads, trials or buzz/task group).', 15, 4),
(17, 1, '2.	Assumes roles as facilitator, resource person, coach inquisitor, integrator, referees in drawing students to contribute to knowledge and understanding of the concepts at hands.', 16, 4),
(18, 1, '3.	Designs and implements learning conditions and experience that promotes healthy exchange and/or confrontations.', 17, 4),
(19, 1, '4.	Structures/re-structures learning and teaching-learning context to enhance attainment of collective learning objectives.', 18, 4),
(20, 1, '5.	Use of instructional materials (audio/video materials, fieldtrips, film showing, computer-aided instructions, etc.) to reinforce learning process.', 19, 4);

-- --------------------------------------------------------

--
-- Table structure for table `restriction_list`
--

CREATE TABLE `restriction_list` (
  `id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restriction_list`
--

INSERT INTO `restriction_list` (`id`, `academic_id`, `faculty_id`, `class_id`, `subject_id`) VALUES
(1, 1, 1, 1, 1),
(3, 1, 2, 2, 2),
(4, 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_list`
--

CREATE TABLE `student_list` (
  `id` int(30) NOT NULL,
  `school_id` varchar(100) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `class_id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_list`
--

INSERT INTO `student_list` (`id`, `school_id`, `firstname`, `lastname`, `email`, `password`, `class_id`, `academic_id`, `avatar`, `date_created`) VALUES
(1, '20-00337', 'Nicanor', 'Ibarra', 'ncibarra@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 1, 'no-image-available.png', '2024-12-16 12:04:55'),
(2, '21-01334', 'Mark', 'Gier', 'gier@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 1, 'no-image-available.png', '2024-12-16 12:05:32'),
(3, '21-12337', 'TomJohn', 'De Castro', 'tom@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 1, 'no-image-available.png', '2024-12-16 12:06:32'),
(4, '22-0506', 'Theresa', 'Torrefranca', 'tere@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 1, 'no-image-available.png', '2024-12-16 12:06:51'),
(5, '20-24128765', 'Eugene', 'Festejo', 'eugene@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 1, 'no-image-available.png', '2024-12-16 12:07:23'),
(6, '20-24126789', 'Mj', 'Mindańa', 'mj@gmail.com', '202cb962ac59075b964b07152d234b70', 2, 1, 'no-image-available.png', '2024-12-16 12:48:35'),
(7, '20-24123456', 'Abegail', 'Salimpuran', 'begail@gmail.com', '202cb962ac59075b964b07152d234b70', 2, 1, 'no-image-available.png', '2024-12-16 12:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `subject_list`
--

CREATE TABLE `subject_list` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject_list`
--

INSERT INTO `subject_list` (`id`, `code`, `subject`, `description`) VALUES
(1, 'CS 316', 'Web Systems and Technologies 2', 'Web Systems and Technologies 2'),
(2, 'CS 314', 'System Fundamentals - Elective 1', 'System Fundamentals - Elective 1');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Faculty Evaluation System', 'info@sample.comm', '+6951 8805 561', 'sample', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `avatar`, `date_created`) VALUES
(1, 'Eru', 'Arrabi', 'eru@gmail.com', '5669d91a8daf3a1084c1e743e69481df', 'no-image-available.png', '2024-12-16 13:33:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_list`
--
ALTER TABLE `academic_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_list`
--
ALTER TABLE `class_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria_list`
--
ALTER TABLE `criteria_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evaluation_list`
--
ALTER TABLE `evaluation_list`
  ADD PRIMARY KEY (`evaluation_id`);

--
-- Indexes for table `faculty_list`
--
ALTER TABLE `faculty_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_list`
--
ALTER TABLE `question_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restriction_list`
--
ALTER TABLE `restriction_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_list`
--
ALTER TABLE `subject_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `academic_list`
--
ALTER TABLE `academic_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_list`
--
ALTER TABLE `class_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `criteria_list`
--
ALTER TABLE `criteria_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `evaluation_list`
--
ALTER TABLE `evaluation_list`
  MODIFY `evaluation_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faculty_list`
--
ALTER TABLE `faculty_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `question_list`
--
ALTER TABLE `question_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `restriction_list`
--
ALTER TABLE `restriction_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_list`
--
ALTER TABLE `student_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subject_list`
--
ALTER TABLE `subject_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
