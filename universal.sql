-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 15 2020 г., 18:34
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `universal`
--

-- --------------------------------------------------------

--
-- Структура таблицы `universal_commentmeta`
--

CREATE TABLE `universal_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `universal_comments`
--

CREATE TABLE `universal_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_comments`
--

INSERT INTO `universal_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(2, 40, 'Имануил Пупкин', 'ipup@dgs.ru', '', '127.0.0.1', '2020-11-12 23:10:09', '2020-11-12 20:10:09', 'Классная статья! Автору респект!', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.77 YaBrowser/20.11.0.817 Yowser/2.5 Safari/537.36', 'comment', 0, 0),
(3, 40, 'Владимир Петиков', 'admin@kroxplus.ru', 'http://universal.loc', '127.0.0.1', '2020-11-15 18:16:57', '2020-11-15 15:16:57', 'Хочу заметить, что автор этой статьи не написал, что не все могут получить статус самозанятого. Этот режим еще не ввели во всех регионах. Но если в вашем регионе есть, то поздравляю.', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.77 YaBrowser/20.11.0.821 Yowser/2.5 Safari/537.36', 'comment', 0, 1),
(4, 40, 'Владимир Петиков', 'admin@kroxplus.ru', 'http://universal.loc', '127.0.0.1', '2020-11-15 18:17:50', '2020-11-15 15:17:50', 'Если честно, кажется, что этот налоговый режим ввели, чтобы собрать больше денег с народа. Я, конечно, понимаю, что бюджеты надо пополнять, но не лучше ли обложить налогом богатых?', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.77 YaBrowser/20.11.0.821 Yowser/2.5 Safari/537.36', 'comment', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_links`
--

CREATE TABLE `universal_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `universal_options`
--

CREATE TABLE `universal_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_options`
--

INSERT INTO `universal_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://universal.loc', 'yes'),
(2, 'home', 'http://universal.loc', 'yes'),
(3, 'blogname', 'Universal', 'yes'),
(4, 'blogdescription', 'Ещё один сайт на WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin@kroxplus.ru', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:96:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:22:\"cyr2lat/cyr-to-lat.php\";i:1;s:49:\"meks-easy-social-share/meks-easy-social-share.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:3:{i:0;s:77:\"D:\\OpenServer\\domains\\universal.loc/wp-content/plugins/cyr2lat/cyr-to-lat.php\";i:1;s:79:\"D:\\OpenServer\\domains\\universal.loc/wp-content/themes/universal-theme/style.css\";i:2;s:0:\"\";}', 'no'),
(40, 'template', 'universal-theme', 'yes'),
(41, 'stylesheet', 'universal-theme', 'yes'),
(42, 'comment_registration', '', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '48748', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '0', 'yes'),
(60, 'medium_size_h', '0', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '0', 'yes'),
(63, 'large_size_h', '0', 'yes'),
(64, 'image_default_link_type', '', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '3', 'yes'),
(71, 'page_comments', '', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'oldest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:4:\"text\";s:383:\"Universal — это онлайн издание, в котором мы публикуем полезные материалы о веб разработке: статьи, новости, видеоуроки, подборки, ссылки и курсы. Материалы на сайте бесплатны, но при копировании, указывайте ссылку.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '', 'yes'),
(91, 'admin_email_lifespan', '1617200179', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'initial_db_version', '48748', 'yes'),
(96, 'universal_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(97, 'fresh_site', '0', 'yes'),
(98, 'WPLANG', 'ru_RU', 'yes'),
(99, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-posts', 'a:2:{i:2;a:3:{s:5:\"title\";s:6:\"saaass\";s:6:\"number\";i:4;s:9:\"show_date\";b:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'sidebars_widgets', 'a:12:{s:15:\"sidebar-main-01\";a:1:{i:0;s:10:\"calendar-3\";}s:14:\"sidebar-main-1\";a:1:{i:0;s:10:\"calendar-2\";}s:23:\"sidebar-footer-services\";a:1:{i:0;s:11:\"tag_cloud-2\";}s:15:\"sidebar-main-02\";a:1:{i:0;s:11:\"tag_cloud-3\";}s:19:\"sidebar-group-posts\";a:1:{i:0;s:14:\"recent-posts-2\";}s:19:\"wp_inactive_widgets\";a:0:{}s:4:\"main\";a:3:{i:0;s:19:\"downloader_widget-2\";i:1;s:11:\"tag_cloud-4\";i:2;s:22:\"socialnetwork_widget-2\";}s:6:\"main-2\";a:1:{i:0;s:21:\"recent_posts_widget-2\";}s:14:\"sidebar-footer\";a:6:{i:0;s:10:\"nav_menu-2\";i:1;s:10:\"nav_menu-3\";i:2;s:10:\"nav_menu-4\";i:3;s:10:\"nav_menu-5\";i:4;s:10:\"nav_menu-6\";i:5;s:10:\"nav_menu-7\";}s:19:\"sidebar-footer-text\";a:1:{i:0;s:6:\"text-2\";}s:11:\"group-posts\";a:1:{i:0;s:34:\"posts_in_current_category_widget-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(105, 'cron', 'a:7:{i:1605455311;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1605492985;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1605536184;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1605536601;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1605536604;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1605968184;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(106, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_calendar', 'a:3:{i:2;a:1:{s:5:\"title\";s:0:\"\";}i:3;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_tag_cloud', 'a:4:{i:2;a:3:{s:5:\"title\";s:8:\"Теги\";s:5:\"count\";i:1;s:8:\"taxonomy\";s:8:\"post_tag\";}i:3;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"taxonomy\";s:8:\"post_tag\";}i:4;a:3:{s:5:\"title\";s:8:\"Теги\";s:5:\"count\";i:0;s:8:\"taxonomy\";s:8:\"post_tag\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_nav_menu', 'a:7:{i:2;a:2:{s:5:\"title\";s:14:\"Новости\";s:8:\"nav_menu\";i:30;}i:3;a:2:{s:5:\"title\";s:12:\"Статьи\";s:8:\"nav_menu\";i:31;}i:4;a:2:{s:5:\"title\";s:20:\"Видеоуроки\";s:8:\"nav_menu\";i:32;}i:5;a:2:{s:5:\"title\";s:10:\"Курсы\";s:8:\"nav_menu\";i:34;}i:6;a:2:{s:5:\"title\";s:20:\"Информация\";s:8:\"nav_menu\";i:33;}i:7;a:2:{s:5:\"title\";s:18:\"Категории\";s:8:\"nav_menu\";i:35;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(118, 'theme_mods_twentytwenty', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1601929813;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(138, 'can_compress_scripts', '1', 'no'),
(147, 'finished_updating_comment_type', '1', 'yes'),
(158, '_transient_health-check-site-status-result', '{\"good\":\"12\",\"recommended\":\"7\",\"critical\":\"1\"}', 'yes'),
(179, 'current_theme', 'universal-theme', 'yes'),
(180, 'theme_mods_universal-theme', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:11:\"header_menu\";i:2;s:11:\"footer_menu\";i:36;}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:166;}', 'yes'),
(181, 'theme_switched', '', 'yes'),
(198, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(258, 'recently_activated', 'a:0:{}', 'yes'),
(421, 'widget_foo_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(422, 'widget_downloader_widget', 'a:2:{i:2;a:3:{s:5:\"title\";s:73:\"Чек-лист сдачи верстки вашему заказчику\";s:11:\"description\";s:13:\"PDF, 125 Мб\";s:4:\"link\";s:25:\"http://yandex.ru/ssss.txt\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(437, 'widget_socialnetwork_widget', 'a:2:{i:2;a:5:{s:5:\"title\";s:23:\"Наши соцсети\";s:8:\"facebook\";s:24:\"https://www.facebook.com\";s:9:\"instagram\";s:25:\"https://www.instagram.com\";s:7:\"youtube\";s:19:\"https://youtube.com\";s:7:\"twitter\";s:19:\"https://twitter.com\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(520, 'widget_resent_posts_widget', 'a:2:{i:2;a:2:{s:5:\"title\";s:39:\"Недавно опубликовано\";s:5:\"count\";s:1:\"4\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(521, 'widget_recent_posts_widget', 'a:2:{i:2;a:2:{s:5:\"title\";s:39:\"Недавно опубликовано\";s:5:\"count\";s:1:\"7\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(586, 'category_children', 'a:1:{i:16;a:1:{i:0;i:20;}}', 'yes'),
(612, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:17:\"admin@kroxplus.ru\";s:7:\"version\";s:5:\"5.5.3\";s:9:\"timestamp\";i:1604161930;}', 'no'),
(808, 'meks_ess_settings', 'a:7:{s:9:\"platforms\";a:4:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:8:\"whatsapp\";i:3;s:9:\"pinterest\";}s:5:\"style\";s:1:\"7\";s:7:\"variant\";s:1:\"1\";s:5:\"color\";a:2:{s:4:\"type\";s:6:\"custom\";s:12:\"custom_color\";s:7:\"#1e73be\";}s:8:\"location\";s:6:\"custom\";s:9:\"post_type\";a:1:{i:0;s:4:\"post\";}s:11:\"label_share\";a:2:{s:4:\"text\";s:37:\"Поддержите репостом\";s:6:\"active\";s:1:\"1\";}}', 'yes'),
(822, 'widget_posts_in_current_category_widget', 'a:2:{i:2;a:2:{s:5:\"title\";s:42:\"Заголовок по умолчанию\";s:5:\"count\";s:1:\"4\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(824, 'recovery_mode_email_last_sent', '1604959096', 'yes'),
(844, '_site_transient_timeout_browser_b0698b39a5beb56111027a5783b8f2f1', '1605817059', 'no'),
(845, '_site_transient_browser_b0698b39a5beb56111027a5783b8f2f1', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"86.0.4240.77\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(846, '_site_transient_timeout_php_check_a5b4d2808570efd012607394df5c6fa9', '1605817060', 'no'),
(847, '_site_transient_php_check_a5b4d2808570efd012607394df5c6fa9', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(863, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.5.3.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-5.5.3.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.3\";s:7:\"version\";s:5:\"5.5.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1605449821;s:15:\"version_checked\";s:5:\"5.5.3\";s:12:\"translations\";a:0:{}}', 'no'),
(864, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1605449828;s:7:\"checked\";a:2:{s:17:\"universal-example\";s:5:\"1.0.0\";s:15:\"universal-theme\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(865, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1605449828;s:7:\"checked\";a:2:{s:22:\"cyr2lat/cyr-to-lat.php\";s:5:\"4.5.0\";s:49:\"meks-easy-social-share/meks-easy-social-share.php\";s:5:\"1.2.1\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:22:\"cyr2lat/cyr-to-lat.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/cyr2lat\";s:4:\"slug\";s:7:\"cyr2lat\";s:6:\"plugin\";s:22:\"cyr2lat/cyr-to-lat.php\";s:11:\"new_version\";s:5:\"4.5.0\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/cyr2lat/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/cyr2lat.4.5.0.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/cyr2lat/assets/icon-256x256.jpg?rev=2022835\";s:2:\"1x\";s:52:\"https://ps.w.org/cyr2lat/assets/icon.svg?rev=2022835\";s:3:\"svg\";s:52:\"https://ps.w.org/cyr2lat/assets/icon.svg?rev=2022835\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/cyr2lat/assets/banner-1544x500.png?rev=2022835\";s:2:\"1x\";s:62:\"https://ps.w.org/cyr2lat/assets/banner-772x250.png?rev=2022835\";}s:11:\"banners_rtl\";a:0:{}}s:49:\"meks-easy-social-share/meks-easy-social-share.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/meks-easy-social-share\";s:4:\"slug\";s:22:\"meks-easy-social-share\";s:6:\"plugin\";s:49:\"meks-easy-social-share/meks-easy-social-share.php\";s:11:\"new_version\";s:5:\"1.2.1\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/meks-easy-social-share/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/meks-easy-social-share.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/meks-easy-social-share/assets/icon-256x256.png?rev=2092911\";s:2:\"1x\";s:75:\"https://ps.w.org/meks-easy-social-share/assets/icon-128x128.png?rev=2092911\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:77:\"https://ps.w.org/meks-easy-social-share/assets/banner-772x250.jpg?rev=2092911\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(870, '_site_transient_timeout_php_check_f9714bbe413cc376a70847d9c1f86fcc', '1606034352', 'no'),
(871, '_site_transient_php_check_f9714bbe413cc376a70847d9c1f86fcc', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(881, '_site_transient_timeout_theme_roots', '1605451626', 'no'),
(882, '_site_transient_theme_roots', 'a:2:{s:17:\"universal-example\";s:7:\"/themes\";s:15:\"universal-theme\";s:7:\"/themes\";}', 'no'),
(885, '_site_transient_timeout_browser_dbe2cd8f5320b3df81d05d96ac12f7f6', '1606058032', 'no'),
(886, '_site_transient_browser_dbe2cd8f5320b3df81d05d96ac12f7f6', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"86.0.4240.77\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `universal_postmeta`
--

CREATE TABLE `universal_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_postmeta`
--

INSERT INTO `universal_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(29, 17, '_wp_attached_file', '2020/10/logo.png'),
(30, 17, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:163;s:6:\"height\";i:40;s:4:\"file\";s:16:\"2020/10/logo.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"logo-150x40.png\";s:5:\"width\";i:150;s:6:\"height\";i:40;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(31, 18, '_wp_attached_file', '2020/10/cropped-logo.png'),
(32, 18, '_wp_attachment_context', 'custom-logo'),
(33, 18, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:163;s:6:\"height\";i:40;s:4:\"file\";s:24:\"2020/10/cropped-logo.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"cropped-logo-150x40.png\";s:5:\"width\";i:150;s:6:\"height\";i:40;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(38, 20, '_menu_item_type', 'custom'),
(39, 20, '_menu_item_menu_item_parent', '0'),
(40, 20, '_menu_item_object_id', '20'),
(41, 20, '_menu_item_object', 'custom'),
(42, 20, '_menu_item_target', ''),
(43, 20, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(44, 20, '_menu_item_xfn', ''),
(45, 20, '_menu_item_url', '#'),
(47, 21, '_menu_item_type', 'custom'),
(48, 21, '_menu_item_menu_item_parent', '0'),
(49, 21, '_menu_item_object_id', '21'),
(50, 21, '_menu_item_object', 'custom'),
(51, 21, '_menu_item_target', ''),
(52, 21, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(53, 21, '_menu_item_xfn', ''),
(54, 21, '_menu_item_url', '#'),
(56, 22, '_menu_item_type', 'custom'),
(57, 22, '_menu_item_menu_item_parent', '0'),
(58, 22, '_menu_item_object_id', '22'),
(59, 22, '_menu_item_object', 'custom'),
(60, 22, '_menu_item_target', ''),
(61, 22, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(62, 22, '_menu_item_xfn', ''),
(63, 22, '_menu_item_url', '#'),
(65, 23, '_menu_item_type', 'custom'),
(66, 23, '_menu_item_menu_item_parent', '0'),
(67, 23, '_menu_item_object_id', '23'),
(68, 23, '_menu_item_object', 'custom'),
(69, 23, '_menu_item_target', ''),
(70, 23, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(71, 23, '_menu_item_xfn', ''),
(72, 23, '_menu_item_url', '#'),
(74, 24, '_menu_item_type', 'custom'),
(75, 24, '_menu_item_menu_item_parent', '0'),
(76, 24, '_menu_item_object_id', '24'),
(77, 24, '_menu_item_object', 'custom'),
(78, 24, '_menu_item_target', ''),
(79, 24, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(80, 24, '_menu_item_xfn', ''),
(81, 24, '_menu_item_url', '#'),
(83, 25, '_menu_item_type', 'custom'),
(84, 25, '_menu_item_menu_item_parent', '0'),
(85, 25, '_menu_item_object_id', '25'),
(86, 25, '_menu_item_object', 'custom'),
(87, 25, '_menu_item_target', ''),
(88, 25, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(89, 25, '_menu_item_xfn', ''),
(90, 25, '_menu_item_url', '#'),
(92, 26, '_menu_item_type', 'custom'),
(93, 26, '_menu_item_menu_item_parent', '0'),
(94, 26, '_menu_item_object_id', '26'),
(95, 26, '_menu_item_object', 'custom'),
(96, 26, '_menu_item_target', ''),
(97, 26, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(98, 26, '_menu_item_xfn', ''),
(99, 26, '_menu_item_url', '#'),
(106, 30, '_edit_lock', '1602706916:1'),
(111, 32, '_wp_attached_file', '2020/10/post-img-3.jpg'),
(112, 32, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:22:\"2020/10/post-img-3.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"post-img-3-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"post-img-3-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"post-img-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"post-img-3-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:24:\"post-img-3-1536x1024.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(115, 30, '_thumbnail_id', '32'),
(116, 33, '_edit_lock', '1602706892:1'),
(119, 35, '_edit_lock', '1602688274:1'),
(122, 37, '_edit_lock', '1602706741:1'),
(126, 40, '_edit_lock', '1602688238:1'),
(129, 42, '_edit_lock', '1602706786:1'),
(142, 50, '_edit_lock', '1602706721:1'),
(147, 54, '_wp_attached_file', '2020/10/image-scaled.jpg'),
(148, 54, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2560;s:6:\"height\";i:1705;s:4:\"file\";s:24:\"2020/10/image-scaled.jpg\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"image-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:18:\"image-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"image-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:17:\"image-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:19:\"image-1536x1023.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1023;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"2048x2048\";a:4:{s:4:\"file\";s:19:\"image-2048x1364.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1364;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:9:\"image.jpg\";}'),
(151, 50, '_thumbnail_id', '54'),
(152, 37, '_edit_last', '1'),
(155, 37, '_wp_old_slug', 'топ-10-плагинов-для-figma'),
(158, 42, '_edit_last', '1'),
(161, 42, '_wp_old_slug', 'где-взять-реальные-проекты-для-портфо'),
(162, 40, '_edit_last', '1'),
(165, 40, '_wp_old_slug', 'как-использовать-css-float-после-того-как-выш'),
(166, 35, '_edit_last', '1'),
(169, 35, '_wp_old_slug', 'правильно-вставляем-картинку-на-сайт'),
(170, 33, '_edit_last', '1'),
(173, 33, '_wp_old_slug', 'на-каком-стандарте-писать-скрипты-есл'),
(176, 56, '_wp_attached_file', '2020/10/post-img-1.jpg'),
(177, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:22:\"2020/10/post-img-1.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"post-img-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(178, 57, '_wp_attached_file', '2020/10/post-img-2.jpg'),
(179, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:22:\"2020/10/post-img-2.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"post-img-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(186, 61, '_wp_attached_file', '2020/10/post-img-9.jpg'),
(187, 61, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1281;s:4:\"file\";s:22:\"2020/10/post-img-9.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"post-img-9-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(188, 62, '_wp_attached_file', '2020/10/post-img-6.jpg'),
(189, 62, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1514;s:4:\"file\";s:22:\"2020/10/post-img-6.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"post-img-6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(192, 42, '_thumbnail_id', '61'),
(193, 63, '_edit_lock', '1602970184:1'),
(196, 63, '_thumbnail_id', '56'),
(197, 65, '_edit_lock', '1603356151:1'),
(200, 65, '_thumbnail_id', '57'),
(201, 67, '_edit_lock', '1602688158:1'),
(204, 67, '_thumbnail_id', '62'),
(213, 72, '_edit_lock', '1602706669:1'),
(216, 72, '_thumbnail_id', '32'),
(221, 63, '_edit_last', '1'),
(226, 63, '_wp_old_slug', 'стоит-ли-принимать-предложение-о-рабо'),
(263, 88, '_wp_attached_file', '2020/10/post-img-5.jpg'),
(264, 88, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:22:\"2020/10/post-img-5.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"post-img-5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(265, 89, '_wp_attached_file', '2020/10/post-img-7.jpg'),
(266, 89, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:22:\"2020/10/post-img-7.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"post-img-7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(269, 37, '_thumbnail_id', '88'),
(278, 92, '_wp_attached_file', '2020/10/img-money-banknotes.jpg'),
(279, 92, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:31:\"2020/10/img-money-banknotes.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"img-money-banknotes-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(280, 93, '_edit_lock', '1604646606:1'),
(286, 95, '_wp_attached_file', '2020/10/img-money-coins.jpg'),
(287, 95, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:27:\"2020/10/img-money-coins.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"img-money-coins-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:8:\"post-img\";a:4:{s:4:\"file\";s:27:\"img-money-coins-335x195.jpg\";s:5:\"width\";i:335;s:6:\"height\";i:195;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(290, 93, '_thumbnail_id', '95'),
(291, 96, '_edit_lock', '1604588048:1'),
(300, 102, '_wp_attached_file', '2020/10/image-dev-01.jpg'),
(301, 102, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:24:\"2020/10/image-dev-01.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"image-dev-01-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(309, 107, '_edit_lock', '1604595704:1'),
(312, 109, '_menu_item_type', 'custom'),
(313, 109, '_menu_item_menu_item_parent', '0'),
(314, 109, '_menu_item_object_id', '109'),
(315, 109, '_menu_item_object', 'custom'),
(316, 109, '_menu_item_target', ''),
(317, 109, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(318, 109, '_menu_item_xfn', ''),
(319, 109, '_menu_item_url', '#'),
(321, 110, '_menu_item_type', 'custom'),
(322, 110, '_menu_item_menu_item_parent', '0'),
(323, 110, '_menu_item_object_id', '110'),
(324, 110, '_menu_item_object', 'custom'),
(325, 110, '_menu_item_target', ''),
(326, 110, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(327, 110, '_menu_item_xfn', ''),
(328, 110, '_menu_item_url', '#'),
(330, 111, '_menu_item_type', 'custom'),
(331, 111, '_menu_item_menu_item_parent', '0'),
(332, 111, '_menu_item_object_id', '111'),
(333, 111, '_menu_item_object', 'custom'),
(334, 111, '_menu_item_target', ''),
(335, 111, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(336, 111, '_menu_item_xfn', ''),
(337, 111, '_menu_item_url', '#'),
(339, 112, '_menu_item_type', 'custom'),
(340, 112, '_menu_item_menu_item_parent', '0'),
(341, 112, '_menu_item_object_id', '112'),
(342, 112, '_menu_item_object', 'custom'),
(343, 112, '_menu_item_target', ''),
(344, 112, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(345, 112, '_menu_item_xfn', ''),
(346, 112, '_menu_item_url', '#'),
(348, 113, '_menu_item_type', 'taxonomy'),
(349, 113, '_menu_item_menu_item_parent', '0'),
(350, 113, '_menu_item_object_id', '3'),
(351, 113, '_menu_item_object', 'category'),
(352, 113, '_menu_item_target', ''),
(353, 113, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(354, 113, '_menu_item_xfn', ''),
(355, 113, '_menu_item_url', ''),
(357, 114, '_menu_item_type', 'taxonomy'),
(358, 114, '_menu_item_menu_item_parent', '0'),
(359, 114, '_menu_item_object_id', '4'),
(360, 114, '_menu_item_object', 'category'),
(361, 114, '_menu_item_target', ''),
(362, 114, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(363, 114, '_menu_item_xfn', ''),
(364, 114, '_menu_item_url', ''),
(366, 115, '_menu_item_type', 'taxonomy'),
(367, 115, '_menu_item_menu_item_parent', '0'),
(368, 115, '_menu_item_object_id', '5'),
(369, 115, '_menu_item_object', 'category'),
(370, 115, '_menu_item_target', ''),
(371, 115, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(372, 115, '_menu_item_xfn', ''),
(373, 115, '_menu_item_url', ''),
(375, 116, '_menu_item_type', 'taxonomy'),
(376, 116, '_menu_item_menu_item_parent', '0'),
(377, 116, '_menu_item_object_id', '6'),
(378, 116, '_menu_item_object', 'category'),
(379, 116, '_menu_item_target', ''),
(380, 116, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(381, 116, '_menu_item_xfn', ''),
(382, 116, '_menu_item_url', ''),
(384, 117, '_menu_item_type', 'custom'),
(385, 117, '_menu_item_menu_item_parent', '0'),
(386, 117, '_menu_item_object_id', '117'),
(387, 117, '_menu_item_object', 'custom'),
(388, 117, '_menu_item_target', ''),
(389, 117, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(390, 117, '_menu_item_xfn', ''),
(391, 117, '_menu_item_url', '#'),
(393, 118, '_menu_item_type', 'custom'),
(394, 118, '_menu_item_menu_item_parent', '0'),
(395, 118, '_menu_item_object_id', '118'),
(396, 118, '_menu_item_object', 'custom'),
(397, 118, '_menu_item_target', ''),
(398, 118, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(399, 118, '_menu_item_xfn', ''),
(400, 118, '_menu_item_url', '#'),
(402, 119, '_menu_item_type', 'custom'),
(403, 119, '_menu_item_menu_item_parent', '0'),
(404, 119, '_menu_item_object_id', '119'),
(405, 119, '_menu_item_object', 'custom'),
(406, 119, '_menu_item_target', ''),
(407, 119, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(408, 119, '_menu_item_xfn', ''),
(409, 119, '_menu_item_url', '#'),
(411, 120, '_menu_item_type', 'custom'),
(412, 120, '_menu_item_menu_item_parent', '0'),
(413, 120, '_menu_item_object_id', '120'),
(414, 120, '_menu_item_object', 'custom'),
(415, 120, '_menu_item_target', ''),
(416, 120, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(417, 120, '_menu_item_xfn', ''),
(418, 120, '_menu_item_url', '#'),
(420, 121, '_menu_item_type', 'custom'),
(421, 121, '_menu_item_menu_item_parent', '0'),
(422, 121, '_menu_item_object_id', '121'),
(423, 121, '_menu_item_object', 'custom'),
(424, 121, '_menu_item_target', ''),
(425, 121, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(426, 121, '_menu_item_xfn', ''),
(427, 121, '_menu_item_url', '#'),
(429, 122, '_menu_item_type', 'custom'),
(430, 122, '_menu_item_menu_item_parent', '0'),
(431, 122, '_menu_item_object_id', '122'),
(432, 122, '_menu_item_object', 'custom'),
(433, 122, '_menu_item_target', ''),
(434, 122, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(435, 122, '_menu_item_xfn', ''),
(436, 122, '_menu_item_url', '#'),
(438, 123, '_menu_item_type', 'custom'),
(439, 123, '_menu_item_menu_item_parent', '0'),
(440, 123, '_menu_item_object_id', '123'),
(441, 123, '_menu_item_object', 'custom'),
(442, 123, '_menu_item_target', ''),
(443, 123, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(444, 123, '_menu_item_xfn', ''),
(445, 123, '_menu_item_url', '#'),
(447, 124, '_menu_item_type', 'custom'),
(448, 124, '_menu_item_menu_item_parent', '0'),
(449, 124, '_menu_item_object_id', '124'),
(450, 124, '_menu_item_object', 'custom'),
(451, 124, '_menu_item_target', ''),
(452, 124, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(453, 124, '_menu_item_xfn', ''),
(454, 124, '_menu_item_url', '#'),
(456, 125, '_menu_item_type', 'custom'),
(457, 125, '_menu_item_menu_item_parent', '0'),
(458, 125, '_menu_item_object_id', '125'),
(459, 125, '_menu_item_object', 'custom'),
(460, 125, '_menu_item_target', ''),
(461, 125, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(462, 125, '_menu_item_xfn', ''),
(463, 125, '_menu_item_url', '#'),
(465, 126, '_menu_item_type', 'custom'),
(466, 126, '_menu_item_menu_item_parent', '0'),
(467, 126, '_menu_item_object_id', '126'),
(468, 126, '_menu_item_object', 'custom'),
(469, 126, '_menu_item_target', ''),
(470, 126, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(471, 126, '_menu_item_xfn', ''),
(472, 126, '_menu_item_url', '#'),
(474, 127, '_menu_item_type', 'custom'),
(475, 127, '_menu_item_menu_item_parent', '0'),
(476, 127, '_menu_item_object_id', '127'),
(477, 127, '_menu_item_object', 'custom'),
(478, 127, '_menu_item_target', ''),
(479, 127, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(480, 127, '_menu_item_xfn', ''),
(481, 127, '_menu_item_url', '#'),
(483, 128, '_menu_item_type', 'custom'),
(484, 128, '_menu_item_menu_item_parent', '0'),
(485, 128, '_menu_item_object_id', '128'),
(486, 128, '_menu_item_object', 'custom'),
(487, 128, '_menu_item_target', ''),
(488, 128, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(489, 128, '_menu_item_xfn', ''),
(490, 128, '_menu_item_url', '#'),
(492, 129, '_menu_item_type', 'taxonomy'),
(493, 129, '_menu_item_menu_item_parent', '0'),
(494, 129, '_menu_item_object_id', '16'),
(495, 129, '_menu_item_object', 'category'),
(496, 129, '_menu_item_target', ''),
(497, 129, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(498, 129, '_menu_item_xfn', ''),
(499, 129, '_menu_item_url', ''),
(501, 130, '_menu_item_type', 'taxonomy'),
(502, 130, '_menu_item_menu_item_parent', '0'),
(503, 130, '_menu_item_object_id', '20'),
(504, 130, '_menu_item_object', 'category'),
(505, 130, '_menu_item_target', ''),
(506, 130, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(507, 130, '_menu_item_xfn', ''),
(508, 130, '_menu_item_url', ''),
(510, 131, '_menu_item_type', 'taxonomy'),
(511, 131, '_menu_item_menu_item_parent', '0'),
(512, 131, '_menu_item_object_id', '23'),
(513, 131, '_menu_item_object', 'category'),
(514, 131, '_menu_item_target', ''),
(515, 131, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(516, 131, '_menu_item_xfn', ''),
(517, 131, '_menu_item_url', ''),
(519, 132, '_menu_item_type', 'taxonomy'),
(520, 132, '_menu_item_menu_item_parent', '0'),
(521, 132, '_menu_item_object_id', '27'),
(522, 132, '_menu_item_object', 'category'),
(523, 132, '_menu_item_target', ''),
(524, 132, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(525, 132, '_menu_item_xfn', ''),
(526, 132, '_menu_item_url', ''),
(528, 2, '_edit_lock', '1604049674:1'),
(529, 2, '_wp_trash_meta_status', 'publish'),
(530, 2, '_wp_trash_meta_status', 'publish'),
(531, 2, '_wp_trash_meta_time', '1604049688'),
(532, 2, '_wp_trash_meta_time', '1604049688'),
(533, 2, '_wp_desired_post_slug', 'sample-page'),
(534, 2, '_wp_desired_post_slug', 'sample-page'),
(535, 134, '_edit_lock', '1604049653:1'),
(536, 136, '_edit_lock', '1604049750:1'),
(537, 138, '_edit_lock', '1604049866:1'),
(538, 140, '_edit_lock', '1604049897:1'),
(539, 142, '_menu_item_type', 'post_type'),
(540, 142, '_menu_item_menu_item_parent', '0'),
(541, 142, '_menu_item_object_id', '140'),
(542, 142, '_menu_item_object', 'page'),
(543, 142, '_menu_item_target', ''),
(544, 142, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(545, 142, '_menu_item_xfn', ''),
(546, 142, '_menu_item_url', ''),
(548, 143, '_menu_item_type', 'post_type'),
(549, 143, '_menu_item_menu_item_parent', '0'),
(550, 143, '_menu_item_object_id', '138'),
(551, 143, '_menu_item_object', 'page'),
(552, 143, '_menu_item_target', ''),
(553, 143, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(554, 143, '_menu_item_xfn', ''),
(555, 143, '_menu_item_url', ''),
(557, 144, '_menu_item_type', 'post_type'),
(558, 144, '_menu_item_menu_item_parent', '0'),
(559, 144, '_menu_item_object_id', '136'),
(560, 144, '_menu_item_object', 'page'),
(561, 144, '_menu_item_target', ''),
(562, 144, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(563, 144, '_menu_item_xfn', ''),
(564, 144, '_menu_item_url', ''),
(566, 145, '_menu_item_type', 'post_type'),
(567, 145, '_menu_item_menu_item_parent', '0'),
(568, 145, '_menu_item_object_id', '134'),
(569, 145, '_menu_item_object', 'page'),
(570, 145, '_menu_item_target', ''),
(571, 145, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(572, 145, '_menu_item_xfn', ''),
(573, 145, '_menu_item_url', ''),
(575, 20, '_wp_old_slug', 'статьи'),
(576, 21, '_wp_old_slug', 'новости'),
(577, 22, '_wp_old_slug', 'курсы'),
(578, 30, '_wp_old_slug', 'возможности-css-grid-layout-которые-уже-можно-при'),
(579, 50, '_wp_old_slug', 'расширение-chrome-защищает-от-атак'),
(580, 65, '_wp_old_slug', 'новый-налоговый-режим-для-фрилансеро'),
(581, 67, '_wp_old_slug', 'в-вашем-портфолио-могут-быть-фейковые'),
(582, 72, '_wp_old_slug', 'новый-взгляд-на-адаптивную-верстку-са'),
(583, 93, '_wp_old_slug', 'расследование-недели-сколько-зараба'),
(584, 96, '_wp_old_slug', 'выбор-читателей-где-удобнее-работать'),
(585, 107, '_wp_old_slug', 'вопросы-на-собеседовании-для-джуна'),
(586, 109, '_wp_old_slug', 'обновления'),
(587, 110, '_wp_old_slug', 'экспресс'),
(588, 117, '_wp_old_slug', 'скринкасты'),
(589, 118, '_wp_old_slug', 'уроки'),
(590, 119, '_wp_old_slug', 'вебинары'),
(591, 120, '_wp_old_slug', 'политика-данных'),
(592, 121, '_wp_old_slug', 'оферта-сайта'),
(593, 122, '_wp_old_slug', 'реквизиты'),
(594, 123, '_wp_old_slug', 'контакты'),
(595, 124, '_wp_old_slug', 'платные-интенсивы'),
(596, 125, '_wp_old_slug', 'бесплатные-стримы'),
(597, 126, '_wp_old_slug', 'мастер-классы'),
(598, 127, '_wp_old_slug', 'менторство'),
(599, 128, '_wp_old_slug', 'буткемпы'),
(600, 129, '_wp_old_slug', 'статьи-2'),
(601, 130, '_wp_old_slug', 'расследования'),
(602, 134, '_wp_old_slug', 'контакты'),
(603, 136, '_wp_old_slug', 'работа-у-нас'),
(604, 138, '_wp_old_slug', 'реклама'),
(605, 140, '_wp_old_slug', 'партнерство'),
(606, 147, '_wp_attached_file', '2020/11/image-dev-02.jpg'),
(607, 147, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:24:\"2020/11/image-dev-02.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"image-dev-02-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(608, 148, '_wp_attached_file', '2020/11/image-dev-03.jpg'),
(609, 148, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1280;s:4:\"file\";s:24:\"2020/11/image-dev-03.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:24:\"image-dev-03-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(614, 152, '_wp_attached_file', '2020/11/image-nature-01.jpg'),
(615, 152, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:1433;s:4:\"file\";s:27:\"2020/11/image-nature-01.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"image-nature-01-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(630, 161, '_wp_attached_file', '2020/11/cropped-logo-new.png'),
(631, 161, '_wp_attachment_context', 'custom-logo'),
(632, 161, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:163;s:6:\"height\";i:146;s:4:\"file\";s:28:\"2020/11/cropped-logo-new.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"cropped-logo-new-150x146.png\";s:5:\"width\";i:150;s:6:\"height\";i:146;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(633, 162, '_edit_lock', '1604762418:1'),
(634, 162, '_wp_trash_meta_status', 'publish'),
(635, 162, '_wp_trash_meta_time', '1604741592'),
(636, 163, '_wp_trash_meta_status', 'publish'),
(637, 163, '_wp_trash_meta_time', '1604742050'),
(640, 165, '_wp_trash_meta_status', 'publish'),
(641, 165, '_wp_trash_meta_time', '1604925797'),
(642, 166, '_wp_attached_file', '2020/11/logo.png'),
(643, 166, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:40;s:6:\"height\";i:40;s:4:\"file\";s:16:\"2020/11/logo.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(644, 167, '_wp_trash_meta_status', 'publish'),
(645, 167, '_wp_trash_meta_time', '1605008103');

-- --------------------------------------------------------

--
-- Структура таблицы `universal_posts`
--

CREATE TABLE `universal_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_posts`
--

INSERT INTO `universal_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(2, 1, '2020-10-02 17:16:23', '2020-10-02 14:16:23', '<!-- wp:paragraph -->\n<p>Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице &laquo;Детали&raquo; владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Привет! Днём я курьер, а вечером &#8212; подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...или так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Компания &laquo;Штучки XYZ&raquo; была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href=\"http://universal.loc/wp-admin/\">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Пример страницы', '', 'trash', 'closed', 'open', '', 'sample-page__trashed', '', '', '2020-10-30 12:21:28', '2020-10-30 09:21:28', '', 0, 'http://universal.loc/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-10-02 17:16:23', '2020-10-02 14:16:23', '<!-- wp:heading --><h2>Кто мы</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Наш адрес сайта: http://universal.loc.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие персональные данные мы собираем и с какой целью</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Комментарии</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если посетитель оставляет комментарий на сайте, мы собираем данные указанные в форме комментария, а также IP адрес посетителя и данные user-agent браузера с целью определения спама.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Анонимизированная строка создаваемая из вашего адреса email (\"хеш\") может предоставляться сервису Gravatar, чтобы определить используете ли вы его. Политика конфиденциальности Gravatar доступна здесь: https://automattic.com/privacy/ . После одобрения комментария ваше изображение профиля будет видимым публично в контексте вашего комментария.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Медиафайлы</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы зарегистрированный пользователь и загружаете фотографии на сайт, вам возможно следует избегать загрузки изображений с метаданными EXIF, так как они могут содержать данные вашего месторасположения по GPS. Посетители могут извлечь эту информацию скачав изображения с сайта.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Формы контактов</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Куки</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий на нашем сайте, вы можете включить сохранение вашего имени, адреса email и вебсайта в куки. Это делается для вашего удобства, чтобы не заполнять данные снова при повторном комментировании. Эти куки хранятся в течение одного года.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Если у вас есть учетная запись на сайте и вы войдете в неё, мы установим временный куки для определения поддержки куки вашим браузером, куки не содержит никакой личной информации и удаляется при закрытии вашего браузера.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При входе в учетную запись мы также устанавливаем несколько куки с данными входа и настройками экрана. Куки входа хранятся в течение двух дней, куки с настройками экрана - год. Если вы выберете возможность \"Запомнить меня\", данные о входе будут сохраняться в течение двух недель. При выходе из учетной записи куки входа будут удалены.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>При редактировании или публикации статьи в браузере будет сохранен дополнительный куки, он не содержит персональных данных и содержит только ID записи отредактированной вами, истекает через 1 день.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Встраиваемое содержимое других вебсайтов</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Статьи на этом сайте могут включать встраиваемое содержимое (например видео, изображения, статьи и др.), подобное содержимое ведет себя так же, как если бы посетитель зашел на другой сайт.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Эти сайты могут собирать данные о вас, использовать куки, внедрять дополнительное отслеживание третьей стороной и следить за вашим взаимодействием с внедренным содержимым, включая отслеживание взаимодействия, если у вас есть учетная запись и вы авторизовались на том сайте.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Веб-аналитика</h3><!-- /wp:heading --><!-- wp:heading --><h2>С кем мы делимся вашими данными</h2><!-- /wp:heading --><!-- wp:heading --><h2>Как долго мы храним ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Если вы оставляете комментарий, то сам комментарий и его метаданные сохраняются неопределенно долго. Это делается для того, чтобы определять и одобрять последующие комментарии автоматически, вместо помещения их в очередь на одобрение.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Для пользователей с регистрацией на нашем сайте мы храним ту личную информацию, которую они указывают в своем профиле. Все пользователи могут видеть, редактировать или удалить свою информацию из профиля в любое время (кроме имени пользователя). Администрация вебсайта также может видеть и изменять эту информацию.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Какие у вас права на ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>При наличии учетной записи на сайте или если вы оставляли комментарии, то вы можете запросить файл экспорта персональных данных, которые мы сохранили о вас, включая предоставленные вами данные. Вы также можете запросить удаление этих данных, это не включает данные, которые мы обязаны хранить в административных целях, по закону или целях безопасности.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Куда мы отправляем ваши данные</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Комментарии пользователей могут проверяться автоматическим сервисом определения спама.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ваша контактная информация</h2><!-- /wp:heading --><!-- wp:heading --><h2>Дополнительная информация</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Как мы защищаем ваши данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие принимаются процедуры против взлома данных</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>От каких третьих сторон мы получаем данные</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Какие автоматические решения принимаются на основе данных пользователей</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Требования к раскрытию отраслевых нормативных требований</h3><!-- /wp:heading -->', 'Политика конфиденциальности', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-10-02 17:16:23', '2020-10-02 14:16:23', '', 0, 'http://universal.loc/?page_id=3', 0, 'page', '', 0),
(17, 1, '2020-10-07 23:10:40', '2020-10-07 20:10:40', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2020-10-07 23:10:40', '2020-10-07 20:10:40', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/logo.png', 0, 'attachment', 'image/png', 0),
(18, 1, '2020-10-07 23:10:58', '2020-10-07 20:10:58', 'http://universal.loc/wp-content/uploads/2020/10/cropped-logo.png', 'cropped-logo.png', '', 'inherit', 'open', 'closed', '', 'cropped-logo-png', '', '', '2020-10-07 23:10:58', '2020-10-07 20:10:58', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/cropped-logo.png', 0, 'attachment', 'image/png', 0),
(20, 1, '2020-10-07 23:31:38', '2020-10-07 20:31:38', '', 'Статьи', '', 'publish', 'closed', 'closed', '', 'stati', '', '', '2020-10-07 23:50:27', '2020-10-07 20:50:27', '', 0, 'http://universal.loc/?p=20', 1, 'nav_menu_item', '', 0),
(21, 1, '2020-10-07 23:31:38', '2020-10-07 20:31:38', '', 'Новости', '', 'publish', 'closed', 'closed', '', 'novosti', '', '', '2020-10-07 23:50:28', '2020-10-07 20:50:28', '', 0, 'http://universal.loc/?p=21', 2, 'nav_menu_item', '', 0),
(22, 1, '2020-10-07 23:31:39', '2020-10-07 20:31:39', '', 'Курсы', '', 'publish', 'closed', 'closed', '', 'kursy', '', '', '2020-10-07 23:50:28', '2020-10-07 20:50:28', '', 0, 'http://universal.loc/?p=22', 3, 'nav_menu_item', '', 0),
(23, 1, '2020-10-07 23:31:39', '2020-10-07 20:31:39', '', 'HTML', '', 'publish', 'closed', 'closed', '', 'html', '', '', '2020-10-07 23:50:28', '2020-10-07 20:50:28', '', 0, 'http://universal.loc/?p=23', 4, 'nav_menu_item', '', 0),
(24, 1, '2020-10-07 23:31:39', '2020-10-07 20:31:39', '', 'CSS', '', 'publish', 'closed', 'closed', '', 'css', '', '', '2020-10-07 23:50:28', '2020-10-07 20:50:28', '', 0, 'http://universal.loc/?p=24', 5, 'nav_menu_item', '', 0),
(25, 1, '2020-10-07 23:31:39', '2020-10-07 20:31:39', '', 'JavaScript', '', 'publish', 'closed', 'closed', '', 'javascript', '', '', '2020-10-07 23:50:28', '2020-10-07 20:50:28', '', 0, 'http://universal.loc/?p=25', 6, 'nav_menu_item', '', 0),
(26, 1, '2020-10-07 23:31:39', '2020-10-07 20:31:39', '', 'Web Design', '', 'publish', 'closed', 'closed', '', 'web-design', '', '', '2020-10-07 23:50:28', '2020-10-07 20:50:28', '', 0, 'http://universal.loc/?p=26', 7, 'nav_menu_item', '', 0),
(30, 1, '2020-10-11 11:03:15', '2020-10-11 08:03:15', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Возможности CSS Grid Layout , которые уже можно применять', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'vozmozhnosti-css-grid-layout-kotorye-uzhe-mozhno-pri', '', '', '2020-10-14 23:24:13', '2020-10-14 20:24:13', '', 0, 'http://universal.loc/?p=30', 0, 'post', '', 0),
(31, 1, '2020-10-11 11:03:15', '2020-10-11 08:03:15', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Возможности CSS Grid Layout , которые уже можно применять', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-11 11:03:15', '2020-10-11 08:03:15', '', 30, 'http://universal.loc/2020/10/11/30-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2020-10-11 11:40:37', '2020-10-11 08:40:37', '', 'post-img-3', '', 'inherit', 'open', 'closed', '', 'post-img-3', '', '', '2020-10-11 11:40:37', '2020-10-11 08:40:37', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/post-img-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(33, 1, '2020-10-11 11:42:53', '2020-10-11 08:42:53', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'На каком стандарте писать скрипты, если я фрилансер', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'na-kakom-standarte-pisat-skripty-esl', '', '', '2020-10-14 18:13:51', '2020-10-14 15:13:51', '', 0, 'http://universal.loc/?p=33', 0, 'post', '', 0),
(34, 1, '2020-10-11 11:42:53', '2020-10-11 08:42:53', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', '2', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2020-10-11 11:42:53', '2020-10-11 08:42:53', '', 33, 'http://universal.loc/2020/10/11/33-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2020-10-11 11:43:16', '2020-10-11 08:43:16', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Правильно вставляем картинку на сайт для Retina дисплея', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'pravilno-vstavlyaem-kartinku-na-sajt', '', '', '2020-10-14 18:13:37', '2020-10-14 15:13:37', '', 0, 'http://universal.loc/?p=35', 0, 'post', '', 0),
(36, 1, '2020-10-11 11:43:16', '2020-10-11 08:43:16', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', '3', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-10-11 11:43:16', '2020-10-11 08:43:16', '', 35, 'http://universal.loc/2020/10/11/35-revision-v1/', 0, 'revision', '', 0),
(37, 1, '2020-10-11 11:43:35', '2020-10-11 08:43:35', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'ТОП-10 плагинов для Figma', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'top-10-plaginov-dlya-figma', '', '', '2020-10-14 23:20:03', '2020-10-14 20:20:03', '', 0, 'http://universal.loc/?p=37', 0, 'post', '', 0),
(38, 1, '2020-10-11 11:43:35', '2020-10-11 08:43:35', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', '4', '', 'inherit', 'closed', 'closed', '', '37-revision-v1', '', '', '2020-10-11 11:43:35', '2020-10-11 08:43:35', '', 37, 'http://universal.loc/2020/10/11/37-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2020-10-11 11:43:56', '2020-10-11 08:43:56', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Как использовать CSS float после того, как вышел Flexbox', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'kak-ispolzovat-css-float-posle-togo-kak-vysh', '', '', '2020-10-14 18:13:01', '2020-10-14 15:13:01', '', 0, 'http://universal.loc/?p=40', 0, 'post', '', 3),
(41, 1, '2020-10-11 11:43:56', '2020-10-11 08:43:56', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', '5', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2020-10-11 11:43:56', '2020-10-11 08:43:56', '', 40, 'http://universal.loc/2020/10/11/40-revision-v1/', 0, 'revision', '', 0),
(42, 1, '2020-10-11 11:44:14', '2020-10-11 08:44:14', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Где взять реальные проекты для портфолио', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'gde-vzyat-realnye-proekty-dlya-portfo', '', '', '2020-10-14 23:22:08', '2020-10-14 20:22:08', '', 0, 'http://universal.loc/?p=42', 0, 'post', '', 0),
(43, 1, '2020-10-11 11:44:14', '2020-10-11 08:44:14', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', '6', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2020-10-11 11:44:14', '2020-10-11 08:44:14', '', 42, 'http://universal.loc/2020/10/11/42-revision-v1/', 0, 'revision', '', 0),
(44, 1, '2020-10-11 11:46:34', '2020-10-11 08:46:34', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'На каком стандарте писать скрипты, если я фрилансер', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2020-10-11 11:46:34', '2020-10-11 08:46:34', '', 33, 'http://universal.loc/2020/10/11/33-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2020-10-11 11:48:04', '2020-10-11 08:48:04', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Правильно вставляем картинку на сайт для Retina дисплея', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-10-11 11:48:04', '2020-10-11 08:48:04', '', 35, 'http://universal.loc/2020/10/11/35-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2020-10-11 11:49:15', '2020-10-11 08:49:15', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'ТОП-10 плагинов для Figma', '', 'inherit', 'closed', 'closed', '', '37-revision-v1', '', '', '2020-10-11 11:49:15', '2020-10-11 08:49:15', '', 37, 'http://universal.loc/2020/10/11/37-revision-v1/', 0, 'revision', '', 0),
(48, 1, '2020-10-11 11:51:19', '2020-10-11 08:51:19', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Как использовать CSS float после того, как вышел Flexbox', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2020-10-11 11:51:19', '2020-10-11 08:51:19', '', 40, 'http://universal.loc/2020/10/11/40-revision-v1/', 0, 'revision', '', 0),
(49, 1, '2020-10-11 11:53:11', '2020-10-11 08:53:11', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Где взять реальные проекты для портфолио', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2020-10-11 11:53:11', '2020-10-11 08:53:11', '', 42, 'http://universal.loc/2020/10/11/42-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2020-10-11 11:57:43', '2020-10-11 08:57:43', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Расширение Chrome защищает от атак', 'Идейные соображения высшего порядка, а также рамки ', 'publish', 'open', 'open', '', 'rasshirenie-chrome-zashhishhaet-ot-atak', '', '', '2020-10-14 23:17:47', '2020-10-14 20:17:47', '', 0, 'http://universal.loc/?p=50', 0, 'post', '', 0),
(51, 1, '2020-10-11 11:57:43', '2020-10-11 08:57:43', '', 'Расширение Chrome защищает от атак', '', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2020-10-11 11:57:43', '2020-10-11 08:57:43', '', 50, 'http://universal.loc/2020/10/11/50-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2020-10-11 11:59:44', '2020-10-11 08:59:44', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Расширение Chrome защищает от атак', '', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2020-10-11 11:59:44', '2020-10-11 08:59:44', '', 50, 'http://universal.loc/2020/10/11/50-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2020-10-11 12:00:34', '2020-10-11 09:00:34', '', 'image', '', 'inherit', 'open', 'closed', '', 'image', '', '', '2020-10-11 12:00:34', '2020-10-11 09:00:34', '', 50, 'http://universal.loc/wp-content/uploads/2020/10/image.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2020-10-12 21:19:28', '2020-10-12 18:19:28', '', 'post-img-1', '', 'inherit', 'open', 'closed', '', 'post-img-1', '', '', '2020-10-12 21:19:28', '2020-10-12 18:19:28', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/post-img-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2020-10-12 22:22:07', '2020-10-12 19:22:07', '', 'post-img-2', '', 'inherit', 'open', 'closed', '', 'post-img-2', '', '', '2020-10-12 22:22:07', '2020-10-12 19:22:07', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/post-img-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(61, 1, '2020-10-12 22:22:46', '2020-10-12 19:22:46', '', 'post-img-9', '', 'inherit', 'open', 'closed', '', 'post-img-9', '', '', '2020-10-12 22:22:46', '2020-10-12 19:22:46', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/post-img-9.jpg', 0, 'attachment', 'image/jpeg', 0),
(62, 1, '2020-10-12 22:23:02', '2020-10-12 19:23:02', '', 'post-img-6', '', 'inherit', 'open', 'closed', '', 'post-img-6', '', '', '2020-10-12 22:23:02', '2020-10-12 19:23:02', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/post-img-6.jpg', 0, 'attachment', 'image/jpeg', 0),
(63, 1, '2020-10-12 22:27:27', '2020-10-12 19:27:27', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Стоит ли принимать предложение о работе, если это не работа мечты?', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'stoit-li-prinimat-predlozhenie-o-rabo', '', '', '2020-10-18 00:32:06', '2020-10-17 21:32:06', '', 0, 'http://universal.loc/?p=63', 0, 'post', '', 0),
(64, 1, '2020-10-12 22:27:27', '2020-10-12 19:27:27', '', 'Вам предложили работу мечты, но вы не можете...', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2020-10-12 22:27:27', '2020-10-12 19:27:27', '', 63, 'http://universal.loc/2020/10/12/63-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2020-10-12 22:29:22', '2020-10-12 19:29:22', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Новый налоговый режим для фрилансеров', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'novyj-nalogovyj-rezhim-dlya-frilansero', '', '', '2020-10-14 23:16:42', '2020-10-14 20:16:42', '', 0, 'http://universal.loc/?p=65', 0, 'post', '', 0),
(66, 1, '2020-10-12 22:29:22', '2020-10-12 19:29:22', '', 'Новый налоговый режим для фрилансеров', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2020-10-12 22:29:22', '2020-10-12 19:29:22', '', 65, 'http://universal.loc/2020/10/12/65-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2020-10-12 22:30:50', '2020-10-12 19:30:50', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'В вашем портфолио могут быть фейковые проекты, если вы сделали...', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'v-vashem-portfolio-mogut-byt-fejkovye', '', '', '2020-10-14 18:11:38', '2020-10-14 15:11:38', '', 0, 'http://universal.loc/?p=67', 0, 'post', '', 0),
(68, 1, '2020-10-12 22:30:50', '2020-10-12 19:30:50', '', 'В вашем портфолио могут быть фейковые проекты, если вы сделали...', '', 'inherit', 'closed', 'closed', '', '67-revision-v1', '', '', '2020-10-12 22:30:50', '2020-10-12 19:30:50', '', 67, 'http://universal.loc/2020/10/12/67-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2020-10-12 22:31:39', '2020-10-12 19:31:39', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Вам предложили работу мечты, но вы не можете...', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2020-10-12 22:31:39', '2020-10-12 19:31:39', '', 63, 'http://universal.loc/2020/10/12/63-revision-v1/', 0, 'revision', '', 0),
(70, 1, '2020-10-12 22:31:51', '2020-10-12 19:31:51', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Новый налоговый режим для фрилансеров', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2020-10-12 22:31:51', '2020-10-12 19:31:51', '', 65, 'http://universal.loc/2020/10/12/65-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2020-10-12 22:32:09', '2020-10-12 19:32:09', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'В вашем портфолио могут быть фейковые проекты, если вы сделали...', '', 'inherit', 'closed', 'closed', '', '67-revision-v1', '', '', '2020-10-12 22:32:09', '2020-10-12 19:32:09', '', 67, 'http://universal.loc/2020/10/12/67-revision-v1/', 0, 'revision', '', 0),
(72, 1, '2020-10-13 00:41:02', '2020-10-12 21:41:02', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Новый взгляд на адаптивную верстку сайтов', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'publish', 'open', 'open', '', 'novyj-vzglyad-na-adaptivnuyu-verstku-sa', '', '', '2020-10-14 23:15:03', '2020-10-14 20:15:03', '', 0, 'http://universal.loc/?p=72', 0, 'post', '', 0),
(73, 1, '2020-10-13 00:41:02', '2020-10-12 21:41:02', '', 'Новый взгляд на адаптивную верстку сайтов', '', 'inherit', 'closed', 'closed', '', '72-revision-v1', '', '', '2020-10-13 00:41:02', '2020-10-12 21:41:02', '', 72, 'http://universal.loc/2020/10/13/72-revision-v1/', 0, 'revision', '', 0),
(74, 1, '2020-10-13 00:41:23', '2020-10-12 21:41:23', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Новый взгляд на адаптивную верстку сайтов', '', 'inherit', 'closed', 'closed', '', '72-revision-v1', '', '', '2020-10-13 00:41:23', '2020-10-12 21:41:23', '', 72, 'http://universal.loc/2020/10/13/72-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2020-10-13 00:55:03', '2020-10-12 21:55:03', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Стоит ли принимать предложение о работе, если это не работа мечты?', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2020-10-13 00:55:03', '2020-10-12 21:55:03', '', 63, 'http://universal.loc/2020/10/13/63-revision-v1/', 0, 'revision', '', 0),
(76, 1, '2020-10-14 18:11:16', '2020-10-14 15:11:16', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Новый взгляд на адаптивную верстку сайтов', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '72-revision-v1', '', '', '2020-10-14 18:11:16', '2020-10-14 15:11:16', '', 72, 'http://universal.loc/2020/10/14/72-revision-v1/', 0, 'revision', '', 0),
(77, 1, '2020-10-14 18:11:38', '2020-10-14 15:11:38', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'В вашем портфолио могут быть фейковые проекты, если вы сделали...', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '67-revision-v1', '', '', '2020-10-14 18:11:38', '2020-10-14 15:11:38', '', 67, 'http://universal.loc/2020/10/14/67-revision-v1/', 0, 'revision', '', 0),
(78, 1, '2020-10-14 18:12:01', '2020-10-14 15:12:01', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Новый налоговый режим для фрилансеров', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2020-10-14 18:12:01', '2020-10-14 15:12:01', '', 65, 'http://universal.loc/2020/10/14/65-revision-v1/', 0, 'revision', '', 0),
(79, 1, '2020-10-14 18:12:11', '2020-10-14 15:12:11', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Стоит ли принимать предложение о работе, если это не работа мечты?', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2020-10-14 18:12:11', '2020-10-14 15:12:11', '', 63, 'http://universal.loc/2020/10/14/63-revision-v1/', 0, 'revision', '', 0),
(80, 1, '2020-10-14 18:12:24', '2020-10-14 15:12:24', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Расширение Chrome защищает от атак', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2020-10-14 18:12:24', '2020-10-14 15:12:24', '', 50, 'http://universal.loc/2020/10/14/50-revision-v1/', 0, 'revision', '', 0),
(81, 1, '2020-10-14 18:12:46', '2020-10-14 15:12:46', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Где взять реальные проекты для портфолио', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2020-10-14 18:12:46', '2020-10-14 15:12:46', '', 42, 'http://universal.loc/2020/10/14/42-revision-v1/', 0, 'revision', '', 0),
(82, 1, '2020-10-14 18:13:01', '2020-10-14 15:13:01', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Как использовать CSS float после того, как вышел Flexbox', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2020-10-14 18:13:01', '2020-10-14 15:13:01', '', 40, 'http://universal.loc/2020/10/14/40-revision-v1/', 0, 'revision', '', 0),
(83, 1, '2020-10-14 18:13:17', '2020-10-14 15:13:17', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'ТОП-10 плагинов для Figma', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '37-revision-v1', '', '', '2020-10-14 18:13:17', '2020-10-14 15:13:17', '', 37, 'http://universal.loc/2020/10/14/37-revision-v1/', 0, 'revision', '', 0),
(84, 1, '2020-10-14 18:13:37', '2020-10-14 15:13:37', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Правильно вставляем картинку на сайт для Retina дисплея', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-10-14 18:13:37', '2020-10-14 15:13:37', '', 35, 'http://universal.loc/2020/10/14/35-revision-v1/', 0, 'revision', '', 0),
(85, 1, '2020-10-14 18:13:51', '2020-10-14 15:13:51', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\"><br>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'На каком стандарте писать скрипты, если я фрилансер', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2020-10-14 18:13:51', '2020-10-14 15:13:51', '', 33, 'http://universal.loc/2020/10/14/33-revision-v1/', 0, 'revision', '', 0),
(86, 1, '2020-10-14 18:14:05', '2020-10-14 15:14:05', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Возможности CSS Grid Layout , которые уже можно применять', 'Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития.', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-14 18:14:05', '2020-10-14 15:14:05', '', 30, 'http://universal.loc/2020/10/14/30-revision-v1/', 0, 'revision', '', 0),
(87, 1, '2020-10-14 21:37:59', '2020-10-14 18:37:59', '<!-- wp:paragraph -->\n<p id=\"block-e3be7d82-5a14-4d00-b495-5081fc722f0d\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-4f780ab9-67e9-4be1-b42f-107927bd3489\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p id=\"block-28873fa9-8d36-4cc5-b18d-05b276afd8e2\">Идейные соображения высшего порядка, а также рамки и место обучения кадров играет важную роль в формировании дальнейших направлений развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->', 'Расширение Chrome защищает от атак', 'Идейные соображения высшего порядка, а также рамки ', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2020-10-14 21:37:59', '2020-10-14 18:37:59', '', 50, 'http://universal.loc/2020/10/14/50-revision-v1/', 0, 'revision', '', 0),
(88, 1, '2020-10-14 23:19:21', '2020-10-14 20:19:21', '', 'post-img-5', '', 'inherit', 'open', 'closed', '', 'post-img-5', '', '', '2020-10-14 23:19:21', '2020-10-14 20:19:21', '', 37, 'http://universal.loc/wp-content/uploads/2020/10/post-img-5.jpg', 0, 'attachment', 'image/jpeg', 0),
(89, 1, '2020-10-14 23:19:49', '2020-10-14 20:19:49', '', 'post-img-7', '', 'inherit', 'open', 'closed', '', 'post-img-7', '', '', '2020-10-14 23:19:49', '2020-10-14 20:19:49', '', 37, 'http://universal.loc/wp-content/uploads/2020/10/post-img-7.jpg', 0, 'attachment', 'image/jpeg', 0),
(92, 1, '2020-10-21 17:42:50', '2020-10-21 14:42:50', '', 'img-money-banknotes', '', 'inherit', 'open', 'closed', '', 'img-money-banknotes', '', '', '2020-10-21 17:42:50', '2020-10-21 14:42:50', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/img-money-banknotes.jpg', 0, 'attachment', 'image/jpeg', 0),
(93, 1, '2020-10-21 17:52:27', '2020-10-21 14:52:27', '<!-- wp:paragraph {\"dropCap\":true} -->\n<p class=\"has-drop-cap\">Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1>Задача организации</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p> С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":152,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-nature-01.jpg\" alt=\"\" class=\"wp-image-152\"/><figcaption>Горные вершины</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-regular\"} -->\n<figure class=\"wp-block-table is-style-regular\"><table><tbody><tr><td class=\"has-text-align-left\" data-align=\"left\">ФИО</td><td class=\"has-text-align-center\" data-align=\"center\">Возраст</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Сидоров Петр Иванович</td><td class=\"has-text-align-center\" data-align=\"center\">23</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Иванова Мария Семеновна</td><td class=\"has-text-align-center\" data-align=\"center\">37</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Пупкин Имануил Афиногенович</td><td class=\"has-text-align-center\" data-align=\"center\">95</td></tr></tbody></table><figcaption>Таблица 1.1</figcaption></figure>\n<!-- /wp:table -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>Эксперимент проверки направлений</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'publish', 'open', 'open', '', 'rassledovanie-nedeli-skolko-zaraba', '', '', '2020-11-06 10:01:09', '2020-11-06 07:01:09', '', 0, 'http://universal.loc/?p=93', 0, 'post', '', 0),
(94, 1, '2020-10-21 17:52:27', '2020-10-21 14:52:27', '<!-- wp:paragraph -->\n<p>Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2020-10-21 17:52:27', '2020-10-21 14:52:27', '', 93, 'http://universal.loc/2020/10/21/93-revision-v1/', 0, 'revision', '', 0),
(95, 1, '2020-10-22 11:24:21', '2020-10-22 08:24:21', '', 'img-money-coins', '', 'inherit', 'open', 'closed', '', 'img-money-coins', '', '', '2020-10-22 11:24:21', '2020-10-22 08:24:21', '', 0, 'http://universal.loc/wp-content/uploads/2020/10/img-money-coins.jpg', 0, 'attachment', 'image/jpeg', 0),
(96, 1, '2020-10-26 16:28:25', '2020-10-26 13:28:25', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности способствует подготовки и реализации модели развития. С другой стороны сложившаяся структура организации в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке дальнейших направлений развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Равным образом сложившаяся структура организации способствует подготовки и реализации направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа новых предложений. Товарищи! дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки форм развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":102,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/image-dev-01.jpg\" alt=\"\" class=\"wp-image-102\"/><figcaption>Это первое фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":147,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-dev-02.jpg\" alt=\"\" class=\"wp-image-147\"/><figcaption>Это второе фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":148,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-dev-03.jpg\" alt=\"\" class=\"wp-image-148\"/><figcaption>Это третье фото</figcaption></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'publish', 'open', 'open', '', 'vybor-chitatelej-gde-udobnee-rabotat', '', '', '2020-11-05 17:56:30', '2020-11-05 14:56:30', '', 0, 'http://universal.loc/?p=96', 0, 'post', '', 0),
(97, 1, '2020-10-26 16:28:25', '2020-10-26 13:28:25', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности способствует подготовки и реализации модели развития. С другой стороны сложившаяся структура организации в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке дальнейших направлений развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Равным образом сложившаяся структура организации способствует подготовки и реализации направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа новых предложений. Товарищи! дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки форм развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":88,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/post-img-5.jpg\" alt=\"\" class=\"wp-image-88\"/><figcaption>Это первое фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":61,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/post-img-9.jpg\" alt=\"\" class=\"wp-image-61\"/><figcaption>Это второе фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":92,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/img-money-banknotes.jpg\" alt=\"\" class=\"wp-image-92\"/><figcaption>Это третье фото</figcaption></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'inherit', 'closed', 'closed', '', '96-revision-v1', '', '', '2020-10-26 16:28:25', '2020-10-26 13:28:25', '', 96, 'http://universal.loc/2020/10/26/96-revision-v1/', 0, 'revision', '', 0),
(100, 1, '2020-10-28 00:21:12', '2020-10-27 21:21:12', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности способствует подготовки и реализации модели развития. С другой стороны сложившаяся структура организации в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке дальнейших направлений развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Равным образом сложившаяся структура организации способствует подготовки и реализации направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа новых предложений. Товарищи! дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки форм развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":88,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/post-img-5.jpg\" alt=\"\" class=\"wp-image-88\"/><figcaption>Это первое фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":61,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/post-img-9.jpg\" alt=\"\" class=\"wp-image-61\"/><figcaption>Это второе фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":92,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/img-money-banknotes.jpg\" alt=\"\" class=\"wp-image-92\"/><figcaption>Это третье фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":99,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/andy-holmes-webyw4NsFPg-unsplash.jpg\" alt=\"\" class=\"wp-image-99\"/></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'inherit', 'closed', 'closed', '', '96-revision-v1', '', '', '2020-10-28 00:21:12', '2020-10-27 21:21:12', '', 96, 'http://universal.loc/2020/10/28/96-revision-v1/', 0, 'revision', '', 0),
(101, 1, '2020-10-28 00:27:20', '2020-10-27 21:27:20', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности способствует подготовки и реализации модели развития. С другой стороны сложившаяся структура организации в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке дальнейших направлений развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Равным образом сложившаяся структура организации способствует подготовки и реализации направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа новых предложений. Товарищи! дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки форм развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'inherit', 'closed', 'closed', '', '96-revision-v1', '', '', '2020-10-28 00:27:20', '2020-10-27 21:27:20', '', 96, 'http://universal.loc/2020/10/28/96-revision-v1/', 0, 'revision', '', 0),
(102, 1, '2020-10-28 00:33:26', '2020-10-27 21:33:26', '', 'image-dev-01', '', 'inherit', 'open', 'closed', '', 'image-dev-01', '', '', '2020-10-28 00:33:26', '2020-10-27 21:33:26', '', 96, 'http://universal.loc/wp-content/uploads/2020/10/image-dev-01.jpg', 0, 'attachment', 'image/jpeg', 0),
(105, 1, '2020-10-28 00:34:30', '2020-10-27 21:34:30', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности способствует подготовки и реализации модели развития. С другой стороны сложившаяся структура организации в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке дальнейших направлений развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Равным образом сложившаяся структура организации способствует подготовки и реализации направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа новых предложений. Товарищи! дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки форм развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":102,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/image-dev-01.jpg\" alt=\"\" class=\"wp-image-102\"/><figcaption>Это первое фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":103,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/image-dev-02.jpg\" alt=\"\" class=\"wp-image-103\"/><figcaption>Это второе фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":104,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/image-dev-03.jpg\" alt=\"\" class=\"wp-image-104\"/><figcaption>Это третье фото</figcaption></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'inherit', 'closed', 'closed', '', '96-revision-v1', '', '', '2020-10-28 00:34:30', '2020-10-27 21:34:30', '', 96, 'http://universal.loc/2020/10/28/96-revision-v1/', 0, 'revision', '', 0),
(107, 1, '2020-10-28 23:52:24', '2020-10-28 20:52:24', '<!-- wp:paragraph -->\n<p>Не следует, однако забывать, что начало повседневной работы по формированию позиции играет важную роль в формировании новых предложений. Товарищи! рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! реализация намеченных плановых заданий влечет за собой процесс внедрения и модернизации систем массового участия. Задача организации, в особенности же новая модель организационной деятельности в значительной степени обуславливает создание позиций, занимаемых участниками в отношении поставленных задач. Задача организации, в особенности же укрепление и развитие структуры влечет за собой процесс внедрения и модернизации систем массового участия.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом представляет собой интересный эксперимент проверки дальнейших направлений развития. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют определения и уточнения дальнейших направлений развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности позволяет оценить значение позиций, занимаемых участниками в отношении поставленных задач. Повседневная практика показывает, что рамки и место обучения кадров способствует подготовки и реализации дальнейших направлений развития. Не следует, однако забывать, что начало повседневной работы по формированию позиции обеспечивает широкому кругу (специалистов) участие в формировании существенных финансовых и административных условий. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке соответствующий условий активизации.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что новая модель организационной деятельности в значительной степени обуславливает создание модели развития. Разнообразный и богатый опыт рамки и место обучения кадров влечет за собой процесс внедрения и модернизации новых предложений. Идейные соображения высшего порядка, а также рамки и место обучения кадров требуют от нас анализа позиций, занимаемых участниками в отношении поставленных задач. Таким образом начало повседневной работы по формированию позиции влечет за собой процесс внедрения и модернизации новых предложений.</p>\n<!-- /wp:paragraph -->', 'Вопросы на собеседовании для джуна', 'Не следует, однако забывать, что начало повседневной работы по формированию позиции играет важную роль в формировании новых предложений.', 'publish', 'open', 'open', '', 'voprosy-na-sobesedovanii-dlya-dzhuna', '', '', '2020-10-28 23:52:24', '2020-10-28 20:52:24', '', 0, 'http://universal.loc/?p=107', 0, 'post', '', 0),
(108, 1, '2020-10-28 23:52:24', '2020-10-28 20:52:24', '<!-- wp:paragraph -->\n<p>Не следует, однако забывать, что начало повседневной работы по формированию позиции играет важную роль в формировании новых предложений. Товарищи! рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! реализация намеченных плановых заданий влечет за собой процесс внедрения и модернизации систем массового участия. Задача организации, в особенности же новая модель организационной деятельности в значительной степени обуславливает создание позиций, занимаемых участниками в отношении поставленных задач. Задача организации, в особенности же укрепление и развитие структуры влечет за собой процесс внедрения и модернизации систем массового участия.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>С другой стороны консультация с широким активом представляет собой интересный эксперимент проверки дальнейших направлений развития. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют определения и уточнения дальнейших направлений развития. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности позволяет оценить значение позиций, занимаемых участниками в отношении поставленных задач. Повседневная практика показывает, что рамки и место обучения кадров способствует подготовки и реализации дальнейших направлений развития. Не следует, однако забывать, что начало повседневной работы по формированию позиции обеспечивает широкому кругу (специалистов) участие в формировании существенных финансовых и административных условий. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке соответствующий условий активизации.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что новая модель организационной деятельности в значительной степени обуславливает создание модели развития. Разнообразный и богатый опыт рамки и место обучения кадров влечет за собой процесс внедрения и модернизации новых предложений. Идейные соображения высшего порядка, а также рамки и место обучения кадров требуют от нас анализа позиций, занимаемых участниками в отношении поставленных задач. Таким образом начало повседневной работы по формированию позиции влечет за собой процесс внедрения и модернизации новых предложений.</p>\n<!-- /wp:paragraph -->', 'Вопросы на собеседовании для джуна', 'Не следует, однако забывать, что начало повседневной работы по формированию позиции играет важную роль в формировании новых предложений.', 'inherit', 'closed', 'closed', '', '107-revision-v1', '', '', '2020-10-28 23:52:24', '2020-10-28 20:52:24', '', 107, 'http://universal.loc/2020/10/28/107-revision-v1/', 0, 'revision', '', 0),
(109, 1, '2020-10-30 12:04:35', '2020-10-30 09:04:35', '', 'Обновления', '', 'publish', 'closed', 'closed', '', 'obnovleniya', '', '', '2020-10-30 12:04:35', '2020-10-30 09:04:35', '', 0, 'http://universal.loc/?p=109', 1, 'nav_menu_item', '', 0),
(110, 1, '2020-10-30 12:04:35', '2020-10-30 09:04:35', '', 'Экспресс', '', 'publish', 'closed', 'closed', '', 'ekspress', '', '', '2020-10-30 12:04:35', '2020-10-30 09:04:35', '', 0, 'http://universal.loc/?p=110', 2, 'nav_menu_item', '', 0),
(111, 1, '2020-10-30 12:04:35', '2020-10-30 09:04:35', '', 'Politics', '', 'publish', 'closed', 'closed', '', 'politics', '', '', '2020-10-30 12:04:35', '2020-10-30 09:04:35', '', 0, 'http://universal.loc/?p=111', 3, 'nav_menu_item', '', 0),
(112, 1, '2020-10-30 12:04:35', '2020-10-30 09:04:35', '', 'Solar Eclipse', '', 'publish', 'closed', 'closed', '', 'solar-eclipse', '', '', '2020-10-30 12:04:35', '2020-10-30 09:04:35', '', 0, 'http://universal.loc/?p=112', 4, 'nav_menu_item', '', 0),
(113, 1, '2020-10-30 12:08:13', '2020-10-30 09:08:13', '', 'CSS', '', 'publish', 'closed', 'closed', '', 'css-2', '', '', '2020-10-30 12:08:13', '2020-10-30 09:08:13', '', 0, 'http://universal.loc/?p=113', 2, 'nav_menu_item', '', 0),
(114, 1, '2020-10-30 12:08:13', '2020-10-30 09:08:13', '', 'JavaScript', '', 'publish', 'closed', 'closed', '', 'javascript-2', '', '', '2020-10-30 12:08:13', '2020-10-30 09:08:13', '', 0, 'http://universal.loc/?p=114', 3, 'nav_menu_item', '', 0),
(115, 1, '2020-10-30 12:08:13', '2020-10-30 09:08:13', '', 'HTML', '', 'publish', 'closed', 'closed', '', 'html-2', '', '', '2020-10-30 12:08:13', '2020-10-30 09:08:13', '', 0, 'http://universal.loc/?p=115', 1, 'nav_menu_item', '', 0),
(116, 1, '2020-10-30 12:08:13', '2020-10-30 09:08:13', '', 'Web Design', '', 'publish', 'closed', 'closed', '', 'web-design-2', '', '', '2020-10-30 12:08:13', '2020-10-30 09:08:13', '', 0, 'http://universal.loc/?p=116', 4, 'nav_menu_item', '', 0),
(117, 1, '2020-10-30 12:10:43', '2020-10-30 09:10:43', '', 'Скринкасты', '', 'publish', 'closed', 'closed', '', 'skrinkasty', '', '', '2020-10-30 12:10:43', '2020-10-30 09:10:43', '', 0, 'http://universal.loc/?p=117', 1, 'nav_menu_item', '', 0),
(118, 1, '2020-10-30 12:10:43', '2020-10-30 09:10:43', '', 'Уроки', '', 'publish', 'closed', 'closed', '', 'uroki', '', '', '2020-10-30 12:10:43', '2020-10-30 09:10:43', '', 0, 'http://universal.loc/?p=118', 2, 'nav_menu_item', '', 0),
(119, 1, '2020-10-30 12:10:43', '2020-10-30 09:10:43', '', 'Вебинары', '', 'publish', 'closed', 'closed', '', 'vebinary', '', '', '2020-10-30 12:10:43', '2020-10-30 09:10:43', '', 0, 'http://universal.loc/?p=119', 3, 'nav_menu_item', '', 0),
(120, 1, '2020-10-30 12:14:40', '2020-10-30 09:14:40', '', 'Политика данных', '', 'publish', 'closed', 'closed', '', 'politika-dannyh', '', '', '2020-10-30 12:15:11', '2020-10-30 09:15:11', '', 0, 'http://universal.loc/?p=120', 1, 'nav_menu_item', '', 0),
(121, 1, '2020-10-30 12:14:40', '2020-10-30 09:14:40', '', 'Оферта сайта', '', 'publish', 'closed', 'closed', '', 'oferta-sajta', '', '', '2020-10-30 12:15:11', '2020-10-30 09:15:11', '', 0, 'http://universal.loc/?p=121', 2, 'nav_menu_item', '', 0),
(122, 1, '2020-10-30 12:14:40', '2020-10-30 09:14:40', '', 'Реквизиты', '', 'publish', 'closed', 'closed', '', 'rekvizity', '', '', '2020-10-30 12:15:11', '2020-10-30 09:15:11', '', 0, 'http://universal.loc/?p=122', 3, 'nav_menu_item', '', 0),
(123, 1, '2020-10-30 12:14:40', '2020-10-30 09:14:40', '', 'Контакты', '', 'publish', 'closed', 'closed', '', 'kontakty', '', '', '2020-10-30 12:15:11', '2020-10-30 09:15:11', '', 0, 'http://universal.loc/?p=123', 4, 'nav_menu_item', '', 0),
(124, 1, '2020-10-30 12:18:35', '2020-10-30 09:18:35', '', 'Платные интенсивы', '', 'publish', 'closed', 'closed', '', 'platnye-intensivy', '', '', '2020-10-30 12:18:35', '2020-10-30 09:18:35', '', 0, 'http://universal.loc/?p=124', 1, 'nav_menu_item', '', 0),
(125, 1, '2020-10-30 12:18:35', '2020-10-30 09:18:35', '', 'Бесплатные стримы', '', 'publish', 'closed', 'closed', '', 'besplatnye-strimy', '', '', '2020-10-30 12:18:35', '2020-10-30 09:18:35', '', 0, 'http://universal.loc/?p=125', 2, 'nav_menu_item', '', 0),
(126, 1, '2020-10-30 12:18:35', '2020-10-30 09:18:35', '', 'Мастер-классы', '', 'publish', 'closed', 'closed', '', 'master-klassy', '', '', '2020-10-30 12:18:35', '2020-10-30 09:18:35', '', 0, 'http://universal.loc/?p=126', 3, 'nav_menu_item', '', 0),
(127, 1, '2020-10-30 12:18:36', '2020-10-30 09:18:36', '', 'Менторство', '', 'publish', 'closed', 'closed', '', 'mentorstvo', '', '', '2020-10-30 12:18:36', '2020-10-30 09:18:36', '', 0, 'http://universal.loc/?p=127', 4, 'nav_menu_item', '', 0),
(128, 1, '2020-10-30 12:18:36', '2020-10-30 09:18:36', '', 'Буткемпы', '', 'publish', 'closed', 'closed', '', 'butkempy', '', '', '2020-10-30 12:18:36', '2020-10-30 09:18:36', '', 0, 'http://universal.loc/?p=128', 5, 'nav_menu_item', '', 0),
(129, 1, '2020-10-30 12:20:59', '2020-10-30 09:20:59', '', 'Статьи', '', 'publish', 'closed', 'closed', '', 'stati-2', '', '', '2020-10-30 12:20:59', '2020-10-30 09:20:59', '', 0, 'http://universal.loc/?p=129', 1, 'nav_menu_item', '', 0),
(130, 1, '2020-10-30 12:20:59', '2020-10-30 09:20:59', '', 'Расследования', '', 'publish', 'closed', 'closed', '', 'rassledovaniya', '', '', '2020-10-30 12:20:59', '2020-10-30 09:20:59', '', 16, 'http://universal.loc/?p=130', 2, 'nav_menu_item', '', 0),
(131, 1, '2020-10-30 12:20:59', '2020-10-30 09:20:59', ' ', '', '', 'publish', 'closed', 'closed', '', '131', '', '', '2020-10-30 12:20:59', '2020-10-30 09:20:59', '', 0, 'http://universal.loc/?p=131', 3, 'nav_menu_item', '', 0),
(132, 1, '2020-10-30 12:21:00', '2020-10-30 09:21:00', ' ', '', '', 'publish', 'closed', 'closed', '', '132', '', '', '2020-10-30 12:21:00', '2020-10-30 09:21:00', '', 0, 'http://universal.loc/?p=132', 4, 'nav_menu_item', '', 0),
(133, 1, '2020-10-30 12:21:28', '2020-10-30 09:21:28', '<!-- wp:paragraph -->\n<p>Это пример страницы. От записей в блоге она отличается тем, что остаётся на одном месте и отображается в меню сайта (в большинстве тем). На странице &laquo;Детали&raquo; владельцы сайтов обычно рассказывают о себе потенциальным посетителям. Например, так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Привет! Днём я курьер, а вечером &#8212; подающий надежды актёр. Это мой блог. Я живу в Ростове-на-Дону, люблю своего пса Джека и пинаколаду. (И ещё попадать под дождь.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...или так:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Компания &laquo;Штучки XYZ&raquo; была основана в 1971 году и с тех пор производит качественные штучки. Компания находится в Готэм-сити, имеет штат из более чем 2000 сотрудников и приносит много пользы жителям Готэма.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href=\"http://universal.loc/wp-admin/\">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Пример страницы', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2020-10-30 12:21:28', '2020-10-30 09:21:28', '', 2, 'http://universal.loc/2020/10/30/2-revision-v1/', 0, 'revision', '', 0),
(134, 1, '2020-10-30 12:23:15', '2020-10-30 09:23:15', '<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что сложившаяся структура организации в значительной степени обуславливает создание направлений прогрессивного развития. Не следует, однако забывать, что постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности влечет за собой процесс внедрения и модернизации новых предложений. С другой стороны начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Равным образом укрепление и развитие структуры требуют от нас анализа направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Равным образом постоянное информационно-пропагандистское обеспечение нашей деятельности в значительной степени обуславливает создание форм развития.</p>\n<!-- /wp:paragraph -->', 'Контакты', '', 'publish', 'closed', 'closed', '', 'kontakty', '', '', '2020-10-30 12:23:15', '2020-10-30 09:23:15', '', 0, 'http://universal.loc/?page_id=134', 0, 'page', '', 0),
(135, 1, '2020-10-30 12:23:15', '2020-10-30 09:23:15', '<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что сложившаяся структура организации в значительной степени обуславливает создание направлений прогрессивного развития. Не следует, однако забывать, что постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании систем массового участия.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности влечет за собой процесс внедрения и модернизации новых предложений. С другой стороны начало повседневной работы по формированию позиции позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Равным образом укрепление и развитие структуры требуют от нас анализа направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров позволяет оценить значение системы обучения кадров, соответствует насущным потребностям. Равным образом постоянное информационно-пропагандистское обеспечение нашей деятельности в значительной степени обуславливает создание форм развития.</p>\n<!-- /wp:paragraph -->', 'Контакты', '', 'inherit', 'closed', 'closed', '', '134-revision-v1', '', '', '2020-10-30 12:23:15', '2020-10-30 09:23:15', '', 134, 'http://universal.loc/2020/10/30/134-revision-v1/', 0, 'revision', '', 0),
(136, 1, '2020-10-30 12:24:42', '2020-10-30 09:24:42', '<!-- wp:paragraph -->\n<p>Равным образом постоянное информационно-пропагандистское обеспечение нашей деятельности играет важную роль в формировании модели развития. Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. С другой стороны консультация с широким активом влечет за собой процесс внедрения и модернизации модели развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа позиций, занимаемых участниками в отношении поставленных задач. Разнообразный и богатый опыт консультация с широким активом влечет за собой процесс внедрения и модернизации направлений прогрессивного развития. Таким образом укрепление и развитие структуры способствует подготовки и реализации системы обучения кадров, соответствует насущным потребностям. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития. Таким образом консультация с широким активом играет важную роль в формировании систем массового участия. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Работа у нас', '', 'publish', 'closed', 'closed', '', 'rabota-u-nas', '', '', '2020-10-30 12:24:42', '2020-10-30 09:24:42', '', 0, 'http://universal.loc/?page_id=136', 0, 'page', '', 0),
(137, 1, '2020-10-30 12:24:42', '2020-10-30 09:24:42', '<!-- wp:paragraph -->\n<p>Равным образом постоянное информационно-пропагандистское обеспечение нашей деятельности играет важную роль в формировании модели развития. Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности представляет собой интересный эксперимент проверки позиций, занимаемых участниками в отношении поставленных задач. С другой стороны консультация с широким активом влечет за собой процесс внедрения и модернизации модели развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа позиций, занимаемых участниками в отношении поставленных задач. Разнообразный и богатый опыт консультация с широким активом влечет за собой процесс внедрения и модернизации направлений прогрессивного развития. Таким образом укрепление и развитие структуры способствует подготовки и реализации системы обучения кадров, соответствует насущным потребностям. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития. Таким образом консультация с широким активом играет важную роль в формировании систем массового участия. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке новых предложений.</p>\n<!-- /wp:paragraph -->', 'Работа у нас', '', 'inherit', 'closed', 'closed', '', '136-revision-v1', '', '', '2020-10-30 12:24:42', '2020-10-30 09:24:42', '', 136, 'http://universal.loc/2020/10/30/136-revision-v1/', 0, 'revision', '', 0),
(138, 1, '2020-10-30 12:26:46', '2020-10-30 09:26:46', '<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании форм развития. Равным образом реализация намеченных плановых заданий представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что укрепление и развитие структуры требуют от нас анализа модели развития. Задача организации, в особенности же укрепление и развитие структуры способствует подготовки и реализации соответствующий условий активизации.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Значимость этих проблем настолько очевидна, что сложившаяся структура организации в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке направлений прогрессивного развития. Не следует, однако забывать, что сложившаяся структура организации позволяет выполнять важные задания по разработке направлений прогрессивного развития. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности играет важную роль в формировании форм развития.</p>\n<!-- /wp:paragraph -->', 'Реклама', '', 'publish', 'closed', 'closed', '', 'reklama', '', '', '2020-10-30 12:26:46', '2020-10-30 09:26:46', '', 0, 'http://universal.loc/?page_id=138', 0, 'page', '', 0),
(139, 1, '2020-10-30 12:26:46', '2020-10-30 09:26:46', '<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании форм развития. Равным образом реализация намеченных плановых заданий представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что укрепление и развитие структуры требуют от нас анализа модели развития. Задача организации, в особенности же укрепление и развитие структуры способствует подготовки и реализации соответствующий условий активизации.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Значимость этих проблем настолько очевидна, что сложившаяся структура организации в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке направлений прогрессивного развития. Не следует, однако забывать, что сложившаяся структура организации позволяет выполнять важные задания по разработке направлений прогрессивного развития. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности играет важную роль в формировании форм развития.</p>\n<!-- /wp:paragraph -->', 'Реклама', '', 'inherit', 'closed', 'closed', '', '138-revision-v1', '', '', '2020-10-30 12:26:46', '2020-10-30 09:26:46', '', 138, 'http://universal.loc/2020/10/30/138-revision-v1/', 0, 'revision', '', 0),
(140, 1, '2020-10-30 12:27:20', '2020-10-30 09:27:20', '<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании форм развития. Равным образом реализация намеченных плановых заданий представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что укрепление и развитие структуры требуют от нас анализа модели развития. Задача организации, в особенности же укрепление и развитие структуры способствует подготовки и реализации соответствующий условий активизации.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Значимость этих проблем настолько очевидна, что сложившаяся структура организации в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке направлений прогрессивного развития. Не следует, однако забывать, что сложившаяся структура организации позволяет выполнять важные задания по разработке направлений прогрессивного развития. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности играет важную роль в формировании форм развития.</p>\n<!-- /wp:paragraph -->', 'Партнерство', '', 'publish', 'closed', 'closed', '', 'partnerstvo', '', '', '2020-10-30 12:27:20', '2020-10-30 09:27:20', '', 0, 'http://universal.loc/?page_id=140', 0, 'page', '', 0),
(141, 1, '2020-10-30 12:27:20', '2020-10-30 09:27:20', '<!-- wp:paragraph -->\n<p>Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании форм развития. Равным образом реализация намеченных плановых заданий представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что укрепление и развитие структуры требуют от нас анализа модели развития. Задача организации, в особенности же укрепление и развитие структуры способствует подготовки и реализации соответствующий условий активизации.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Значимость этих проблем настолько очевидна, что сложившаяся структура организации в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также начало повседневной работы по формированию позиции позволяет выполнять важные задания по разработке направлений прогрессивного развития. Не следует, однако забывать, что сложившаяся структура организации позволяет выполнять важные задания по разработке направлений прогрессивного развития. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности играет важную роль в формировании форм развития.</p>\n<!-- /wp:paragraph -->', 'Партнерство', '', 'inherit', 'closed', 'closed', '', '140-revision-v1', '', '', '2020-10-30 12:27:20', '2020-10-30 09:27:20', '', 140, 'http://universal.loc/2020/10/30/140-revision-v1/', 0, 'revision', '', 0),
(142, 1, '2020-10-30 12:32:11', '2020-10-30 09:32:11', ' ', '', '', 'publish', 'closed', 'closed', '', '142', '', '', '2020-10-30 12:32:11', '2020-10-30 09:32:11', '', 0, 'http://universal.loc/?p=142', 4, 'nav_menu_item', '', 0),
(143, 1, '2020-10-30 12:32:11', '2020-10-30 09:32:11', ' ', '', '', 'publish', 'closed', 'closed', '', '143', '', '', '2020-10-30 12:32:11', '2020-10-30 09:32:11', '', 0, 'http://universal.loc/?p=143', 3, 'nav_menu_item', '', 0),
(144, 1, '2020-10-30 12:32:11', '2020-10-30 09:32:11', ' ', '', '', 'publish', 'closed', 'closed', '', '144', '', '', '2020-10-30 12:32:11', '2020-10-30 09:32:11', '', 0, 'http://universal.loc/?p=144', 2, 'nav_menu_item', '', 0),
(145, 1, '2020-10-30 12:32:10', '2020-10-30 09:32:10', ' ', '', '', 'publish', 'closed', 'closed', '', '145', '', '', '2020-10-30 12:32:10', '2020-10-30 09:32:10', '', 0, 'http://universal.loc/?p=145', 1, 'nav_menu_item', '', 0),
(147, 1, '2020-11-05 17:55:32', '2020-11-05 14:55:32', '', 'image-dev-02', '', 'inherit', 'open', 'closed', '', 'image-dev-02', '', '', '2020-11-05 17:55:32', '2020-11-05 14:55:32', '', 96, 'http://universal.loc/wp-content/uploads/2020/11/image-dev-02.jpg', 0, 'attachment', 'image/jpeg', 0),
(148, 1, '2020-11-05 17:56:11', '2020-11-05 14:56:11', '', 'image-dev-03', '', 'inherit', 'open', 'closed', '', 'image-dev-03', '', '', '2020-11-05 17:56:11', '2020-11-05 14:56:11', '', 96, 'http://universal.loc/wp-content/uploads/2020/11/image-dev-03.jpg', 0, 'attachment', 'image/jpeg', 0),
(149, 1, '2020-11-05 17:56:30', '2020-11-05 14:56:30', '<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также дальнейшее развитие различных форм деятельности способствует подготовки и реализации модели развития. С другой стороны сложившаяся структура организации в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке дальнейших направлений развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры в значительной степени обуславливает создание дальнейших направлений развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Равным образом сложившаяся структура организации способствует подготовки и реализации направлений прогрессивного развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют от нас анализа новых предложений. Товарищи! дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки форм развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":102,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/10/image-dev-01.jpg\" alt=\"\" class=\"wp-image-102\"/><figcaption>Это первое фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":147,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-dev-02.jpg\" alt=\"\" class=\"wp-image-147\"/><figcaption>Это второе фото</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":148,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-dev-03.jpg\" alt=\"\" class=\"wp-image-148\"/><figcaption>Это третье фото</figcaption></figure>\n<!-- /wp:image -->', 'Выбор читателей: где удобнее работать фрилансеру', '', 'inherit', 'closed', 'closed', '', '96-revision-v1', '', '', '2020-11-05 17:56:30', '2020-11-05 14:56:30', '', 96, 'http://universal.loc/2020/11/05/96-revision-v1/', 0, 'revision', '', 0),
(150, 1, '2020-11-05 20:05:34', '2020-11-05 17:05:34', '<!-- wp:paragraph {\"dropCap\":true} -->\n<p class=\"has-drop-cap\">Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2020-11-05 20:05:34', '2020-11-05 17:05:34', '', 93, 'http://universal.loc/2020/11/05/93-revision-v1/', 0, 'revision', '', 0),
(152, 1, '2020-11-05 21:01:51', '2020-11-05 18:01:51', '', 'image-nature-01', '', 'inherit', 'open', 'closed', '', 'image-nature-01', '', '', '2020-11-05 21:01:51', '2020-11-05 18:01:51', '', 93, 'http://universal.loc/wp-content/uploads/2020/11/image-nature-01.jpg', 0, 'attachment', 'image/jpeg', 0),
(153, 1, '2020-11-05 21:02:35', '2020-11-05 18:02:35', '<!-- wp:paragraph {\"dropCap\":true} -->\n<p class=\"has-drop-cap\">Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p> С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":152,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-nature-01.jpg\" alt=\"\" class=\"wp-image-152\"/><figcaption>Горные вершины</figcaption></figure>\n<!-- /wp:image -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2020-11-05 21:02:35', '2020-11-05 18:02:35', '', 93, 'http://universal.loc/2020/11/05/93-revision-v1/', 0, 'revision', '', 0),
(155, 1, '2020-11-05 23:20:55', '2020-11-05 20:20:55', '<!-- wp:paragraph {\"dropCap\":true} -->\n<p class=\"has-drop-cap\">Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p> С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":152,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-nature-01.jpg\" alt=\"\" class=\"wp-image-152\"/><figcaption>Горные вершины</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-regular\"} -->\n<figure class=\"wp-block-table is-style-regular\"><table><tbody><tr><td></td><td></td></tr><tr><td></td><td></td></tr></tbody></table><figcaption>Таблица 1.1</figcaption></figure>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2020-11-05 23:20:55', '2020-11-05 20:20:55', '', 93, 'http://universal.loc/2020/11/05/93-revision-v1/', 0, 'revision', '', 0),
(156, 1, '2020-11-05 23:23:17', '2020-11-05 20:23:17', '<!-- wp:paragraph {\"dropCap\":true} -->\n<p class=\"has-drop-cap\">Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p> С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":152,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-nature-01.jpg\" alt=\"\" class=\"wp-image-152\"/><figcaption>Горные вершины</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-regular\"} -->\n<figure class=\"wp-block-table is-style-regular\"><table><tbody><tr><td class=\"has-text-align-center\" data-align=\"center\">ФИО</td><td class=\"has-text-align-center\" data-align=\"center\">Возраст</td></tr><tr><td class=\"has-text-align-center\" data-align=\"center\">Сидоров П.И.</td><td class=\"has-text-align-center\" data-align=\"center\">23</td></tr></tbody></table><figcaption>Таблица 1.1</figcaption></figure>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2020-11-05 23:23:17', '2020-11-05 20:23:17', '', 93, 'http://universal.loc/2020/11/05/93-revision-v1/', 0, 'revision', '', 0),
(157, 1, '2020-11-06 00:06:32', '2020-11-05 21:06:32', '<!-- wp:paragraph {\"dropCap\":true} -->\n<p class=\"has-drop-cap\">Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p> С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":152,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-nature-01.jpg\" alt=\"\" class=\"wp-image-152\"/><figcaption>Горные вершины</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-regular\"} -->\n<figure class=\"wp-block-table is-style-regular\"><table><tbody><tr><td class=\"has-text-align-left\" data-align=\"left\">ФИО</td><td class=\"has-text-align-center\" data-align=\"center\">Возраст</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Сидоров Петр Иванович</td><td class=\"has-text-align-center\" data-align=\"center\">23</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Иванова Мария Семеновна</td><td class=\"has-text-align-center\" data-align=\"center\">37</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Пупкин Имануил Афиногенович</td><td class=\"has-text-align-center\" data-align=\"center\">95</td></tr></tbody></table><figcaption>Таблица 1.1</figcaption></figure>\n<!-- /wp:table -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2020-11-06 00:06:32', '2020-11-05 21:06:32', '', 93, 'http://universal.loc/2020/11/06/93-revision-v1/', 0, 'revision', '', 0),
(158, 1, '2020-11-06 09:39:07', '2020-11-06 06:39:07', '<!-- wp:paragraph {\"dropCap\":true} -->\n<p class=\"has-drop-cap\">Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Задача организации</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p> С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":152,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-nature-01.jpg\" alt=\"\" class=\"wp-image-152\"/><figcaption>Горные вершины</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-regular\"} -->\n<figure class=\"wp-block-table is-style-regular\"><table><tbody><tr><td class=\"has-text-align-left\" data-align=\"left\">ФИО</td><td class=\"has-text-align-center\" data-align=\"center\">Возраст</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Сидоров Петр Иванович</td><td class=\"has-text-align-center\" data-align=\"center\">23</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Иванова Мария Семеновна</td><td class=\"has-text-align-center\" data-align=\"center\">37</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Пупкин Имануил Афиногенович</td><td class=\"has-text-align-center\" data-align=\"center\">95</td></tr></tbody></table><figcaption>Таблица 1.1</figcaption></figure>\n<!-- /wp:table -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>Эксперимент проверки направлений</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2020-11-06 09:39:07', '2020-11-06 06:39:07', '', 93, 'http://universal.loc/2020/11/06/93-revision-v1/', 0, 'revision', '', 0),
(159, 1, '2020-11-06 10:01:09', '2020-11-06 07:01:09', '<!-- wp:paragraph {\"dropCap\":true} -->\n<p class=\"has-drop-cap\">Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. Повседневная практика показывает, что реализация намеченных плановых заданий требуют определения и уточнения дальнейших направлений развития. Равным образом постоянный количественный рост и сфера нашей активности требуют от нас анализа существенных финансовых и административных условий.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":1} -->\n<h1>Задача организации</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Задача организации, в особенности же консультация с широким активом позволяет оценить значение модели развития. Повседневная практика показывает, что консультация с широким активом требуют определения и уточнения направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p> С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":152,\"sizeSlug\":\"large\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://universal.loc/wp-content/uploads/2020/11/image-nature-01.jpg\" alt=\"\" class=\"wp-image-152\"/><figcaption>Горные вершины</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:table {\"className\":\"is-style-regular\"} -->\n<figure class=\"wp-block-table is-style-regular\"><table><tbody><tr><td class=\"has-text-align-left\" data-align=\"left\">ФИО</td><td class=\"has-text-align-center\" data-align=\"center\">Возраст</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Сидоров Петр Иванович</td><td class=\"has-text-align-center\" data-align=\"center\">23</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Иванова Мария Семеновна</td><td class=\"has-text-align-center\" data-align=\"center\">37</td></tr><tr><td class=\"has-text-align-left\" data-align=\"left\">Пупкин Имануил Афиногенович</td><td class=\"has-text-align-center\" data-align=\"center\">95</td></tr></tbody></table><figcaption>Таблица 1.1</figcaption></figure>\n<!-- /wp:table -->\n\n<!-- wp:heading {\"level\":4} -->\n<h4>Эксперимент проверки направлений</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке соответствующий условий активизации. С другой стороны дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p>\n<!-- /wp:paragraph -->', 'Расследование недели: сколько зарабатывает веб разработчик в Москве', 'Таким образом сложившаяся структура организации представляет собой интересный эксперимент проверки систем массового участия. ', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2020-11-06 10:01:09', '2020-11-06 07:01:09', '', 93, 'http://universal.loc/2020/11/06/93-revision-v1/', 0, 'revision', '', 0),
(161, 1, '2020-11-07 12:11:35', '2020-11-07 09:11:35', 'http://universal.loc/wp-content/uploads/2020/11/cropped-logo-new.png', 'cropped-logo-new.png', '', 'inherit', 'open', 'closed', '', 'cropped-logo-new-png', '', '', '2020-11-07 12:11:35', '2020-11-07 09:11:35', '', 0, 'http://universal.loc/wp-content/uploads/2020/11/cropped-logo-new.png', 0, 'attachment', 'image/png', 0),
(162, 1, '2020-11-07 12:33:12', '2020-11-07 09:33:12', '{\n    \"universal-theme::custom_logo\": {\n        \"value\": 161,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-07 09:12:25\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'efd0086e-7cae-406e-8dc0-8a0ba6cadd3d', '', '', '2020-11-07 12:33:12', '2020-11-07 09:33:12', '', 0, 'http://universal.loc/?p=162', 0, 'customize_changeset', '', 0),
(163, 1, '2020-11-07 12:40:49', '2020-11-07 09:40:49', '{\n    \"universal-theme::custom_logo\": {\n        \"value\": 160,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-07 09:40:49\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '88019f37-ae7b-4e48-82a7-00165732170b', '', '', '2020-11-07 12:40:49', '2020-11-07 09:40:49', '', 0, 'http://universal.loc/2020/11/07/88019f37-ae7b-4e48-82a7-00165732170b/', 0, 'customize_changeset', '', 0),
(165, 1, '2020-11-09 15:43:17', '2020-11-09 12:43:17', '{\n    \"universal-theme::custom_logo\": {\n        \"value\": 164,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-09 12:43:17\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '88383c11-2cdf-4563-931c-1d84e61fae33', '', '', '2020-11-09 15:43:17', '2020-11-09 12:43:17', '', 0, 'http://universal.loc/2020/11/09/88383c11-2cdf-4563-931c-1d84e61fae33/', 0, 'customize_changeset', '', 0),
(166, 1, '2020-11-10 14:33:54', '2020-11-10 11:33:54', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo-2', '', '', '2020-11-10 14:33:54', '2020-11-10 11:33:54', '', 0, 'http://universal.loc/wp-content/uploads/2020/11/logo.png', 0, 'attachment', 'image/png', 0),
(167, 1, '2020-11-10 14:35:03', '2020-11-10 11:35:03', '{\n    \"universal-theme::custom_logo\": {\n        \"value\": 166,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-10 11:35:03\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '82875fc4-3d61-48ad-a14f-fde1387538a7', '', '', '2020-11-10 14:35:03', '2020-11-10 11:35:03', '', 0, 'http://universal.loc/2020/11/10/82875fc4-3d61-48ad-a14f-fde1387538a7/', 0, 'customize_changeset', '', 0),
(168, 1, '2020-11-12 23:17:40', '0000-00-00 00:00:00', '', 'Черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-11-12 23:17:40', '0000-00-00 00:00:00', '', 0, 'http://universal.loc/?p=168', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_termmeta`
--

CREATE TABLE `universal_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `universal_terms`
--

CREATE TABLE `universal_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_terms`
--

INSERT INTO `universal_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без рубрики', 'bez-rubriki', 0),
(2, 'Header Menu', 'header-menu', 0),
(3, 'css', 'css', 0),
(4, 'javascript', 'javascript', 0),
(5, 'html', 'html', 0),
(6, 'web design', 'web-design', 0),
(7, 'css', 'css', 0),
(8, 'grid', 'grid', 0),
(9, 'javascript', 'javascript', 0),
(10, 'фриланс', 'frilans', 0),
(11, 'retina', 'retina', 0),
(12, 'html', 'html', 0),
(13, 'web design', 'web-design', 0),
(14, 'figma', 'figma', 0),
(15, 'flexbox', 'flexbox', 0),
(16, 'статьи', 'articles', 0),
(19, 'популярное', 'populyarnoe', 0),
(20, 'расследования', 'investigation', 0),
(21, 'трудоустройство', 'trudoustrojstvo', 0),
(22, 'деньги', 'dengi', 0),
(23, 'Фоторепортаж', 'photo-report', 0),
(24, 'фр', 'fr', 0),
(25, 'фото', 'foto', 0),
(26, 'фоторепортаж', 'fotoreportazh', 0),
(27, 'Карьера', 'career', 0),
(28, 'карьера', 'karera', 0),
(29, 'работа', 'rabota', 0),
(30, 'News Menu', 'news-menu', 0),
(31, 'Articles Menu', 'articles-menu', 0),
(32, 'Video lessons menu', 'video-lessons-menu', 0),
(33, 'Information Menu', 'information-menu', 0),
(34, 'Courses Menu', 'courses-menu', 0),
(35, 'Category Menu', 'category-menu', 0),
(36, 'Footer Menu', 'footer-menu', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_term_relationships`
--

CREATE TABLE `universal_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_term_relationships`
--

INSERT INTO `universal_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(20, 2, 0),
(21, 2, 0),
(22, 2, 0),
(23, 2, 0),
(24, 2, 0),
(25, 2, 0),
(26, 2, 0),
(30, 3, 0),
(30, 7, 0),
(30, 8, 0),
(30, 19, 0),
(33, 4, 0),
(33, 9, 0),
(33, 10, 0),
(35, 5, 0),
(35, 11, 0),
(35, 12, 0),
(37, 6, 0),
(37, 13, 0),
(37, 14, 0),
(37, 19, 0),
(40, 3, 0),
(40, 7, 0),
(40, 15, 0),
(42, 10, 0),
(42, 16, 0),
(42, 19, 0),
(50, 4, 0),
(50, 9, 0),
(50, 19, 0),
(63, 16, 0),
(63, 19, 0),
(65, 10, 0),
(65, 16, 0),
(65, 19, 0),
(67, 10, 0),
(67, 16, 0),
(72, 5, 0),
(72, 12, 0),
(72, 19, 0),
(93, 20, 0),
(93, 21, 0),
(93, 22, 0),
(96, 10, 0),
(96, 23, 0),
(96, 25, 0),
(96, 26, 0),
(107, 27, 0),
(107, 28, 0),
(107, 29, 0),
(109, 30, 0),
(110, 30, 0),
(111, 30, 0),
(112, 30, 0),
(113, 31, 0),
(114, 31, 0),
(115, 31, 0),
(116, 31, 0),
(117, 32, 0),
(118, 32, 0),
(119, 32, 0),
(120, 33, 0),
(121, 33, 0),
(122, 33, 0),
(123, 33, 0),
(124, 34, 0),
(125, 34, 0),
(126, 34, 0),
(127, 34, 0),
(128, 34, 0),
(129, 35, 0),
(130, 35, 0),
(131, 35, 0),
(132, 35, 0),
(142, 36, 0),
(143, 36, 0),
(144, 36, 0),
(145, 36, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_term_taxonomy`
--

CREATE TABLE `universal_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_term_taxonomy`
--

INSERT INTO `universal_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 7),
(3, 3, 'category', '', 0, 2),
(4, 4, 'category', '', 0, 2),
(5, 5, 'category', '', 0, 2),
(6, 6, 'category', '', 0, 1),
(7, 7, 'post_tag', '', 0, 2),
(8, 8, 'post_tag', '', 0, 1),
(9, 9, 'post_tag', '', 0, 2),
(10, 10, 'post_tag', '', 0, 5),
(11, 11, 'post_tag', '', 0, 1),
(12, 12, 'post_tag', '', 0, 2),
(13, 13, 'post_tag', '', 0, 1),
(14, 14, 'post_tag', '', 0, 1),
(15, 15, 'post_tag', '', 0, 1),
(16, 16, 'category', '', 0, 4),
(19, 19, 'post_tag', '', 0, 7),
(20, 20, 'category', '', 16, 1),
(21, 21, 'post_tag', '', 0, 1),
(22, 22, 'post_tag', '', 0, 1),
(23, 23, 'category', '', 0, 1),
(24, 24, 'post_tag', '', 0, 0),
(25, 25, 'post_tag', '', 0, 1),
(26, 26, 'post_tag', '', 0, 1),
(27, 27, 'category', '', 0, 1),
(28, 28, 'post_tag', '', 0, 1),
(29, 29, 'post_tag', '', 0, 1),
(30, 30, 'nav_menu', '', 0, 4),
(31, 31, 'nav_menu', '', 0, 4),
(32, 32, 'nav_menu', '', 0, 3),
(33, 33, 'nav_menu', '', 0, 4),
(34, 34, 'nav_menu', '', 0, 5),
(35, 35, 'nav_menu', '', 0, 4),
(36, 36, 'nav_menu', '', 0, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `universal_usermeta`
--

CREATE TABLE `universal_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_usermeta`
--

INSERT INTO `universal_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'universal_admin'),
(2, 1, 'first_name', 'Владимир'),
(3, 1, 'last_name', 'Петиков'),
(4, 1, 'description', 'Профессиональный путь любого IT-специалиста начинается'),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'universal_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'universal_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'universal_dashboard_quick_press_last_post_id', '168'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(20, 1, 'metaboxhidden_dashboard', 'a:2:{i:0;s:18:\"dashboard_activity\";i:1;s:17:\"dashboard_primary\";}'),
(21, 1, 'universal_user-settings', 'libraryContent=browse'),
(22, 1, 'universal_user-settings-time', '1602102470'),
(23, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(24, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(25, 1, 'nav_menu_recently_edited', '36'),
(27, 1, 'session_tokens', 'a:1:{s:64:\"3a26539f40647b091547eb9701cb537f0809e40316f9e28443c86eb90b9a1ff6\";a:4:{s:10:\"expiration\";i:1605626491;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:142:\"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.77 YaBrowser/20.11.0.821 Yowser/2.5 Safari/537.36\";s:5:\"login\";i:1605453691;}}');

-- --------------------------------------------------------

--
-- Структура таблицы `universal_users`
--

CREATE TABLE `universal_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `universal_users`
--

INSERT INTO `universal_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'universal_admin', '$P$Bgp8DJmWuhGviymUyUwa6Suynxyz2M.', 'universal_admin', 'admin@kroxplus.ru', 'http://universal.loc', '2020-10-02 14:16:22', '', 0, 'Владимир Петиков');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `universal_commentmeta`
--
ALTER TABLE `universal_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `universal_comments`
--
ALTER TABLE `universal_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Индексы таблицы `universal_links`
--
ALTER TABLE `universal_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Индексы таблицы `universal_options`
--
ALTER TABLE `universal_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Индексы таблицы `universal_postmeta`
--
ALTER TABLE `universal_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `universal_posts`
--
ALTER TABLE `universal_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Индексы таблицы `universal_termmeta`
--
ALTER TABLE `universal_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `universal_terms`
--
ALTER TABLE `universal_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Индексы таблицы `universal_term_relationships`
--
ALTER TABLE `universal_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Индексы таблицы `universal_term_taxonomy`
--
ALTER TABLE `universal_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Индексы таблицы `universal_usermeta`
--
ALTER TABLE `universal_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Индексы таблицы `universal_users`
--
ALTER TABLE `universal_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `universal_commentmeta`
--
ALTER TABLE `universal_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `universal_comments`
--
ALTER TABLE `universal_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `universal_links`
--
ALTER TABLE `universal_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `universal_options`
--
ALTER TABLE `universal_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=891;

--
-- AUTO_INCREMENT для таблицы `universal_postmeta`
--
ALTER TABLE `universal_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=646;

--
-- AUTO_INCREMENT для таблицы `universal_posts`
--
ALTER TABLE `universal_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT для таблицы `universal_termmeta`
--
ALTER TABLE `universal_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `universal_terms`
--
ALTER TABLE `universal_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `universal_term_taxonomy`
--
ALTER TABLE `universal_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `universal_usermeta`
--
ALTER TABLE `universal_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `universal_users`
--
ALTER TABLE `universal_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
