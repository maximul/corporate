-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 02 2017 г., 03:10
-- Версия сервера: 5.7.16
-- Версия PHP: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `corporate`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `text`, `desc`, `alias`, `img`, `created_at`, `updated_at`, `user_id`, `category_id`, `keywords`, `meta_desc`) VALUES
(1, 'This is the title of the first article. Enjoy it.', '<p>Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant <strong>morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas.</p><p>In facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing <strong>sit amet semper</strong> sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus.</p>			                    <p><span id=\"more-41\"></span></p>                 <p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p><p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p><p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>', '<p>Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.</p>', 'article-1', '{\"mini\":\"003-55x55.jpg\",\"max\":\"003-816x282.jpg\",\"path\":\"0081-700x345.jpg\"}', '2017-08-07 21:00:00', NULL, 1, 2, 'Ключи', 'Краткое описание'),
(2, 'Nice & Clean. The best for our blog!', '<p>Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant <strong>morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas.</p><p>In facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing <strong>sit amet semper</strong> sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus.</p>			                    <p><span id=\"more-41\"></span></p>                 <p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p><p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p><p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>', '<p>Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.</p>', 'article-2', '{\"mini\":\"001-55x55.png\",\"max\":\"001-816x282.jpg\",\"path\":\"0081-700x345.jpg\"}', '2017-08-07 21:00:00', NULL, 1, 2, '', ''),
(3, 'Section shortcodes & sticky posts!', '<p>Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant <strong>morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas.</p><p>In facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing <strong>sit amet semper</strong> sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus.</p>			                    <p><span id=\"more-41\"></span></p>                 <p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p><p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p><p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>', '<p>Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.</p>', 'article-3', '{\"mini\":\"0037-55x55.jpg\",\"max\":\"00212-816x282.jpg\",\"path\":\"0081-700x345.jpg\"}', '2017-08-07 21:00:00', NULL, 1, 3, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `parent_id`, `alias`, `created_at`, `updated_at`) VALUES
(1, 'Блог', 0, 'blog', NULL, NULL),
(2, 'Компьютеры', 1, 'computers', '2017-08-07 21:00:00', NULL),
(3, 'Интересное', 1, 'interesting', '2017-08-07 21:00:00', NULL),
(4, 'Советы', 1, 'soveti', '2017-08-07 21:00:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `article_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `text`, `name`, `email`, `site`, `parent_id`, `created_at`, `updated_at`, `article_id`, `user_id`) VALUES
(1, 'Hello, World!', 'name', 'email@mail.ru', 'http://site.ru', 0, '2017-08-14 21:00:00', NULL, 1, NULL),
(2, 'Hello, World!', '', '', '', 0, '2017-08-14 21:00:00', NULL, 1, 1),
(3, 'Привет, Мир!!!', 'name', 'email@mail.ru', 'http://site.ru', 1, '2017-08-15 21:00:00', NULL, 1, 1),
(4, 'Привет!', 'Ben', 'ben@mail.ru', 'http://site.ru', 3, '2017-08-15 21:00:00', NULL, 1, 1),
(5, 'Hello, World!', 'name', 'email@mail.ru', 'http://site.ru', 4, '2017-08-15 21:00:00', NULL, 1, NULL),
(6, 'Коммент.', 'name', 'email@mail.ru', 'http://site.ru', 1, '2017-08-15 21:00:00', NULL, 1, 1),
(7, 'Привет, Мир!!!', 'name', 'email@mail.ru', 'http://site.ru', 2, '2017-08-15 21:00:00', NULL, 1, 1),
(8, 'Text', 'Name', 'Email', 'Website', 1, '2017-08-17 15:12:58', '2017-08-17 15:12:58', 1, NULL),
(9, 'Text2', 'Name', 'Email', 'Website', 0, '2017-08-17 17:22:37', '2017-08-17 17:22:37', 1, NULL),
(10, 'Text3', 'Name', 'Email', 'Website', 1, '2017-08-17 17:23:13', '2017-08-17 17:23:13', 1, NULL),
(11, 'Text', 'Test 1', 'Email', 'site', 1, '2017-08-18 11:14:08', '2017-08-18 11:14:08', 1, NULL),
(12, 'Text', 'Test 2', 'Email', 'site', 1, '2017-08-18 11:43:11', '2017-08-18 11:43:11', 1, NULL),
(13, 'Text11111111111111', 'Test 2', 'Email', 'site', 3, '2017-08-18 11:46:42', '2017-08-18 11:46:42', 1, NULL),
(14, 'zxzxzxczxc', 'sdas', 'asdasd', 'asdas', 0, '2017-08-18 13:34:46', '2017-08-18 13:34:46', 1, NULL),
(15, 'Текст', 'Имя', 'Почта', 'Сайт', 0, '2017-08-18 20:10:27', '2017-08-18 20:10:27', 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `filters`
--

CREATE TABLE `filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `filters`
--

INSERT INTO `filters` (`id`, `title`, `alias`, `created_at`, `updated_at`) VALUES
(1, 'Brand Identity', 'brand-identity', '2017-08-07 21:00:00', NULL),
(2, 'Web Design', 'web-design', '2017-08-10 21:00:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `title`, `path`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Главная', 'http://corporate.loc', 0, NULL, NULL),
(2, 'Блог', 'http://corporate.loc/articles', 0, NULL, NULL),
(3, 'Компьютеры', 'http://corporate.loc/articles/cat/computers', 2, NULL, NULL),
(4, 'Интересное', 'http://corporate.loc/articles/cat/interesting', 2, NULL, NULL),
(5, 'Советы', 'http://corporate.loc/articles/cat/soveti', 2, NULL, NULL),
(6, 'Портфолио', 'http://corporate.loc/portfolios', 0, NULL, NULL),
(7, 'Контакты', 'http://corporate.loc/contacts', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_08_110658_CreateArticlesTable', 1),
(4, '2017_08_08_112439_CreatePortfoliosTable', 1),
(5, '2017_08_08_113202_CreateFiltersTable', 1),
(6, '2017_08_08_113624_CreateCommentsTable', 1),
(7, '2017_08_08_114440_CreateSlidersTable', 1),
(8, '2017_08_08_114808_CreateMenusTable', 1),
(9, '2017_08_08_115226_CreateCategoriesTable', 1),
(10, '2017_08_08_120628_ChangeArticlesTable', 2),
(11, '2017_08_08_121545_ChangeCommentsTable', 2),
(12, '2017_08_08_122520_ChangePortfoliosTable', 3),
(13, '2017_08_18_231620_Change_Articles_Table2', 4),
(14, '2017_08_19_193520_ChangePortfoliosTable2', 5),
(15, '2017_08_21_143008_ChangeUserTable', 6),
(16, '2017_08_23_141923_CreateRolesTable', 7),
(17, '2017_08_23_142058_CreatePermissionsTable', 7),
(18, '2017_08_23_142258_CreatePermissionRoleTable', 7),
(19, '2017_08_23_142451_CreateRoleUserTable', 7),
(20, '2017_08_23_143937_ChangeCreateRoleUserTable', 8),
(21, '2017_08_23_144052_ChangeCreatePermissionRoleTable', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'VIEW_ADMIN', NULL, NULL),
(2, 'ADD_ARTICLES', NULL, NULL),
(3, 'UPDATE_ARTICLES', NULL, NULL),
(4, 'DELETE_ARTICLES', NULL, NULL),
(5, 'ADMIN_USERS', NULL, NULL),
(6, 'VIEW_ADMIN_ARTICLES', NULL, NULL),
(7, 'EDIT_USERS', NULL, NULL),
(8, 'VIEW_ADMIN_MENU', NULL, NULL),
(9, 'EDIT_MENU', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`id`, `created_at`, `updated_at`, `permission_id`, `role_id`) VALUES
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 2, 1),
(3, NULL, NULL, 3, 1),
(4, NULL, NULL, 4, 1),
(5, NULL, NULL, 5, 1),
(7, NULL, NULL, 7, 1),
(8, NULL, NULL, 8, 1),
(9, NULL, NULL, 9, 1),
(10, NULL, NULL, 6, 1),
(11, NULL, NULL, 1, 2),
(12, NULL, NULL, 6, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `portfolios`
--

CREATE TABLE `portfolios` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `filter_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `portfolios`
--

INSERT INTO `portfolios` (`id`, `title`, `text`, `customer`, `alias`, `img`, `created_at`, `updated_at`, `filter_alias`, `keywords`, `meta_desc`) VALUES
(1, 'Steep This!', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate\r\n', 'Steep This!', 'project1', '{\"mini\":\"0081-175x175.jpg\",\"max\":\"0081-770x368.jpg\",\"path\":\"0081.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', ''),
(2, 'Kineda', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate', 'customer', 'project2', '{\"mini\":\"0071-175x175.jpg\",\"max\":\"0071-770x368.jpg\",\"path\":\"0071.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', ''),
(3, 'Love', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate', '', 'project3', '{\"mini\":\"0061-175x175.jpg\",\"max\":\"0061-770x368.jpg\",\"path\":\"0061.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', ''),
(4, 'Guanacos', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate', 'Steep This!', 'project4', '{\"mini\":\"009-175x175.jpg\",\"max\":\"009-770x368.jpg\",\"path\":\"009.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', ''),
(5, 'Miller Bob', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate', 'customer', 'project5', '{\"mini\":\"0011-175x175.jpg\",\"max\":\"0012.jpg\",\"path\":\"0011.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', ''),
(6, 'Nili Studios', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate', '', 'project6', '{\"mini\":\"0027-175x175.jpgg\",\"max\":\"0027-770x368.jpg\",\"path\":\"0027.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', ''),
(7, 'Vitale Premium', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate', 'Steep This!', 'project7', '{\"mini\":\"0034-175x175.jpg\",\"max\":\"0034-770x368.jpg\",\"path\":\"0034.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', ''),
(8, 'Digitpool Medien', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate', 'customer', 'project8', '{\"mini\":\"0043-175x175.jpg\",\"max\":\"0043-770x368.jpg\",\"path\":\"0043.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', ''),
(9, 'Octopus', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.</p><p>Donec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum,<strong> sem lacus ultrice</strong>s est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.</p><p>Sed <a href=\"http://yourinspirationweb.com/demo/sheeva/work/xmas-icons/#\">porttitor eros </a>ut purus elementum a consectetur purus vulputate', '', 'project9', '{\"mini\":\"0052-175x175.jpg\",\"max\":\"0052-770x368.jpg\",\"path\":\"0052.jpg\"}', '2017-08-07 21:00:00', NULL, 'brand-identity', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Moderator', NULL, NULL),
(3, 'Guest', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_user`
--

INSERT INTO `role_user` (`id`, `created_at`, `updated_at`, `user_id`, `role_id`) VALUES
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 2, 2),
(3, NULL, NULL, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sliders`
--

INSERT INTO `sliders` (`id`, `img`, `desc`, `title`, `created_at`, `updated_at`) VALUES
(1, 'xx.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque', '<h2 style=\"color:#fff\">CORPORATE, MULTIPURPOSE..<br /><span>PINK RIO</span></h2>', NULL, NULL),
(2, '00314.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque', '<h2 style=\"color:#fff\">PINKRIO.<span>STRONG AND POWERFUL.</span></h2>', NULL, NULL),
(3, 'dd.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque', '<h2 style=\"color:#fff\">PINKRIO.<span>STRONG AND POWERFUL.</span></h2>', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `login`) VALUES
(1, 'User', 'user@mail.ru', '$2y$10$8ShSoo4r.D5hWy/HZ1j0ZOt/HcDCbpvY.mL71VDXziMq/B4SR7Wz2', 'kJTDFJ6CuA0FNoYstH3fV2oGeL99RFGDqp1NErlhqrqDnzd376huSr5UteWZ', '2017-08-08 09:32:58', '2017-08-08 09:32:58', 'user'),
(2, 'User1', 'user1@mail.ru', '$2y$10$a.R160ybsINejlGleUiYcOxJlLkDi6ms.wVRaeNfTaIiV4bTSB6kW', 'CLZzX9jlf8N4sFjVHOyKWmLlecVUi6Eicm8UOL3LZOXFyEvwLdhPpyTBNs29', '2017-08-31 16:48:50', '2017-08-31 18:26:17', 'user1'),
(3, 'User2', 'user2@mail.ru', '$2y$10$hKhsRFQqGTD674yi6dji0OxCNusVODfp7OigKjlNOEdHjykuOpovO', 'RBhdWDciBqGHJLXQLqNW0XS4k6zXlAdpxqaA3GTxfvRaMGe0iFsTf5H8NzBs', '2017-08-31 16:51:16', '2017-08-31 16:51:16', 'user2');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_alias_unique` (`alias`),
  ADD KEY `articles_user_id_foreign` (`user_id`),
  ADD KEY `articles_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_alias_unique` (`alias`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_article_id_foreign` (`article_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filters_alias_unique` (`alias`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portfolios_alias_unique` (`alias`),
  ADD KEY `portfolios_filter_alias_foreign` (`filter_alias`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_filter_alias_foreign` FOREIGN KEY (`filter_alias`) REFERENCES `filters` (`alias`);

--
-- Ограничения внешнего ключа таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
