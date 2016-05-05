-- phpMyAdmin SQL Dump
-- version 4.6.0deb1.trusty~ppa.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 05, 2016 at 05:30 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.6.20-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finny_live`
--

-- --------------------------------------------------------

--
-- Table structure for table `bal_admin_users`
--

CREATE TABLE `bal_admin_users` (
  `admin_user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_challenges`
--

CREATE TABLE `bal_challenges` (
  `challenge_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `domain_id` int(10) DEFAULT NULL,
  `request_id` int(10) NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `time_to_answer` int(4) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_challenge_child`
--

CREATE TABLE `bal_challenge_child` (
  `challenge_child_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `challenge_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_change_password_request`
--

CREATE TABLE `bal_change_password_request` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `verify_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `used` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_children`
--

CREATE TABLE `bal_children` (
  `child_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('B','G') DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `gpa` varchar(6) DEFAULT NULL,
  `grade_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `points` int(5) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `coppa_required` tinyint(1) NOT NULL DEFAULT '1',
  `coppa_approved` tinyint(1) NOT NULL DEFAULT '0',
  `coppa_accepted_once` tinyint(1) NOT NULL,
  `track_location` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` int(11) NOT NULL DEFAULT '0',
  `coppa_accepted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_children_coppa_reminder`
--

CREATE TABLE `bal_children_coppa_reminder` (
  `coppa_reminder_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `last_reminder` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reminder_count` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_default_learning_customization`
--

CREATE TABLE `bal_child_default_learning_customization` (
  `id` int(1) NOT NULL,
  `ask_question_after_every` int(5) DEFAULT NULL,
  `number_of_chances` int(2) DEFAULT NULL,
  `learning_type` enum('part') DEFAULT 'part',
  `lock_device_for` int(5) DEFAULT NULL,
  `weekly_goal` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_devices`
--

CREATE TABLE `bal_child_devices` (
  `child_device_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `device_name` varchar(200) NOT NULL,
  `email_id` varchar(200) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `device_lock_status` enum('LOCK','UNLOCK') DEFAULT 'UNLOCK',
  `phone_number` varchar(20) DEFAULT NULL,
  `unique_key` varchar(100) NOT NULL,
  `device_key` varchar(100) DEFAULT NULL,
  `device_configured` enum('Y','N') DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `device_monitored` enum('Y','N') NOT NULL DEFAULT 'Y',
  `device_removed` enum('Y','N') NOT NULL DEFAULT 'N',
  `registered_id` varchar(200) NOT NULL,
  `device_choose` enum('T','P') NOT NULL DEFAULT 'T',
  `device_type` varchar(100) DEFAULT NULL,
  `os_type` varchar(200) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_device_apps`
--

CREATE TABLE `bal_child_device_apps` (
  `app_id` int(10) NOT NULL,
  `child_device_id` int(10) NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL,
  `app_name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `package_name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `app_image` varchar(150) NOT NULL,
  `unproductive` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_device_app_log`
--

CREATE TABLE `bal_child_device_app_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `child_device_id` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_device_app_log_details`
--

CREATE TABLE `bal_child_device_app_log_details` (
  `log_details_id` int(11) NOT NULL,
  `log_id` int(10) UNSIGNED NOT NULL,
  `app_id` int(11) NOT NULL,
  `app_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_device_default_apps`
--

CREATE TABLE `bal_child_device_default_apps` (
  `id` int(10) NOT NULL,
  `app_name` varchar(150) NOT NULL,
  `package_name` varchar(150) NOT NULL,
  `is_productive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_device_relation`
--

CREATE TABLE `bal_child_device_relation` (
  `id` int(11) NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `is_associated` tinyint(1) NOT NULL DEFAULT '1',
  `date_association` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_unassociation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_goals`
--

CREATE TABLE `bal_child_goals` (
  `child_goal_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `question_popup_time` int(4) DEFAULT NULL,
  `number_of_questions` tinyint(4) DEFAULT NULL,
  `weekly_points` int(11) DEFAULT NULL,
  `unlock_time` int(10) NOT NULL DEFAULT '0',
  `learning_type` enum('part','perf') DEFAULT 'part',
  `is_interrupt` enum('Y','N') NOT NULL DEFAULT 'Y',
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `learnig_updated` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_grade_points`
--

CREATE TABLE `bal_child_grade_points` (
  `id` int(11) NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `grade_id` int(10) UNSIGNED NOT NULL,
  `points` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_parental_rewards`
--

CREATE TABLE `bal_child_parental_rewards` (
  `id` int(11) NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `child_points` int(11) NOT NULL DEFAULT '0',
  `reward_points` int(11) NOT NULL DEFAULT '0',
  `reward_title` varchar(255) NOT NULL,
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `is_achieved` tinyint(1) NOT NULL DEFAULT '0',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_questions`
--

CREATE TABLE `bal_child_questions` (
  `child_question_id` int(10) UNSIGNED NOT NULL,
  `child_device_id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `answered_option_id` int(10) UNSIGNED NOT NULL,
  `request_id` int(10) UNSIGNED NOT NULL,
  `points_offered` int(5) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_question_requests`
--

CREATE TABLE `bal_child_question_requests` (
  `request_id` int(10) UNSIGNED NOT NULL,
  `request_type` enum('Q','C','P','W') DEFAULT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `grade_id` int(10) DEFAULT NULL,
  `request_date` timestamp NULL DEFAULT NULL,
  `response_date` timestamp NULL DEFAULT NULL,
  `device_response_time` int(11) DEFAULT NULL,
  `response_points` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `points_type` enum('D','A','N') DEFAULT NULL COMMENT 'D= Answer is wrong,A=Answer is correct,N=Not answer yet',
  `longitude` varchar(30) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `reference_request_id` int(11) DEFAULT NULL,
  `turn` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_question_sequence`
--

CREATE TABLE `bal_child_question_sequence` (
  `sequence_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `sequence_number` int(4) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_question_sequence_track`
--

CREATE TABLE `bal_child_question_sequence_track` (
  `id` int(10) NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `current_sequence_number` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_redeem`
--

CREATE TABLE `bal_child_redeem` (
  `id` int(10) NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `child_device_id` int(10) NOT NULL,
  `points_redeemed` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_subjects`
--

CREATE TABLE `bal_child_subjects` (
  `child_subject_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `domain_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_trophies`
--

CREATE TABLE `bal_child_trophies` (
  `child_trophy_id` int(10) UNSIGNED NOT NULL,
  `trophy_id` int(11) NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grade_id` int(10) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `image` varchar(100) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `streak` int(11) DEFAULT NULL,
  `type` enum('SO','SS','TO','TS') DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT '1',
  `awarded_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_weekly_goals`
--

CREATE TABLE `bal_child_weekly_goals` (
  `weekly_goals_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `goal_points` int(11) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` enum('A','M','NA','E') DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `closed` enum('Y','N') DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `weekly_goal_points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_child_weekly_goal_stats`
--

CREATE TABLE `bal_child_weekly_goal_stats` (
  `id` int(10) UNSIGNED NOT NULL,
  `weekly_goal_id` int(10) UNSIGNED NOT NULL,
  `total_points_achieved` int(11) DEFAULT NULL,
  `total_question_asked` int(11) DEFAULT NULL,
  `total_correct_answer` int(11) DEFAULT NULL,
  `total_incorrect_answer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_countrycode`
--

CREATE TABLE `bal_countrycode` (
  `id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `short_code` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_device_info`
--

CREATE TABLE `bal_device_info` (
  `device_id` int(11) NOT NULL,
  `device_name` varchar(200) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `device_lock_status` enum('LOCK','UNLOCK') DEFAULT 'UNLOCK',
  `device_key` varchar(100) DEFAULT NULL,
  `device_monitored` enum('Y','N') DEFAULT 'Y',
  `device_removed` enum('Y','N') DEFAULT 'N',
  `registered_id` varchar(200) DEFAULT NULL,
  `device_type` varchar(100) DEFAULT NULL,
  `os_type` varchar(200) DEFAULT NULL,
  `client_type` enum('IOS','ANDROID') NOT NULL DEFAULT 'ANDROID' COMMENT 'This is client type which we use to send push notifaction',
  `version` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(200) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_faq`
--

CREATE TABLE `bal_faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `sort_order` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_grades`
--

CREATE TABLE `bal_grades` (
  `grades_id` int(10) UNSIGNED NOT NULL,
  `grade_name` varchar(45) DEFAULT NULL,
  `previous_grade` int(10) UNSIGNED ZEROFILL NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_images`
--

CREATE TABLE `bal_images` (
  `id` int(11) NOT NULL,
  `image_title` varchar(100) DEFAULT NULL,
  `image_name` varchar(100) DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_lc_lock_duration`
--

CREATE TABLE `bal_lc_lock_duration` (
  `id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_lc_question_count`
--

CREATE TABLE `bal_lc_question_count` (
  `id` int(11) NOT NULL,
  `question_count` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_leader_board_overall`
--

CREATE TABLE `bal_leader_board_overall` (
  `id` int(11) NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `grade_id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `gender` enum('B','G') DEFAULT NULL,
  `points` int(11) NOT NULL,
  `rank` int(3) NOT NULL,
  `position` int(3) NOT NULL,
  `response_date` datetime NOT NULL,
  `last_updated` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_leader_board_today`
--

CREATE TABLE `bal_leader_board_today` (
  `id` int(11) NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `grade_id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `gender` enum('B','G') DEFAULT NULL,
  `points` int(11) NOT NULL,
  `rank` int(3) NOT NULL,
  `position` int(3) NOT NULL,
  `response_date` datetime NOT NULL,
  `last_updated` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_leader_board_weekly`
--

CREATE TABLE `bal_leader_board_weekly` (
  `id` int(11) NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `grade_id` int(10) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `gender` enum('B','G') DEFAULT NULL,
  `points` int(11) NOT NULL,
  `rank` int(3) NOT NULL,
  `position` int(3) NOT NULL,
  `response_date` datetime NOT NULL,
  `last_updated` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_pages`
--

CREATE TABLE `bal_pages` (
  `page_id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `alias` varchar(30) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_parents`
--

CREATE TABLE `bal_parents` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `parentDob` date DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `parent_type` enum('M','D') DEFAULT NULL,
  `parent_image` varchar(250) DEFAULT NULL,
  `timezone_id` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bal_parents_deleted`
--

CREATE TABLE `bal_parents_deleted` (
  `deleted_id` int(10) UNSIGNED NOT NULL,
  `parent_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores email and date-time of parent accounts deleted by script manually';

-- --------------------------------------------------------

--
-- Table structure for table `bal_parent_custom_message`
--

CREATE TABLE `bal_parent_custom_message` (
  `custom_message_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(250) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_parent_device_apps`
--

CREATE TABLE `bal_parent_device_apps` (
  `app_id` int(11) NOT NULL,
  `parent_id` int(11) UNSIGNED NOT NULL,
  `device_id` int(11) NOT NULL,
  `app_name` varchar(150) NOT NULL,
  `package_name` varchar(150) NOT NULL,
  `app_image` varchar(150) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_parent_device_relation`
--

CREATE TABLE `bal_parent_device_relation` (
  `id` int(11) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `access_token` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_parent_emails`
--

CREATE TABLE `bal_parent_emails` (
  `email_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `verification_code` varchar(45) DEFAULT NULL,
  `verified` enum('Y','N') DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_parent_notification`
--

CREATE TABLE `bal_parent_notification` (
  `notification_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `notification_type` enum('APPUN','APPAR','APPIN','APPADMRM','REDEEM','UNLOCK','TROPHY','WAGER','IMAGE','LOCK','WEEKLYGOAL','SENDCHALLENGE','PAIR','NEW_SUBJECT','REWARD','COPPA') DEFAULT NULL COMMENT 'APPUN => app uninstalled, APPAR => app admin removed',
  `description` varchar(255) DEFAULT NULL,
  `seen_by_user` enum('Y','N') DEFAULT 'N',
  `deleted` enum('Y','N') DEFAULT 'N',
  `child_device_id` int(10) UNSIGNED NOT NULL,
  `childe_name` varchar(150) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_parent_notification_status`
--

CREATE TABLE `bal_parent_notification_status` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_parent_safe_number`
--

CREATE TABLE `bal_parent_safe_number` (
  `safe_number_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `number` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_phone_spent_time_log`
--

CREATE TABLE `bal_phone_spent_time_log` (
  `id` int(11) NOT NULL,
  `child_device_id` int(11) NOT NULL,
  `child_id` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `duration` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_questions`
--

CREATE TABLE `bal_questions` (
  `bal_question_id` int(10) NOT NULL,
  `question` text NOT NULL,
  `question_equation` text,
  `question_equation_image` text,
  `question_equation_image_name` text,
  `difficulty_level` char(3) DEFAULT NULL,
  `grade_id` int(10) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `url_of_question` varchar(600) DEFAULT NULL,
  `question_image_url` text,
  `answer_image_url` varchar(600) DEFAULT NULL,
  `explanation` text,
  `explanation_equation` text,
  `explanation_equation_image` text,
  `explanation_equation_image_name` text,
  `answer_explanation` text,
  `answer_explanation_equation` text,
  `answer_explanation_image_name` text,
  `set_question` char(3) DEFAULT NULL,
  `refer_book_name` varchar(600) DEFAULT NULL,
  `refer_book_chapter` varchar(135) DEFAULT NULL,
  `refer_article_url` varchar(600) DEFAULT NULL,
  `wolframalphaquery` varchar(300) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_approved` char(3) DEFAULT 'N',
  `modified_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(135) DEFAULT NULL,
  `modified_by` varchar(135) DEFAULT NULL,
  `created_byid` int(11) DEFAULT NULL,
  `modified_byid` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_question` char(3) DEFAULT NULL,
  `copy_created` char(3) DEFAULT NULL,
  `approved_by` varchar(135) DEFAULT NULL,
  `approved_byid` int(11) DEFAULT NULL,
  `approved_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `question_display` text,
  `question_equation_images` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_questions_Aug_27_2015`
--

CREATE TABLE `bal_questions_Aug_27_2015` (
  `bal_question_id` int(10) NOT NULL,
  `question` text NOT NULL,
  `question_equation` text,
  `question_equation_image` text,
  `question_equation_image_name` text,
  `difficulty_level` char(3) DEFAULT NULL,
  `grade_id` int(10) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `url_of_question` varchar(600) DEFAULT NULL,
  `question_image_url` text,
  `answer_image_url` varchar(600) DEFAULT NULL,
  `explanation` text,
  `explanation_equation` text,
  `explanation_equation_image` text,
  `explanation_equation_image_name` text,
  `answer_explanation` text,
  `answer_explanation_equation` text,
  `answer_explanation_image_name` text,
  `set_question` char(3) DEFAULT NULL,
  `refer_book_name` varchar(600) DEFAULT NULL,
  `refer_book_chapter` varchar(135) DEFAULT NULL,
  `refer_article_url` varchar(600) DEFAULT NULL,
  `wolframalphaquery` varchar(300) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_approved` char(3) DEFAULT 'N',
  `modified_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(135) DEFAULT NULL,
  `modified_by` varchar(135) DEFAULT NULL,
  `created_byid` int(11) DEFAULT NULL,
  `modified_byid` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_question` char(3) DEFAULT NULL,
  `copy_created` char(3) DEFAULT NULL,
  `approved_by` varchar(135) DEFAULT NULL,
  `approved_byid` int(11) DEFAULT NULL,
  `approved_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `question_display` text,
  `question_equation_images` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_question_categories`
--

CREATE TABLE `bal_question_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `standard_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `domain_id` int(10) UNSIGNED NOT NULL,
  `subtopic_code` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtopic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `psv_code` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `headline` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified_by` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_question_category_grades`
--

CREATE TABLE `bal_question_category_grades` (
  `category_grade_id` int(10) UNSIGNED NOT NULL,
  `grade_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_question_domains`
--

CREATE TABLE `bal_question_domains` (
  `domain_id` int(10) UNSIGNED NOT NULL,
  `code` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_question_options`
--

CREATE TABLE `bal_question_options` (
  `question_option_id` int(10) NOT NULL,
  `option` text NOT NULL,
  `option_equation` text,
  `option_equation_image` text,
  `option_equation_image_name` text,
  `question_id` int(10) DEFAULT NULL,
  `answer` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_standards`
--

CREATE TABLE `bal_standards` (
  `standard_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bal_streak_subject_trophies`
--

CREATE TABLE `bal_streak_subject_trophies` (
  `streak_subject_trophy_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `streak` int(11) NOT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A' COMMENT 'A = trophy is active, I= Trophy has been deleted',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_streak_trophy`
--

CREATE TABLE `bal_streak_trophy` (
  `streak_trophy_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `streak` int(11) NOT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A' COMMENT 'A = trophy is active, I= Trophy has been deleted',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_subjects`
--

CREATE TABLE `bal_subjects` (
  `subject_id` int(10) UNSIGNED NOT NULL,
  `subject_name` varchar(45) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_subject_grades`
--

CREATE TABLE `bal_subject_grades` (
  `subject_grade_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `grade_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_subject_trophies`
--

CREATE TABLE `bal_subject_trophies` (
  `subject_trophy_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `image` varchar(100) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A' COMMENT 'A = trophy is active, I= Trophy has been deleted',
  `grade_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_subscribers`
--

CREATE TABLE `bal_subscribers` (
  `id` int(11) NOT NULL,
  `emailid` varchar(200) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_timezone`
--

CREATE TABLE `bal_timezone` (
  `timezone_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value_php` varchar(255) NOT NULL,
  `value_mysql` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_trophies`
--

CREATE TABLE `bal_trophies` (
  `trophy_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `image` varchar(100) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `status` enum('A','I') NOT NULL DEFAULT 'A' COMMENT 'A = trophy is active, I= Trophy has been deleted',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_users`
--

CREATE TABLE `bal_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pin` int(11) DEFAULT NULL,
  `verification_code` varchar(45) DEFAULT NULL,
  `email_verifiied` enum('Y','N') DEFAULT 'N',
  `new_user` enum('Y','N') DEFAULT 'Y',
  `created_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_user_remember_me_token`
--

CREATE TABLE `bal_user_remember_me_token` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_email` varchar(100) NOT NULL COMMENT 'email of the user from bal_users table',
  `user_identifier` varchar(255) NOT NULL COMMENT 'an identifier which is unique for every user',
  `user_token` varchar(255) NOT NULL COMMENT 'combination of user_id and series identifier is saved as token and is presented to the user as cookie',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bal_video`
--

CREATE TABLE `bal_video` (
  `id` int(11) NOT NULL,
  `video_title` varchar(100) CHARACTER SET latin1 NOT NULL,
  `video_file` varchar(100) CHARACTER SET latin1 NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_url` varchar(500) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bal_admin_users`
--
ALTER TABLE `bal_admin_users`
  ADD PRIMARY KEY (`admin_user_id`);

--
-- Indexes for table `bal_challenges`
--
ALTER TABLE `bal_challenges`
  ADD PRIMARY KEY (`challenge_id`),
  ADD KEY `FK_bal_challenges` (`parent_id`);

--
-- Indexes for table `bal_challenge_child`
--
ALTER TABLE `bal_challenge_child`
  ADD PRIMARY KEY (`challenge_child_id`),
  ADD KEY `fk_bal_challenge_child_child_id` (`child_id`),
  ADD KEY `fk_bal_challenge_child_challenge_id` (`challenge_id`);

--
-- Indexes for table `bal_change_password_request`
--
ALTER TABLE `bal_change_password_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `bal_children`
--
ALTER TABLE `bal_children`
  ADD PRIMARY KEY (`child_id`),
  ADD KEY `fk_bal_childrent_grade_id` (`grade_id`),
  ADD KEY `fk_bal_children_parent_id` (`parent_id`);

--
-- Indexes for table `bal_children_coppa_reminder`
--
ALTER TABLE `bal_children_coppa_reminder`
  ADD PRIMARY KEY (`coppa_reminder_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `bal_child_default_learning_customization`
--
ALTER TABLE `bal_child_default_learning_customization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_child_devices`
--
ALTER TABLE `bal_child_devices`
  ADD PRIMARY KEY (`child_device_id`),
  ADD KEY `fk_bal_child_devices_child_id` (`child_id`);

--
-- Indexes for table `bal_child_device_apps`
--
ALTER TABLE `bal_child_device_apps`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `FKC_bal_child_device_apps` (`child_id`);

--
-- Indexes for table `bal_child_device_app_log`
--
ALTER TABLE `bal_child_device_app_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_bal_child_device_app_log_childe_device_id` (`child_device_id`),
  ADD KEY `FKC_bal_child_device_app_log` (`child_id`);

--
-- Indexes for table `bal_child_device_app_log_details`
--
ALTER TABLE `bal_child_device_app_log_details`
  ADD PRIMARY KEY (`log_details_id`),
  ADD KEY `fk_bal_child_device_app_log_details_log_id` (`log_id`);

--
-- Indexes for table `bal_child_device_default_apps`
--
ALTER TABLE `bal_child_device_default_apps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_child_device_relation`
--
ALTER TABLE `bal_child_device_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKC_bal_child_device_relation` (`child_id`);

--
-- Indexes for table `bal_child_goals`
--
ALTER TABLE `bal_child_goals`
  ADD PRIMARY KEY (`child_goal_id`),
  ADD KEY `fk_bal_child_goals_child_id` (`child_id`);

--
-- Indexes for table `bal_child_grade_points`
--
ALTER TABLE `bal_child_grade_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKC_bal_child_grade_points` (`child_id`);

--
-- Indexes for table `bal_child_parental_rewards`
--
ALTER TABLE `bal_child_parental_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `bal_child_questions`
--
ALTER TABLE `bal_child_questions`
  ADD PRIMARY KEY (`child_question_id`),
  ADD KEY `fk_bal_child_questions_child_device_id` (`child_device_id`),
  ADD KEY `fk_bal_child_questions_question_id` (`question_id`),
  ADD KEY `fk_bal_child_questions_answerd_option_id` (`answered_option_id`),
  ADD KEY `FK_bal_child_questions_request_id` (`request_id`),
  ADD KEY `qId` (`question_id`),
  ADD KEY `rId` (`request_id`);

--
-- Indexes for table `bal_child_question_requests`
--
ALTER TABLE `bal_child_question_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_bal_child_question_requests_child_id` (`child_id`),
  ADD KEY `rId` (`request_id`);

--
-- Indexes for table `bal_child_question_sequence`
--
ALTER TABLE `bal_child_question_sequence`
  ADD PRIMARY KEY (`sequence_id`),
  ADD KEY `FKC_bal_child_question_sequence` (`child_id`);

--
-- Indexes for table `bal_child_question_sequence_track`
--
ALTER TABLE `bal_child_question_sequence_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bal_child_question_sequence_track_child_id` (`child_id`);

--
-- Indexes for table `bal_child_redeem`
--
ALTER TABLE `bal_child_redeem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKC_bal_child_redeem` (`child_id`);

--
-- Indexes for table `bal_child_subjects`
--
ALTER TABLE `bal_child_subjects`
  ADD PRIMARY KEY (`child_subject_id`),
  ADD KEY `fk_bal_child_subjects_child_id` (`child_id`),
  ADD KEY `fk_bal_child_subjects_subject_id` (`subject_id`);

--
-- Indexes for table `bal_child_trophies`
--
ALTER TABLE `bal_child_trophies`
  ADD PRIMARY KEY (`child_trophy_id`),
  ADD KEY `FKC_bal_child_trophies` (`child_id`);

--
-- Indexes for table `bal_child_weekly_goals`
--
ALTER TABLE `bal_child_weekly_goals`
  ADD PRIMARY KEY (`weekly_goals_id`),
  ADD KEY `fk_bal_child_weekly_goals_child_id` (`child_id`);

--
-- Indexes for table `bal_child_weekly_goal_stats`
--
ALTER TABLE `bal_child_weekly_goal_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bal_child_weekly_goal_stats_weekly_goal_id` (`weekly_goal_id`);

--
-- Indexes for table `bal_countrycode`
--
ALTER TABLE `bal_countrycode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_device_info`
--
ALTER TABLE `bal_device_info`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `bal_faq`
--
ALTER TABLE `bal_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_grades`
--
ALTER TABLE `bal_grades`
  ADD PRIMARY KEY (`grades_id`);

--
-- Indexes for table `bal_images`
--
ALTER TABLE `bal_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_lc_lock_duration`
--
ALTER TABLE `bal_lc_lock_duration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_lc_question_count`
--
ALTER TABLE `bal_lc_question_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_leader_board_overall`
--
ALTER TABLE `bal_leader_board_overall`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_child_grade` (`child_id`,`grade_id`);

--
-- Indexes for table `bal_leader_board_today`
--
ALTER TABLE `bal_leader_board_today`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_child_grade` (`child_id`,`grade_id`);

--
-- Indexes for table `bal_leader_board_weekly`
--
ALTER TABLE `bal_leader_board_weekly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_child_grade` (`child_id`,`grade_id`);

--
-- Indexes for table `bal_pages`
--
ALTER TABLE `bal_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `bal_parents`
--
ALTER TABLE `bal_parents`
  ADD PRIMARY KEY (`parent_id`),
  ADD KEY `fk_bal_parents_user_id` (`user_id`);

--
-- Indexes for table `bal_parents_deleted`
--
ALTER TABLE `bal_parents_deleted`
  ADD PRIMARY KEY (`deleted_id`);

--
-- Indexes for table `bal_parent_custom_message`
--
ALTER TABLE `bal_parent_custom_message`
  ADD PRIMARY KEY (`custom_message_id`),
  ADD KEY `FK_bal_custom_message_parent` (`parent_id`),
  ADD KEY `FKC_bal_parent_custom_message` (`child_id`);

--
-- Indexes for table `bal_parent_device_apps`
--
ALTER TABLE `bal_parent_device_apps`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `FK_bal_parent_device_apps_parent` (`parent_id`);

--
-- Indexes for table `bal_parent_device_relation`
--
ALTER TABLE `bal_parent_device_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_bal_parent_device_relation` (`parent_id`);

--
-- Indexes for table `bal_parent_emails`
--
ALTER TABLE `bal_parent_emails`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `fk_bal_parent_emails_parent_id` (`parent_id`);

--
-- Indexes for table `bal_parent_notification`
--
ALTER TABLE `bal_parent_notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_bal_parent_notification_user_id` (`user_id`),
  ADD KEY `fk_bal_parent_notification_child_device_id` (`child_device_id`),
  ADD KEY `FKC_bal_parent_notification` (`child_id`);

--
-- Indexes for table `bal_parent_notification_status`
--
ALTER TABLE `bal_parent_notification_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_parent_safe_number`
--
ALTER TABLE `bal_parent_safe_number`
  ADD PRIMARY KEY (`safe_number_id`),
  ADD KEY `fk_bal_parent_safe_number_parent_id` (`parent_id`);

--
-- Indexes for table `bal_phone_spent_time_log`
--
ALTER TABLE `bal_phone_spent_time_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKC_bal_phone_spent_time_log` (`child_id`);

--
-- Indexes for table `bal_questions`
--
ALTER TABLE `bal_questions`
  ADD PRIMARY KEY (`bal_question_id`),
  ADD KEY `qId` (`bal_question_id`),
  ADD KEY `cId` (`category_id`),
  ADD KEY `gId` (`grade_id`);

--
-- Indexes for table `bal_questions_Aug_27_2015`
--
ALTER TABLE `bal_questions_Aug_27_2015`
  ADD PRIMARY KEY (`bal_question_id`),
  ADD KEY `qId` (`bal_question_id`),
  ADD KEY `cId` (`category_id`),
  ADD KEY `gId` (`grade_id`);

--
-- Indexes for table `bal_question_categories`
--
ALTER TABLE `bal_question_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_code` (`category_code`),
  ADD UNIQUE KEY `category_code_2` (`category_code`),
  ADD UNIQUE KEY `category_code_3` (`category_code`),
  ADD UNIQUE KEY `category_code_4` (`category_code`),
  ADD KEY `fk_bal_question_categories_subject_id` (`subject_id`),
  ADD KEY `fk_bal_question_categories_domain_id` (`domain_id`),
  ADD KEY `fk_bal_question_categories_standard_id` (`standard_id`),
  ADD KEY `cId` (`category_id`);

--
-- Indexes for table `bal_question_category_grades`
--
ALTER TABLE `bal_question_category_grades`
  ADD PRIMARY KEY (`category_grade_id`),
  ADD KEY `fk_bal_question_category_grades_grade_id` (`grade_id`),
  ADD KEY `fk_bal_question_category_grades_category_id` (`category_id`),
  ADD KEY `cId` (`category_id`);

--
-- Indexes for table `bal_question_domains`
--
ALTER TABLE `bal_question_domains`
  ADD PRIMARY KEY (`domain_id`),
  ADD KEY `dId` (`domain_id`);

--
-- Indexes for table `bal_question_options`
--
ALTER TABLE `bal_question_options`
  ADD PRIMARY KEY (`question_option_id`),
  ADD KEY `qId` (`question_id`);

--
-- Indexes for table `bal_standards`
--
ALTER TABLE `bal_standards`
  ADD PRIMARY KEY (`standard_id`);

--
-- Indexes for table `bal_streak_subject_trophies`
--
ALTER TABLE `bal_streak_subject_trophies`
  ADD PRIMARY KEY (`streak_subject_trophy_id`);

--
-- Indexes for table `bal_streak_trophy`
--
ALTER TABLE `bal_streak_trophy`
  ADD PRIMARY KEY (`streak_trophy_id`);

--
-- Indexes for table `bal_subjects`
--
ALTER TABLE `bal_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `bal_subject_grades`
--
ALTER TABLE `bal_subject_grades`
  ADD PRIMARY KEY (`subject_grade_id`),
  ADD KEY `fk_bal_subject_grades_subject_id` (`subject_id`),
  ADD KEY `fk_bal_subject_grades_grade_id` (`grade_id`);

--
-- Indexes for table `bal_subject_trophies`
--
ALTER TABLE `bal_subject_trophies`
  ADD PRIMARY KEY (`subject_trophy_id`);

--
-- Indexes for table `bal_subscribers`
--
ALTER TABLE `bal_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_timezone`
--
ALTER TABLE `bal_timezone`
  ADD PRIMARY KEY (`timezone_id`);

--
-- Indexes for table `bal_trophies`
--
ALTER TABLE `bal_trophies`
  ADD PRIMARY KEY (`trophy_id`);

--
-- Indexes for table `bal_users`
--
ALTER TABLE `bal_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bal_user_remember_me_token`
--
ALTER TABLE `bal_user_remember_me_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bal_video`
--
ALTER TABLE `bal_video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bal_admin_users`
--
ALTER TABLE `bal_admin_users`
  MODIFY `admin_user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `bal_challenges`
--
ALTER TABLE `bal_challenges`
  MODIFY `challenge_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;
--
-- AUTO_INCREMENT for table `bal_challenge_child`
--
ALTER TABLE `bal_challenge_child`
  MODIFY `challenge_child_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bal_change_password_request`
--
ALTER TABLE `bal_change_password_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;
--
-- AUTO_INCREMENT for table `bal_children`
--
ALTER TABLE `bal_children`
  MODIFY `child_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1175;
--
-- AUTO_INCREMENT for table `bal_children_coppa_reminder`
--
ALTER TABLE `bal_children_coppa_reminder`
  MODIFY `coppa_reminder_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `bal_child_devices`
--
ALTER TABLE `bal_child_devices`
  MODIFY `child_device_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bal_child_device_apps`
--
ALTER TABLE `bal_child_device_apps`
  MODIFY `app_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=763985;
--
-- AUTO_INCREMENT for table `bal_child_device_app_log`
--
ALTER TABLE `bal_child_device_app_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328297;
--
-- AUTO_INCREMENT for table `bal_child_device_app_log_details`
--
ALTER TABLE `bal_child_device_app_log_details`
  MODIFY `log_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328297;
--
-- AUTO_INCREMENT for table `bal_child_device_default_apps`
--
ALTER TABLE `bal_child_device_default_apps`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `bal_child_device_relation`
--
ALTER TABLE `bal_child_device_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1342;
--
-- AUTO_INCREMENT for table `bal_child_goals`
--
ALTER TABLE `bal_child_goals`
  MODIFY `child_goal_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1173;
--
-- AUTO_INCREMENT for table `bal_child_grade_points`
--
ALTER TABLE `bal_child_grade_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1278;
--
-- AUTO_INCREMENT for table `bal_child_parental_rewards`
--
ALTER TABLE `bal_child_parental_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `bal_child_questions`
--
ALTER TABLE `bal_child_questions`
  MODIFY `child_question_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175367;
--
-- AUTO_INCREMENT for table `bal_child_question_requests`
--
ALTER TABLE `bal_child_question_requests`
  MODIFY `request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175494;
--
-- AUTO_INCREMENT for table `bal_child_question_sequence`
--
ALTER TABLE `bal_child_question_sequence`
  MODIFY `sequence_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359713;
--
-- AUTO_INCREMENT for table `bal_child_question_sequence_track`
--
ALTER TABLE `bal_child_question_sequence_track`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1820;
--
-- AUTO_INCREMENT for table `bal_child_redeem`
--
ALTER TABLE `bal_child_redeem`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=804;
--
-- AUTO_INCREMENT for table `bal_child_subjects`
--
ALTER TABLE `bal_child_subjects`
  MODIFY `child_subject_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43795;
--
-- AUTO_INCREMENT for table `bal_child_trophies`
--
ALTER TABLE `bal_child_trophies`
  MODIFY `child_trophy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1891;
--
-- AUTO_INCREMENT for table `bal_child_weekly_goals`
--
ALTER TABLE `bal_child_weekly_goals`
  MODIFY `weekly_goals_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `bal_child_weekly_goal_stats`
--
ALTER TABLE `bal_child_weekly_goal_stats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bal_countrycode`
--
ALTER TABLE `bal_countrycode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;
--
-- AUTO_INCREMENT for table `bal_device_info`
--
ALTER TABLE `bal_device_info`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;
--
-- AUTO_INCREMENT for table `bal_faq`
--
ALTER TABLE `bal_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `bal_grades`
--
ALTER TABLE `bal_grades`
  MODIFY `grades_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `bal_images`
--
ALTER TABLE `bal_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bal_lc_lock_duration`
--
ALTER TABLE `bal_lc_lock_duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `bal_lc_question_count`
--
ALTER TABLE `bal_lc_question_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `bal_leader_board_overall`
--
ALTER TABLE `bal_leader_board_overall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `bal_leader_board_today`
--
ALTER TABLE `bal_leader_board_today`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `bal_leader_board_weekly`
--
ALTER TABLE `bal_leader_board_weekly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `bal_pages`
--
ALTER TABLE `bal_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `bal_parents`
--
ALTER TABLE `bal_parents`
  MODIFY `parent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=805;
--
-- AUTO_INCREMENT for table `bal_parents_deleted`
--
ALTER TABLE `bal_parents_deleted`
  MODIFY `deleted_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `bal_parent_custom_message`
--
ALTER TABLE `bal_parent_custom_message`
  MODIFY `custom_message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `bal_parent_device_apps`
--
ALTER TABLE `bal_parent_device_apps`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55112;
--
-- AUTO_INCREMENT for table `bal_parent_device_relation`
--
ALTER TABLE `bal_parent_device_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1385;
--
-- AUTO_INCREMENT for table `bal_parent_emails`
--
ALTER TABLE `bal_parent_emails`
  MODIFY `email_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=805;
--
-- AUTO_INCREMENT for table `bal_parent_notification`
--
ALTER TABLE `bal_parent_notification`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35858;
--
-- AUTO_INCREMENT for table `bal_parent_notification_status`
--
ALTER TABLE `bal_parent_notification_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2316;
--
-- AUTO_INCREMENT for table `bal_parent_safe_number`
--
ALTER TABLE `bal_parent_safe_number`
  MODIFY `safe_number_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `bal_phone_spent_time_log`
--
ALTER TABLE `bal_phone_spent_time_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7412;
--
-- AUTO_INCREMENT for table `bal_questions`
--
ALTER TABLE `bal_questions`
  MODIFY `bal_question_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16479;
--
-- AUTO_INCREMENT for table `bal_questions_Aug_27_2015`
--
ALTER TABLE `bal_questions_Aug_27_2015`
  MODIFY `bal_question_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15079;
--
-- AUTO_INCREMENT for table `bal_question_categories`
--
ALTER TABLE `bal_question_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1524;
--
-- AUTO_INCREMENT for table `bal_question_category_grades`
--
ALTER TABLE `bal_question_category_grades`
  MODIFY `category_grade_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3090;
--
-- AUTO_INCREMENT for table `bal_question_domains`
--
ALTER TABLE `bal_question_domains`
  MODIFY `domain_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `bal_question_options`
--
ALTER TABLE `bal_question_options`
  MODIFY `question_option_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65913;
--
-- AUTO_INCREMENT for table `bal_standards`
--
ALTER TABLE `bal_standards`
  MODIFY `standard_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bal_streak_subject_trophies`
--
ALTER TABLE `bal_streak_subject_trophies`
  MODIFY `streak_subject_trophy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `bal_streak_trophy`
--
ALTER TABLE `bal_streak_trophy`
  MODIFY `streak_trophy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `bal_subjects`
--
ALTER TABLE `bal_subjects`
  MODIFY `subject_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `bal_subject_grades`
--
ALTER TABLE `bal_subject_grades`
  MODIFY `subject_grade_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bal_subject_trophies`
--
ALTER TABLE `bal_subject_trophies`
  MODIFY `subject_trophy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;
--
-- AUTO_INCREMENT for table `bal_subscribers`
--
ALTER TABLE `bal_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;
--
-- AUTO_INCREMENT for table `bal_timezone`
--
ALTER TABLE `bal_timezone`
  MODIFY `timezone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `bal_trophies`
--
ALTER TABLE `bal_trophies`
  MODIFY `trophy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `bal_users`
--
ALTER TABLE `bal_users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=805;
--
-- AUTO_INCREMENT for table `bal_user_remember_me_token`
--
ALTER TABLE `bal_user_remember_me_token`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `bal_video`
--
ALTER TABLE `bal_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bal_challenges`
--
ALTER TABLE `bal_challenges`
  ADD CONSTRAINT `FK_bal_challenges` FOREIGN KEY (`parent_id`) REFERENCES `bal_parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_challenge_child`
--
ALTER TABLE `bal_challenge_child`
  ADD CONSTRAINT `FKC_bal_challenge_child` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_children`
--
ALTER TABLE `bal_children`
  ADD CONSTRAINT `FK_bal_children_parent` FOREIGN KEY (`parent_id`) REFERENCES `bal_parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_devices`
--
ALTER TABLE `bal_child_devices`
  ADD CONSTRAINT `FKC_bal_child_devices` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_device_apps`
--
ALTER TABLE `bal_child_device_apps`
  ADD CONSTRAINT `FKC_bal_child_device_apps` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_device_app_log`
--
ALTER TABLE `bal_child_device_app_log`
  ADD CONSTRAINT `FKC_bal_child_device_app_log` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_device_relation`
--
ALTER TABLE `bal_child_device_relation`
  ADD CONSTRAINT `FKC_bal_child_device_relation` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_goals`
--
ALTER TABLE `bal_child_goals`
  ADD CONSTRAINT `FKC_bal_child_goals` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_grade_points`
--
ALTER TABLE `bal_child_grade_points`
  ADD CONSTRAINT `FKC_bal_child_grade_points` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_parental_rewards`
--
ALTER TABLE `bal_child_parental_rewards`
  ADD CONSTRAINT `FKC_bal_child_parental_rewards` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_question_requests`
--
ALTER TABLE `bal_child_question_requests`
  ADD CONSTRAINT `FKC_bal_child_question_requests` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_question_sequence`
--
ALTER TABLE `bal_child_question_sequence`
  ADD CONSTRAINT `FKC_bal_child_question_sequence` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_question_sequence_track`
--
ALTER TABLE `bal_child_question_sequence_track`
  ADD CONSTRAINT `FKC_bal_child_question_sequence_track` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_redeem`
--
ALTER TABLE `bal_child_redeem`
  ADD CONSTRAINT `FKC_bal_child_redeem` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_subjects`
--
ALTER TABLE `bal_child_subjects`
  ADD CONSTRAINT `FKC_bal_child_subjects` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_trophies`
--
ALTER TABLE `bal_child_trophies`
  ADD CONSTRAINT `FKC_bal_child_trophies` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_child_weekly_goals`
--
ALTER TABLE `bal_child_weekly_goals`
  ADD CONSTRAINT `FKC_bal_child_weekly_goals` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_leader_board_overall`
--
ALTER TABLE `bal_leader_board_overall`
  ADD CONSTRAINT `FKC_bal_leader_board_overall` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_leader_board_today`
--
ALTER TABLE `bal_leader_board_today`
  ADD CONSTRAINT `FKC_bal_leader_board_today` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_leader_board_weekly`
--
ALTER TABLE `bal_leader_board_weekly`
  ADD CONSTRAINT `FKC_bal_leader_board_weekly` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_parents`
--
ALTER TABLE `bal_parents`
  ADD CONSTRAINT `FK_bal_parents` FOREIGN KEY (`parent_id`) REFERENCES `bal_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_parent_custom_message`
--
ALTER TABLE `bal_parent_custom_message`
  ADD CONSTRAINT `FKC_bal_parent_custom_message` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_bal_custom_message_parent` FOREIGN KEY (`parent_id`) REFERENCES `bal_parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_parent_device_apps`
--
ALTER TABLE `bal_parent_device_apps`
  ADD CONSTRAINT `FK_bal_parent_device_apps_parent` FOREIGN KEY (`parent_id`) REFERENCES `bal_parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_parent_device_relation`
--
ALTER TABLE `bal_parent_device_relation`
  ADD CONSTRAINT `FK_bal_parent_device_relation` FOREIGN KEY (`parent_id`) REFERENCES `bal_parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_parent_emails`
--
ALTER TABLE `bal_parent_emails`
  ADD CONSTRAINT `FK_bal_parent_emails` FOREIGN KEY (`parent_id`) REFERENCES `bal_parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_parent_notification`
--
ALTER TABLE `bal_parent_notification`
  ADD CONSTRAINT `FKC_bal_parent_notification` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_parent_safe_number`
--
ALTER TABLE `bal_parent_safe_number`
  ADD CONSTRAINT `FK_bal_parent_safe_number` FOREIGN KEY (`parent_id`) REFERENCES `bal_parents` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bal_phone_spent_time_log`
--
ALTER TABLE `bal_phone_spent_time_log`
  ADD CONSTRAINT `FKC_bal_phone_spent_time_log` FOREIGN KEY (`child_id`) REFERENCES `bal_children` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
