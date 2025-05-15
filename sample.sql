-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2025 at 12:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fyp_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_ID` int(10) UNSIGNED NOT NULL,
  `user_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_ID`, `user_ID`) VALUES
(80001, 1),
(80002, 2),
(80003, 3),
(80004, 4);

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcement_ID` int(10) UNSIGNED NOT NULL,
  `post_by` varchar(40) NOT NULL,
  `announcement_title` varchar(50) NOT NULL,
  `announcement_content` varchar(350) NOT NULL,
  `admin_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`announcement_ID`, `post_by`, `announcement_title`, `announcement_content`, `admin_ID`) VALUES
(1, 'Camellya', 'FYP PROPOSAL SUBMISSION', 'Student Must Submit Their Proposal By 3rd December. Any late submission will not be accepted', 80004);

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `assessment_ID` int(10) UNSIGNED NOT NULL,
  `assessment_date` date NOT NULL,
  `program_name` varchar(40) NOT NULL,
  `assessment_file` varchar(100) NOT NULL,
  `supervisor_ID` int(10) UNSIGNED NOT NULL,
  `student_ID` int(10) UNSIGNED NOT NULL,
  `clarity_objectives` int(10) UNSIGNED NOT NULL,
  `understanding_problem` int(10) UNSIGNED NOT NULL,
  `quality_methodology` int(10) UNSIGNED NOT NULL,
  `technical_implementation` int(10) UNSIGNED NOT NULL,
  `innovation` int(10) UNSIGNED NOT NULL,
  `quality_report` int(10) UNSIGNED NOT NULL,
  `presentation_skills` int(10) UNSIGNED NOT NULL,
  `ability_answer_question` int(10) UNSIGNED NOT NULL,
  `signature_file` varchar(100) NOT NULL,
  `Grade` enum('A+','A','A-','B+','B','C+','C','F') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`assessment_ID`, `assessment_date`, `program_name`, `assessment_file`, `supervisor_ID`, `student_ID`, `clarity_objectives`, `understanding_problem`, `quality_methodology`, `technical_implementation`, `innovation`, `quality_report`, `presentation_skills`, `ability_answer_question`, `signature_file`, `Grade`) VALUES
(1, '2025-01-31', 'Information System', 'kai_assessment.pdf', 50006, 10010, 5, 5, 4, 7, 6, 8, 5, 6, 'signature.jpg', 'C+');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_ID` int(10) UNSIGNED NOT NULL,
  `post_by` varchar(40) NOT NULL,
  `event_date` date NOT NULL,
  `event_title` varchar(50) NOT NULL,
  `admin_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_ID`, `post_by`, `event_date`, `event_title`, `admin_ID`) VALUES
(1, 'Alice', '2024-02-21', 'FYP TIPS SHARING WORKSHOP', 80001);

-- --------------------------------------------------------

--
-- Table structure for table `goal_and_progress`
--

