-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 12 月 07 日 00:51
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
('lihuaxin0033@163.com', 1),
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
  `sound` text NOT NULL,
  UNIQUE KEY `placename` (`placename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `favplace`
--

INSERT INTO `favplace` (`placename`, `visited`, `placetype`, `placeintro`, `lng`, `lat`, `pic`, `sound`) VALUES
('快乐大本营', 0, '综艺节目', '很好看的综艺节目，每天都会看哦！', 112.990007, 28.230034, 'upload/Jellyfish.jpg', 'upload/'),
('vwvw', 0, 'vwvw', 'vwvwvwvw', 121.426461, 31.089609, '', ''),
('擦手擦', 1, 'vava', '', 121.436954, 31.091279, '', ''),
('vewvew', 3, 'brwabre', '你忍忍enetne', 121.476192, 31.152891, 'upload/122.jpg', ''),
('NALI', 5, 'FAV', 'EFVW', 121.368107, 31.174645, 'upload/X.jpg', ''),
('n', 1, 'n', 'n', 121.399728, 31.056916, 'upload/snslogo (2).gif', 'upload/top-5-countdown-for-week-ending-23nov13.mp3'),
('casv', 3, 'vev', 'vevevev', 121.537133, 31.285807, 'upload/Penguins.jpg', 'upload/');

-- --------------------------------------------------------

--
-- 表的结构 `favplace_guest`
--

CREATE TABLE IF NOT EXISTS `favplace_guest` (
  `guestname` varchar(20) NOT NULL,
  `placename` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `favplace_guest`
--

INSERT INTO `favplace_guest` (`guestname`, `placename`) VALUES
('shishikan@163.com', 'vewvew'),
('shishikan@163.com', 'NALI'),
('lihuaxin0033@163.com', 'vewvew'),
('lihuaxin0033@163.com', '擦手擦');

-- --------------------------------------------------------

--
-- 表的结构 `tourist_spot`
--

CREATE TABLE IF NOT EXISTS `tourist_spot` (
  `placename` varchar(20) NOT NULL,
  `mincost` int(11) NOT NULL,
  `maxcost` int(11) NOT NULL,
  `timefrom` int(11) NOT NULL,
  `timeto` int(11) NOT NULL,
  `danji` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tourist_spot`
--

INSERT INTO `tourist_spot` (`placename`, `mincost`, `maxcost`, `timefrom`, `timeto`, `danji`) VALUES
('黄山', 200, 700, 4, 7, '9月底'),
('鼓浪屿', 500, 900, 4, 8, '冬天呀'),
('哈尔滨', 10, 1000, 9, 12, '常年差不多吧');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `mingzi` text NOT NULL,
  `password` varchar(20) NOT NULL,
  `identity` int(10) NOT NULL,
  `caifu` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `username`, `mingzi`, `password`, `identity`, `caifu`) VALUES
(2, 'lhc', '', 'acd', 1, 520),
(1, 'lihuaxin0033@163.com', 'muxiaonuo', 'lihuaxin003', 1, 500),
(5, 'bwbwbw', '', '123123', 1, 200),
(11, '2625689005@qq.com', 'lihuaxin', '123456', 1, 0),
(12, '328332569@qq.com', 'lihuaxin', '1234', 1, 0),
(13, 'cdsvsb', '', '', 1, 0),
(14, 'cdsvsb@qq.com', 'fafa', '1234', 1, 0),
(15, 'agagaga@163.com', 'vava', '1234', 1, 0),
(16, 'shishikan@163.com', 'shishikan', '1234', 1, 200),
(17, 'vdwvwv', 'vewv', 'qaz', 1, 200),
(18, 'xindongfang@gmail.co', '新东方', 'qwer', 2, 200),
(20, 'xiecheng@126.com', '携程', 'yhn', 2, 200);

-- --------------------------------------------------------

--
-- 表的结构 `winner`
--

CREATE TABLE IF NOT EXISTS `winner` (
  `placename` varchar(20) NOT NULL,
  `placeintro` text NOT NULL,
  `lng` double NOT NULL,
  `lat` double NOT NULL,
  `pic` text NOT NULL,
  `sound` text NOT NULL,
  `owner` text NOT NULL,
  `builder` text NOT NULL,
  `value` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  UNIQUE KEY `placename` (`placename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `winner`
--

INSERT INTO `winner` (`placename`, `placeintro`, `lng`, `lat`, `pic`, `sound`, `owner`, `builder`, `value`, `fee`) VALUES
('华为', '一所公司', 131, 29, '', '', 'lihuaxin0033@163.com', 'huawei', 400, 80);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
