-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2021 at 03:00 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wallpaper_superheroes`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_active_log`
--

CREATE TABLE `tbl_active_log` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `date_time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `email`, `image`) VALUES
(1, 'aittataa', '224680', 'aittataa@gmail.com', 'profile.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`, `status`) VALUES
(1, 'Batman', 'batman.jpg', 1),
(2, 'Captain America', 'captain_america.jpg', 1),
(3, 'Superman', 'superman.jpg', 1),
(4, 'Thor', 'thor.jpg', 1),
(5, 'Iron Man', 'iron_man.png', 1),
(6, 'Wonder Woman', 'wonder_woman.png', 1),
(7, 'Flash', 'flash.jpg', 1),
(8, 'Spider Man', 'spider_man.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `color_id` int(10) NOT NULL,
  `color_name` varchar(100) NOT NULL,
  `color_code` varchar(10) NOT NULL,
  `color_status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favorite`
--

CREATE TABLE `tbl_favorite` (
  `id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_banner`
--

CREATE TABLE `tbl_home_banner` (
  `id` int(11) NOT NULL,
  `banner_name` varchar(255) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `dt_rate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating_gif`
--

CREATE TABLE `tbl_rating_gif` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `dt_rate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `email_from` varchar(200) NOT NULL,
  `onesignal_app_id` text NOT NULL,
  `onesignal_rest_key` text NOT NULL,
  `envato_buyer_name` varchar(200) NOT NULL,
  `envato_purchase_code` text NOT NULL,
  `envato_buyer_email` varchar(150) NOT NULL,
  `envato_purchased_status` int(1) NOT NULL DEFAULT 0,
  `envato_ios_purchase_code` varchar(255) NOT NULL,
  `envato_ios_purchased_status` int(2) NOT NULL DEFAULT 0,
  `package_name` varchar(150) NOT NULL,
  `ios_bundle_identifier` varchar(200) NOT NULL,
  `app_api_key` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `app_author` varchar(255) NOT NULL,
  `app_contact` varchar(255) NOT NULL,
  `app_website` varchar(255) NOT NULL,
  `app_description` text NOT NULL,
  `app_developed_by` varchar(255) NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `item_type` varchar(255) NOT NULL DEFAULT 'Portrait',
  `gif_on_off` varchar(255) NOT NULL DEFAULT 'false',
  `home_latest_limit` int(2) NOT NULL DEFAULT 100,
  `home_most_viewed_limit` int(2) NOT NULL DEFAULT 100,
  `home_most_rated_limit` int(2) NOT NULL DEFAULT 100,
  `home_limit` int(3) DEFAULT NULL,
  `home_landscape_limit` int(2) NOT NULL DEFAULT 100,
  `home_square_limit` int(2) NOT NULL DEFAULT 100,
  `api_latest_limit` int(3) NOT NULL DEFAULT 100,
  `api_cat_order_by` varchar(255) NOT NULL DEFAULT 'cid',
  `api_cat_post_order_by` varchar(255) NOT NULL DEFAULT 'DESC',
  `api_gif_post_order_by` varchar(255) NOT NULL DEFAULT 'DESC',
  `app_update_status` varchar(10) NOT NULL DEFAULT 'false',
  `app_new_version` double NOT NULL DEFAULT 1,
  `app_update_desc` text NOT NULL,
  `app_redirect_url` text NOT NULL,
  `cancel_update_status` varchar(10) NOT NULL DEFAULT 'false',
  `app_update_status_ios` varchar(10) NOT NULL DEFAULT 'false',
  `app_new_version_ios` double NOT NULL DEFAULT 1,
  `app_update_desc_ios` text NOT NULL,
  `app_redirect_url_ios` text NOT NULL,
  `cancel_update_status_ios` varchar(10) NOT NULL DEFAULT 'false',
  `publisher_id` text NOT NULL,
  `interstital_ad` varchar(255) NOT NULL,
  `interstital_ad_id` varchar(255) NOT NULL,
  `interstital_ad_click` varchar(255) NOT NULL,
  `banner_ad` varchar(255) NOT NULL,
  `banner_ad_id` varchar(255) NOT NULL,
  `facebook_interstital_ad` varchar(255) NOT NULL,
  `facebook_interstital_ad_id` varchar(255) NOT NULL,
  `facebook_interstital_ad_click` varchar(255) NOT NULL,
  `facebook_banner_ad` varchar(255) NOT NULL,
  `facebook_banner_ad_id` varchar(255) NOT NULL,
  `facebook_native_ad` varchar(255) NOT NULL,
  `facebook_native_ad_id` varchar(255) NOT NULL,
  `facebook_native_ad_click` varchar(255) NOT NULL,
  `admob_nathive_ad` varchar(255) NOT NULL,
  `admob_native_ad_id` varchar(255) NOT NULL,
  `admob_native_ad_click` varchar(255) NOT NULL,
  `publisher_id_ios` varchar(500) NOT NULL,
  `app_id_ios` varchar(500) NOT NULL,
  `interstital_ad_ios` varchar(500) NOT NULL,
  `interstital_ad_id_ios` varchar(500) NOT NULL,
  `interstital_ad_click_ios` varchar(500) NOT NULL,
  `banner_ad_ios` varchar(500) NOT NULL,
  `banner_ad_id_ios` varchar(500) NOT NULL,
  `ios_facebook_interstital_ad` varchar(255) NOT NULL,
  `ios_facebook_interstital_ad_id` varchar(255) NOT NULL,
  `ios_facebook_interstital_ad_click` varchar(255) NOT NULL,
  `ios_facebook_banner_ad` varchar(255) NOT NULL,
  `ios_facebook_banner_ad_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `email_from`, `onesignal_app_id`, `onesignal_rest_key`, `envato_buyer_name`, `envato_purchase_code`, `envato_buyer_email`, `envato_purchased_status`, `envato_ios_purchase_code`, `envato_ios_purchased_status`, `package_name`, `ios_bundle_identifier`, `app_api_key`, `app_name`, `app_logo`, `app_email`, `app_version`, `app_author`, `app_contact`, `app_website`, `app_description`, `app_developed_by`, `app_privacy_policy`, `item_type`, `gif_on_off`, `home_latest_limit`, `home_most_viewed_limit`, `home_most_rated_limit`, `home_limit`, `home_landscape_limit`, `home_square_limit`, `api_latest_limit`, `api_cat_order_by`, `api_cat_post_order_by`, `api_gif_post_order_by`, `app_update_status`, `app_new_version`, `app_update_desc`, `app_redirect_url`, `cancel_update_status`, `app_update_status_ios`, `app_new_version_ios`, `app_update_desc_ios`, `app_redirect_url_ios`, `cancel_update_status_ios`, `publisher_id`, `interstital_ad`, `interstital_ad_id`, `interstital_ad_click`, `banner_ad`, `banner_ad_id`, `facebook_interstital_ad`, `facebook_interstital_ad_id`, `facebook_interstital_ad_click`, `facebook_banner_ad`, `facebook_banner_ad_id`, `facebook_native_ad`, `facebook_native_ad_id`, `facebook_native_ad_click`, `admob_nathive_ad`, `admob_native_ad_id`, `admob_native_ad_click`, `publisher_id_ios`, `app_id_ios`, `interstital_ad_ios`, `interstital_ad_id_ios`, `interstital_ad_click_ios`, `banner_ad_ios`, `banner_ad_id_ios`, `ios_facebook_interstital_ad`, `ios_facebook_interstital_ad_id`, `ios_facebook_interstital_ad_click`, `ios_facebook_banner_ad`, `ios_facebook_banner_ad_id`) VALUES
(1, 'aittataa@gmail.in', 'b15506ee-46c3-4f06-9ba2-e2f6c062eb41', 'OWUyYWUzYjgtZjViZC00MzhkLWFiNGUtMWU0Y2VmZTk3NTBm', 'aittataa', 'f1b7ece5-d2bd-4b66-ac85-020b6a4647cd', '', 1, '', 0, 'com.super_heroes.superheroes', '', 'YtmpgwcUzCbeh1JlsK0gR0njtXm9g9lAUt4pzsPZhsH8a', 'Super Heroes', 'Icon144.png', 'aittataa@gmail.com', '1.0', 'aittataa', '+212 673 377 573', '', '<p><strong>The Best High-Quality Wallpaper For Super Heroes</strong></p>\r\n\r\n<p><strong>Wallpapers For Super Heroes</strong> is free wallpaper app containing backgrounds in full HD resolution.</p>\r\n\r\n<p>You will get a variety of quality Pictures in this application that can be used as cool wallpapers, background on your mobile smartphone.</p>\r\n\r\n<p>So, if you really love Super Heroes, don&#39;t miss the best Super Heroes Wallpaper, beautiful on your phone and always nice to the eye and soul!</p>\r\n\r\n<p>Customize your phone screen to be cooler and more amazing with this app and choose your favorite wallpaper.</p>\r\n\r\n<p>This app is a great tool for 4K Backgrounds, Full HD Backgrounds and it is a Wallpaper Store for users where they can experience the best handpicked backgrounds and creative wallpapers.</p>\r\n\r\n<p>It&#39;s is compatible with all devices 1080x1920 px (Full HD 1080p) and 2160x3840 px (Ultra HD, 4K).</p>\r\n\r\n<p>FEATURES:</p>\r\n\r\n<p>** Daily updates of free and awesome HD Wallpapers.</p>\r\n\r\n<p>** Simple, Fast, and light: We focuses on the simplicity of the app, which gives a great performance.</p>\r\n\r\n<p>** Easy to download and set as wallpaper.</p>\r\n\r\n<p>** Easy to explore amazing wallpapers from the HD Wallpapers&rsquo; Gallery.</p>\r\n\r\n<p>** Frequent updates which keep your screen stunning with the new HD Wallpapers and HD Backgrounds you have ever seen.</p>\r\n\r\n<p>** You can easily share HD backgrounds or everyday wallpapers with anyone with just one click.</p>\r\n\r\n<p>** With us, you will find beautiful wallpapers for the phone and tablet of Popular categories.</p>\r\n\r\n<p>** Setting HD Wallpapers: Keep your favorite images by easily saving them to your own device.</p>\r\n\r\n<p>You can discover all that and more when you install the app.</p>\r\n\r\n<p>We are thankful for all of your support and always welcome your feedback and suggestions.</p>\r\n\r\n<p>Please Contact Us:</p>\r\n\r\n<p>WhatsApp: +212 651 458 526</p>\r\n\r\n<p>WhatsApp Lien: <a href=\"https://wa.me/212651458526\">https://wa.me/212651458526</a></p>\r\n\r\n<p>E-mail: aittataa@gmail.com</p>\r\n\r\n<p><strong>Thank you</strong></p>\r\n\r\n<p><strong>And Don&#39;t Forget to Give Us a Good Feedback</strong></p>\r\n', 'IT Department', '<p><strong>We are committed to protecting your privacy</strong></p>\r\n\r\n<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\r\n\r\n<p><strong>What information do we collect?</strong></p>\r\n\r\n<p>We may collect any or all of the information that you give us depending on the type of transaction you enter into, including your name, address, telephone number, and email address, together with data about your use of the website. Other information that may be needed from time to time to process a request may also be collected as indicated on the website.</p>\r\n\r\n<p><strong>Information Use</strong></p>\r\n\r\n<p>We use the information collected primarily to process the task for which you visited the website. Data collected in the UK is held in accordance with the Data Protection Act. All reasonable precautions are taken to prevent unauthorized access to this information. This safeguard may require you to provide additional forms of identity should you wish to obtain information about your account details.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Your Internet browser has the in-built facility for storing small files - &quot;cookies&quot; - that hold information that allows a website to recognize your account. Our website takes advantage of this facility to enhance your experience. You have the ability to prevent your computer from accepting cookies but, if you do, certain functionality on the website may be impaired.</p>\r\n\r\n<p><strong>Disclosing Information</strong></p>\r\n\r\n<p>We do not disclose any personal information obtained about you from this website to third parties unless you permit us to do so by ticking the relevant boxes in registration or competition forms. We may also use the information to keep in contact with you and inform you of developments associated with us. You will be given the opportunity to remove yourself from any mailing list or similar device. If at any time in the future we should wish to disclose information collected on this website to any third party, it would only be with your knowledge and consent.&nbsp;</p>\r\n\r\n<p>We may from time to time provide information of a general nature to third parties - for example, the number of individuals visiting our website or completing a registration form, but we will not use any information that could identify those individuals.&nbsp;</p>\r\n\r\n<p><strong>Changes to this Policy</strong></p>\r\n\r\n<p>Any changes to our Privacy Policy will be placed here and will supersede this version of our policy. We will take reasonable steps to draw your attention to any changes in our policy. However, to be on the safe side, we suggest that you read this document each time you use the website to ensure that it still meets with your approval.</p>\r\n\r\n<p><strong>Contacting Us</strong></p>\r\n\r\n<p>If you have any questions about our Privacy Policy, or if you want to know what information we have collected about you.</p>\r\n', 'Portrait', 'false', 100, 100, 100, 100, 100, 100, 100, 'cid', 'DESC', 'DESC', 'false', 1, 'Kindly you can update new version app', 'https://play.google.com/store/apps/details?id=com.viaan.wallpaper', 'false', 'false', 1, '', '', 'false', '', 'true', '', '3', 'true', '', 'true', '', '3', 'true', '', 'true', '', '3', 'true', '', '3', '', 'ca-app-pub-8356404931736973~5938963872', 'false', '', '0', 'false', '', 'false', '', '0', 'false', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smtp_settings`
--

CREATE TABLE `tbl_smtp_settings` (
  `id` int(5) NOT NULL,
  `smtp_type` varchar(20) NOT NULL DEFAULT 'server',
  `smtp_host` varchar(150) NOT NULL,
  `smtp_email` varchar(150) NOT NULL,
  `smtp_password` text NOT NULL,
  `smtp_secure` varchar(20) NOT NULL,
  `port_no` varchar(10) NOT NULL,
  `smtp_ghost` varchar(150) NOT NULL,
  `smtp_gemail` varchar(150) NOT NULL,
  `smtp_gpassword` text NOT NULL,
  `smtp_gsecure` varchar(20) NOT NULL,
  `gport_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_smtp_settings`
--

INSERT INTO `tbl_smtp_settings` (`id`, `smtp_type`, `smtp_host`, `smtp_email`, `smtp_password`, `smtp_secure`, `port_no`, `smtp_ghost`, `smtp_gemail`, `smtp_gpassword`, `smtp_gsecure`, `gport_no`) VALUES
(1, 'server', '', '', '', 'ssl', '465', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(10) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'Normal',
  `name` varchar(60) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `auth_id` varchar(255) NOT NULL DEFAULT '0',
  `registered_on` varchar(200) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_report`
--

CREATE TABLE `tbl_user_report` (
  `user_report_id` int(10) NOT NULL,
  `report_for` varchar(30) NOT NULL,
  `user_id` int(5) NOT NULL,
  `parent_id` int(5) NOT NULL,
  `user_message` longtext NOT NULL,
  `seneded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_report_status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallpaper`
--

CREATE TABLE `tbl_wallpaper` (
  `id` int(11) NOT NULL,
  `featured` int(1) NOT NULL DEFAULT 1,
  `cat_id` int(11) NOT NULL,
  `wallpaper_type` varchar(255) NOT NULL DEFAULT 'Portrait',
  `image_date` date NOT NULL,
  `image` varchar(255) NOT NULL,
  `wall_tags` text NOT NULL,
  `wall_colors` text NOT NULL,
  `total_rate` int(11) NOT NULL DEFAULT 0,
  `rate_avg` decimal(11,0) DEFAULT 0,
  `total_views` int(11) NOT NULL DEFAULT 0,
  `total_download` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_wallpaper`
--

INSERT INTO `tbl_wallpaper` (`id`, `featured`, `cat_id`, `wallpaper_type`, `image_date`, `image`, `wall_tags`, `wall_colors`, `total_rate`, `rate_avg`, `total_views`, `total_download`) VALUES
(1, 1, 1, 'Portrait', '2021-02-21', '58349_829200.jpg', 'Batman', '', 0, '0', 0, 0),
(2, 1, 1, 'Portrait', '2021-02-21', '87861_batman-cyberpunk-x-w7-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(3, 1, 1, 'Portrait', '2021-02-21', '70669_batman-dark-superhero-4k-nm-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(4, 1, 1, 'Portrait', '2021-02-21', '15957_batman-flashpoint-4k-1m-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(5, 1, 1, 'Portrait', '2021-02-21', '11343_batman-michael-keaton-4k-en-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(6, 1, 1, 'Portrait', '2021-02-21', '49430_superman-batman-4k-monochrome-xd-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(7, 1, 1, 'Portrait', '2021-02-21', '78385_the-batman-beyond-4k-nl-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(8, 1, 1, 'Portrait', '2021-02-21', '79586_5k-batman-h2-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(9, 1, 1, 'Portrait', '2021-02-21', '83616_art-batman-bats-64-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(10, 1, 1, 'Portrait', '2021-02-21', '8623_batman-back-10-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(11, 1, 1, 'Portrait', '2021-02-21', '27027_batman-black-knight-0t-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(12, 1, 1, 'Portrait', '2021-02-21', '26581_batman-christian-bale-4k-2020-sj-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(13, 1, 1, 'Portrait', '2021-02-21', '50308_batman-dark-4k-4s-1080x1920.jpg', 'Batman', '', 0, '0', 0, 0),
(14, 1, 2, 'Portrait', '2021-02-21', '94003_810505.jpg', 'Captain America', '', 0, '0', 0, 0),
(15, 1, 2, 'Portrait', '2021-02-21', '29097_792887.jpg', 'Captain America', '', 0, '0', 0, 0),
(16, 1, 2, 'Portrait', '2021-02-21', '73804_794363.jpg', 'Captain America', '', 0, '0', 0, 0),
(17, 1, 2, 'Portrait', '2021-02-21', '11919_798693.png', 'Captain America', '', 0, '0', 0, 0),
(18, 1, 2, 'Portrait', '2021-02-21', '84254_800213.jpg', 'Captain America', '', 0, '0', 0, 0),
(19, 1, 2, 'Portrait', '2021-02-21', '58950_801898.jpg', 'Captain America', '', 0, '0', 1, 0),
(20, 1, 2, 'Portrait', '2021-02-21', '45480_805512.png', 'Captain America', '', 0, '0', 0, 0),
(21, 1, 2, 'Portrait', '2021-02-21', '80557_806558.jpg', 'Captain America', '', 0, '0', 0, 0),
(22, 1, 2, 'Portrait', '2021-02-21', '38319_808332.jpg', 'Captain America', '', 0, '0', 0, 0),
(23, 1, 2, 'Portrait', '2021-02-21', '92004_808420.jpg', 'Captain America', '', 0, '0', 0, 0),
(24, 1, 2, 'Portrait', '2021-02-21', '44125_810188.jpg', 'Captain America', '', 0, '0', 0, 0),
(25, 1, 2, 'Portrait', '2021-02-21', '72064_850215.jpg', 'Captain America', '', 0, '0', 0, 0),
(26, 1, 2, 'Portrait', '2021-02-21', '68_817116.jpg', 'Captain America', '', 0, '0', 0, 0),
(27, 1, 2, 'Portrait', '2021-02-21', '10258_818588.png', 'Captain America', '', 0, '0', 0, 0),
(28, 1, 2, 'Portrait', '2021-02-21', '46803_823488.jpg', 'Captain America', '', 0, '0', 0, 0),
(29, 1, 2, 'Portrait', '2021-02-21', '81063_829233.jpg', 'Captain America', '', 0, '0', 0, 0),
(30, 1, 2, 'Portrait', '2021-02-21', '55336_830765.jpg', 'Captain America', '', 0, '0', 0, 0),
(31, 1, 2, 'Portrait', '2021-02-21', '1989_843838.jpg', 'Captain America', '', 0, '0', 0, 0),
(32, 1, 2, 'Portrait', '2021-02-21', '21933_845645.jpg', 'Captain America', '', 0, '0', 0, 0),
(33, 1, 2, 'Portrait', '2021-02-21', '73405_845852.jpg', 'Captain America', '', 0, '0', 0, 0),
(34, 1, 2, 'Portrait', '2021-02-21', '70063_846743.jpg', 'Captain America', '', 0, '0', 0, 0),
(35, 1, 2, 'Portrait', '2021-02-21', '84336_848831.jpg', 'Captain America', '', 0, '0', 0, 0),
(36, 1, 3, 'Portrait', '2021-02-21', '41984_superman-4kart-xb-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(37, 1, 3, 'Portrait', '2021-02-21', '1930_superman-above-vv-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(38, 1, 3, 'Portrait', '2021-02-21', '73465_superman-art-2020-u8-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(39, 1, 3, 'Portrait', '2021-02-21', '98417_superman-brandon-routh-wj-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(40, 1, 3, 'Portrait', '2021-02-21', '69265_superman-fly-above-ww-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(41, 1, 3, 'Portrait', '2021-02-21', '30135_superman-logo-art-4k-dw-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(42, 1, 3, 'Portrait', '2021-02-21', '43949_superman-man-of-steel-63-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(43, 1, 3, 'Portrait', '2021-02-21', '884_superman-on-fullpower-oc-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(44, 1, 3, 'Portrait', '2021-02-21', '84022_superman-portrait-4m-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(45, 1, 3, 'Portrait', '2021-02-21', '53770_superman-red-cape-up-c4-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(46, 1, 3, 'Portrait', '2021-02-21', '92720_superman-red-eye-bat-signal-0l-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(47, 1, 3, 'Portrait', '2021-02-21', '91096_superman-up-4k-yq-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(48, 1, 3, 'Portrait', '2021-02-21', '89721_superman-x-man-of-steel-4k-j2-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(49, 1, 3, 'Portrait', '2021-02-21', '77935_batman-and-super-man-artwork-cu-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(50, 1, 3, 'Portrait', '2021-02-21', '13115_man-of-steel-artwork-9l-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(51, 1, 3, 'Portrait', '2021-02-21', '72090_superman-4k-2020-te-1080x1920.jpg', 'Superman', '', 0, '0', 0, 0),
(52, 1, 4, 'Portrait', '2021-02-21', '60088_thor-vs-thanos-war-4k-81-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(53, 1, 4, 'Portrait', '2021-02-21', '98309_4k-thor-thunder-r3-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(54, 1, 4, 'Portrait', '2021-02-21', '86528_god-of-thunder-new-art-md-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(55, 1, 4, 'Portrait', '2021-02-21', '30945_old-thor-digital-art-rc-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(56, 1, 4, 'Portrait', '2021-02-21', '32600_strongest-avenger-md-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(57, 1, 4, 'Portrait', '2021-02-21', '54376_thor-4k-2019-u1-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(58, 1, 4, 'Portrait', '2021-02-21', '4838_thor-4k-art-new-kr-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(59, 1, 4, 'Portrait', '2021-02-21', '9056_thor-4karts-ue-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(60, 1, 4, 'Portrait', '2021-02-21', '64379_thor-avengers-endgame-4k-minimalism-r9-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(61, 1, 4, 'Portrait', '2021-02-21', '61865_thor-beard-fa-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(62, 1, 4, 'Portrait', '2021-02-21', '21991_thor-infinity-war-iw-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(63, 1, 4, 'Portrait', '2021-02-21', '84593_thor-love-and-thunder-2021-4k-13-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(64, 1, 4, 'Portrait', '2021-02-21', '98085_thor-minimal-design-1d-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(65, 1, 4, 'Portrait', '2021-02-21', '95776_thor-new-2q-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(66, 1, 4, 'Portrait', '2021-02-21', '29250_thor-ragnarok-superhero-4k-9c-1080x1920.jpg', 'Thor', '', 0, '0', 0, 0),
(67, 1, 5, 'Portrait', '2021-02-21', '5416_197234.jpg', 'Iron Man', '', 0, '0', 0, 0),
(68, 1, 5, 'Portrait', '2021-02-21', '36630_230222.jpg', 'Iron Man', '', 0, '0', 0, 0),
(69, 1, 5, 'Portrait', '2021-02-21', '51429_504585.jpg', 'Iron Man', '', 0, '0', 0, 0),
(70, 1, 5, 'Portrait', '2021-02-21', '23785_736589.jpg', 'Iron Man', '', 0, '0', 0, 0),
(71, 1, 5, 'Portrait', '2021-02-21', '80227_762542.jpg', 'Iron Man', '', 0, '0', 0, 0),
(72, 1, 5, 'Portrait', '2021-02-21', '62630_786605.jpg', 'Iron Man', '', 0, '0', 0, 0),
(73, 1, 5, 'Portrait', '2021-02-21', '73337_786845.jpg', 'Iron Man', '', 0, '0', 0, 0),
(74, 1, 5, 'Portrait', '2021-02-21', '22931_787842.jpg', 'Iron Man', '', 0, '0', 0, 0),
(75, 1, 5, 'Portrait', '2021-02-21', '9093_788045.jpg', 'Iron Man', '', 0, '0', 0, 0),
(76, 1, 5, 'Portrait', '2021-02-21', '48188_793566.jpg', 'Iron Man', '', 0, '0', 0, 0),
(77, 1, 5, 'Portrait', '2021-02-21', '40972_800147.png', 'Iron Man', '', 0, '0', 0, 0),
(78, 1, 5, 'Portrait', '2021-02-21', '15518_804642.png', 'Iron Man', '', 0, '0', 0, 0),
(79, 1, 5, 'Portrait', '2021-02-21', '53411_805692.png', 'Iron Man', '', 0, '0', 0, 0),
(80, 1, 5, 'Portrait', '2021-02-21', '59016_821528.jpg', 'Iron Man', '', 0, '0', 0, 0),
(81, 1, 5, 'Portrait', '2021-02-21', '53215_824693.jpg', 'Iron Man', '', 0, '0', 0, 0),
(82, 1, 5, 'Portrait', '2021-02-21', '78298_824875.jpg', 'Iron Man', '', 0, '0', 0, 0),
(83, 1, 5, 'Portrait', '2021-02-21', '28543_828568.jpg', 'Iron Man', '', 0, '0', 0, 0),
(84, 1, 5, 'Portrait', '2021-02-21', '2675_836602.jpg', 'Iron Man', '', 0, '0', 0, 0),
(85, 1, 5, 'Portrait', '2021-02-21', '58645_842052.jpg', 'Iron Man', '', 0, '0', 0, 0),
(86, 1, 5, 'Portrait', '2021-02-21', '2274_844582.jpg', 'Iron Man', '', 0, '0', 0, 0),
(87, 1, 5, 'Portrait', '2021-02-21', '14578_858802.jpg', 'Iron Man', '', 0, '0', 0, 0),
(88, 1, 5, 'Portrait', '2021-02-21', '88196_845609.jpg', 'Iron Man', '', 0, '0', 0, 0),
(89, 1, 6, 'Portrait', '2021-02-21', '7197_684432.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(90, 1, 6, 'Portrait', '2021-02-21', '79671_706314.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(91, 1, 6, 'Portrait', '2021-02-21', '43225_762347.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(92, 1, 6, 'Portrait', '2021-02-21', '39829_782691.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(93, 1, 6, 'Portrait', '2021-02-21', '83930_810714.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(94, 1, 6, 'Portrait', '2021-02-21', '3853_813348.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(95, 1, 6, 'Portrait', '2021-02-21', '85495_813349.png', 'Wonder Woman', '', 0, '0', 0, 0),
(96, 1, 6, 'Portrait', '2021-02-21', '2705_813351.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(97, 1, 6, 'Portrait', '2021-02-21', '94746_813374.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(98, 1, 6, 'Portrait', '2021-02-21', '59877_813375.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(99, 1, 6, 'Portrait', '2021-02-21', '12173_813378.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(100, 1, 6, 'Portrait', '2021-02-21', '79797_842362.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(101, 1, 6, 'Portrait', '2021-02-21', '59350_846009.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(102, 1, 6, 'Portrait', '2021-02-21', '25642_847954.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(103, 1, 6, 'Portrait', '2021-02-21', '70949_851735.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(104, 1, 6, 'Portrait', '2021-02-21', '19276_856407.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(105, 1, 6, 'Portrait', '2021-02-21', '64287_856433.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(106, 1, 6, 'Portrait', '2021-02-21', '4661_857207.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(107, 1, 6, 'Portrait', '2021-02-21', '27782_857624.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(108, 1, 6, 'Portrait', '2021-02-21', '95217_857633.jpg', 'Wonder Woman', '', 0, '0', 0, 0),
(109, 1, 7, 'Portrait', '2021-02-21', '71063_629928.jpg', 'Flash', '', 0, '0', 0, 0),
(110, 1, 7, 'Portrait', '2021-02-21', '63173_659595.png', 'Flash', '', 0, '0', 0, 0),
(111, 1, 7, 'Portrait', '2021-02-21', '5341_673428.png', 'Flash', '', 0, '0', 0, 0),
(112, 1, 7, 'Portrait', '2021-02-21', '52642_684431.jpg', 'Flash', '', 0, '0', 0, 0),
(113, 1, 7, 'Portrait', '2021-02-21', '69992_739869.jpg', 'Flash', '', 0, '0', 0, 0),
(114, 1, 7, 'Portrait', '2021-02-21', '22263_744000.jpg', 'Flash', '', 0, '0', 0, 0),
(115, 1, 7, 'Portrait', '2021-02-21', '53533_760386.jpg', 'Flash', '', 0, '0', 0, 0),
(116, 1, 7, 'Portrait', '2021-02-21', '88185_761344.jpg', 'Flash', '', 0, '0', 0, 0),
(117, 1, 7, 'Portrait', '2021-02-21', '12881_764319.jpg', 'Flash', '', 0, '0', 0, 0),
(118, 1, 7, 'Portrait', '2021-02-21', '94716_766349.jpg', 'Flash', '', 0, '0', 0, 0),
(119, 1, 7, 'Portrait', '2021-02-21', '74660_778118.jpg', 'Flash', '', 0, '0', 0, 0),
(120, 1, 7, 'Portrait', '2021-02-21', '84292_781676.jpg', 'Flash', '', 0, '0', 0, 0),
(121, 1, 7, 'Portrait', '2021-02-21', '65981_800792.jpg', 'Flash', '', 0, '0', 0, 0),
(122, 1, 7, 'Portrait', '2021-02-21', '36447_802153.jpg', 'Flash', '', 0, '0', 0, 0),
(123, 1, 7, 'Portrait', '2021-02-21', '81644_811942.png', 'Flash', '', 0, '0', 0, 0),
(124, 1, 7, 'Portrait', '2021-02-21', '27102_832401.jpg', 'Flash', '', 0, '0', 0, 0),
(125, 1, 7, 'Portrait', '2021-02-21', '33445_836756.jpg', 'Flash', '', 0, '0', 0, 0),
(126, 1, 7, 'Portrait', '2021-02-21', '7131_88659.jpg', 'Flash', '', 0, '0', 0, 0),
(127, 1, 7, 'Portrait', '2021-02-21', '81169_602777.jpg', 'Flash', '', 0, '0', 0, 0),
(128, 1, 7, 'Portrait', '2021-02-21', '80971_609870.jpg', 'Flash', '', 0, '0', 0, 0),
(129, 1, 1, 'Portrait', '2021-02-21', '2227_789935.jpg', 'Batman', '', 0, '0', 0, 0),
(130, 1, 1, 'Portrait', '2021-02-21', '85307_824480.jpg', 'Batman', '', 0, '0', 0, 0),
(131, 1, 8, 'Portrait', '2021-02-21', '94974_811798.jpg', 'Spider Man', '', 0, '0', 0, 0),
(132, 1, 8, 'Portrait', '2021-02-21', '62618_820371.jpg', 'Spider Man', '', 0, '0', 0, 0),
(133, 1, 8, 'Portrait', '2021-02-21', '13789_823093.png', 'Spider Man', '', 0, '0', 0, 0),
(134, 1, 8, 'Portrait', '2021-02-21', '16133_828694.jpg', 'Spider Man', '', 0, '0', 0, 0),
(135, 1, 8, 'Portrait', '2021-02-21', '1697_838014.jpg', 'Spider Man', '', 0, '0', 0, 0),
(136, 1, 8, 'Portrait', '2021-02-21', '76109_838205.jpg', 'Spider Man', '', 0, '0', 0, 0),
(137, 1, 8, 'Portrait', '2021-02-21', '1576_760140.jpg', 'Spider Man', '', 0, '0', 0, 0),
(138, 1, 8, 'Portrait', '2021-02-21', '3368_761276.jpg', 'Spider Man', '', 0, '0', 0, 0),
(139, 1, 8, 'Portrait', '2021-02-21', '62914_763224.jpg', 'Spider Man', '', 0, '0', 0, 0),
(140, 1, 8, 'Portrait', '2021-02-21', '92275_769327.jpg', 'Spider Man', '', 0, '0', 0, 0),
(141, 1, 8, 'Portrait', '2021-02-21', '54644_788195.jpg', 'Spider Man', '', 0, '0', 0, 0),
(142, 1, 8, 'Portrait', '2021-02-21', '43060_789114.jpg', 'Spider Man', '', 0, '0', 0, 0),
(143, 1, 8, 'Portrait', '2021-02-21', '27372_793704.jpg', 'Spider Man', '', 0, '0', 0, 0),
(144, 1, 8, 'Portrait', '2021-02-21', '99442_798697.png', 'Spider Man', '', 0, '0', 0, 0),
(145, 1, 8, 'Portrait', '2021-02-21', '21083_801238.jpg', 'Spider Man', '', 0, '0', 0, 0),
(146, 1, 8, 'Portrait', '2021-02-21', '40213_802670.jpg', 'Spider Man', '', 0, '0', 0, 0),
(147, 1, 8, 'Portrait', '2021-02-21', '52502_807410.jpg', 'Spider Man', '', 0, '0', 0, 0),
(148, 1, 8, 'Portrait', '2021-02-21', '43801_856703.jpg', 'Spider Man', '', 0, '0', 0, 0),
(149, 1, 8, 'Portrait', '2021-02-21', '17234_759183.jpg', 'Spider Man', '', 0, '0', 0, 0),
(150, 1, 8, 'Portrait', '2021-02-21', '95343_789015.jpg', 'Spider Man', '', 0, '0', 0, 0),
(151, 1, 8, 'Portrait', '2021-02-21', '20933_845075.jpg', 'Spider Man', '', 0, '0', 0, 0),
(152, 1, 8, 'Portrait', '2021-02-21', '41045_849931.jpg', 'Spider Man', '', 0, '0', 0, 0),
(153, 1, 8, 'Portrait', '2021-02-21', '30856_850297.jpg', 'Spider Man', '', 0, '0', 0, 0),
(154, 1, 8, 'Portrait', '2021-02-21', '64401_851208.jpg', 'Spider Man', '', 0, '0', 0, 0),
(155, 1, 8, 'Portrait', '2021-02-21', '86504_853425.jpg', 'Spider Man', '', 0, '0', 0, 0),
(156, 1, 8, 'Portrait', '2021-02-21', '42421_856142.jpg', 'Spider Man', '', 0, '0', 0, 0),
(157, 1, 8, 'Portrait', '2021-02-21', '73179_856702.jpg', 'Spider Man', '', 0, '0', 0, 0),
(158, 1, 8, 'Portrait', '2021-02-21', '51126_785416.png', 'Spider Man', '', 0, '0', 0, 0),
(159, 1, 8, 'Portrait', '2021-02-21', '35381_807411.jpg', 'Spider Man', '', 0, '0', 0, 0),
(160, 1, 8, 'Portrait', '2021-02-21', '67796_811576.jpg', 'Spider Man', '', 0, '0', 0, 0),
(161, 0, 8, 'Portrait', '2021-02-22', '54758_895032.jpg', 'Spider Man', '', 0, '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallpaper_gif`
--

CREATE TABLE `tbl_wallpaper_gif` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `gif_tags` text NOT NULL,
  `total_views` int(11) NOT NULL DEFAULT 0,
  `total_rate` int(11) NOT NULL DEFAULT 0,
  `rate_avg` decimal(11,2) NOT NULL DEFAULT 0.00,
  `total_download` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_active_log`
--
ALTER TABLE `tbl_active_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `tbl_favorite`
--
ALTER TABLE `tbl_favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home_banner`
--
ALTER TABLE `tbl_home_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rating_gif`
--
ALTER TABLE `tbl_rating_gif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_smtp_settings`
--
ALTER TABLE `tbl_smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_report`
--
ALTER TABLE `tbl_user_report`
  ADD PRIMARY KEY (`user_report_id`);

--
-- Indexes for table `tbl_wallpaper`
--
ALTER TABLE `tbl_wallpaper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_wallpaper_gif`
--
ALTER TABLE `tbl_wallpaper_gif`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_active_log`
--
ALTER TABLE `tbl_active_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `color_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_favorite`
--
ALTER TABLE `tbl_favorite`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_home_banner`
--
ALTER TABLE `tbl_home_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rating_gif`
--
ALTER TABLE `tbl_rating_gif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_smtp_settings`
--
ALTER TABLE `tbl_smtp_settings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_report`
--
ALTER TABLE `tbl_user_report`
  MODIFY `user_report_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_wallpaper`
--
ALTER TABLE `tbl_wallpaper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `tbl_wallpaper_gif`
--
ALTER TABLE `tbl_wallpaper_gif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