CREATE TABLE `goal_and_progress` (
  `goal_ID` int(10) UNSIGNED NOT NULL,
  `progress_date` date NOT NULL,
  `current_progress` varchar(50) NOT NULL,
  `next_goal` varchar(50) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `student_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goal_and_progress`
--

INSERT INTO `goal_and_progress` (`goal_ID`, `progress_date`, `current_progress`, `next_goal`, `comment`, `student_ID`) VALUES
(1, '2024-12-12', 'Draft approved by supervisor', 'Start project implementation', 'Well-prepared proposal', 10001),
(2, '2024-11-12', 'Initial research completed', 'Develop encryption prototype', 'Good progress on research', 10002),
(3, '2024-12-11', 'Data collection completed', 'Perform data analysis', 'Impressive dataset preparation', 10004),
(4, '2024-12-13', 'Infrastructure plan drafted', 'Implement network simulation', 'Thorough analysis provided', 10006),
(5, '2024-11-13', 'System design completed', 'Begin coding transactions', 'Comprehensive design', 10009);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_log`
--

CREATE TABLE `meeting_log` (
  `meeting_log_ID` int(10) UNSIGNED NOT NULL,
  `file_address` varchar(100) NOT NULL,
  `student_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meeting_log`
--

INSERT INTO `meeting_log` (`meeting_log_ID`, `file_address`, `student_ID`) VALUES
(1, 'store_meeting_log/charlie_meetingLog_1.pdf', 10001),
(2, 'store_meeting_log/david_meetingLog_1.pdf', 10002),
(3, 'store_meeting_log/frank_meetingLog_1.pdf', 10004),
(4, 'store_meeting_log/hank_meetingLog_1.pdf', 10006),
(5, 'store_meeting_log/vivian_meetingLog_1.pdf', 10009);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_record`
--

CREATE TABLE `meeting_record` (
  `meeting_ID` int(10) UNSIGNED NOT NULL,
  `meeting_title` varchar(50) NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` time NOT NULL,
  `meeting_desc` varchar(100) NOT NULL,
  `student_ID` int(10) UNSIGNED NOT NULL,
  `supervisor_ID` int(10) UNSIGNED NOT NULL,
  `meeting_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meeting_record`
--

INSERT INTO `meeting_record` (`meeting_ID`, `meeting_title`, `meeting_date`, `meeting_time`, `meeting_desc`, `student_ID`, `supervisor_ID`, `meeting_status`) VALUES
(1, 'Project Kickoff', '2025-01-15', '10:00:00', 'Discussed project scope and deliverables', 10001, 50001, 'Accept'),
(2, 'Cryptography Research Update', '2025-01-16', '14:00:00', 'Reviewed initial research findings', 10002, 50002, 'Cancel'),
(3, 'Data Analysis Plan', '2025-01-17', '11:00:00', 'Discussed methodology for data analysis', 10004, 50004, 'Pending'),
(4, 'Smart Cities IT Infrastructure', '2025-01-18', '09:00:00', 'Reviewed IT requirements and system design', 10006, 50005, 'Pending'),
(5, 'Banking TPS Review', '2025-01-19', '15:00:00', 'Discussed system integration and security', 10009, 50001, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `proposal_ID` int(10) UNSIGNED NOT NULL,
  `student_name` varchar(40) NOT NULL,
  `student_ID` int(10) UNSIGNED NOT NULL,
  `specialization` varchar(20) NOT NULL CHECK (`specialization` in ('Computer Science','Cybersecurity','Game Development','Data Science','Software Engineering','Information System')),
  `project_title` varchar(100) NOT NULL,
  `supervisor_name` varchar(40) NOT NULL,
  `supervisor_ID` int(10) UNSIGNED NOT NULL,
  `co_supervisor_name` varchar(40) DEFAULT NULL,
  `proposed_by` varchar(10) NOT NULL CHECK (`proposed_by` in ('Student','Lecture','Industry')),
  `project_type` varchar(50) NOT NULL CHECK (`project_type` in ('Application','Research','Application and Research')),
  `project_specialization` varchar(20) NOT NULL CHECK (`project_specialization` in ('Computer Science','Cybersecurity','Game Development','Data Science','Software Engineering','Information System')),
  `project_category` varchar(100) NOT NULL,
  `industry_collaboration` varchar(3) NOT NULL CHECK (`industry_collaboration` in ('yes','no')),
  `file_address` varchar(100) NOT NULL,
  `proposal_status` varchar(10) NOT NULL CHECK (`proposal_status` in ('approve','pending','reject'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`proposal_ID`, `student_name`, `student_ID`, `specialization`, `project_title`, `supervisor_name`, `supervisor_ID`, `co_supervisor_name`, `proposed_by`, `project_type`, `project_specialization`, `project_category`, `industry_collaboration`, `file_address`, `proposal_status`) VALUES
(1, 'Charlie', 10001, 'Computer Science', 'AI-powered Chatbot for Critical Systems', 'Ivy', 50001, 'Jack', 'Student', 'Application and Research', 'Computer Science', 'Critical System', 'no', 'store_proposal/charlie_proposal.pdf', 'approve'),
(2, 'David', 10002, 'Cybersecurity', 'Advanced Cryptography Methods for Data Security', 'Jack', 50002, 'Karen', 'Lecture', 'Research', 'Cybersecurity', 'Cryptography and Data Security', 'no', 'store_proposal/david_proposal.pdf', 'approve'),
(3, 'Eva', 10003, 'Game Development', 'Immersive Game Design for Virtual Reality', 'Karen', 50003, 'Leo', 'Student', 'Application', 'Game Development', 'Game Design Prototyping (GDP)', 'no', 'store_proposal/eva_proposal.pdf', 'pending'),
(4, 'Frank', 10004, 'Data Science', 'Data Analytics for Smart Healthcare Systems', 'Leo', 50004, 'Ivy', 'Student', 'Research', 'Data Science', 'Data Analytics', 'no', 'store_proposal/frank_proposal.pdf', 'approve'),
(5, 'Grace', 10005, 'Software Engineering', 'Service-Oriented System for E-Commerce', 'Sherif', 50005, 'Jhon', 'Industry', 'Application', 'Software Engineering', 'Service Oriented Computing', 'yes', 'store_proposal/grace_proposal.pdf', 'pending'),
(6, 'Hank', 10006, 'Information System', 'IT Infrastructure for Smart Cities', 'Sherif', 50005, 'Ivy', 'Lecture', 'Application', 'Information System', 'IT Infrastructure', 'yes', 'store_proposal/hank_proposal.pdf', 'approve'),
(7, 'AbuAbi', 10007, 'Data Science', 'Intelligent Systems for Automated Data Processing', 'Karen', 50003, 'Leo', 'Student', 'Application and Research', 'Data Science', 'Intelligent Systems', 'no', 'store_proposal/abuabi_proposal.pdf', 'pending'),
(8, 'Dom', 10008, 'Game Development', 'Game Algorithm Research for AI NPC Behavior', 'Leo', 50004, 'Jack', 'Industry', 'Research', 'Game Development', 'Game Algorithm Research (GAR)', 'no', 'store_proposal/dom_proposal.pdf', 'pending'),
(9, 'Vivian', 10009, 'Software Engineering', 'Transaction Processing Systems for Banking', 'Ivy', 50001, 'Sherif', 'Student', 'Application', 'Software Engineering', 'Transaction Processing Systems', 'no', 'store_proposal/vivian_proposal.pdf', 'approve'),
(10, 'Kai', 10010, 'Software Engineering', 'Investigation and Analysis of Software Vulnerabilities', 'Jhon', 50006, 'Jack', 'Student', 'Research', 'Software Engineering', 'Investigation and Analysis', 'no', 'store_proposal/kai_proposal.pdf', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_ID` int(10) UNSIGNED NOT NULL,
  `specialization` varchar(20) NOT NULL CHECK (`specialization` in ('Computer Science','Cybersecurity','Game Development','Data Science','Software Engineering','Information System')),
  `user_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_ID`, `specialization`, `user_ID`) VALUES
(10001, 'Computer Science', 5),
(10002, 'Cybersecurity', 6),
(10003, 'Game Development', 7),
(10004, 'Data Science', 8),
(10005, 'Software Engineering', 9),
(10006, 'Information System', 10),
(10007, 'Data Science', 11),
(10008, 'Game Development', 12),
(10009, 'Software Engineering', 13),
(10010, 'Software Engineering', 14),
(10011, 'Computer Science', 21);

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `supervisor_ID` int(10) UNSIGNED NOT NULL,
  `user_ID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`supervisor_ID`, `user_ID`) VALUES
(50001, 15),
(50002, 16),
(50003, 17),
(50004, 18),
(50005, 19),
(50006, 20);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_ID` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_phone` varchar(11) NOT NULL,
  `user_role` varchar(10) NOT NULL CHECK (`user_role` in ('admin','supervisor','student'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_ID`, `user_name`, `user_password`, `user_email`, `user_phone`, `user_role`) VALUES
