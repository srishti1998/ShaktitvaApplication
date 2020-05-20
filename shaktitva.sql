-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2020 at 09:15 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shaktitva`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` bigint(3) NOT NULL,
  `category_name` bigint(3) NOT NULL,
  `category_type` enum('problems','skills','subjects','hygiene') NOT NULL,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_ngo`
--

CREATE TABLE `category_ngo` (
  `ngo_id` bigint(3) NOT NULL,
  `category_id` bigint(3) NOT NULL COMMENT 'category type should be ngo',
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comments_posts`
--

CREATE TABLE `comments_posts` (
  `comment_id` bigint(3) NOT NULL,
  `post_id` bigint(3) NOT NULL,
  `text` varchar(3) NOT NULL,
  `posted_by` bigint(3) NOT NULL COMMENT 'woman_id from women',
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comments_skills`
--

CREATE TABLE `comments_skills` (
  `comment_id` bigint(3) NOT NULL,
  `skill_id` bigint(3) NOT NULL,
  `text` varchar(3) NOT NULL,
  `posted_by` bigint(3) NOT NULL,
  `created_by` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_by` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `follow_id` bigint(3) NOT NULL,
  `followed_by` bigint(3) NOT NULL,
  `followed_to` bigint(3) NOT NULL,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hygiene`
--

CREATE TABLE `hygiene` (
  `hygiene_id` bigint(3) NOT NULL,
  `no_of_images` int(3) DEFAULT NULL,
  `no_of_videos` int(3) DEFAULT NULL,
  `text` int(3) DEFAULT NULL,
  `organisation_id` bigint(3) NOT NULL,
  `category_id` bigint(3) NOT NULL,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `image_url`
--

CREATE TABLE `image_url` (
  `url` varchar(3) NOT NULL,
  `type` enum('skill','post','tutorial','story','hygiene') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_mapped` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` bigint(3) NOT NULL,
  `lang_name` varchar(3) NOT NULL,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` bigint(3) NOT NULL,
  `location_name` varchar(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ngos`
--

CREATE TABLE `ngos` (
  `ngo_id` bigint(3) NOT NULL,
  `details` varchar(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

CREATE TABLE `organisations` (
  `org_id` bigint(3) NOT NULL,
  `username` varchar(3) NOT NULL,
  `name` varchar(3) NOT NULL,
  `address` varchar(3) NOT NULL,
  `phone_number` varchar(3) NOT NULL,
  `regestration_number` varchar(3) NOT NULL,
  `owner_name` varchar(3) NOT NULL,
  `owner_email` varchar(3) NOT NULL,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `password` varchar(3) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` bigint(3) NOT NULL,
  `posted_by` bigint(3) NOT NULL COMMENT 'woman_id from women',
  `no_of_images` int(3) DEFAULT NULL,
  `no_of_videos` int(3) DEFAULT NULL,
  `text` varchar(3) DEFAULT NULL,
  `location_live_lat` varchar(3) NOT NULL,
  `location_live_long` varchar(3) NOT NULL,
  `location_id` bigint(3) DEFAULT NULL,
  `no_of_views` bigint(3) NOT NULL DEFAULT 0,
  `category_id` bigint(3) NOT NULL COMMENT 'type should be problems',
  `no_of_comments` int(3) NOT NULL DEFAULT 0,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `query_id` bigint(3) NOT NULL,
  `query` varchar(3) NOT NULL,
  `posted_by` bigint(3) NOT NULL,
  `status` enum('resolved','processing','ignored','seen') NOT NULL,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` bigint(3) NOT NULL,
  `number_of_images` int(3) NOT NULL DEFAULT 0,
  `number_of_videos` int(3) NOT NULL DEFAULT 0,
  `text` varchar(3) DEFAULT NULL,
  `category_id` bigint(3) NOT NULL,
  `posted_by` bigint(3) NOT NULL,
  `location_lat` varchar(3) DEFAULT NULL,
  `location_long` varchar(3) DEFAULT NULL,
  `location_id` bigint(3) DEFAULT NULL,
  `number_of_views` int(3) NOT NULL,
  `number_of_likes` int(3) DEFAULT NULL,
  `organisation_id` bigint(3) NOT NULL DEFAULT 1,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `story_id` bigint(3) NOT NULL,
  `category_id` bigint(3) NOT NULL,
  `no_of_images` int(3) DEFAULT NULL,
  `no_of_videos` int(3) DEFAULT NULL,
  `text` varchar(3) DEFAULT NULL,
  `organisation_id` bigint(3) NOT NULL DEFAULT 1,
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `tutorial_id` bigint(3) NOT NULL,
  `no_of_images` int(3) DEFAULT NULL,
  `no_of_videos` int(3) DEFAULT NULL,
  `text` varchar(3) DEFAULT NULL,
  `category_id` bigint(3) NOT NULL COMMENT 'category type be subjects',
  `organisation_id` bigint(3) NOT NULL DEFAULT 1,
  `created_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(3) NOT NULL,
  `username` varchar(6) NOT NULL,
  `password` varchar(8) NOT NULL,
  `status` enum('verified','not-verified','blocked') NOT NULL,
  `last_login_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `user_type` enum('w','org') NOT NULL,
  `created_timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `update_timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `user_id` bigint(20) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `video_url`
--

CREATE TABLE `video_url` (
  `url` varchar(3) NOT NULL,
  `created_at` timestamp(3) NULL DEFAULT current_timestamp(3),
  `updated_at` timestamp(3) NOT NULL DEFAULT current_timestamp(3),
  `id_mapped` bigint(3) NOT NULL,
  `type` enum('skills','tutorials','hygiene','posts','story') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `women`
--

CREATE TABLE `women` (
  `woman_id` bigint(3) NOT NULL,
  `name` varchar(3) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `relationship_status` enum('s','m','d','w') NOT NULL,
  `date_of_birth` date NOT NULL,
  `language_preffered_id` bigint(3) NOT NULL,
  `address` varchar(3) NOT NULL,
  `description` varchar(3) DEFAULT NULL,
  `location_id` bigint(3) NOT NULL,
  `follower_count` bigint(3) NOT NULL DEFAULT 0,
  `following_count` bigint(3) DEFAULT 0,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(3) NOT NULL,
  `password` varchar(3) NOT NULL
) ;

--
-- Triggers `women`
--
DELIMITER $$
CREATE TRIGGER `women_age_check` BEFORE INSERT ON `women` FOR EACH ROW BEGIN
        IF TIMESTAMPDIFF(
            YEAR,
            NEW.date_of_birth,
            CURRENT_DATE
        ) < 18 THEN SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT
        ='Age must be greater than 18';
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `category_ngo`
--
ALTER TABLE `category_ngo`
  ADD KEY `ngo_ngo_relation` (`ngo_id`),
  ADD KEY `category_category_relation` (`category_id`);

--
-- Indexes for table `comments_posts`
--
ALTER TABLE `comments_posts`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_post_relation` (`post_id`),
  ADD KEY `comment_post_woman_relation` (`posted_by`);

--
-- Indexes for table `comments_skills`
--
ALTER TABLE `comments_skills`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_skill_woman` (`posted_by`),
  ADD KEY `comment_skill_skills` (`skill_id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `woman_followBY_relation` (`followed_by`),
  ADD KEY `woman_followTo_relation` (`followed_to`);

--
-- Indexes for table `hygiene`
--
ALTER TABLE `hygiene`
  ADD PRIMARY KEY (`hygiene_id`),
  ADD KEY `hygiene_category_relation` (`category_id`),
  ADD KEY `hygiene_organisation_relation` (`organisation_id`);

--
-- Indexes for table `image_url`
--
ALTER TABLE `image_url`
  ADD PRIMARY KEY (`id_mapped`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `lang_name` (`lang_name`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD UNIQUE KEY `location_name` (`location_name`);

--
-- Indexes for table `ngos`
--
ALTER TABLE `ngos`
  ADD PRIMARY KEY (`ngo_id`);

--
-- Indexes for table `organisations`
--
ALTER TABLE `organisations`
  ADD PRIMARY KEY (`org_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `regestration_number` (`regestration_number`),
  ADD UNIQUE KEY `owner_email` (`owner_email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `woman_post_relation` (`posted_by`),
  ADD KEY `category_post_relation` (`category_id`),
  ADD KEY `post_location_relation` (`location_id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `query_woman_relation` (`posted_by`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`),
  ADD KEY `skill_woman_relation` (`posted_by`),
  ADD KEY `skill_category_relation` (`category_id`),
  ADD KEY `skill_organisation_relation` (`organisation_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`story_id`),
  ADD KEY `story_organisation_relation` (`organisation_id`),
  ADD KEY `story_category_relation` (`category_id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`tutorial_id`),
  ADD KEY `tutorial_category_relation` (`category_id`),
  ADD KEY `tutorial_organisation_relation` (`organisation_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `women`
--
ALTER TABLE `women`
  ADD PRIMARY KEY (`woman_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `woman_location_relation` (`location_id`),
  ADD KEY `woman_language_relation` (`language_preffered_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments_posts`
--
ALTER TABLE `comments_posts`
  MODIFY `comment_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments_skills`
--
ALTER TABLE `comments_skills`
  MODIFY `comment_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `follow_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hygiene`
--
ALTER TABLE `hygiene`
  MODIFY `hygiene_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ngos`
--
ALTER TABLE `ngos`
  MODIFY `ngo_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organisations`
--
ALTER TABLE `organisations`
  MODIFY `org_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `query_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `story_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `tutorial_id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(3) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_ngo`
--
ALTER TABLE `category_ngo`
  ADD CONSTRAINT `category_category_relation` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `ngo_ngo_relation` FOREIGN KEY (`ngo_id`) REFERENCES `ngos` (`ngo_id`);

--
-- Constraints for table `comments_posts`
--
ALTER TABLE `comments_posts`
  ADD CONSTRAINT `comment_post_relation` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `comment_post_woman_relation` FOREIGN KEY (`posted_by`) REFERENCES `women` (`woman_id`);

--
-- Constraints for table `comments_skills`
--
ALTER TABLE `comments_skills`
  ADD CONSTRAINT `comment_skill_skills` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  ADD CONSTRAINT `comment_skill_woman` FOREIGN KEY (`posted_by`) REFERENCES `women` (`woman_id`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `woman_followBY_relation` FOREIGN KEY (`followed_by`) REFERENCES `women` (`woman_id`),
  ADD CONSTRAINT `woman_followTo_relation` FOREIGN KEY (`followed_to`) REFERENCES `women` (`woman_id`);

--
-- Constraints for table `hygiene`
--
ALTER TABLE `hygiene`
  ADD CONSTRAINT `hygiene_category_relation` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `hygiene_organisation_relation` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`org_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `category_post_relation` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `post_location_relation` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `woman_post_relation` FOREIGN KEY (`posted_by`) REFERENCES `women` (`woman_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `queries`
--
ALTER TABLE `queries`
  ADD CONSTRAINT `query_woman_relation` FOREIGN KEY (`posted_by`) REFERENCES `women` (`woman_id`);

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skill_category_relation` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `skill_organisation_relation` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`org_id`),
  ADD CONSTRAINT `skill_woman_relation` FOREIGN KEY (`posted_by`) REFERENCES `women` (`woman_id`);

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `story_category_relation` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `story_organisation_relation` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`org_id`);

--
-- Constraints for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD CONSTRAINT `tutorial_category_relation` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `tutorial_organisation_relation` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`org_id`);

--
-- Constraints for table `women`
--
ALTER TABLE `women`
  ADD CONSTRAINT `woman_language_relation` FOREIGN KEY (`language_preffered_id`) REFERENCES `languages` (`lang_id`),
  ADD CONSTRAINT `woman_location_relation` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
