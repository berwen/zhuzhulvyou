-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 12 月 02 日 06:52
-- 服务器版本: 5.5.24-log
-- PHP 版本: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ticket`
--

-- --------------------------------------------------------

--
-- 表的结构 `attraction_description`
--

CREATE TABLE IF NOT EXISTS `attraction_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attraction_id` int(11) NOT NULL,
  `audio_source` varchar(200) DEFAULT NULL,
  `travel_notes` text,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `attraction_info`
--

CREATE TABLE IF NOT EXISTS `attraction_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `radius` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `attraction_info`
--

INSERT INTO `attraction_info` (`id`, `name`, `description`, `lat`, `lon`, `user_id`, `radius`) VALUES
(1, 'SJTU', 'SJTU', 44, 88, 121, 10);

-- --------------------------------------------------------

--
-- 表的结构 `ticket_book_info`
--

CREATE TABLE IF NOT EXISTS `ticket_book_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `now` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ticket_book_info`
--

INSERT INTO `ticket_book_info` (`id`, `price`, `max`, `now`) VALUES
(1, 5, 100, 5),
(2, 50, 9999, 0),
(3, 30, 1111, 10);

-- --------------------------------------------------------

--
-- 表的结构 `ticket_discount`
--

CREATE TABLE IF NOT EXISTS `ticket_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `ticket_discount`
--

INSERT INTO `ticket_discount` (`id`, `ticket_id`, `start_date`, `end_date`, `description`, `user_id`) VALUES
(1, 1, '2013-11-15', '2013-12-07', '5折', 121),
(4, 2, '2013-12-01', '2013-12-10', '免费！', 121),
(5, 3, '2013-12-12', '2013-12-19', '买一送一', 121);

-- --------------------------------------------------------

--
-- 表的结构 `ticket_info`
--

CREATE TABLE IF NOT EXISTS `ticket_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ticket_info`
--

INSERT INTO `ticket_info` (`id`, `name`, `description`, `user_id`, `attraction_id`) VALUES
(1, 'SJTU', '5元', 121, 1),
(2, '公园', '绿色', 121, 450),
(3, '游戏城', '玩玩玩', 121, 670);

-- --------------------------------------------------------

--
-- 表的结构 `ticket_user_record`
--

CREATE TABLE IF NOT EXISTS `ticket_user_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ticket_user_record`
--

INSERT INTO `ticket_user_record` (`id`, `user_id`, `ticket_id`, `time`) VALUES
(1, 1, 1, '2013-12-01 22:21:26'),
(2, 1, 1, '2013-12-01 22:23:57'),
(3, 1, 1, '2013-12-01 22:24:17');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
