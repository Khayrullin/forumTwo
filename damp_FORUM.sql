-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.36 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных tourism
CREATE DATABASE IF NOT EXISTS `forum` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `forum`;


-- Дамп структуры для таблица tourism.excursion_plan
CREATE TABLE IF NOT EXISTS `users` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`username` CHAR(50) NOT NULL COLLATE 'utf8_bin',
	`password` CHAR(50) NOT NULL COLLATE 'utf8_bin',
	`email` CHAR(50) NOT NULL COLLATE 'utf8_bin',
	`role` CHAR(50) NOT NULL COLLATE 'utf8_bin',
	`firstname` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`lastname` CHAR(50) NULL DEFAULT NULL COLLATE 'utf8_bin',
	`locale` CHAR(5) NULL DEFAULT 'en_US' COLLATE 'utf8_bin',
	`confirmed` BIT(1) NULL DEFAULT b'0',
	`active` BIT(1) NULL DEFAULT b'0',
	`uuid` CHAR(50) NULL DEFAULT NULL,
	`deletedate` DATE NULL DEFAULT NULL,
	UNIQUE INDEX `Индекс 2` (`username`),
	INDEX `Индекс 1` (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=79
;


CREATE TABLE IF NOT EXISTS `comments` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`themeID` INT(11) NOT NULL,
	`autor` CHAR(50) NOT NULL COLLATE 'utf8_bin',
	`comment` TEXT NOT NULL COLLATE 'utf8_bin',
	`time` TIMESTAMP NULL DEFAULT NULL,
	INDEX `Индекс 1` (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=19
;

CREATE TABLE IF NOT EXISTS `messages` (
	`message_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`receiver` CHAR(140) NOT NULL COLLATE 'utf8_bin',
	`sender` CHAR(140) NOT NULL COLLATE 'utf8_bin',
	`message` TEXT NOT NULL COLLATE 'utf8_bin',
	`time` TIMESTAMP NULL DEFAULT NULL,
	INDEX `Индекс 1` (`message_ID`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=78
;

CREATE TABLE IF NOT EXISTS `themes` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`autor` CHAR(50) NOT NULL COLLATE 'utf8_bin',
	`theme` CHAR(200) NOT NULL COLLATE 'utf8_bin',
	`message` TEXT NULL COLLATE 'utf8_bin',
	`time` TIMESTAMP NULL DEFAULT NULL,
	INDEX `Индекс 1` (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=56
;
