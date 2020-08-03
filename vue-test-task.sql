-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 03 2020 г., 11:23
-- Версия сервера: 10.4.10-MariaDB
-- Версия PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vue-test-task`
--

-- --------------------------------------------------------

--
-- Структура таблицы `data_`
--

CREATE TABLE `data_` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `type` int(12) NOT NULL,
  `price` varchar(256) NOT NULL,
  `country` varchar(256) NOT NULL,
  `count` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `data_`
--

INSERT INTO `data_` (`id`, `title`, `description`, `creation_date`, `type`, `price`, `country`, `count`) VALUES
(5, 'title', 'description', '2020-08-02 13:25:06', 1, '', '', ''),
(6, 'title', 'desc', '2020-08-02 13:32:09', 3, '', '', ''),
(7, 'qwe', 'desc', '2020-08-02 13:48:51', 5, '', '', ''),
(8, 'заголовок', 'описание', '2020-08-02 17:06:19', 0, '', '', ''),
(9, 'заголовок', 'описание', '2020-08-02 17:13:19', 0, 'цена', ' страна', 'количество');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `data_`
--
ALTER TABLE `data_`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `data_`
--
ALTER TABLE `data_`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
