-- loveria-cw-goh

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `lw-dating-julius`
--

-- --------------------------------------------------------

--
-- Table structure for table `abuse_reports`
--

CREATE TABLE `abuse_reports` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `for_users__id` int(10) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `moderator_remarks` varchar(255) DEFAULT NULL,
  `moderated_by_users__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `__data` text,
  `entity_type` tinyint(3) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Short description',
  `action_type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Create, Update, Delete',
  `entity_id` int(10) UNSIGNED DEFAULT NULL,
  `user_role_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT 'Sent,delivered,seen/read',
  `message` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT 'Text,image,emoji,video,audio, audio call init, video call init, giphy, accept message. Declined message',
  `from_users__id` int(10) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `items__id` int(10) UNSIGNED DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `integrity_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` mediumint(8) UNSIGNED NOT NULL,
  `state_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '2013-12-31 19:31:01',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text,
  `data_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `_id` smallint(5) UNSIGNED NOT NULL,
  `iso_code` char(2) DEFAULT NULL,
  `name_capitalized` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `iso3_code` char(3) DEFAULT NULL,
  `iso_num_code` smallint(6) DEFAULT NULL,
  `phone_code` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `credit_packages`
--

CREATE TABLE `credit_packages` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `credits` int(10) UNSIGNED NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `users__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `credit_wallet_transactions`
--

CREATE TABLE `credit_wallet_transactions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `credits` int(11) NOT NULL COMMENT '- (minus) for debit & + for credit',
  `financial_transactions__id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `credit_type` tinyint(3) UNSIGNED DEFAULT NULL COMMENT 'Purchased, bonuses',
  `reward_points__id` int(10) UNSIGNED DEFAULT NULL,
  `orders__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_change_requests`
--

CREATE TABLE `email_change_requests` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `new_email` varchar(255) NOT NULL,
  `activation_key` varchar(255) NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `user_authorities__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `financial_transactions`
--

CREATE TABLE `financial_transactions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `amount` decimal(13,4) DEFAULT NULL,
  `__data` text,
  `users__id` int(10) UNSIGNED DEFAULT NULL,
  `method` varchar(15) NOT NULL,
  `currency_code` varchar(5) DEFAULT NULL,
  `is_test` tinyint(3) UNSIGNED DEFAULT NULL,
  `orders__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameroom_categories`
--