(1, 'Alice', '$2y$10$RjIPftIPXaRQh8w96BiHvuMrZyJJ5tJBAH3HryUAPEn5GaMENu77G', 'alice@gmail.com', '0123456789', 'admin'),
(2, 'Bob', '$2y$10$Go72sOe8i2nTOvZw16H26.n7ZfyGq2lEVJEuk8E87puzPQ6QfTdcK', 'bob@gmail.com', '01245678912', 'admin'),
(3, 'Jayden', '$2y$10$itPNZvps0juIe2JjT99ziu9gCReJEsQIMIZcsNNnEVD0m0Xy67afC', 'Jayden@gmail.com', '0122515491', 'admin'),
(4, 'Camellya', '$2y$10$MUcAElwOASnMrLeBYc4hTeGA.nEvislY4yVocZEs9NGttxB/3HEju', 'Camellya@gmail.com', '0165487315', 'admin'),
(5, 'Charlie', '$2y$10$5SJrBlDYtAos0eAlihzGQ.9FEx5EFzdMswd2zCfmoZwMya7t6giZ6', 'charlie@gmail.com', '01345678903', 'student'),
(6, 'David', '$2y$10$4HpNpFAehnFWCk4diyEz6u3LZcuEtt6c3kmVuv2elAVJfCkLbtP72', 'david@gmail.com', '01123456789', 'student'),
(7, 'Eva', '$2y$10$DkSVCFOv1uF59oc0De2fz.BpKBTCPjoZ.FRUb.DqQicFKaP.gFBXW', 'eva@gmail.com', '0123678905', 'student'),
(8, 'Frank', '$2y$10$wWluwHfxlma0FB2IIiD4rOtd0/986bdWt.gF2czCbBdM6z8ip3TDq', 'frank@gmail.com', '0179872478', 'student'),
(9, 'Grace', '$2y$10$UED93qUwHSI52RNMihZ92ujiHjqFyC.2eJFAvD4eh02mxRoZutCYW', 'grace@gmail.com', '0198792467', 'student'),
(10, 'Hank', '$2y$10$DrLssoK46AEtEsd12EJC9ub2P3uD0AuE.gyms9ZlwO/52fjEYt8LW', 'hank@gmail.com', '0101254879', 'student'),
(11, 'AbuAbi', '$2y$10$3dEq.Xe9nYJDGWeEg9hvzuLH7nI0nqj.DPjJARZIFV75D.KbM9XNW', 'AbuAbi@gmail.com', '0165789254', 'student'),
(12, 'Dom', '$2y$10$kuIS3hlsvfsKjSf5m0P9G.GlV7LIEEqk9/9e/ysnVHcBRFOK9vSpu', 'Dom@gmail.com', '0152485987', 'student'),
(13, 'Vivian', '$2y$10$K1U25lJ.ub.1IZxAUkGyHeN2vnqOBVcAdBNylYU9i..XJv68C7xja', 'vivian@gmail.com', '0114587548', 'student'),
(14, 'Kai', '$2y$10$FO1coDYNwedNf9ItVbbDe.RuF.kvyuHx9Sa490.9hQYEAzLPsABSe', 'Kai@gmail.com', '016982888', 'student'),
(15, 'Ivy', '$2y$10$YRAyxJTif7wB0JJrLqo47OZWgTTP8.t9.Kgap8MjAeGTeHLqFYOOe', 'ivy@gmail.com', '0129783467', 'supervisor'),
(16, 'Jack', '$2y$10$pdKQofyaJkeh.Ycv31rCt.Vf4..PYcluchMznv26F.oiQpAQWh7Sq', 'jack@gmail.com', '0125786548', 'supervisor'),
(17, 'Karen', '$2y$10$ZdSwgpcceRd2BaU2ASpfAuIDvROOawlSCghhzWm3gz5R3NiCCqjMa', 'karen@gmail.com', '0105485691', 'supervisor'),
(18, 'Leo', '$2y$10$kdX7W9WboP8WjVviDTWj9e8KwmMjxu7itWLLYmK752dME7B17rLpO', 'leo@gmail.com', '0176543168', 'supervisor'),
(19, 'Sherif', '$2y$10$fX2qCGjcdEZ/qMYxrye9eee4BfSnIaEa9gjgVzSJXrnjEiHZ50Z..', 'Sherif@gmail.com', '0158792482', 'supervisor'),
(20, 'Jhon', '$2y$10$PY5r/qw/tRaBjVM8elxeauAMb2RgXtqki8kol/llL.Hca397GXtf6', 'Jhon@gmail.com', '0163658987', 'supervisor'),
(21, 'amin', '$2y$10$mBObB/vfOixFLToO6KDPT.G1e0NMRMouSJfIXMC0Vyk9eV1LoVzjK', 'amin@gmail.com', '012-345678', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcement_ID`),
  ADD KEY `admin_ID` (`admin_ID`);

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`assessment_ID`),
  ADD KEY `student_ID` (`student_ID`),
  ADD KEY `supervisor_ID` (`supervisor_ID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_ID`),
  ADD KEY `admin_ID` (`admin_ID`);

--
-- Indexes for table `goal_and_progress`
--
ALTER TABLE `goal_and_progress`
  ADD PRIMARY KEY (`goal_ID`),
  ADD KEY `student_ID` (`student_ID`);

--
-- Indexes for table `meeting_log`
--
ALTER TABLE `meeting_log`
  ADD PRIMARY KEY (`meeting_log_ID`),
  ADD KEY `student_ID` (`student_ID`);

--
-- Indexes for table `meeting_record`
--
ALTER TABLE `meeting_record`
  ADD PRIMARY KEY (`meeting_ID`),
  ADD KEY `student_ID` (`student_ID`),
  ADD KEY `supervisor_ID` (`supervisor_ID`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`proposal_ID`),
  ADD KEY `student_ID` (`student_ID`),
  ADD KEY `supervisor_ID` (`supervisor_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`supervisor_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80005;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcement_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assessment`
--
ALTER TABLE `assessment`
  MODIFY `assessment_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `goal_and_progress`
--
ALTER TABLE `goal_and_progress`
  MODIFY `goal_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meeting_log`
--
ALTER TABLE `meeting_log`
  MODIFY `meeting_log_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meeting_record`
--
ALTER TABLE `meeting_record`
  MODIFY `meeting_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `proposal`
--
ALTER TABLE `proposal`
  MODIFY `proposal_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10012;

--
-- AUTO_INCREMENT for table `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `supervisor_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50007;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE;

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`admin_ID`) REFERENCES `admin` (`admin_ID`) ON DELETE CASCADE;

--
-- Constraints for table `assessment`
--
ALTER TABLE `assessment`
  ADD CONSTRAINT `assessment_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessment_ibfk_2` FOREIGN KEY (`supervisor_ID`) REFERENCES `supervisor` (`supervisor_ID`) ON DELETE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`admin_ID`) REFERENCES `admin` (`admin_ID`) ON DELETE CASCADE;

--
-- Constraints for table `goal_and_progress`
--
ALTER TABLE `goal_and_progress`
  ADD CONSTRAINT `goal_and_progress_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`) ON DELETE CASCADE;

--
-- Constraints for table `meeting_log`
--
ALTER TABLE `meeting_log`
  ADD CONSTRAINT `meeting_log_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`) ON DELETE CASCADE;

--
-- Constraints for table `meeting_record`
--
ALTER TABLE `meeting_record`
  ADD CONSTRAINT `meeting_record_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `meeting_record_ibfk_2` FOREIGN KEY (`supervisor_ID`) REFERENCES `supervisor` (`supervisor_ID`) ON DELETE CASCADE;

--
-- Constraints for table `proposal`
--
ALTER TABLE `proposal`
  ADD CONSTRAINT `proposal_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `proposal_ibfk_2` FOREIGN KEY (`supervisor_ID`) REFERENCES `supervisor` (`supervisor_ID`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE;

--
-- Constraints for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
