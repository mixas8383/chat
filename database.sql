-- Время создания: Ноя 25 2015 г., 00:18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `chat`
--

-- --------------------------------------------------------

--
-- Структура таблицы `abuse`
--

CREATE TABLE IF NOT EXISTS `abuse` (
  `id` int(13) NOT NULL,
  `user_id_from` int(13) NOT NULL COMMENT 'Потерпевший',
  `user_id_to` int(13) NOT NULL COMMENT 'Обвиняемый',
  `time` int(13) NOT NULL COMMENT 'Время поступления жалобы'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `read_time` int(11) NOT NULL DEFAULT '0',
  `message` text CHARACTER SET utf8 NOT NULL COMMENT 'Текст сообщения',
  `userAgent` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Содержит информацию из какого браузера сообщение отправлено'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `error` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_relations`
--

CREATE TABLE IF NOT EXISTS `users_relations` (
  `user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Избран, Заблокирован, В контактах'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Отношения (чёрный список, избранное, список контактов)';

-- --------------------------------------------------------

--
-- Структура таблицы `user_complaints`
--

CREATE TABLE IF NOT EXISTS `user_complaints` (
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Спам, Что то ещё',
  `time` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='жалобы на пользователей';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `abuse`
--
ALTER TABLE `abuse`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `users_relations`
--
ALTER TABLE `users_relations`
  ADD PRIMARY KEY (`user_id`,`to_user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `abuse`
--
ALTER TABLE `abuse`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;