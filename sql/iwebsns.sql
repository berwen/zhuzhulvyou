-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 12 月 06 日 23:36
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `iwebsns`
--
CREATE DATABASE IF NOT EXISTS `iwebsns` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `iwebsns`;

-- --------------------------------------------------------

--
-- 表的结构 `isns_admin`
--

CREATE TABLE IF NOT EXISTS `isns_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) NOT NULL,
  `admin_password` char(32) NOT NULL,
  `admin_group` varchar(20) DEFAULT NULL,
  `is_pass` tinyint(2) unsigned DEFAULT '1',
  `active_time` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_admin`
--

INSERT INTO `isns_admin` (`admin_id`, `admin_name`, `admin_password`, `admin_group`, `is_pass`, `active_time`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'superadmin', 1, '2013-11-23 22:30:42'),
(2, 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'superadmin', 1, '2013-12-06 14:17:25'),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'superadmin', 1, '2013-12-06 14:17:32');

-- --------------------------------------------------------

--
-- 表的结构 `isns_album`
--

CREATE TABLE IF NOT EXISTS `isns_album` (
  `album_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `album_name` varchar(20) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `album_info` varchar(150) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `album_skin` varchar(150) DEFAULT NULL,
  `photo_num` smallint(5) unsigned DEFAULT '0',
  `is_pass` tinyint(2) DEFAULT '1',
  `privacy` varchar(200) DEFAULT NULL,
  `comments` int(5) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `isns_album`
--

INSERT INTO `isns_album` (`album_id`, `album_name`, `user_id`, `user_name`, `album_info`, `add_time`, `update_time`, `album_skin`, `photo_num`, `is_pass`, `privacy`, `comments`, `tag`) VALUES
(1, 'fsf', 1, 'muxiaonuo', 'bgrge', '2013-11-24 10:56:55', '2013-11-29 22:37:22', 'uploadfiles/album/2013/11/24/thumb_2013112410585048.gif', 2, 1, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `isns_album_comment`
--

CREATE TABLE IF NOT EXISTS `isns_album_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  `album_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `album_id` (`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_ask`
--

CREATE TABLE IF NOT EXISTS `isns_ask` (
  `ask_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL COMMENT '提问者id',
  `user_name` varchar(15) NOT NULL COMMENT '提问者名字',
  `title` varchar(200) NOT NULL COMMENT '问题',
  `detail` text COMMENT '详细',
  `replenish` text COMMENT '问题补充',
  `type_id` mediumint(6) NOT NULL COMMENT '问题分类id',
  `type_name` varchar(20) NOT NULL COMMENT '类别名',
  `reward` smallint(8) NOT NULL DEFAULT '0' COMMENT '悬赏积分',
  `reply_num` smallint(8) NOT NULL DEFAULT '0' COMMENT '回答数量',
  `view_num` smallint(8) NOT NULL DEFAULT '0' COMMENT '查看次数',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '问题状态 0待解决 1已解决',
  `add_time` datetime NOT NULL COMMENT '提问时间',
  `reply_time` datetime DEFAULT NULL COMMENT '最后回答时间',
  `solved_time` datetime DEFAULT NULL COMMENT '解决时间',
  PRIMARY KEY (`ask_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_ask_reply`
--

CREATE TABLE IF NOT EXISTS `isns_ask_reply` (
  `reply_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `ask_id` int(8) NOT NULL COMMENT '问题id',
  `user_id` mediumint(8) NOT NULL COMMENT '回答者id',
  `user_name` varchar(15) NOT NULL COMMENT '回答者名字',
  `user_ico` varchar(150) NOT NULL COMMENT '回答者头像',
  `content` text NOT NULL COMMENT '回答内容',
  `add_time` datetime NOT NULL COMMENT '回答时间',
  `edit_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_answer` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否满意答案 0否 1是',
  PRIMARY KEY (`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='回答表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_ask_type`
--

CREATE TABLE IF NOT EXISTS `isns_ask_type` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `order_num` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `isns_ask_type`
--

INSERT INTO `isns_ask_type` (`id`, `name`, `order_num`) VALUES
(1, '创业起步', 1),
(2, '市场营销', 2),
(3, '企业管理', 3),
(4, '财务/资本', 4),
(5, '法律咨询', 5),
(6, '人力资源', 6),
(7, '工作/生活', 7),
(9, '其他', 8);

-- --------------------------------------------------------

--
-- 表的结构 `isns_backgroup`
--

CREATE TABLE IF NOT EXISTS `isns_backgroup` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `gid` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `rights` text,
  `pluginrights` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_blog`
--

CREATE TABLE IF NOT EXISTS `isns_blog` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `log_title` varchar(80) DEFAULT NULL,
  `log_sort` mediumint(8) NOT NULL DEFAULT '0',
  `is_pass` tinyint(2) NOT NULL DEFAULT '1',
  `log_sort_name` varchar(30) DEFAULT NULL,
  `log_content` text,
  `add_time` datetime DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  `privacy` varchar(200) DEFAULT NULL,
  `hits` mediumint(8) DEFAULT '0',
  `comments` int(5) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `log_sort` (`log_sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `isns_blog`
--

INSERT INTO `isns_blog` (`log_id`, `user_id`, `user_name`, `user_ico`, `log_title`, `log_sort`, `is_pass`, `log_sort_name`, `log_content`, `add_time`, `edit_time`, `privacy`, `hits`, `comments`, `tag`) VALUES
(3, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '三亚的东西！！', 2, 1, '游记', '<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="font-family:宋体;color:#404040;font-size:19px;">-----</span><span style="font-family:宋体;color:#404040;font-size:19px;">有些人或地方一直没机会见，等有机会见了，却又犹豫了，相见争如怀念。</span></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="font-family:宋体;color:#404040;font-size:19px;">甫一出站，我那晃荡得早已疲惫一夜的心瞬间被治愈了。火车到站的时间比较早，<a href="http://lvyou.baidu.com/sanya" class="a-notes-innerlink" target="_blank" style="text-decoration:none;color:#007ed9;">三亚</a>的天才刚微微亮，晨曦的微光依稀可见，深吸一口气，微热的微风瞬间沁入心脾，抬眼一片广袤的天空，深蓝中带着紫色的霞光，视野所及之处，一片辽阔。回过神，车站门口的广场上伴随着到站的人们依次走出来，三三两两，奔向各自的方向。随着人流踏向我的方向，我的三亚之旅便由此开始。</span><span style="font-family:宋体;color:#404040;font-size:19px;"><br />\r\n<a href="http://lvyou.baidu.com/notes/photo/5ed28924608be80b3d109ca8" target="_blank" class="notes-photo-link" style="text-decoration:none;display:inline-block;max-width:600px;color:#007ed9;"><img class="notes-photo-img" src="http://a.hiphotos.baidu.com/lvpics/s%3D800/sign=56ab6996bb014a90853e4bbd99763971/8b13632762d0f703d93343f80afa513d2697c515.jpg" data-purl="8b13632762d0f703d93343f80afa513d2697c515" width="600" height="450" data-id="5ed28924608be80b3d109ca8" data-url="8b13632762d0f703d93343f80afa513d2697c515" style="border:0px;max-width:600px;display:block;" /></a></span></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="font-family:宋体;color:#404040;font-size:19px;">来到三叶草，首先结识的是一位超帅哥，初次见面的时候，他是一副冷漠不易接近的样子，搞的我们在客厅坐着都把腰杆给挺得直直的不敢妄动。后来熟识了才知道，原来他就是个闷骚型，那副深沉样儿完全是装出来的。然后再是神交已久的雪梅姐，和几位热情和善的打扫大姐。这些人们，都一如相像中的可亲可善，令我们毫无拘束。</span></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="font-family:宋体;color:#404040;font-size:19px;">我们到达的头几天主要就是出去熟悉下三亚的大体环境。三亚别的不说，就是海特别多，我们首先去的就是<a href="http://lvyou.baidu.com/dadonghai" class="a-notes-innerlink" target="_blank" style="text-decoration:none;color:#007ed9;">大东海</a>，我们去的时候正是一个阳光的午后，转过路口进到沙滩的入口，眼前顿时一片豁然开朗，漫长的海岸线，水天一线的澄蓝大海，浪花起伏，伴随着舒爽的海风拂过我的发梢，让我感觉从身到心，由内而外，通体舒畅。这是我们在三亚第一次看到的大海。即使已经去过<a href="http://lvyou.baidu.com/shenzhen" class="a-notes-innerlink" target="_blank" style="text-decoration:none;color:#007ed9;">深圳</a>大梅沙，厦门鼓浪屿，三亚的大海依然给了我一种震撼的感觉。心中有个声音在告诉我，这才是我心目中该有的大海。即便后来我们在这里看了一个月的各种海，那一次的感觉依然是我心中最深刻。</span></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="font-family:宋体;color:#404040;font-size:19px;">如同小家碧玉的小<a href="http://lvyou.baidu.com/donghai" class="a-notes-innerlink" target="_blank" style="text-decoration:none;color:#007ed9;">东海</a>，清幽剔透的亚龙湾，绵延不绝的<a href="http://lvyou.baidu.com/sanyawan" class="a-notes-innerlink" target="_blank" style="text-decoration:none;color:#007ed9;">三亚湾</a>，秀丽无双的蜈支洲……每一个海湾似一样，却又不尽相同。各自保持着不同的特点。小东海和大东海因为临近的原因，我们去的次数最多，闲暇时都会间或骑车过去走走，日子过得缓慢而美妙。</span><span style="font-family:宋体;color:#404040;font-size:19px;"><br />\r\n<a href="http://lvyou.baidu.com/notes/photo/87862d7e02414b3755f0e9a8" target="_blank" class="notes-photo-link" style="text-decoration:none;display:inline-block;max-width:600px;color:#007ed9;"></a><br />\r\n<br />\r\n<a href="http://lvyou.baidu.com/notes/photo/a3dd29414b3755f080caf6a8" target="_blank" class="notes-photo-link" style="text-decoration:none;display:inline-block;max-width:600px;color:#007ed9;"></a><br />\r\n<br />\r\n</span></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="font-family:宋体;color:#404040;font-size:19px;">我们所在的三叶草南边海店临近鹿回头公园，熟悉了这边以后，隔个两天我们休息的时候，便邀约一起骑上自行车去鹿回头渔村那边的海滩走走，大多是傍晚时刻，天边的云彩和晚霞正是好，绚烂多姿，衬着这高远蔚蓝的天空，就是一幅画。</span><br />\r\n<a href="http://lvyou.baidu.com/notes/photo/00f5cef5b652472634bef0a8" target="_blank" class="notes-photo-link" style="text-decoration:none;display:inline-block;max-width:600px;color:#007ed9;"></a><br />\r\n<br />\r\n<a href="http://lvyou.baidu.com/notes/photo/49569d52472634beffe9f1a8" target="_blank" class="notes-photo-link" style="text-decoration:none;display:inline-block;max-width:600px;color:#007ed9;"></a></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="font-family:宋体;color:#404040;font-size:19px;">我喜欢静静的走在国宾馆前面的那座长长的栈桥，一路走过，就如同走过我我每一寸的时光与心情，一步步沉淀，直到桥尽头亦是海中央。我左右观望，前方是即将下落海里的夕阳，放眼望去，能看到斜对岸的灯塔；左右是不断拍打着桥廊柱的浪花，身后是一轮孤独且明亮的圆月。那一霎，我觉得我好像独自飘荡在海中央，随着浪花一起，不断沉浮。</span><span style="font-family:宋体;color:#404040;font-size:19px;"><br />\r\n<a href="http://lvyou.baidu.com/notes/photo/01b872c20f7e11df15e127af" target="_blank" class="notes-photo-link" style="text-decoration:none;display:inline-block;max-width:600px;color:#007ed9;"></a><br />\r\n<br />\r\n<a href="http://lvyou.baidu.com/notes/photo/8e61247e11df15e197ed24af" target="_blank" class="notes-photo-link" style="text-decoration:none;display:inline-block;max-width:600px;color:#007ed9;"></a><br />\r\n</span></p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="font-family:宋体;color:#404040;font-size:19px;">最爱看三亚天空，与各种云朵。每时每刻，无论我哪次不经意的抬头看天空，它都会给我不同的惊喜。天晴时明媚如洗，阴天时或雾霭沉沉，或东西各异，雨天时类似海市蜃楼。大自然的美妙总是让人惊叹不已。</span></p>', '2013-12-06 15:02:05', NULL, '', 1, 1, '上海 四川 三亚'),
(4, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '猪猪思密达', 2, 1, '游记', '<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="color:#555555;font-family:simsun;">来到<a href="http://lvyou.baidu.com/xiamen" class="a-notes-innerlink" target="_blank" style="text-decoration:none;color:#007ed9;">厦门</a>这个城市两年多了，在此之前来过厦门两次，每一次都爱这个城市多一点，所以第三次就干脆不走了。在厦门的两年多时间，每一年都会出一版新的攻略，因为对这个城市了解的越多，爱这个地方就更多一点，能够分享的也就更多。真心希望把这个城市最美好最精髓的东西传达给更多的人，让更多的人了解真正的厦门。还是那句话，如果你还没有去过厦门，那么这篇文章你一定要收藏，因为那是一个无论如何你都会去一次的城市。如果你已经去过厦门，那么这篇文章也应该会对你有所帮助，因为那是一个去了一次就一定会再想去的城市。最新最全的信息，最实用的路线，厦门是会值得一来再来的哦~~</span><br />\r\n</p>\r\n<p style="margin-top:0px;margin-bottom:1em;padding:0px;min-height:20px;color:#333333;font-family:Arial, 宋体;font-size:14px;line-height:21px;"><span style="color:#555555;font-family:simsun;">为了给大家提供最详尽的信息，这篇攻略内容会比较多，所以这次我会把最重要的先放在前面说，能够让大家更充分了解厦门的信息及花费放在后面附加。也会做一个常见问题的Q&amp;A。当然如果还有更多问题，只要小驴能解决的，一定帮忙。</span></p>', '2013-12-06 15:03:48', NULL, '', 2, 3, '北京');

-- --------------------------------------------------------

--
-- 表的结构 `isns_blog_comment`
--

CREATE TABLE IF NOT EXISTS `isns_blog_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `log_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `log_id` (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `isns_blog_comment`
--

INSERT INTO `isns_blog_comment` (`comment_id`, `visitor_ico`, `is_hidden`, `visitor_id`, `log_id`, `host_id`, `visitor_name`, `content`, `add_time`, `readed`) VALUES
(1, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 0, 1, 4, 1, 'muxiaonuo', 'breberb', '2013-12-06 15:57:59', 0),
(2, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 0, 1, 4, 1, 'muxiaonuo', '猪猪思密达', '2013-12-06 15:58:53', 0),
(3, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 0, 1, 3, 1, 'muxiaonuo', '猪猪思密达！', '2013-12-06 15:59:08', 0),
(4, 'skin/default/jooyea/images/d_ico_1_small.gif', 0, 5, 4, 1, 'lihuaxin0033@163.com', 'vvewvew', '2013-12-06 17:35:50', 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_blog_sort`
--

CREATE TABLE IF NOT EXISTS `isns_blog_sort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `isns_blog_sort`
--

INSERT INTO `isns_blog_sort` (`id`, `name`, `user_id`) VALUES
(1, '远行', 1),
(2, '游记', 1);

-- --------------------------------------------------------

--
-- 表的结构 `isns_currentuser`
--

CREATE TABLE IF NOT EXISTS `isns_currentuser` (
  `username` varchar(20) NOT NULL,
  `id` int(11) NOT NULL,
  `caifu` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `isns_currentuser`
--

INSERT INTO `isns_currentuser` (`username`, `id`, `caifu`) VALUES
('xiecheng@126.com', 1, 210);

-- --------------------------------------------------------

--
-- 表的结构 `isns_event`
--

CREATE TABLE IF NOT EXISTS `isns_event` (
  `event_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `location` varchar(80) NOT NULL DEFAULT '',
  `poster` varchar(60) NOT NULL DEFAULT '',
  `poster_thumb` varchar(60) NOT NULL DEFAULT '',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `remote` tinyint(1) NOT NULL DEFAULT '0',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `public` tinyint(3) NOT NULL DEFAULT '0',
  `member_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `follow_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `view_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `grade` tinyint(3) NOT NULL DEFAULT '0',
  `photo_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `detail` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '',
  `limit_num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `verify` tinyint(1) NOT NULL DEFAULT '0',
  `allow_pic` tinyint(1) NOT NULL DEFAULT '0',
  `allow_post` tinyint(1) NOT NULL DEFAULT '0',
  `allow_invite` tinyint(1) NOT NULL DEFAULT '0',
  `allow_fellow` tinyint(1) NOT NULL DEFAULT '0',
  `is_pass` tinyint(1) NOT NULL DEFAULT '1',
  `comments` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`),
  KEY `grade` (`grade`),
  KEY `member_num` (`member_num`),
  KEY `user_id` (`user_id`,`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_event`
--

INSERT INTO `isns_event` (`event_id`, `user_id`, `user_name`, `dateline`, `title`, `type_id`, `province`, `city`, `location`, `poster`, `poster_thumb`, `thumb`, `remote`, `deadline`, `start_time`, `end_time`, `public`, `member_num`, `follow_num`, `view_num`, `grade`, `photo_num`, `update_time`, `detail`, `template`, `limit_num`, `verify`, `allow_pic`, `allow_post`, `allow_invite`, `allow_fellow`, `is_pass`, `comments`) VALUES
(1, 1, 'muxiaonuo', 0, '北京 上海', 3, '甘肃', '兰州', 'mpkj', 'uploadfiles/event/default_event_poster.jpg', 'uploadfiles/event/default_event_poster.jpg', 0, 0, 1385794740, 1385621940, 1385794800, 2, 1, 0, 2, 1, 0, 1385708458, '北大法宝', '次的', 2, 0, 1, 1, 1, 0, 1, 0),
(2, 15, 'vava', 0, '去杭州玩！', 2, '浙江', '杭州', '杭州', 'uploadfiles/event/default_event_poster.jpg', 'uploadfiles/event/default_event_poster.jpg', 0, 0, 1388341500, 1388255040, 1389896700, 2, 2, 0, 3, 1, 0, 1386354323, '<p>大家一起去杭州玩吧！</p>', '', 0, 0, 1, 1, 1, 0, 1, 0),
(3, 16, 'shishikan', 0, '杭州N日游～', 2, '浙江', '杭州', '杭州', 'uploadfiles/event/default_event_poster.jpg', 'uploadfiles/event/default_event_poster.jpg', 0, 0, 1391110020, 1389986820, 1391110020, 2, 1, 0, 1, 1, 0, 1386358167, '大家一起玩几天～', '', 0, 0, 1, 1, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_comment`
--

CREATE TABLE IF NOT EXISTS `isns_event_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `event_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_invite`
--

CREATE TABLE IF NOT EXISTS `isns_event_invite` (
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `to_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_user_name` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`,`to_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_members`
--

CREATE TABLE IF NOT EXISTS `isns_event_members` (
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `user_sex` tinyint(2) NOT NULL DEFAULT '0',
  `user_ico` varchar(150) NOT NULL DEFAULT '',
  `reside_province` varchar(30) NOT NULL DEFAULT '',
  `reside_city` varchar(30) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `fellow` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id`,`user_id`),
  KEY `user_id` (`user_id`,`dateline`),
  KEY `event_id` (`event_id`,`status`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `isns_event_members`
--

INSERT INTO `isns_event_members` (`event_id`, `user_id`, `user_name`, `user_sex`, `user_ico`, `reside_province`, `reside_city`, `dateline`, `status`, `fellow`, `template`) VALUES
(1, 1, 'muxiaonuo', 1, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '', '', 1385708458, 4, 0, ''),
(2, 15, 'vava', 1, 'skin/default/jooyea/images/d_ico_1_small.gif', '', '', 1386354323, 4, 0, ''),
(2, 1, 'muxiaonuo', 1, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '', '', 1386354362, 2, 0, ''),
(3, 16, 'shishikan', 1, 'skin/default/jooyea/images/d_ico_1_small.gif', '', '', 1386358167, 4, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_photo`
--

CREATE TABLE IF NOT EXISTS `isns_event_photo` (
  `photo_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `photo_src` varchar(200) DEFAULT NULL,
  `photo_name` varchar(20) NOT NULL,
  `photo_information` varchar(200) DEFAULT NULL,
  `photo_thumb_src` varchar(200) DEFAULT NULL,
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_event_type`
--

CREATE TABLE IF NOT EXISTS `isns_event_type` (
  `type_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(80) NOT NULL DEFAULT '',
  `poster` varchar(100) NOT NULL DEFAULT '',
  `poster_thumb` varchar(100) NOT NULL DEFAULT '',
  `template` text NOT NULL,
  `display_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `isns_event_type`
--

INSERT INTO `isns_event_type` (`type_id`, `type_name`, `poster`, `poster_thumb`, `template`, `display_order`) VALUES
(1, '生活/聚会', '0', '', '<P><BR>费用说明:<BR>集合地点:<BR>着装要求:<BR>联系方式:<BR>注意事项:<BR></P>', 1),
(2, '出行/旅游', '', '', '<P>路线说明:<BR>费用说明:<BR>装备要求:<BR>交通工具:<BR>集合地点:<BR>联系方式:<BR>注意事项:<BR></P>', 2),
(3, '比赛/运动', '0', '', '<P>费用说明：<BR>集合地点：<BR>着装要求：<BR>场地介绍：<BR>联系方式：<BR>注意事项：<BR></P>', 3),
(4, '电影/演出', '', '', '剧情介绍：<BR>费用说明：<BR>集合地点：<BR>联系方式：<BR>注意事项:<BR>', 4),
(5, '教育/讲座', '', '', '主办单位：<BR>活动主题：<BR>费用说明：<BR>集合地点：<BR>联系方式：<BR>注意事项：<BR>', 5),
(6, '其它', '0', '', '', 6);

-- --------------------------------------------------------

--
-- 表的结构 `isns_frontgroup`
--

CREATE TABLE IF NOT EXISTS `isns_frontgroup` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `gid` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `rights` text,
  `pluginrights` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_groups`
--

CREATE TABLE IF NOT EXISTS `isns_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `add_userid` mediumint(8) unsigned NOT NULL,
  `is_pass` tinyint(2) NOT NULL DEFAULT '1',
  `member_count` mediumint(8) unsigned DEFAULT '1',
  `group_name` varchar(50) DEFAULT NULL,
  `group_resume` varchar(100) DEFAULT NULL,
  `group_time` datetime DEFAULT NULL,
  `group_manager_name` varchar(60) DEFAULT NULL,
  `group_manager_id` varchar(20) DEFAULT NULL,
  `group_req_id` text,
  `group_creat_name` varchar(20) DEFAULT NULL,
  `group_logo` varchar(150) DEFAULT NULL,
  `group_join_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_type` varchar(20) DEFAULT NULL,
  `group_type_id` smallint(5) unsigned DEFAULT NULL,
  `affiche` varchar(200) DEFAULT NULL,
  `tag` varchar(80) DEFAULT NULL,
  `subjects_num` mediumint(8) unsigned DEFAULT '0',
  `comments` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `add_userid` (`add_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_group_members`
--

CREATE TABLE IF NOT EXISTS `isns_group_members` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_sex` tinyint(2) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `state` tinyint(2) DEFAULT NULL,
  `role` tinyint(2) DEFAULT '2',
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_group_subject`
--

CREATE TABLE IF NOT EXISTS `isns_group_subject` (
  `subject_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `hits` int(5) unsigned DEFAULT '0',
  `comments` int(5) unsigned DEFAULT '0',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_group_subject_comment`
--

CREATE TABLE IF NOT EXISTS `isns_group_subject_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `subject_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_group_type`
--

CREATE TABLE IF NOT EXISTS `isns_group_type` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_num` mediumint(8) unsigned DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `isns_group_type`
--

INSERT INTO `isns_group_type` (`id`, `order_num`, `name`) VALUES
(1, 1, '时尚生活'),
(2, 2, '影视天地'),
(3, 3, '极品音乐'),
(4, 4, '旅游天下'),
(5, 5, '运动休闲'),
(6, 6, '校园联盟'),
(7, 7, '网络互联'),
(8, 8, '至爱宠物'),
(9, 9, '明星粉丝'),
(10, 10, '文学艺术'),
(11, 11, '同城同乡'),
(12, 12, '两性情感'),
(13, 13, '游戏动漫'),
(14, 14, '投资理财'),
(15, 15, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `isns_guest`
--

CREATE TABLE IF NOT EXISTS `isns_guest` (
  `guest_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `guest_user_id` mediumint(8) unsigned NOT NULL,
  `guest_user_name` varchar(20) DEFAULT NULL,
  `guest_user_ico` varchar(150) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`guest_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `isns_guest`
--

INSERT INTO `isns_guest` (`guest_id`, `guest_user_id`, `guest_user_name`, `guest_user_ico`, `user_id`, `add_time`) VALUES
(15, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 2, '2013-12-05 20:20:37'),
(10, 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-11-30 00:45:09'),
(11, 6, '', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-11-30 13:12:47'),
(17, 5, 'lihuaxin0033@163.com', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-12-06 17:35:47'),
(18, 15, 'vava', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-12-07 02:21:36');

-- --------------------------------------------------------

--
-- 表的结构 `isns_hi`
--

CREATE TABLE IF NOT EXISTS `isns_hi` (
  `hi_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user_name` varchar(20) DEFAULT NULL,
  `from_user_ico` varchar(150) DEFAULT NULL,
  `hi` tinyint(2) DEFAULT NULL,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`hi_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_integral`
--

CREATE TABLE IF NOT EXISTS `isns_integral` (
  `operation` varchar(20) DEFAULT NULL,
  `integral` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `isns_integral`
--

INSERT INTO `isns_integral` (`operation`, `integral`) VALUES
('blog', 2),
('photo', 1),
('com_sub', 1),
('subject', 2),
('com_msg', 1),
('login', 10),
('invited', 20),
('one_ico', 40),
('del_blog', -2),
('del_photo', -1),
('del_subject', -2),
('del_com_msg', -1),
('del_com_sub', -1),
('convert', 100),
('upgrade', 5),
('poll', 2),
('del_poll', -2),
('share', 2),
('del_share', -2);

-- --------------------------------------------------------

--
-- 表的结构 `isns_invite_code`
--

CREATE TABLE IF NOT EXISTS `isns_invite_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sendor_id` mediumint(8) NOT NULL,
  `code_txt` varchar(20) NOT NULL,
  `is_admin` tinyint(2) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_txt` (`code_txt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_mood`
--

CREATE TABLE IF NOT EXISTS `isns_mood` (
  `mood_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_ico` varchar(150) NOT NULL,
  `mood` text,
  `comments` int(5) unsigned DEFAULT '0',
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mood_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `isns_mood`
--

INSERT INTO `isns_mood` (`mood_id`, `user_id`, `user_name`, `user_ico`, `mood`, `comments`, `add_time`) VALUES
(1, 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', '[em_6]', 1, '2013-11-24 10:49:28'),
(2, 1, 'muxiaonuo', 'skin/default/jooyea/images/d_ico_1_small.gif', '哈哈哈哈哈哈哈哈[em_17]', 0, '2013-11-24 10:51:26'),
(3, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '我是猪猪', 1, '2013-11-24 16:24:42'),
(4, 1, 'muxiaonuo', '', 'fwvw', 0, '2013-11-24 20:04:11'),
(5, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 'vdsb', 0, '2013-11-29 22:37:44');

-- --------------------------------------------------------

--
-- 表的结构 `isns_mood_comment`
--

CREATE TABLE IF NOT EXISTS `isns_mood_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mood_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `mood_id` (`mood_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_mood_comment`
--

INSERT INTO `isns_mood_comment` (`comment_id`, `mood_id`, `host_id`, `visitor_id`, `visitor_name`, `content`, `add_time`, `visitor_ico`, `is_hidden`) VALUES
(1, 1, 2, 1, 'muxiaonuo', '加好友既然不需要验证。。。', '2013-11-24 10:55:50', 'skin/default/jooyea/images/d_ico_1_small.gif', 0),
(3, 3, 1, 1, 'muxiaonuo', '猪猪你妹！', '2013-11-24 16:51:31', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_msgboard`
--

CREATE TABLE IF NOT EXISTS `isns_msgboard` (
  `mess_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user_name` varchar(20) DEFAULT NULL,
  `from_user_ico` varchar(150) DEFAULT NULL,
  `message` text,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`mess_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_msg_inbox`
--

CREATE TABLE IF NOT EXISTS `isns_msg_inbox` (
  `mess_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mess_title` varchar(70) DEFAULT NULL,
  `mess_content` varchar(500) DEFAULT NULL,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user` varchar(20) DEFAULT NULL,
  `from_user_ico` varchar(150) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `mesinit_id` mediumint(8) unsigned DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`mess_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `isns_msg_inbox`
--

INSERT INTO `isns_msg_inbox` (`mess_id`, `mess_title`, `mess_content`, `from_user_id`, `from_user`, `from_user_ico`, `user_id`, `add_time`, `mesinit_id`, `readed`) VALUES
(1, 'berwin添加您为好友', 'berwin添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 2, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-11-24 10:50:33', 0, 0),
(2, 'muxiaonuo添加您为好友', 'muxiaonuo添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 1, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 2, '2013-11-24 10:55:27', 0, 1),
(3, 'lihuaxin0033@163.com添加您为好友', 'lihuaxin0033@163.com添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 5, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-12-06 17:35:41', 0, 0),
(4, 'vava添加您为好友', 'vava添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 15, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-12-07 02:21:32', 0, 0),
(5, 'shishikan添加您为好友', 'shishikan添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 16, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-12-07 03:26:38', 0, 0),
(6, 'shishikan添加您为好友', 'shishikan添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 16, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 2, '2013-12-07 03:26:40', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_msg_outbox`
--

CREATE TABLE IF NOT EXISTS `isns_msg_outbox` (
  `mess_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mess_title` varchar(70) DEFAULT NULL,
  `mess_content` varchar(500) DEFAULT NULL,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `to_user` varchar(20) DEFAULT NULL,
  `to_user_ico` varchar(150) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `state` tinyint(2) DEFAULT '0',
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mess_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_online`
--

CREATE TABLE IF NOT EXISTS `isns_online` (
  `online_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_sex` tinyint(2) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `birth_year` varchar(6) DEFAULT NULL,
  `birth_province` varchar(30) DEFAULT NULL,
  `birth_city` varchar(30) DEFAULT NULL,
  `reside_province` varchar(30) DEFAULT NULL,
  `reside_city` varchar(30) DEFAULT NULL,
  `active_time` int(10) DEFAULT '0',
  `hidden` tinyint(2) DEFAULT '0',
  `session_code` char(32) DEFAULT NULL,
  PRIMARY KEY (`online_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

--
-- 转存表中的数据 `isns_online`
--

INSERT INTO `isns_online` (`online_id`, `user_id`, `user_name`, `user_sex`, `user_ico`, `birth_year`, `birth_province`, `birth_city`, `reside_province`, `reside_city`, `active_time`, `hidden`, `session_code`) VALUES
(117, 1, 'muxiaonuo', 1, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', NULL, NULL, NULL, NULL, NULL, 1386372684, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `isns_pals_def_sort`
--

CREATE TABLE IF NOT EXISTS `isns_pals_def_sort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_num` smallint(5) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_pals_def_sort`
--

INSERT INTO `isns_pals_def_sort` (`id`, `order_num`, `name`) VALUES
(1, 1, '亲朋'),
(2, 2, '好友'),
(3, 3, '同学');

-- --------------------------------------------------------

--
-- 表的结构 `isns_pals_mine`
--

CREATE TABLE IF NOT EXISTS `isns_pals_mine` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `pals_id` mediumint(8) unsigned NOT NULL,
  `pals_sort_id` smallint(5) DEFAULT '0',
  `pals_sort_name` varchar(20) DEFAULT NULL,
  `pals_name` varchar(20) DEFAULT NULL,
  `pals_sex` tinyint(2) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `pals_ico` varchar(150) DEFAULT NULL,
  `accepted` tinyint(2) NOT NULL DEFAULT '0',
  `active_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pals_id` (`pals_id`),
  KEY `pals_sort_id` (`pals_sort_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `isns_pals_mine`
--

INSERT INTO `isns_pals_mine` (`id`, `user_id`, `pals_id`, `pals_sort_id`, `pals_sort_name`, `pals_name`, `pals_sex`, `add_time`, `pals_ico`, `accepted`, `active_time`) VALUES
(1, 2, 1, 0, NULL, 'muxiaonuo', 1, '2013-11-24 10:50:33', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 2, '2013-12-07 02:26:01'),
(2, 1, 2, 0, NULL, 'berwin', 1, '2013-11-24 10:55:27', 'skin/default/jooyea/images/d_ico_1_small.gif', 2, '2013-11-30 00:45:13'),
(3, 5, 1, 0, NULL, 'muxiaonuo', 1, '2013-12-06 17:35:41', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 1, '2013-12-07 02:26:01'),
(4, 15, 1, 0, NULL, 'muxiaonuo', 1, '2013-12-07 02:21:32', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 1, '2013-12-07 02:26:01'),
(5, 16, 1, 0, NULL, 'muxiaonuo', 1, '2013-12-07 03:26:38', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 1, NULL),
(6, 16, 2, 0, NULL, 'berwin', 1, '2013-12-07 03:26:40', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `isns_pals_request`
--

CREATE TABLE IF NOT EXISTS `isns_pals_request` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `req_id` mediumint(8) unsigned NOT NULL,
  `req_name` varchar(20) DEFAULT NULL,
  `req_sex` tinyint(2) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `req_ico` varchar(150) DEFAULT NULL,
  `from_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_pals_sort`
--

CREATE TABLE IF NOT EXISTS `isns_pals_sort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `count` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `isns_pals_sort`
--

INSERT INTO `isns_pals_sort` (`id`, `name`, `user_id`, `count`) VALUES
(1, '亲朋', 1, 0),
(2, '好友', 1, 0),
(3, '同学', 1, 0),
(4, '亲朋', 2, 0),
(5, '好友', 2, 0),
(6, '同学', 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_photo`
--

CREATE TABLE IF NOT EXISTS `isns_photo` (
  `photo_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `photo_name` varchar(20) DEFAULT NULL,
  `photo_information` text,
  `add_time` datetime DEFAULT NULL,
  `photo_src` varchar(150) DEFAULT NULL,
  `photo_thumb_src` varchar(150) DEFAULT NULL,
  `album_id` mediumint(8) unsigned NOT NULL,
  `is_pass` tinyint(2) DEFAULT '1',
  `privacy` varchar(200) DEFAULT NULL,
  `comments` int(5) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `album_id` (`album_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `isns_photo`
--

INSERT INTO `isns_photo` (`photo_id`, `user_id`, `user_name`, `photo_name`, `photo_information`, `add_time`, `photo_src`, `photo_thumb_src`, `album_id`, `is_pass`, `privacy`, `comments`, `tag`) VALUES
(1, 1, 'muxiaonuo', 'a', '', '2013-11-24 10:58:50', 'uploadfiles/album/2013/11/24/2013112410585048.gif', 'uploadfiles/album/2013/11/24/thumb_2013112410585048.gif', 1, 1, '', 0, NULL),
(2, 1, 'muxiaonuo', 'snslogo (2)', 'sc', '2013-11-29 22:37:22', 'uploadfiles/album/2013/11/29/2013112910372266.gif', 'uploadfiles/album/2013/11/29/thumb_2013112910372266.gif', 1, 1, '', 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `isns_photo_comment`
--

CREATE TABLE IF NOT EXISTS `isns_photo_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `readed` tinyint(2) DEFAULT '0',
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `photo_id` (`photo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_plugins`
--

CREATE TABLE IF NOT EXISTS `isns_plugins` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `valid` tinyint(2) DEFAULT '0',
  `autoorder` tinyint(2) DEFAULT '0',
  `reg_date` datetime NOT NULL,
  `image` varchar(150) NOT NULL,
  `comment_num` mediumint(8) unsigned DEFAULT '0',
  `use_num` mediumint(8) unsigned DEFAULT '0',
  `info` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_plugin_url`
--

CREATE TABLE IF NOT EXISTS `isns_plugin_url` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `layout_id` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sequence` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_poll`
--

CREATE TABLE IF NOT EXISTS `isns_poll` (
  `p_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `username` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `subject` varchar(80) DEFAULT '',
  `voternum` mediumint(8) unsigned DEFAULT '0',
  `comments` int(5) unsigned DEFAULT '0',
  `multiple` tinyint(2) DEFAULT '0',
  `maxchoice` tinyint(3) DEFAULT '0',
  `sex` tinyint(2) DEFAULT '0',
  `noreply` tinyint(2) DEFAULT '0',
  `credit` smallint(5) unsigned DEFAULT '0',
  `percredit` smallint(5) unsigned DEFAULT '0',
  `expiration` date DEFAULT NULL,
  `lastvote` datetime DEFAULT NULL,
  `dateline` datetime DEFAULT NULL,
  `message` text,
  `summary` text,
  `option` text,
  `is_pass` tinyint(2) DEFAULT '1',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_polloption`
--

CREATE TABLE IF NOT EXISTS `isns_polloption` (
  `oid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `votenum` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_polluser`
--

CREATE TABLE IF NOT EXISTS `isns_polluser` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) DEFAULT '',
  `pid` mediumint(8) unsigned DEFAULT '0',
  `option` text,
  `dateline` datetime DEFAULT NULL,
  `anony` tinyint(2) NOT NULL DEFAULT '0',
  KEY `pid` (`pid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `isns_poll_comment`
--

CREATE TABLE IF NOT EXISTS `isns_poll_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` mediumint(8) unsigned DEFAULT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `p_id` mediumint(8) unsigned DEFAULT NULL,
  `host_id` mediumint(8) unsigned DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` text,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `p_id` (`p_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_recent_affair`
--

CREATE TABLE IF NOT EXISTS `isns_recent_affair` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(2) DEFAULT '0',
  `title` varchar(500) DEFAULT NULL,
  `content` text,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `for_content_id` mediumint(8) DEFAULT '0',
  `mod_type` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  KEY `mod_type` (`mod_type`,`for_content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `isns_recent_affair`
--

INSERT INTO `isns_recent_affair` (`id`, `type_id`, `title`, `content`, `user_id`, `user_name`, `user_ico`, `date_time`, `update_time`, `for_content_id`, `mod_type`) VALUES
(1, 1, '心情更新', '[em_6]', 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-11-24 10:49:28', '2013-11-24 10:49:28', 1, 6),
(2, 1, '心情更新', '哈哈哈哈哈哈哈哈[em_17]', 1, 'muxiaonuo', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-11-24 10:51:26', '2013-11-24 10:51:26', 2, 6),
(3, 2, '在相册<a href="home.php?h=1&app=photo_list&album_id=1" target="_blank">fsf</a>中上传了新照片', '<a href="home.php?h=1&app=photo&photo_id=1&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/11/24/thumb_2013112410585048.gif"></a>', 1, 'muxiaonuo', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-11-24 10:58:52', '2013-11-24 10:58:52', 1, 3),
(4, 1, '头像更新为', '<img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/photo_store/2013/11/24/2013112411002844_ico.jpg" align="top">', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-24 11:00:47', '2013-11-24 11:00:47', 0, 7),
(5, 1, '心情更新', '我是猪猪', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-24 16:24:42', '2013-11-24 16:24:42', 3, 6),
(6, 1, '心情更新', 'fwvw', 1, 'muxiaonuo', '', '2013-11-24 20:04:11', '2013-11-24 20:04:11', 4, 6),
(14, 0, '加入了活动<a href="home.php?h=1&app=event_space&event_id=2" target="_blank">去杭州玩！</a>', '<a href="home.php?h=1&app=event_space&event_id=2" target="_blank">去杭州玩！</a>', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-12-07 02:26:01', '2013-12-07 02:26:01', 0, 11),
(8, 2, '在相册<a href="home.php?h=1&app=photo_list&album_id=1" target="_blank">fsf</a>中上传了新照片', '<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/11/29/thumb_2013112910372266.gif"></a>', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-29 22:37:27', '2013-11-29 22:37:27', 2, 3),
(9, 1, '心情更新', 'vdsb', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-29 22:37:44', '2013-11-29 22:37:44', 5, 6),
(10, 4, '分享了<a href="home.php?h=1" target="_blank">muxiaonuo</a>的照片<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank">snslogo (2)</a>', '<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/11/29/thumb_2013112910372266.gif"/></a>', 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-11-30 00:45:13', '2013-11-30 00:45:13', 1, 5),
(12, 3, '写了新游记<a href="home.php?h=1&app=blog&id=3" target=_blank>三亚的东西！！</a>', '-----有些人或地方一直没机会见，等有机会见了，却又犹豫了，相见争如怀念。\r\n\r\n甫一出站，我那晃荡得早已疲惫一夜的心瞬间被治愈了。火车到站的时间比较早，三亚的天才刚微微亮，晨曦的微光依稀.....', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-12-06 15:02:05', '2013-12-06 15:02:05', 3, 0),
(13, 3, '写了新游记<a href="home.php?h=1&app=blog&id=4" target=_blank>猪猪思密达</a>', '来到厦门这个城市两年多了，在此之前来过厦门两次，每一次都爱这个城市多一点，所以第三次就干脆不走了。在厦门的两年多时间，每一年都会出一版新的攻略，因为对这个城市了解的越多，爱这个地方.....', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-12-06 15:03:48', '2013-12-06 15:03:48', 4, 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_recommend`
--

CREATE TABLE IF NOT EXISTS `isns_recommend` (
  `recommend_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `is_pass` tinyint(2) DEFAULT '1',
  `guest_num` mediumint(8) DEFAULT '0',
  `user_sex` tinyint(2) DEFAULT '0',
  `rec_class` tinyint(2) DEFAULT '0',
  `rec_order` tinyint(2) DEFAULT '0',
  `show_ico` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`recommend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_remind`
--

CREATE TABLE IF NOT EXISTS `isns_remind` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `type_id` tinyint(2) NOT NULL,
  `date` datetime NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `is_focus` tinyint(2) NOT NULL,
  `from_uid` mediumint(8) unsigned NOT NULL,
  `from_uname` varchar(20) NOT NULL,
  `from_uico` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `count` mediumint(8) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`is_focus`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `isns_remind`
--

INSERT INTO `isns_remind` (`id`, `user_id`, `type_id`, `date`, `content`, `is_focus`, `from_uid`, `from_uname`, `from_uico`, `link`, `count`) VALUES
(3, 2, 0, '2013-11-24 10:55:50', '在心情<a href={link} onclick={js} target=_blank>[em_6]</a>中回复了您', 1, 1, 'muxiaonuo', 'skin/default/jooyea/images/d_ico_1_small.gif', 'home.php?h=2&app=mood_more&remind=1&mod=1', 1),
(7, 1, 1, '2013-12-07 03:26:38', '{num}个通知', 0, 16, 'shishikan', 'skin/default/jooyea/images/d_ico_1_small.gif', 'modules.php?app=msg_notice', 1),
(8, 2, 1, '2013-12-07 03:26:40', '{num}个通知', 0, 16, 'shishikan', 'skin/default/jooyea/images/d_ico_1_small.gif', 'modules.php?app=msg_notice', 1);

-- --------------------------------------------------------

--
-- 表的结构 `isns_report`
--

CREATE TABLE IF NOT EXISTS `isns_report` (
  `report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `reason` varchar(150) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` text,
  `add_time` datetime DEFAULT NULL,
  `reported_id` mediumint(8) unsigned DEFAULT NULL,
  `userd_id` mediumint(8) unsigned DEFAULT NULL,
  `rep_num` mediumint(8) unsigned DEFAULT '1',
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_share`
--

CREATE TABLE IF NOT EXISTS `isns_share` (
  `s_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(2) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `content` text,
  `s_title` varchar(300) DEFAULT NULL,
  `out_link` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `for_content_id` mediumint(8) unsigned DEFAULT NULL,
  `comments` int(5) unsigned DEFAULT '0',
  `movie_thumb` varchar(255) DEFAULT NULL,
  `movie_link` varchar(255) DEFAULT NULL,
  `is_pass` tinyint(2) DEFAULT '1',
  `tag` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`,`for_content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `isns_share`
--

INSERT INTO `isns_share` (`s_id`, `type_id`, `user_id`, `user_name`, `user_ico`, `content`, `s_title`, `out_link`, `add_time`, `for_content_id`, `comments`, `movie_thumb`, `movie_link`, `is_pass`, `tag`) VALUES
(1, 3, 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', '<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/11/29/thumb_2013112910372266.gif"/></a>', '分享了<a href="home.php?h=1" target="_blank">muxiaonuo</a>的照片<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank">snslogo (2)</a>', '', '2013-11-30 00:45:13', 2, 0, '', '', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `isns_share_comment`
--

CREATE TABLE IF NOT EXISTS `isns_share_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` mediumint(8) unsigned DEFAULT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `s_id` mediumint(8) unsigned DEFAULT NULL,
  `host_id` mediumint(8) unsigned DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` text,
  `visitor_ico` varchar(150) DEFAULT NULL,
  `is_hidden` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_tag`
--

CREATE TABLE IF NOT EXISTS `isns_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `count` mediumint(8) DEFAULT '0',
  `hot` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `isns_tag`
--

INSERT INTO `isns_tag` (`id`, `name`, `count`, `hot`) VALUES
(2, '上海', 1, 0),
(4, '四川', 1, 0),
(5, '三亚', 1, 0),
(6, '北京', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `isns_tag_relation`
--

CREATE TABLE IF NOT EXISTS `isns_tag_relation` (
  `id` mediumint(8) unsigned NOT NULL,
  `mod_id` mediumint(8) NOT NULL,
  `content_id` mediumint(8) NOT NULL,
  KEY `id` (`id`),
  KEY `mod_id` (`mod_id`),
  KEY `content_id` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `isns_tag_relation`
--

INSERT INTO `isns_tag_relation` (`id`, `mod_id`, `content_id`) VALUES
(2, 0, 3),
(4, 0, 3),
(5, 0, 3),
(6, 0, 4);

-- --------------------------------------------------------

--
-- 表的结构 `isns_tmp_file`
--

CREATE TABLE IF NOT EXISTS `isns_tmp_file` (
  `mod_id` mediumint(8) unsigned NOT NULL,
  `mod_count` mediumint(8) unsigned DEFAULT '0',
  `affair_array` text,
  `data_array` text,
  PRIMARY KEY (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `isns_uploadfile`
--

CREATE TABLE IF NOT EXISTS `isns_uploadfile` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `file_src` varchar(150) DEFAULT NULL,
  `file_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `isns_uploadfile`
--

INSERT INTO `isns_uploadfile` (`id`, `user_id`, `add_time`, `file_src`, `file_name`) VALUES
(1, 1, '2013-11-24 11:00:28', 'uploadfiles/photo_store/2013/11/24/2013112411002844.jpg', 'h_large_12tM_daf000000579113e.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `isns_users`
--

CREATE TABLE IF NOT EXISTS `isns_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pws` char(32) DEFAULT NULL,
  `user_sex` tinyint(2) DEFAULT NULL,
  `birth_province` varchar(30) DEFAULT NULL,
  `birth_city` varchar(30) DEFAULT NULL,
  `reside_province` varchar(30) DEFAULT NULL,
  `reside_city` varchar(30) DEFAULT NULL,
  `user_ico` varchar(150) DEFAULT NULL,
  `is_pass` tinyint(2) DEFAULT '1',
  `user_add_time` datetime DEFAULT NULL,
  `birth_year` char(6) DEFAULT NULL,
  `birth_month` char(4) DEFAULT NULL,
  `birth_day` char(4) DEFAULT NULL,
  `creat_group` varchar(150) DEFAULT NULL,
  `join_group` varchar(150) DEFAULT NULL,
  `guest_num` mediumint(8) unsigned DEFAULT '0',
  `integral` mediumint(8) DEFAULT '10',
  `access_limit` tinyint(2) DEFAULT '0',
  `access_questions` varchar(100) DEFAULT NULL,
  `access_answers` varchar(100) DEFAULT NULL,
  `inputmess_limit` tinyint(2) DEFAULT '0',
  `palsreq_limit` tinyint(2) DEFAULT '0',
  `lastlogin_datetime` datetime DEFAULT NULL,
  `invite_from_uid` mediumint(8) unsigned DEFAULT NULL,
  `hidden_pals_id` text,
  `hidden_type_id` text,
  `login_ip` char(15) DEFAULT NULL,
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0',
  `dressup` varchar(20) DEFAULT '0',
  `use_plugins` varchar(1000) DEFAULT NULL,
  `use_apps` varchar(1000) DEFAULT NULL,
  `user_group` varchar(30) DEFAULT 'base',
  `forget_pass` varchar(50) DEFAULT NULL,
  `activation_id` int(8) DEFAULT '-1' COMMENT '激活码id值',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `isns_users`
--

INSERT INTO `isns_users` (`user_id`, `user_email`, `user_name`, `user_pws`, `user_sex`, `birth_province`, `birth_city`, `reside_province`, `reside_city`, `user_ico`, `is_pass`, `user_add_time`, `birth_year`, `birth_month`, `birth_day`, `creat_group`, `join_group`, `guest_num`, `integral`, `access_limit`, `access_questions`, `access_answers`, `inputmess_limit`, `palsreq_limit`, `lastlogin_datetime`, `invite_from_uid`, `hidden_pals_id`, `hidden_type_id`, `login_ip`, `is_recommend`, `dressup`, `use_plugins`, `use_apps`, `user_group`, `forget_pass`, `activation_id`) VALUES
(1, 'lihuaxin0033@163.com', 'muxiaonuo', '6572bdaff799084b973320f43f09b363', 1, NULL, NULL, NULL, NULL, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 1, '2013-11-23 22:33:12', '', '', '', NULL, NULL, 4, 81, 0, NULL, NULL, 0, 0, '2013-11-30 13:08:07', 0, NULL, NULL, '127.0.0.1', 0, 'cyan', NULL, NULL, 'base', NULL, -1),
(2, 'bwbw1992@163.com', 'berwin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-11-24 10:49:14', '', '', '', NULL, NULL, 1, 12, 0, NULL, NULL, 0, 0, '2013-11-24 10:49:14', 0, NULL, NULL, '59.78.8.155', 0, '0', NULL, NULL, 'base', NULL, -1),
(5, 'bwbwbw', 'lihuaxin0033@163.com', 'lihuaxin003', 0, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 0, '2013-11-24 10:49:14', '', '', '', NULL, NULL, 0, 11, 0, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, '', 0, '0', NULL, NULL, 'base', NULL, -1),
(18, 'xindongfang@gmail.com', '新东方', '243e61e9410a9f577d2d662c67025ee9', 1, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 0, '0000-00-00 00:00:00', '', '', '', NULL, NULL, 0, 10, 0, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, '', 0, '0', NULL, NULL, 'base', NULL, -1),
(20, 'xiecheng@126.com', '携程', '243e61e9410a9f577d2d662c67025ee9', 1, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 0, '0000-00-00 00:00:00', '', '', '', NULL, NULL, 0, 10, 0, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, '', 0, '0', NULL, NULL, 'base', NULL, -1),
(16, 'shishikan@163.com', 'shishikan', '243e61e9410a9f577d2d662c67025ee9', 1, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 0, '0000-00-00 00:00:00', '', '', '', NULL, NULL, 0, 10, 0, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, '', 0, '0', NULL, NULL, 'base', NULL, -1),
(15, 'agagaga@163.com', 'vava', '243e61e9410a9f577d2d662c67025ee9', 1, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 0, '0000-00-00 00:00:00', '', '', '', NULL, NULL, 0, 10, 0, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, '', 0, '0', NULL, NULL, 'base', NULL, -1),
(17, 'vdwvwv', 'vewv', '243e61e9410a9f577d2d662c67025ee9', 1, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 0, '0000-00-00 00:00:00', '', '', '', NULL, NULL, 0, 10, 0, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, '', 0, '0', NULL, NULL, 'base', NULL, -1);

-- --------------------------------------------------------

--
-- 表的结构 `isns_user_activation`
--

CREATE TABLE IF NOT EXISTS `isns_user_activation` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `time` datetime NOT NULL COMMENT '时间戳',
  `activation_code` varchar(100) NOT NULL COMMENT '激活码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户激活注册表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_user_info`
--

CREATE TABLE IF NOT EXISTS `isns_user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'user表ID',
  `info_id` int(10) NOT NULL DEFAULT '0' COMMENT '信息表ID',
  `info_value` text COMMENT '信息值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `isns_user_information`
--

CREATE TABLE IF NOT EXISTS `isns_user_information` (
  `info_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `info_name` varchar(255) NOT NULL COMMENT '信息名称',
  `input_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '信息input类型 0:text,1:select,2:radio,3:checkbox',
  `info_values` text COMMENT '信息值 一行代表一个',
  `sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示排序',
  PRIMARY KEY (`info_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `isns_user_information`
--

INSERT INTO `isns_user_information` (`info_id`, `info_name`, `input_type`, `info_values`, `sort`) VALUES
(1, '婚恋状态', 1, '保密\r\n单身\r\n非单身', 0),
(2, '血型', 1, '保密\r\nA\r\nB\r\nO\r\nAB', 0),
(3, 'QQ', 0, '', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
