-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 12 月 06 日 10:33
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ourmap`
--
CREATE DATABASE IF NOT EXISTS `ourmap` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ourmap`;

-- --------------------------------------------------------

--
-- 表的结构 `currentuser`
--

CREATE TABLE IF NOT EXISTS `currentuser` (
  `username` varchar(20) NOT NULL,
  `id` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `currentuser`
--

INSERT INTO `currentuser` (`username`, `id`) VALUES
('lihuaxin0033@163.com', 1);

-- --------------------------------------------------------

--
-- 表的结构 `favplace`
--

CREATE TABLE IF NOT EXISTS `favplace` (
  `placename` varchar(30) NOT NULL,
  `visited` int(30) NOT NULL,
  `placetype` varchar(50) NOT NULL,
  `placeintro` varchar(50) NOT NULL,
  `lng` double NOT NULL,
  `lat` double NOT NULL,
  `pic` text NOT NULL,
  `sound` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `favplace`
--

INSERT INTO `favplace` (`placename`, `visited`, `placetype`, `placeintro`, `lng`, `lat`, `pic`, `sound`) VALUES
('彩色', 1, 'cs', '4', 31.0282429560779, 121.436347961426, '', ''),
('上海交大', 3, '学校', '非常棒', 121.420173, 31.100896, '', ''),
('vwvw', 1, 'vwvw', 'vwvwvwvw', 121.426461, 31.089609, '', ''),
('擦手擦', 1, 'vava', '', 121.436954, 31.091279, '', ''),
('vrwvw', 0, '不闻不问', '不闻不问', 121.412268, 31.094557, '', ''),
('fcafvwe', 0, 'vewvwrb', 'ebvwbvwrb', 121.372132, 30.983137, 'upload/vf.gif', ''),
('vewvew', 1, 'brwabre', '你忍忍enetne', 121.476192, 31.152891, 'upload/122.jpg', ''),
('NALI', 1, 'FAV', 'EFVW', 121.368107, 31.174645, 'upload/X.jpg', ''),
('vdjbwkvdw', 0, 'brebe', 'breberb', 121.301417, 31.051967, 'upload/Chrysanthemum.jpg', ''),
('ve', 0, 'vev', 'vdvd', 121.425024, 31.24284, 'upload/top-5-countdown-for-week-ending-23nov13.mp3', ''),
('y', 0, 'y', 'n', 121.301417, 30.958366, 'upload/vf.gif', 'upload/scientists-debate-prepare-for-killer-asteroid.mp3'),
('n', 1, 'n', 'n', 121.399728, 31.056916, 'upload/snslogo (2).gif', 'upload/top-5-countdown-for-week-ending-23nov13.mp3'),
('sss', 0, 'sss', 'sss', 121.639468, 31.161791, 'upload/Desert.jpg', 'upload/'),
('casv', 1, 'vev', 'vevevev', 121.537133, 31.285807, 'upload/Penguins.jpg', 'upload/');

-- --------------------------------------------------------

--
-- 表的结构 `favplace_guest`
--

CREATE TABLE IF NOT EXISTS `favplace_guest` (
  `id` int(11) NOT NULL,
  `placename` varchar(50) NOT NULL,
  `guestname` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `favplace_guest`
--

INSERT INTO `favplace_guest` (`id`, `placename`, `guestname`) VALUES
(10000, '彩色', 'lihuaxin0033@163.com'),
(99999, '上海交大', 'lihuaxin0033@163.com'),
(0, '擦手擦', 'lihuaxin0033@163.com'),
(0, 'NALI', 'lihuaxin0033@163.com'),
(0, '华为lihuaxin0033@163.comhuawei', ''),
(0, 'vwvw', 'lihuaxin0033@163.com'),
(0, 'vewvew', 'lihuaxin0033@163.com'),
(0, '华为lihuaxin0033@163.comhuawei', ''),
(0, '华为lihuaxin0033@163.comhuawei', ''),
(0, '华为', ''),
(0, 'n', 'lihuaxin0033@163.com'),
(0, 'casv', 'lihuaxin0033@163.com');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `identity` varchar(10) NOT NULL,
  `caifu` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `identity`, `caifu`) VALUES
(2, 'lhc', 'acd', 'c', 520),
(1, 'lihuaxin0033@163.com', 'lihuaxin003', 'c', 384),
(5, 'bwbwbw', '123123', 'c', 200);

-- --------------------------------------------------------

--
-- 表的结构 `winner`
--

CREATE TABLE IF NOT EXISTS `winner` (
  `placename` text NOT NULL,
  `placeintro` text NOT NULL,
  `lng` double NOT NULL,
  `lat` double NOT NULL,
  `pic` text NOT NULL,
  `sound` text NOT NULL,
  `owner` text NOT NULL,
  `builder` text NOT NULL,
  `value` int(11) NOT NULL,
  `fee` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `winner`
--

INSERT INTO `winner` (`placename`, `placeintro`, `lng`, `lat`, `pic`, `sound`, `owner`, `builder`, `value`, `fee`) VALUES
('华为', '一所公司', 131, 29, '', '', 'lihuaxin0033@163.com', 'huawei', 200, 40);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
