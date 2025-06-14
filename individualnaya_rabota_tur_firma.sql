-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 14 2025 г., 21:46
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `individualnaya_rabota_tur_firma`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `IDclient` int(10) UNSIGNED NOT NULL,
  `fullName` tinytext DEFAULT NULL,
  `dataPassport` varchar(11) NOT NULL DEFAULT '0',
  `dataDetailsPassport` varchar(10) NOT NULL DEFAULT '0',
  `availabilityVisa` varchar(3) NOT NULL DEFAULT '0',
  `dataVisa` varchar(10) NOT NULL DEFAULT '0',
  `IDcategory` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`IDclient`, `fullName`, `dataPassport`, `dataDetailsPassport`, `availabilityVisa`, `dataVisa`, `IDcategory`) VALUES
(1, 'Иванов Петр Сидорович', '4501123456', '2020-05-15', 'Да', '2025-05-14', 3),
(2, 'Смирнова Анна Владимировна', '4511789012', '2019-11-20', 'Нет', '0000-00-00', 2),
(3, 'Козлов Дмитрий Игоревич', '4522234567', '2021-03-10', 'Да', '2026-03-09', 4),
(4, 'Петрова Екатерина Сергеевна', '4533345678', '2022-07-01', 'Да', '2027-06-30', 4),
(5, 'Соколов Андрей Николаевич', '4544456789', '2023-01-15', 'Да', '2028-01-14', 2),
(6, 'Новикова Ольга Петровна', '4555567890', '2023-03-20', 'Нет', '0000-00-00', 1),
(7, 'Корпоративный партнер', '4566678901', '2022-12-01', 'Да', '2027-11-30', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `client_categories`
--

CREATE TABLE `client_categories` (
  `IDcategory` int(10) UNSIGNED NOT NULL,
  `categoryName` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `minOrders` tinyint(3) UNSIGNED DEFAULT 0 COMMENT 'Минимальное количество заказов для категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `client_categories`
--

INSERT INTO `client_categories` (`IDcategory`, `categoryName`, `description`, `minOrders`) VALUES
(1, 'Новый клиент', 'Клиенты без истории заказов', 0),
(2, 'Стандартный', 'Клиенты с 1-2 завершенными заказами', 1),
(3, 'Постоянный', 'Клиенты с 3-5 завершенными заказами', 3),
(4, 'VIP', 'Особо ценные клиенты с более чем 5 заказами', 5),
(5, 'Партнер', 'Корпоративные клиенты и партнеры', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `discountclient`
--

CREATE TABLE `discountclient` (
  `IDdiscountClient` int(10) UNSIGNED NOT NULL,
  `IDclient` int(10) UNSIGNED NOT NULL,
  `IDspecialDiscount` int(10) UNSIGNED NOT NULL,
  `dateOfApplication` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `discountclient`
--

INSERT INTO `discountclient` (`IDdiscountClient`, `IDclient`, `IDspecialDiscount`, `dateOfApplication`) VALUES
(1, 1, 2, '2024-05-20'),
(2, 3, 1, '2024-04-15'),
(3, 4, 4, '2024-01-10');

-- --------------------------------------------------------

--
-- Структура таблицы `historytour`
--

CREATE TABLE `historytour` (
  `IDhistoryTour` int(10) UNSIGNED NOT NULL,
  `IDclient` int(10) UNSIGNED NOT NULL,
  `IDtour` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `historytour`
--

INSERT INTO `historytour` (`IDhistoryTour`, `IDclient`, `IDtour`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 4),
(4, 4, 3),
(5, 1, 3),
(6, 2, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `IDorder` int(10) UNSIGNED NOT NULL,
  `IDclient` int(10) UNSIGNED NOT NULL,
  `IDtravel` int(10) UNSIGNED NOT NULL,
  `dateOrder` date DEFAULT NULL,
  `insuredSum` mediumint(8) UNSIGNED DEFAULT NULL,
  `statusOrder` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`IDorder`, `IDclient`, `IDtravel`, `dateOrder`, `insuredSum`, `statusOrder`) VALUES
(1, 1, 1, '2024-06-01', 50000, 'Подтвержде'),
(2, 2, 2, '2024-06-15', 30000, 'Ожидание'),
(3, 3, 3, '2024-05-20', 20000, 'Отменен'),
(4, 4, 5, '2024-02-10', 70000, 'Подтвержде'),
(5, 1, 4, '2024-07-01', 60000, 'Обработка');

-- --------------------------------------------------------

--
-- Структура таблицы `scheduletravel`
--

CREATE TABLE `scheduletravel` (
  `IDtravel` int(10) UNSIGNED NOT NULL,
  `IDtour` int(10) UNSIGNED NOT NULL,
  `dateDeparture` date DEFAULT NULL,
  `routeDeparture` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `scheduletravel`
--

INSERT INTO `scheduletravel` (`IDtravel`, `IDtour`, `dateDeparture`, `routeDeparture`) VALUES
(1, 1, '2024-07-10', 'Шереметьево -> Фьюмичино'),
(2, 2, '2024-08-05', 'Домодедово -> Анталия'),
(3, 3, '2024-09-12', 'Киевский вокзал -> Берлин'),
(4, 1, '2024-08-01', 'Пулково -> Фьюмичино'),
(5, 4, '2024-10-01', 'Шереметьево -> Шарль-де-Голль');

-- --------------------------------------------------------

--
-- Структура таблицы `specialdiscount`
--

CREATE TABLE `specialdiscount` (
  `IDspecialDiscount` int(10) UNSIGNED NOT NULL,
  `sizeDiscount` tinyint(3) UNSIGNED DEFAULT 0,
  `conditionsDiscount` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `specialdiscount`
--

INSERT INTO `specialdiscount` (`IDspecialDiscount`, `sizeDiscount`, `conditionsDiscount`) VALUES
(1, 5, 'Постоянным клиентам'),
(2, 10, 'Сезонная скидка'),
(3, 15, 'Групповая скидка (от 4 человек)'),
(4, 20, 'Акция \"Раннее бронирование\"');

-- --------------------------------------------------------

--
-- Структура таблицы `tours`
--

CREATE TABLE `tours` (
  `IDtour` int(10) UNSIGNED NOT NULL,
  `country` tinytext DEFAULT NULL,
  `city` tinytext DEFAULT NULL,
  `tourPurpose` tinytext DEFAULT NULL,
  `categoryHotel` tinytext DEFAULT NULL,
  `nutrition` tinytext DEFAULT NULL,
  `startTour` date DEFAULT NULL,
  `endTour` date DEFAULT NULL,
  `transport` tinytext DEFAULT NULL,
  `cost` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `tours`
--

INSERT INTO `tours` (`IDtour`, `country`, `city`, `tourPurpose`, `categoryHotel`, `nutrition`, `startTour`, `endTour`, `transport`, `cost`) VALUES
(1, 'Италия', 'Рим', 'Экскурсионный', '4 звезды', 'Завтрак', '2024-07-10', '2024-07-20', 'Самолет', 85000),
(2, 'Турция', 'Анталия', 'Пляжный', '5 звезд', 'Все включено', '2024-08-05', '2024-08-15', 'Самолет', 65000),
(3, 'Германия', 'Берлин', 'Деловой', '3 звезды', 'Без питания', '2024-09-12', '2024-09-18', 'Поезд', 42000),
(4, 'Франция', 'Париж', 'Экскурсионный', '4 звезды', 'Полупансион', '2024-10-01', '2024-10-10', 'Самолет', 92000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`IDclient`) USING BTREE,
  ADD KEY `FK_clients_client_categories` (`IDcategory`);

--
-- Индексы таблицы `client_categories`
--
ALTER TABLE `client_categories`
  ADD PRIMARY KEY (`IDcategory`);

--
-- Индексы таблицы `discountclient`
--
ALTER TABLE `discountclient`
  ADD PRIMARY KEY (`IDdiscountClient`),
  ADD KEY `IDclient` (`IDclient`),
  ADD KEY `IDspecialDiscount` (`IDspecialDiscount`);

--
-- Индексы таблицы `historytour`
--
ALTER TABLE `historytour`
  ADD PRIMARY KEY (`IDhistoryTour`),
  ADD KEY `IDclient` (`IDclient`),
  ADD KEY `IDtour` (`IDtour`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`IDorder`),
  ADD KEY `IDclient` (`IDclient`),
  ADD KEY `IDtravel` (`IDtravel`);

--
-- Индексы таблицы `scheduletravel`
--
ALTER TABLE `scheduletravel`
  ADD PRIMARY KEY (`IDtravel`),
  ADD KEY `IDtour` (`IDtour`);

--
-- Индексы таблицы `specialdiscount`
--
ALTER TABLE `specialdiscount`
  ADD PRIMARY KEY (`IDspecialDiscount`);

--
-- Индексы таблицы `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`IDtour`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `IDclient` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `client_categories`
--
ALTER TABLE `client_categories`
  MODIFY `IDcategory` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `discountclient`
--
ALTER TABLE `discountclient`
  MODIFY `IDdiscountClient` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `historytour`
--
ALTER TABLE `historytour`
  MODIFY `IDhistoryTour` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `IDorder` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `scheduletravel`
--
ALTER TABLE `scheduletravel`
  MODIFY `IDtravel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `specialdiscount`
--
ALTER TABLE `specialdiscount`
  MODIFY `IDspecialDiscount` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tours`
--
ALTER TABLE `tours`
  MODIFY `IDtour` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `FK_clients_client_categories` FOREIGN KEY (`IDcategory`) REFERENCES `client_categories` (`IDcategory`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `discountclient`
--
ALTER TABLE `discountclient`
  ADD CONSTRAINT `FK_discountclient_clients` FOREIGN KEY (`IDclient`) REFERENCES `clients` (`IDclient`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_discountclient_specialdiscount` FOREIGN KEY (`IDspecialDiscount`) REFERENCES `specialdiscount` (`IDspecialDiscount`) ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `historytour`
--
ALTER TABLE `historytour`
  ADD CONSTRAINT `FK_historytour_clients` FOREIGN KEY (`IDclient`) REFERENCES `clients` (`IDclient`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_historytour_tours` FOREIGN KEY (`IDtour`) REFERENCES `tours` (`IDtour`) ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_clients` FOREIGN KEY (`IDclient`) REFERENCES `clients` (`IDclient`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_orders_scheduletravel` FOREIGN KEY (`IDtravel`) REFERENCES `scheduletravel` (`IDtravel`) ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `scheduletravel`
--
ALTER TABLE `scheduletravel`
  ADD CONSTRAINT `FK_scheduletravel_tours` FOREIGN KEY (`IDtour`) REFERENCES `tours` (`IDtour`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
