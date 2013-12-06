-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2013 年 12 月 06 日 02:49
-- 服务器版本: 5.0.51
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `iwebsns`
-- 

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_admin`
-- 

CREATE TABLE `isns_admin` (
  `admin_id` smallint(5) unsigned NOT NULL auto_increment,
  `admin_name` varchar(20) NOT NULL,
  `admin_password` char(32) NOT NULL,
  `admin_group` varchar(20) default NULL,
  `is_pass` tinyint(2) unsigned default '1',
  `active_time` datetime default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `isns_admin`
-- 

INSERT INTO `isns_admin` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'superadmin', 1, '2013-11-23 22:30:42');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_album`
-- 

CREATE TABLE `isns_album` (
  `album_id` mediumint(8) unsigned NOT NULL auto_increment,
  `album_name` varchar(20) default NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) default NULL,
  `album_info` varchar(150) default NULL,
  `add_time` datetime default NULL,
  `update_time` datetime default NULL,
  `album_skin` varchar(150) default NULL,
  `photo_num` smallint(5) unsigned default '0',
  `is_pass` tinyint(2) default '1',
  `privacy` varchar(200) default NULL,
  `comments` int(5) unsigned NOT NULL default '0',
  `tag` varchar(80) default NULL,
  PRIMARY KEY  (`album_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `isns_album`
-- 

INSERT INTO `isns_album` VALUES (1, 'fsf', 1, 'muxiaonuo', 'bgrge', '2013-11-24 10:56:55', '2013-11-29 22:37:22', 'uploadfiles/album/2013/11/24/thumb_2013112410585048.gif', 2, 1, '', 0, '');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_album_comment`
-- 

CREATE TABLE `isns_album_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `visitor_ico` varchar(150) default NULL,
  `is_hidden` tinyint(2) NOT NULL default '0',
  `album_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `readed` tinyint(2) default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `album_id` (`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_album_comment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_ask`
-- 

CREATE TABLE `isns_ask` (
  `ask_id` int(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) NOT NULL COMMENT '提问者id',
  `user_name` varchar(15) NOT NULL COMMENT '提问者名字',
  `title` varchar(200) NOT NULL COMMENT '问题',
  `detail` text COMMENT '详细',
  `replenish` text COMMENT '问题补充',
  `type_id` mediumint(6) NOT NULL COMMENT '问题分类id',
  `type_name` varchar(20) NOT NULL COMMENT '类别名',
  `reward` smallint(8) NOT NULL default '0' COMMENT '悬赏积分',
  `reply_num` smallint(8) NOT NULL default '0' COMMENT '回答数量',
  `view_num` smallint(8) NOT NULL default '0' COMMENT '查看次数',
  `status` tinyint(2) NOT NULL default '0' COMMENT '问题状态 0待解决 1已解决',
  `add_time` datetime NOT NULL COMMENT '提问时间',
  `reply_time` datetime default NULL COMMENT '最后回答时间',
  `solved_time` datetime default NULL COMMENT '解决时间',
  PRIMARY KEY  (`ask_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_ask`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_ask_reply`
-- 

CREATE TABLE `isns_ask_reply` (
  `reply_id` int(8) unsigned NOT NULL auto_increment,
  `ask_id` int(8) NOT NULL COMMENT '问题id',
  `user_id` mediumint(8) NOT NULL COMMENT '回答者id',
  `user_name` varchar(15) NOT NULL COMMENT '回答者名字',
  `user_ico` varchar(150) NOT NULL COMMENT '回答者头像',
  `content` text NOT NULL COMMENT '回答内容',
  `add_time` datetime NOT NULL COMMENT '回答时间',
  `edit_time` datetime default NULL COMMENT '修改时间',
  `is_answer` tinyint(2) NOT NULL default '0' COMMENT '是否满意答案 0否 1是',
  PRIMARY KEY  (`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='回答表' AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_ask_reply`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_ask_type`
-- 

CREATE TABLE `isns_ask_type` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `order_num` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- 
-- 导出表中的数据 `isns_ask_type`
-- 

INSERT INTO `isns_ask_type` VALUES (1, '创业起步', 1);
INSERT INTO `isns_ask_type` VALUES (2, '市场营销', 2);
INSERT INTO `isns_ask_type` VALUES (3, '企业管理', 3);
INSERT INTO `isns_ask_type` VALUES (4, '财务/资本', 4);
INSERT INTO `isns_ask_type` VALUES (5, '法律咨询', 5);
INSERT INTO `isns_ask_type` VALUES (6, '人力资源', 6);
INSERT INTO `isns_ask_type` VALUES (7, '工作/生活', 7);
INSERT INTO `isns_ask_type` VALUES (9, '其他', 8);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_backgroup`
-- 

CREATE TABLE `isns_backgroup` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `gid` varchar(20) default NULL,
  `name` varchar(40) default NULL,
  `rights` text,
  `pluginrights` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_backgroup`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_blog`
-- 

CREATE TABLE `isns_blog` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned default NULL,
  `user_name` varchar(20) default NULL,
  `user_ico` varchar(150) default NULL,
  `log_title` varchar(80) default NULL,
  `log_sort` mediumint(8) NOT NULL default '0',
  `is_pass` tinyint(2) NOT NULL default '1',
  `log_sort_name` varchar(30) default NULL,
  `log_content` text,
  `add_time` datetime default NULL,
  `edit_time` datetime default NULL,
  `privacy` varchar(200) default NULL,
  `hits` mediumint(8) default '0',
  `comments` int(5) unsigned NOT NULL default '0',
  `tag` varchar(80) default NULL,
  PRIMARY KEY  (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `log_sort` (`log_sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `isns_blog`
-- 

INSERT INTO `isns_blog` VALUES (1, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 'gwg', 0, 1, '', 'gwgwgwg', '2013-11-29 14:57:51', NULL, '', 7, 0, 'g3g4g');
INSERT INTO `isns_blog` VALUES (2, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 'vwvvve', 1, 1, '远行', '&nbsp;ververvevbberbebe<br />\r\n<p><img src="./uploadfiles/album/2013/11/29/2013112910372266.gif" onload="parent.fixImage(this,420,0)" width="218" height="50" /></p>\r\n<p>vewvewvwev</p>', '2013-12-06 02:39:47', '2013-12-06 10:48:18', '', 1, 0, '上海 长沙');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_blog_comment`
-- 

CREATE TABLE `isns_blog_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `visitor_ico` varchar(150) default NULL,
  `is_hidden` tinyint(2) NOT NULL default '0',
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `log_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `readed` tinyint(2) default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `log_id` (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_blog_comment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_blog_sort`
-- 

CREATE TABLE `isns_blog_sort` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `isns_blog_sort`
-- 

INSERT INTO `isns_blog_sort` VALUES (1, '远行', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_currentuser`
-- 

CREATE TABLE `isns_currentuser` (
  `username` varchar(20) NOT NULL,
  `id` int(11) NOT NULL,
  `caifu` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `isns_currentuser`
-- 

INSERT INTO `isns_currentuser` VALUES ('lihuaxin0033@163.com', 1, 462);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_event`
-- 

CREATE TABLE `isns_event` (
  `event_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_name` varchar(15) NOT NULL default '',
  `dateline` int(10) unsigned NOT NULL default '0',
  `title` varchar(80) NOT NULL default '',
  `type_id` smallint(6) unsigned NOT NULL default '0',
  `province` varchar(20) NOT NULL default '',
  `city` varchar(20) NOT NULL default '',
  `location` varchar(80) NOT NULL default '',
  `poster` varchar(60) NOT NULL default '',
  `poster_thumb` varchar(60) NOT NULL default '',
  `thumb` tinyint(1) NOT NULL default '0',
  `remote` tinyint(1) NOT NULL default '0',
  `deadline` int(10) unsigned NOT NULL default '0',
  `start_time` int(10) unsigned NOT NULL default '0',
  `end_time` int(10) unsigned NOT NULL default '0',
  `public` tinyint(3) NOT NULL default '0',
  `member_num` mediumint(8) unsigned NOT NULL default '0',
  `follow_num` mediumint(8) unsigned NOT NULL default '0',
  `view_num` mediumint(8) unsigned NOT NULL default '0',
  `grade` tinyint(3) NOT NULL default '0',
  `photo_num` mediumint(8) unsigned NOT NULL default '0',
  `update_time` int(10) unsigned NOT NULL default '0',
  `detail` text NOT NULL,
  `template` varchar(255) NOT NULL default '',
  `limit_num` mediumint(8) unsigned NOT NULL default '0',
  `verify` tinyint(1) NOT NULL default '0',
  `allow_pic` tinyint(1) NOT NULL default '0',
  `allow_post` tinyint(1) NOT NULL default '0',
  `allow_invite` tinyint(1) NOT NULL default '0',
  `allow_fellow` tinyint(1) NOT NULL default '0',
  `is_pass` tinyint(1) NOT NULL default '1',
  `comments` int(5) NOT NULL default '0',
  PRIMARY KEY  (`event_id`),
  KEY `grade` (`grade`),
  KEY `member_num` (`member_num`),
  KEY `user_id` (`user_id`,`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `isns_event`
-- 

INSERT INTO `isns_event` VALUES (1, 1, 'muxiaonuo', 0, '北京 上海', 3, '甘肃', '兰州', 'mpkj', 'uploadfiles/event/default_event_poster.jpg', 'uploadfiles/event/default_event_poster.jpg', 0, 0, 1385794740, 1385621940, 1385794800, 2, 1, 0, 1, 1, 0, 1385708458, '北大法宝', '次的', 2, 0, 1, 1, 1, 0, 1, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_event_comment`
-- 

CREATE TABLE `isns_event_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `visitor_ico` varchar(150) default NULL,
  `is_hidden` tinyint(2) NOT NULL default '0',
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `event_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `readed` tinyint(2) default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_event_comment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_event_invite`
-- 

CREATE TABLE `isns_event_invite` (
  `event_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_name` varchar(15) NOT NULL default '',
  `to_user_id` mediumint(8) unsigned NOT NULL default '0',
  `to_user_name` char(15) NOT NULL default '',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`event_id`,`to_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `isns_event_invite`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_event_members`
-- 

CREATE TABLE `isns_event_members` (
  `event_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_name` varchar(15) NOT NULL default '',
  `user_sex` tinyint(2) NOT NULL default '0',
  `user_ico` varchar(150) NOT NULL default '',
  `reside_province` varchar(30) NOT NULL default '',
  `reside_city` varchar(30) NOT NULL default '',
  `dateline` int(10) unsigned NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '0',
  `fellow` mediumint(8) unsigned NOT NULL default '0',
  `template` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`event_id`,`user_id`),
  KEY `user_id` (`user_id`,`dateline`),
  KEY `event_id` (`event_id`,`status`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `isns_event_members`
-- 

INSERT INTO `isns_event_members` VALUES (1, 1, 'muxiaonuo', 1, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '', '', 1385708458, 4, 0, '');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_event_photo`
-- 

CREATE TABLE `isns_event_photo` (
  `photo_id` mediumint(8) unsigned NOT NULL auto_increment,
  `photo_src` varchar(200) default NULL,
  `photo_name` varchar(20) NOT NULL,
  `photo_information` varchar(200) default NULL,
  `photo_thumb_src` varchar(200) default NULL,
  `event_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_name` varchar(20) NOT NULL default '',
  `add_time` datetime default NULL,
  PRIMARY KEY  (`photo_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_event_photo`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_event_type`
-- 

CREATE TABLE `isns_event_type` (
  `type_id` smallint(6) unsigned NOT NULL auto_increment,
  `type_name` varchar(80) NOT NULL default '',
  `poster` varchar(100) NOT NULL default '',
  `poster_thumb` varchar(100) NOT NULL default '',
  `template` text NOT NULL,
  `display_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- 导出表中的数据 `isns_event_type`
-- 

INSERT INTO `isns_event_type` VALUES (1, '生活/聚会', '0', '', '<P><BR>费用说明:<BR>集合地点:<BR>着装要求:<BR>联系方式:<BR>注意事项:<BR></P>', 1);
INSERT INTO `isns_event_type` VALUES (2, '出行/旅游', '', '', '<P>路线说明:<BR>费用说明:<BR>装备要求:<BR>交通工具:<BR>集合地点:<BR>联系方式:<BR>注意事项:<BR></P>', 2);
INSERT INTO `isns_event_type` VALUES (3, '比赛/运动', '0', '', '<P>费用说明：<BR>集合地点：<BR>着装要求：<BR>场地介绍：<BR>联系方式：<BR>注意事项：<BR></P>', 3);
INSERT INTO `isns_event_type` VALUES (4, '电影/演出', '', '', '剧情介绍：<BR>费用说明：<BR>集合地点：<BR>联系方式：<BR>注意事项:<BR>', 4);
INSERT INTO `isns_event_type` VALUES (5, '教育/讲座', '', '', '主办单位：<BR>活动主题：<BR>费用说明：<BR>集合地点：<BR>联系方式：<BR>注意事项：<BR>', 5);
INSERT INTO `isns_event_type` VALUES (6, '其它', '0', '', '', 6);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_frontgroup`
-- 

CREATE TABLE `isns_frontgroup` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `gid` varchar(20) default NULL,
  `name` varchar(40) default NULL,
  `rights` text,
  `pluginrights` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_frontgroup`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_groups`
-- 

CREATE TABLE `isns_groups` (
  `group_id` mediumint(8) unsigned NOT NULL auto_increment,
  `add_userid` mediumint(8) unsigned NOT NULL,
  `is_pass` tinyint(2) NOT NULL default '1',
  `member_count` mediumint(8) unsigned default '1',
  `group_name` varchar(50) default NULL,
  `group_resume` varchar(100) default NULL,
  `group_time` datetime default NULL,
  `group_manager_name` varchar(60) default NULL,
  `group_manager_id` varchar(20) default NULL,
  `group_req_id` text,
  `group_creat_name` varchar(20) default NULL,
  `group_logo` varchar(150) default NULL,
  `group_join_type` tinyint(2) NOT NULL default '0',
  `group_type` varchar(20) default NULL,
  `group_type_id` smallint(5) unsigned default NULL,
  `affiche` varchar(200) default NULL,
  `tag` varchar(80) default NULL,
  `subjects_num` mediumint(8) unsigned default '0',
  `comments` mediumint(8) unsigned default '0',
  PRIMARY KEY  (`group_id`),
  KEY `add_userid` (`add_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_groups`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_group_members`
-- 

CREATE TABLE `isns_group_members` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned default NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) default NULL,
  `user_sex` tinyint(2) default NULL,
  `user_ico` varchar(150) default NULL,
  `state` tinyint(2) default NULL,
  `role` tinyint(2) default '2',
  `add_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_group_members`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_group_subject`
-- 

CREATE TABLE `isns_group_subject` (
  `subject_id` mediumint(8) unsigned NOT NULL auto_increment,
  `group_id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) default NULL,
  `user_ico` varchar(150) default NULL,
  `title` varchar(50) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `hits` int(5) unsigned default '0',
  `comments` int(5) unsigned default '0',
  `tag` varchar(80) default NULL,
  PRIMARY KEY  (`subject_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_group_subject`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_group_subject_comment`
-- 

CREATE TABLE `isns_group_subject_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `visitor_ico` varchar(150) default NULL,
  `is_hidden` tinyint(2) default '0',
  `group_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `subject_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `readed` tinyint(2) default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_group_subject_comment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_group_type`
-- 

CREATE TABLE `isns_group_type` (
  `id` mediumint(8) NOT NULL auto_increment,
  `order_num` mediumint(8) unsigned default NULL,
  `name` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- 
-- 导出表中的数据 `isns_group_type`
-- 

INSERT INTO `isns_group_type` VALUES (1, 1, '时尚生活');
INSERT INTO `isns_group_type` VALUES (2, 2, '影视天地');
INSERT INTO `isns_group_type` VALUES (3, 3, '极品音乐');
INSERT INTO `isns_group_type` VALUES (4, 4, '旅游天下');
INSERT INTO `isns_group_type` VALUES (5, 5, '运动休闲');
INSERT INTO `isns_group_type` VALUES (6, 6, '校园联盟');
INSERT INTO `isns_group_type` VALUES (7, 7, '网络互联');
INSERT INTO `isns_group_type` VALUES (8, 8, '至爱宠物');
INSERT INTO `isns_group_type` VALUES (9, 9, '明星粉丝');
INSERT INTO `isns_group_type` VALUES (10, 10, '文学艺术');
INSERT INTO `isns_group_type` VALUES (11, 11, '同城同乡');
INSERT INTO `isns_group_type` VALUES (12, 12, '两性情感');
INSERT INTO `isns_group_type` VALUES (13, 13, '游戏动漫');
INSERT INTO `isns_group_type` VALUES (14, 14, '投资理财');
INSERT INTO `isns_group_type` VALUES (15, 15, '其他');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_guest`
-- 

CREATE TABLE `isns_guest` (
  `guest_id` mediumint(8) unsigned NOT NULL auto_increment,
  `guest_user_id` mediumint(8) unsigned NOT NULL,
  `guest_user_name` varchar(20) default NULL,
  `guest_user_ico` varchar(150) default NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime default NULL,
  PRIMARY KEY  (`guest_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- 
-- 导出表中的数据 `isns_guest`
-- 

INSERT INTO `isns_guest` VALUES (15, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 2, '2013-12-05 20:20:37');
INSERT INTO `isns_guest` VALUES (10, 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-11-30 00:45:09');
INSERT INTO `isns_guest` VALUES (11, 6, '', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-11-30 13:12:47');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_hi`
-- 

CREATE TABLE `isns_hi` (
  `hi_id` mediumint(8) unsigned NOT NULL auto_increment,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user_name` varchar(20) default NULL,
  `from_user_ico` varchar(150) default NULL,
  `hi` tinyint(2) default NULL,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime default NULL,
  `readed` tinyint(2) default '0',
  PRIMARY KEY  (`hi_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_hi`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_integral`
-- 

CREATE TABLE `isns_integral` (
  `operation` varchar(20) default NULL,
  `integral` smallint(5) default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `isns_integral`
-- 

INSERT INTO `isns_integral` VALUES ('blog', 2);
INSERT INTO `isns_integral` VALUES ('photo', 1);
INSERT INTO `isns_integral` VALUES ('com_sub', 1);
INSERT INTO `isns_integral` VALUES ('subject', 2);
INSERT INTO `isns_integral` VALUES ('com_msg', 1);
INSERT INTO `isns_integral` VALUES ('login', 10);
INSERT INTO `isns_integral` VALUES ('invited', 20);
INSERT INTO `isns_integral` VALUES ('one_ico', 40);
INSERT INTO `isns_integral` VALUES ('del_blog', -2);
INSERT INTO `isns_integral` VALUES ('del_photo', -1);
INSERT INTO `isns_integral` VALUES ('del_subject', -2);
INSERT INTO `isns_integral` VALUES ('del_com_msg', -1);
INSERT INTO `isns_integral` VALUES ('del_com_sub', -1);
INSERT INTO `isns_integral` VALUES ('convert', 100);
INSERT INTO `isns_integral` VALUES ('upgrade', 5);
INSERT INTO `isns_integral` VALUES ('poll', 2);
INSERT INTO `isns_integral` VALUES ('del_poll', -2);
INSERT INTO `isns_integral` VALUES ('share', 2);
INSERT INTO `isns_integral` VALUES ('del_share', -2);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_invite_code`
-- 

CREATE TABLE `isns_invite_code` (
  `id` int(10) NOT NULL auto_increment,
  `sendor_id` mediumint(8) NOT NULL,
  `code_txt` varchar(20) NOT NULL,
  `is_admin` tinyint(2) NOT NULL default '0',
  `add_time` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code_txt` (`code_txt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_invite_code`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_mood`
-- 

CREATE TABLE `isns_mood` (
  `mood_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_ico` varchar(150) NOT NULL,
  `mood` text,
  `comments` int(5) unsigned default '0',
  `add_time` datetime default NULL,
  PRIMARY KEY  (`mood_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- 导出表中的数据 `isns_mood`
-- 

INSERT INTO `isns_mood` VALUES (1, 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', '[em_6]', 1, '2013-11-24 10:49:28');
INSERT INTO `isns_mood` VALUES (2, 1, 'muxiaonuo', 'skin/default/jooyea/images/d_ico_1_small.gif', '哈哈哈哈哈哈哈哈[em_17]', 0, '2013-11-24 10:51:26');
INSERT INTO `isns_mood` VALUES (3, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '我是猪猪', 1, '2013-11-24 16:24:42');
INSERT INTO `isns_mood` VALUES (4, 1, 'muxiaonuo', '', 'fwvw', 0, '2013-11-24 20:04:11');
INSERT INTO `isns_mood` VALUES (5, 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 'vdsb', 0, '2013-11-29 22:37:44');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_mood_comment`
-- 

CREATE TABLE `isns_mood_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `mood_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `visitor_ico` varchar(150) default NULL,
  `is_hidden` tinyint(2) default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `mood_id` (`mood_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `isns_mood_comment`
-- 

INSERT INTO `isns_mood_comment` VALUES (1, 1, 2, 1, 'muxiaonuo', '加好友既然不需要验证。。。', '2013-11-24 10:55:50', 'skin/default/jooyea/images/d_ico_1_small.gif', 0);
INSERT INTO `isns_mood_comment` VALUES (3, 3, 1, 1, 'muxiaonuo', '猪猪你妹！', '2013-11-24 16:51:31', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_msgboard`
-- 

CREATE TABLE `isns_msgboard` (
  `mess_id` mediumint(8) unsigned NOT NULL auto_increment,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user_name` varchar(20) default NULL,
  `from_user_ico` varchar(150) default NULL,
  `message` text,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime default NULL,
  `readed` tinyint(2) default '0',
  PRIMARY KEY  (`mess_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_msgboard`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_msg_inbox`
-- 

CREATE TABLE `isns_msg_inbox` (
  `mess_id` mediumint(8) unsigned NOT NULL auto_increment,
  `mess_title` varchar(70) default NULL,
  `mess_content` varchar(500) default NULL,
  `from_user_id` mediumint(8) unsigned NOT NULL,
  `from_user` varchar(20) default NULL,
  `from_user_ico` varchar(150) default NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime default NULL,
  `mesinit_id` mediumint(8) unsigned default NULL,
  `readed` tinyint(2) default '0',
  PRIMARY KEY  (`mess_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `isns_msg_inbox`
-- 

INSERT INTO `isns_msg_inbox` VALUES (1, 'berwin添加您为好友', 'berwin添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 2, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-11-24 10:50:33', 0, 0);
INSERT INTO `isns_msg_inbox` VALUES (2, 'muxiaonuo添加您为好友', 'muxiaonuo添加您为好友。<br />此条信息为系统发送，不必回复 <br />您可以<a href="javascript:{send_join_js}">加其为好友</a>或<a href="modules.php?app=mypals_search">搜索其他好友</a><br>', 1, '系统发送', 'skin/default/jooyea/images/d_ico_1_small.gif', 2, '2013-11-24 10:55:27', 0, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_msg_outbox`
-- 

CREATE TABLE `isns_msg_outbox` (
  `mess_id` mediumint(8) unsigned NOT NULL auto_increment,
  `mess_title` varchar(70) default NULL,
  `mess_content` varchar(500) default NULL,
  `to_user_id` mediumint(8) unsigned NOT NULL,
  `to_user` varchar(20) default NULL,
  `to_user_ico` varchar(150) default NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `state` tinyint(2) default '0',
  `add_time` datetime default NULL,
  PRIMARY KEY  (`mess_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_msg_outbox`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_online`
-- 

CREATE TABLE `isns_online` (
  `online_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) default NULL,
  `user_sex` tinyint(2) default NULL,
  `user_ico` varchar(150) default NULL,
  `birth_year` varchar(6) default NULL,
  `birth_province` varchar(30) default NULL,
  `birth_city` varchar(30) default NULL,
  `reside_province` varchar(30) default NULL,
  `reside_city` varchar(30) default NULL,
  `active_time` int(10) default '0',
  `hidden` tinyint(2) default '0',
  `session_code` char(32) default NULL,
  PRIMARY KEY  (`online_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

-- 
-- 导出表中的数据 `isns_online`
-- 

INSERT INTO `isns_online` VALUES (112, 1, 'muxiaonuo', 1, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', NULL, NULL, NULL, NULL, NULL, 1386297840, 0, NULL);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_pals_def_sort`
-- 

CREATE TABLE `isns_pals_def_sort` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `order_num` smallint(5) default NULL,
  `name` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `isns_pals_def_sort`
-- 

INSERT INTO `isns_pals_def_sort` VALUES (1, 1, '亲朋');
INSERT INTO `isns_pals_def_sort` VALUES (2, 2, '好友');
INSERT INTO `isns_pals_def_sort` VALUES (3, 3, '同学');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_pals_mine`
-- 

CREATE TABLE `isns_pals_mine` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `pals_id` mediumint(8) unsigned NOT NULL,
  `pals_sort_id` smallint(5) default '0',
  `pals_sort_name` varchar(20) default NULL,
  `pals_name` varchar(20) default NULL,
  `pals_sex` tinyint(2) default NULL,
  `add_time` datetime default NULL,
  `pals_ico` varchar(150) default NULL,
  `accepted` tinyint(2) NOT NULL default '0',
  `active_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `pals_id` (`pals_id`),
  KEY `pals_sort_id` (`pals_sort_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `isns_pals_mine`
-- 

INSERT INTO `isns_pals_mine` VALUES (1, 2, 1, 0, NULL, 'muxiaonuo', 1, '2013-11-24 10:50:33', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 2, '2013-12-06 02:39:47');
INSERT INTO `isns_pals_mine` VALUES (2, 1, 2, 0, NULL, 'berwin', 1, '2013-11-24 10:55:27', 'skin/default/jooyea/images/d_ico_1_small.gif', 2, '2013-11-30 00:45:13');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_pals_request`
-- 

CREATE TABLE `isns_pals_request` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `req_id` mediumint(8) unsigned NOT NULL,
  `req_name` varchar(20) default NULL,
  `req_sex` tinyint(2) default NULL,
  `add_time` datetime default NULL,
  `req_ico` varchar(150) default NULL,
  `from_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_pals_request`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_pals_sort`
-- 

CREATE TABLE `isns_pals_sort` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `user_id` mediumint(8) unsigned default NULL,
  `count` mediumint(8) unsigned default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- 导出表中的数据 `isns_pals_sort`
-- 

INSERT INTO `isns_pals_sort` VALUES (1, '亲朋', 1, 0);
INSERT INTO `isns_pals_sort` VALUES (2, '好友', 1, 0);
INSERT INTO `isns_pals_sort` VALUES (3, '同学', 1, 0);
INSERT INTO `isns_pals_sort` VALUES (4, '亲朋', 2, 0);
INSERT INTO `isns_pals_sort` VALUES (5, '好友', 2, 0);
INSERT INTO `isns_pals_sort` VALUES (6, '同学', 2, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_photo`
-- 

CREATE TABLE `isns_photo` (
  `photo_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) default NULL,
  `photo_name` varchar(20) default NULL,
  `photo_information` text,
  `add_time` datetime default NULL,
  `photo_src` varchar(150) default NULL,
  `photo_thumb_src` varchar(150) default NULL,
  `album_id` mediumint(8) unsigned NOT NULL,
  `is_pass` tinyint(2) default '1',
  `privacy` varchar(200) default NULL,
  `comments` int(5) unsigned NOT NULL default '0',
  `tag` varchar(80) default NULL,
  PRIMARY KEY  (`photo_id`),
  KEY `album_id` (`album_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `isns_photo`
-- 

INSERT INTO `isns_photo` VALUES (1, 1, 'muxiaonuo', 'a', '', '2013-11-24 10:58:50', 'uploadfiles/album/2013/11/24/2013112410585048.gif', 'uploadfiles/album/2013/11/24/thumb_2013112410585048.gif', 1, 1, '', 0, NULL);
INSERT INTO `isns_photo` VALUES (2, 1, 'muxiaonuo', 'snslogo (2)', 'sc', '2013-11-29 22:37:22', 'uploadfiles/album/2013/11/29/2013112910372266.gif', 'uploadfiles/album/2013/11/29/thumb_2013112910372266.gif', 1, 1, '', 0, NULL);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_photo_comment`
-- 

CREATE TABLE `isns_photo_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `photo_id` mediumint(8) unsigned NOT NULL,
  `host_id` mediumint(8) unsigned NOT NULL,
  `visitor_id` mediumint(8) unsigned NOT NULL,
  `visitor_name` varchar(20) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `readed` tinyint(2) default '0',
  `visitor_ico` varchar(150) default NULL,
  `is_hidden` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `photo_id` (`photo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_photo_comment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_plugins`
-- 

CREATE TABLE `isns_plugins` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `name` varchar(50) default NULL,
  `valid` tinyint(2) default '0',
  `autoorder` tinyint(2) default '0',
  `reg_date` datetime NOT NULL,
  `image` varchar(150) NOT NULL,
  `comment_num` mediumint(8) unsigned default '0',
  `use_num` mediumint(8) unsigned default '0',
  `info` varchar(300) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_plugins`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_plugin_url`
-- 

CREATE TABLE `isns_plugin_url` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(40) default NULL,
  `layout_id` varchar(20) default NULL,
  `url` varchar(255) default NULL,
  `sequence` smallint(5) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_plugin_url`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_poll`
-- 

CREATE TABLE `isns_poll` (
  `p_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned default '0',
  `username` varchar(20) default NULL,
  `user_ico` varchar(150) default NULL,
  `subject` varchar(80) default '',
  `voternum` mediumint(8) unsigned default '0',
  `comments` int(5) unsigned default '0',
  `multiple` tinyint(2) default '0',
  `maxchoice` tinyint(3) default '0',
  `sex` tinyint(2) default '0',
  `noreply` tinyint(2) default '0',
  `credit` smallint(5) unsigned default '0',
  `percredit` smallint(5) unsigned default '0',
  `expiration` date default NULL,
  `lastvote` datetime default NULL,
  `dateline` datetime default NULL,
  `message` text,
  `summary` text,
  `option` text,
  `is_pass` tinyint(2) default '1',
  `tag` varchar(80) default NULL,
  PRIMARY KEY  (`p_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_poll`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_polloption`
-- 

CREATE TABLE `isns_polloption` (
  `oid` mediumint(8) unsigned NOT NULL auto_increment,
  `pid` mediumint(8) unsigned NOT NULL default '0',
  `votenum` mediumint(8) unsigned NOT NULL default '0',
  `option` varchar(100) default NULL,
  PRIMARY KEY  (`oid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_polloption`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_polluser`
-- 

CREATE TABLE `isns_polluser` (
  `uid` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(20) default '',
  `pid` mediumint(8) unsigned default '0',
  `option` text,
  `dateline` datetime default NULL,
  `anony` tinyint(2) NOT NULL default '0',
  KEY `pid` (`pid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `isns_polluser`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_poll_comment`
-- 

CREATE TABLE `isns_poll_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `visitor_id` mediumint(8) unsigned default NULL,
  `visitor_name` varchar(20) default NULL,
  `p_id` mediumint(8) unsigned default NULL,
  `host_id` mediumint(8) unsigned default NULL,
  `add_time` datetime default NULL,
  `content` text,
  `visitor_ico` varchar(150) default NULL,
  `is_hidden` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `p_id` (`p_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_poll_comment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_recent_affair`
-- 

CREATE TABLE `isns_recent_affair` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `type_id` tinyint(2) default '0',
  `title` varchar(500) default NULL,
  `content` text,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_name` varchar(20) default NULL,
  `user_ico` varchar(150) default NULL,
  `date_time` datetime default NULL,
  `update_time` datetime default NULL,
  `for_content_id` mediumint(8) default '0',
  `mod_type` tinyint(2) default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  KEY `mod_type` (`mod_type`,`for_content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- 导出表中的数据 `isns_recent_affair`
-- 

INSERT INTO `isns_recent_affair` VALUES (1, 1, '心情更新', '[em_6]', 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-11-24 10:49:28', '2013-11-24 10:49:28', 1, 6);
INSERT INTO `isns_recent_affair` VALUES (2, 1, '心情更新', '哈哈哈哈哈哈哈哈[em_17]', 1, 'muxiaonuo', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-11-24 10:51:26', '2013-11-24 10:51:26', 2, 6);
INSERT INTO `isns_recent_affair` VALUES (3, 2, '在相册<a href="home.php?h=1&app=photo_list&album_id=1" target="_blank">fsf</a>中上传了新照片', '<a href="home.php?h=1&app=photo&photo_id=1&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/11/24/thumb_2013112410585048.gif"></a>', 1, 'muxiaonuo', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-11-24 10:58:52', '2013-11-24 10:58:52', 1, 3);
INSERT INTO `isns_recent_affair` VALUES (4, 1, '头像更新为', '<img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/photo_store/2013/11/24/2013112411002844_ico.jpg" align="top">', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-24 11:00:47', '2013-11-24 11:00:47', 0, 7);
INSERT INTO `isns_recent_affair` VALUES (5, 1, '心情更新', '我是猪猪', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-24 16:24:42', '2013-11-24 16:24:42', 3, 6);
INSERT INTO `isns_recent_affair` VALUES (6, 1, '心情更新', 'fwvw', 1, 'muxiaonuo', '', '2013-11-24 20:04:11', '2013-11-24 20:04:11', 4, 6);
INSERT INTO `isns_recent_affair` VALUES (7, 3, '写了新日志<a href="home.php?h=1&app=blog&id=1" target=''_blank''>gwg</a>', 'gwgwgwg', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-29 14:57:51', '2013-11-29 14:57:51', 1, 0);
INSERT INTO `isns_recent_affair` VALUES (8, 2, '在相册<a href="home.php?h=1&app=photo_list&album_id=1" target="_blank">fsf</a>中上传了新照片', '<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/11/29/thumb_2013112910372266.gif"></a>', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-29 22:37:27', '2013-11-29 22:37:27', 2, 3);
INSERT INTO `isns_recent_affair` VALUES (9, 1, '心情更新', 'vdsb', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-11-29 22:37:44', '2013-11-29 22:37:44', 5, 6);
INSERT INTO `isns_recent_affair` VALUES (10, 4, '分享了<a href="home.php?h=1" target="_blank">muxiaonuo</a>的照片<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank">snslogo (2)</a>', '<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/11/29/thumb_2013112910372266.gif"/></a>', 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', '2013-11-30 00:45:13', '2013-11-30 00:45:13', 1, 5);
INSERT INTO `isns_recent_affair` VALUES (11, 3, '写了新游记<a href="home.php?h=1&app=blog&id=2" target=''_blank''>vwvvve</a>', '&nbsp;ververvevbberbebe', 1, 'muxiaonuo', 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', '2013-12-06 02:39:47', '2013-12-06 02:39:47', 2, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_recommend`
-- 

CREATE TABLE `isns_recommend` (
  `recommend_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned default NULL,
  `user_name` varchar(20) default NULL,
  `user_ico` varchar(150) default NULL,
  `is_pass` tinyint(2) default '1',
  `guest_num` mediumint(8) default '0',
  `user_sex` tinyint(2) default '0',
  `rec_class` tinyint(2) default '0',
  `rec_order` tinyint(2) default '0',
  `show_ico` varchar(150) default NULL,
  PRIMARY KEY  (`recommend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_recommend`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_remind`
-- 

CREATE TABLE `isns_remind` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `type_id` tinyint(2) NOT NULL,
  `date` datetime NOT NULL,
  `content` varchar(200) default NULL,
  `is_focus` tinyint(2) NOT NULL,
  `from_uid` mediumint(8) unsigned NOT NULL,
  `from_uname` varchar(20) NOT NULL,
  `from_uico` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `count` mediumint(8) unsigned default '1',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`,`is_focus`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `isns_remind`
-- 

INSERT INTO `isns_remind` VALUES (3, 2, 0, '2013-11-24 10:55:50', '在心情<a href={link} onclick={js} target=_blank>[em_6]</a>中回复了您', 1, 1, 'muxiaonuo', 'skin/default/jooyea/images/d_ico_1_small.gif', 'home.php?h=2&app=mood_more&remind=1&mod=1', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_report`
-- 

CREATE TABLE `isns_report` (
  `report_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned default NULL,
  `reason` varchar(150) default NULL,
  `user_name` varchar(20) default NULL,
  `type` varchar(20) default NULL,
  `content` text,
  `add_time` datetime default NULL,
  `reported_id` mediumint(8) unsigned default NULL,
  `userd_id` mediumint(8) unsigned default NULL,
  `rep_num` mediumint(8) unsigned default '1',
  PRIMARY KEY  (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_report`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_share`
-- 

CREATE TABLE `isns_share` (
  `s_id` mediumint(8) NOT NULL auto_increment,
  `type_id` tinyint(2) default NULL,
  `user_id` mediumint(8) unsigned default NULL,
  `user_name` varchar(20) default NULL,
  `user_ico` varchar(150) default NULL,
  `content` text,
  `s_title` varchar(300) default NULL,
  `out_link` varchar(255) default NULL,
  `add_time` datetime default NULL,
  `for_content_id` mediumint(8) unsigned default NULL,
  `comments` int(5) unsigned default '0',
  `movie_thumb` varchar(255) default NULL,
  `movie_link` varchar(255) default NULL,
  `is_pass` tinyint(2) default '1',
  `tag` varchar(80) default NULL,
  PRIMARY KEY  (`s_id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`,`for_content_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `isns_share`
-- 

INSERT INTO `isns_share` VALUES (1, 3, 2, 'berwin', 'skin/default/jooyea/images/d_ico_1_small.gif', '<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank"><img class="photo_frame" onerror=parent.pic_error(this) src="uploadfiles/album/2013/11/29/thumb_2013112910372266.gif"/></a>', '分享了<a href="home.php?h=1" target="_blank">muxiaonuo</a>的照片<a href="home.php?h=1&app=photo&photo_id=2&album_id=1" target="_blank">snslogo (2)</a>', '', '2013-11-30 00:45:13', 2, 0, '', '', 1, '');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_share_comment`
-- 

CREATE TABLE `isns_share_comment` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `visitor_id` mediumint(8) unsigned default NULL,
  `visitor_name` varchar(20) default NULL,
  `s_id` mediumint(8) unsigned default NULL,
  `host_id` mediumint(8) unsigned default NULL,
  `add_time` datetime default NULL,
  `content` text,
  `visitor_ico` varchar(150) default NULL,
  `is_hidden` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_share_comment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_tag`
-- 

CREATE TABLE `isns_tag` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `count` mediumint(8) default '0',
  `hot` tinyint(2) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `isns_tag`
-- 

INSERT INTO `isns_tag` VALUES (1, 'g3g4g', 1, 0);
INSERT INTO `isns_tag` VALUES (2, '上海', 1, 0);
INSERT INTO `isns_tag` VALUES (3, '长沙', 1, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_tag_relation`
-- 

CREATE TABLE `isns_tag_relation` (
  `id` mediumint(8) unsigned NOT NULL,
  `mod_id` mediumint(8) NOT NULL,
  `content_id` mediumint(8) NOT NULL,
  KEY `id` (`id`),
  KEY `mod_id` (`mod_id`),
  KEY `content_id` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `isns_tag_relation`
-- 

INSERT INTO `isns_tag_relation` VALUES (1, 0, 1);
INSERT INTO `isns_tag_relation` VALUES (2, 0, 2);
INSERT INTO `isns_tag_relation` VALUES (3, 0, 2);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_tmp_file`
-- 

CREATE TABLE `isns_tmp_file` (
  `mod_id` mediumint(8) unsigned NOT NULL,
  `mod_count` mediumint(8) unsigned default '0',
  `affair_array` text,
  `data_array` text,
  PRIMARY KEY  (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `isns_tmp_file`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_uploadfile`
-- 

CREATE TABLE `isns_uploadfile` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `add_time` datetime default NULL,
  `file_src` varchar(150) default NULL,
  `file_name` varchar(80) default NULL,
  PRIMARY KEY  (`id`),
  KEY `userid` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `isns_uploadfile`
-- 

INSERT INTO `isns_uploadfile` VALUES (1, 1, '2013-11-24 11:00:28', 'uploadfiles/photo_store/2013/11/24/2013112411002844.jpg', 'h_large_12tM_daf000000579113e.jpg');

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_users`
-- 

CREATE TABLE `isns_users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_email` varchar(50) default NULL,
  `user_name` varchar(20) default NULL,
  `user_pws` char(32) default NULL,
  `user_sex` tinyint(2) default NULL,
  `birth_province` varchar(30) default NULL,
  `birth_city` varchar(30) default NULL,
  `reside_province` varchar(30) default NULL,
  `reside_city` varchar(30) default NULL,
  `user_ico` varchar(150) default NULL,
  `is_pass` tinyint(2) default '1',
  `user_add_time` datetime default NULL,
  `birth_year` char(6) default NULL,
  `birth_month` char(4) default NULL,
  `birth_day` char(4) default NULL,
  `creat_group` varchar(150) default NULL,
  `join_group` varchar(150) default NULL,
  `guest_num` mediumint(8) unsigned default '0',
  `integral` mediumint(8) default '10',
  `access_limit` tinyint(2) default '0',
  `access_questions` varchar(100) default NULL,
  `access_answers` varchar(100) default NULL,
  `inputmess_limit` tinyint(2) default '0',
  `palsreq_limit` tinyint(2) default '0',
  `lastlogin_datetime` datetime default NULL,
  `invite_from_uid` mediumint(8) unsigned default NULL,
  `hidden_pals_id` text,
  `hidden_type_id` text,
  `login_ip` char(15) default NULL,
  `is_recommend` tinyint(2) NOT NULL default '0',
  `dressup` varchar(20) default '0',
  `use_plugins` varchar(1000) default NULL,
  `use_apps` varchar(1000) default NULL,
  `user_group` varchar(30) default 'base',
  `forget_pass` varchar(50) default NULL,
  `activation_id` int(8) default '-1' COMMENT '激活码id值',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- 导出表中的数据 `isns_users`
-- 

INSERT INTO `isns_users` VALUES (1, 'lihuaxin0033@163.com', 'muxiaonuo', '6572bdaff799084b973320f43f09b363', 1, NULL, NULL, NULL, NULL, 'uploadfiles/photo_store/2013/11/24/2013112411002844_ico_small.jpg', 1, '2013-11-23 22:33:12', '', '', '', NULL, NULL, 2, 78, 0, NULL, NULL, 0, 0, '2013-11-30 13:08:07', 0, NULL, NULL, '127.0.0.1', 0, 'green', NULL, NULL, 'base', NULL, -1);
INSERT INTO `isns_users` VALUES (2, 'bwbw1992@163.com', 'berwin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 1, '2013-11-24 10:49:14', '', '', '', NULL, NULL, 1, 12, 0, NULL, NULL, 0, 0, '2013-11-24 10:49:14', 0, NULL, NULL, '59.78.8.155', 0, '0', NULL, NULL, 'base', NULL, -1);
INSERT INTO `isns_users` VALUES (5, 'cvwv', 'lihuaxin0033@163.com', 'lihuaxin003', 0, NULL, NULL, NULL, NULL, 'skin/default/jooyea/images/d_ico_1_small.gif', 0, '0000-00-00 00:00:00', '', '', '', NULL, NULL, 0, 10, 0, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, '', 0, '0', NULL, NULL, 'base', NULL, -1);

-- --------------------------------------------------------

-- 
-- 表的结构 `isns_user_activation`
-- 

CREATE TABLE `isns_user_activation` (
  `id` int(8) NOT NULL auto_increment COMMENT 'id',
  `time` datetime NOT NULL COMMENT '时间戳',
  `activation_code` varchar(100) NOT NULL COMMENT '激活码',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户激活注册表' AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_user_activation`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_user_info`
-- 

CREATE TABLE `isns_user_info` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT 'ID',
  `user_id` int(10) NOT NULL default '0' COMMENT 'user表ID',
  `info_id` int(10) NOT NULL default '0' COMMENT '信息表ID',
  `info_value` text COMMENT '信息值',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `isns_user_info`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `isns_user_information`
-- 

CREATE TABLE `isns_user_information` (
  `info_id` int(10) unsigned NOT NULL auto_increment COMMENT '信息id',
  `info_name` varchar(255) NOT NULL COMMENT '信息名称',
  `input_type` tinyint(1) NOT NULL default '0' COMMENT '信息input类型 0:text,1:select,2:radio,3:checkbox',
  `info_values` text COMMENT '信息值 一行代表一个',
  `sort` tinyint(1) NOT NULL default '0' COMMENT '显示排序',
  PRIMARY KEY  (`info_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- 导出表中的数据 `isns_user_information`
-- 

INSERT INTO `isns_user_information` VALUES (1, '婚恋状态', 1, '保密\r\n单身\r\n非单身', 0);
INSERT INTO `isns_user_information` VALUES (2, '血型', 1, '保密\r\nA\r\nB\r\nO\r\nAB', 0);
INSERT INTO `isns_user_information` VALUES (3, 'QQ', 0, '', 0);