CREATE TABLE `gameroom_categories` (
  `_id` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(256) NOT NULL,
  `gameroom_level` int(10) UNSIGNED NOT NULL,
  `next_gameroom_categories__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameroom_options_answers`
--

CREATE TABLE `gameroom_options_answers` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `game_session_answers__id` int(10) UNSIGNED NOT NULL,
  `gameroom_question_options__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameroom_passes`
--

CREATE TABLE `gameroom_passes` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `financial_transactions__id` int(10) UNSIGNED DEFAULT NULL,
  `orders__id` int(10) UNSIGNED DEFAULT NULL,
  `expiry_at` datetime DEFAULT NULL,
  `item_id_key` varchar(45) DEFAULT NULL COMMENT '1 time, 1 month etc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameroom_pass_usage`
--

CREATE TABLE `gameroom_pass_usage` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `gameroom_passes__id` int(10) UNSIGNED NOT NULL,
  `game_sessions__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameroom_questions`
--

CREATE TABLE `gameroom_questions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `question` varchar(1000) DEFAULT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL,
  `gameroom_categories__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gameroom_question_options`
--

CREATE TABLE `gameroom_question_options` (
  `_id` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `gameroom_questions__id` int(10) UNSIGNED NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `gameroom_question_options__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `game_sessions`
--

CREATE TABLE `game_sessions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `game_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `quick_note_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `pl_1_users__id` int(10) UNSIGNED NOT NULL,
  `pl_2_users__id` int(10) UNSIGNED NOT NULL,
  `pl_1_gameroom_categories__id` int(10) UNSIGNED DEFAULT '1',
  `pl_2_gameroom_categories__id` int(10) UNSIGNED DEFAULT '1',
  `gameroom_level` int(10) UNSIGNED DEFAULT '1',
  `__data` json DEFAULT NULL,
  `pl_1_game_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `pl_2_game_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `last_level_completed` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Its player list for the game between two players/users';

-- --------------------------------------------------------

--
-- Table structure for table `game_session_answers`
--

CREATE TABLE `game_session_answers` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `game_sessions__id` int(10) UNSIGNED NOT NULL,
  `gameroom_questions__id` int(10) UNSIGNED NOT NULL,
  `text_answer` varchar(1000) DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `static_answer` tinyint(3) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT 'Gift or Sticker',
  `title` varchar(150) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `normal_price` decimal(13,4) DEFAULT NULL,
  `premium_price` varchar(45) DEFAULT NULL,
  `user_authorities__id` int(10) UNSIGNED DEFAULT NULL,
  `premium_only` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `like_dislikes`
--

CREATE TABLE `like_dislikes` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL,
  `like` tinyint(3) UNSIGNED NOT NULL COMMENT '0 for dislike, 1 for like',
  `why` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempts` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `message` varchar(500) NOT NULL,
  `action` varchar(255) NOT NULL,
  `is_read` tinyint(3) UNSIGNED DEFAULT '0',
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `price_amount` decimal(13,4) DEFAULT NULL,
  `points_used` int(11) DEFAULT NULL,
  `points_amount` decimal(13,4) DEFAULT NULL,
  `sales_tax` decimal(13,4) DEFAULT NULL,
  `total_amount` varchar(45) DEFAULT NULL,
  `item_type` varchar(45) DEFAULT NULL,
  `users__id` int(10) UNSIGNED DEFAULT NULL,
  `item_id_key` varchar(45) DEFAULT NULL,
  `reward_discount` decimal(13,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `show_in_menu` tinyint(3) UNSIGNED DEFAULT NULL,
  `content` text,
  `type` tinyint(3) UNSIGNED DEFAULT NULL,
  `users__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `description` text NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile_boosts`
--

CREATE TABLE `profile_boosts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `for_users__id` int(10) UNSIGNED NOT NULL,
  `expiry_at` datetime NOT NULL,
  `credit_wallet_transactions__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile_visitors`
--

CREATE TABLE `profile_visitors` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ranking_answers`
--

CREATE TABLE `ranking_answers` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `ranking_questions__id` int(10) UNSIGNED DEFAULT NULL,
  `game_sessions__id` int(10) UNSIGNED NOT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `other_user_reaction` tinyint(4) DEFAULT NULL COMMENT 'Other player reaction for the answer',
  `game_level` tinyint(3) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ranking_questions`
--

CREATE TABLE `ranking_questions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `question` varchar(1000) NOT NULL,
  `game_level` tinyint(3) UNSIGNED DEFAULT NULL,
  `block_id` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `reward_percentage` float DEFAULT NULL,
  `expiry_at` datetime DEFAULT NULL,
  `orders__id` int(10) UNSIGNED DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `referred_to__id` int(10) UNSIGNED DEFAULT NULL,
  `other_users__id` int(10) UNSIGNED DEFAULT NULL,
  `type` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reward_points`
--

CREATE TABLE `reward_points` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_post_emoji_responses__id` int(10) UNSIGNED NOT NULL,
  `posts__id` int(10) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fips_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  `registered_via` varchar(15) DEFAULT NULL,
  `block_reason` varchar(255) DEFAULT NULL,
  `is_fake` tinyint(3) UNSIGNED DEFAULT NULL,
  `mobile_verified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_authorities`
--

CREATE TABLE `user_authorities` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `user_roles__id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_block_users`
--

CREATE TABLE `user_block_users` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_encounters`
--

CREATE TABLE `user_encounters` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_gallery_access`
--

CREATE TABLE `user_gallery_access` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `by_users__id` int(10) UNSIGNED NOT NULL,
  `for_users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_gifts`
--

CREATE TABLE `user_gifts` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `from_users__id` int(10) UNSIGNED NOT NULL,
  `to_users__id` int(10) UNSIGNED NOT NULL,
  `items__id` int(10) UNSIGNED NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `credit_wallet_transactions__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_items`
--

CREATE TABLE `user_items` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `items__id` int(10) UNSIGNED NOT NULL,
  `price` decimal(13,4) DEFAULT NULL,
  `credit_wallet_transactions__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_photos`
--

CREATE TABLE `user_photos` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_post_emoji_responses`
--

CREATE TABLE `user_post_emoji_responses` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `response` tinyint(3) UNSIGNED NOT NULL,
  `posts__id` int(10) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_post_responses`
--

CREATE TABLE `user_post_responses` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `response` varchar(5000) NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `posts__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `__data` text,
  `users__id` int(10) UNSIGNED NOT NULL,
  `countries__id` smallint(5) UNSIGNED DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `about_me` varchar(500) DEFAULT NULL,
  `location_latitude` decimal(11,8) DEFAULT NULL,
  `location_longitude` decimal(11,8) DEFAULT NULL,
  `preferred_language` varchar(15) DEFAULT NULL,
  `relationship_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `work_status` tinyint(3) UNSIGNED DEFAULT NULL,
  `education` tinyint(4) DEFAULT NULL,
  `cover_picture` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(3) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `unfortunate_text` varchar(1000) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `looking_for` tinyint(3) UNSIGNED DEFAULT NULL,
  `funtasy_date` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `_id` tinyint(3) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `key_name` varchar(45) NOT NULL,
  `value` text,
  `data_type` tinyint(4) DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_specifications`
--

CREATE TABLE `user_specifications` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `specification_key` varchar(15) NOT NULL,
  `specification_value` varchar(150) DEFAULT NULL,
  `users__id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_uid` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `users__id` int(10) UNSIGNED NOT NULL,
  `expiry_at` datetime DEFAULT NULL,
  `credit_wallet_transactions__id` int(10) UNSIGNED DEFAULT NULL,
  `plan_id` varchar(20) NOT NULL,
  `orders__id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_abuse_reports_users1_idx` (`for_users__id`),
  ADD KEY `fk_abuse_reports_users2_idx` (`by_users__id`),
  ADD KEY `fk_abuse_reports_users3_idx` (`moderated_by_users__id`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_chats_users1_idx` (`from_users__id`),
  ADD KEY `fk_chats_users2_idx` (`to_users__id`),
  ADD KEY `fk_chats_items1_idx` (`items__id`),
  ADD KEY `fk_chats_users3_idx` (`users__id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cities_states1_idx` (`state_id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `credit_packages`
--
ALTER TABLE `credit_packages`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_credit_packages_users1_idx` (`users__id`);

--
-- Indexes for table `credit_wallet_transactions`
--
ALTER TABLE `credit_wallet_transactions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_credit_wallet_transactions_users1_idx` (`users__id`),
  ADD KEY `fk_credit_wallet_transactions_financial_transactions1_idx` (`financial_transactions__id`),
  ADD KEY `fk_credit_wallet_transactions_reward_points1_idx` (`reward_points__id`),
  ADD KEY `fk_credit_wallet_transactions_orders1_idx` (`orders__id`);

--
-- Indexes for table `email_change_requests`
--
ALTER TABLE `email_change_requests`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD KEY `fk_email_change_requests_users1_idx` (`users__id`),
  ADD KEY `fk_email_change_requests_user_authorities1_idx` (`user_authorities__id`);

--
-- Indexes for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_financial_transactions_users1_idx` (`users__id`),
  ADD KEY `fk_financial_transactions_orders1_idx` (`orders__id`);

--
-- Indexes for table `gameroom_categories`
--
ALTER TABLE `gameroom_categories`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `fk_gameroom_categories_gameroom_categories1_idx` (`next_gameroom_categories__id`);

--
-- Indexes for table `gameroom_options_answers`
--
ALTER TABLE `gameroom_options_answers`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_gameroom_options_answers_game_session_answers1_idx` (`game_session_answers__id`),
  ADD KEY `fk_gameroom_options_answers_gameroom_question_options1_idx` (`gameroom_question_options__id`);

--
-- Indexes for table `gameroom_passes`
--
ALTER TABLE `gameroom_passes`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_gameroom_passes_users1_idx` (`users__id`),
  ADD KEY `fk_gameroom_passes_financial_transactions1_idx` (`financial_transactions__id`),
  ADD KEY `fk_gameroom_passes_orders1_idx` (`orders__id`);

--
-- Indexes for table `gameroom_pass_usage`
--
ALTER TABLE `gameroom_pass_usage`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_gameroom_pass_usage_gameroom_passes1_idx` (`gameroom_passes__id`),
  ADD KEY `fk_gameroom_pass_usage_game_sessions1_idx` (`game_sessions__id`);

--
-- Indexes for table `gameroom_questions`
--
ALTER TABLE `gameroom_questions`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `fk_gameroom_questions_gameroom_categories1_idx` (`gameroom_categories__id`);

--
-- Indexes for table `gameroom_question_options`
--
ALTER TABLE `gameroom_question_options`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `fk_gameroom_question_options_gameroom_questions1_idx` (`gameroom_questions__id`),
  ADD KEY `fk_gameroom_question_options_gameroom_question_options1_idx` (`gameroom_question_options__id`);

--
-- Indexes for table `game_sessions`
--
ALTER TABLE `game_sessions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_game_session_users1_idx` (`pl_1_users__id`),
  ADD KEY `fk_game_session_users2_idx` (`pl_2_users__id`),
  ADD KEY `fk_game_sessions_gameroom_categories1_idx` (`pl_1_gameroom_categories__id`),
  ADD KEY `fk_game_sessions_gameroom_categories2_idx` (`pl_2_gameroom_categories__id`);

--
-- Indexes for table `game_session_answers`
--
ALTER TABLE `game_session_answers`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_game_session_answers_gameroom_questions1_idx` (`gameroom_questions__id`),
  ADD KEY `fk_game_session_answers_users1_idx` (`users__id`),
  ADD KEY `fk_game_session_answers_game_sessions1_idx` (`game_sessions__id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_gifts_user_authorities1_idx` (`user_authorities__id`);

--
-- Indexes for table `like_dislikes`
--
ALTER TABLE `like_dislikes`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_like_dislikes_users1_idx` (`to_users__id`),
  ADD KEY `fk_like_dislikes_users2_idx` (`by_users__id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_notifications_users1_idx` (`users__id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_orders_users1_idx` (`users__id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`),
  ADD KEY `fk_pages_users1_idx` (`users__id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_posts_users1_idx` (`users__id`);

--
-- Indexes for table `profile_boosts`
--
ALTER TABLE `profile_boosts`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_profile_boosts_users1_idx` (`for_users__id`),
  ADD KEY `fk_profile_boosts_credit_wallet_transactions1_idx` (`credit_wallet_transactions__id`);

--
-- Indexes for table `profile_visitors`
--
ALTER TABLE `profile_visitors`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_profile_visitors_users1_idx` (`to_users__id`),
  ADD KEY `fk_profile_visitors_users2_idx` (`by_users__id`);

--
-- Indexes for table `ranking_answers`
--
ALTER TABLE `ranking_answers`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_ranking_answers_ranking_questions1_idx` (`ranking_questions__id`),
  ADD KEY `fk_ranking_answers_game_sessions1_idx` (`game_sessions__id`),
  ADD KEY `fk_ranking_answers_users1_idx` (`users__id`);

--
-- Indexes for table `ranking_questions`
--
ALTER TABLE `ranking_questions`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_referrals_orders3_idx` (`orders__id`),
  ADD KEY `fk_referrals_users3_idx` (`users__id`),
  ADD KEY `fk_referrals_referrals1_idx` (`referred_to__id`),
  ADD KEY `fk_referrals_users1_idx` (`other_users__id`);

--
-- Indexes for table `reward_points`
--
ALTER TABLE `reward_points`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_reward_points_user_post_emoji_responses1_idx` (`user_post_emoji_responses__id`),
  ADD KEY `fk_reward_points_posts1_idx` (`posts__id`),
  ADD KEY `fk_reward_points_users1_idx` (`users__id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`);

--
-- Indexes for table `user_authorities`
--
ALTER TABLE `user_authorities`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_authorities_users1_idx` (`users__id`),
  ADD KEY `fk_user_authorities_user_roles1_idx` (`user_roles__id`);

--
-- Indexes for table `user_block_users`
--
ALTER TABLE `user_block_users`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_block_users1_idx` (`to_users__id`),
  ADD KEY `fk_user_block_users2_idx` (`by_users__id`);

--
-- Indexes for table `user_encounters`
--
ALTER TABLE `user_encounters`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_encounters_users1_idx` (`by_users__id`),
  ADD KEY `fk_user_encounters_users2_idx` (`to_users__id`);

--
-- Indexes for table `user_gallery_access`
--
ALTER TABLE `user_gallery_access`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_gallery_access_users1_idx` (`by_users__id`),
  ADD KEY `fk_user_gallery_access_users2_idx` (`for_users__id`);

--
-- Indexes for table `user_gifts`
--
ALTER TABLE `user_gifts`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_gifts_users1_idx` (`from_users__id`),
  ADD KEY `fk_user_gifts_users2_idx` (`to_users__id`),
  ADD KEY `fk_user_gifts_items1_idx` (`items__id`),
  ADD KEY `fk_user_gifts_credit_wallet_transactions1_idx` (`credit_wallet_transactions__id`);

--
-- Indexes for table `user_items`
--
ALTER TABLE `user_items`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_items_users1_idx` (`users__id`),
  ADD KEY `fk_user_items_items1_idx` (`items__id`),
  ADD KEY `fk_user_items_credit_wallet_transactions1_idx` (`credit_wallet_transactions__id`);

--
-- Indexes for table `user_photos`
--
ALTER TABLE `user_photos`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_photos_users1_idx` (`users__id`);

--
-- Indexes for table `user_post_emoji_responses`
--
ALTER TABLE `user_post_emoji_responses`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_post_emoji_responses_posts1_idx` (`posts__id`),
  ADD KEY `fk_user_post_emoji_responses_users1_idx` (`users__id`);

--
-- Indexes for table `user_post_responses`
--
ALTER TABLE `user_post_responses`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_post_responses_users1_idx` (`users__id`),
  ADD KEY `fk_user_post_responses_posts1_idx` (`posts__id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD KEY `fk_user_profiles_users1_idx` (`users__id`),
  ADD KEY `fk_user_profiles_countries1_idx` (`countries__id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `name` (`key_name`),
  ADD KEY `fk_user_settings_users1_idx` (`users__id`);

--
-- Indexes for table `user_specifications`
--
ALTER TABLE `user_specifications`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_favorites_users1_idx` (`users__id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`_id`),
  ADD UNIQUE KEY `_uid_UNIQUE` (`_uid`),
  ADD UNIQUE KEY `_uid` (`_uid`),
  ADD KEY `fk_user_subscriptions_users1_idx` (`users__id`),
  ADD KEY `fk_user_subscriptions_credit_wallet_transactions1_idx` (`credit_wallet_transactions__id`),
  ADD KEY `fk_user_subscriptions_orders1_idx` (`orders__id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_packages`
--
ALTER TABLE `credit_packages`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_wallet_transactions`
--
ALTER TABLE `credit_wallet_transactions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_change_requests`
--
ALTER TABLE `email_change_requests`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gameroom_categories`
--
ALTER TABLE `gameroom_categories`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gameroom_options_answers`
--
ALTER TABLE `gameroom_options_answers`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gameroom_passes`
--
ALTER TABLE `gameroom_passes`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gameroom_pass_usage`
--
ALTER TABLE `gameroom_pass_usage`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gameroom_questions`
--
ALTER TABLE `gameroom_questions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gameroom_question_options`
--
ALTER TABLE `gameroom_question_options`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_sessions`
--
ALTER TABLE `game_sessions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_session_answers`
--
ALTER TABLE `game_session_answers`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `like_dislikes`
--
ALTER TABLE `like_dislikes`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_boosts`
--
ALTER TABLE `profile_boosts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_visitors`
--
ALTER TABLE `profile_visitors`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranking_answers`
--
ALTER TABLE `ranking_answers`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranking_questions`
--
ALTER TABLE `ranking_questions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_points`
--
ALTER TABLE `reward_points`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_authorities`
--
ALTER TABLE `user_authorities`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_block_users`
--
ALTER TABLE `user_block_users`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_encounters`
--
ALTER TABLE `user_encounters`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_gallery_access`
--
ALTER TABLE `user_gallery_access`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_gifts`
--
ALTER TABLE `user_gifts`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_items`
--
ALTER TABLE `user_items`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_photos`
--
ALTER TABLE `user_photos`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_post_emoji_responses`
--
ALTER TABLE `user_post_emoji_responses`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_post_responses`
--
ALTER TABLE `user_post_responses`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_specifications`
--
ALTER TABLE `user_specifications`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abuse_reports`
--
ALTER TABLE `abuse_reports`
  ADD CONSTRAINT `fk_abuse_reports_users1` FOREIGN KEY (`for_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_abuse_reports_users2` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_abuse_reports_users3` FOREIGN KEY (`moderated_by_users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `fk_chats_items1` FOREIGN KEY (`items__id`) REFERENCES `items` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chats_users1` FOREIGN KEY (`from_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chats_users2` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chats_users3` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fk_cities_states1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `credit_packages`
--
ALTER TABLE `credit_packages`
  ADD CONSTRAINT `fk_credit_packages_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `credit_wallet_transactions`
--
ALTER TABLE `credit_wallet_transactions`
  ADD CONSTRAINT `fk_credit_wallet_transactions_financial_transactions1` FOREIGN KEY (`financial_transactions__id`) REFERENCES `financial_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_credit_wallet_transactions_orders1` FOREIGN KEY (`orders__id`) REFERENCES `orders` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_credit_wallet_transactions_reward_points1` FOREIGN KEY (`reward_points__id`) REFERENCES `reward_points` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_credit_wallet_transactions_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `email_change_requests`
--
ALTER TABLE `email_change_requests`
  ADD CONSTRAINT `fk_email_change_requests_user_authorities1` FOREIGN KEY (`user_authorities__id`) REFERENCES `user_authorities` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_email_change_requests_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  ADD CONSTRAINT `fk_financial_transactions_orders1` FOREIGN KEY (`orders__id`) REFERENCES `orders` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_financial_transactions_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `gameroom_categories`
--
ALTER TABLE `gameroom_categories`
  ADD CONSTRAINT `fk_gameroom_categories_gameroom_categories1` FOREIGN KEY (`next_gameroom_categories__id`) REFERENCES `gameroom_categories` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `gameroom_options_answers`
--
ALTER TABLE `gameroom_options_answers`
  ADD CONSTRAINT `fk_gameroom_options_answers_game_session_answers1` FOREIGN KEY (`game_session_answers__id`) REFERENCES `game_session_answers` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gameroom_options_answers_gameroom_question_options1` FOREIGN KEY (`gameroom_question_options__id`) REFERENCES `gameroom_question_options` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `gameroom_passes`
--
ALTER TABLE `gameroom_passes`
  ADD CONSTRAINT `fk_gameroom_passes_financial_transactions1` FOREIGN KEY (`financial_transactions__id`) REFERENCES `financial_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gameroom_passes_orders1` FOREIGN KEY (`orders__id`) REFERENCES `orders` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gameroom_passes_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `gameroom_pass_usage`
--
ALTER TABLE `gameroom_pass_usage`
  ADD CONSTRAINT `fk_gameroom_pass_usage_game_sessions1` FOREIGN KEY (`game_sessions__id`) REFERENCES `game_sessions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gameroom_pass_usage_gameroom_passes1` FOREIGN KEY (`gameroom_passes__id`) REFERENCES `gameroom_passes` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `gameroom_questions`
--
ALTER TABLE `gameroom_questions`
  ADD CONSTRAINT `fk_gameroom_questions_gameroom_categories1` FOREIGN KEY (`gameroom_categories__id`) REFERENCES `gameroom_categories` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `gameroom_question_options`
--
ALTER TABLE `gameroom_question_options`
  ADD CONSTRAINT `fk_gameroom_question_options_gameroom_question_options1` FOREIGN KEY (`gameroom_question_options__id`) REFERENCES `gameroom_question_options` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gameroom_question_options_gameroom_questions1` FOREIGN KEY (`gameroom_questions__id`) REFERENCES `gameroom_questions` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `game_sessions`
--
ALTER TABLE `game_sessions`
  ADD CONSTRAINT `fk_game_session_users1` FOREIGN KEY (`pl_1_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_game_session_users2` FOREIGN KEY (`pl_2_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_game_sessions_gameroom_categories1` FOREIGN KEY (`pl_1_gameroom_categories__id`) REFERENCES `gameroom_categories` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_game_sessions_gameroom_categories2` FOREIGN KEY (`pl_2_gameroom_categories__id`) REFERENCES `gameroom_categories` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `game_session_answers`
--
ALTER TABLE `game_session_answers`
  ADD CONSTRAINT `fk_game_session_answers_game_sessions1` FOREIGN KEY (`game_sessions__id`) REFERENCES `game_sessions` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_game_session_answers_gameroom_questions1` FOREIGN KEY (`gameroom_questions__id`) REFERENCES `gameroom_questions` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_game_session_answers_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_gifts_user_authorities1` FOREIGN KEY (`user_authorities__id`) REFERENCES `user_authorities` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `like_dislikes`
--
ALTER TABLE `like_dislikes`
  ADD CONSTRAINT `fk_like_dislikes_users1` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_like_dislikes_users2` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_pages_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `profile_boosts`
--
ALTER TABLE `profile_boosts`
  ADD CONSTRAINT `fk_profile_boosts_credit_wallet_transactions1` FOREIGN KEY (`credit_wallet_transactions__id`) REFERENCES `credit_wallet_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_profile_boosts_users1` FOREIGN KEY (`for_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `profile_visitors`
--
ALTER TABLE `profile_visitors`
  ADD CONSTRAINT `fk_profile_visitors_users1` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_profile_visitors_users2` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `ranking_answers`
--
ALTER TABLE `ranking_answers`
  ADD CONSTRAINT `fk_ranking_answers_game_sessions1` FOREIGN KEY (`game_sessions__id`) REFERENCES `game_sessions` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ranking_answers_ranking_questions1` FOREIGN KEY (`ranking_questions__id`) REFERENCES `ranking_questions` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ranking_answers_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `fk_referrals_orders3` FOREIGN KEY (`orders__id`) REFERENCES `orders` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referrals_referrals1` FOREIGN KEY (`referred_to__id`) REFERENCES `referrals` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referrals_users1` FOREIGN KEY (`other_users__id`) REFERENCES `users` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_referrals_users3` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `reward_points`
--
ALTER TABLE `reward_points`
  ADD CONSTRAINT `fk_reward_points_posts1` FOREIGN KEY (`posts__id`) REFERENCES `posts` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reward_points_user_post_emoji_responses1` FOREIGN KEY (`user_post_emoji_responses__id`) REFERENCES `user_post_emoji_responses` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reward_points_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_authorities`
--
ALTER TABLE `user_authorities`
  ADD CONSTRAINT `fk_user_authorities_user_roles1` FOREIGN KEY (`user_roles__id`) REFERENCES `user_roles` (`_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_authorities_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_block_users`
--
ALTER TABLE `user_block_users`
  ADD CONSTRAINT `fk_user_block_users1` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_block_users2` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_encounters`
--
ALTER TABLE `user_encounters`
  ADD CONSTRAINT `fk_user_encounters_users1` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_encounters_users2` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_gallery_access`
--
ALTER TABLE `user_gallery_access`
  ADD CONSTRAINT `fk_user_gallery_access_users1` FOREIGN KEY (`by_users__id`) REFERENCES `users` (`_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_gallery_access_users2` FOREIGN KEY (`for_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_gifts`
--
ALTER TABLE `user_gifts`
  ADD CONSTRAINT `fk_user_gifts_credit_wallet_transactions1` FOREIGN KEY (`credit_wallet_transactions__id`) REFERENCES `credit_wallet_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_gifts_items1` FOREIGN KEY (`items__id`) REFERENCES `items` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_gifts_users1` FOREIGN KEY (`from_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_gifts_users2` FOREIGN KEY (`to_users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_items`
--
ALTER TABLE `user_items`
  ADD CONSTRAINT `fk_user_items_credit_wallet_transactions1` FOREIGN KEY (`credit_wallet_transactions__id`) REFERENCES `credit_wallet_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_items_items1` FOREIGN KEY (`items__id`) REFERENCES `items` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_items_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_photos`
--
ALTER TABLE `user_photos`
  ADD CONSTRAINT `fk_user_photos_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_post_emoji_responses`
--
ALTER TABLE `user_post_emoji_responses`
  ADD CONSTRAINT `fk_user_post_emoji_responses_posts1` FOREIGN KEY (`posts__id`) REFERENCES `posts` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_post_emoji_responses_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_post_responses`
--
ALTER TABLE `user_post_responses`
  ADD CONSTRAINT `fk_user_post_responses_posts1` FOREIGN KEY (`posts__id`) REFERENCES `posts` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_post_responses_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `fk_user_profiles_countries1` FOREIGN KEY (`countries__id`) REFERENCES `countries` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_profiles_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD CONSTRAINT `fk_user_settings_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_specifications`
--
ALTER TABLE `user_specifications`
  ADD CONSTRAINT `fk_user_favorites_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `fk_user_subscriptions_credit_wallet_transactions1` FOREIGN KEY (`credit_wallet_transactions__id`) REFERENCES `credit_wallet_transactions` (`_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_subscriptions_orders1` FOREIGN KEY (`orders__id`) REFERENCES `orders` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_subscriptions_users1` FOREIGN KEY (`users__id`) REFERENCES `users` (`_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;


-- Initial SQL
--
-- Dumping data for table `countries`
-- https://gist.github.com/paulochf/9616f85f3f3904f1c36f

INSERT INTO `countries` (`_id`, `iso_code`, `name_capitalized`, `name`, `iso3_code`, `iso_num_code`, `phone_code`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 243),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 7),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
-- (189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381), -- see https://gist.github.com/adhipg/1600028#comment-945655
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

INSERT INTO `user_roles` (`_id`, `_uid`, `status`, `created_at`, `updated_at`, `title`) VALUES
(1, '15f21c9f-88bb-4fec-bad4-03eb9d9065f8', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Admin'),
(2, '287133c4-2afc-4f65-ab3c-28b0df8a099a', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Member');
-- firstadmin@domain.com / pass-> firstadmin123
INSERT INTO `users` (`_id`, `_uid`, `created_at`, `updated_at`, `username`, `email`, `password`, `status`, `remember_token`, `first_name`, `last_name`, `designation`, `mobile_number`) VALUES
(1, '50ee1967-7341-4c3a-b071-f2ea0722b179', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'admin', 'firstadmin@domain.com', '$2y$10$0MFZ3GWf7JSlfFjpPQ0gke7Sq9lZ/s3yhKwCjY7z00mRAjwDnE4um', 1, 'O4G7hgyto34OhcWQUYM9ULx3kSEMNTrFIsflasaiq0AgfeBWVBxGeK9Kwp', 'loveria', 'Admin', 'Admin', '9999999999');

INSERT INTO `user_authorities` (`_id`, `_uid`, `status`, `created_at`, `updated_at`, `users__id`, `user_roles__id`) VALUES
(1, '307303c0-6dae-4066-a613-b26a8146df59', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1);