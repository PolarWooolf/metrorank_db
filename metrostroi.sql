-- MySQL dump 10.14  Distrib 5.5.59-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 46.36.216.234    Database: metrostroi
-- ------------------------------------------------------
-- Server version	5.5.60-0+deb7u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `steam_id` varchar(20) NOT NULL,
  `reason` tinytext NOT NULL,
  `admin` varchar(20) NOT NULL,
  PRIMARY KEY (`steam_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `item_id` bigint(20) NOT NULL DEFAULT '1',
  `author` varchar(50) CHARACTER SET utf8 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=1176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `key` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES ('metadmin_version','03/08/2017 WORKSHOP');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examinfo`
--

DROP TABLE IF EXISTS `examinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SID` text NOT NULL,
  `date` text NOT NULL,
  `rank` text NOT NULL,
  `examiner` text NOT NULL,
  `note` text NOT NULL,
  `type` int(11) NOT NULL,
  `server` text NOT NULL,
  `server_id` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1800 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examinfo`
--

LOCK TABLES `examinfo` WRITE;
/*!40000 ALTER TABLE `examinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `examinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `txtid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `change_group` smallint(1) NOT NULL DEFAULT '0',
  `warn` smallint(1) NOT NULL DEFAULT '0',
  `news_add` smallint(1) NOT NULL DEFAULT '0',
  `delete_comment` smallint(1) NOT NULL DEFAULT '0',
  `blacklist_edit` smallint(1) NOT NULL DEFAULT '0',
  `tests_edit` smallint(1) NOT NULL DEFAULT '0',
  `give_coupon` smallint(1) NOT NULL DEFAULT '0',
  `up_down` smallint(1) NOT NULL DEFAULT '0',
  `promote` smallint(1) NOT NULL DEFAULT '0',
  `demote` smallint(1) NOT NULL DEFAULT '0',
  `admin_panel` smallint(1) NOT NULL DEFAULT '0',
  `tickets` smallint(1) NOT NULL DEFAULT '0',
  `mag_reports` smallint(1) NOT NULL DEFAULT '0',
  `mag_bans` smallint(1) NOT NULL DEFAULT '0',
  `edit_tests` smallint(1) NOT NULL DEFAULT '0',
  `statistics` smallint(1) NOT NULL DEFAULT '0',
  `log` smallint(1) NOT NULL DEFAULT '0',
  `adm` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE KEY` (`txtid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'developer','Разработчик','Developer',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(4,'actinstructor','ИО Машиниста-инструктора','Instructor a.i.',0,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1),(3,'instructor','Машинист-инструктор','Instructor',0,1,0,0,0,0,1,1,1,1,0,1,1,0,1,0,1,1),(5,'traindispather','Поездной диспетчер','Train dispatcher',0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1),(6,'driver1class','Машинист 1 класса','1st class driver',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,'driver2class','Машинист 2 класса','2nd class driver',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(8,'driver3class','Машинист 3 класса','3rd class driver',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(10,'user','Помощник машиниста','Drivers assistant',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(9,'driver','Машинист (б/к)','Unclassified driver',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `server_id` int(11) NOT NULL DEFAULT '-1',
  `player` varchar(35) DEFAULT NULL,
  `target` varchar(35) DEFAULT NULL,
  `text` text NOT NULL,
  `args` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2743 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_types`
--

DROP TABLE IF EXISTS `log_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `format` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_types`
--

LOCK TABLES `log_types` WRITE;
/*!40000 ALTER TABLE `log_types` DISABLE KEYS */;
INSERT INTO `log_types` VALUES (1,'Повышение','%player% повысил игрока %target% до %rank%'),(2,'Понижение','%player% понизил игрока %target% до %rank%'),(3,'Установка ранга','%player% установил ранг игроку %target% %rank%'),(4,'Неудачная практика','%player% отклонил повышение игрока %target%'),(5,'Нарушение','%player% выдал нарушение игроку %target%'),(6,'Проверка теста','%player% проверил тест \"<a href=\"/admin_tests/%trid%\">%testname%</a>\" игрока %target%'),(7,'Изменение талона','%player% изменил талон игроку %target% (%old%->%new%)'),(8,'Удаление комментария','%player% удалил комментарий %target% (<a href=\"/id/%item_id%\">%text%</a>)'),(9,'Добавление иконки','%player% добавил иконку игроку %target%'),(10,'Удаление иконки','%player% удалил иконку игроку %target%'),(11,'Добавление новости','%player% добавил новость \"<a href=\"/news/view/%id%\">%title%</a>\"'),(12,'Удаление новости','%player% удалил новость \"%title%\" - %id%'),(13,'Редактирование новости','%player% отредактировал новость \"<a href=\"/news/view/%id%\">%title%</a>\"'),(14,'Перепроверка теста','%player% перепроверил тест \"<a href=\"/admin_tests/%trid%\">%testname%</a>\" игрока %target%'),(15,'Добавление категории тестов','%player% добавил категорию вопросов \"<a href=\"/admin_questions/%id%\">%name%</a>\"'),(16,'Добавление теста','%player% добавил тест \"<a href=\"/admin_questions/test/%id%\">%name%</a>\"'),(17,'Удаление теста','%player% удалил тест \"%name%\"'),(18,'Удаление вопроса','%player% удалил вопрос \"%name%\"'),(19,'Добавление вопроса','%player% добавил вопрос \"%name%\"'),(20,'Редактирование вопроса','%player% изменил вопрос \"%old%\"->\"%new%\"'),(21,'Редактирование теста','%player% изменил имя теста <a href=\"/admin_questions/%qcid%\">\"%old%\" -> \"%new%\"</a>'),(22,'Ответ в тикете','%player% ответил на <a href=\"/admin_tickets/%id%\">тикет</a> игрока %target%'),(23,'Статус тикета','%player% изменил статус <a href=\"/admin_tickets/%sid%\">тикета</a> - %id%'),(24,'Удаление тикета','%player% удалил <a href=\"/admin_tickets/%sid%\">тикет</a> - %id%'),(25,'Принудительный отпуск','%player% отправил %target% в отпуск'),(26,'Выход из отпуска','%player% вернулся из отпуска'),(27,'Отпуск','');
/*!40000 ALTER TABLE `log_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SID` text NOT NULL,
  `ip` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3084 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_log`
--

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mag_bans`
--

DROP TABLE IF EXISTS `mag_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mag_bans` (
  `mag_bid` bigint(20) NOT NULL AUTO_INCREMENT,
  `mag_steam_id` varchar(80) NOT NULL,
  `mag_admin_id` varchar(80) DEFAULT NULL,
  `mag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mag_unban_date` timestamp NULL DEFAULT NULL,
  `mag_reason` varchar(255) NOT NULL,
  PRIMARY KEY (`mag_bid`)
) ENGINE=MyISAM AUTO_INCREMENT=693 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mag_bans`
--

LOCK TABLES `mag_bans` WRITE;
/*!40000 ALTER TABLE `mag_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `mag_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mag_reports`
--

DROP TABLE IF EXISTS `mag_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mag_reports` (
  `mag_rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `mag_badpl` varchar(80) CHARACTER SET utf8 NOT NULL,
  `mag_reporter` varchar(80) CHARACTER SET utf8 NOT NULL,
  `mag_rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mag_heavy` tinyint(1) NOT NULL DEFAULT '0',
  `mag_sender_heavy_read` tinyint(1) NOT NULL DEFAULT '0',
  `mag_rserver` varchar(88) CHARACTER SET utf8 NOT NULL,
  `mag_rserver_id` int(11) NOT NULL DEFAULT '-1',
  `mag_reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewer` varchar(80) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`mag_rid`)
) ENGINE=MyISAM AUTO_INCREMENT=2081 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mag_reports`
--

LOCK TABLES `mag_reports` WRITE;
/*!40000 ALTER TABLE `mag_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mag_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat` bigint(20) NOT NULL DEFAULT '1',
  `title` varchar(250) NOT NULL,
  `author` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `d_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_cats`
--

DROP TABLE IF EXISTS `news_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_cats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '0',
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT 'ru_RU',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_cats`
--

LOCK TABLES `news_cats` WRITE;
/*!40000 ALTER TABLE `news_cats` DISABLE KEYS */;
INSERT INTO `news_cats` VALUES (1,'Прочие новости',0,'ru_RU'),(2,'Обновления мода',1,'ru_RU'),(3,'Новости сообщества',2,'ru_RU'),(4,'Новости системы',3,'ru_RU'),(5,'Other news',0,'en_US'),(6,'Mod updates',0,'en_US'),(7,'Community news',0,'en_US'),(8,'System news',0,'en_US');
/*!40000 ALTER TABLE `news_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `SID` varchar(20) NOT NULL,
  `group` text NOT NULL,
  `old_group` text,
  `status` text NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT '0',
  `about` text,
  `vk_id` bigint(20) DEFAULT NULL,
  `instagram` tinytext,
  `twitter` tinytext,
  `youtube` tinytext,
  `twitch` tinytext,
  `site` tinytext,
  `trains` varchar(255) NOT NULL DEFAULT '[]',
  `server_id` int(11) NOT NULL DEFAULT '-1',
  `ConnectedTime` int(11) NOT NULL DEFAULT '0',
  `wagons` int(11) NOT NULL DEFAULT '0',
  `station` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `steamid` (`SID`)
) ENGINE=MyISAM AUTO_INCREMENT=15134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `qid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat` bigint(20) NOT NULL,
  `difficulty` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `enabled` int(1) NOT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_cats`
--

DROP TABLE IF EXISTS `questions_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_cats` (
  `qcid` int(11) NOT NULL AUTO_INCREMENT,
  `qcname` tinytext NOT NULL,
  PRIMARY KEY (`qcid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_cats`
--

LOCK TABLES `questions_cats` WRITE;
/*!40000 ALTER TABLE `questions_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers_admins`
--

DROP TABLE IF EXISTS `servers_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers_admins` (
  `SID` varchar(20) NOT NULL,
  `server_ids` text NOT NULL,
  `access` int(11) NOT NULL,
  UNIQUE KEY `SID` (`SID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers_admins`
--

LOCK TABLES `servers_admins` WRITE;
/*!40000 ALTER TABLE `servers_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers_info`
--

DROP TABLE IF EXISTS `servers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers_info` (
  `server_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `prefix` varchar(4) DEFAULT NULL,
  `ip` text NOT NULL,
  `port` int(11) NOT NULL,
  `api_key` varchar(128) NOT NULL,
  `owner` varchar(20) NOT NULL,
  `show_for_everyone` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1 - GMOD metrostroi',
  `rem_rights` text NOT NULL,
  `status` int(11) NOT NULL,
  `maxplayers` int(11) NOT NULL,
  `wagons` int(11) NOT NULL DEFAULT '0',
  `maxwagons` int(11) NOT NULL DEFAULT '0',
  `map` text NOT NULL,
  `mapstats` text NOT NULL,
  `mixid` text NOT NULL,
  `CurTime` int(11) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`server_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers_info`
--

LOCK TABLES `servers_info` WRITE;
/*!40000 ALTER TABLE `servers_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `session_steamid` varchar(128) NOT NULL,
  `session_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('76561198305672505_l1kzmcq9u7BHhH5cZBKmN6MYSFmeBVsKbBcwCG5MmBqkYVLQgwGOGINqHBZmOI8d5aK3zXkAIdcbYW3UYL5P9pyX2lYUtwx5RYqw','STEAM_0:1:172703388','2018-05-08 19:47:53'),('76561198062259401_E0Kr1jFLUzbSeCid0kugU86iYjSJyFFvjnbLmnuMh84yjCyG87gzV6HseyqSiG5FHc90XgvRV7x8pnqwq9FSNi1XgxPWmpVga9Xf','STEAM_0:1:50996836','2018-04-22 09:38:25'),('76561197982961011_7ChUjpuiqvJbn4hqFk8rfqNbWLtBPbgaFs5g4bIvwUrkVJAqd1RkVPyMvFshXmFywOy0jA6nhlN7JDIRVfi1OKgriR4YY49XrimC','STEAM_0:1:11347641','2018-04-25 18:10:48'),('76561198276136755_QNURyuOXloEGUfLCRyxbO2iJsx33gHgyQfJYP3SIfIQg4VjkQpb49CGdNqsVvdYVWzeSxjyuXk3caCAIZ8YOkChJ9qzKPl76IWAl','STEAM_0:1:157935513','2018-04-26 05:56:58'),('76561198253692462_Zj7yhqoWR9EDge6Qm9eyKc5L4e08d2bCxAOSg0h9eM6or9OOO39EWHYVaUEXK9by6FQAYUzcblqvAOPtwrpD2n4YjbC8i1zfOtHU','STEAM_0:0:146713367','2018-05-19 11:12:57'),('76561198398679554_7KP42YGzSY5Er8XNAi0uGU3RLOtakFCo0UYbVXcqe3cVRcM3MFgueu3jxh9zaoL2pbiIC1tnG4r0bNcRvFLdrcnq2KKg4lJmQhy9','STEAM_0:0:219206913','2018-05-11 09:28:40'),('76561198083495544_BY0HXcZHfo83VMf2f7QBPpiZM6c4U4X2ozRqAQx3z3nYMGsNlmPwYBv2aSHOA8UOaGRzE8t7WF2L9go023wljUWwpgMWphlbphF7','STEAM_0:0:61614908','2018-05-20 07:19:41'),('76561198361132950_dDCANDN69zde7ZCXK9oOh3xvdND9KaLdRVGBuJMNChy7gjSuBAOolyL5rnp6YuISsm9WaNOuqcgEg9Re9XS7AxMkyxx4t2JYM0E4','STEAM_0:0:200433611','2018-05-06 18:07:31'),('76561198397959030_EDZ4wl2cslcfYca0YJIdpoFz42aVcn7PBmNNSyc77Ki39U7MLyGDODQlI3K0aEXC45mY21HNS19syuYdnY6ifU5iDu55pZBRbS8q','STEAM_0:0:218846651','2018-05-20 13:29:37'),('76561198346435176_t9w6SOqqqZnFA1xpGQ4bZj8iqcRNFJtAN2KXW4iLowXkn9UeG43DO1o27apIZXaKRKAxhuBpWeWokpY68RKCSkaOji2wRCfaaymR','STEAM_0:0:193084724','2018-05-20 14:38:25'),('76561198138422850_BiuJBNHUYfK4bbALtuRyJ0VEpnlxlCYgiXi9BHoja5s3rjdb0XkY6DhKrgswoBf0WiULwAOS7aRDF64esDfgsvPlWxgwwwPYMkxz','STEAM_0:0:89078561','2018-05-18 19:14:10'),('76561198059280904_o9Y0iaNZ5UhfWCurrqlcMDxtmcngR5mpcYvmuKoXcg6toBusjui67z4PK7ybzGSCMyellX7UlcAkSK7e1G857OFlD6eYSYYVLHYl','STEAM_0:0:49507588','2018-04-26 00:44:51'),('76561198302039887_in19fbfR0fkr3fZvxy9vXNXpIJSz6wLZEr84swrFgPXZg48tw8VUih1OtMzRn7d84KAm9qWjSnsYMBLpfZQrzCvLEhh9LxgfzG8V','STEAM_0:1:170887079','2018-05-16 13:14:57'),('76561198262519342_jLF56Kyv4wWCFQK4fUJpEiZaYSH6hjP9WSbNNPys7UPVGzb5OwkkSwIk3YdnnNVPNzRCLOzAMSGGWDPbZD40mkW1PMexmRUpaeF5','STEAM_0:0:151126807','2018-05-04 19:39:01'),('76561198191788507_76gH7YndxrghKjMbmi3nFIpvyGVZAp21LpcDJ0nmH3Ose032lZoQ1b92N97E71LvvOeHiDYspAPSM9pZPjBUSEFfMLtZ7hKIQQ0b','STEAM_0:1:115761389','2018-05-17 00:18:20'),('76561198828516477_jb71DeDuX9se4PUZHOYcklHxaCpaXiHJZd3GEbVJw3EzuAVPDGwPxbY25g2Sopm1XIagvfG8cKsgS3biRbJuhPxNt2RFwrztMGUZ','STEAM_0:1:434125374','2018-05-10 09:18:52'),('76561198263827670_BPRxX4vdXHQqS27gM6od6Y926VC71yDEwixSow7GXycYa8ZA8BNKsUOtOC85XUNUVYCfRhbN1NOElyrYf8R7V0D8DqLIJMYUaF80','STEAM_0:0:151780971','2018-05-18 10:53:23'),('76561198801127835_EbxvpfkYxccyOZrnpt5wXKYSbKAvwg3pwKf9Walgqc90mMq1sOaIiPGMp4HHSAmkfYWxtpoWQGPVLu3Gr5YcKfoVLwLpKaEf2lq4','STEAM_0:1:420431053','2018-04-27 16:23:08'),('76561198322373377_x5gPSXixIY0zmhCiLlPwUJPsD6EoflVJPIsnxf2Y4cSgajEefl6yjOCC1vm8APgSp7Hk4VE0J7CcRsJHyklEeBiNJRzce0lD7JuG','STEAM_0:1:181053824','2018-04-23 20:20:47'),('76561198328491715_PXc23DyZlitbHRfjUXLhoXBN00kFHLmV4XkSDQ1oFWIVJOlJHgxpJE3i8SoCPf7PxGp8aLq6kyWyK4cVdFMhvXUuxkFnem6g60gl','STEAM_0:1:184112993','2018-05-20 09:03:02'),('76561198313736037_NhNBa07wGy0cd2cW6Cg40lAcC2gmLRHOLGjZkxhjuE8Xa9DyLYVcrWkCNRkDsSVYvs8IJXygM7MhD7bNAcxZm8OYqUfNKWqNjjd3','STEAM_0:1:176735154','2018-04-29 03:49:36'),('76561197964568402_84Zcvm65PbziWjXWwJbYBgxS5u1AkqYOipAqgOUv4kDwVPlEWMgJt3i6K7Yz7qZjqtA4UcQBi4MDNjA714JHwfLynWjsm5gSAijY','STEAM_0:0:2151337','2018-05-19 12:34:38'),('76561198122629576_LYwBeOnP79ZwOe4HofzjBm7wen4rGopX4V69Dh0Noqk4fM3qx4IzWGmYMDcXyhg8g1n93GxUbbCFpBkS0SALLC7GN0r6EZrh7VKl','STEAM_0:0:81181924','2018-05-09 19:00:51'),('76561198187006433_JCAQFeOJej05OvMYgVdYoRBYXhGLZPxjboP5vfKNtwlNa49N4ovN0MHu1M0JUf3LpZVI8KOjYtDNSVDrsngLCUSIU4M3KW9uOI0H','STEAM_0:1:113370352','2018-05-02 15:50:49'),('76561198067149935_vfuxk7LUEs5HYvrc621YzCGdbV40hAagDI8uRawXFwwSQI6jj2eeBEERKlFLe7CYKJkQtYd9gAvM1Hb8YdsKY9HVScHBzI6xJjGV','STEAM_0:1:53442103','2018-05-11 18:55:28'),('76561198357545872_1SqJDAt4MXrhvR7yvALaoZ3mjeoszxQSieRk6CZBchLdOjtLrOdBFO9Em89QrmyHsAfhRdtdCuqLMk0w2iKbg2I5AvYdYMV7DqG1','STEAM_0:0:198640072','2018-04-23 13:25:29'),('76561198138758848_dJuaxtWpOCGeNKsZOMbMj76FjQqEMwiQS22j4dQWdS1st7AIud7eioOYqwmEksI54GWLHSSfjNu2twtGj7Yh3IC1fC8bg3y5IwLo','STEAM_0:0:89246560','2018-04-23 20:52:25'),('76561198118996496_nUaG15Mb7nA9OCEq9aN8sHAZkXR3u75Mn14783pUJXnOafIYyNaiXjPNuwxRvStk2fSkjUx0cC8BkttzybeMGm7xGYxfVH3glYYu','STEAM_0:0:79365384','2018-05-20 12:17:01'),('76561198131306967_0bYYykdmge7BPdWPNYU9eV3mxAs8nrDtteEDYSmK3otuXAOGm1Ey3xV3i3D6RPZJXr1e77FuYNomE1iL8Gulf2MvY8kqcP2faGXw','STEAM_0:1:85520619','2018-05-19 12:27:51'),('76561198331217557_3HNA7ScVyzkvFm0sUJ0FlYcqetuabY17xhsYtyE0zDp4yO7AQQbiHdJJq7op7iYFvse8DqxeK6RkBBSHCY6Hw7GxQnMpPcMckgkM','STEAM_0:1:185475914','2018-05-20 10:54:28'),('76561198053885037_5Jfc1brY5HE3YrlJW9FAWpakODXZX9Y1ZYptkke6CO3itkyEneyQ6MCmk15cYjEI26QSNjah6ddFlr061UD6DncHekpqCALWoa3F','STEAM_0:1:46809654','2018-05-18 14:14:02'),('76561198303674165_dOffE9gVKBzjBMbFKNHNlrg8LLm513RYlH0iplUH49GQigebV3qMcqwmSqVc9nGs3CBkXAtZwlRNY89XUEr91IcUGMXhdX8BoKLm','STEAM_0:1:171704218','2018-04-26 11:55:00'),('76561198195100261_tY5VYY9LMekkbhmp2jFuVbmOJhN4utnC0BHE4SmjU1YRBqsyQexeYFxC0vOWqYn9ZojP21816vRSG40gYePj8OdqJtuaK7euvEN1','STEAM_0:1:117417266','2018-05-19 20:32:45'),('76561198067149935_BdqNt9NgROsB2PIamDcAAYx0IAiNtWQYPaSOsOrHL4j6Nt0kJaAkA9l5MOcYbXh3Lnyrpoqgei1jYk5a2wX2eBhePsHNgYZ393rk','STEAM_0:1:53442103','2018-05-08 09:00:11'),('76561198136228364_fL28vYpYM1jb5COhkDmF48Fy5FMzvZpHwUA2YY37pZrFeQPR9LKWRjjjhmxiuGVAHCkVYqbCBfYNNp0H6vFOm7a7ZbPvzqRB1V9x','STEAM_0:0:87981318','2018-05-20 11:27:33'),('76561198041083872_4UoOBWNQF3tQo287umWeWNhhEYV3fwKxKdIOc3PQwoDZEgs0KtAhBa3mUNL3CRSylNXW4Si5lohX6wU2rb0us5O4U5nWSSR2tRPH','STEAM_0:0:40409072','2018-05-08 15:16:35'),('76561198041587615_aRVbnHLRj6OmlIpZk5YpmPbOtJk6XMFYO7ClLfWMWN3yZoxsi8MIWjQDbit7pKbpJFNhwqowPk9GxPWaANzYpGR1Ch0rVGaIZnu8','STEAM_0:1:40660943','2018-05-02 18:28:34'),('76561198336003835_uQnJxhp7Kgypr3e296EsuGDayLNdJYJwE37VGl5i3kFiN4hXU1eMhV63Fy0SsIl4WWQawGRKFwSvlMG8nepWbMaoQtpktZlcdhq1','STEAM_0:1:187869053','2018-05-19 12:49:11'),('76561198823124560_pUMhstgqMysYIIOLmf0Gd3jEJcVfVuEICmhJsH491msMiX9NgBYacl5lsE4IwAatpePXvhNfwC3rN397hO1PLps5HYYZxvdk2v3D','STEAM_0:0:431429416','2018-04-24 05:05:40'),('76561198138218617_MZbvXPmeHf45HiQr4BSqqL2xDGWvEiqIJKxpRYrLohr8o3hnPzDuceYzHarqIgxOz6L6z99WYo5fiRuMYmDaXlBQoFQ9SYEI6ryY','STEAM_0:1:88976444','2018-04-25 13:31:06'),('76561198202735447_ri9B22v82OPmf8HDSnOUz1YerkAVOzv8FwpfBZDM4DRP6NU7aYSLeYJzYqsp6s4z4ZjgEIUtxyR3h23OZOIwVypqNPIOdz5NqjZ2','STEAM_0:1:121234859','2018-05-10 17:23:00'),('76561198424262083_dfWuJz08JgkzlWvhAo7s8jL438YAy5wtJzcuDvmmsYe0D4uslob0HRtSKDHMVPiHQHaY3nurqfryIEYqdY2NdO1njxOWx1DNQeXW','STEAM_0:1:231998177','2018-04-29 10:08:37'),('76561198321101682_fEz7DEm1wc2Dwer66LSFCQBXg0XqS7ObHFGxeQmhnWszLtSMQxgmNEPc1ypxKWIYwEIKZBQw9QFtVPOQD54HjePxuHs6GSZYQj5B','STEAM_0:0:180417977','2018-05-13 07:28:20'),('76561198442907906_bJJzZtdMIpCXM3rs5WYcvZK1lqBvSQ8SM9KcEemzEG7Loo40Y0NRQFXtGthzvX8R3KECxX9qhYFeYtBQ8J2Jvy08vitxvMzIpCq4','STEAM_0:0:241321089','2018-04-26 09:32:59'),('76561198094423618_sVoZW9YIcQ661qNmGxKymEg6F70PuFUDLvirDQXkfZlSk7izU2Iiu028QPkD2qbRBOXISevU8DMLgNyKyeOEEAdDUbsvdq9YN2RS','STEAM_0:0:67078945','2018-05-11 12:32:23'),('76561198288318866_JxPicd83KqS1OyU2PDy9v0JIdP3GDzFcfzgH9j3xJg8IlU9gQNUkdMgEYqmiG6DlkRHVo9CCMEbSczlpqZhjpA487UdpxrjmObz7','STEAM_0:0:164026569','2018-05-09 17:35:56'),('76561198799134576_b82Vdp7dQpYjGDCkoZYdjb6NcY929w9GYAfAcu5w9KyEioYXXWxHWHq6Fd1yYVVplE48BwwwsFqNng1sRPs8yZ0RygOUjPajyCcI','STEAM_0:0:419434424','2018-04-27 14:03:27'),('76561198115603842_apmQaOY8g7kRDLoQWdjn1HrPdipbF6vJOaGYYBRAd0rBx1HMsEDIYvXVQlO1MhADiviLe9QiBmrz9cpWZERbfm3eoVB8jGG4tMaU','STEAM_0:0:77669057','2018-05-02 07:13:10'),('76561198348594413_bRM9dZQvZb3ykJfncsnZKlYwlgfNylC7WFYZoknUtt73xHN24nkc8JzAj5pyvK3qHFlrExFdek9REuyuFaAYnwug3b5tzmEjYsJw','STEAM_0:1:194164342','2018-05-13 17:10:51'),('76561198268123907_4y5fF8wY6PWdkKMvtBKibG1Logg9QcddHi5S2H3PupGGnYpZDIDq6b6yMLjrEzC8vNaVr7twDfvZ3duBtAfOsYQhulfyYYPmGtcZ','STEAM_0:1:153929089','2018-04-21 21:12:50'),('76561198122591807_dN06SE6KYeO3H0nv4WPEAqmGmsvigf1QYYa0c5oMLCJEaypBu9wUWK7SH1OGQBLjwxWpnBGQ3zHM1vZjGD9Gyy0QEeLHPEH9LKMg','STEAM_0:1:81163039','2018-05-07 10:45:36'),('76561198274216286_LHhPmFb2kv3sDBLszwQbVqCZj0yoQeJORe2IWY4uEoJNb7ko6hRKvs7xeYXzLKLVG97r032Dd0FvUBXJH2daLf0rkk2cfihQ0jMt','STEAM_0:0:156975279','2018-05-03 18:23:36'),('76561198280567128_HSS5L5zvexUtVd9q10E4JP33HJ7WLtNqFJgFirApgYalxvnhLikq0Uwz197oL01DCFMuDMRAY9KzUtHp68J3bXI9C0qW8Bfemlab','STEAM_0:0:160150700','2018-05-20 11:53:52'),('76561198155753899_FC4nPeEKjkCh2hd44SlG6GW9X23wqHprD8hCUw7pSLoi2Z1MXhM2CqM3RaWwZYJC6fQYs4kNlBh1p03Ciz5ELpeYgEJrhCR7OBG4','STEAM_0:1:97744085','2018-05-10 20:05:01'),('76561198160462303_sxuzjWolRcR0Z196DO4LjpjvhW1Vs2qvk3zSDpQxd4JlAMMgeidCHFnGwCmRK198MzwG6G3qPgVBjz78v0X1XsqVh658RZpDdgUY','STEAM_0:1:100098287','2018-04-24 10:50:18'),('76561198820801082_Fc9Y5k72feWrHfXDYZbYxJn3MB8g3p42mR0OuMRikwJw9YtP0YhzXCKL262OztyoVLOPbEhifW2PgeXmkCLAemAH6WQXBEtdxsOA','STEAM_0:0:430267677','2018-05-10 23:19:50'),('76561198171739657_1Onz8G3qHd1rtcUw7CRxapJRb5LqY2fYpv2anPNefvILD5CLVYgV3YBQCkltgw9jKwY1qQvnWQZQKhgZ4GLF7AsffjX6FwIlVDcU','STEAM_0:1:105736964','2018-05-13 10:42:46'),('76561198644320105_uNYkjxLYVckco9cx2gxEicY8B3yQpCpFh8BqnpSmfziSE7Qquv8waAF3y3B0VoHM2YW6WO3QhVYIVwuvKwCo40PS3HkDsgitJgc2','STEAM_0:1:342027188','2018-05-02 13:55:32'),('76561197964568402_Ywz7n7v95KIiV0CpKo1QH4Ar6LdGnZYYX0S2OvfpexuOoedBSt0P1tEYz0iozOtHbWMyOJ8eH9JIffQezZl3nC4PweGR74sdNtay','STEAM_0:0:2151337','2018-05-19 16:31:59'),('76561198324316142_5IMO4201YWoYzIgIxHMh4ZdcgINGw2afzCZLxM7a7mAxQAb6HYLeHPPtFZi5vIsBRxgxYMHigUKK8LaMsMVmPAcYOahqFeWoMKdn','STEAM_0:0:182025207','2018-05-06 13:30:42'),('76561198823813028_p3lKVucPw36LaEBbrGFZSCY3pEim5kv5ety8tUHNwLVGyoWNn84nLqz10Zx4a74S9H3HUKFaSGAnM4jpIbkWc3Ld5pnOkwg8Yp4L','STEAM_0:0:431773650','2018-05-11 15:51:31'),('76561197964568402_Q5i64D07SgiuqQFFg7NvhNFJpzWSD6cQlH4ZlUpYBu08gi5z5wY54KvkswwdD2gL9mOowORfxoWtc3nJLsW01pRHpVVQDH916K3s','STEAM_0:0:2151337','2018-05-19 17:34:15'),('76561198091589593_62zu9YcUpjvuVFNtDNR80YKEKPuAv9Ho3qfaEf6YYFPuCydn9cLH8LkouZx0E8Fa0JvOu5JDFYNu4RcBKg335hpXlhcoUF4sMYzY','STEAM_0:1:65661932','2018-05-03 16:22:20'),('76561198383633813_mAB562Kpd5MBBaBNfbmX6rq9zAErUdU1nLGsdWotsAVjQRiXYojvRjkVCc0EMp2dyYJFqFYF7MWBxuvcWPdwxINoXC0KK9m9iYvZ','STEAM_0:1:211684042','2018-05-20 07:02:13'),('76561198071565268_AwsCuSfxwgYlbBnfx0NUxtCeWRZX3Nkr2fvBB22YrJb3J68pEWBzfElHM4QcIUvFReu7SoPMfQ4NZONH50ueGBWiyn1pGIbyU9xA','STEAM_0:0:55649770','2018-04-24 20:54:59'),('76561198191607726_DGLydQIQ3G3O3u36MGFh3Ser5pRY2mRHm455NebgYhjYsBptAAEYIF6yir5H001LQPZpe1KRLxKh3mh0RYt05j77pczD1EW0pRLb','STEAM_0:0:115670999','2018-04-21 17:00:27'),('76561198084534026_DFWLMEAFzjYYWRK8YAXBm70R2tGhEPufcMXvZlG5SK3rMhcEkh95Vr9fBDdv4wm6qUA7hSvAkvoX3VPWosaCrwcS2N6ORUQYavju','STEAM_0:0:62134149','2018-04-20 18:14:48'),('76561198330558831_rSwmM0jv3glkq8q12hQLRrMthEeojtiP9J9rrBRnO3EMlYZvG4wRFt0FyCwJy45PSBg9aW7Mv3v2wFaxli3WqsbJWWzLCuqkKuNB','STEAM_0:1:185146551','2018-04-30 09:07:25'),('76561198078473531_27ZGnU7qhzg9bx3BqU5WkLU4tHWS1XWpYfrD2rGFD6sY7rWcDvFt0A3NYjZxYgNwj1WCALGV79I0gmdjIODKbc2fvQ3P8ek9d16r','STEAM_0:1:59103901','2018-04-25 20:53:21'),('76561198122546289_iPeLabLxeyhCXW8UMst8O0nCtjlOMYGoevrYYUC7AFEBCD5zvt1zCDnGok7YoeYIKXaVv4HXDRoNuJFg0bx5tRJi0X1t4RY2fYEs','STEAM_0:1:81140280','2018-05-12 23:00:15'),('76561198829814934_eJpyOem9WKJw5N8RM4RoGtZEwMdPYqWycYNhKEEogfzhJtYeCuFtYAnwjzgZ3gEldxHJ7hqDEFqrBEKXBYhkEqnOKAvjbhdSj20J','STEAM_0:0:434774603','2018-05-02 16:09:17'),('76561198170997075_erheE2hnvXYXAVjWetM8tprAFiosX3mxb566ydrBVaJhxYGhRbHkqr2ZoePrwcmfYB5vbxG4RcbQc2NFcBeLYZy73LSLvuwMPa7D','STEAM_0:1:105365673','2018-05-19 16:10:33'),('76561198080792346_aBuxSVU0d3HEv3saDbdBXaDLHDjImC56yvDgDBa07t8MlNeaWUoCD33eybUbgmup41w2Ib65ksb3rEKUnNqKWyk3DS1tYMskLg6v','STEAM_0:0:60263309','2018-05-09 14:52:00'),('76561198119527608_RAC9MCVEZ1rQaZiMZICRirORIAegL9x0QC50VYLCSnNQZPNwyp7JzIoBJdYLSqpPjhUQrDOzJn09hoA9xdNxNZQjI5CUZEkFqsy3','STEAM_0:0:79630940','2018-05-13 11:33:15'),('76561198081454291_tLQcnmZlRUhbU3CZY9vwGVl2BI3ZuVl7UUmgPAFqYGYrvmiYVXrP7MqOce6YDL7MHVnwwsyMG1RvN09sRWbPn1voPYdYpKNiy9DY','STEAM_0:1:60594281','2018-04-25 17:07:04'),('76561198322787836_JNDqZSQGL71aibxSepbGs4FOijMbrG2kzesAO4UFX8NgE8Mg2hFgeyHod1rAsNcaV7L3PSgqjbgxhptjHCQsxnIlWOGBXvasnpqq','STEAM_0:0:181261054','2018-05-11 16:02:33'),('76561198175643510_4qV78cUEmx6gsm06DGq4y8dNLGZAvLhHfLadYYsz7yKNGm8uPnKeurHgLS5iPOnRcblhXBIJydAFlOfQK7d4EZLqArgNv7wt2rUm','STEAM_0:0:107688891','2018-04-25 17:59:53'),('76561198170997115_DmBUAB8nVfNlKWdIdkjRyyAMdK4BO3vYVimrcBqjjvB7l3HebYOfMNagI7deR1V8KHHBRhMIWSFIgZ28CPuWy8NK3oBsU6r5V0dV','STEAM_0:1:105365693','2018-04-25 17:45:58'),('76561198165349802_UaLueWQ76jkeats2UKZe9UHjhzUGxGXJusNd5Gf9G2FdYOyyAOx8r1CzQS6NkKDFVqr478YR1BdNokBqhdRn8qewDCpYQOQaxrDG','STEAM_0:0:102542037','2018-04-28 22:01:21'),('76561198241040896_bBjZAKc5NVRboYIVIqcBWvrhEkmo1hWbBiJPaG1BDASt5vwbUj43iaxcUUf99vDCAukjD7LPRxFGndNb6xRLCyxScpZMrb6gB61q','STEAM_0:0:140387584','2018-05-12 11:37:05'),('76561198194015777_GAg2irFJxamnDKVrB1EFGWv98m3KzeBzjnfIpCmQRsufKoxk5sIJhwDF1KYorYtumiepOxds3lMFWoo8YZsceOlUOrQtBMEapZzz','STEAM_0:1:116875024','2018-05-01 22:24:21'),('76561198374622891_OGeynkaP3N74hLXexa4qDBNn9cAeEAEbOILJB70BXBh2LV4wGr20YAvaIqqOdo7ndbR7Gz5tURYbrdoGeDDzlYlZyJELrrSsvYrR','STEAM_0:1:207178581','2018-05-16 12:33:35'),('76561198289855163_o5jgn2trlbD8ZiO6L5gg80kxXDHUVzYwoPYNxbtOHPYG3lpwkhNYufoAJXbMalyiFmku7CYhG1I2ARswpUOpK1qzw7KY1MHjqyk5','STEAM_0:1:164794717','2018-04-30 09:28:42'),('76561198138543706_cPI3lnQ5xPHwqxuQRDOF8VDhnsr29OH5RpyiYYb29Uuo4NzOWNZjW4bzzmxlIDM7VO74VUcGKWgSPh4iCPbdU2RN3m51aWkeytGs','STEAM_0:0:89138989','2018-04-24 15:37:33'),('76561198313624304_1jj1H1CdetHEHQE1lIAHCQ4IVqiGpiC4RYypm9Zf86FnB76oglWkZ7DNYMIYk27m1avE6l7NV2jZSIh1CHC0oiMEQxfYJCPaleSn','STEAM_0:0:176679288','2018-04-27 10:02:55'),('76561198190751214_UOvYBCijNGveQz6awhPvEMtrJyoYKo5WrzMo3ejJER1gmjkznYm9EtnCLI8QY1KWYqOYySRCXlfCdUczK7hIBLH9asard4ynVh2u','STEAM_0:0:115242743','2018-05-17 17:44:00'),('76561198062259401_8VnSXOazozbliOUmgtRugY7SdcA8G0Bml9n4PYHBQVa5dMd7CZZW3nNaAwuE7lmurORWm1zaMc1GgmPqOzzatyWg0rG0zN5t2VGY','STEAM_0:1:50996836','2018-05-06 20:18:59'),('76561198122546289_djuJ1bQnUBb9Sh4C2zWAoxGKktbKIwdF0pYNKCDN9ZkexIxFUVWipn2J3vf8XtRLbWVR56ybXGCb5fWqrkmgdYHtrUQiYMS9uPCu','STEAM_0:1:81140280','2018-05-11 17:45:05'),('76561198078750999_YdM4g4cXqbkLdOAI34H7oY1buwel1XctWM6MlreY3bZfw35uU9XlgoC1amkLy5pjIKAKy5E9oHkvIoWAU9o4kIQnFYSZO18kLswL','STEAM_0:1:59242635','2018-05-20 11:17:46'),('76561198157438907_efIRfc1vHHZJdyCNkJw9U9LoQr78erMA8cGhCARwsIuBXzq4Jk5geYrP9QjyoBsuEBfXXN4etVIhYtD1BiWzpbbEmb0XYLfUEwK1','STEAM_0:1:98586589','2018-04-29 15:30:20'),('76561198053247828_Nb3FAWAMtntEvoPq0AAHYXiY3juVvfYevM5YisRl3ByA9rR3iM4WlXCEmcyCoYZHFb0RO16KKm0003LJQNhWhWuvM9jyzMV9UM1d','STEAM_0:0:46491050','2018-04-29 17:25:36'),('76561198121036466_S498anw0XGvf1iLi1Kk0D6tRLNx7fDOmg7lpGtX6jHcl6gSrnBzmbMEoSYZIHbB0EFRWZ9tmlyQBONAj37cJOC14IgXgBfz8QhQ2','STEAM_0:0:80385369','2018-04-27 20:55:44'),('76561198039825003_l0QFiD7tYGXPraBJcMrYAFx8sxB8rxWDLkkiyKUSomJKc0U3MgSxJZdn6apwYNDg56ZK1yDorsLrsOr5Sq7s1D8AcGqNtYiEix9k','STEAM_0:1:39779637','2018-05-04 02:37:02'),('76561198257768495_YWF5Kf3tQOYNn0A0HHPtPoqvxyyLijA4CmSKcIZ56YaaUf3XkEEFDV6umpdRYeghw3Oi781rGFg9Js6XOjccdZVkWVKHDHveR3Uj','STEAM_0:1:148751383','2018-05-08 16:40:37'),('76561198070361441_fW3W5IIy9cJwtBC2sozysS42GVhYWiznkwyePCi4PDXHUZZ8ZRVa8r4VR9dN2pJ4cVZq3BJYHAYVYK6FN4JXplZ1jJwAFEGQ8a2U','STEAM_0:1:55047856','2018-05-08 15:01:41'),('76561198406928816_rfDzEXM3aiDiQcpa29bHYJfobdzkMVBiOlK4aFN2VqGKK5IA8XP8LEyDV5Whs1CPoXXLJ41sk22UgYoiDkx9iCYzHlZd0AV5a45v','STEAM_0:0:223331544','2018-05-14 17:20:02'),('76561198131823181_OYvBF8A9gRadGHN0SL8qJardSi8VB6CqBhYbSwANvBoc1se9truMNalgxDPG99yQjsEaVDyQDfptf0NzRGho6wV6HPfsr3oVKJFe','STEAM_0:1:85778726','2018-04-24 19:32:00'),('76561198245748756_7SuuGYJ4t5Eejji5dYkXaI7UmMjY4EhRxoKDEbF2grdLrXve7J7nwvAK7Axyl24k5qyCM4ZS5EW97dXfeVY0J6LA2EmDwxgoyomH','STEAM_0:0:142741514','2018-04-23 11:25:38'),('76561198313216837_YjkJsA5hx0spO6OwfuBEnCY8py8ii0Fd1MD5ZRUGU7o1c9RzvIxaPjplCBfVZjsiPY5Imr1qYHWLaDBliLoRps7xG3M7jE0xH3PL','STEAM_0:1:176475554','2018-04-27 15:39:53'),('76561198171497631_bkHOrXtiJa3rEr39j71CMGbtJoxguHgYL5IYnSAfMyPYP0PVWNRQHUdzH8jayCM5cObwDYl36lIkbGVR65V7cFOCZy5RYJhbnlrd','STEAM_0:1:105615951','2018-05-12 05:59:55'),('76561198154656941_jl4yzYrHSiPu2iwU4MagdqPLQc5K4lYYhDrJwY4etkWzleH44hyEtJB5fNcxZgJNdkFCFab8GPpH03BKLAmgr5qFlf6R68GzeCYs','STEAM_0:1:97195606','2018-04-22 10:28:23'),('76561198166904872_bKSqpyW8Y2eGmS1igabeEJwSsvbdFJpDpJZSZ3Odsucz3f3Q7VVby2lYgXv6eKHRnPPOJB1ow7qxaMajMVqUfunL7w4h1C00s9NB','STEAM_0:0:103319572','2018-05-18 18:14:25'),('76561198322297892_UH888Dpujc8hVEVLWfhSkjJXjPnR13n3FK6MA52bGk6bReqhRS7IEQcRBCUxU4ifWZWdWljkzNnI12G53YhtUgOl4veiIQ3rh7GW','STEAM_0:0:181016082','2018-04-25 17:41:56'),('76561198322787836_4QRbYLnbaofqCSPGCEjqcRz7AQoh6YSVsuAkUBqHmxPcnzmD13sZNltADXpgiS4W2lgu66H8Ikb9NRFJjJw1mRrxKFcJIHaFQ1WB','STEAM_0:0:181261054','2018-05-09 18:41:15'),('76561198045517793_kgzlUW5YlYkkGbnQ7dwSu6Sd1ogB5ZgS08aCr4hxUeFsPZGHRblzYfmMMmmP49UNh9yM7u8rdBO6XbhPXFv0ccgIwGApY0GYuae1','STEAM_0:1:42626032','2018-04-30 08:49:20'),('76561198146459977_iOp5Ib2YpCgzQYzA6JYEnGdKsIEPfWtod4LYMYfiV8LMXawRiuayKxpyosX8JBmVKgxNLozZfCpPvytAblRILem61QUVaGDPtjEv','STEAM_0:1:93097124','2018-05-18 15:54:47'),('76561198214371493_c1XZL6Ff3N0lcgFY6RoW5SzmPU9cA0E5ZZuQSdpEDGMhNq3RnSXC4VKkUYJ3APpJUW22UZfqiFl7uhc1ayUnIxi1DqBPlvWVOcVj','STEAM_0:1:127052882','2018-04-20 21:43:12'),('76561198217516220_qEFBhLM1yGg6q7axOFfhb37sf7QL2cxkUnKGbtFKI0FZorg2DqkI30kLuNEoBSqd3q2dkpRkgbzoUwmr9OH28ORv53RUuOSiX0in','STEAM_0:0:128625246','2018-05-19 17:43:02'),('76561198072198824_NCBkyst38ayC5D4j0vltYb2wreIBWzrUbQmIJU4xSdVLu684hQnrgdcrynEZfsSecdcNDBWZuZuWDvxfsaWskX6PXliQYOzYBHc2','STEAM_0:0:55966548','2018-05-17 01:38:35'),('76561198821797626_00aHGXN5stZ4y015HkeezitoSszsbvxMCCOHF7HdPa6JK11P1XyaVAh231cRfpejiDiYKHebIUxPZqk68r0YLafmx66bwQAIJipf','STEAM_0:0:430765949','2018-04-22 14:15:57'),('76561198169464296_93XUQNtiHx01wH3cOkIvA06a6CrhkA8aGQNPB4YgWxY9pWf8U8mRh1WOnUbv4E8cYkIyASmthQDSrdhwLkkkPr9jF5YcuFzQh5Pn','STEAM_0:0:104599284','2018-05-05 17:16:24'),('76561198296858547_szUiMcbpJCKuwttYF9iuG0VEXfAkLNChUv7joYwDpGdeaDaHWrwxF7quNnOg2xgZLEOHzaOxjwUYUCPHrQwJRFnji20WOdUWemSG','STEAM_0:1:168296409','2018-05-20 13:03:40'),('76561198110223596_5DGWcJWuCYYnXtq49aLqsqgx6kd6SuGY7sV0vP7FhxkOftmD968RaurbncSUOf47bDJVL1m2AtYI4YQpe8gnhCO42FM3pzM8a8lg','STEAM_0:0:74978934','2018-05-11 20:38:51'),('76561198110223596_IGqjuFqDLcKjniJOFcXZXeE3w5cpC32W9BCBLgeYoLEv7Z7L6XjHkCnv52HYpG1fCpXWAZ4ARPWPLmFzO1nBtraCpD3Ua0V39jHy','STEAM_0:0:74978934','2018-05-11 20:41:14'),('76561198277944305_XOA55twzMGruzwfmMsCgrh95fEZ2vVPXRfPbAI4UIztrAlpI451utP9XKhguhOYYqPVcgrBP1sVSwoEPP81pEPGlXZZxGhwHvizd','STEAM_0:1:158839288','2018-05-18 06:10:10'),('76561198341796515_aDvSL8W2EcUmmM9xvXIglbhlaRKyikw3VC1vOtblO95F3hHReFORwulS0XVMp73EJpLAMFtOYia1ZWQQ1ElHzrxJbAo58DFgfMGo','STEAM_0:1:190765393','2018-04-22 10:59:16'),('76561198132015136_bUIdGYVgqwtfYPdlXdNhFwW3GA5Hx7SngiB3D1l7aXpPqvuyJkvpfUYdmVYBMnr7bs4Cxzw8hXnq8rM6rmry65YNYbVzL9Zu33Z2','STEAM_0:0:85874704','2018-05-01 15:44:48'),('76561198047716993_qnY9OOcRAFyyvv3GO9ndpCAZgwJzFMcNpQ7aCqyCxLBqJ84anZJJmGctqgx1WQ7JAV1IYurrVMC0CGxLYbEkgD4pWlY3tnRPo2LC','STEAM_0:1:43725632','2018-05-02 12:13:00'),('76561198808240135_sQt6phiEQ3wfR4I8XKWjfZEQ2u6l4SOLY0Lkt98oXBgcSGtih5FHQaR71oVo59LjikIuP2CEBwXNmtVK0oLbXX9vUYgZZnYRfoXk','STEAM_0:1:423987203','2018-04-24 18:34:52'),('76561198440742442_m9UBN54gdYvPDNOlZC4XfwrkowYHR0ZN7nmmBjzNlFaxt6EaWYYeoqPx6tyQYoUzQMd0DRGxxWVzWuAHR6u8MDu3bCqwC2JzSKQQ','STEAM_0:0:240238357','2018-04-29 10:45:52'),('76561198320285737_4IU6NJNqdwIJs18RHRZd06L8h1zBouelU6HgQIWzG4uYCHDPP9EjBmylXAC7jPp7pxYKRbczKZ4HnELZH4NXdWCA9iQDBxKFZoVM','STEAM_0:1:180010004','2018-04-28 08:33:50'),('76561198273940224_UkKVitywVmmvspSltjjQKpZYBe7Nsj1j6GhNJOhimF9ot6YAOy6WRIqfp4AchntJ5k8S2K3FXCfYFtCDGubdGB50bb1rJVYelRiY','STEAM_0:0:156837248','2018-05-20 13:37:59'),('76561198198294413_FMkSu2NDcRSkaUb1k50Mfhl6XfucWrWdRV7XDoAWbn3p3mpjPQXHSP30jLJwhvbCvjNACzYxuSp3mbNYJD57KV1iclUbk0FYIien','STEAM_0:1:119014342','2018-04-30 14:24:12'),('76561198226628004_iqfQgMwYdpV0F5PE56pkfUMB8fB5izNqrYjAggMMmdLkBjYE1aXJ46jd72C6bYsRG4dOl18fxd7xyvKLIGQwv2UdSWL0JuEx7INi','STEAM_0:0:133181138','2018-05-06 03:37:30'),('76561198397959030_7YHqf3j5VQO7YOfsVesvlzkLiYLpmgJFM3i8araCfHZ2xLYYnGr4APEP81UoYNecEE7axESGhWOccyVx5jA667K3Kwhze6vy6Vy4','STEAM_0:0:218846651','2018-04-25 14:56:30'),('76561198090313787_2N3MP55bQF7qB6p7dB3FtYjPtkk65oQtW8AWEaKAY6fLHQ6sdDbhZyNdcDb03774n6ynmqP4KPyGfemCAy98nZlNIPWDOezgAmx7','STEAM_0:1:65024029','2018-05-19 09:28:00'),('76561198241447382_jO15fbRc4sbeav6DUllitJOpuPZfGp6agvkdKszlONaEEEqWLxYj5ERr6MzDm0hswHu6jpvd0CsYcfuz4jJoZg8tRymPLBrGkeB7','STEAM_0:0:140590827','2018-04-29 14:08:45'),('76561198241447382_BMuP3GyUkBXP1eKEIj1e5wwnMldnWgqvkCnQnd1P9jvy9Vek1DdHW7fcE2rxEOZh4dA7H9U9QHD02bDcJGyxN0efueXzLLAagZAG','STEAM_0:0:140590827','2018-04-29 14:08:55'),('76561198191015269_Z3YS0VGVAut9ry7YPN9c2lgwCnBwqpXC2akY9VAiNVdmY5lYgPcfeQEusc7E7S4lzvGqdzonxjQkYc9Wz1HGJqD0M4FZMZlLlH9U','STEAM_0:1:115374770','2018-04-30 09:32:18'),('76561198138874276_HyP2aUonAbYjnMW9kiIcdLuHDU963knWgexH9SI3wD91jX4Y3USH4IM81SjeFc9Sut9s3OcACi2NQVdY7mD2dxyxOcDal1p2DcP8','STEAM_0:0:89304274','2018-04-29 22:46:44'),('76561198273601436_AysgFi48B6lrHYe53X7paYNC4Y0bi0cyAQ4IOA238QUiueEW1wwGEYhrW0rpoPKBqF5CiPd3mBblYFPO3xiuR2vUs5i1Gs9egGPk','STEAM_0:0:156667854','2018-05-11 16:19:32'),('76561198183805119_L71EiigyQdLFig8XRmJJt2huscQbdSXlpA4yWr73AcXmF9mA2R2djiANqM6SZ9tqwnzeCZ8RFOSFlzhUH2LmnY8679bZOEO2RZCj','STEAM_0:1:111769695','2018-05-06 15:28:58'),('76561198181634882_b795wfRhe1KD3dQvBLRZaMphot6q9AF5GLRY8isWgb4asKKHeMR2LQPqyrSfFHo2lYiMhcE3G2xLY5i397YgbrBJ2EgoXawtReVO','STEAM_0:0:110684577','2018-05-18 08:42:54'),('76561198170997075_CBZeDG79Zb97DreEHo45gF8xCr5zmghxJRJcr9FdFtheanPuH5dVNYxCA8iS5XSodSQjkMpbNCERfLAGOr2v5ZywCn5JZXVYFSpP','STEAM_0:1:105365673','2018-04-28 17:32:06'),('76561198189542711_q3FbFwXFE8M02x60gSkk0R1I07nGZ8BvNHAUImmdJdp2klPkf28P9aA0GPlMj1Mh9wsKpZwVIq6LhQvIIdiLcfkLF5GOtF8RQyRp','STEAM_0:1:114638491','2018-05-17 09:42:19'),('76561198268163706_ZtICOJDMsnpAvFgNgeF2q6VRcedP4lrSm5apUHtaIhA09cH1XXP0GN1MUz9b1HPNmXjSt8hdIKGJ2JYiDnFx9OJU3Zhz9uuzNDQA','STEAM_0:0:153948989','2018-04-21 11:10:26'),('76561198083495544_vgB7zkssvPt0U40rYu3fN927G5Q4bRt6fc4iRipg1c9Yzn4SnBc71Eb89D8Yoh8K1G2jkdx4cOhXHjVqulLUICHOKwy9Vp3EP4kq','STEAM_0:0:61614908','2018-05-17 08:04:38'),('76561198322787836_GFWmax0GuBLuljRyteln9J6EQ263jO910VcnyBlu0dR3R8Y4rfN0cU1EI8GiOhISbY2V4GW2QthVg81pjCSkoYyCuuQ9dmKXohk2','STEAM_0:0:181261054','2018-05-11 20:43:48'),('76561198804164151_5I7K2I3lx5rhA0cbXYofx7YqcHhn1BBJChe78i9VcBd3YY5Kn3pjp841DFB1vRAXuYND8av72YLdPBr76GMBYzYkkKbYByNUmFQw','STEAM_0:1:421949211','2018-05-12 06:37:15'),('76561198158094946_3zWSZSIS7dtlmz0EYHyZij4e82b3M4D5KMG08YpfkBjaHposEfB0U7vbG6XpYVcDhKdgsFHiYkmUn6Xadsx6gVaFB8bJFip4yhrM','STEAM_0:0:98914609','2018-04-24 19:54:02'),('76561198117372217_xHjJaqcEnZMGz82YKxpwFF5VOmcEDjO35wJr1ip0QfH3jKdFQ4UUn1kkpCF3jICwLqcletp6N6Bh2uS3Cs8OLQGdgmUNGP1H2SG8','STEAM_0:1:78553244','2018-05-09 22:24:12'),('76561198136282572_Pp1PwkA0nbqEZwS4QI7tOaj3dEiGByYYxysZOjchUfyIPGyyE6sLeX5iloPdgyUIUupXl4w0l0OtL4odq1QGIPbrx5XtxVCzjKzh','STEAM_0:0:88008422','2018-05-17 20:25:56'),('76561198369602528_mktAnDAhvMw4OrxG7yqyxfF5UwWGWB6nbKXhSa8RpPhODI8FUuup9eINYMgtfiaGHr9iI7ElyeddDb9ISslANvGQpJK9Zmwc67aW','STEAM_0:0:204668400','2018-05-19 20:10:43'),('76561198157249989_qzzPNN560MbcV9v3o0xeaf5P2tsnKLoU5iWoypSp3uUdh7GUvnRO00DfQ0uMsaCKsiJAMJ0JaB8YPzXS3Pj6W5nmC7JiKhvbfhUa','STEAM_0:1:98492130','2018-04-21 11:40:23'),('76561198120237757_v3cHucAplmbDZNNISLqhHbojN6Y3xrjYpJ3KQljmMmpxDZ4KgYGRmlat5HSlxo9BVDvBAH7Q43resczXqhQDdjoLBKuBYMhU1RMG','STEAM_0:1:79986014','2018-05-09 23:33:39'),('76561198094423618_2VzoSpRpEhy09x3NMfsJRYSJpE5U0XCXAQSWf8kcGwa0MY0YrS4g97jxmcZYy0YDa5XBsYD6v8Gg6sGd37M9IbfyX1LPvW4P3bPc','STEAM_0:0:67078945','2018-05-12 18:13:23'),('76561198322297892_EtwZjmZOLp8Greavm1PCuVgCGHyUDqxG7rYUsbnZxwgQVXjKoQCn9wHp6ZzVpGN9UW4ODWQfU3yUaCUInB1VKMavcYnqEnOsAFWu','STEAM_0:0:181016082','2018-04-22 08:23:40'),('76561197963592540_Qu398DQQt0PHYZME6iahHPxwiIJcvUc09VBt6a0117JwtGRKFhnVxYeDwXd2Od8J1j61eo0cC6CrPyfDmPemRrOwOP4WsYz4Szc9','STEAM_0:0:1663406','2018-04-20 15:33:40'),('76561198259684638_Lbrdw2uF6pBmQKrGgJmE4osdWg8uKqPIYuFpky096zd6U4s7x2BeKHt5RAj5FbQDhaskVfYHd4uIfZn74qwZJtdfl14cNLqoBPn9','STEAM_0:0:149709455','2018-05-17 10:58:24'),('76561197997006205_iuHp6obBo2XHUlw0dSGCyNCz97gkJ6anlIJvur99hGc1LM3DxUStZBJ1kGjY3PxYHqUBGNbYsMoRZ31jhk3rWrAagelkBoOtkbNK','STEAM_0:1:18370238','2018-04-29 17:43:31'),('76561198375379030_8MzVbNuHEENnxpYhFPFqLxHXMSoy0PRydhwY5ptIjWVEumdYCEUQxYYjzAYYYYuSvdrsId9YLcUkuZ10bwaElmaK3nAb0QWAyWFs','STEAM_0:0:207556651','2018-04-30 14:13:50'),('76561198236248202_9x0R2yM9NJk7fzj3ZYr3UNHKaWgAsVkG6RnQhf6aPYu5GzJYnYtVkpK8gI6VgSLwr9YkYY0lSgFxxsR2KH9w0zD19acauPGkQ5NL','STEAM_0:0:137991237','2018-04-20 16:41:22'),('76561198054757964_9CeD9w4xMACtDQphWt3Mi7E8JLqSlNnzPIbU9QwFd2Pm4GWskorMIQvC2qu63YdZegqfU4MImd8oc3kaJKhLokuK3oLW8lyS8cAL','STEAM_0:0:47246118','2018-04-29 05:50:58'),('76561197996413780_VEy7cYpMrR7U3dmhUGG6kjA40WsUuyy6dIt4U9QyFuBLkF2YSIH7vBrIjlYEmOPpetffklUOl6kd7EW2uGUbw5JPmfXddcjRfJsD','STEAM_0:0:18074026','2018-05-05 14:52:11'),('76561198262218559_3gDu9J548sO8h9xY9KGRFhbZMgdlHwN5tZEWejF7SmgQVJWpS1jJwr5uhsYGfgGW2DfokzWY93x24orbt7PGRp5DudzODxWxcHYO','STEAM_0:1:150976415','2018-05-05 12:11:35'),('76561198275043922_59NPiFc6Fn3AQ1bH6nJoUW9BjsPvbdB0SlWM4YFx1iufcVdti6boGYYFKf3tJniwHuUD1iohYF9MBS3hsXUEXtFwUl5J9mqw4qS0','STEAM_0:0:157389097','2018-05-07 15:26:12'),('76561198171497631_0kDnFylPI4ZvR2s7plcwxioGVELEiChDo8C08Sj8YenhNoFvsqI0XvIN8GWyMoZobi2ICrLkRP68v7wULrgBpynLE2meO284rEGA','STEAM_0:1:105615951','2018-05-11 16:34:08'),('76561198165668583_Ext3G4XxOxr0pYoC08MSmjV61JVx62HkS0QA5oCL3l852cO4W5AQFez22AUiotonbUAePV85g3BnwPrCDP1YJt1828xujBbXXKcm','STEAM_0:1:102701427','2018-04-30 08:00:37'),('76561198823124560_qfz9eGJ6ofqng0sQlYj4orhU4UYRlHdaV6X2SbYK2zNo7FGICPwPv1AsVooAyAdYnQ0OGCqd1rY60n6veA7j1YyXahe6lU4nGxQx','STEAM_0:0:431429416','2018-04-23 14:32:30'),('76561198211300076_UVL4mYSEc429840eMtrxBuqStatkx9UgEvRWopFqXqppay9D1eNfagVEaWYlNYKP6h40ACHmj7olu9Rh8cDqS3BB2JyDnWKzY1Co','STEAM_0:0:125517174','2018-05-20 11:42:54'),('76561198302980903_OmHlZ5UWgvwnxjYcWc13DSjSeVUCl9oOs2Wc09HzfyzY06h3G834UhtDbinsJdU8BVFlRqdWwAlDriiVwCpibjZAebPnFf30lnDw','STEAM_0:1:171357587','2018-04-30 11:09:06'),('76561198090313787_hU9vDo0OObkqCUo2w0uoBx8h6DcDCOW6A0DfRDYWjHYCS5v3e8pqLG0LZDeFNlSmxx8z2bqFw4F2DAH91wSJkrQFUB2eMyEryQSM','STEAM_0:1:65024029','2018-05-03 20:00:34'),('76561198368577480_agpCnkvLDB5kKwbaS9LBnsmuNDO1aeE2gJaYdLtXjdOda1VkyBxil3sX519BhhrR2GifXkHrPsVZBe0u8djsC2Pl746yjgPkr0Ez','STEAM_0:0:204155876','2018-05-17 06:49:57'),('76561198233549220_hBJZJxXw9gRQiLMuUBy0MX6zWbQIAzQoQnoMkl7h7wjaCQ7fZHFbSiPrsmp6kOA2LGv2zZtWXdWy0ebjL5nWh9swN0whBRyKQGLy','STEAM_0:0:136641746','2018-05-18 12:11:27'),('76561198420621850_LbJFPftPza1XM7UIxJGvGIoBi1QVkmQCCxrNARHvOel7jLzR1qXEJ7iYDb8zjMBkm9x4G4FAudLa3PqrF4zatFJEl8i4wM1608Yc','STEAM_0:0:230178061','2018-05-02 20:28:49'),('76561198138874276_t1YBg9B9EFX29df1dkYPzhkVXeqLqnG89GDB7QpSN30SiLYg0YMNdJaFYgpxf9bYlWBrLX8VV46cV5jRCICAEb8ecvIY8BBDhYvl','STEAM_0:0:89304274','2018-05-07 20:29:45'),('76561198326365555_zGFE5HIKmIHwnHIVP5dWZXbMztuzqdML0Dtu0aa94k2dItDUMHnsQZ2HYn92yJz5IeiQivyyqiqXHdkMM3vSJsZOwSauNsdozyOX','STEAM_0:1:183049913','2018-05-05 17:05:14'),('76561198831114096_2Y6YceKJGAxrZrq9XJFR5GYlf8PdmYUXZlWxgeXuHiYBk70rHrbyIEYdI1BKN5Zd6S7p7Kl2FrsfHUJEMF2L4RwcYeraGFqXwuBq','STEAM_0:0:435424184','2018-04-21 06:32:29'),('76561198167671817_Mc3GOgny34pqVpOp5NhaECKFy9hkO4W5ShaRY3dFnaiGzIGZHpkRwh0UxYPMCwnsVKN9v0pZsa4L2fJpF8qtgX3vVcy5dKLilmDi','STEAM_0:1:103703044','2018-05-18 21:40:23'),('76561198381044280_YupHEb6z5XUmuQOrxs99eAoCiIaPcuqLIifOnFXM3bvRAYA0MfJKDiqQUOPLqS3dZ4kY1i1Yc4Yilu6vY2nY8wQqSAybwysCQq2O','STEAM_0:0:210389276','2018-05-09 09:39:16'),('76561198346435176_u8gmOCO11B1vodooYK4ZIqIdjKeIVHh4QcANkWPybDppPLF4eJrfqLRRb2FI5cY3n3uPzAV1FR8yYnk2MJF5RllWh941Eq0P4YWd','STEAM_0:0:193084724','2018-04-26 20:41:40'),('76561198227271384_I0xzz5L2AnMLL9KcE9RY0GCcnUYpXHXfUwCI9Eml34C0KGCrRUmIHYyzGkRciMS5fzDYe8E4xSzLk81GimakCIYj441Mj0xUCmhl','STEAM_0:0:133502828','2018-04-23 17:25:19'),('76561198239467358_aVmRaGQF5uYvwivrrkQE6ZfKGJOnYj9cymajlPnor5MJNbam2PznDNGec7zkFCrDGYfRebecK5jIgFYEAqLfieicgGBoc0Dw03Md','STEAM_0:0:139600815','2018-05-20 00:10:23'),('76561198181233165_jC6yI4L9UN3Dosrm9KrX35Gj6HsJ50zGsyzVWanyfoVQVXfvdLxggpYjAywyHsBgu7kM0J2W2gByXiJe4E2g47IXBLG1AAZAgv2w','STEAM_0:1:110483718','2018-05-20 07:24:23'),('76561198132015136_rK0Ywi8iezh22cnvXl05Q2Ps9ZJLNEsGFOzkXBM7GV2ZaZB0FsANKg0MfYzDgrgv9xbg6PSqvivRuftKWv64RE5PJEC3m2GnV72y','STEAM_0:0:85874704','2018-04-30 14:44:49'),('76561198117263716_8aefcVqWYEJNcNEPVSn9uo2cUVrRbneimIsfFb9m3sajUC83lX3DLOGh3hbYwwAudmh0LDX186PwPYwFSbqqyOI39zqY8QwAeviL','STEAM_0:0:78498994','2018-05-16 17:44:19'),('76561198321509613_R3Pam8J2CF5vFvKp54sLMWdyrQi2rqj28LbSVt4GHDGga34epo15pawfYOrJa8DPMlA2tvRwhOQr98S1nKJ146jPkAOYE2qqKVtS','STEAM_0:1:180621942','2018-04-28 19:51:40'),('76561198085061366_hnK0AKSxWvGE6zXom25Lyj6luy7fYcbiqNfVjwd1Y2qArKuAPZmxSMGFNDDgHxbmOsJuewo9xbsV6YxGccJwZf4NWU4G6yuNdpWN','STEAM_0:0:62397819','2018-05-20 11:50:17'),('76561198170997115_Os4l2MPUlOPyPm1nhseN2YmFRC01yfyeldKlt4C9rDLNt31VzX5p1X6hFhpz64MOW4Rkrtn7N8AeRtd28YEbqb8vPyMR7qI7cxfF','STEAM_0:1:105365693','2018-04-25 17:41:50'),('76561198075046818_1WPiH12WOqejYK0Y5KVU73yaFuuzsUOcCZvJdo5tfARIG4zzMJS3KVozzEWURfiURmYNqofBMVN0ZxsnzDC6U18erx7aKYVmuIOr','STEAM_0:0:57390545','2018-04-24 08:53:51'),('76561198305792091_Ag5HdWIFHZf8m5uWllrYVLgN3UWqZ49LBCIUDrKOIX5qtYsOArtXQM1rZA6XUHWb3nQbUFLUUi6x1sb8KCIvGxZu3mackeooWCkg','STEAM_0:1:172763181','2018-05-20 08:25:46'),('76561198329479710_WY3fPF10KQpnaN4cBRfunl9EQR3P7pupQXBpNdRPoXXhMldNyctQlhX0RML5jXtDesC2NMdXw3OOyCnPfx8bGkkhCK4S4MQZ17gU','STEAM_0:0:184606991','2018-04-26 17:54:40'),('76561198261497270_YCRs6hjpuQCR4FLnobi4x0SygUpZRcYL9UJXrsXMnAdqvx5cGhzKoQAsdvPMngl2pqShkNsJ3tNCqfhdEbLeOcNDw7Wrr9wv5N0z','STEAM_0:0:150615771','2018-05-15 12:31:08'),('76561198347096779_uA6yZdqaldzWF4YJgty5vm84UcOtB1e9ESeGAMhpIk00NDD8DOGDWNmQXG9yD29Fug4GHOudYs8pvpjBw74KJ5OFVWdD7W3FzLkv','STEAM_0:1:193415525','2018-05-16 14:50:56'),('76561198283703988_eMULdaP7nygfBRkCqKcIFxyMf27IaJJeQHcRGVfO2uqiJCqhjCidCBVJogaMm3zVzR6ZWmwCdKwz9ju2HnIocshvLoImBbIc4dLX','STEAM_0:0:161719130','2018-04-27 15:25:25'),('76561198331368860_Dkl4K1LY9nOQWnHpEXo1LWIFXwaQos2SEceavnK4XaZbHsDco7fdH83F24a2sPeNizSVdoxg6wePezPrRlSqXhgYsreryRh2RIon','STEAM_0:0:185551566','2018-05-20 10:33:11'),('76561198368331871_tKKzbLkPUW6E2cEa0KhDK57VGMQhD2L72RdA9KUXQnpJFXmvRIAd6cSAsOwIuqSeNjw0ibQszdFUHiBDWOAPcbtnIqmWioEDBkrB','STEAM_0:1:204033071','2018-05-03 20:27:20'),('76561198239689426_ejBZlA49JobY4eF6WBxY0HK31HJkV7C4vyqEUivKwNiSXnNZ7CUYIGavpl6YxphR2PI3BbtYfwoXX4ec1lQJQh5M1XsC47MgBg9M','STEAM_0:0:139711849','2018-04-30 22:04:20'),('76561198398679554_lMkL5q9abPe8tVALunkp2Lda33K6u1MhW5imFvih95nY1YCZvGAvBo7HDLCyEsNfBzVApUb8rk1ug73by50XiOP7nnyYrAyfxuhc','STEAM_0:0:219206913','2018-04-28 08:53:09'),('76561198224485076_SLDW09lKOF0ClYjAwNSo3rbAUxYJYbm031BKHJWmt9YCVuNSCLyu0FZ7e8v5CLtmwnVHpVZLSROolpHDqZZzUc2V8B3Shvq80GFR','STEAM_0:0:132109674','2018-05-10 21:18:31'),('76561198273940224_hsDWYrf8nrtQKsUWQhYHZUWicsSdApawJ9cFe0y5VwMNUePYLYtfQcCRcXPFinGAwygrlSrGXxxAGrwoc7L61EDuMXpv4CpEYYWn','STEAM_0:0:156837248','2018-05-20 10:48:51'),('76561198133293919_KPGKHVlzxVd3MeyEPC2lw3yHM6I5ESBWOpFIWr7MLikwzDzzOenf5kYF2whwon5mN17N0z3gIEY4kqCJUpLmFZfG4mrZL4hYH9mE','STEAM_0:1:86514095','2018-05-10 20:51:23'),('76561198397959030_nLsV7YanjtDRYbbAAVlaIsBOJP9LDXRqvcx3hlEVV10XQaYtWb3otBpP6F9vesWjFbKoOlXx8W496FFIb8yJY6Y4khYLUSL0Odd0','STEAM_0:0:218846651','2018-04-22 12:06:17'),('76561198303984082_Xv2uWbKab1yEg4x0lcgekVDBciDZHis6mLefFDD4pItFi8Yzg1c317NfAFZkfNVz46itVJPBEmeK7MvIVdsQB527H2EjxM5SPpmQ','STEAM_0:0:171859177','2018-05-17 15:34:57'),('76561198073598738_8S5mE3uChz1urYA2eWPbn52CwQu4YkcEyM3hi1LWCv00fROKzJuFLwA2SWZaLIWEh9eyOrYWedItJLdfZW4FIvumHxKHPrJbkhRf','STEAM_0:0:56666505','2018-05-07 00:47:46'),('76561198834814603_7xEe4WeJyCBDXbry5BCRMh82fd4BrzvY2fNu6PJ86rRvAufyVAexaPGUhU2PIu6vzXSMBUQYAHJyVw5gLguh5YP3ig4Dvles5cZA','STEAM_0:1:437274437','2018-05-11 16:00:36'),('76561198278883501_whQQPiNAks93h9Pu2Cq7fRpnlx5gDYpgYVt30hEGspxsn1kb5vF7yV0iz2CDpqCJtn5ZAISmEXX0fKIxW3PuEWoA35ZwJrQnXJKv','STEAM_0:1:159308886','2018-05-10 16:36:07'),('76561198379311435_gzQbKw1di1rbA0RUIvbCzvcFi45mjKgQMJ0WVQzbEvyyJmWjyq5bBklCMpLU60SbyoE8K2FLGfrhp1ACmaLHzaYOKEfmOFrdAOuN','STEAM_0:1:209522853','2018-05-18 19:43:27'),('76561198090313787_JHmvq0f4aeJNGh1JW4FvQmzqazvsQ3D3LF2EsFK3IbN7apP5ARtPdlnr9uZt67DN7P6YIVDOyFKX6vGccHruOnpGLEffGlF18Gm7','STEAM_0:1:65024029','2018-05-04 04:57:40'),('76561198118886865_jRlUaYntpNrdIIiY57vkheUOu8n3plmNN4trXmxZXzEl1o8Z44p4mkLMfCJOvnK8fiwCIqbYMQLGHM5K2f3HcyPnCkwnXn2CxtIg','STEAM_0:1:79310568','2018-05-05 10:37:04'),('76561198807903703_CnzNAq5DOI0Ls69MFRjjr2CsvuXGWGPcAsBprVqylFRZ7x38LVijkDlSFcs6fA4ryHSZlinxWxl9OcbJnyYaejmYh37ytVq4urmn','STEAM_0:1:423818987','2018-04-22 15:15:44'),('76561198241560310_ZVHo3so6XQSowPqjdJlZx8v5e0raghFkt23Q6dpqcgMjg86QIrpwkQuKtH1bpaW6tZFhb7Oow8G5guSSkn21jPUNKUi50LrCGV1L','STEAM_0:0:140647291','2018-04-27 07:28:01'),('76561198368331871_ViUW1LYgzALKX1LzN00QcfBNzDDsSDFPsmwl0lAaqjKodYwGxyyo0B8FaHmzkSbdy5qbpgCHBfAXo2VxpnlfHmuwLI6G59X1JAfE','STEAM_0:1:204033071','2018-05-18 06:50:40'),('76561198168168135_ke1CcIWOrlhMj38bfZ1jlMdAVrmYcYpmbzPKgCEA2biEydV9spw1s5OwQNt8pGiID8MkD3Wo4pflOIJwBK9YCsz1XIWED43InCIw','STEAM_0:1:103951203','2018-05-19 19:26:38'),('76561198367698491_fxmNE7LNc97gOSfhu6v6x0wu2dPFV48buzJe9Eh97JjiXJNo2X907tWMrnt90cXtyzAxYMHoRGJR21sGgrNpqGt0GDzV4McGoCig','STEAM_0:1:203716381','2018-05-12 13:31:07'),('76561198217984077_URhu1gRWPRSbWBill6GteMkcJVH7cGqzztj7JiVcPYUKIthOIECVPhqeyYPAzXIVYd9C8JbvU8lngnsQqhD059ero619EFJc2IM1','STEAM_0:1:128859174','2018-05-04 11:16:49'),('76561198341418134_f90cF1XlrK8zZkaMBjQ2AbdfO2W05BjoL6DtINvh3G9HmonL9odwrOlchiWvya45MO9oqerPAhZtYlFMp8D4tYUKQNGvEgYnAcFG','STEAM_0:0:190576203','2018-05-19 16:02:10'),('76561198824943755_Nl26qI2k79FYYy05enayMuJab2LXXVDtm1IqaD8nkgb1as2YY4SwYUIFicUN9YGYytZfvVdbIlfnaF4bD1W48a2BNbp226kY9vH1','STEAM_0:1:432339013','2018-05-12 23:02:09'),('76561198265082185_Rxm7n7CUPiqe7jYOxrdEOVgSLYOOMmsxVVljQvNZPd88iIpxjp13NNOnz0aWQMXzmn9JvndnQsdRgAVAFYHosyeRIl7YZG6sSGql','STEAM_0:1:152408228','2018-04-22 10:55:41'),('76561198110552875_M1DBxlghjq6FhXIcBS9zG3EAMtdspZf6eq7aYacbSiqq6p8iwmtlMw2KpBwCl0CGygAiZrJGYon6WAyMqKVVr9gLcEiN3bd6p0kr','STEAM_0:1:75143573','2018-05-18 13:17:03'),('76561198071565268_6J6sJAVdDtFVVoCFqjM3ZMYEbYZGEc4CuXY5sECvnCByiEqaHOCxoCnzIFh489oPBhmSYs73Ux6h09P9WifHy7ZCaGNXieGDaK7D','STEAM_0:0:55649770','2018-04-25 20:38:38'),('76561198096796803_UY8XlvOA3i5pGwnLFkPvYZDn8B0hmcwZsg6cuHOFnq2cnfKiz1OguVR5jNal2p78Dkm1eck11XvfuetwzurQ78ur5aNEa8Y4cjoc','STEAM_0:1:68265537','2018-05-20 10:03:03'),('76561198110235240_7UShmjUUA6FS0vCka3qH52kDlYBSUseGkMaRvdCD9Ldy1H3Pe7GMMJH6JIolRElX7aMmzj7Nai4mBNroR34liWy0fFYQ9F3Mb9zq','STEAM_0:0:74984756','2018-05-19 14:13:29'),('76561198802282405_1jMlVGdBsJZC4YO9rdQejwwRskgpYSnPQ6xlDd2bNiIMpouyuHGR4ZrhqFYnw8NMpmaltw2InMLysUyCDsiXMjnCebhPQaN29hlA','STEAM_0:1:421008338','2018-05-09 13:22:43'),('76561198801813504_20GX8UrfNfDBQU5EWqmj4RPv53nrRLbB2gKh00FILcjC8xoYXq7dLdlyqwnhVefWy9zrue787clM8kaFJ7IUICh3IZ2yKYZeCAQP','STEAM_0:0:420773888','2018-04-29 20:21:24'),('76561198151473584_3Dq9GoWDytt9gCwO5B76f5DBoACyA3AAYlpPGwuPay8foYAJurMg9S0BRNCYQfjVGhrhviQifo4EvCYzweBHcp7nsWxPz8dEn1Fw','STEAM_0:0:95603928','2018-05-02 14:07:48'),('76561198111583349_KpI7nqneD4vpCVNWGCEngb93eqaAdcw4Ovn4DXBBWI5DGuQ93L8Q0PpCFHiPgauSlLmutVbzrbyHG7PdRhN3FJLY6Vg5YDGClSiY','STEAM_0:1:75658810','2018-05-01 22:09:12'),('76561198264851315_BjldvU9Ycl6dVwLuFEMQGFc3OYFS1HJn0uHq4pQPBchnHdiqrnstiQn3RAjESYyOEEnNUY32ZY3a4PY5PQu5NGiEKw2IXms9AZB8','STEAM_0:1:152292793','2018-05-05 11:54:26'),('76561198122591807_yHJw0IVxQuRDZMq9ArMy8Z6RVrM2roqfjyXA9hY0Uz8GOpW7GnkDZMRJfhZjJdaLaqJoQ4Eq4CyW7yCm3w93mNoKWe31RO4nx1yd','STEAM_0:1:81163039','2018-05-06 07:25:45'),('76561198243001970_LDLdbI5w2qkD4vSDhVPV3owMChktw3YHXt5l3G40v7BUmxARYhPN7JlxwgNbjAHJUWxHLVdLosjczUxFjxkktRsAzuSxblqKPE2e','STEAM_0:0:141368121','2018-04-25 18:26:45'),('76561198821797626_PLtQ5mFLHHtBimdYFA3ZXYRurt7Yui31fY6AfjwcbyUnH8hrJVeRCpXBrV9IAhZdy9Zg8zAEDDcwnliYf2PlkHUj8pVzEWW8OYGn','STEAM_0:0:430765949','2018-05-13 19:15:29'),('76561198022853703_kEYRzzUEp3QDOVyc8SefQaU7Z4VQyo2HyWDLYMi6x8a7i0LzCwyuWNWEeUyWHmjau268EfIIaoo7VFteBseeFfExLEprJhOB96Lm','STEAM_0:1:31293987','2018-05-13 11:08:42'),('76561198029629963_lIeezqSr23SGV1sh3juzj6PbY4nR3mn0zX2gVcR3Ph1bQAMCIeKkKzEBSR5Vh3DlRwKGd1r1ZN5CBttXUCLz1DbRhHysXjDqi8MF','STEAM_0:1:34682117','2018-05-19 16:38:41'),('76561198125673455_xH0XdbMh4bBKLteDmvjE4e8ZgL3CyeKZ2G0Btf2bvjB0nN1D313KcS5hKvKlmY4mpVqoo3I2JOmkQRYR044hrLMCzDxygoLo1C6o','STEAM_0:1:82703863','2018-05-19 15:41:15'),('76561198411726687_ngmJlgYjMNXbwlxyFd6giCgqsxk7KwsSbXtcIKC4NOMt5EFdQ0V7XXHCv9JkYJdrCROOxlMf0q69h629qFcWYYfmWgp5fy2ddpmK','STEAM_0:1:225730479','2018-05-19 12:19:50'),('76561198126731716_9bKjEwq7MaAViDPZ2WRLcsBSOMPWAK9Mid1njzpMYtgNPOaB0bBsfnW6c7Lyzyyowu5zF3Xr8oerhukMseexEwKRwpq2obqD5wAB','STEAM_0:0:83232994','2018-04-24 17:17:56'),('76561198392944686_4gwl9wxZXfyDMwbcKXANeWntv0RlUJPVpt7L9ZNBVA5qwtm140ka1h6wMrq54x6tVSqwP9GEvc1iCOWpya9aUjzpkA2NvM0i5Ezn','STEAM_0:0:216339479','2018-05-08 06:47:26'),('76561198799134576_WLoUFhZms33rZY0HoIhIoKl6vxPMnYiZpcrd6pEgBZJrXzHAhJBWF55jP5KstUayWNqXvlsY20jUbRf2uNf3A7fDMcBZxhZaGYGA','STEAM_0:0:419434424','2018-05-17 16:46:00'),('76561198154656941_6INYShshNxqir6XVAM52HZvZu7cv0aqUQ1p30lk0t2c1vIbuKn9aAztH5MaCg9IOCEKPYYDuen76fsFtyAqbJluwiP9u14Xj7RgN','STEAM_0:1:97195606','2018-04-22 10:28:15'),('76561198213478589_ZAUeH3xMOSxYMZrHgNIeYn7zqHeP8hjYolI27fDSQJNmD29Dl4oKd560QQ9Z6hY5JikMuSNiYgjSYFIm2Xdwtv3EOS8aPYCnYrCg','STEAM_0:1:126606430','2018-04-27 14:57:32'),('76561198107152571_iMrEcLs86rXGbYE0cHfy5UD7g3JJuCXAdnKXwwOwqjGbJZqBbBQM7K9eRAftNVMbRPtDGta9YZNHNe4b2fYIi0BYovVtzcOyiCeP','STEAM_0:1:73443421','2018-04-25 13:59:04'),('76561198358829067_UGVQaDHRsazn8GJSCtXzOPhfFWnta9ol3WeFlhaIEJMIvBMqYnbmMaC3jaCudOp5h3ZzFIwqpYSJRvk9SUZfIYQYUBVkCtXlXiEf','STEAM_0:1:199281669','2018-04-21 15:47:54'),('76561198342680661_81Hpu4Fgzve9SbszMdyyaM8pfUlGeVkly9eXSCvX9nnIzFCm0rMzYMkMsWdGbuRSHbpWxWkPtmCJwXi4a48IRUNjhJvEJEgMDuAn','STEAM_0:1:191207466','2018-05-12 19:23:10'),('76561198211621323_YZhw9jN11CQZWqGROnerMWjAdBsopL8bHduQQx8dMAZaD0b34btvtrnuIAchYqr40XfeNm8UotwgAPknzfO9m8F175ddwF6S0u3Y','STEAM_0:1:125677797','2018-04-25 10:50:38'),('76561198439082606_J8IyayRiC95blDpKK5oUr7l07XCPufq6qYJArIjzxfRydJ0EEHyhNDPYWmu0r8wjlOkzybwvqvwnnnrZKu9kfDQCrRYgMKUb06OQ','STEAM_0:0:239408439','2018-05-20 07:19:20'),('76561198398679554_RrcDq75Zov8AH7VPIvipynErUe5gzbqztacMcKJ7u0YnqX9LfYeFnB5JxIMP1Fn14W7dW9Rklkdl1M1GVYcOh7JuPAwD1ESQk6rm','STEAM_0:0:219206913','2018-04-24 20:45:43'),('76561198347096779_DjDNtAc9diBmp6k6qpfnerLH82kX65NVNpx0Qouti0nsXJ7X5hZZQHepCeUIr7kc2PYlq4lBZw8lsUU3mEBaEwmYUtU1anqHkMRW','STEAM_0:1:193415525','2018-05-13 18:46:53'),('76561198810137727_pOUVGbFVgKUlVlffGHuw7eCDGHa4klK9xxIsja8iyCj9xYYBXNEIHObEldIfOaGeh68ur6aEfD8O474neGF7OrN9mnWkODaGwvtn','STEAM_0:1:424935999','2018-04-20 16:45:26'),('76561197982961011_UAZVk19z0DZhtjY225WgIPEgNuL8vw0JWBjaGnsiVlLLQLNQWdpNxoxn7uOiJBIBY4qcbxMvkQYwIQvfJo0mbjN0r8pYlmDIqUni','STEAM_0:1:11347641','2018-04-25 18:10:59'),('76561198035847168_cvRxpUksn0ESrifQvycpJa6PqeVRgduS0DKMFeAi8zF7W2HUOEvyLudR6EoyFPXhSvUGnKHiMOFBbGVvu7vzuPYSsvavZwbDeCP7','STEAM_0:0:37790720','2018-05-19 20:02:57'),('76561198067186008_FR1LyaiCRil9hHXN3z4RxrioiKIpjwss4FI0lNDNvESqY2vdNy9UGmAoJDNoYBFKKbzcNukQIQOHhDG9owvSlovDGnRjich0mpub','STEAM_0:0:53460140','2018-05-19 19:58:54'),('76561198134275344_mhAuqKaGh3pAaDPLmrYjBRCMIAy4QYOlIQMvvhsXjYOQBvd4E10phyUC8D6wQYG2PtxDJBHOdSgY7e6ECEYVgQJDo2cbK0u2n9Ar','STEAM_0:0:87004808','2018-05-05 23:59:34'),('76561197997437521_nioyucCWF3lPP5s2G2z2v1bW9HVDUu85lpzGP1m0PHFmVVP8xeZ9W8ognn09Fx2VuiC4jA8locXdn47SthWuBRsSFv5QYRZK8hLZ','STEAM_0:1:18585896','2018-04-23 08:41:18'),('76561198289555152_ar73oWjVrf8EMlBgIb9j6P4MuaYjSzXPyjWiowlK2FDYxHBbZ40wILLjN0w3suhYnw7xazvqSAqswpxJgDjmegd2OndVoKKkJlrx','STEAM_0:0:164644712','2018-04-30 07:39:25'),('76561198195100261_bohhxiEFhQhB5PelH1uBVFDU1wIWciaz35G0qYZihEw2Nq4ulfceUMVplOEqQN06VKQmdDJrtcocxeVqiuqvJV5Ri2iQOQrLpZYw','STEAM_0:1:117417266','2018-05-20 14:23:19'),('76561198273940224_Lshqvkh3ruu3aDP7xutRd1x9uW33gOAXpyrjqRA5fPNs25Bdnj5jvN3ucNxEM8b3A2ECRMkJHqs7oReZUM8eEVPi865nDYj0n8WA','STEAM_0:0:156837248','2018-05-20 14:39:45'),('76561198807602425_bzwd81r1ywhBbSz46gm1EgLtEk9LQjgJnw6JOZeFGmNfAPVM7XxYQmWYdW52HZjgDi27SxvQxxZPYywOqb784Vi7nGfGj3YiKOMY','STEAM_0:1:423668348','2018-04-29 18:41:38'),('76561198182267558_F6K2pviJJwXzAzP7UBU7I88aZKlKSbKrWsLkjeYfvr7jb3lPLwoOAVOK1Uo4vzYyefMrDlYClZfcez5Ro0MWB5DDANKwoPdYZxy3','STEAM_0:0:111000915','2018-04-27 17:40:35'),('76561198426920651_7Asb6l9uuNLDv9saZ1wtOA8NVebiCi5jGHoy1G78WqEN4M26sFkG6Z8vBVJY3ZMqsPm5Y1Q4xVZmxbM6KDhh2Zgrs0igZPb5GyWg','STEAM_0:1:233327461','2018-04-30 10:07:52'),('76561198339725861_cjONnnymuNbyFAEM2LU9SIf2aOJELNX47HhIUNXFIztqHyqdhhsrR0NOKQ2sYFdudfIGkZKsxG4lZ7hWLFlQkCsRhzS9AEYo9S4N','STEAM_0:1:189730066','2018-05-01 19:57:41'),('76561198261631002_MwjHxZbjBcpWFJQ8WbfwjfmR9Nhaqqdy0OuGGae7zKj3OKrPMY9eo2ohoCKPMb7vXGCwZE96LGh9nJYvtsl27SiWXLqoMFEKkaWq','STEAM_0:0:150682637','2018-04-25 18:45:45'),('76561198123529615_9rkY87QHQCE1sOmUf34kCK0Uyf12xq98cuIPx3tDdEX4WzJ1FIYJHBvAsXaBHpImvfLBdRx65va1pIbjyvXpM7XD01ADlWELBLsr','STEAM_0:1:81631943','2018-05-20 10:43:16'),('76561197996413780_VbJeXbf2v2GpWPeDIpfS9axbgKzzIaP3xCXGSvc7BnPqEYbABvhfSww7ID4vgDw5O0rcXavH0eUrYjUV9QYEctiXIlI3KsI5ASa6','STEAM_0:0:18074026','2018-05-13 07:06:01'),('76561198090208183_drrAYPZL2KQuI10OwnJmC3oLqvYXREHt07ykZietQlhrhudpLbKRI8RrCuhShx1DqU3a82gfMvECqDLg2dexMUPUyGueFVhYrafj','STEAM_0:1:64971227','2018-04-27 19:02:50'),('76561198200650810_lRvJHOYW2p2Y1juX4vj8Nh5cYiY0VEWJ8DJD8vU38OYdjLU3t2MRC20QAX9gw8b0biDtdHwYuEkiaAXL7cCxDBqctAFqSFqUXMS7','STEAM_0:0:120192541','2018-05-18 20:32:26'),('76561198346435176_b62ZDWxj5pUEIuU487zqOGXpW2nxkmfKgzjKq4DFQeefE8lPJQ9P6yH6IwxK08kHspL3VBOpPE2WNFq8uhMhDRSl30COGvnrnL0V','STEAM_0:0:193084724','2018-04-26 20:49:28'),('76561198346715518_EjAVxyXLhVJ0eefofkCPYecgVHGSJksGO6ibWMJOmfg4NrFkpeFm62CxqYwGWeCEjRmPsPjcnJlab7vCKSm5k5x4uGJQ6atXKy9c','STEAM_0:0:193224895','2018-05-20 11:53:27'),('76561198802282405_Jr7jLfkXmSgqRqPgmFzbphbdkCZIbYY7khqXYkwYI1qktxVtFvbbPl8gQ7UYxGMUgYCu20DqzEafxiOForSzpr1iDI6xmSNYNdSF','STEAM_0:1:421008338','2018-05-07 15:03:02'),('76561198364337763_UoLHQSVYusMpp6bxIWzfSLxkSqwez4YwO9HAgzfXB7kf2d9XkYaoZA9VfLLUbCddRhCrfabfsuJdySoKxmimrFfUr8fro5xI6qEX','STEAM_0:1:202036017','2018-05-20 14:04:16'),('76561198154015538_PppMpn6mVC0CMMuxGPfhFOaZRpC7YKe6gJhwikmlZkH9lbkdKxNuXnoESbqQ5UW1t9IMzlCLWi7QxKzB1VFlMejhfeILyPkNxIPE','STEAM_0:0:96874905','2018-05-08 16:48:38'),('76561198090313787_csRLyuUjf2aH3xyd2S5wmV5diAuVaoOELYY5C36IDJ8lEfhjhZeqEYBatjv6sDB08CLgF1zv6oYDY68fObwDaKQ2ha8CKGqU34ny','STEAM_0:1:65024029','2018-05-03 20:59:26'),('76561198211621323_AYE9PAGRHqLkfiorXhep2zZ1qBqWCy6DsHlN6KOk6d6Q9LKvqOQXfN1N4YlEXcqMreKNpAAm92pc72elh9EosceeFwRn5D2rsrYI','STEAM_0:1:125677797','2018-04-24 08:36:14'),('76561198119527608_4VFJXRuS7ogVkjkwzyK6mAaWySLkULY3yeWw9oSAOYy4Jpg4ugKVMDEzW25B2ZuFIpmXQrCtuIiH9mjJNQaiPyW0Ks6etPwGxRPN','STEAM_0:0:79630940','2018-04-28 20:37:22'),('76561198298778292_9YDxfLbHHha60Ef14lY7Vk67HBi7vK2wQEAil3jKU1Dj8xnx8vNFnH4vw6dCqs4Efvzfwcr7PHYUO5WeCPOYlNlnGIkNciAp2KNU','STEAM_0:0:169256282','2018-05-19 16:11:54'),('76561198115603842_7Eg5lh1IlNEWGnbYwY0FtJlotZm8bQwtbLDP31p52DJjwYw64IbzLdGmq8igrbHdL7tpivK4L13cEV4eyLul8Dhc9gWDm1mgl2oZ','STEAM_0:0:77669057','2018-05-20 11:11:51'),('76561198305792091_hXoJ3DLJrZJlIUGU25SKLWWYGDIGV3Ue04DzNPjDN8inM7aw4zcIghpdcFjppUfabks8Ne34MBr6D2KYYlXY4J0pEEp6LRJ5RdaP','STEAM_0:1:172763181','2018-04-22 17:57:26'),('76561198127348474_IcIIuunWkL5Wc9P49ESUBVq8JD3EAchMULzWwm3Rt853FL4kYjwsjYujtBKcVrLmu6Vnc4RW8rJ1lOW5FqCWxrVXPmNP9nfSGKli','STEAM_0:0:83541373','2018-05-20 11:05:53'),('76561198092653012_uQO6YpAAC3AUP8Mtyb6V24Xem7D5f4Z55vMPPmFjWECEtm6guZ0JICGbkmc2evWNuUdjM0qOV52qwDtUOlww40v5xcNYtxdGJJes','STEAM_0:0:66193642','2018-05-20 12:21:13'),('76561198090313787_q650zYyQX8U2GfRzQkUE0FYRNzhEmbOfHu1yMvAmrR9t1FHYBgyUWYG0VyEhlGa5CO83K0N6GU5zWJrAzYw5rY4fwYFeV5GxSkPc','STEAM_0:1:65024029','2018-04-28 13:34:51'),('76561198328491715_f5pc41gO7o3tdNic8g8Ect5w1bXb5pqd4SYQDvOBg7t14I7ZJPBo5wlf8mfMUjfn4lX1yvpvJO9iYkeMePVXpFFd11YGGRGfWRiD','STEAM_0:1:184112993','2018-05-19 17:28:53'),('76561198298778292_7jAOntDFuemNQqpRajL9e8ElPzYzjLCCje65WYbahiwm3hgUj7vrqCg0igESeQKuuWIfjzInMlaS4dY7juwqAVpJ17RYNYmqviha','STEAM_0:0:169256282','2018-05-19 16:08:41'),('76561198157438907_k4gQQ77RLGU7kSYBaguZG54WE9CHp7YLDX5iZjcuQEwMyA2WKegIKeXYqiG98SEmv18owY4f51wIkO9BkJF2pN2mFXK8ZttmMlx7','STEAM_0:1:98586589','2018-04-25 18:19:15'),('76561198823813028_8zOZBcrviUspCulAEy86yeX2ZrEnoWMb2AYkUOIJ1sv0MtPkPZ06XcPyc7bJAPYdL8xpbR39dDVzklzX7IzJEkp1Hw88PvO9tzQE','STEAM_0:0:431773650','2018-05-12 11:13:40'),('76561198406869954_phIYdQvYpBSYsYDryhxiJuYrYqEBwIsuowrfcYlB6M4NUnxg1GYmYDr32C8g07Mxl1JM7PwkK7xz49bwj6c1YJe55X6p3YhvQD9Y','STEAM_0:0:223302113','2018-04-22 14:32:29'),('76561197989089529_4fos6wBmnGun8h3qNlCsCwF2oQguWKEnnmEkYMiHqLWJxYX2PVwZEytqnW6IRQBUZPOqYJcAfkEUgZw2UYbVQhH4i4Cw8dse6MrH','STEAM_0:1:14411900','2018-04-27 17:35:02'),('76561198326365555_Vz4BfMSYwyvyrcftnFjWkJsdViHnq5xl2m0bxkufa5Wejp2S93lupoLJ24AnUYi97DzaQA4m1k8BKNdnr50X1pcERrtMM80RJLJ9','STEAM_0:1:183049913','2018-05-05 17:04:48'),('76561198107431383_dGk7Ia8SQFMnkQMmILw23fCtSJeCtEbkwHJjzh0yaKPSARgLsOvoab5OQCbQynz1nHLQfvx5kBXo5O6m4d3l19JIWwt6EJrGuRXX','STEAM_0:1:73582827','2018-05-15 20:17:45'),('76561198016328696_U55GdfVNyfDjwOFoSe0CvPSGKlW9wMkVKYNvaFxWNen4WMtnRCgMFB5ssVX4G5QmPgJhU4IRoV7Rv63A6ZVhaB4eZz7mr08bMtwl','STEAM_0:0:28031484','2018-04-28 00:53:51'),('76561198253692462_PRmg0zxYAb0ZJX1V2BNBhlNkPvF5ptkEg8yjMbQzy6bW2YwDN2mnXw9aqXGaD8SNyO0Sw5c3W9ExM9YODOZW1fefQHlkHrY6BYSO','STEAM_0:0:146713367','2018-05-20 10:44:48'),('76561198090313787_QS0m3wZc4dkwjkDFsPVAFUltDEoCK0WiciBkYoOtcmQSHAc3RQWSfdvoucqmvbWnp08kP4DuYclwgz6hmdFgS7EoRrIG4CqJJfAH','STEAM_0:1:65024029','2018-05-09 06:26:57'),('76561198277944305_ObOIX0wagE0id5u4OIbnMIhSecOhjf7e6948J2V6k4HLzeV6IYARnY0NJMaY0SudoDZVhGuwK71ntBClRbe7fbZY0h5OEEYrBE5z','STEAM_0:1:158839288','2018-05-17 17:50:54'),('76561198263350066_kSivka2doi8pr0g9qz02nFpwKFQntkWUaYNrIwxrLybe3aD4CPalefA0GhXgajhhsK9pd4Wqc3byxSSBwerCQI9djYoqYXWb6ria','STEAM_0:0:151542169','2018-05-13 07:23:36'),('76561197996413780_4DlZVmPnWALK3Lp0fH6ilILsBjpXBjYoW0sFCyun6tj3HbPfNECuxhsYXKFM6mWOMRL3LkGhz5leGgfws8GCvxBlYaBIGg4qqYnA','STEAM_0:0:18074026','2018-05-08 13:12:46'),('76561198821797626_1V4rrpVzrLG6UVBvshbaSxRhtE3YPrN48DhjSoU8e6X22Z9kzQjX0CiNKARpMIYmj2vYde3kKBvlGDPYYu6G4zRrmnZ2jsf0UWM2','STEAM_0:0:430765949','2018-05-09 06:46:06'),('76561198239689426_bPgpREpjh1fQUV4Q9ppvPjpGR9tKmIQwok3HFtPhZMNDdJO2NYhScr8LgJ3ccGrWDdlVzq9xnV7gypVNCoYYFRIWRwOZSn84fM6w','STEAM_0:0:139711849','2018-04-24 13:23:40'),('76561198211621323_KnBhWv0qCZmkG5ANkVWuYJU5Zbs1498LBINNEfg0ljwnaEPZvB9rEamxghxhjWCnenor8VYNKmsjD1Gic1LsxWugvKCZj2DfGDju','STEAM_0:1:125677797','2018-04-21 23:28:02'),('76561198127348474_CExns1RIJXYk5FLyVbvRhyXlWCdPebwrsF3U9Szswy8F30VOmpblYLfLaFIE5WAWG2jMYN5KyXtXNt5tHio8wyyYX0MtH0jJlA35','STEAM_0:0:83541373','2018-05-20 12:46:06'),('76561198060055575_9IW0wRtrSyvCYDMJ3fheBalpQb2V573NRtSdPVRMLAtA4ryrzmzeOoIF2ZP4QO64OhfcttBYYeLycoQj31jnZCmUjc0DXeP3eh26','STEAM_0:1:49894923','2018-05-08 23:24:51'),('76561198802429571_W6JZ4r2JDotemonVPqsHYzaWqCDh6EdQMX56cWP1q1QXvkeVEq8XvC6qQ0KFbmROQjn63nUtLLRUAtcNYotQPPC36sVJtusCcDyR','STEAM_0:1:421081921','2018-04-26 20:15:43'),('76561198368577480_2ZSBI8iY1vcgmV0bhJZ3RzeW3Ei527WMXJYZYAQinYxujjCmPW6MKtrDCLAnxEygOkz1QdBY7nvcdIfM8vj1zEnLYIbrSt7PFx8C','STEAM_0:0:204155876','2018-04-28 11:23:36'),('76561198245748756_jf2btekAKBZDbSmHFBMEH81iCqjpgbVDM8nqjcEXwNGNBR8tsMZZtKWiNKeqE6DPOCEQx51XXi6EB84zUNs0JCH1Vnz0YvWltS6p','STEAM_0:0:142741514','2018-05-20 10:15:28'),('76561198131306967_JlMG4KB729zZeZ2wzUpjnJ9ubWlmk2SYkIW8AhvYBXr2b0KfMVjOl2YEWpG5CApQdqtjMlERDErrkHicmaDYrA9mUKoyHyuoqKFl','STEAM_0:1:85520619','2018-05-20 10:40:22'),('76561198181233165_irwkdLOEC6C20aoYY10MYbVvpmyOuejxH6G84LLAMPAs9uyPZVrHFhG7YaskvGUr6i6pwf7gDKbhxneEjzIeU006tHMYZt1gr3ps','STEAM_0:1:110483718','2018-04-30 19:39:58'),('76561198053885037_AyjtRr9l7OM4WAqV3DlyNKCa7CeYRagOhWhJ7Ywnrmx8WcDA4hlL6NGixKeD2ney48P9RgQyJLwmNclaX9O1HXfhleohi2fSlXdC','STEAM_0:1:46809654','2018-05-10 15:11:38'),('76561198823124560_EXoxJshjLUaxb0pe0PVueKeXPnIcJUZIZiBBKHR3P6455Lyhst6uGQaYWrpUfeRvNfDDJha8xQUqkb7C7FxZ9W6ydChEtkP0IlsQ','STEAM_0:0:431429416','2018-04-26 15:41:37'),('76561197963592540_seBCWWpEUXzEthcQoJaeMgZpYwQUjh45rv8ogEioxFWIN0zmcyHN8HCw8P1wsiCoUhHucSLEljKOBNowlQSDg6WYiZiBmUjXdsSU','STEAM_0:0:1663406','2018-04-21 10:32:18'),('76561198362697847_HpCBQ4b9KfVbJCDJQcpUWSqpoqZnRCIkU2bBIveR2QJVqyfJVWNdC04uPj0NYER8b1ivZ6VjmP8lOK0idNNy0L73SbPaN9Cd9Hit','STEAM_0:1:201216059','2018-05-19 20:04:21'),('76561198258848374_1ZPbRbly34XFtMJIy73xOO45mCN2U9K87q13wmfscnJ4Vdo7osh5xeEkNSbFJXYkHu66KDDCbU9xRjYo5q90qwKy9BEgeuAs7EVd','STEAM_0:0:149291323','2018-05-13 17:40:12'),('76561198006479127_n21GFwAKWFzLVsLUvCERKNVeV93iyqh4AbnGYpcfKYF1xnoKZ3IvnfcRIFosqUyO2wX8LUGf5I8jSUbujfyaS6Fxe7woBt2N1VYb','STEAM_0:1:23106699','2018-05-19 11:38:47'),('76561198318255890_Yjgxjqzj5WZhYKWK8vHffzelkOdGXMWUyLoxjCh62mqp3llI2oNny4QugeSXKQM1k11M6QJIpkmaPAxHQ7nDoiYSMXljgcov0LqE','STEAM_0:0:178995081','2018-04-21 12:05:04'),('76561198226147612_X8AORS27UiCJJgDg1rRJEUObo3cOotSsMsjDcMMxizkYQSyJCIWDXymci9rfHwLc9ANX6Er4Bwvd01PCnehfituGMa0e5lNWHGJL','STEAM_0:0:132940942','2018-04-25 08:43:30'),('76561198092653012_kCf1XAGI5a2A87xnP6Rl5fgKJdYrm3jSSnraSHXr0etnbXBO5HD1kngaYVgcFUgZl1YZIYQlEvENeGiSwz8GEgt9HqKMJYY2ec2E','STEAM_0:0:66193642','2018-04-25 20:16:18'),('76561198191015269_VLQl2GPFPLmXAqBZYlcnXCDmUgr97QvSgiE27njLO6Yyput2tnhSMw50Ih3UkhB8qhj83wuaPCixkfFAOhw2Gm80eSUfbxGkWksF','STEAM_0:1:115374770','2018-04-21 18:47:47'),('76561198291704329_Q4zLqh7J6NrxIn9NctgD5YrYkhnEFkFGAq9zK3bQiEmr6kZDkWOtM9MvovocvYPOAXSAaH6uxEpKBBJwl99jcee3EfEldqR0Gx8D','STEAM_0:1:165719300','2018-05-20 11:14:38'),('76561198210630408_9vj13VMEWRj11fkJa9YKd3bA1uy4UGha72BvEPFzzM1PQG2cBBYJV6NcmX7LkNcM9a7mEyMLYNFlXg845ZNh15dYy7sBa6CWKrUs','STEAM_0:0:125182340','2018-04-26 09:50:21'),('76561198239070100_SUY7EfxjEbxMxw7Lz1zWM0piymRVNnt8V9RbNps08DCOImSrZgHbsAOFoHoQPxHnNrH73a1FmO9Q6Ygr2DSa4k7jsoGCbdf1F6Ih','STEAM_0:0:139402186','2018-05-19 13:28:15'),('76561198132015136_qzSkyrrCHN2k1YwMbO5bDjlCtiwddfq8Z5wPpYYGrKYV5eYW2VUERGiCbiD7ZHMGghG6NljyyYNsP5NB5nnxbcvl50OKw0xA4tLI','STEAM_0:0:85874704','2018-05-09 14:03:27'),('76561198834814603_CCwPpHgagHi7ZUe1IwRdBmls1iKBPX8PZPkaxCr7Sv3QPFece3z4ckp6orGsU9zWyMBOQq5nn4RK9oBOhzRdBNYDUAWMQhlSmAdU','STEAM_0:1:437274437','2018-05-11 11:45:10'),('76561198383633813_Ofn1guFfPwo8ON1c9PaNLtsXezmXmsKsvwG2Hlr9AYMoKBKWQSfFp6G14ESxQB3sI6a3VDi3eLkJSdnD0ayuczRvjO9XVGXVAIuQ','STEAM_0:1:211684042','2018-05-13 20:56:41'),('76561198343452867_aLjLiAgY9g8S23yYHRw8bnpZUafDr4qhjwecYmVNjsZ1Zr3O0kr6Jr16CCwqyuIAkrN1XWUuNQgl2kIRRB3jkztkKdh0S34o56Z7','STEAM_0:1:191593569','2018-05-17 16:50:47'),('76561198389845741_LKSnOm92ZlOymFE884fzrsGFLjDxesIG0HYkFpmngC8yz8vskBhdSsa7C1bDSgIUvbwRbii7iSm9Gae0CypZL6ZJKl58bWnmVnxW','STEAM_0:1:214790006','2018-05-18 15:44:55'),('76561197964568402_KzlSRJvPnIMq6WMP3dGvZwVY3sYW0CjgoudAsyVay8gSBjjrpZ86cbl0e70LZrbGSGg27Fjb5y7oYyb1MydD55I9LNhhp9e4xvgm','STEAM_0:0:2151337','2018-04-24 12:54:27'),('76561198245748756_fA6x408ZiNcUN9uehIX6fCdkjSFIdSQiBasX59Mq1Pmu79UUlGtSXq7bSe8fad3kh2iAgw2bx1L5x9AOynKRbrj5qr8VP7ShPbE3','STEAM_0:0:142741514','2018-05-15 15:28:47'),('76561198037508688_FYirOlahPIYYXQcIgP5ynklRVn1vizYLjb9Y0HMSarHY2BkjPucPVHAtpMNSSsdBs8z1QEf2khHJGS3W9p9MelQVLE5oCSrhqeG6','STEAM_0:0:38621480','2018-05-15 18:21:50'),('76561198187652686_sMSEsWFUOvjjQrl0oUi25pSeAnYpg90I2QYHSnf7a0YhgIyctAu44mI97lABv9H9jAbn22uhgM1GxqUh7I8yenk0gLWehtMKZlfW','STEAM_0:0:113693479','2018-04-26 18:40:32'),('76561198187652686_7MnAxHckmuh7alSI5tMotztDLwXjI8zYSedgprp7NrW1VDtO1fBHPA4HIozQHBRqjHyresP1qsOQ6f2YBUIJMm89vO2cXpq83jPt','STEAM_0:0:113693479','2018-05-13 05:55:30'),('76561198257768495_S5CWg5diWxRdXh34jqnLvXEdBlDRoKUug5uAhxqcoSE9tLXKiAYLetL49hwrrg8h3k542JVJnic8d4JSVrKUZWXgNOxmlyxKRAMr','STEAM_0:1:148751383','2018-04-26 19:30:25'),('76561197990810292_oaxNgHViLms7JoDeaiwjWQYLJMAYKO9EBgkA9Orm7FAkMH3G8IPEtjNxMY5mg0Hwox0kJoG2SQ1piAC3e3RiyzcKyU8e72LXuGjU','STEAM_0:0:15272282','2018-05-11 14:51:02'),('76561198031114456_QCJdEshYit7OHCLMlydz89JxYrxEI22bIVnYxYUhlnehH78dtYJRU2gSe3BjiBzSIFOHgYkUMyYeHHC7WeVqz6lwxoQgoawt0jUg','STEAM_0:0:35424364','2018-05-18 13:19:24'),('76561198073018654_FoohESpyXlGwGCIy9DNuskJy0jgYfZk6lKPU49sKEg4HycgrigUtLerRaZAbgc97pbA4rCGVEptvUuJKADlm63c3VkX7DoOQkGZP','STEAM_0:0:56376463','2018-05-03 10:42:44'),('76561198802429571_ErAP2cLlv3ALBtDRYAekGESsxUw9PRudCpKANGYzzV3FiM8NKr613vjf0sXuQoM1QVccfhXzWdrnPc85yJdKy6VUOU1IhrQjts1O','STEAM_0:1:421081921','2018-05-11 18:46:04'),('76561198295535106_yZXLqd9BK3L6Zj9ORKMRgIijwWJGJ8UWKluEFGqaMmpk9Kbgonuj8DjFDom8sSVlvumWdmegEk14UEXPOjwCNQzXbN6YahvM0pZj','STEAM_0:0:167634689','2018-05-06 10:18:17'),('76561198821797626_wiDEsMsuIOjJpjmz4ZoaxhqxJg8wWACfzS0BQXEDDljfcH0pUa8SKe6Kqc1owrLRkoDBsQr6i2FokMbDqLe6inOY4pEWGakueqA6','STEAM_0:0:430765949','2018-05-20 06:45:23'),('76561198071228846_S3WUYH2RnWRYYuh3oKYXYnvm8YOWkJbiJ3dnZlM9zv1XtNg4h7b3B5z1UMumIzM8YRWO4Ymc1OOnXNpsx6Y1UCKlbDcxc4tfAMZA','STEAM_0:0:55481559','2018-05-17 21:06:17'),('76561198127255661_C5tnJ78KdVuw56rLwe7mK80DI2Fw9UYmSQEc0J3YowUGbCIwZx4ctYxzzzyaPtErDBHJlfnQQdqVnfnXofroMEHWx8RKY9DooYmh','STEAM_0:1:83494966','2018-04-20 20:01:06'),('76561198014864909_RA1jYSrhk15HY17ydq3oFphMK42xAttQWPnQxqJIirBzcxfzbyUVSHiQanY5MqmR3um8Ep1WcJq0LIQHnaKcrGgiffZpHCf2t3B5','STEAM_0:1:27299590','2018-05-01 12:33:34'),('76561198133293919_764U29bzwmQgohrvoLMqCJ5X89IFItchGlsmJKvotDxY2zxJQCh0Mrk3MrKNHbCMZGKGJm489xRo93BPv76Q8nFRF9sEpmVLf9Sv','STEAM_0:1:86514095','2018-05-15 20:59:38'),('76561198073348171_jpOoXG4soR6a7Wxzir0ai7p7BKscM1Mb9fWbzxoRO1rQB5vsDLbddJgvkYBqUDCiC8NByHVCUgFzWYB1IewGx61tOLBmYUmJnLUZ','STEAM_0:1:56541221','2018-05-12 12:40:10'),('76561198020760427_2W0FxlZmnCZ6YYeqovXSBI1Jw9h5darCqsqbvndVdkrBibtk2FcVnE0djW2mj27LlX6SFueJh1SXeHqvjEYC25JrsAdYu8KOpZ4Z','STEAM_0:1:30247349','2018-05-16 16:29:56'),('76561198361132950_f8RLY7ZteE4l61LKI9Eu0bMd4fD8f8Jfza51vH5geRGyB5LCjcCeHQYfJzAgL2L7VoGkYdPvm3CU7lKyWn2u9iba3cgRlGMELYIn','STEAM_0:0:200433611','2018-05-06 18:07:36'),('76561198814533719_YX4cRkfjJtC8RFyB9Psm1YvKRPGdvwvU3pXSuElxrYMe8sHLVQGGOmK2tJ6LrHHABwjj5noeLKNFiLXbpbx1kKc8bqHufORAcJf3','STEAM_0:1:427133995','2018-05-20 09:56:12'),('76561198041388511_R3rFyndplQvWHxMFHhNwWiFwHL3szDEMklZ0H8NPlfAhrRKvWtcgv3m0Vs1sgIIRHsOPdCHojlI0nBjGxIIYjUPrrudKhnkloRO8','STEAM_0:1:40561391','2018-05-08 13:45:14'),('76561198326365555_YaUXtCzG5J6Yzr3GLNihIx1HGizAzVVRK7u9PhfME4w3o90PEaynwylmkWq5Jx8V2ydaavfGcEOXMmRl8MLqK7fxs2dD8sLZnoOB','STEAM_0:1:183049913','2018-05-05 17:04:41'),('76561198313624304_wGemQAvwgD2xJ4vFYwKqyDYQh7DjM7wYy8IlaRdsnySY1aHr7COApVcftmLW97mnXUtLEPlyfeOn5MJmc1qVXjKkSHEiEY73BpBA','STEAM_0:0:176679288','2018-04-24 09:42:28'),('76561198336003835_nWLYYZvYbkdXibrRYMZi7vEi6kE0GDVnSQKQAIDJYiIofhwBWEbpBdnGVMj5nNSnb96q0ReUmazuigOSk5SyYKZEb3iXSC9SYys0','STEAM_0:1:187869053','2018-05-09 11:02:12'),('76561198801481249_dE2Vb62O1BpnbWLoCtvn7R5fMV9O7Zs2Byl7zowCzKHD814J3dEEE0r0ubrxPFNVJ8ZUnhY2YBD6rdO5Jpmsl463OtXAr2KitBJC','STEAM_0:1:420607760','2018-05-03 02:24:43'),('76561198313216837_aqSlaWk9BViRB8LU2hB5cNqEYEtGu1j5WAd9rSZOLKRVJ0bYuzPiUhsJ2EZx2btrDvpgIyyYr2KMjpRiKsCwplHb2HbW1u5j4IzM','STEAM_0:1:176475554','2018-05-11 14:31:25'),('76561198085061366_xrC0yZABmY2UwkbXOWILfJ3PCYJgFhsbQHC6RozOEVlhS2p5zUFXgHtrUjm2B5RKRfHwklosaZZd9lVXaiHfGzmVH3YXqwO7zloG','STEAM_0:0:62397819','2018-05-20 13:58:57'),('76561198245748756_IfJd9jdBSQY5r7JEOgAquLaEgM3wzRSOa6JIQlIeSmlUs3ahZ4hJMdrPIrDWtPeHc3FCQWNNg7lk6Io2hABDb9cujumsPft6zmcW','STEAM_0:0:142741514','2018-04-24 10:55:42'),('76561198823813028_8FY7CUoi30J4ke8ocQOCAdQ4I1ptOLFgaXbUNox3slPVkpmy0gmllvqJkDBFX0s3PtEN6e1iVidaCI6VEjBEs0hCHpYqAFdcQE1E','STEAM_0:0:431773650','2018-05-11 20:29:22'),('76561198037508688_147YB3YulnyNEcA4Nk5YHBq0MZfZYhHs7h7O8hUC74uDxuBluH8AHYiAxsxdnL6um4hkFusrzoBASanqa9pWYBM52NSoxNYhYCC3','STEAM_0:0:38621480','2018-05-15 18:20:40'),('76561198261631002_y3UBaHJh5uOwXcOMW2uAdYCXrcOHt5bmFlL60JKZn6qZvVxlVE6jnZIWcRxIXgbPfSa6XlEaEkIAa3I0UQ18SWQ9pmYowXCyMNdF','STEAM_0:0:150682637','2018-05-20 12:21:41'),('76561198826403226_8pG1UPYakPup7YMFD7mMFntz7CeqIZyo6QmbaYeEDSHfx2eWD5DoJ5I5plhfiNVjYC1GNBp3BGch1Xq01klvOKMbjO98603Gxefe','STEAM_0:0:433068749','2018-04-27 18:23:27'),('76561198104569121_YuyVjY2qDMhpGbC0BoWlgiFmRXwhAjqktLcSoazmMlzYXnA1Bc3xuFqp2WayGLH7fckHk2WmxVMZKBxoOZGnrUrYZQg9arDaDnCZ','STEAM_0:1:72151696','2018-05-12 18:44:35'),('76561198834814603_Lm24raZG8Xm6Ibex0LHMEPSd33fnLIoNrv108gLnFrf3jCgpoROlPwrGrw3EDIsVNOkywqKiLdl8Xmb62LrzrUYYJxO5qzq4URt1','STEAM_0:1:437274437','2018-05-10 18:00:25'),('76561198273940224_9OYFK9nJ0UuEpMgY0ohZZWGlUEtQBASEAUubtwCEx1YgtQtBMbYGeWEukQtCuvuVPmPj0hWweCzUG7gK4MWd4Nl18d97ZFtAsreu','STEAM_0:0:156837248','2018-05-20 07:35:37'),('76561198122546289_hKUtpBVNn0AZeV6vBpxP8XHMScXp7D5z9UhzLSqYAlQmk8Rb3sB6RyXpY1oJH9y0Bw7B7jEEnezzQMuniPpF9cnuY2YGoSgOck9f','STEAM_0:1:81140280','2018-05-04 07:15:25'),('76561198372948041_uvDCWjydAxV8Pp2SXRtlGzHqQ6IKAG68eC4wh92zfYocNRoNNRYFjnS735UgmYp1io57y9EF4pXDht65Rg4hCdUnVI1VmgzgAPEI','STEAM_0:1:206341156','2018-05-08 05:56:55'),('76561198181233165_bD5uyoZY5yQJaKqkjEmaCUZvVHSzQHDFcxCQQlHc2sxzB7HLKbxv8eRNLL40XdYjS0r9kheDBm30YgQMdONAdI6oq0xovulA8VUO','STEAM_0:1:110483718','2018-05-02 14:52:08'),('76561198328491715_eQ8bU4DzBJbi4bawKywfIEuC02mUfrtpm9dJuvGUcPIOkBe06yIhKZpI4NZYLAFgHQgCsA4D3nEtuoJCcOGhA6s0Y70GdtMYtvyn','STEAM_0:1:184112993','2018-05-19 12:00:12'),('76561198801654145_7clK9ewZJFxvWOMZkDIG8g5DZLxMoww3OPqF1PscalcsHUDni9RUYsEh25rcYQboAXzJ4gtnuI7YMGxahbFX5lYoKui8e2fkidMZ','STEAM_0:1:420694208','2018-05-05 17:42:00'),('76561198274398464_iD1Y9q5dS5rnBEhIZliKKa0nCvGSRCSWzspX6fBLI6EReAQVNBh30Npfb5iNOpw7b6XNQaBWqEURfvvZMVRHgqx3nbHxN6j9kFtR','STEAM_0:0:157066368','2018-05-17 08:14:20'),('76561198138874276_Op9LBBPYIQDx4GjinoM4VLZrm4BWm5c3kfbFF3zUhUqbBv9Sx1gAqQX75OeONLwsDLeY377vxGo8v6DYgy6Ucg0dUUoiJZzySbWZ','STEAM_0:0:89304274','2018-05-07 20:29:36'),('76561198346435176_Bbkl3W5WbGOrHj5VZglVYkQRHr6oRJqytX0QN2mBfLNYaB7NsjXxYhQ9k3QIrYoENHCsC5IHrsB7PdctYuVJY4d7B9iarzargfGi','STEAM_0:0:193084724','2018-05-14 11:31:11'),('76561198424262083_BRt5moGpFhxBsYhHYdA3GCvI3SHtjqeBeMqP9ieJ1urJo9F8ucCUyinySc955RiZ50WYx4IbPVkg4Yq6FItYnRnbFB8I2gtK0YC5','STEAM_0:1:231998177','2018-05-09 19:49:38'),('76561198151473584_g34SMen9LWUxyNoQ9VDAtBX4IZ2YYqgkOyxpepMS5D3foxu8OMQlprOOvi1x3alM8g5147bGAJt4YRV5oCo0Ho0SpQENFxYE88Lm','STEAM_0:0:95603928','2018-05-17 15:27:01'),('76561198154656941_nxMXbdVI3nuBOgciRaSEtMCfwOPy03sJPJmpVJGNImYiULoVRYUyF9gIL7EIYFENgYfCIUavRPK06NNYJup7nmsZYIcQYUZeiv22','STEAM_0:1:97195606','2018-04-22 10:51:42'),('76561198406256519_ZVkyQ2I5oeCMfLL5wxFHyCIH1dwH4cnCGKKdymEEVOkBealZMZ0rvWPE8Mo2xaHk5FPsrL0gl2ysxXkhfeydn2QtjZRNe4bdUjZY','STEAM_0:1:222995395','2018-05-10 20:43:03'),('76561198392944686_UpG9vNF26NQ4Z1PXAt2gJEIzvaysUZGQvbSA4MyYfSEkP7WhcWWqAIAeODDt8wa9LBmDc7hOanafW5PwA7OIgY8KYLpFYtsf0s5J','STEAM_0:0:216339479','2018-05-07 04:52:47'),('76561198644320105_GsjvkISHzXj4drIQRveawraaJYvqMYRhYdGRjZOvH0Gul9YFhSGsjXZgSLKZRL5RJnGWhKSlNoxYFvqyyASlm4y2syGCbnDJG4pO','STEAM_0:1:342027188','2018-05-09 09:17:08'),('76561198310569157_wpK3YUvtiImmFNvyu2hFAqh8VR0DSQ9dfBhGFrN01il48Y7ZL3FCQD4SudUpZFiNZMRhaiu4OtgwNu8dJQ2vxucUMoomqUpE1YEi','STEAM_0:1:175151714','2018-04-23 13:25:59'),('76561198298778292_1fnN53BzmDPRivA50AQHmxuViLRwKr4wBp8HfJjRnmpltncVMj0oFOCkFjj4SLwhUKyFbrglMVAuRmFYMwHbSlIgQDnBIexnpjJS','STEAM_0:0:169256282','2018-05-20 11:25:08'),('76561198250663796_DFqA9bkSYt5rue5hB1E4RgmAJMGA6MfmiOBucYmigb20Rm31PrmeLqPArf1X8uaqnbhrqY9OLhj3wPkPwGFSpIxDEX2nJVGjnGQ9','STEAM_0:0:145199034','2018-04-21 10:34:19'),('76561198291263469_kuIXHLNHYYMjA1eIc73yP554DXiXZoRYDKJPmpVtEXy2oHmspERAhyeGqXFAIpxqJvg0KEvYAPaU5YbK80BXYfZ47UnvoYMoihlm','STEAM_0:1:165498870','2018-05-16 18:57:18'),('76561198372439398_qSc9Y2rygOusDvf61hObaVt07c4mLGorcIQXLwSOZcjlc2YqQbfuNSbqj7fASC2sZDOZnPSIOYm9SdMaHkIU9vC0tjKG10Y6jV3U','STEAM_0:0:206086835','2018-05-04 14:26:14'),('76561198224485076_k66MPlgPnaxUuFKmn6GxdYAF4E3mrBhvhBg5sEnDfsvuQKcjBaeuMGg466kRjKKfFG6Vdtb4r3UA3GanF0WfapiwFn1Mes8MlFw2','STEAM_0:0:132109674','2018-05-10 21:18:17'),('76561198823124560_mZxozuKCwYK0v2WnJJCaG6XphBuu3D7ndbKe5LQfDiLUe9HjfsKhl0NAOZqREM4LoevvdnxcmeLYcwkfakMx05rm7ULAcYcI7deP','STEAM_0:0:431429416','2018-04-23 07:13:29'),('76561198181233165_YyjLjiK2tbkNnUQR2baUYHNZHW119OzygbbSPwPNPuvWIhsp3SRlQqvfJfKBEnaBbnAY5BsMkucFcQJ4d1qOYK8HFGDnbImhYuJa','STEAM_0:1:110483718','2018-04-21 18:54:59'),('76561198117454698_eCgJOO6z4EEY7GI8oDQY2fvZtjakihwN3yIZtalhMLJ3C6Ptggc55KkvwydgZ2DaY0jMKY0V8lnolu45M3o9lN61MLKnLLJ7SYV3','STEAM_0:0:78594485','2018-05-13 14:08:07'),('76561198256689814_aJ7MiobX28w6jwoyrENfHW9HbgGyzw5zHYAfaQQWE7Ng9dV5pnYfI7s554Gs2kz7V5BbRtvqMAJcsAEDVpqDPO2qQ8s2bAp8rRI3','STEAM_0:0:148212043','2018-05-08 09:08:38'),('76561198210630408_Od3OVOaiHcMufhR2dmU7dUeN5fquh4q0GnRpRFotJ93ncUR6iVpxD2jnHc7SpJ0gMjgrBjjJdNSgstSsYyaAfs94YWE4EGk5exYX','STEAM_0:0:125182340','2018-05-20 10:32:55'),('76561198253858417_AW1Wqp27ZQYCLzq58N99jCp7zA8aZbgHvXEhJ1bjpvliljXXObFVnYGl5NvNgFfGsvwtJlbp94pl1WYYEF5Kk7HtzfDO8JPX89YP','STEAM_0:1:146796344','2018-05-18 18:02:30'),('76561198330558831_RCs1B29YBiCBZKCgovEqKOHrabpSB7EtomeAC7JMOyiASnzQ1UgsANIvGFYyG9uem6FvsVZgdVvbDXf65c0NISHAvKX70bK7A4M6','STEAM_0:1:185146551','2018-05-18 11:35:25'),('76561198053247828_UQWufz4VtNWqrEubmtd7AbytLIRIhJ3IuADzHvByYpNnOsQnDeNiBSuuCKYm2ZHiim7CPvB2G07UFyVK9tBvcfMcMNEGJS4NuJWO','STEAM_0:0:46491050','2018-04-24 19:12:22'),('76561198385122059_C1ihrcc1phW11GYU14yi7N4hXbZzNN70hNm0o6Q3XyCiFIgDYUEw3u5W8qdvfDF2dbyGSURB6FqCQ3F0Ewr0D77bG6PsYktwEzUJ','STEAM_0:1:212428165','2018-04-25 15:39:52'),('76561198212313755_CJV7nmIsYuj9kRHyDdOpfzZOx0PLAYEa2hdFw6mQEcm9BFf2Ad1gEvGX6hHHl5ssl7lAPfEiX8iP3nf69as4cwvy8nhRYXGB8k0J','STEAM_0:1:126024013','2018-05-19 10:47:01'),('76561198430953098_c8f9gSW2sKqkR551MnQbKaDHva0Y2wlls0AvhoXRgilHZs3cHLeYFZycpOYlXpBaJkmYSSDAxmJGxW05faaPBhPvpgfddYPG6iy4','STEAM_0:0:235343685','2018-04-30 05:57:52'),('76561198118996496_0GfSiot5zMYJHMZULYExFkXnK12yHxcW0XPSgQCdHFDiUqikvbEOB7wPPsjIsu73xVBUo538EEtmJvlUfw3iWAYgJmQ7F1xDgSZs','STEAM_0:0:79365384','2018-04-20 15:03:14'),('76561198187652686_aRYsoIFd3PxGn8GUgAO5uhEctr2cy2k9ua20xg0cjCGjAtPdq2iVnj6z6kEhS50r2sfMBi9u0pzuHyEL04DAbJV7CzwaFvy55rnE','STEAM_0:0:113693479','2018-05-15 05:04:01'),('76561198079356720_npBCQpQ7BYhfsZzv4LQVC0xFJhOKzHaM944jwMtEPPhz7Vq7pha4GW1KFlNEiX2lBE95h9tlc49vH6cvVEdoKqvhooAV7Vk8M9E5','STEAM_0:0:59545496','2018-05-19 21:41:04'),('76561198176636086_Iza92CEY3rsO9vVuEyzbKCL0et8N6ye4WdCdWvR9GOkRYpKxnqd5tVAqCjH8vFyLhEBBlzbaqXA2V7Z1bRobzMz2SHY7ZrJyyp9p','STEAM_0:0:108185179','2018-04-30 14:57:13'),('76561198181233165_linFplRqpXzqujsL4PuGsBvx6sk6MqRHHhPaOl5ter1PJo6GRKa2ga1znVg5JOE1dM0j8pYqdzEnVA5B3ytAAElfnlROefIFi9pg','STEAM_0:1:110483718','2018-05-19 21:28:33'),('76561198086546217_wy4AYSAjh4SLB2B0BHhtZwe9Y7IZtRgnuP2JP2zM4I5oL6bYAeptCrJZG4mUyYrDoDX9UR3kv7N7rCZc3K62D46WDjC72fY5G2qj','STEAM_0:1:63140244','2018-05-18 12:15:21'),('76561198273027931_nzVL74uWIeLkMd6iFc22oPqnDBWDeBi5YD6DBEpZ2qR19mjLiee7Yzvd1zNbQ4jJhvr5zEfygLpiaz6JHoDtnykYELpAp8UNjAOJ','STEAM_0:1:156381101','2018-04-21 18:42:04'),('76561198057169753_nyN4qjB4vBcNQd9XY6KSJfgZSjZBJuatM4uRmMMsrA5PVZuXlJFLDJL8xF9C8zzKem6yliQJZbBqPBVdfvOLm1QqJ5ZJNflDARqe','STEAM_0:1:48452012','2018-04-23 12:49:56'),('76561198362697847_Fu7SGYgIyAKhXgZAK37uyZtOSGgZExwHG4eLHd64Y727J3IdJCEhbZcd4IxjVuDnnoRqCgEy3NCRIMUH8VcdxGn2I5nSk6NVwicY','STEAM_0:1:201216059','2018-04-21 10:43:59'),('76561198062259401_BhjB2xnJ0iywzXDGB9XKfrMhPDhjf1w53Ybvit3mQdjYK40W2zAPXelwCvk75Ij79vMxEcwzBcE5WtbpQibBaRkQL1UnVbOkD8Lk','STEAM_0:1:50996836','2018-05-19 13:29:09'),('76561198165668583_OOuVracEwaNh74oteqp7lZCrLGZLkVzvsY19XM9nDbm6LP2Lu24k6aWPW8xYB59MQ88RcW6qOSneGFgnGyLZFizyqpMJCoF4mLpw','STEAM_0:1:102701427','2018-05-19 14:25:49'),('76561198347705079_jWayogAJEYGmgj7tPQQcjtImOCzzVOS9zUUVkNUDI2Pwz3nManednHxg1naJHAPOwBJbGv6A4iLdZ40OsOANxIoyeG4FIQzlUB3Y','STEAM_0:1:193719675','2018-05-01 21:12:25'),('76561198295271496_bf0nUO51wstqy0iJ3LPgccd1ioRSRYc5hRrPt4lf9INvSHCz5E3sHjYgjFfKF9S0fJlgmRY5mYSSvnUFbssea5qh8LH3GJmpXRnM','STEAM_0:0:167502884','2018-05-15 14:43:22'),('76561198224485076_GjAt6NNcwtIptOMo2ZOYOrMIjOmrSgtzPyW0LLKCMnwbdoUfkLjZnrDbRqOC8vsPqGPP9p4w4L7sUQ8YUPYYCKYFIiAjN3Vg0XUZ','STEAM_0:0:132109674','2018-05-10 21:18:28'),('76561198256349525_kXaLrdpoww2vuPatdgeh26caC2j6KNK3iXNot8R3aSuk6YbqXC9JW2kma0zPf0FhQUPAk7aLKZYtFlLMHyqU7wiYcjVQwsxvipmZ','STEAM_0:1:148041898','2018-04-30 11:18:24'),('76561198297992710_yEaPg6Ie1zF87cXDaOJvNYC1UA0E3FvlfYpEe5sY2DKYVGYGiZDgqcQudk6boLEN9D6OHIIfDWDf3uNRppXX5VpA5KZpc9WYgXoy','STEAM_0:0:168863491','2018-04-26 12:37:59'),('76561198304362928_nyeuSDmJYNYrgl6aGSVnZ14cvaJbz4iYMv6frrskSJBoZxiFGdiffg5KB53Y1Hc2Fbukx1DxYAzAYnjJXM8V9sSVwhb0wRomRJcx','STEAM_0:0:172048600','2018-05-07 18:13:53'),('76561198213939411_UYBIeM9PNrL8pxKs2593ANLuVCa6De5ZBSSE0rAGGrs4PmPfhPbLN9NS1vwSCog69BFOg5jQh0avj17nrqukJ5yHLc36En4qoYpM','STEAM_0:1:126836841','2018-05-20 10:18:43'),('76561198199554451_rIQcmPdOUgHbLHBP4Y7mz5YDUGgmI8szVnDzAM4p5xPAQLUHVZcUoPfxIFhCeaBflXY4dgozmlug0oXrG2wt4NuOIKp21W7lmbB0','STEAM_0:1:119644361','2018-05-20 10:08:30'),('76561198210630408_GiCDZJLa9ZNyOIIi5W3VvOvxwAbf4K5lkE70JDpKcEWNwRsNJyUkHCLstusvUCX9d8tVJKsAFe06sCwpGrojrLg1eaEuKoOrvMgY','STEAM_0:0:125182340','2018-04-30 07:31:39'),('76561198010691991_YCaMg1Vo7HSv0oZMtxYKUKEzxo56MWkYxUvY3BmVgQ05IjpOVjd5gIuGbSvEbEYZasq6GsrxBJ5mHxbnbVfwdCAZ6NmtsPhv13kK','STEAM_0:1:25213131','2018-05-20 11:51:57'),('76561198326365555_lBWS9epIsijQYpQrfNhZcwVYSPgFGUYsZPJNztdledDu3nOxgcwMwAZWi2u57CPL9PRqWlCm6pu8I3MWSXoFXK9dYUcZx1iUXSQ8','STEAM_0:1:183049913','2018-05-05 17:05:00'),('76561198296858547_K6m9ddCnjrtvrhmcdrtXZiY0G82ZwhzYHWKwFbDCqZD8SfiNoMir2qfwJfcreeOwaSIKQcPFg2Bsk40ZaX82UJ0Qhp3xEozDpy0G','STEAM_0:1:168296409','2018-05-18 18:09:21'),('76561198117454698_i8grESLoubHcAa838HFyQCtdVRI4lm2ebqrmiuIkSC3q6IFiyk2CC7DmdkZiYDpYmR9Gxjv1943YDV6kYxF4kwVVv6tBBfwd7fuY','STEAM_0:0:78594485','2018-05-18 20:21:30'),('76561198239689426_DyMMtRNq5xynJtGIflksSj4v9d3QqPxYDAcfu2j146DdLQZVhoiiXOf395szs4pVgYEi0aXnWrf17NLmGs7VcWxkzUYkUUeUOlGV','STEAM_0:0:139711849','2018-05-20 12:14:25'),('76561198038491207_o55Z4EdepNAP2wBGeZG9N00WjlYnwcdypSuYAPzI1FszCWD2sU8kUJFgk0GV2dZn6uKj0Y1XZRtNYUsKaBRxEyVXsatqxWazFQ8N','STEAM_0:1:39112739','2018-04-22 17:20:38'),('76561198195100261_N39Xt99YewV1oYI1SLN24718BMIhAABAwkr6ZhdFuZwrkK9yB83052PqXm7pRYzRIBM99awaH2YcaHnZ55wj0zsY1vLKAB6QIMZ1','STEAM_0:1:117417266','2018-05-09 13:21:39'),('76561198361132950_ori9e8yDaddgBU8UNmsqHvIlLnyesEMgztgXcNzgCyYwYENJ2yyEPHHL3RV8nDCX97N0St6YlBwp2J5A0vbikxRoyxD2z8QvtCqz','STEAM_0:0:200433611','2018-05-07 12:49:53'),('76561198200650810_82vpoN3G4KUh5WJADbmVNUh216JCXphCO6zpbLlvfiMA3uNJt2YGmxKYsDA2OYBMQixg1OonZvKDY1Zb6pcqq7q5mh2NnXCjelEk','STEAM_0:0:120192541','2018-05-13 13:31:25'),('76561198439082606_vBieYL6l1FrH0f1HFWWfItWpyJyphHhmuNnMgjxnYNwaAYcq69x6ROkgHVKk1VRZivNcXYVfZ3tNIFVtssZVNrGsZB68wHpsqM72','STEAM_0:0:239408439','2018-05-11 16:53:23'),('76561198823124560_4VJMl30wriQdx6SRcAIs4eROgEJCIbc7GzC7W40yRCXJzkSs3iwYuJtt7kAO8crsI9NwsX7G5paz0YYepib523CViLXrib50HYYE','STEAM_0:0:431429416','2018-04-23 15:12:02'),('76561198364337763_fHIflfL3aMdkaz3W5H02nd7WkYhBFJrpu9PvHMQ6dkuahMyXYcV2CyO1FrSxdJeAcCOctKQLsdpS8CQJ913mQ2SzmFUm8byBv5ns','STEAM_0:1:202036017','2018-05-19 23:09:29'),('76561198359207712_wHQF8PZYRoh8YtXX3xZvYLhO8y0MyshkRCyLiGoHaUi5EC7j4YQM1Noj8cIbmMyI6H3MM7yYFSgJPHBRCPOlWfxZ2FYMKlldKGbp','STEAM_0:0:199470992','2018-05-03 12:33:48'),('76561198181634882_CD0iPZaDqGWj1cF8Vk98qVvgID5OfpKviFSzPiMJeL0Ht56W1dLjhYQkJJHr1wFhGBhcpB1UeEJWVRMvAeegHLK2FizwIcyyLZjA','STEAM_0:0:110684577','2018-05-15 08:44:50'),('76561198828756289_rVzFMejLDoy2xYdc6fO18M06W6n0GKfD2WBVzGUJvKePMdC2MshVJUpkisYuVXEidsUA09AWdfsWOUyxpr3MvNyXU5aF15hqpYfo','STEAM_0:1:434245280','2018-05-06 13:39:23'),('76561198331217557_vuCZIevbQQEaiphlZOSNAs6w8FH9hWeitLIhIcUNrdB1iKgayXwBiheInUB9UZ3ba7YqVtYx8yXmSuf3ahYNSz7gXwbVPGdE0nz9','STEAM_0:1:185475914','2018-04-24 13:38:59'),('76561198397959030_PfOkcpEU2tXbKyLRR5ooMCk8LRN1LbSHXOqJu9zPlYL5lLGC7tOygiafzFlQgDudNGcDbw8zeL3s72VuIaKPcNuvzgmYLlo2OQ6u','STEAM_0:0:218846651','2018-05-19 19:03:15'),('76561198439082606_5jn5QkSyhHuWoA9WVuYyF2qtWWLn15YDQUgg930sq6hiBI3DhViCaKkO56jSWUzu4vSQof8rJooXekoNj7iUNkElEOouxG0jm9zc','STEAM_0:0:239408439','2018-04-24 15:29:37'),('76561198346435176_uhZSnK6aeluCnAWiILGkiIuxQcVOkFF5JAFe5jcYts7pnI5tYWandKuydDkOECkMUt1QXQZ2vXKAc3j4d6phvWtAZJDkXJmV9MDX','STEAM_0:0:193084724','2018-05-19 23:31:54'),('76561198171739657_pPJVK4oIhbnZgyvynr3wJiPkNM6aoyqjxwqzUv4Kdm24He8SH1b8xr4nJiq0APnmERj9x9oeQQ59glaJYCZKQ5dfPthG5wOmxamm','STEAM_0:1:105736964','2018-05-13 08:26:37'),('76561198383633813_gIvk5msfDViqcaYitxqpKO1F9CckQYRnfpD6g4Eq12YsSBiu5z1pOtZsn5hoYiguhuZhWBybJd8P3fQH2lW9LWGsLLuXq0VkYcmM','STEAM_0:1:211684042','2018-05-11 18:29:28'),('76561198296858547_3xK8YAPFhMvgtdSkMvu19c9l9hUENAfX2QEv7GOD81Ywg0Fi2QsCuDYJRlwURN0vY5uPMXfeduMdNSshcC8c3Knj8SV04YuSN6bK','STEAM_0:1:168296409','2018-05-13 12:07:05'),('76561198023398477_uvfSDSmi26NUS6XPO76cUy7LpY8mnXw2kYsDag4i3z2dvhvZYlf8Em1RFKhYszD8SOXwm8XV5rlpkslJQ2esjReG1P3shcbW5Lfy','STEAM_0:1:31566374','2018-05-20 11:35:28'),('76561198171739657_32kMGLLhrZZbFXhB1i1aQHGLLC7MQraSYurQKgtYiXqAAe3gUP260B0KY6M4fKDQXcLsMGMZkbboSsQnuaWoOrdNbn5MhQUsHIIF','STEAM_0:1:105736964','2018-05-19 20:28:24'),('76561198142146196_GoIGwtibuEbuRyvLwfq8tm5rRLAzr6kazzXa0hhZOdqKMih5SWXwDtva9PDv10V6vLm6EZYDoVdpk2owBU1GYcxD9LYyMyQNCMI6','STEAM_0:0:90940234','2018-05-20 07:34:15'),('76561198313624304_YS4bZXhBm87NmlfMDdYpfglFLGSOiGPX6Z0xYtQqg7Rh3hzBL65eBWouNajJXQhr33Us0fdm36mRLsM13WBlOOA4FcLw4Vqu51pS','STEAM_0:0:176679288','2018-05-01 12:32:13'),('76561198189475810_zJr0a9dtI0ekQnrrhp1YFh1YV7jqqKccSAUz1rEHtAC84cWoKYqAiVOW3U7f7PEzPL8Sjt7FPAvjVqkls9jXu6SLrJ1lBWVCrnzC','STEAM_0:0:114605041','2018-05-12 12:21:16'),('76561198321659485_Gmt8hVi2G1ZXDgW38vkmJ03i5RZauFCv0Ri0XfNX4aJGGIUB4JQFSseJWYcFWFKZpli1R4Ctb042Q5qqilRqYcYKaMR6AA3akZWA','STEAM_0:1:180696878','2018-05-08 17:55:53'),('76561198372439398_mqzenegKRu7V8kUqSjUuo41ndME8iwFxBYBH0qnrcjP8ZUcVgvWRNqY8wXYfo4QUN5EQDDYMmorNll1m5l68IQRPNcfIwIFD2PLL','STEAM_0:0:206086835','2018-05-20 10:19:15'),('76561198812578816_EuSvdqQops16AYCm42cLYbkjzU86MqoNvyZ1qgcAo7ymbmYcMEmp4VkLAjs6ONNQJKg6Gj3v4tNdaC7fM2Iq4DF0N9xORyUG5p3n','STEAM_0:0:426156544','2018-05-17 19:17:29'),('76561198296024801_2lpJzRYOw1jmCG7GlWjRmCr3c62RX0D0q9DBRUXbv0CrPbUOlvb5ShriMqnye2uroeD0ViqxbytGF8uND8alqnMK1suEWcihxD1Y','STEAM_0:1:167879536','2018-05-10 18:59:11'),('76561198217984077_1EVQ4xq2AWStpK03Axo5VV3UVJOrhMIwISckwIicSaPMIPYlAVL7DWPrWrQo61Egsim6llAo8uw9lWVsMUgIp5WCciBekzyEnbRV','STEAM_0:1:128859174','2018-05-18 17:35:58'),('76561197964568402_10F5PZBGlK6pypDDFNN7p5OZG5g24JQ1G9CL425DpJMdUPxhNyIvFBJ0Kvg52Wyec95g7EnoxBSmsYhnzdK1ApUUw4Qqh7AOErS3','STEAM_0:0:2151337','2018-05-19 16:38:44'),('76561198073523074_5Am6or8kgx2B7PtmwahMmaNE5KSdvyvsR7NRCwvlcYoYJxCP44We0iJhjrlbamydRrIB4ftFLlFzHgbF7E1ZOgH928wYcfEQJ4OR','STEAM_0:0:56628673','2018-05-19 17:50:07'),('76561198128070675_503zbE1ABUHOnzPckx8LFzdEok0y36GUYkQExWJtPczmy5uhrh21wrskQgaLq6j3rqYXN87VkgbGt2fZmYfCxkFCR0DZNMmjYB4U','STEAM_0:1:83902473','2018-04-24 16:03:20'),('76561198357545872_DrFjm03AjButZLrv1cZwuV2J9SeNFFzKoZhsbDiC7YLh37rXap6rHa0aHJ46EZbXjRMiIgURQHJ28FdxlzWLCNSe2gXeZpx0cbbd','STEAM_0:0:198640072','2018-05-05 17:26:35'),('76561198284331575_WGxeS73dbgWZXNSeKsQQA167zc94cUYfsRA460AC7Yx6JsYv1wAbqrxrFp44CP3o2Zay96lVzb8LpUo8FG2XNvBwhw1s1IA5ggCI','STEAM_0:1:162032923','2018-04-22 17:32:41'),('76561198191563919_uX7WMgBhmgFjWyZai1x4SlheEQE3W6q2UnuOxw4gkmZOwCvOm864VX5QhXfF2se7Xnvtla2F8k4dX1W45XDi9hRFyzzR6A1IoKLE','STEAM_0:1:115649095','2018-04-28 11:31:08'),('76561198268123907_Oki97EjBi158Y3v0XPhG0xgJprteHXH561QKm524G4yRYJlnz2ZQNeWoU5DbvJXcqr82czJ0Kio2YF61rekLxP16zvdkLdhwV5PJ','STEAM_0:1:153929089','2018-05-07 18:58:58'),('76561198331862463_0kqnDYzN15jtwVfaWMrnR1hx2aQVNICksz6cltRA5Zja31y1exyxtaGUB8KpKcKtnYYHIEk7Ft9tK09tMH1Z6koIexYWNxnYCHxJ','STEAM_0:1:185798367','2018-05-02 14:02:07'),('76561198815112709_DMFJHMHBdZa0weybUQbljjyjMYsn1iHaof4ggny6h8f57wMUfxJGABOv3chuqbwwkPQE6KOoxQUGPaPsNbhL7BJzlvtPaXAOnsw9','STEAM_0:1:427423490','2018-05-06 16:23:08'),('76561197986603667_l9Xn0bgNLgFqg7xu3Vmi6HbiLhJatGYOf04JjBf76JDlqaHVvPREbgjEBcOFIjojgtzC9YHoybYHa63AnkAUzcYP5ZpkkEbx65gE','STEAM_0:1:13168969','2018-05-02 21:00:45'),('76561198190751214_2pCKtn81mYKnvRkztN2Yb0POOWKlXubmqdZxM55gKQYCurweVxltB7bDYgQJ9IZGqV2MD6wyZtQRExl2ka7p6lOzfuY9E4Ux96Uu','STEAM_0:0:115242743','2018-05-11 11:12:05'),('76561198239467358_1XsbNma6UNWg8f0wCxDio7KCj5W4nQFBsAv9ArR06sM0WXhKHFB3ioSgF8n4hhAAjtjigadn4LApP1uUWBLPzOG7MkGq3dFCMYwi','STEAM_0:0:139600815','2018-05-18 13:27:51'),('76561198077276337_Vk0vActlqQ9tE4QUfWHsBUP6vPgv98a9cHmWWYaNrJfdtCtQe2OWgVReJ3iWQmIPxSRIABdN3hQDBvu2Ik5da4nauOmUymjNZnYl','STEAM_0:1:58505304','2018-05-13 09:46:52'),('76561198258383126_Z7zv2NX7fAPYICaKqJOm93yu6eAO18pU67Z5qp4s8y2iRPSI7PmLmQo8n1UfXIb0O83t1eVxyfcadxlgcDLljUJ0InlpL66LsIWw','STEAM_0:0:149058699','2018-05-20 12:35:55'),('76561198334550787_9Mckfq4Rtqcgu48YXntK0pYqiRnY5uFLt6zA40fbkul3KLKjeKoXwCyZm91e81AWLs4Y3YqGO0snsm7PNQYHlh2mf626YfVwr1JX','STEAM_0:1:187142529','2018-05-16 18:51:05'),('76561198241755016_1y0VGM6bL4lyuUu31wYsHBfc00CBFC73SYV6iowcYBSGXOI4pq6UvwfhQOmcLCC8O6QWBoxIiOEq11bOMEXn8OpHLBCUbdP67vDn','STEAM_0:0:140744644','2018-05-09 01:04:41'),('76561198165668583_fKuH55opSbmJnVEAi4Gw7XYPpBPBoGmJaYUfzvqdyeNNgZyMFwNWfl96KYr6YtLWqLh0R0NOoYPUVurYObXv4Vag98cw5BskSfG6','STEAM_0:1:102701427','2018-05-08 13:14:02'),('76561197998395426_YsmhHG1sj6uI5JlltsmSF1ymZgGS9iUOUUYPpmoAmtcQs1Ywwbg1ZfylJ6Wrle66Vbx7zAgWS7gYYGsNOsCPlpmdF2NDGpSxDge7','STEAM_0:0:19064849','2018-05-11 16:17:38'),('76561198404676336_exwDoQWNZKV7IZnrk1kG2J8L9uFfv3IEs2tUxF24LoXAdUV28nnV1qbIdlFlRqaYsnxfqrbQOWIrGHY89XmS7qUsNCaieFzaLqCZ','STEAM_0:0:222205304','2018-05-04 19:09:40'),('76561198023939845_b35cwyXNeGWzFDHYOiy710d8Eb2oKDxiyyYJoCYrP7sWvcvPVHO6WqNL0lrIKNxsVHZUAlCvmXffIuCYZ5cox5pXxsxLWWx5YAiS','STEAM_0:1:31837058','2018-05-16 11:41:18'),('76561198346435176_2oaxZBENUMXqPpoEKcbKMOlPsDn28nJIq6c5rY2kwWYcqqn1bR1fU7znfMxOe3A27Se1IX19O56srbUpj082RUSZYW7dKlJX4cVI','STEAM_0:0:193084724','2018-05-20 10:12:55'),('76561198298406383_1Lu3GoAxItxytzbhNC6IY1jmSjmFCvOU6BxhkV8zov04riLLUoNwSPrBMbVkdcGfPM7wcQNVvKzwYKO1zQ5D2SWM3bhufm5ziDqc','STEAM_0:1:169070327','2018-05-20 06:15:00'),('76561198086514369_ESJc6mguju7FYZoRiAerS2Rbs9B9BOs6e38KQQPYduEurKDIMFCk4Wcpe7j2uX5yQJoKKdh92pWz6ibQv6QdZyqt30picfLYpiuR','STEAM_0:1:63124320','2018-04-24 17:36:11'),('76561198161705740_4YqgZOpHF0EgQnitEYwc3gcyYw7HkHWikZ2ROxVY3XY7FNHtLnjNmYYfizfudYUoA8wizpxy5CGadJRFojGg3vQLLuRwVre9AYlM','STEAM_0:0:100720006','2018-04-22 08:30:55'),('76561198361132950_v671ljHdY2VMRoimtVZvqepmxGLZAbOUbDsBNewj7pdUdetefq5B2IDPtWoyVphujYMR4G3A03R9PCW8EAZ5LkwYD9eXqD66CDRG','STEAM_0:0:200433611','2018-05-06 18:07:40'),('76561198263827670_LW6jiKICBzcgOy9jSxm9gLdC14GkACIRyuKGU4psrgXAwnR6xNNJmjaHOrILVtAi9OYHkYFMKoKluekvP6rz0Epm8hROSvLZY9wY','STEAM_0:0:151780971','2018-04-23 19:19:18'),('76561198291704329_pR3QkFoEn4DsthRvmK8pZbqYr2EQyc2lx9wAsMa8f2B7ecCkxkR4FwmnrtHlPzj8rYZudydY0CakaQ3a0Y5KcPHhXuIMVAY0NiSI','STEAM_0:1:165719300','2018-05-12 12:36:14'),('76561198438098539_K5UbqJSe2M5DvvYXjBoVELIhgSYBIJ4sXO5pqAblmxb646c38kOsat458mCBirgtpYkSdEvb3zwzRZGYb3DXJOml94c2scvs3btU','STEAM_0:1:238916405','2018-04-25 07:44:58'),('76561198279805633_dD8dYC0UEbczJ4rnP5bwWN5VjLXNGoaWzyjV3oJfOvqHSm5V0CQZSLASY6U2mUHhJLeNaknGvD4txYUivELeJQzBwOa08QYF2vA6','STEAM_0:1:159769952','2018-05-04 19:26:56'),('76561198253692462_ewFp4YO5LKDdWX0iiO8xf79YryZslKH5ZvYjHeCdPMkNeigW44n1O5YJe2HSYAW9iaGBIYNrHPyzIuOBVHyyEX4dBlpxdHlyc5X2','STEAM_0:0:146713367','2018-05-19 10:26:19'),('76561198194015777_5JjPGYVf4H6CgNmljR88ANpKMW4sDLHzGA2cbFpSuYzXdPzCwGSMbEnYA2fJQl1lqPGxzGCKCGwHf5Jbgho68e4F1KsJfcRCAXxW','STEAM_0:1:116875024','2018-04-25 23:20:17'),('76561198313216837_ViErPgBAFiv8xEH6ZcrU0WaGagPGKhybChS9zY0rWlJuh0JSVNOVchvWIbb6zEep4h3xlMrebkSO6gwcexp12WE4z5VPvCMiLV2b','STEAM_0:1:176475554','2018-05-08 11:22:22'),('76561198154656941_cvPoj559fOSWoYY2LWmeOXFy581NRQxLBQqfCMFUoo0se9P9goLLq0oPU8bKF9uYCzZfOkYyxVeVfLJXrKssV7foFBudSgyODdCW','STEAM_0:1:97195606','2018-04-25 20:58:37'),('76561198120969119_bSLEi91Yri0LO3mSQK6BVWfG2VYJYMdqQ5gevXZ2MR5BtRrBXkxt8AJbPdnmVXZPaDDjlPN4bKC4mBiVfGDRa6gyhxSYxFvQ6cky','STEAM_0:1:80351695','2018-04-21 08:59:03'),('76561198835867751_B5ZFstHQ0AJcKKQ0uLHELqcOP3hrbMi15jIXpKhq3GDefmzmvfxyDDZ5M0JOu40YpYAGgCSFwhzZ4MzdVOpZb0q2JeeL4ktyuhNN','STEAM_0:1:437801011','2018-05-18 14:37:30'),('76561198341363528_n27wC1gZZ1kCJYulHlCMIqjtxssRdxOih1dvpUdh2xOIbYfbYG8ztrHBHkjRRRUG19ytIPq46DXDbZoytYUMluerNrcMerfG0Uo9','STEAM_0:0:190548900','2018-05-17 09:46:12'),('76561198118996496_dozN7a3njZ8bAwrBEdF8E6j8EszO3Ol0gHYXcYKVuvfPv8dVrvDFxeQyHSPBtwfNNIG2SbLyxUMVcHKAPexQRNAHNyonmJ7yWVSN','STEAM_0:0:79365384','2018-05-20 09:04:18'),('76561198823124560_m0gWxYUq6Bh7ckm4OtZaeI21RrJSGhG7eswiHzvOk0g0trSF035XVye0rnKrOVEQJDNYK7xVhR1q64MOG6aQiDvGhAbBo9h8ZiRP','STEAM_0:0:431429416','2018-04-30 14:52:05'),('76561198187006433_mJQcufu6b0GdUgUFK0ZvxBLYwS5S89yzKY0AiHUREDnRwQY0C2Rl7ywgUXBW45iF9YBbmcp5ibM4vvK3ncpHJY77hPHl2eBQmhXK','STEAM_0:1:113370352','2018-05-02 15:43:19'),('76561198067186008_8fkXw8dXnNeA0pKWxA55LmNVa8cK1AwowpRateL3kQ7sWPBsjPk4nKoO5AYyiwLAIF7kbjbCvfU3HUOKaYUdl2j1GUlYsSfi14NI','STEAM_0:0:53460140','2018-05-08 18:18:00'),('76561198253489511_CZUkHmhhGeJ2BShiZQvCp0qZdA14m1YjUbyrVs78V4KV4M1YkxK3YxGK7xpQ8CgeMguum9ggk2y3PXNgE8SWPI8tmN1MeKLsPwrp','STEAM_0:1:146611891','2018-05-16 19:04:47'),('76561198402929927_VobnllJU8zDLo74rtWnSAUJ2WqlelPYB9t8KY97zH4uV9283XecUAjN7HtHIYDe9g9hKwe9QgSQgzsIHHbCuNy9wQi98YNKi8VvL','STEAM_0:1:221332099','2018-05-17 04:56:14'),('76561198250663796_zEYMk3EFYb0bUfjWXtvCQ1DVqxa5J8QGgAWWsXVLA8VuLAYXsSvdUcx4XBmCCAUNgA9OELUzjPzL486XOLgRgBWQcNUpFgDd9cX4','STEAM_0:0:145199034','2018-05-20 11:03:13'),('76561198321659485_L7bowrNBgBRYYg6ZngSIhp4PNHZNLdJOYswGzyUCGEs02Et6NjNBmw5v84z7y09oG9pyw4ZA576IasZfYyPbBqcbMgv7CM7z3v1k','STEAM_0:1:180696878','2018-05-04 18:29:25'),('76561198382391871_GsUeb7bBYyDY4y1jjkMDlMahsuW9A2DdMwkxZ2iD4hRRKcwZOBltDxJkAyKWmhF88ZPeYhCeDvEJovhjeqn3FBQYJdmhcIB0gFLM','STEAM_0:1:211063071','2018-05-04 14:32:11'),('76561198802282405_u63u7JWQOMUonPcpSEhwOHA9wzeUtfqg3DHLIWcvu0oS8BchhlxjxoeOiecmsCOoYdHIqQY6bE3JYLKGWheOGHQ9l7ia8XGuIdJr','STEAM_0:1:421008338','2018-05-04 14:20:21'),('76561198304208837_kzYJLP7zL9I8PYrims7Qnr6QirWgRj59b9RALteJ5vXXWYERc7hknejR4nBwGSunsPfS6bk2rAzbh3GWIX4KXYW0DNY2f91sG6O6','STEAM_0:1:171971554','2018-05-06 05:14:09'),('76561198368711407_ivA4jYp00FkyeVqy96RWn3Pczt1mhE7y8ddy4yskSWslK4sI8ywehYkDxfCOYlAuc5m8P6xGqPcRlN7i2qs2sIJwbQXOqm8asjG8','STEAM_0:1:204222839','2018-05-07 09:07:05'),('76561198332461158_qW02YVradD0MYweYzuA6ifnnCJijrd0x69uur8UXc2iJ1gigHlgWe5B1yiVFM2LCc5tG9cUsYvBQLcZyYIzY3BPgzFxALqeaF092','STEAM_0:0:186097715','2018-04-22 17:27:17'),('76561198829944780_nKaZnBnwnNRZgX9RY82xnw3DmcUKQKcYe7mHs59ASKQFRIFnEr0YF8gacU1FD6CYNVumVi31xxDbScNQURg38hrEx10kfvacnQ1o','STEAM_0:0:434839526','2018-05-15 05:25:17'),('76561198242667984_jHJ5sAtCzt8nZwo8BQZrBpld8r5kBQMUMLhVx8GMJAlDfviRKJCp2xp9ZswwCL3jEE1QE8agmfDvgcOvzfxxfy68Mkh7Wx0FLGZ6','STEAM_0:0:141201128','2018-04-28 15:58:55'),('76561198020760427_4d1utsn5XVqxR2FP33K8duZltPY9UQARxiW7Hj3qamN6YVYtqZQB5FofauWoREt21CIuiAlRXe3jlmiA6JmNDu08DeLba6ZVJapk','STEAM_0:1:30247349','2018-04-20 23:43:19'),('76561198360404294_HfLPHbY3RBnRt1CWSh7oy6aiYQ6e27JeBVPwAjBntsDtcYW1KlLnIpW7PepNt8WPg3CJ5dM8HWQefQYCENY2YymP2Ei99RDLtQZm','STEAM_0:0:200069283','2018-05-09 10:19:45'),('76561198171497631_LlxXLG4FIktkpgVPbgsdjjLjaBwgIZysi05SeHRr1h0iaceiedtBnAyOObLjD8tCsHuUnfoqP5gccqByKdIYIjJkk3Pl0KJawVEe','STEAM_0:1:105615951','2018-05-03 15:04:53'),('76561198167671817_Fnb4xpYUaXLecqKXI6x1POngpRkdiUI25rriNqKSijGNIQPHOZwDWbSzQuNPxJDONbLnq3Krevj4i3655aZikqYrFhjonx8kbgZY','STEAM_0:1:103703044','2018-05-09 15:27:38'),('76561198082449312_Y4ZSVqu43gGmSXFxp0F4HuwYraV8YBfJp12AL81tWL7Ju8UVXM3b736557Ki3w1iCbqpLa9pd8PXl5jlYIWY48xkhxADgv1FYdrm','STEAM_0:0:61091792','2018-05-17 22:56:26'),('76561198260067532_1GtKn4DFgkC2sDYXe9oQhvFwrF7sHCncAYo7th1tt4WiYW8YRvrWyILn2eY7qulyqCntn76UcYq0nfPaZJQye0cu5BzAOzG49ilZ','STEAM_0:0:149900902','2018-05-18 17:13:08'),('76561198200650810_8x0Fv0804Irtn66boWNbCs3lsfrWix6Yrp2i0wnhuJFyka7b2M3ZKNWcZqe1Kjl1qPeFDDzbgAaZdkPaAiQc2jnie3veXudRFxpx','STEAM_0:0:120192541','2018-04-23 19:45:33'),('76561197996147655_wo7bWbWdCKks6Husnyq4ZhgaquQI0WEZ9paVjx9USEbsXYuqaMFvvuswQj0RX2C6mMNgKEsUp3maRFmDGPUm1vZndbEF8wI7EpXC','STEAM_0:1:17940963','2018-04-21 19:36:59'),('76561197964568402_Y41LuVU7Obgjy3AOMgmbACx45jMB2y3iYHghD0fcVBorJvcLNVFH3G9lpIqks9YtzjOMWVBGyDh4KN99Xw37jyuNnnuuzwbhbia4','STEAM_0:0:2151337','2018-05-03 19:30:46'),('76561198029629963_o8tZxMWHKfIBmAuwJP9rJZ3gQiWgzpjcS2BBGiOYZIxDKFcZPy9FtU813yY0P31FnKxSEDSPnuJs4ZcYwfPAkcolUViE0zeUZemw','STEAM_0:1:34682117','2018-05-20 10:19:27'),('76561198053247828_Cpy1A1iHWsgialQLaWCRbV7Wyp3CVXELWfNRrQiI6OJ5vMlezYR3MnwoFVxcSADUjKamgccE4ECvfuDrUblk5i1w28ZAXI9tPVeS','STEAM_0:0:46491050','2018-05-11 17:29:18'),('76561198261497270_YEeEZIQkCWOakuYbqluuOuGJywJA64XtIIkr9U4hYOLqQYGVOZEIfPGlFAyypBUVtgQO6eNquHxYBdwvK4dya8oMkxp05gHsJXym','STEAM_0:0:150615771','2018-05-19 20:14:27'),('76561198072105137_PNS7ffge6Qkkt8NZpxJ53FRakNc6aMaYfzLkPVZx3S79N4JRltCLzS3MBYtu3st3PcRSlspmFnLEl9Mkf0YX84zxeJKdlBnaHHNO','STEAM_0:1:55919704','2018-04-25 21:30:12'),('76561198171466194_eZx5MHqDRvMWYhvH45PcYgIMQWExHkEnHjYXHWpLxfuXySYtRdHxXASSqkNkBnEJ1YSQMYV3KOJsC31Z4e6sIDPC9AC3cE00zYH0','STEAM_0:0:105600233','2018-05-15 13:11:16'),('76561198239467358_OPt1c29Vui7HCbUXaAJ2RKywVu1h34B6KGSMYAxz2SFq8zOUalZ9wSfJgbKSEd1w0psQyejJKJt5zw3NAQY1jiokoydYlb2NiaY9','STEAM_0:0:139600815','2018-05-18 11:39:32'),('76561198289843433_j1162SS9n8GZK5Dk0RHMLQvE3Fe9MbtdGJY1mhL8KmuYP6iOA0oK3kVLIkDDdYHYDNrbFI3wMlcLsf4rE4cP5ixMn7RYdpxv3At0','STEAM_0:1:164788852','2018-05-09 18:10:39'),('76561198118886865_fyYV7VDB5ofyOhqjmy1J2jhrLGnB6xkC16tDIROXWWqOROmHbR6suYSNfPkVVAGRvmzKSVMVdaYS1xeZrKXjmNbNWMYR2gWK1fbE','STEAM_0:1:79310568','2018-05-20 06:49:31'),('76561198440742442_cYmEx9cJWttH5dIy1V6iajfRggFO4V0Chgxpc2hZg1pona3GJduSlFwjuDofXgPRfOfsPplVzfHjF4hDGDXDkdFLk8EQbqGQbi48','STEAM_0:0:240238357','2018-05-04 21:59:20'),('76561198170287193_gOyyetbGcZ0DWZYJeN7YCl0P7FNKPBUsPiJfYuMOUfLLdabLrBzOFYo8a8b6lrzbqZc8pL0B4fJDBjsoiCPjv8uKy2Opu3ekNJVZ','STEAM_0:1:105010732','2018-05-14 05:14:46'),('76561198346435176_a7N2VMCIzGidaVXYDax1fYG1aoDSVDIwGY24BgGGW3KANW9VFdmhgvxbqvY2nNyjkC7ozY1M070HIscuJduSQCbSNyMvSADNqtWN','STEAM_0:0:193084724','2018-04-30 22:21:55'),('76561198253858417_xxqr0mnOblFwwrFpPhAvJh4E5QLAlvUIlkuGAXM8WyCFW64b7RA8bIvZFGZsJBXOfGKjf2yvb5LZrFk7U3Rk80laY1mU6c8etrA1','STEAM_0:1:146796344','2018-05-19 13:10:45'),('76561198134290841_ajeAHqYupMumG5ql4x6ydlrkXjNKiFc2S8vh5YrV8xiNR3na41JhvnutbYotYzhnhCOnZeDlm0HgGOXCaWBC9cHxqtqtYljmPDnx','STEAM_0:1:87012556','2018-05-17 19:06:05'),('76561197997437521_H0Rm6aebhIpQQYl78xp5BH1YQUU33HJJ6raE6iQfopec3LU5hIeP7fUpeAotgQ6QAJfWwuN2wt0ligmOuYbM6QFvPjjprHKrFZqu','STEAM_0:1:18585896','2018-05-20 07:47:29'),('76561198313996802_HpZaWoGPFVpXQHVthqtIR7SuaGMbEwv9gnLX6AvRySVhlehbxmtYBZd0ILyZ5OvIhs8MN0BdPlwMlYYM1D0rKSkzRzuOiK2zHiMw','STEAM_0:0:176865537','2018-04-21 15:29:56'),('76561198812117235_rw1JtQyAQtrFXQkot6zxyv8UIfQ84WrQ8KM2CgYPvrX6rubpksh8ZVCOgR2WZtup3OWHtOYc2i6mgBvbuisv7lYRQFKCp3i1Disn','STEAM_0:1:425925753','2018-05-09 13:11:05'),('76561198351296388_Kc4uFBKPe8amiLdEYEC1ujd9S6vhWtS90aA61C7dmccxJnYGj4uXsuOWZX4KJS7dUIaAZEBlVr9RnV85csnR0Q5jyAdVlNbnSZru','STEAM_0:0:195515330','2018-05-06 14:55:36'),('76561198072703068_6RyJRb2NeYfhxIYJ0DF7ubiegjiQRGWYmCCNjNzxDlgj7GvJZlCMKqvKhk2Sc416M8RsZ9818QeD4w2Sq82epZnVk32xfgi6AE8D','STEAM_0:0:56218670','2018-05-19 20:09:05'),('76561198211621323_3yveW27VdaXUIIDgGo38Wr2F9iY2dR6uKD5nN2ZdxQCy6oRcI12SqO12JJFr09Ea2gLzmWFEEAnLaxxwWqppwBy4D2C2ifLZ4UCY','STEAM_0:1:125677797','2018-04-23 23:18:47'),('76561198834742735_aReIpeMQ5sHAV3k05vvOEbJFeUYAjBLOIY0M4hC1sYJ1ZYAUz1l0bMwqh5500LfPfJIqOcqlzYgPgvjXksQHgp4OkxU26Gs2fBrs','STEAM_0:1:437238503','2018-05-09 17:38:15'),('76561198442624065_DOMnsCxxGdYwLG920W7vdogUOhYYXgxcgJ37F4VANHuwYfvV6Q0Fp3JUKPFqpttoptjg9GRhxman1VAtU1FVFO1j4GxGre1SHSqQ','STEAM_0:1:241179168','2018-05-19 17:33:13'),('76561198357545872_MxI7e8nhtM2ZESgilAzNOaPwMpFLph62Pqq2w3n0EYtLbUszHVpSQbVgj5Jqh1fpYFnYgYm7gvv34lN24U9KxO1iaVcpdV6U00Yr','STEAM_0:0:198640072','2018-05-19 15:34:24'),('76561198037468597_aCKJo30xrl0jC7RSAbpK0S7mY5jwf4tyWyAiUssrFphiN0CaV8B4ItWebCO9aEDkm8ar8Ug30DSdsVMNwFwAEiuIbIVgUywK8NLC','STEAM_0:1:38601434','2018-05-19 11:06:21'),('76561198209430156_bjLk5PuC61HKSlDAevkoKlkAXMxagdhFo5lbOHjJdKoH471pgKimWrSXJui1fE2H8q1BkMf19I8nYD7dx0sWm4l9vY6wVBVax06I','STEAM_0:0:124582214','2018-05-02 14:05:11'),('76561198440742442_MK7jhQzFS5YX1H3NBILGRlkYYo1j01BgFr4sPu9D0fMWAYxojcnS1gjjPeYtSjJQa9WJofJC7ybRhmyRpSFtlrs2HCWYSKdK7q4R','STEAM_0:0:240238357','2018-05-20 10:21:58'),('76561198446400279_2ntg62QRVARhNy7pmRFZmYVocRWEXZVodORrDgbXcCfS2hBy5Gsll7PiCURQoVBZnQlzZLGuQFoGyVZvfGiDo7gRzBj643N7M3p8','STEAM_0:1:243067275','2018-05-15 15:48:04'),('76561198187652686_1j8XkHanH81aY7JfG8IwQcjY0nilLkh1l7r3zZeCtWe5iSvEGi4wFjArgxDa5uKS6hB4mSCwpOxNgmnXN4wgRbhJwA73QLgP5OZa','STEAM_0:0:113693479','2018-05-12 15:07:21'),('76561198111458346_AJgzdgpy2K8FCy0HNnLgXjPoiIPeQQtgR6LqsMZdBcl0Jqg0ZSNd8n7gugSlpyX2jhjXeQCKJ5BrLYY4YneglPqpyjb3s6i0VLhu','STEAM_0:0:75596309','2018-05-17 19:47:46'),('76561198078473531_YcPyCzQMJ3bUXESGmngrhlOwUZgeZ4gi2NFIM7y2Knb2jRr02jUgKFAv63nRglsdyuBbr2ZD7w7XvD1xpG9ADDOUvQQCjVF8raPx','STEAM_0:1:59103901','2018-05-15 09:27:11'),('76561198141721738_DuFLimOz3J3C6OvFKLUsoJXnulkmofHZkU40yReIkRPb7Lt3GhOS4MvNBONJDWQMddWa3nstfoCrqDPV9qUqyhZBi5qGFrJz6hhS','STEAM_0:0:90728005','2018-05-10 15:57:29'),('76561198094069129_hVRR7YR7R2s2UGSq2QJrZSn9aZ05Hj2xC9pQBfb92dKI4qFy5hmknrgMxzR4Uo1ZXuROZWcfEkQme8Ajy9cOQS3HmKVDxQnuExL6','STEAM_0:1:66901700','2018-05-13 19:02:22'),('76561197963569513_J3d1h4RLulN2AFzk4d9sX6cx41QCUzXqONHiKnzKByr1Q5on7is4AojLLODLrHWHbBz5KDYIqAxxXbyMwQWeN1bYPFYOxwmfYpci','STEAM_0:1:1651892','2018-05-20 12:04:44'),('76561198034490785_ofJhJJWcKBccgy8FQ5NUPPBwcAaHVwPfwSHrnkCoDPlYKU31gvxDGYF8e8S12QrrPAovYF7xdRDHB91nonEv9wU0b6vecIrYLBCB','STEAM_0:1:37112528','2018-05-15 19:05:36'),('76561198081762344_XJgwvzFdRfnWhepmJY7XuBRzK4RhzyDlFOO9oSvbGwIbO3PbrA6UVzR4GVcyGRZE0cgWlAULuoFehRKxUxcEIA2UdJ2gRC3LtIJQ','STEAM_0:0:60748308','2018-04-23 15:39:15'),('76561198217403372_RpWn1LBBaa0DYBCxQAs4rArbQXKG1yjbBxymaXBYyhpo0rBYg6pfopONNv1EfWdZkkCzOg6VmSQpZ6aUxH1njQiWzjcrqEshZrgQ','STEAM_0:0:128568822','2018-04-21 14:24:53'),('76561198171497631_yzJlsEQHc39II8j7K9ybeLVAZcUbIyiUBKzH9jJ6A3UJaQ3ukRVt0pBYrYtZthkUjoHHLJ5x5lo6EjigoNu7ziiAdtiAxWRDDkDb','STEAM_0:1:105615951','2018-05-09 04:55:26'),('76561198357545872_O02OgIockPVAbQIsYcnFpRUAqbco8rzrclOsHmoQAZuyx4NHuRKqDHlt7S4HYdrbDYP6roP5MDaZpVpb0G2t6rpuaZPOaVEkvegQ','STEAM_0:0:198640072','2018-04-30 17:57:54'),('76561198336003835_E2VDipxm9i01vUCOFjFynBQiQeLYNh42hfIYHILl4GEaYNuv1mlUta8201MBAV7wtBBJppSIX2o6rbdDY8FtO7UgItFlXQwc7abU','STEAM_0:1:187869053','2018-04-25 21:07:53'),('76561198127348474_Yyg8uqYHXEmXNwhJbLEERw1XLsr9zKVnExNrHjksQifIKB7oscKaUqc4lViJG2F8OQLZ7ZBhlsPVtihVbMDgVBGpVyi2OcXQhFLq','STEAM_0:0:83541373','2018-04-25 19:57:37'),('76561198815112709_1EsiSeXofjsqOOdqFPmQBqRu2A5hlL9XCZh2V4PDVmwmvbzQfVjD97Xumb2YKFgs3Xupac7afAS34UY0p37nQhVWY8zR69RagY8F','STEAM_0:1:427423490','2018-05-01 10:55:38'),('76561198321509613_XrUvYYGbgAousYeqUkElhadPAZazMyM5Od2dwE1ghRfDGph53vsRIisvJD6OLjWr1eByvmsGrC6ZSyzCiZu9kCp6R5QMLYPdHFDa','STEAM_0:1:180621942','2018-05-15 17:49:57'),('76561198128685821_zFej4ADfqzqYYdAC6kiLWDB2ODRFjUDKmDUIagacX9S6uYISQQNg2ulK2u9dMEISZCP1MPQAfFhA8QftuQoDCRaZIIMorkKgbXJl','STEAM_0:1:84210046','2018-05-10 12:22:05'),('76561198031899043_Nh8UcC7FMyj9z0DtnK0M9jRkWZMl3BaS2SNVFCOqk3FWppJI9z6PCddXxpUOIdeBRPjwPft3Ni3miaZWZRlbeHJtCftj23oRPPPZ','STEAM_0:1:35816657','2018-04-25 20:29:58'),('76561198094069129_mt5tgPFUS9Jc8qQtedRAWJEpjXUCAa3FOrKAqdoKBt8OwB8pJYfPPPPIIyxs7eQ13jDyKuYpAECWnM7XvonHZ0pGee5vYGG6F9iH','STEAM_0:1:66901700','2018-05-13 19:02:29'),('76561198188290601_Yi4QbahPRA4Pey3zz9n9NX21s7yZ3mCQCncKMUrkvWtIo0fMY1phqn4heHWFwwpI82o0hFu8e9t6iCQl1LmbI2vSi1Lj6aOdE6zL','STEAM_0:1:114012436','2018-05-16 18:40:16'),('76561198017761330_PNGpR07ox5iwkqwV9VmiHswkyq79mZ39Ic06s1vonIqqCkQLAkJM49JuGZ72wK4LFFG3KY17spCGsWxEUWN7uiHw3dGDoGYgC40V','STEAM_0:0:28747801','2018-05-08 13:06:55'),('76561198372948041_rpOvEAYsBeb2roOkyHGBcjnnxHccYj4GtVZpFenzx6YRyiZixE4yroedvN0aEoUmSR6YHwkSqOrF9fiWuuHpjafNCthWIHO2cnHO','STEAM_0:1:206341156','2018-04-28 15:31:41'),('76561198135046091_IOaHHf9c8X7w6NzVU7dwGEaoBKeLZJwIkZ2xVlrkohjbUH6x6L6YFYEhP5R7h3pOFFE7i0tkuoNjwKfeNEEyg7SjWefSsfxSqqe6','STEAM_0:1:87390181','2018-05-06 14:05:59'),('76561198189475810_aVfdu3vLRnGljIZeUORpl7QNvFDXheAwFcZwO16bL1w8LpGCbYQ4SEMUCxvYLQyBtGcmlH6MuqsMWr3fu7rsts0s3qp1WhqcNuvt','STEAM_0:0:114605041','2018-05-12 12:21:02'),('76561198168513543_rpCtfyyHg4Iepaa4xit10QQ1ixMXw64N4CCGkzH4RHvoRMy1EcERidBrKcSFnLXO8AEQWFs0iXcNBJAlaxAk1q4qIgzDUaC205Qv','STEAM_0:1:104123907','2018-05-17 11:31:14'),('76561198138758848_Hoz1vjxz1EdO3z20dfQMH8EbLmwGK8xweWtZsho7uKvPpnPQ2d8mIcFfNbDIvZq2VP7QLHt29eDxmk2WiQGBYV0uSg1LRVO88sCI','STEAM_0:0:89246560','2018-04-24 12:34:45'),('76561198392944686_0jXMRKGZHaa2cAJmM3Fib4LvY1kkeMY6ch0o5U8D7nmYJNYU1OzdkwhznklFvaisRC5BWUleeAmo68xL7xlovVcYZgwlUf6WJ8BA','STEAM_0:0:216339479','2018-05-04 07:37:03'),('76561198274130077_PKh0dYMVKtgpj5RPmExtdyoHEYHgfglUl2cqt5jOpnXOOkPQgcYMlskJ189mloHra4vUO1exnV1qjOM8s5tckVq3qYRxoL8QLRUN','STEAM_0:1:156932174','2018-04-27 06:45:43'),('76561198341418134_Oj1MJSimnmxI3yvqs4R6Wk4yvY8N6Xl8NmLwHebi5ZUJqgA0CQSozGbbFCbcphseJJ9rBwaEoytsE8WsqmBtALj9QZ3y6PbacSpb','STEAM_0:0:190576203','2018-05-08 17:51:14'),('76561198313216837_B8ZWewiBLQ5bzd0SjwVI39zVlX0ty2a3pUdVw8wzGZXpHEvBhP217HY9KSbMVYi8l6blz9Yhum14gWl6fU7xte9cGzdYgdY5ghpY','STEAM_0:1:176475554','2018-05-18 13:26:57'),('76561198278883501_5KAdnUXSH9ZOskC0Gw87IBlg4O8MYkB3l3MHxsQhhXko7HzmsOYl20IoH3WYNd5cx8X3JhvGGs4uuSC1bdpcjKDB3HaJrYbaXlH8','STEAM_0:1:159308886','2018-05-03 18:31:05'),('76561198202735447_YjcAlLAe2U5OVq3nH95wpz2qpRb9NZMrxeSQi7dtiN6OXUn4FMcb6miZkQOgJEQLvdhvHaQPXHPVSP0tvA2xgChxyEyWAIeq8ncK','STEAM_0:1:121234859','2018-05-16 17:17:17'),('76561198323988681_REx6gDbPvlu7wm9M1I703YbmDSi0L8D22o3ndbeL6KrzGJVcuCP24HUWOMjNr9Aat2gNpEwWIQNOVn4bL99Cli6kivWBAvm9n7St','STEAM_0:1:181861476','2018-05-05 21:37:00'),('76561198242610746_Ci0bPUxriSacI0wLQo2hk788gjYvWr5jsgeouJY0kV9eDenYLaYYdvglEDWcLWNuumubtX5YacPGYl41iCu3lsYangBfJNRug0Ok','STEAM_0:0:141172509','2018-05-19 07:31:48'),('76561198333259748_WFG1b2XnYVsrAXVp06U3XbdJAZHQNHGn85ujZoKUf6SZ8jxRfgWyBUKXyn5oypFPS55oCivDAoPfzEYbNSJJU19XySW83s0EW6Eu','STEAM_0:0:186497010','2018-04-26 13:55:58'),('76561198806060774_FhgReQaih53PVh5tYR9MJ9sAxlsYyG2YnVDfRmbFsNbYkvJcBz8e2WCx8XACEBx4WIi6ZyIEUUj6E1Esmw8loYa8CSGXW6xJHYd0','STEAM_0:0:422897523','2018-04-21 05:10:31'),('76561198092653012_2vpNvYEQbuXMLdH7YaXGM0ZtxA34MU6u2qejYjREIczpqKnmBMXhF2NK38ZiFXfY98riBRFjU1KfErk11xX3H4xKf5NsyYVlMIQP','STEAM_0:0:66193642','2018-05-01 16:19:50'),('76561198318625308_6W8SeOMqp3rndYAksJ6D9YsYKx5wDHigMX9cBcPspJXer3B3OWpwtRAoKZW2ViLOweOCFRGffby8Zg5Hv5Z77kSjiN6tAmYkbWYI','STEAM_0:0:179179790','2018-05-19 13:28:44'),('76561198106253272_3lXZzqRzUqEuLdoKnDs4xBarYxSOEsCYvhjzo7cagBMd1qHkvdMPwF15eh1OiBu5MYkv5VeNuDtxSCNz71mqXdBLGqYl8vZ3QnZI','STEAM_0:0:72993772','2018-05-15 20:25:57'),('76561198072703068_CEPWXXrKRQygHbkJOKExCbS4Mj7jHQpOuZ16Fv2dLnJPYzGpR26Adik8YY5vZiuGXzuon35fZJLtNyG2SFvNYxD9G62YKFE0Ssy4','STEAM_0:0:56218670','2018-04-28 15:35:34'),('76561198353759295_Q9wXLspfeJf2iZQVF3KjoEdfaD2F7eRJqquAJtwfl183LOz0qZjBAhbpwqajCLB4nr34JMf19crvMzallWh2Opy5iEY6RUx2dZCx','STEAM_0:1:196746783','2018-05-01 17:24:21'),('76561198291263469_2CerXYFe7fuf1BAnBBhpCsfyYMN2yMNQ3u4xxZys1gEpjv4JH4YEVpkA4Zz8rzABU8xbrKo6CKGcsQlaWqUJ9XipJdDE6wmHzU5F','STEAM_0:1:165498870','2018-05-01 19:38:36'),('76561198213478589_FF9rqglLpdG9AuhrHigEJPr7iqnEngckE843nuLoNASSfrJUoKjv2dzN7bpPieeKWQEiq5sQkY3sXZ0ENqgwUVMInVAyBJrQuBVd','STEAM_0:1:126606430','2018-05-18 15:03:30'),('76561198151473584_vVCM7uKRZ1Be4YcLo4DrILP2xR5g6E5uz8DzlGYAN8DfRueBo0wWP3VGd8xynlItPJdbdMI7DcnVSDYKtZIf4a6qfLvkB4yner10','STEAM_0:0:95603928','2018-05-19 21:03:03'),('76561198318625308_WQaEqnBBE82IDq7KIzY8xvr2bEEJHkLahSYtDqwY4rMXPsX2VFAAJhjs4v4mqLOjaHMtZrOfAYkwpUOZAwzE7UmXYSoYmA0EOnSa','STEAM_0:0:179179790','2018-05-14 14:30:45'),('76561198324316142_enyu7pMPGs4Mgy5edKcIzz3RYFCmMoNFV7253gppVAF5XyYg99gbHB44wlzVgEI6dUMqWmd3PisJOl62l2nlcnqARw5OewqrNE4a','STEAM_0:0:182025207','2018-04-20 19:07:15'),('76561198392944686_Xfs33R2F76imfngXnCbhzVXXhhumnji5DpY4o1UMrnDWliV7lPYNIRFm4VaYssdjzO4iRk0hMPqhfweM78Qin7zLu6izEchzZW0C','STEAM_0:0:216339479','2018-05-04 10:34:26'),('76561198374622891_fEeIxSK36I7KZ1YnExpIrSQOmyYcQWUFGRYlEyk6Rz8GYq6oDM3Ar3WKMGWDt9HJcW1U0UrpcIlk4UFu1szC3N4aQFoXGi9JB4xY','STEAM_0:1:207178581','2018-05-03 12:12:04'),('76561198313624304_0XitDR4vLQK1Ab8gnMfQZkuErr91UtUrgVZbYKUlByQEGwE61KhEQ10r4QaaRDliOJWlLoSAKtRRKFOoxdUUw1L79dh3f0RW2ycy','STEAM_0:0:176679288','2018-05-09 18:28:11'),('76561198045212240_BYEEc3ZIyU6KaQhhfmlllYt87uJ5i12mNzYFYod9RhZxIfGLqDfPXAKOvevcutO1uVNcsyzxlJC4ui9WnfvRVlsXnH4oKEfGobin','STEAM_0:0:42473256','2018-05-05 18:49:01'),('76561198073598738_Gv43FXz1nDy0GmCcBQtQLczPYpv2ehbvc17dWYnKts5pWxyGL9V4idxxWnMDHCqm7yD8qHFogKjnaI0ipYN1q5AcHq1AJAt17eu5','STEAM_0:0:56666505','2018-05-05 19:02:39'),('76561198379311435_QjYhJl9ZXtKEfLXJSVX6qd0cepzk6dSNZVjprPm9pW83BtfAp5FFXIR8DzP7EFfWSlDOqIb63v4yRDLyQDfpBJVH9moo9m51Gt4G','STEAM_0:1:209522853','2018-04-21 09:59:21'),('76561198402929927_X1hPHkBnNdp3eit6iA0zpuYcxMwVN78LpFNuFUhBYi4nNmYzbXLR721mYASXGcI6zRH0lhWLYtlaD7QuFmNcxx4SFSy5RArav8jO','STEAM_0:1:221332099','2018-05-03 05:50:28'),('76561198181233165_dy6XcwxDUZILxDZ3tuSt5kUoNUMVJBXN3p0UzYYJYsDUxUY3JEvr76lzbBSFwbvAWhpJYsDs2Pm0Veh6Om6yid7NqPYsDB7DRxcV','STEAM_0:1:110483718','2018-05-01 15:06:41'),('76561198170997075_DudOs7xelmnzghq6Bj7yab3KFKkcq2LxpBXYPd9yiYvA3C7DzppNaY0AkiHPSuiIzEGHQmUGDLYEJ8grQlcEDgQD3dDvV8o0j0Ox','STEAM_0:1:105365673','2018-05-08 16:02:35'),('76561198341796515_g3NSIterf3ne0walDqY1dB8zrkx81CNQADwJ8z4raAmFDeWOB1IYDxKd6SwNVkg2YbRpEhXbhwPbfgy3llwE1WKJMjZEFgR9oj90','STEAM_0:1:190765393','2018-05-18 14:07:49'),('76561198158617607_6rIk4nR29I20Gm5aIr9wJYOHS86hfneDFItIuSXWh0H1DkFkn3iqumf2L1iXee4kXdBBnY7uqACyvWduedusv3OYe89f7Ub2fHYA','STEAM_0:1:99175939','2018-04-23 14:24:57'),('76561197996715421_LResbJRxtUQ6x2gHbMVVuO5keNN0Wau41s4AYeUOgr3ZrZwR6y07O9RWANIH9oIZ0jf51eoQmg8HOffPtJ0VS1VmwNfoLXQ3PaM2','STEAM_0:1:18224846','2018-05-01 18:59:48'),('76561198195657486_n14oVLs1z2hhjPODE5NJcRiBFFSxPVogEbeU73JBRzA0K3dYyjvicFcXXtHyctFyHpXGEkEqGXad6fNou6izO9PE9CCF0tBMfLjR','STEAM_0:0:117695879','2018-05-01 22:06:51'),('76561198085061366_QdbrewBKWhJ0nbFW4I2MpW1zYC8DvMw5l9OoJsZexCnoFahesq9Anpp0Pva8D1nX9agVrxIQNcEfeHy1atNFBjR12Nblq5KYwKi3','STEAM_0:0:62397819','2018-05-20 09:26:44'),('76561198364337763_AB2tUR8JZWGdupvAey0SEXDxzvg3osXXXggXFV1mXyN8BhOLzkLpwYNEzggrorbPE8qliKri0ArvLK8luXqyS5MRqkpkJ270fUXq','STEAM_0:1:202036017','2018-05-14 12:52:20'),('76561198802429571_eHGqHNrdxqCQKcbmMtCXZ71nwoI9oN50gaLAHcU0GVVAuenrAnYtAvwt6VGnpjYhJwzGkvCkbSoyAEclCeAjttnJqRULlQa43CaZ','STEAM_0:1:421081921','2018-05-14 17:56:47'),('76561198117440622_oJq0gb5kcnanvXZK4l9F5bj4J7OkQRBwkiY5P6MppmRMe0WDvKYBvy7LBi5gPZ29ciqS2sIVVm5fbYxmPkqRpK2Jfx6HarqRElqY','STEAM_0:0:78587447','2018-05-03 22:35:19'),('76561198181233165_sR10sI3Q092wYqlqjpktMDY9Ext8u7sYHGcp3syxsA6XIliZYJGPiCqZSYrXieQglR8dtUp5QDUoxiR2a3IwbyVvvhL9WSFS3WyP','STEAM_0:1:110483718','2018-05-02 20:15:10'),('76561198245748756_PXn2qXrYeWdficK58DzDeYfOk2BKfr8v9chX3qxw5Pg8YQhlGkGMsBAK1YsEV4y3KYaOLrZ4X0D9IOx2ien2QYndgp48rldA4Ib4','STEAM_0:0:142741514','2018-05-02 03:30:19'),('76561198339725861_KhDdNBbBYQ4WxSxqB2kg4KYA5EfphVoFo2iQ76F2EE46OlLww9tNXLus5h7DSmDRa4e2sklpuwinuC5yQsYBRE5rdP5necWuYblf','STEAM_0:1:189730066','2018-04-26 21:17:54'),('76561197996715421_dWFp000f3UU2jBFEdQPUyzaAkWfuqHMpvYryXz746KKiau6w8A1Icndt2VnJPZ0cY8YcJMwPZA9z0NJ96HLm8mjEYHQZdQX0brkm','STEAM_0:1:18224846','2018-05-09 17:40:11'),('76561198031116162_Zdf4G83jz1Rkghegsepl6zVBpa9Ana4Uha3NQSkyAwF23UB2fGazV8Yu4Yt65sJfMQPeOagEbUxQo0zZsnjbtkYE2HN8ZhlHCciS','STEAM_0:0:35425217','2018-04-21 09:18:45'),('76561198046918009_8BKzgXwfohYd8cYNjAGZYQjOP46YunRjKxIV6KivQ5u56G8KM6IMRWr3qoUwtU3z6kw3C4zz6An6Up77Rvj8be7WHZo91I5dgLgi','STEAM_0:1:43326140','2018-04-21 10:28:00'),('76561198444232406_EGa8MGfkPagSVpbQCFEzbECjlPbx5kLenN3P49DLJFVMfvF14klYQL4N3D4yDYnkVFGjJimXmdyGS22gvuPttfs1rC2Yn4kmewXm','STEAM_0:0:241983339','2018-04-21 11:36:18'),('76561198185724841_GUmEsWYtR2s1EPbi2orcYKNu8VOiKtoj7tis5awSrF7ixCSw5XhojXXDsmIYQzd8U8GKmByhJdIxUL4caYRQlJLxJPcZjG3kyH0x','STEAM_0:1:112729556','2018-04-22 06:16:38'),('76561198211621323_PcrWyPyHRnCFJHtPVyjeu77hssYfGcPqLkazQaYzGks4pcNnloOpLZR2GYNwe8jWwxy3v9h85wI7mI2kFbDlG3P4LEcJuUaDxUut','STEAM_0:1:125677797','2018-04-23 19:17:47'),('76561198311933938_w0LE0SZowLMYeEYg5rPgroONLPjCaEWoe0XktfrAGEGiulf7zgS3Vqbh38zYYJsrfXoNsl4FYFBKsyZq1UZ82Pa1MBMhsJApo1L8','STEAM_0:0:175834105','2018-04-22 01:02:24'),('76561198823124560_taNDzqunlRIYtBtvpu3Y12diYWjshd45tSDM8heyD2pQFAHPYDrybya9RZnBh65mVdq9rh0YBJRs7eYy5AVWyUXgf96ySBf0cfzv','STEAM_0:0:431429416','2018-04-22 08:17:15'),('76561198154656941_aQnvrKpphPnroGkvC00k2CKUorx4bDuqxZggCnjGUjr3QESla4yH2iBRujZSbRvBcptCkAHjabzDQ9uqcu6NUHGQGWY7YQyNvMn1','STEAM_0:1:97195606','2018-04-22 10:28:30'),('76561198160013243_wPaH7iywc8B6fPU4ADdWqZKvMDzaliVF4OCkqqy6oBiNy6RPp5wYHiI9JYC8wt5pDVNoF3fzjGg9MLdgAxvaoZWuBnKm3FOSDMjm','STEAM_0:1:99873757','2018-04-22 10:32:11'),('76561198170287193_D76eC57vvmEahtb91yK9d6ze0xjfgs2vvxCv7fhLHLRdzsRAZCFueP5faSgHOd7HYPvYiWIO5GmoJPwtlehwgwKVENdoLKOmEeVd','STEAM_0:1:105010732','2018-04-30 07:32:04'),('76561198835322584_PPFwCFGiqZkH1Q4CYBzXQp2jtVbsbQyGHJDVxSlbf4YCCNCLvbysbopVqWQccx9OwrUqC6Jp5iIfPnC1po7UzssXNfQD77z3nuEK','STEAM_0:0:437528428','2018-05-12 06:45:31'),('76561198302039887_Vj6xmkMbSbPERtJ8JIftg7eflXuYGpvs2wRvJQa2nAsVbaGUKYXkSGxLbsiqRCtEF2D50D5QaYX5dg4S3RNybKPJeVVM90k5uz11','STEAM_0:1:170887079','2018-04-23 12:41:14'),('76561198823124560_WlPZCqNguuVj7OrutvpvnNdJUW1xr2ek1WnI0NivbirafLmk9KttpVPqjmylFaiPSCCSDrIa3wXNYPCxGbSM1hIe16bLkjE8csws','STEAM_0:0:431429416','2018-04-22 14:44:16'),('76561198807602425_d8OxKR0gBGm8DWoaVk0sdk1WsB7WIrKpSy4AygL8ySaF9yoKRtpiFQUUvvgd5F3GnR3EIKXC7OA6ztgi05iwLxlvjPaYYu7usG83','STEAM_0:1:423668348','2018-04-25 17:44:23'),('76561197997437521_orls8tZwaijRWCbRwHnC6URdZkcCrYPtIVj1kFKbk87mlKPr06FMBMZCnwj6AKgwWKJPJs6BlAfsIotEY3pB8Q2sZpFr0jSAwXAd','STEAM_0:1:18585896','2018-04-25 17:44:30'),('76561198147585724_gHe5gvIUwt9ZpUyPzba4aYh5395jDS5VRvkNiIAfahv6kUWY5UbsSSmWzOHDK1Z5VO6AzhC8m5bb89plNoqWUrU7V7i3kNCxihCI','STEAM_0:0:93659998','2018-04-24 09:13:25'),('76561198430993670_YvfrNah1uS2oU7MiU4351KtpxNiHVzAyC1KWMVBEVqub8BE8wCKoRiMNbX36ecAoZjhrrK1xi3uaukMQE4DaJiojfFZfMvoxRzSn','STEAM_0:0:235363971','2018-05-18 15:52:23'),('76561198832553786_x3eWm6N4SWMUmGaUkrjIuRmOi8ZUqREAXLAnzLeejxLdNBmgrJx6w2qFD0FW5CCsSyKbXuEEhzkcEAtHDUjzIDepdSexHGavm2Q4','STEAM_0:0:436144029','2018-04-26 12:02:20'),('76561198336167582_kmQd81y4En0e26SBtqerrmfKAsZUPVODv2YbPI89jes0SHHe72kv6GFRf7K6mgO7oHjNYmN1nv8Vdzycgw8pabUx7MewcSLpFMwK','STEAM_0:0:187950927','2018-05-03 07:30:39'),('76561198099789336_Ky5QVEKDZldva8v1zIkyFjz0XlQ8N7IXQGzXBakXanl7Y5lwtqc1rSGWy7Kaj57IFj6sLnmpLf0le5k3c7VFvPAQ9v5aVLLDVZsK','STEAM_0:0:69761804','2018-04-26 17:15:44'),('76561198430953098_OqXNqgBBYqWusuGtpdSboFD16XoDlun6rMm5laiYv8d1tQjUqEesAwFMJtbfrI8QZJUYlWskl5B2cd2kNEQDACHlVAxXc5sby4Ap','STEAM_0:0:235343685','2018-05-02 12:39:15'),('76561198261631002_lvcbotbbbkiNBVhlsAwB0h3UJ34hv8lqBKm3iy5OS0w38sckuD7PWUBzbixHM8IVYbx5Vsd79QazWprarYXixMRCfDy2uQUk8DB2','STEAM_0:0:150682637','2018-05-19 15:01:15'),('76561198821797626_eNBySuMzzk2uGGY4lzQyjMQlDnfAF96M6ngFvcB3KmIm9LR1msxqLop1J66vKgVCoSfNe4O0fZPcxINOyyMo1N1H8Zt86nNmIJng','STEAM_0:0:430765949','2018-04-27 19:36:09'),('76561198175643510_jYBJCPQWNrXL7wBSsSUFe72Z91lpYyukv4RJxwP1YKeZY7LDajHZk0Kx5nUImcCHhggU0L8KsEgLmHbu29MoLVmNIsWm8YkffBHA','STEAM_0:0:107688891','2018-04-30 09:14:20'),('76561198057758732_kz6tonUY9NhNSZdWaXcgLgO9Ra8K6ig0CVYURZSU0fYQ6mmnwRnAydHqcfyKN41y9WRokcH5MvQEScAlDV2uoqqYBYpwKPN9oWxN','STEAM_0:0:48746502','2018-05-01 14:19:15'),('76561198823124560_jYySVqwL5e44KU5y5dnKMevoReXid9cRYssCdMHRjaNAs7Rwtn6KqRwf1cI48M3E0r5uZtm4oX96w3vgqqOtSXYMwZ9b5NRJyt8A','STEAM_0:0:431429416','2018-04-29 05:52:28'),('76561198241447382_64fwbGpPguAaCH4gYWV8AKk4I69RlvZHCHQOSvmdeAykVMVPXpysg4nEFaB6md2oKCOg8iyDqKyDyLy01pERHOmJhH0G5cYsKswd','STEAM_0:0:140590827','2018-04-29 14:10:02'),('76561198031899043_MEi2frd1OpxqXSLHItBHqoOscMHNDQnKvPgiYqYYmoRG8OWekIQZeFV0K9C4vKoDQUvkPZWyAzKzymvMEbUXRJe0npxezMaAnIxi','STEAM_0:1:35816657','2018-05-18 20:16:59'),('76561198121926395_SUlEfOP7F1VnNN75rt2rxYHSBkFpztgY1u6SpsGtEt0HEOGfSQQs5XyOWq8gM1u5ZmsWpva2zzyDvIDEIrQRtDSoFoQCYw6bfRsx','STEAM_0:1:80830333','2018-05-15 21:24:14'),('76561198120980001_MajR1vj6CfUcpLJ9pDmKFrvJUxqBdVYBmmbdXQh8UmEOHx0ecyybDUAeUSGmbENoYdQOAPZkZGcI1b8AOBjYbonybOOONRoeYt4L','STEAM_0:1:80357136','2018-04-29 14:59:41');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `questions_cats` text NOT NULL,
  `tname` tinytext NOT NULL,
  `tpriority` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(2) NOT NULL DEFAULT 'ru',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'[\"1\",\"1\",\"3\",\"3\",\"3\",\"2\"]','Тест на машиниста 3 класса',3,'ru'),(2,'[\"11\",\"11\",\"11\",\"12\",\"12\"]','Тест на машиниста б/к (без класса)',4,'ru'),(3,'[\"4\",\"4\",\"4\",\"4\",\"5\",\"5\",\"5\",\"9\"]','Тест на машиниста 2 класса',2,'ru'),(4,'[\"6\",\"6\",\"6\",\"6\",\"6\",\"6\",\"7\",\"7\",\"7\",\"7\",\"7\",\"10\",\"10\"]','Тест на машиниста 1 класса',1,'ru'),(5,'[\"15\",\"15\",\"17\",\"17\",\"16\"]','3rd Class Driver',3,'en'),(6,'[\"24\",\"24\",\"24\",\"25\",\"25\"]','Unclassified Driver',4,'en');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests_results`
--

DROP TABLE IF EXISTS `tests_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests_results` (
  `trid` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` smallint(1) NOT NULL DEFAULT '0',
  `student` varchar(20) DEFAULT NULL,
  `questions` text,
  `answers` text,
  `answers_marks` text,
  `trname` tinytext,
  `recived_date` timestamp NULL DEFAULT NULL,
  `completed_date` timestamp NULL DEFAULT NULL,
  `passed` smallint(1) DEFAULT NULL,
  `reviewer` varchar(20) DEFAULT NULL,
  `review_date` timestamp NULL DEFAULT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`trid`)
) ENGINE=MyISAM AUTO_INCREMENT=6539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests_results`
--

LOCK TABLES `tests_results` WRITE;
/*!40000 ALTER TABLE `tests_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `written` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `owner` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` varchar(513) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` smallint(2) NOT NULL DEFAULT '0',
  `viewed` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM AUTO_INCREMENT=14162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trains` varchar(255) NOT NULL DEFAULT '[]',
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES (1,'[{\"name\":\"81-722\",\"entityname\":\"gmod_subway_81-722\"},{\"name\":\"81-723\",\"entityname\":\"gmod_subway_81-723\"},{\"name\":\"81-724\",\"entityname\":\"gmod_subway_81-724\"}]','81-722 \"Юбилейный\"');
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info_cache`
--

DROP TABLE IF EXISTS `user_info_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_cache` (
  `steamid` varchar(20) CHARACTER SET utf8 NOT NULL,
  `avatar_url` varchar(150) CHARACTER SET utf8 NOT NULL,
  `steam_url` varchar(150) CHARACTER SET utf8 NOT NULL,
  `nickname` varchar(88) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`steamid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_cache`
--

LOCK TABLES `user_info_cache` WRITE;
/*!40000 ALTER TABLE `user_info_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violations`
--

DROP TABLE IF EXISTS `violations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `violations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SID` text CHARACTER SET utf8 NOT NULL,
  `date` text CHARACTER SET utf8 NOT NULL,
  `admin` text CHARACTER SET utf8 NOT NULL,
  `server` text CHARACTER SET utf8 NOT NULL,
  `server_id` int(11) NOT NULL DEFAULT '-1',
  `violation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=832 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violations`
--

LOCK TABLES `violations` WRITE;
/*!40000 ALTER TABLE `violations` DISABLE KEYS */;
/*!40000 ALTER TABLE `violations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-10  8:20:51
