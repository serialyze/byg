# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.42)
# Database: bygmusic
# Generation Time: 2016-03-13 18:34:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table exp_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_actions`;

CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`)
VALUES
	(1,'Channel','submit_entry',0),
	(2,'Channel','filemanager_endpoint',0),
	(3,'Channel','smiley_pop',0),
	(4,'Channel','combo_loader',0),
	(5,'Comment','insert_new_comment',0),
	(6,'Comment_mcp','delete_comment_notification',0),
	(7,'Comment','comment_subscribe',0),
	(8,'Comment','edit_comment',0),
	(9,'Member','registration_form',0),
	(10,'Member','register_member',0),
	(11,'Member','activate_member',0),
	(12,'Member','member_login',0),
	(13,'Member','member_logout',0),
	(14,'Member','send_reset_token',0),
	(15,'Member','process_reset_password',0),
	(16,'Member','send_member_email',0),
	(17,'Member','update_un_pw',0),
	(18,'Member','member_search',0),
	(19,'Member','member_delete',0),
	(20,'Rte','get_js',0),
	(21,'Search','do_search',1),
	(22,'User','group_edit',0),
	(23,'User','edit_profile',0),
	(24,'User','reg',0),
	(25,'User','retrieve_password',0),
	(26,'User','do_logout',0),
	(27,'User','do_search',0),
	(28,'User','delete_account',0),
	(29,'User','activate_member',0),
	(30,'User','retrieve_username',0),
	(31,'User','create_key',0),
	(32,'User','process_reset_password',0);

/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_captcha
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_captcha`;

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_categories`;

CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;

INSERT INTO `exp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`)
VALUES
	(1,1,1,0,'Sales','sales','','',1),
	(2,1,1,0,'Artist','artist','','',2),
	(3,1,1,0,'Sponsor','sponsor','','',3),
	(4,1,1,0,'Featured','featured','','',4);

/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_field_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_field_data`;

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;

INSERT INTO `exp_category_field_data` (`cat_id`, `site_id`, `group_id`)
VALUES
	(1,1,1),
	(2,1,1),
	(3,1,1),
	(4,1,1);

/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_fields`;

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8_unicode_ci NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_groups`;

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8_unicode_ci,
  `can_delete_categories` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;

INSERT INTO `exp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `exclude_group`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`)
VALUES
	(1,1,'Users','c',0,'all','','');

/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_category_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_posts`;

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_channel_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data`;

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text COLLATE utf8_unicode_ci,
  `field_ft_1` tinytext COLLATE utf8_unicode_ci,
  `field_id_2` text COLLATE utf8_unicode_ci,
  `field_ft_2` tinytext COLLATE utf8_unicode_ci,
  `field_id_3` text COLLATE utf8_unicode_ci,
  `field_ft_3` tinytext COLLATE utf8_unicode_ci,
  `field_id_4` text COLLATE utf8_unicode_ci,
  `field_ft_4` tinytext COLLATE utf8_unicode_ci,
  `field_id_5` text COLLATE utf8_unicode_ci,
  `field_ft_5` tinytext COLLATE utf8_unicode_ci,
  `field_id_6` text COLLATE utf8_unicode_ci,
  `field_ft_6` tinytext COLLATE utf8_unicode_ci,
  `field_id_7` text COLLATE utf8_unicode_ci,
  `field_ft_7` tinytext COLLATE utf8_unicode_ci,
  `field_id_8` text COLLATE utf8_unicode_ci,
  `field_ft_8` tinytext COLLATE utf8_unicode_ci,
  `field_id_9` text COLLATE utf8_unicode_ci,
  `field_ft_9` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`)
VALUES
	(1,1,1,'blah.','none','5','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,1,1,'note note 2','none','2','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,1,1,'note third try','none','2','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,1,1,'and a fourth note for good measure. ','none','2','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,1,1,'dt note number one','none','3','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,1,1,'dt note 2','none','3','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,1,1,'artist note 3','none','3','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,1,1,'artist note 4','none','3','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,1,2,NULL,NULL,NULL,NULL,'{filedir_6}marshmallows.jpg','none',' ','xhtml','https://www.facebook.com/darwenstheory','none','https://twitter.com/darwenstheory','none','https://www.instagram.com/darwenstheory','none','','none','https://www.youtube.com/user/DarwensTheory','none'),
	(13,1,1,'this sponsor needs a city.','none','7','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(14,1,1,'a note from krish. ','none','3','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(15,1,1,'note from krish.','none','5','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(16,1,1,'krishy notes.','none','6','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(17,1,1,'note.','none','2','none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_entries_autosave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url_title` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_fields`;

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8_unicode_ci,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`)
VALUES
	(1,1,1,'note_copy','Note','','textarea','','n',NULL,NULL,6,NULL,'n','ltr','n','n','none','n',1,'any','YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30='),
	(2,1,1,'note_member_id','Member ID','','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','n',2,'numeric','YTozOntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjc6Im51bWVyaWMiO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7YjowO30='),
	(3,1,2,'artist_bio_photo','Artist Bio Photo','','file','','n',NULL,NULL,8,NULL,'n','ltr','n','n','none','y',1,'image','YTo1OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiNiI7czoxMzoic2hvd19leGlzdGluZyI7czoxOiJ5IjtzOjEyOiJudW1fZXhpc3RpbmciO3M6MjoiNTAiO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO30='),
	(4,1,2,'artist_other_media','Artist Other Media','','grid','','n',NULL,NULL,8,NULL,'n','ltr','n','n','xhtml','y',2,'any','YToyOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czoxOiI3Ijt9'),
	(5,1,2,'artist_facebook','Artist Facebook','','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','n',3,'all','YTozOntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtiOjA7fQ=='),
	(6,1,2,'artist_twitter','Artist Twitter','','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','n',4,'all','YTozOntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtiOjA7fQ=='),
	(7,1,2,'artist_instagram','Artist Instagram','','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','n',5,'all','YTozOntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtiOjA7fQ=='),
	(8,1,2,'artist_soundcloud','Artist Soundcloud','','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','n',6,'all','YTozOntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtiOjA7fQ=='),
	(9,1,2,'artist_youtube','Artist Youtube','','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','n',7,'all','YTozOntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtiOjA7fQ==');

/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_form_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_form_settings`;

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_channel_grid_field_4
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_4`;

CREATE TABLE `exp_channel_grid_field_4` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_1` text COLLATE utf8_unicode_ci,
  `col_id_2` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_channel_grid_field_4` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_4` DISABLE KEYS */;

INSERT INTO `exp_channel_grid_field_4` (`row_id`, `entry_id`, `row_order`, `col_id_1`, `col_id_2`)
VALUES
	(10,12,0,'video',' https://www.youtube.com/user/DarwensTheory'),
	(11,12,1,'again','https://www.youtube.com/user/DarwensTheory');

/*!40000 ALTER TABLE `exp_channel_grid_field_4` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_member_groups`;

CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_channel_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_channel_member_groups` DISABLE KEYS */;

INSERT INTO `exp_channel_member_groups` (`group_id`, `channel_id`)
VALUES
	(6,1),
	(8,2);

/*!40000 ALTER TABLE `exp_channel_member_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_titles`;

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`)
VALUES
	(1,1,1,4,NULL,'0','Sponsor Note - 5','Sponsor-Note-5','open','n',0,0,0,0,'y','n',1456680720,'2016','02','28',0,0,1456681900,0,0),
	(2,1,1,4,NULL,'0','Sponsor Note - 2 - {date}','Sponsor-Note-2-date','open','n',0,0,0,0,'y','n',1456680900,'2016','02','28',0,0,NULL,0,0),
	(3,1,1,4,NULL,'0','Sponsor Note - 2 - 1456681069','Sponsor-Note-2-1456681069','open','n',0,0,0,0,'y','n',1456681020,'2016','02','28',0,0,NULL,0,0),
	(4,1,1,4,NULL,'0','Sponsor Note - 2 - 1456682573','Sponsor-Note-2-1456682573','open','n',0,0,0,0,'y','n',1456682580,'2016','02','28',0,0,NULL,0,0),
	(5,1,1,4,NULL,'0','Sponsor Note - 3 - 1456686089','Sponsor-Note-3-1456686089','open','n',0,0,0,0,'y','n',1456686180,'2016','02','28',0,0,NULL,0,0),
	(6,1,1,4,NULL,'0','Sponsor Note - 3 - 1456686253','Sponsor-Note-3-1456686253','open','n',0,0,0,0,'y','n',1456686240,'2016','02','28',0,0,NULL,0,0),
	(7,1,1,4,NULL,'0','Sponsor Note - 3 - 1456686271','Sponsor-Note-3-1456686271','open','n',0,0,0,0,'y','n',1456686300,'2016','02','28',0,0,NULL,0,0),
	(8,1,1,4,NULL,'0','Artist Note - 3 - 1456686329','Artist-Note-3-1456686329','open','n',0,0,0,0,'y','n',1456686300,'2016','02','28',0,0,NULL,0,0),
	(12,1,2,3,NULL,'0','darwen\'s theory','darwens-theory','open','y',0,0,0,0,'y','n',1456722960,'2016','02','28',0,0,1457473548,0,0),
	(13,1,1,4,NULL,'0','Sponsor Note - 7 - 1456809538','Sponsor-Note-7-1456809538','open','n',0,0,0,0,'y','n',1456809540,'2016','02','29',0,0,NULL,0,0),
	(14,1,1,8,NULL,'0','Artist Note - 3 - 1456810001','Artist-Note-3-1456810001','open','n',0,0,0,0,'y','n',1456809960,'2016','02','29',0,0,NULL,0,0),
	(15,1,1,8,NULL,'0','Artist Note - 5 - 1456810028','Artist-Note-5-1456810028','open','n',0,0,0,0,'y','n',1456810020,'2016','02','29',0,0,NULL,0,0),
	(16,1,1,8,NULL,'0','Artist Note - 6 - 1456810053','Artist-Note-6-1456810053','open','n',0,0,0,0,'y','n',1456810020,'2016','02','29',0,0,NULL,0,0),
	(17,1,1,8,NULL,'0','Sponsor Note - 2 - 1456810074','Sponsor-Note-2-1456810074','open','n',0,0,0,0,'y','n',1456810080,'2016','02','29',0,0,NULL,0,0);

/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels`;

CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `extra_publish_controls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `channel_allow_img_urls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `extra_publish_controls`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `title_field_label`, `url_title_prefix`, `live_look_template`)
VALUES
	(1,1,'notes','Notes','http://bygmusic/index.php',NULL,'en',0,0,0,0,'',1,'open',1,NULL,NULL,'y','y',NULL,'all','n','y','n','n',NULL,NULL,'y','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'n',10,'','Title','',0),
	(2,1,'artists','Artists','http://bygmusic/index.php',NULL,'en',0,0,0,0,'',1,'open',2,NULL,NULL,'y','y',NULL,'all','n','y','n','n',NULL,NULL,'y','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'n',10,'','Stage Name','',0);

/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_comment_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comment_subscriptions`;

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comments`;

CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_content_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_content_types`;

CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_content_types` WRITE;
/*!40000 ALTER TABLE `exp_content_types` DISABLE KEYS */;

INSERT INTO `exp_content_types` (`content_type_id`, `name`)
VALUES
	(1,'grid'),
	(2,'channel');

/*!40000 ALTER TABLE `exp_content_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_log`;

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`)
VALUES
	(1,1,1,'rawxtar','::1',1456289428,'Logged in'),
	(2,1,1,'rawxtar','::1',1456294798,'Logged in'),
	(3,1,1,'rawxtar','::1',1456598083,'Logged in'),
	(4,1,1,'rawxtar','::1',1456599281,'Username was changed to:&nbsp;&nbsp;theory@gmail.com'),
	(5,1,1,'rawxtar','::1',1456612421,'Logged in'),
	(6,1,1,'rawxtar','::1',1456613044,'New member created:&nbsp;rory'),
	(7,1,1,'rawxtar','::1',1456613458,'Logged out'),
	(8,1,1,'rawxtar','::1',1456613467,'Logged in'),
	(9,1,4,'rory','::1',1456613814,'Logged in'),
	(10,1,4,'rory','::1',1456616912,'Logged out'),
	(11,1,4,'rory','::1',1456617096,'Logged in'),
	(12,1,4,'rory','::1',1456617351,'Logged out'),
	(13,1,1,'rawxtar','::1',1456623349,'Logged in'),
	(14,1,1,'rawxtar','::1',1456623378,'New member created:&nbsp;eagar@email.com'),
	(15,1,1,'rawxtar','::1',1456623397,'New member created:&nbsp;socionic@email.com'),
	(16,1,1,'rawxtar','::1',1456676572,'Logged in'),
	(17,1,1,'rawxtar','::1',1456677113,'Channel Created&nbsp;&nbsp;Notes'),
	(18,1,1,'rawxtar','::1',1456696560,'Logged in'),
	(19,1,1,'rawxtar','::1',1456710363,'Logged in'),
	(20,1,1,'rawxtar','::1',1456710468,'Channel Created&nbsp;&nbsp;Artists'),
	(21,1,1,'rawxtar','::1',1456713275,'Logged in'),
	(22,1,1,'rawxtar','::1',1456719974,'Logged in'),
	(23,1,1,'rawxtar','::1',1456808843,'Logged in'),
	(24,1,1,'rawxtar','::1',1456809935,'New member created:&nbsp;krish'),
	(25,1,1,'rawxtar','::1',1456818038,'Logged in'),
	(26,1,1,'rawxtar','::1',1457198704,'Logged in'),
	(27,1,1,'rawxtar','::1',1457221172,'Logged in'),
	(28,1,1,'rawxtar','::1',1457230995,'Logged in'),
	(29,1,1,'rawxtar','::1',1457283339,'Logged in'),
	(30,1,1,'rawxtar','::1',1457305057,'Logged in'),
	(31,1,1,'rawxtar','::1',1457473371,'Logged in'),
	(32,1,1,'rawxtar','::1',1457477636,'Logged in'),
	(33,1,1,'rawxtar','::1',1457883856,'Logged in'),
	(34,1,1,'rawxtar','::1',1457893877,'Logged in');

/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_search_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_search_index`;

CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_developer_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_developer_log`;

CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8_unicode_ci,
  `function` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8_unicode_ci,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;

INSERT INTO `exp_developer_log` (`log_id`, `timestamp`, `viewed`, `description`, `function`, `line`, `file`, `deprecated_since`, `use_instead`, `template_id`, `template_name`, `template_group`, `addon_module`, `addon_method`, `snippets`, `hash`)
VALUES
	(1,1457295298,'n',NULL,'set_cookie()',4031,'/Applications/MAMP/htdocs/personal/byg/_full/system/user/addons/user/Library/AddonBuilder.php','2.8','EE_Input::delete_cookie()',0,NULL,NULL,NULL,NULL,NULL,'79ac002a0d6a158c1d9665fe5ff80c16'),
	(2,1457889144,'n',NULL,'set_cookie()',4031,'/Applications/MAMP/htdocs/personal/byg/_repo/byg/system/user/addons/user/Library/AddonBuilder.php','2.8','EE_Input::delete_cookie()',0,NULL,NULL,NULL,NULL,NULL,'cb628bb78d2ca3cecdba5a3e484559b7');

/*!40000 ALTER TABLE `exp_developer_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_email_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache`;

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `from_email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `recipient` text COLLATE utf8_unicode_ci NOT NULL,
  `cc` text COLLATE utf8_unicode_ci NOT NULL,
  `bcc` text COLLATE utf8_unicode_ci NOT NULL,
  `recipient_array` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `mailtype` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `text_fmt` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `wordwrap` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_email_cache_mg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_mg`;

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_email_cache_ml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_ml`;

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_email_console_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_console_cache`;

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_entry_versioning
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_versioning`;

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_entry_versioning` WRITE;
/*!40000 ALTER TABLE `exp_entry_versioning` DISABLE KEYS */;

INSERT INTO `exp_entry_versioning` (`version_id`, `entry_id`, `channel_id`, `author_id`, `version_date`, `version_data`)
VALUES
	(1,1,1,4,1456681729,'a:39:{s:8:\"entry_id\";s:1:\"1\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"1\";s:9:\"author_id\";i:4;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:16:\"Sponsor Note - 5\";s:9:\"url_title\";s:14:\"Sponsor-Note-5\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456680720;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";i:1456681729;s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:10:\"field_ft_1\";s:4:\"none\";s:10:\"field_ft_2\";s:4:\"none\";s:10:\"field_id_1\";s:5:\"blah.\";s:10:\"field_id_2\";s:0:\"\";}'),
	(2,1,1,4,1456681900,'a:39:{s:8:\"entry_id\";s:1:\"1\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"1\";s:9:\"author_id\";i:4;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:16:\"Sponsor Note - 5\";s:9:\"url_title\";s:14:\"Sponsor-Note-5\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456680720;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";i:1456681900;s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_1\";s:5:\"blah.\";s:10:\"field_ft_1\";s:4:\"none\";s:10:\"field_id_2\";s:1:\"5\";s:10:\"field_ft_2\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;}'),
	(33,12,2,3,1457885569,'a:61:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:21:\"{filedir_6}image2.png\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:0:\"\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:37:\"http://bygmusic/index.php/edit/social\";s:3:\"URI\";s:11:\"edit/social\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"Gy8HlgHKMClu+Pli4N7QXmtFz9ia5prGItygER1drrzXKGLicO561EuUa+7grxV2jADtSRlcB9OYyhKhw0Uim6KpgC6mSDPO1XSHzvtF+VmFnGkhtfzeIrncFhH013t7mGLCN12Q/HwyfXuJ+Yj4Z66oxuGdnYnQvNNHHtwb0iXB3wviMtz6pa2chzGuDxkyCkejDlcLzhY6jrVf9rrjqENyN0TLbsPawS3YWwwTvGil8R15qKkvY/2gjgiRvi/CF+evV+GeAbD+ybDwhDA/TuoPc2D820k9IQAc9eLFMlFwA8Bj7knZykXGzE6omNvIQTVxhHLzrS1ciYgC8IO6qxR7t0sl3Ppyj3SK7hRQw0H2DkVEKJzZALYYbGEuNd7k//fZbCGjMYD40JmG4JSXFH/U8jny9jse9aNoy6w4Bon/ROCqPP5mPoFMRxSwcHrVxZqNBR5cKRZ5rCvQqdMz4lT1piRkPwq9lmPWIK+6fxTr4/TzkAEB4K5fv3jb4p60\";s:6:\"return\";s:10:\"home/index\";s:15:\"artist_facebook\";s:38:\"https://www.facebook.com/darwenstheory\";s:14:\"artist_twitter\";s:33:\"https://twitter.com/darwenstheory\";s:16:\"artist_instagram\";s:39:\"https://www.instagram.com/darwenstheory\";s:14:\"artist_youtube\";s:0:\"\";s:17:\"artist_soundcloud\";s:0:\"\";s:13:\"revision_post\";a:46:{s:3:\"RET\";s:37:\"http://bygmusic/index.php/edit/social\";s:3:\"URI\";s:11:\"edit/social\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"Gy8HlgHKMClu+Pli4N7QXmtFz9ia5prGItygER1drrzXKGLicO561EuUa+7grxV2jADtSRlcB9OYyhKhw0Uim6KpgC6mSDPO1XSHzvtF+VmFnGkhtfzeIrncFhH013t7mGLCN12Q/HwyfXuJ+Yj4Z66oxuGdnYnQvNNHHtwb0iXB3wviMtz6pa2chzGuDxkyCkejDlcLzhY6jrVf9rrjqENyN0TLbsPawS3YWwwTvGil8R15qKkvY/2gjgiRvi/CF+evV+GeAbD+ybDwhDA/TuoPc2D820k9IQAc9eLFMlFwA8Bj7knZykXGzE6omNvIQTVxhHLzrS1ciYgC8IO6qxR7t0sl3Ppyj3SK7hRQw0H2DkVEKJzZALYYbGEuNd7k//fZbCGjMYD40JmG4JSXFH/U8jny9jse9aNoy6w4Bon/ROCqPP5mPoFMRxSwcHrVxZqNBR5cKRZ5rCvQqdMz4lT1piRkPwq9lmPWIK+6fxTr4/TzkAEB4K5fv3jb4p60\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:15:\"artist_facebook\";s:38:\"https://www.facebook.com/darwenstheory\";s:14:\"artist_twitter\";s:33:\"https://twitter.com/darwenstheory\";s:16:\"artist_instagram\";s:39:\"https://www.instagram.com/darwenstheory\";s:14:\"artist_youtube\";s:0:\"\";s:17:\"artist_soundcloud\";s:0:\"\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:0:\"\";s:10:\"field_ft_9\";s:4:\"none\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(34,12,2,3,1457885578,'a:61:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:21:\"{filedir_6}image2.png\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:37:\"http://bygmusic/index.php/edit/social\";s:3:\"URI\";s:11:\"edit/social\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"TPcMwCc6pkW7xLFrbJnvTZAX6MQfarnffOoULdO1YsOxs7vFPPecQbupbAkVsGcjc2B0Qd+gtOVhWjtyla67BUI0nAG7ul4z5gBK3Dn9k0zMJxLd5j0ZhQwlUVr8+QAtmE9/2se6e60CnqXqipVXdd9sybEFQ1r+B+k75io9yfdXDVC1S+Db3TpsIBCpicQcBEop83CCG65zyffiMVvX2dupzw2x4icHxm5SibDvFDlrKpQdcxq6v97HQrb+EEaJijcUEXQhHT0qMGOIcjm5s0ccQ+3V2omZA+BvpyTwF3KMqlqr2FfIzobqAVcnF6kzEEnli4jJ3wYsrPJhVSfcqwpgm9lfPHrJdpZjGE3fS2rrVgnFvF2F6vGhp8zhe90yscGQTqDgfbxCVADlPMbeaujEIMYXnvNEMjNALYunL3QfhY2E6xrTXFVoT8ukLvLl96ZIf9y9Hm56KzdiDc21d6Ls1tOBy40GHCUvyVj/5v4odc3QQYxPkEG+rBEgjUUP\";s:6:\"return\";s:10:\"home/index\";s:15:\"artist_facebook\";s:38:\"https://www.facebook.com/darwenstheory\";s:14:\"artist_twitter\";s:33:\"https://twitter.com/darwenstheory\";s:16:\"artist_instagram\";s:39:\"https://www.instagram.com/darwenstheory\";s:14:\"artist_youtube\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:17:\"artist_soundcloud\";s:0:\"\";s:13:\"revision_post\";a:46:{s:3:\"RET\";s:37:\"http://bygmusic/index.php/edit/social\";s:3:\"URI\";s:11:\"edit/social\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"TPcMwCc6pkW7xLFrbJnvTZAX6MQfarnffOoULdO1YsOxs7vFPPecQbupbAkVsGcjc2B0Qd+gtOVhWjtyla67BUI0nAG7ul4z5gBK3Dn9k0zMJxLd5j0ZhQwlUVr8+QAtmE9/2se6e60CnqXqipVXdd9sybEFQ1r+B+k75io9yfdXDVC1S+Db3TpsIBCpicQcBEop83CCG65zyffiMVvX2dupzw2x4icHxm5SibDvFDlrKpQdcxq6v97HQrb+EEaJijcUEXQhHT0qMGOIcjm5s0ccQ+3V2omZA+BvpyTwF3KMqlqr2FfIzobqAVcnF6kzEEnli4jJ3wYsrPJhVSfcqwpgm9lfPHrJdpZjGE3fS2rrVgnFvF2F6vGhp8zhe90yscGQTqDgfbxCVADlPMbeaujEIMYXnvNEMjNALYunL3QfhY2E6xrTXFVoT8ukLvLl96ZIf9y9Hm56KzdiDc21d6Ls1tOBy40GHCUvyVj/5v4odc3QQYxPkEG+rBEgjUUP\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:15:\"artist_facebook\";s:38:\"https://www.facebook.com/darwenstheory\";s:14:\"artist_twitter\";s:33:\"https://twitter.com/darwenstheory\";s:16:\"artist_instagram\";s:39:\"https://www.instagram.com/darwenstheory\";s:14:\"artist_youtube\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:17:\"artist_soundcloud\";s:0:\"\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(35,12,2,3,1457885923,'a:57:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:21:\"{filedir_6}image2.png\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/media\";s:3:\"URI\";s:10:\"edit/media\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"eHQL7e5zmvhJs8VL/P79cKHN0HGTqcmQBd6B2D/5wsGdzVH3rmtXpUfPfvtsp5G0piHigCxsJmgP21/jT4gIfdYjg/tl+C+SgYmrJsY6Bi8PzdAzelR4cLCVJgK45h6Kem37wojVKWSTb1dMsxO7Azo0Xq/eEgmyviYXZIv/cjmRjfX/8ddA6vyFwsTmGF9kv/N/a0B5KY1Bj0IpHNi9qq9FtnHaRqpqloKwhVMGOBkEy39YDIFVZiCrMN/YkBbCjTh+rmclItyCWzNQ999jDBszWNqdPNNnb9KpNB3LJnmCjwloG0fKNEtUMTUZRcaQJcmQeVc4GVyCgj09auQFja4nptHlkEB9LCTRYMiFIZhufvodNgMmZ7QsKwwJmgRlpfhFjhI3NTRvbWXz84xFLhUdkrvpPSUj5y8KBXpVtjebBIykE370CNYOO73JQ70zo01hDyS8usVPnuozxfsL/OOn2rtTLkWekHOhXoafHSsAxOtBAxUOwuCimIuWLe5p\";s:6:\"return\";s:10:\"home/index\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:1:{s:9:\"new_row_1\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}}}s:13:\"revision_post\";a:34:{s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/media\";s:3:\"URI\";s:10:\"edit/media\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"eHQL7e5zmvhJs8VL/P79cKHN0HGTqcmQBd6B2D/5wsGdzVH3rmtXpUfPfvtsp5G0piHigCxsJmgP21/jT4gIfdYjg/tl+C+SgYmrJsY6Bi8PzdAzelR4cLCVJgK45h6Kem37wojVKWSTb1dMsxO7Azo0Xq/eEgmyviYXZIv/cjmRjfX/8ddA6vyFwsTmGF9kv/N/a0B5KY1Bj0IpHNi9qq9FtnHaRqpqloKwhVMGOBkEy39YDIFVZiCrMN/YkBbCjTh+rmclItyCWzNQ999jDBszWNqdPNNnb9KpNB3LJnmCjwloG0fKNEtUMTUZRcaQJcmQeVc4GVyCgj09auQFja4nptHlkEB9LCTRYMiFIZhufvodNgMmZ7QsKwwJmgRlpfhFjhI3NTRvbWXz84xFLhUdkrvpPSUj5y8KBXpVtjebBIykE370CNYOO73JQ70zo01hDyS8usVPnuozxfsL/OOn2rtTLkWekHOhXoafHSsAxOtBAxUOwuCimIuWLe5p\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:1:{s:9:\"new_row_1\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}}}s:10:\"field_id_4\";a:1:{s:4:\"rows\";a:1:{s:9:\"new_row_1\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}}}s:10:\"field_ft_4\";s:5:\"xhtml\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(36,12,2,3,1457885948,'a:60:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:21:\"{filedir_6}hello.jpeg\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"FtC1Z0aF7ItwGZa9qDu+OR9joM10e4s59ZCFe//bs+bjNG+5ifNzDDmpVC0BhAjJFRz1v7SCEzR6zDV5iCffkvdRqreK8RFRYTONnIMoy+J7S7oUY9y01l0N1BRg62JerA8p1RcDsHF+31ddpWjs7LKPWPY/+aR4xDGU8oUIE4Y9tgS80SULfMdVgxL1zXlETSCnOihgPJN1elgBxCGi7Y5fi4nFfoEMxr7HmCBgHozgliRF3gnwQL0PWblOJNl1UiGNs+SPDDTv9MR8GTTlEwQoWtJNorjuAagV9NqgsF/BEzmMhrRS/nuGddU1phElKlOHYlkoMkZoHAGN7EWfMJ3T0eHzWGVaREtWMHGCIXWq+W37nycdWkRpDopASSixRomGKYyet+cADW+XDGQNxy8iBKGaFxWDpLXKyDZcgLWBb3W0slHEAquKKx+kpbpA0BesZw4lC7Dg0af6A4pn4fDuNkyYbXp7UqNbhNtp3oljQn3vHfLI2/P4a4Wrafhs\";s:6:\"return\";s:10:\"home/index\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:1:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}}}s:16:\"artist_bio_photo\";s:21:\"{filedir_6}hello.jpeg\";s:20:\"field_id_3_directory\";s:1:\"6\";s:13:\"revision_post\";a:39:{s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"FtC1Z0aF7ItwGZa9qDu+OR9joM10e4s59ZCFe//bs+bjNG+5ifNzDDmpVC0BhAjJFRz1v7SCEzR6zDV5iCffkvdRqreK8RFRYTONnIMoy+J7S7oUY9y01l0N1BRg62JerA8p1RcDsHF+31ddpWjs7LKPWPY/+aR4xDGU8oUIE4Y9tgS80SULfMdVgxL1zXlETSCnOihgPJN1elgBxCGi7Y5fi4nFfoEMxr7HmCBgHozgliRF3gnwQL0PWblOJNl1UiGNs+SPDDTv9MR8GTTlEwQoWtJNorjuAagV9NqgsF/BEzmMhrRS/nuGddU1phElKlOHYlkoMkZoHAGN7EWfMJ3T0eHzWGVaREtWMHGCIXWq+W37nycdWkRpDopASSixRomGKYyet+cADW+XDGQNxy8iBKGaFxWDpLXKyDZcgLWBb3W0slHEAquKKx+kpbpA0BesZw4lC7Dg0af6A4pn4fDuNkyYbXp7UqNbhNtp3oljQn3vHfLI2/P4a4Wrafhs\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:1:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}}}s:16:\"artist_bio_photo\";s:21:\"{filedir_6}hello.jpeg\";s:20:\"field_id_3_directory\";s:1:\"6\";s:10:\"field_id_3\";s:21:\"{filedir_6}hello.jpeg\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";a:1:{s:4:\"rows\";a:1:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}}}s:10:\"field_ft_4\";s:5:\"xhtml\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(37,12,2,3,1457885993,'a:60:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:0:\"\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"tRMQLToF/eBSASCxl6P7qGYyctk/Jkk8Bw9z+WzLfL736qoDMmUDiKBT/F30ikIYHdmv8TUh0Difjx6DPeyuUrAT+ysU8fdnIT3guDE8asA5UvVV0zogHrDRCDoxGPjHV26p2OvSf+FGk4LZHwsDzrSQt9DYp5TXeHV7NcKqXmXWu//0rbIAEZ5QesM2hFblksWa7byh1Ou3lFWFhLM/vh83uNGLABrU2IgOJcNoXJrPJ/IeVShurIaaRC1Q3e/+0q7TVz/cpKU1d5rO5Yfg2COc4nCYnfuIyEWw0p9adeTNxgPsQo8IS9xcHgcpvEFKZu+f3zXvT5zyF9MNXsFeUvRxhZd+NTp8+Aa8zRixhm0EJWqN0YafEORBY4n3GHU3fOXX7Sz6zXpA0BI4zYON07CGMhEmacB5YA9FjkNUv121qdBwDRNg7Ww13yoT1njDFupoOPF91LVykZsd0xfw+Tdi2zOB48fdxsj1BMtNPC/g4W6UKa8sjih7hjndETZn\";s:6:\"return\";s:10:\"home/index\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"new_row_2\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:16:\"artist_bio_photo\";s:0:\"\";s:20:\"field_id_3_directory\";s:1:\"6\";s:13:\"revision_post\";a:39:{s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"tRMQLToF/eBSASCxl6P7qGYyctk/Jkk8Bw9z+WzLfL736qoDMmUDiKBT/F30ikIYHdmv8TUh0Difjx6DPeyuUrAT+ysU8fdnIT3guDE8asA5UvVV0zogHrDRCDoxGPjHV26p2OvSf+FGk4LZHwsDzrSQt9DYp5TXeHV7NcKqXmXWu//0rbIAEZ5QesM2hFblksWa7byh1Ou3lFWFhLM/vh83uNGLABrU2IgOJcNoXJrPJ/IeVShurIaaRC1Q3e/+0q7TVz/cpKU1d5rO5Yfg2COc4nCYnfuIyEWw0p9adeTNxgPsQo8IS9xcHgcpvEFKZu+f3zXvT5zyF9MNXsFeUvRxhZd+NTp8+Aa8zRixhm0EJWqN0YafEORBY4n3GHU3fOXX7Sz6zXpA0BI4zYON07CGMhEmacB5YA9FjkNUv121qdBwDRNg7Ww13yoT1njDFupoOPF91LVykZsd0xfw+Tdi2zOB48fdxsj1BMtNPC/g4W6UKa8sjih7hjndETZn\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"new_row_2\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:16:\"artist_bio_photo\";s:0:\"\";s:20:\"field_id_3_directory\";s:1:\"6\";s:10:\"field_id_3\";s:0:\"\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"new_row_2\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:10:\"field_ft_4\";s:5:\"xhtml\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(38,12,2,3,1457886044,'a:60:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:52:\"{filedir_6}3595e8de9e2043c593913306c5427452_650x.jpg\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"jyEOmbc9d5DEuIwInFM7g9704mvjHYq32KN+Y65tTi1of/mMPcNxMHIhemNWU7rEx4MMcm6UsX7PWzQ9HVokdxSe5mgQL1sWAT3kdAU2cYutGA65iI7F0J+M7c0cUF2Dri7z3z3Nun6AAkRSIZTs8y6Aa4TNnCCYm20dhgrTfyplWTeCQ2p6t6AgBY2EsowWLuVibcsv74ULtAJBoDr5gDLzyfIj9vl2iKuBC3/U5hoH/nlBiSpWmQIUG+3KkGGztppjXoGfnMc3kwNHYauiS34EbseKQ2XhnCRWBxJP3McInA6GgtiOiEwZF1f0nenWX8NrClVTUyuYWsRoRBnBSgkr0IOlIdC+nz0i/3JDgZx4qHSuwZ/sCq7fmsYHPB9DBs8+mL+ukP37VmhUiIUY/yanmdGKTZdipu4DDNzgzJNJhP8eRMcync3DRBKASpONDuLdxLEzlI9Zpyp8b3+bZJY25TUxQl4vnB9zJsqzGr3GAyGPaKf8i7DnBNyU3Sr+\";s:6:\"return\";s:10:\"home/index\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"row_id_11\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:16:\"artist_bio_photo\";s:52:\"{filedir_6}3595e8de9e2043c593913306c5427452_650x.jpg\";s:20:\"field_id_3_directory\";s:1:\"6\";s:13:\"revision_post\";a:39:{s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"jyEOmbc9d5DEuIwInFM7g9704mvjHYq32KN+Y65tTi1of/mMPcNxMHIhemNWU7rEx4MMcm6UsX7PWzQ9HVokdxSe5mgQL1sWAT3kdAU2cYutGA65iI7F0J+M7c0cUF2Dri7z3z3Nun6AAkRSIZTs8y6Aa4TNnCCYm20dhgrTfyplWTeCQ2p6t6AgBY2EsowWLuVibcsv74ULtAJBoDr5gDLzyfIj9vl2iKuBC3/U5hoH/nlBiSpWmQIUG+3KkGGztppjXoGfnMc3kwNHYauiS34EbseKQ2XhnCRWBxJP3McInA6GgtiOiEwZF1f0nenWX8NrClVTUyuYWsRoRBnBSgkr0IOlIdC+nz0i/3JDgZx4qHSuwZ/sCq7fmsYHPB9DBs8+mL+ukP37VmhUiIUY/yanmdGKTZdipu4DDNzgzJNJhP8eRMcync3DRBKASpONDuLdxLEzlI9Zpyp8b3+bZJY25TUxQl4vnB9zJsqzGr3GAyGPaKf8i7DnBNyU3Sr+\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"row_id_11\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:16:\"artist_bio_photo\";s:52:\"{filedir_6}3595e8de9e2043c593913306c5427452_650x.jpg\";s:20:\"field_id_3_directory\";s:1:\"6\";s:10:\"field_id_3\";s:52:\"{filedir_6}3595e8de9e2043c593913306c5427452_650x.jpg\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"row_id_11\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:10:\"field_ft_4\";s:5:\"xhtml\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(39,12,2,3,1457886063,'a:60:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:27:\"{filedir_6}marshmallows.jpg\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"RqD4p6BGxS3OxTd+TOpKQy9z/jyG8Rnrtdx7U4r52dby55xieYpcGpPsBA2D4ni1DXTrAoYmF7znYIbIuXgDWVz5CUOTYXwTSMfZ3Q1gQGwr/vjNwcC9qt57vLzh3TFmTG544+BRLcITSi1Pxf9YlhTvp0AjOCoVVNhdG1sM4kdmfDWT5FuqeB2zBtynpTTAVdt12qHH9E64UocrqJi41N2ps36vKMivcaZFaB2paIqgevJHwt8iZOX0Hq2e91AEyRqwrdzPA++Fvp9eMrHIkDYAGTOF247CMtEzVa2D5X3fiwwbGYUMO2lKfC/999lLUC8VW5dXyPY4qCN0iLTj3TSSNCmcEyTnpWoyEe9sj6QP0bKWq46UrvXAJixZtDT6BF3rqWoqXO+y8PgnP7smlqBRtW7C3VsO4TpJjtuA/PjZmaByM2174LY8LdAiOluIyri9FQWhCKIu1XCvoUw32emQebL7otsIlBeN03Chblgla0X/LLXEMer5VyDZDGkv\";s:6:\"return\";s:10:\"home/index\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"row_id_11\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:16:\"artist_bio_photo\";s:27:\"{filedir_6}marshmallows.jpg\";s:20:\"field_id_3_directory\";s:1:\"6\";s:13:\"revision_post\";a:39:{s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"RqD4p6BGxS3OxTd+TOpKQy9z/jyG8Rnrtdx7U4r52dby55xieYpcGpPsBA2D4ni1DXTrAoYmF7znYIbIuXgDWVz5CUOTYXwTSMfZ3Q1gQGwr/vjNwcC9qt57vLzh3TFmTG544+BRLcITSi1Pxf9YlhTvp0AjOCoVVNhdG1sM4kdmfDWT5FuqeB2zBtynpTTAVdt12qHH9E64UocrqJi41N2ps36vKMivcaZFaB2paIqgevJHwt8iZOX0Hq2e91AEyRqwrdzPA++Fvp9eMrHIkDYAGTOF247CMtEzVa2D5X3fiwwbGYUMO2lKfC/999lLUC8VW5dXyPY4qCN0iLTj3TSSNCmcEyTnpWoyEe9sj6QP0bKWq46UrvXAJixZtDT6BF3rqWoqXO+y8PgnP7smlqBRtW7C3VsO4TpJjtuA/PjZmaByM2174LY8LdAiOluIyri9FQWhCKIu1XCvoUw32emQebL7otsIlBeN03Chblgla0X/LLXEMer5VyDZDGkv\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"row_id_11\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:16:\"artist_bio_photo\";s:27:\"{filedir_6}marshmallows.jpg\";s:20:\"field_id_3_directory\";s:1:\"6\";s:10:\"field_id_3\";s:27:\"{filedir_6}marshmallows.jpg\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";a:1:{s:4:\"rows\";a:2:{s:9:\"row_id_10\";a:2:{s:8:\"col_id_1\";s:5:\"video\";s:8:\"col_id_2\";s:43:\" https://www.youtube.com/user/DarwensTheory\";}s:9:\"row_id_11\";a:2:{s:8:\"col_id_1\";s:5:\"again\";s:8:\"col_id_2\";s:42:\"https://www.youtube.com/user/DarwensTheory\";}}}s:10:\"field_ft_4\";s:5:\"xhtml\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(30,12,2,3,1457885184,'a:57:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:33:\"{filedir_6}internet-high-five.jpg\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/media\";s:3:\"URI\";s:10:\"edit/media\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"sTFRWlQOmk2YuVCZcKjG2U9zwxMPzw6PdOrX6Vo5uo977IrArD7mzf39vZQVRBuxtdi81KW/EU8vXImElIriYLGqgOCa2+ft2KeIKsewRjyqMQPgsrc2wTm/ZwIJ7POLwtDliOJjyp2iBzQo4jy2K7k+rFmO/qImbJzyEig3746CEqwtmz5chL9Vg5PTUgcDCaDyEk0wU1nGpoOxJ03RkAaN3qwVdLAEij2a5vro4BLlzbdfHfJHZcVCLJdxO3L4DTtY4JJgLsEpdK0Ro4saFJzpSUo5hLzVy+QmU86AlVDAz5chosNVBvghIhCUYdfUebEGEgLNkpr8f5OC6+e5Xkc26A/sVSdm232OubWoq4mJJGJyedSUlE26TVeZf7kf4b3CkYfpQAF5cFYsPkehjtLx8sLaO0NtEDV141cT6NOhCxn7grZYSYgkHhwtCD0Cv5cqaCvZQxpq9n08KGQy+XHlx1hEkEUprG9lnAI98JH+bgzTJOaB0LtOhhyNuXOm\";s:6:\"return\";s:10:\"home/index\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:3:{s:9:\"new_row_2\";a:2:{s:8:\"col_id_1\";s:16:\"drum pov cleanse\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=qVAWtpvV28c\";}s:9:\"new_row_3\";a:2:{s:8:\"col_id_1\";s:13:\"bled for days\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=273VkmXWuF8\";}s:9:\"new_row_4\";a:2:{s:8:\"col_id_1\";s:19:\"cleanse lyric video\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=TDEXyEYaHwE\";}}}s:13:\"revision_post\";a:34:{s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/media\";s:3:\"URI\";s:10:\"edit/media\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"sTFRWlQOmk2YuVCZcKjG2U9zwxMPzw6PdOrX6Vo5uo977IrArD7mzf39vZQVRBuxtdi81KW/EU8vXImElIriYLGqgOCa2+ft2KeIKsewRjyqMQPgsrc2wTm/ZwIJ7POLwtDliOJjyp2iBzQo4jy2K7k+rFmO/qImbJzyEig3746CEqwtmz5chL9Vg5PTUgcDCaDyEk0wU1nGpoOxJ03RkAaN3qwVdLAEij2a5vro4BLlzbdfHfJHZcVCLJdxO3L4DTtY4JJgLsEpdK0Ro4saFJzpSUo5hLzVy+QmU86AlVDAz5chosNVBvghIhCUYdfUebEGEgLNkpr8f5OC6+e5Xkc26A/sVSdm232OubWoq4mJJGJyedSUlE26TVeZf7kf4b3CkYfpQAF5cFYsPkehjtLx8sLaO0NtEDV141cT6NOhCxn7grZYSYgkHhwtCD0Cv5cqaCvZQxpq9n08KGQy+XHlx1hEkEUprG9lnAI98JH+bgzTJOaB0LtOhhyNuXOm\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:3:{s:9:\"new_row_2\";a:2:{s:8:\"col_id_1\";s:16:\"drum pov cleanse\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=qVAWtpvV28c\";}s:9:\"new_row_3\";a:2:{s:8:\"col_id_1\";s:13:\"bled for days\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=273VkmXWuF8\";}s:9:\"new_row_4\";a:2:{s:8:\"col_id_1\";s:19:\"cleanse lyric video\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=TDEXyEYaHwE\";}}}s:10:\"field_id_4\";a:1:{s:4:\"rows\";a:3:{s:9:\"new_row_2\";a:2:{s:8:\"col_id_1\";s:16:\"drum pov cleanse\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=qVAWtpvV28c\";}s:9:\"new_row_3\";a:2:{s:8:\"col_id_1\";s:13:\"bled for days\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=273VkmXWuF8\";}s:9:\"new_row_4\";a:2:{s:8:\"col_id_1\";s:19:\"cleanse lyric video\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=TDEXyEYaHwE\";}}}s:10:\"field_ft_4\";s:5:\"xhtml\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(31,12,2,3,1457885465,'a:59:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:21:\"{filedir_6}image2.png\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"a5SmNGcgLAdKCckLXQowoQVhcs4kvnuvZboyC7h0XG5wSewnkmvpXjAuYMxyvddYwbRa0nM0uD9pwzorcBriTFHgu06AZwuUZF8iLQIfU0LKAa81kLQWr+K5461rB0YaSLxmRjdsMi0IdVp6FCFe+FcTtGvFFEr+ibkP3yPQhR3BdzoQjTugDsTl8pNmeuSbz4vMmHvBa5R/iHau0r4Xeowh6iG73JuBA5i9OIfHOvpuo/yhCzq6W0NiVx2Sjwd5zetmEzUtnXu18YmlRCKdHxvISCFNXtNeekAJrNG1FKfZYvf9sk/EN2lTqFQpCQgHrt9L5H22v0itqpZfDYuNBXeET1ogtjDbBDGFYp4sQUo4RJDeLTOJfJjrp+B7NyvnA05Zjv3D0pa86a/qRm6EgVBxdF+Ofv6QA8LWhuXVhCHJEJy7UoGkAv97YlNY+jtwqr6M7C5d548PUqcNsD2fQJsJXLLYoBzrrNLKcJZx6DM5ppu/ZJHkTByREvvCBtHh\";s:6:\"return\";s:10:\"home/index\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:16:\"artist_bio_photo\";s:21:\"{filedir_6}image2.png\";s:20:\"field_id_3_directory\";s:1:\"6\";s:13:\"revision_post\";a:36:{s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/photo\";s:3:\"URI\";s:10:\"edit/photo\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"a5SmNGcgLAdKCckLXQowoQVhcs4kvnuvZboyC7h0XG5wSewnkmvpXjAuYMxyvddYwbRa0nM0uD9pwzorcBriTFHgu06AZwuUZF8iLQIfU0LKAa81kLQWr+K5461rB0YaSLxmRjdsMi0IdVp6FCFe+FcTtGvFFEr+ibkP3yPQhR3BdzoQjTugDsTl8pNmeuSbz4vMmHvBa5R/iHau0r4Xeowh6iG73JuBA5i9OIfHOvpuo/yhCzq6W0NiVx2Sjwd5zetmEzUtnXu18YmlRCKdHxvISCFNXtNeekAJrNG1FKfZYvf9sk/EN2lTqFQpCQgHrt9L5H22v0itqpZfDYuNBXeET1ogtjDbBDGFYp4sQUo4RJDeLTOJfJjrp+B7NyvnA05Zjv3D0pa86a/qRm6EgVBxdF+Ofv6QA8LWhuXVhCHJEJy7UoGkAv97YlNY+jtwqr6M7C5d548PUqcNsD2fQJsJXLLYoBzrrNLKcJZx6DM5ppu/ZJHkTByREvvCBtHh\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:26:\"artist_bio_photo_directory\";s:1:\"6\";s:16:\"artist_bio_photo\";s:21:\"{filedir_6}image2.png\";s:20:\"field_id_3_directory\";s:1:\"6\";s:10:\"field_id_3\";s:21:\"{filedir_6}image2.png\";s:10:\"field_ft_3\";s:4:\"none\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}'),
	(32,12,2,3,1457885557,'a:57:{s:8:\"entry_id\";s:2:\"12\";s:7:\"site_id\";s:1:\"1\";s:10:\"channel_id\";s:1:\"2\";s:9:\"author_id\";i:3;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:6:\"status\";s:4:\"open\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";b:1;s:6:\"sticky\";b:0;s:10:\"entry_date\";i:1456722960;s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:9:\"edit_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2016-03-08 21:45:48.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:19:\"recent_comment_date\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"1970-01-01 00:00:00.000000\";s:13:\"timezone_type\";i:1;s:8:\"timezone\";s:6:\"+00:00\";}s:13:\"comment_total\";s:1:\"0\";s:10:\"field_id_3\";s:21:\"{filedir_6}image2.png\";s:10:\"field_ft_3\";s:4:\"none\";s:10:\"field_id_4\";s:1:\" \";s:10:\"field_ft_4\";s:5:\"xhtml\";s:10:\"field_id_5\";s:38:\"https://www.facebook.com/darwenstheory\";s:10:\"field_ft_5\";s:4:\"none\";s:10:\"field_id_6\";s:33:\"https://twitter.com/darwenstheory\";s:10:\"field_ft_6\";s:4:\"none\";s:10:\"field_id_7\";s:39:\"https://www.instagram.com/darwenstheory\";s:10:\"field_ft_7\";s:4:\"none\";s:10:\"field_id_8\";s:0:\"\";s:10:\"field_ft_8\";s:4:\"none\";s:10:\"field_id_9\";s:42:\"https://www.youtube.com/user/DarwensTheory\";s:10:\"field_ft_9\";s:4:\"none\";s:14:\"field_ft_title\";N;s:18:\"field_ft_url_title\";s:5:\"xhtml\";s:19:\"field_ft_entry_date\";s:4:\"text\";s:24:\"field_ft_expiration_date\";s:4:\"text\";s:32:\"field_ft_comment_expiration_date\";s:4:\"text\";s:19:\"field_ft_channel_id\";N;s:15:\"field_ft_status\";N;s:18:\"field_ft_author_id\";N;s:15:\"field_ft_sticky\";N;s:23:\"field_ft_allow_comments\";N;s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/media\";s:3:\"URI\";s:10:\"edit/media\";s:10:\"return_url\";s:10:\"home/index\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"lG2fkwFMQ6PPlQOnx0LZjI12irTfIyNd/bnwip8zajlCA/4HeoDnEJOHcOmui3BYwYDG5iWB2M3d4yupnEB1q2JoPWfW2TnrRHHJQAqmj5APaRcppjrJWCY52G142cg+JoOU/5XHjN3LlKxTxZHOslGxXT3gARdqIWw1ydp2vqDedp19NE+SGd5KjlN4UtH32leBcNQZ5hYtOpWZFYBrHGaZhi9WVihK+CiRHAOflX20jTuksmWq2SN1SNbuCMDGtJrEyciuQOeFSy81ZOOzTuDMmKBIhwGBv3yiZdelWHRKM50fG6gMw4NYsKp7Q9yBz8gnDkGH9FHREAn3w2UhEKSyIllBWFHMTOXZZBXnYM1tB63GVgiXAuVh7t1yrmEMKAtuuEs3zjwMOinGVSiuSjz/liH7W+5btXLeioE63nmRJ3o3jkbUVCQW3OCGOf4z9TZDeFC+MWXAGMS0RLx7frXsYjIcGW8mGlE2JHDx/3hUIfbE36dRhsmbrcWx5eEV\";s:6:\"return\";s:10:\"home/index\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:1:{s:9:\"new_row_1\";a:2:{s:8:\"col_id_1\";s:19:\"cleanse lyric video\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=TDEXyEYaHwE\";}}}s:13:\"revision_post\";a:34:{s:3:\"RET\";s:36:\"http://bygmusic/index.php/edit/media\";s:3:\"URI\";s:10:\"edit/media\";s:10:\"return_url\";s:10:\"home/index\";s:9:\"author_id\";s:1:\"3\";s:10:\"channel_id\";s:1:\"2\";s:8:\"entry_id\";s:2:\"12\";s:3:\"ACT\";s:1:\"1\";s:4:\"meta\";s:512:\"lG2fkwFMQ6PPlQOnx0LZjI12irTfIyNd/bnwip8zajlCA/4HeoDnEJOHcOmui3BYwYDG5iWB2M3d4yupnEB1q2JoPWfW2TnrRHHJQAqmj5APaRcppjrJWCY52G142cg+JoOU/5XHjN3LlKxTxZHOslGxXT3gARdqIWw1ydp2vqDedp19NE+SGd5KjlN4UtH32leBcNQZ5hYtOpWZFYBrHGaZhi9WVihK+CiRHAOflX20jTuksmWq2SN1SNbuCMDGtJrEyciuQOeFSy81ZOOzTuDMmKBIhwGBv3yiZdelWHRKM50fG6gMw4NYsKp7Q9yBz8gnDkGH9FHREAn3w2UhEKSyIllBWFHMTOXZZBXnYM1tB63GVgiXAuVh7t1yrmEMKAtuuEs3zjwMOinGVSiuSjz/liH7W+5btXLeioE63nmRJ3o3jkbUVCQW3OCGOf4z9TZDeFC+MWXAGMS0RLx7frXsYjIcGW8mGlE2JHDx/3hUIfbE36dRhsmbrcWx5eEV\";s:6:\"return\";s:10:\"home/index\";s:7:\"site_id\";s:1:\"1\";s:6:\"status\";s:4:\"open\";s:18:\"artist_other_media\";a:1:{s:4:\"rows\";a:1:{s:9:\"new_row_1\";a:2:{s:8:\"col_id_1\";s:19:\"cleanse lyric video\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=TDEXyEYaHwE\";}}}s:10:\"field_id_4\";a:1:{s:4:\"rows\";a:1:{s:9:\"new_row_1\";a:2:{s:8:\"col_id_1\";s:19:\"cleanse lyric video\";s:8:\"col_id_2\";s:43:\"https://www.youtube.com/watch?v=TDEXyEYaHwE\";}}}s:10:\"field_ft_4\";s:5:\"xhtml\";s:9:\"pentry_id\";N;s:14:\"forum_topic_id\";N;s:10:\"ip_address\";s:1:\"0\";s:5:\"title\";s:15:\"darwen\'s theory\";s:9:\"url_title\";s:14:\"darwens-theory\";s:18:\"versioning_enabled\";b:1;s:14:\"view_count_one\";s:1:\"0\";s:14:\"view_count_two\";s:1:\"0\";s:16:\"view_count_three\";s:1:\"0\";s:15:\"view_count_four\";s:1:\"0\";s:14:\"allow_comments\";s:1:\"y\";s:10:\"entry_date\";s:17:\"2/29/2016 5:16 AM\";s:4:\"year\";s:4:\"2016\";s:5:\"month\";s:2:\"02\";s:3:\"day\";s:2:\"28\";s:15:\"expiration_date\";i:0;s:23:\"comment_expiration_date\";i:0;s:19:\"recent_comment_date\";r:28;s:13:\"comment_total\";s:1:\"0\";s:12:\"captcha_word\";N;}}');

/*!40000 ALTER TABLE `exp_entry_versioning` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_extensions`;

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`)
VALUES
	(1,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0.1','y'),
	(2,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0.1','y'),
	(3,'User_ext','cp_members_validate_members','cp_members_validate_members','a:0:{}',1,'4.0.3','y'),
	(4,'User_ext','channel_form_submit_entry_start','channel_form_submit_entry_start','a:0:{}',5,'4.0.3','y'),
	(5,'User_ext','channel_form_submit_entry_end','channel_form_submit_entry_end','a:0:{}',5,'4.0.3','y'),
	(6,'User_ext','cp_members_member_delete_end','cp_members_member_delete_end','a:0:{}',5,'4.0.3','y'),
	(7,'User_ext','cp_members_member_create','cp_members_member_create','a:0:{}',5,'4.0.3','y'),
	(8,'User_ext','member_create_end','member_create_end','a:0:{}',5,'4.0.3','y'),
	(9,'User_ext','member_update_end','member_update_end','a:0:{}',5,'4.0.3','y'),
	(10,'User_ext','user_register_end','user_register_end','a:0:{}',5,'4.0.3','y');

/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_groups`;

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`)
VALUES
	(1,1,'notes'),
	(2,1,'artists');

/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_fieldtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_fieldtypes`;

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8_unicode_ci DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`)
VALUES
	(1,'select','1.0.0','YTowOnt9','n'),
	(2,'text','1.0.0','YTowOnt9','n'),
	(3,'textarea','1.0.0','YTowOnt9','n'),
	(4,'date','1.0.0','YTowOnt9','n'),
	(5,'file','1.0.0','YTowOnt9','n'),
	(6,'grid','1.0.0','YTowOnt9','n'),
	(7,'multi_select','1.0.0','YTowOnt9','n'),
	(8,'checkboxes','1.0.0','YTowOnt9','n'),
	(9,'radio','1.0.0','YTowOnt9','n'),
	(10,'relationship','1.0.0','YTowOnt9','n'),
	(11,'rte','1.0.1','YTowOnt9','n'),
	(12,'user','4.0.3','YTowOnt9','n');

/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_file_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_categories`;

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) COLLATE utf8_unicode_ci DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_file_dimensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_dimensions`;

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_file_watermarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_watermarks`;

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_files`;

CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `credit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`)
VALUES
	(1,1,'profile.jpg',1,'image/jpeg','profile.jpg',4128,NULL,NULL,NULL,1,1456685302,1,1456685302,'63 100'),
	(2,1,'profile.jpg',1,'image/jpeg','profile.jpg',4128,NULL,NULL,NULL,3,1456722867,3,1456722867,'63 100'),
	(3,1,'profile.jpg',6,'image/jpeg','profile.jpg',61655,NULL,NULL,NULL,3,1456722962,3,1456722962,'363 581'),
	(4,1,'Crying-Cat-Meme-13.jpg',6,'image/jpeg','Crying-Cat-Meme-13.jpg',64471,NULL,NULL,NULL,3,1457199493,3,1457199493,'370 555'),
	(5,1,'feets.jpg',6,'image/jpeg','feets.jpg',125798,NULL,NULL,NULL,3,1457200239,3,1457200239,'720 639'),
	(6,1,'profile1.jpg',6,'image/jpeg','profile1.jpg',61655,NULL,NULL,NULL,3,1457200317,3,1457200317,'363 581'),
	(7,1,'image.png',6,'image/png','image.png',402831,NULL,NULL,NULL,3,1457286318,3,1457286318,'379 500'),
	(8,1,'ncdCk.jpeg',6,'image/jpeg','ncdCk.jpeg',51302,NULL,NULL,NULL,3,1457286531,3,1457286531,'524 400'),
	(9,1,'image1.png',6,'image/png','image1.png',402831,NULL,NULL,NULL,3,1457286683,3,1457286683,'379 500'),
	(10,1,'polar-bear-cub-chill-out-i-got-this.png',6,'image/png','polar-bear-cub-chill-out-i-got-this.png',563630,NULL,NULL,NULL,3,1457286743,3,1457286743,'649 490'),
	(11,1,'internet-high-five.jpg',6,'image/jpeg','internet-high-five.jpg',24699,NULL,NULL,NULL,3,1457290155,3,1457290155,'444 480'),
	(12,1,'image2.png',6,'image/png','image2.png',402831,NULL,NULL,NULL,3,1457885465,3,1457885465,'379 500'),
	(13,1,'hello.jpeg',6,'image/jpeg','hello.jpeg',36035,NULL,NULL,NULL,3,1457885948,3,1457885948,'489 500'),
	(14,1,'3595e8de9e2043c593913306c5427452_650x.jpg',6,'image/jpeg','3595e8de9e2043c593913306c5427452_650x.jpg',81070,NULL,NULL,NULL,3,1457886044,3,1457886044,'489 650'),
	(15,1,'marshmallows.jpg',6,'image/jpeg','marshmallows.jpg',63672,NULL,NULL,NULL,3,1457886063,3,1457886063,'410 600');

/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_global_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_global_variables`;

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8_unicode_ci NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_grid_columns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_grid_columns`;

CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8_unicode_ci,
  `col_required` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_grid_columns` WRITE;
/*!40000 ALTER TABLE `exp_grid_columns` DISABLE KEYS */;

INSERT INTO `exp_grid_columns` (`col_id`, `field_id`, `content_type`, `col_order`, `col_type`, `col_label`, `col_name`, `col_instructions`, `col_required`, `col_search`, `col_width`, `col_settings`)
VALUES
	(1,4,'channel',0,'text','Link Title','link_title','','n','n',0,'{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"field_required\":\"n\"}'),
	(2,4,'channel',1,'text','Link URL','link_url','','n','n',0,'{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"field_required\":\"n\"}');

/*!40000 ALTER TABLE `exp_grid_columns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_html_buttons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_html_buttons`;

CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`)
VALUES
	(1,1,0,'html_btn_bold','<strong>','</strong>','b',1,'1','html-bold'),
	(2,1,0,'html_btn_italic','<em>','</em>','i',2,'1','html-italic'),
	(3,1,0,'html_btn_blockquote','<blockquote>','</blockquote>','q',3,'1','html-quote'),
	(4,1,0,'html_btn_anchor','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','html-link'),
	(5,1,0,'html_btn_picture','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','html-upload');

/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_layout_publish
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish`;

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_layout_publish_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish_member_groups`;

CREATE TABLE `exp_layout_publish_member_groups` (
  `layout_id` int(10) unsigned NOT NULL,
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`layout_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_member_bulletin_board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_bulletin_board`;

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_member_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_data`;

CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  `m_field_id_2` text COLLATE utf8_unicode_ci,
  `m_field_ft_2` tinytext COLLATE utf8_unicode_ci,
  `field_id_3` text COLLATE utf8_unicode_ci,
  `field_ft_3` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_3` text COLLATE utf8_unicode_ci,
  `m_field_ft_3` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_4` text COLLATE utf8_unicode_ci,
  `m_field_ft_4` tinytext COLLATE utf8_unicode_ci,
  `field_id_5` text COLLATE utf8_unicode_ci,
  `field_ft_5` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_5` text COLLATE utf8_unicode_ci,
  `m_field_ft_5` tinytext COLLATE utf8_unicode_ci,
  `field_id_6` text COLLATE utf8_unicode_ci,
  `field_ft_6` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_6` text COLLATE utf8_unicode_ci,
  `m_field_ft_6` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_11` text COLLATE utf8_unicode_ci,
  `m_field_ft_11` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_12` text COLLATE utf8_unicode_ci,
  `m_field_ft_12` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_13` text COLLATE utf8_unicode_ci,
  `m_field_ft_13` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_15` text COLLATE utf8_unicode_ci,
  `m_field_ft_15` tinytext COLLATE utf8_unicode_ci,
  `field_id_16` text COLLATE utf8_unicode_ci,
  `field_ft_16` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_16` text COLLATE utf8_unicode_ci,
  `m_field_ft_16` tinytext COLLATE utf8_unicode_ci,
  `field_id_17` text COLLATE utf8_unicode_ci,
  `field_ft_17` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_17` text COLLATE utf8_unicode_ci,
  `m_field_ft_17` tinytext COLLATE utf8_unicode_ci,
  `field_id_18` text COLLATE utf8_unicode_ci,
  `field_ft_18` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_18` text COLLATE utf8_unicode_ci,
  `m_field_ft_18` tinytext COLLATE utf8_unicode_ci,
  `field_id_19` text COLLATE utf8_unicode_ci,
  `field_ft_19` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_19` text COLLATE utf8_unicode_ci,
  `m_field_ft_19` tinytext COLLATE utf8_unicode_ci,
  `field_id_20` text COLLATE utf8_unicode_ci,
  `field_ft_20` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_20` text COLLATE utf8_unicode_ci,
  `m_field_ft_20` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_21` text COLLATE utf8_unicode_ci,
  `m_field_ft_21` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_22` text COLLATE utf8_unicode_ci,
  `m_field_ft_22` tinytext COLLATE utf8_unicode_ci,
  `field_id_24` text COLLATE utf8_unicode_ci,
  `field_ft_24` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_24` text COLLATE utf8_unicode_ci,
  `m_field_ft_24` tinytext COLLATE utf8_unicode_ci,
  `field_id_25` text COLLATE utf8_unicode_ci,
  `field_ft_25` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_25` text COLLATE utf8_unicode_ci,
  `m_field_ft_25` tinytext COLLATE utf8_unicode_ci,
  `field_id_26` text COLLATE utf8_unicode_ci,
  `field_ft_26` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_26` text COLLATE utf8_unicode_ci,
  `m_field_ft_26` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_27` text COLLATE utf8_unicode_ci,
  `m_field_ft_27` tinytext COLLATE utf8_unicode_ci,
  `field_id_28` text COLLATE utf8_unicode_ci,
  `field_ft_28` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_28` text COLLATE utf8_unicode_ci,
  `m_field_ft_28` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_29` text COLLATE utf8_unicode_ci,
  `m_field_ft_29` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_30` text COLLATE utf8_unicode_ci,
  `m_field_ft_30` tinytext COLLATE utf8_unicode_ci,
  `m_field_id_31` text COLLATE utf8_unicode_ci,
  `m_field_ft_31` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;

INSERT INTO `exp_member_data` (`member_id`, `m_field_id_2`, `m_field_ft_2`, `field_id_3`, `field_ft_3`, `m_field_id_3`, `m_field_ft_3`, `m_field_id_4`, `m_field_ft_4`, `field_id_5`, `field_ft_5`, `m_field_id_5`, `m_field_ft_5`, `field_id_6`, `field_ft_6`, `m_field_id_6`, `m_field_ft_6`, `m_field_id_11`, `m_field_ft_11`, `m_field_id_12`, `m_field_ft_12`, `m_field_id_13`, `m_field_ft_13`, `m_field_id_15`, `m_field_ft_15`, `field_id_16`, `field_ft_16`, `m_field_id_16`, `m_field_ft_16`, `field_id_17`, `field_ft_17`, `m_field_id_17`, `m_field_ft_17`, `field_id_18`, `field_ft_18`, `m_field_id_18`, `m_field_ft_18`, `field_id_19`, `field_ft_19`, `m_field_id_19`, `m_field_ft_19`, `field_id_20`, `field_ft_20`, `m_field_id_20`, `m_field_ft_20`, `m_field_id_21`, `m_field_ft_21`, `m_field_id_22`, `m_field_ft_22`, `field_id_24`, `field_ft_24`, `m_field_id_24`, `m_field_ft_24`, `field_id_25`, `field_ft_25`, `m_field_id_25`, `m_field_ft_25`, `field_id_26`, `field_ft_26`, `m_field_id_26`, `m_field_ft_26`, `m_field_id_27`, `m_field_ft_27`, `field_id_28`, `field_ft_28`, `m_field_id_28`, `m_field_ft_28`, `m_field_id_29`, `m_field_ft_29`, `m_field_id_30`, `m_field_ft_30`, `m_field_id_31`, `m_field_ft_31`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'Tech',NULL,NULL,'none','100 - 200',NULL,'',NULL,NULL,'none','social and whatnot.',NULL,NULL,'none','ignition and midnight oil.',NULL,'monica',NULL,'boss',NULL,'555.1234',NULL,'',NULL,NULL,'none','CA',NULL,NULL,'none','- Select -',NULL,NULL,'none','',NULL,NULL,'none','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,NULL,'none','- Select -',NULL,NULL,'none','- Select -',NULL,NULL,'br','- Select -',NULL,'los angeles',NULL,NULL,'br','CA',NULL,'',NULL,NULL,NULL,NULL,NULL),
	(3,'- Select -',NULL,NULL,'none','- Select -',NULL,'',NULL,NULL,'none','',NULL,NULL,'none','',NULL,'monica',NULL,'groupie',NULL,'818-555-1234',NULL,'los angeles',NULL,NULL,'none','CA',NULL,NULL,'none','Local',NULL,NULL,'none','mike johnson, jj paterak, john shaw, tyler rollins',NULL,NULL,'none','The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother\'s keeper and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.',NULL,NULL,'none','pantera, lamb of god.\ntool.\nslip knot.',NULL,'anything!',NULL,'',NULL,NULL,'none','Mostly Male',NULL,NULL,'none','35 - 54',NULL,NULL,'br','Metal',NULL,'los angeles',NULL,NULL,'br','CA',NULL,'',NULL,NULL,NULL,NULL,NULL),
	(8,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,'- Select -',NULL,NULL,'none','- Select -',NULL,'',NULL,NULL,'none','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,'',NULL,'SLO',NULL,NULL,'none','CA',NULL,NULL,'none','Regional',NULL,NULL,'none','',NULL,NULL,'none','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,NULL,'none','- Select -',NULL,NULL,'none','- Select -',NULL,NULL,'br','Bluegrass',NULL,'',NULL,NULL,'br','- Select -',NULL,'',NULL,NULL,NULL,NULL,NULL),
	(6,'- Select -',NULL,NULL,'none','- Select -',NULL,'',NULL,NULL,'none','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,'',NULL,'los angeles',NULL,NULL,'none','CA',NULL,NULL,'none','Local',NULL,NULL,'none','',NULL,NULL,'none','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,NULL,'none','- Select -',NULL,NULL,'none','- Select -',NULL,NULL,'br','Metal',NULL,'',NULL,NULL,'br','- Select -',NULL,'',NULL,NULL,NULL,NULL,NULL),
	(7,'CPG',NULL,NULL,'none','201 - 300',NULL,'',NULL,NULL,'none','not sure. let\'s think of something awesome!',NULL,NULL,'none','ignition.\nrawxtar.',NULL,'monica',NULL,'boss',NULL,'555.123.4685',NULL,'',NULL,NULL,'none','CA',NULL,NULL,'none','- Select -',NULL,NULL,'none','',NULL,NULL,'br','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,NULL,'none','- Select -',NULL,NULL,'none','- Select -',NULL,NULL,'br','- Select -',NULL,'',NULL,NULL,'br','- Select -',NULL,'',NULL,NULL,NULL,NULL,NULL),
	(9,'Auto',NULL,NULL,'none','- Select -',NULL,'',NULL,NULL,'none','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,'none','CA',NULL,NULL,'none','- Select -',NULL,NULL,'none','',NULL,NULL,'br','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,NULL,'none','- Select -',NULL,NULL,'none','- Select -',NULL,NULL,'br','- Select -',NULL,'',NULL,NULL,'br','- Select -',NULL,'',NULL,'7',NULL,NULL,NULL),
	(10,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,'ia1',NULL,'drums',NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(11,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,'i-s-1',NULL,'ceo',NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,'monica',NULL,'guitar',NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(13,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,'unso sponsor 1',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(14,'- Select -',NULL,NULL,'none','- Select -',NULL,'',NULL,NULL,'none','',NULL,NULL,'none','',NULL,'artist 5',NULL,'drums',NULL,'',NULL,'',NULL,NULL,'none','CA',NULL,NULL,'none','- Select -',NULL,NULL,'none','',NULL,NULL,'br','',NULL,NULL,'none','',NULL,'',NULL,'',NULL,NULL,'none','- Select -',NULL,NULL,'none','- Select -',NULL,NULL,'br','- Select -',NULL,'',NULL,NULL,'br','- Select -',NULL,'',NULL,'8',NULL,NULL,NULL),
	(15,NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,'monica',NULL,'director',NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,'none',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'none',NULL,NULL,NULL,'none',NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,NULL,'br',NULL,NULL,NULL,NULL,'8',NULL,'making people buy my stuff. ',NULL);

/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_fields`;

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `m_field_label` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `m_field_description` text COLLATE utf8_unicode_ci NOT NULL,
  `m_field_type` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text COLLATE utf8_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) DEFAULT NULL,
  `m_field_width` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_order` int(3) unsigned DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8_unicode_ci DEFAULT 'ltr',
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_member_fields` WRITE;
/*!40000 ALTER TABLE `exp_member_fields` DISABLE KEYS */;

INSERT INTO `exp_member_fields` (`m_field_id`, `m_field_name`, `m_field_label`, `m_field_description`, `m_field_type`, `m_field_list_items`, `m_field_ta_rows`, `m_field_maxl`, `m_field_width`, `m_field_search`, `m_field_required`, `m_field_public`, `m_field_reg`, `m_field_cp_reg`, `m_field_fmt`, `m_field_show_fmt`, `m_field_order`, `m_field_text_direction`)
VALUES
	(30,'requested_group','Requested Group','','text','',0,256,NULL,'y','n','n','n','n','none','n',23,'ltr'),
	(2,'sponsor_industry_category','Industry Category','','select','- Select -\nAuto\nCPG\nFood\nTech',0,0,NULL,'y','n','n','n','n','none','0',2,'0'),
	(3,'sponsor_company_size','Company Size','','select','- Select -\n< 100\n100 - 200\n201 - 300\n301 - 400',0,0,NULL,'y','n','n','n','n','none','0',3,'0'),
	(4,'sponsor_company_website','Company Website','','text','',0,256,NULL,'y','n','n','n','n','none','n',4,'ltr'),
	(5,'sponsor_digital_actions_required','Digital Actions Required','','textarea','',6,0,NULL,'y','n','n','n','n','none','n',5,'ltr'),
	(6,'sponsor_other_agencies','Other Agencies','','textarea','',6,0,NULL,'y','n','n','n','n','none','n',6,'ltr'),
	(31,'user_needs','User Needs','','text','',0,256,NULL,'y','n','n','n','n','none','n',24,'ltr'),
	(11,'contact_name','this Contact Name','','text','0',0,256,NULL,'y','n','n','n','n','none','n',11,'ltr'),
	(12,'contact_position','this Contact Position','','text','0',0,256,NULL,'y','n','n','n','n','none','n',12,'ltr'),
	(13,'contact_phone','this Contact Phone','','text','0',0,256,NULL,'y','n','n','n','n','none','n',13,'ltr'),
	(15,'artist_city','City','','text','',0,256,NULL,'y','n','n','n','n','none','n',15,'ltr'),
	(16,'artist_state','State','','select','CA\nTN\nTX',0,0,NULL,'y','n','n','n','n','none','0',16,'0'),
	(17,'artist_reach','Reach','','select','- Select -\nLocal\nRegional\nNational\nGlobal',0,0,NULL,'y','n','n','n','n','none','0',17,'0'),
	(18,'artist_members','Members','','textarea','',6,0,NULL,'y','n','n','n','n','none','n',18,'ltr'),
	(19,'artist_bio','Bio','','textarea','0',6,0,NULL,'y','n','n','n','n','br','n',19,'ltr'),
	(20,'artist_influences','Influences','','textarea','',6,0,NULL,'y','n','n','n','n','none','n',20,'ltr'),
	(21,'artist_current_sponsorship','Current Sponsorship','','textarea','0',6,0,NULL,'y','n','n','n','n','none','n',21,'ltr'),
	(22,'artist_website','Website','','text','',0,256,NULL,'y','n','n','n','n','none','n',22,'ltr'),
	(24,'artist_fans_gender','Fans Gender','','select','- Select -\nMostly Male\nMostly Female',0,0,NULL,'y','n','n','n','n','none','0',24,'0'),
	(25,'artist_fans_age','Fans Age','','select','- Select -\n12 - 17\n18 - 34\n35 - 54\n55+',0,0,NULL,'y','n','n','n','n','none','0',25,'0'),
	(26,'artist_genre','Genre','','select','- Select -\nHip Hop\nMetal\nCountry\nBluegrass\nClassical\nJazz',0,0,NULL,'y','n','n','n','n','br','0',26,'0'),
	(27,'sponsor_city','City','','text','',0,256,NULL,'y','n','n','n','n','none','n',27,'ltr'),
	(28,'sponsor_state','State','','select','- Select -\nAL\nCA\nTX\nTN\nGA',0,0,NULL,'y','n','n','n','n','br','0',28,'0'),
	(29,'artist_label','Label','','text','',0,256,NULL,'y','n','n','n','n','none','n',29,'ltr');

/*!40000 ALTER TABLE `exp_member_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_groups`;

CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group_description` text COLLATE utf8_unicode_ci NOT NULL,
  `is_locked` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_footer_report_bug` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_footer_new_ticket` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_footer_user_guide` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_design` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_data` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_addons` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_post_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_search` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int(10) unsigned NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_create_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_self_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_upload_new_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_upload_new_toolsets` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_toolsets` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_toolsets` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_upload_directories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_upload_directories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_upload_directories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_channels` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_channels` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_channels` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_channel_fields` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_channel_fields` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_channel_fields` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_statuses` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_statuses` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_statuses` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_categories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_member_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_member_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_member_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_new_templates` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_templates` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_templates` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_partials` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_partials` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_partials` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_variables` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_variables` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_variables` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_security_settings` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_translate` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_import` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_sql_manager` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_footer_report_bug`, `can_access_footer_new_ticket`, `can_access_footer_user_guide`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_members`, `can_access_sys_prefs`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_addons`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_cached_email`, `can_email_member_groups`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `can_create_entries`, `can_edit_self_entries`, `can_upload_new_files`, `can_edit_files`, `can_delete_files`, `can_upload_new_toolsets`, `can_edit_toolsets`, `can_delete_toolsets`, `can_create_upload_directories`, `can_edit_upload_directories`, `can_delete_upload_directories`, `can_create_channels`, `can_edit_channels`, `can_delete_channels`, `can_create_channel_fields`, `can_edit_channel_fields`, `can_delete_channel_fields`, `can_create_statuses`, `can_delete_statuses`, `can_edit_statuses`, `can_create_categories`, `can_create_member_groups`, `can_delete_member_groups`, `can_edit_member_groups`, `can_create_members`, `can_edit_members`, `can_create_new_templates`, `can_edit_templates`, `can_delete_templates`, `can_create_template_groups`, `can_edit_template_groups`, `can_delete_template_groups`, `can_create_template_partials`, `can_edit_template_partials`, `can_delete_template_partials`, `can_create_template_variables`, `can_delete_template_variables`, `can_edit_template_variables`, `can_access_security_settings`, `can_access_translate`, `can_access_import`, `can_access_sql_manager`)
VALUES
	(1,1,'Super Admin','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y',NULL,'n','y','n',0,'y',20,60,'y','y','y','y',NULL,0,NULL,'n','n','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','n','n','n','n'),
	(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n',NULL,'n','n','n',60,'n',20,60,'n','n','n','n',NULL,0,NULL,'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),
	(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n',NULL,'n','n','n',10,'n',20,60,'n','n','n','y',NULL,0,NULL,'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),
	(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n',NULL,'n','n','n',10,'n',20,60,'n','n','n','y',NULL,0,NULL,'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),
	(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','y',NULL,'n','n','n',10,'y',20,60,'y','n','n','y',NULL,0,NULL,'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),
	(6,1,'Sales','','n','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','y','y','n','n','n','n','n','n','y','n','n','blissocity@gmail.com','y','y','y',20,'n',0,0,'n','n','n','n','overview',1,'','y','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),
	(7,1,'Sponsors','','n','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',0,'n',0,0,'n','n','n','n',NULL,0,'','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),
	(8,1,'Artists','','n','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',0,'n',0,0,'n','n','n','n',NULL,1,'','y','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n');

/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_homepage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_homepage`;

CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`)
VALUES
	(1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0),
	(2,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(3,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(7,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(9,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(10,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(11,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(12,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(13,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(14,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),
	(15,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0);

/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_search`;

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members`;

CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `screen_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `crypt_key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interests` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yahoo_im` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msn_im` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icq` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `signature` text COLLATE utf8_unicode_ci,
  `avatar_filename` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text COLLATE utf8_unicode_ci,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `display_avatars` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time_format` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '12',
  `date_format` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '%n/%j/%Y',
  `include_seconds` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `profile_theme` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracker` text COLLATE utf8_unicode_ci,
  `template_size` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text COLLATE utf8_unicode_ci,
  `notepad_size` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text COLLATE utf8_unicode_ci,
  `quick_links` text COLLATE utf8_unicode_ci,
  `quick_tabs` text COLLATE utf8_unicode_ci,
  `show_sidebar` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_homepage_custom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_views` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `profile_views`)
VALUES
	(1,1,'rawxtar','rawxtar','20f9a3d6b59128953d8992e737263e99cec2ee1bc0d9bfed5e013019718d9549ce21119839e60df1698cd0e43192bb30f9a93b6f886b6d01bd44f963e68d0db7','T&2Z1lm7C{>L~3Yn;<=mOZ|R[1Rwc|(Uoaaa#$Ea6CEqb>%<M|87V7=_bS@HtNY-2=JRwjqY[+O!rjF\'!af#&cBl2hoMFF`Y[cpc5t8]Xr`xe%e\'r4WTLTG4~3J<vcyR','43f5bf6987c2bfad08c2a5822a333fdecda01f4c','62ad25f06b31535c578fcc4e51f595055b499361',NULL,'charted@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1456289420,1457889044,1457893877,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','12','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,'',NULL,'n',0,'y',0,NULL,NULL,NULL,0),
	(2,7,'priestcss@gmail.com','test sponsor','017a6d0b6577d0eccc78b8aaa7a49fae3fafacfe9bf98b137693db470a33114d2a08e43ad482eb65a4ecd9bb47348a50eb1f62faf31b27dd2bda0bbe47bb79c5','519hFLH\'[{_&Gw-mF6/9OuOl8rj\'*&`f.4})D$H9vQ8d$TUuI<%oQSl8Wv_9?H\'IyGp3ox}85Y+Qy,I=/vH[G+N)[IYq!-M5[&;BJwz\\S1-/XL<6*x&jpHC@X2W[lCRS','e5b3b9509799191af29ed5243b1cdd5e7680d434','330a79850164e01faaba56f391910296f68d6c3a',NULL,'priestcss@gmail.com','http://website.com','','','',0,0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'n',0,0,'::1',1456300112,1457285751,1457285751,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','n','y','english','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,76),
	(3,8,'theory@gmail.com','darwen\'s theory','94df595932a31954656a290600625adce89172ad0d37753bba11805b5206c20306a840fb80f5843a47d385c97f86e90fc3d317cf806c261edef9a6de5749e04f','3.rei/U#7;kuSn@_^)m@~u-2>*&kSBx>m@x6\\k?{|hDdVt-z[hrZ)59Jkr%;NHo4v>DvYN2pmU^Rm$pAT$GA[J(s(&l|qPBBcu!h%=-w!.z,b?Q3?8`C)S*@M-;a@dwr','795051ff6fef48dcf6180adec9de91ba10e7d81f','97b81205ba9e438db443c46e4dc82ff08a2f019c',NULL,'theory@gmail.com','http://darwenstheory.com','','','',0,0,0,'','','','','','','profile_1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'n',0,0,'::1',1456598420,1457474371,1457888935,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','n','y','english','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,88),
	(4,6,'rory','rory','c1fce964ba6169c70371a27420cb02e93a1574f6ac0aa40e714336d65e066ef070755c15dc51765a4201e5b8afec788b4a8abc99b29554a19c92a8ba2ccd5dce','Rt?mrG)}fFG>$Rv5S8zf.jE9YiA%%CetL!9<#*!@E4lR08?>;frqVWI)O`7MAKp7]qEn9E<#[^(g$USt{a$VNIzq\\n\"v^R+^OdksI*~C*>xCwiT`=L{c*@}m/<;@~\"h9','be40db9189fee5891cf79e18dd89fb7a31c103ea','f9cb90833640a3fa228df3f50142bea09907c9cc',NULL,'rory@rawxtar.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1456613044,1457309870,1457889158,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','12','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,11),
	(5,8,'eagar@email.com','eager seas','801cc65eece528bf24f0990ea864775b474694de040831a894906fbd930add4198b9257784f2d577ad2369399dedef5db6abb5e7fd130d80d81076333039000c','\\E[B&BxUM^)>e*G4kHJ}IZuu_qRODn7{&\\I\'\\46=P.,-Sqx\"z(\"XO^K=&Rw=]s:JN%7dZlAT[~iCS}/}(lSaVaBVbH?~cbH5Z\\_Hf3eYTstb6,.[Kmfpd]KrJ#107!wb','2e4a88b4e3033cd6ed93e93036702d07f5710db2','f645e369b9c0a78d7f98e5045f269d4c543e8989',NULL,'eagar@email.com','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'n',0,0,'::1',1456623378,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','n','y','english','America/Los_Angeles','12','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,12),
	(6,8,'socionic@email.com','socionic','a754f233ccc321fc7557568505f002e0a0c000bea424eece3a28a2a0a9c72b94acb2bbf1196a8c53b98559f33e50a742e899ec154f02655736142d9bfcd17425','V-ER\'(m\")\"<Y0IEe7!UmLYELHqxZNfM~gPf*L$dO}>ixOi!XB!lS`8AF:x^\"kGQe0BctY9J>7EsIpx_bb.cO8dLH/o|va.sDn;*rAu]\'F;J[gU@`?WENE\'>.Y\"Fbq4Uh','14f297e7b7a3b520f2d6b32268ccb7483df663b4','554de1f9a8ebd144362736f217a8608629f771de',NULL,'socionic@email.com','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'n',0,0,'::1',1456623397,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','n','y','english','America/Los_Angeles','12','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,6),
	(7,7,'company2@email.com','sponsor two','2c774b46231def1cb5c92cba82bc8649c6483e9fedb85913f6d4dd1875f37da1bffcc3c595424ca985db257c174100d6aaba02fb7089f5b60034456079d09c9e','GsJbq02*nvVyR\"DQd|bmm8P.x9uVJ@J(Ia;:gFbT/alCsVIKZ1Wu!/oh>\"kJfO@b0\'~eJ]P\'8K}XU0ZhRPWw-v1k\"(Cz\"z@-puTf2)Zx-2APbrdzCQ0c5AKtT#%F+.^`','ef92e6b925c5871bc93e2c178703830cdd7279f7','23d2c9a96d1ef67282ac520db825c1003abef6c7',NULL,'company2@email.com','http://website.com','','','',0,0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'n',0,0,'::1',1456696551,1456701052,1456809864,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','n','y','english','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,2),
	(8,6,'krish','krish','2af70f066cd417037126d06b207c2d4ae12cd613d92ba0c2fc364ddc8aa6ed631a6dc08f6ae571db727e447f333ea2c8a9ec519c3e81541d88efe5bda0932dca','m?~cvl]?4ZX0l)bshq>nPCZ~,T8v!a7sN+_kHG~9j26M&s}kjfxO?E6UPgUzEAj1J3dZ(WvIGNss+~Zf.O4@Ez=ZjAN8\"Ck#:eR:m*v2ZWfS4};q\\T\"PMB@ro1-.%Zo&','2d40c7944d4ff36210e3a66760373e4d18d2e979','279fdd4834a03e6051d31f90baa40ac50efeb0e3',NULL,'krish@bygmusic.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1456809935,1456809989,1457309818,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','12','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,0),
	(9,4,'unapproved@email.com','unapproved sponsor','b3a9995febea3457ee0e49828bee2d5fdf23f6aba5612191cf68ed4e2a9d6feaf6b15a5dcb824e752912cd0b85ddf082df1f7e15e42ac858b0ca64d5d9795e11','w4>qidFP)otA/q%XdZ?kn;!%6:PxN{pcy|XeCUq+FDYm8i4^6A&OEH1ORyG?)kI%#0\"=Mv:@T}J<yFa$CE1iGR!</E_;NZDy+,_+#]-|]:A<xX9Tf<U.qDTG<C7R;`<H','2f3a46d4480496314938389851f61a30dde3bcec','97b1ca7392716b31b164261c2129e4eee01b5af9',NULL,'unapproved@email.com','','','','',0,0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'n',0,0,'::1',1457222226,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','n','y','english','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,7),
	(10,8,'intivedartist1@email.com','invited artist one','a8198b49f74064b366483051cb421ad553d4279ff50d59c4ef79c9a600fd5ded0f9bf89d08f15d865715c638be09777bf28279c0e164b74a95b57df1f0b71900','BM;|\"n3H3N+C}5+p*{@o0RAB;Yj\'!d[`oZ}Q1&JW,(hhF+S7chFE-B~Yyj\\\";YnnK19(##w)vy$m#wxfF`]Zc/~hPNF/Z\'bCkRDa>=U?GwqGz2>@?mWp)\'2\'Tif+>&Mw','8fa37fc0f4c54741672c17751a80207599c786c4','b8c43652a5efac3ff93586cc5fa0ddce31d28412',NULL,'intivedartist1@email.com','','','','',0,0,0,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1457305897,1457306377,1457308602,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,0),
	(11,7,'is1@email.com','invited sponsor','770e2febd0814fd23bd94f1ceeae24010a5f1205d6265d1e13b18e911c3a0eaf8f5d02dcc276919f72d8d77f43cac49fefeb1f640544f6c72b8645b27b67d88c',';2[bCmX[;xE6IXBQn1x+hA)Q86:xwr)x5|K3<+!Y86\'qunFn>x`.G)g/cU}\"{QB<t.%CR\'z,(,KWHn/;c]C`~0b>`,o3[ZQc-cD750J0Q0H(Z6(#D?G5d)58\'Z0=Rp\"~','e37c1428347d34dca4c1f9fd16109586d96b2dd6','17966fc97fed62222f178bfbf3fa5096a1952e44',NULL,'is1@email.com','','','','',0,0,0,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1457308748,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,0),
	(12,5,'unsolone@email.com','unsol artist one','468196da66a8d705de5555fad9b9a8eb95114f410b32af9e673699543279b00ffcead7475896d7e00f8d3cfeed82895e545adef35fb40393a167a5a987446c84','SSF,Sh~v|=2n]cp.Ox,>0eF(,7.e*?Q}4Opv#OM`~rr2mB\\z\\:uTwJ`ZJ1vL0x#Bsi}YJAsilpu`>#z5\\~hHB*>+Q~OQ4q$uL\"e<5|,\'f]j8[q,$dPD-8)VPBpFvE=X!','3a005cc6154ac92b588de840dd23bb1f443d04d7','16014df6f15236bea57a26d4a0647423aabcbd02',NULL,'unsolone@email.com','','','','',0,0,0,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1457308850,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,0),
	(13,5,'unsolsponsor1@email.com','unsol sponsor one','fa4fe4518da2f055776506511d968fecfb0e6935c779f55cf9d943b4499cfd20d3d5b3ce813d17a6d3af127e70369399ac0e90bd7346d3a2f23462942f8cb094','\"J#EdReX.v|mL\\;7.J=}O+%}e]OtX7NpNyhi\'A0F,adGscY;;IgCZl0QT}wgCmJc#WJU9H]FYn80.dOS^*h(>;2V\\1ui1c=l./v)whN.(t+&H4JK9#3aLDXBCzh^n<rc','1eab1c00b5cf130d8aa88865e252818188952dfd','6a63dd3f978a3e8ab54e7f699e9d37faa4c553a7',NULL,'unsolsponsor1@email.com','','','','',0,0,0,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1457309018,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,0),
	(14,4,'artist5@email.com','artist 5','0eef88b98b27dfe26e81f300cc8bc854a937172cefaf8ad97ae191bda31180e23da7e47fc69aeeb9d6505cbab4f6eb4297ed5679d52acf58364b56e93e12f81d','O=\"ZINm+K_<p%9H3S(xLB=0RR[O^U|$+b<fpo@6~u@voi\"9Bhrq@\\aEP]+4.t)f[9F964@~We8x:*a~sb5n+~up7NkVb\'=yN3=N6S0hq>4{>\"_UJ:\'7KM5Y!z\'ti#tN4','a74b88ad7fb807224a4a2de2c8553a207958d819','a4766a853fe93138bad52dd4fcf739c4d9f24b80',NULL,'artist5@email.com','','','','',0,0,0,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'n',0,0,'::1',1457309173,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','n','y','english','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,6),
	(15,4,'sponsorneeds@email.com','sponsor with needs','e89a677ce0fad38a7d5ebfd04bff9755d82d5f679df464d8d2de15adc94405c31177b434b2ae1959e8e422537bc7456a47ebcc8ba363ffb66aa301216fe9ff59','MG[lrT9@S]-\"%l{)#?xTOz.r)3r+`]aaQdNYA06\\}ccr:2:pHWZeXCqE)[0\\OB:.f\'tVyrUPre#J\\nR>Hncvpl_g3sbH)lQU^%zj3a`SyEl#vPi@MO;hE.y->;xhKRfd','edfc9e0e56030b76fe79925f424d8bee2fb699bb','91ff5521b9437045521afc1fb3b5ac96c4c51c4f',NULL,'sponsorneeds@email.com','','','','',0,0,0,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1457474837,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','','','','%n/%j/%Y','n',NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL,5);

/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_attachments`;

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_message_copies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_copies`;

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_message_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_data`;

CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_message_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_folders`;

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`)
VALUES
	(1,'InBox','Sent','','','','','','','','');

/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_listed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_listed`;

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_module_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_module_member_groups`;

CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_modules`;

CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`)
VALUES
	(1,'Channel','2.0.1','n','n'),
	(2,'Comment','2.3.2','y','n'),
	(3,'Member','2.1','n','n'),
	(4,'Stats','2.0','n','n'),
	(5,'Rte','1.0.1','y','n'),
	(6,'File','1.0.0','n','n'),
	(7,'Filepicker','1.0','y','n'),
	(8,'Search','2.2.2','n','n'),
	(9,'User','4.0.3','y','n');

/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_online_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_online_users`;

CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`)
VALUES
	(119,1,4,'n','rory','::1',1457889158,'y');

/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_password_lockout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_password_lockout`;

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_plugins`;

CREATE TABLE `exp_plugins` (
  `plugin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`plugin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_relationships`;

CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_remember_me
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_remember_me`;

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_reset_password
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_reset_password`;

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_revision_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_revision_tracker`;

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `item_field` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_rte_tools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_rte_tools`;

CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_rte_tools` WRITE;
/*!40000 ALTER TABLE `exp_rte_tools` DISABLE KEYS */;

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`)
VALUES
	(1,'Blockquote','Blockquote_rte','y'),
	(2,'Bold','Bold_rte','y'),
	(3,'Headings','Headings_rte','y'),
	(4,'Image','Image_rte','y'),
	(5,'Italic','Italic_rte','y'),
	(6,'Link','Link_rte','y'),
	(7,'Ordered List','Ordered_list_rte','y'),
	(8,'Underline','Underline_rte','y'),
	(9,'Unordered List','Unordered_list_rte','y'),
	(10,'View Source','View_source_rte','y');

/*!40000 ALTER TABLE `exp_rte_tools` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_rte_toolsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_rte_toolsets`;

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tools` text COLLATE utf8_unicode_ci,
  `enabled` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`)
VALUES
	(1,0,'Default','3|2|5|1|9|7|6|4|10','y');

/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search`;

CREATE TABLE `exp_search` (
  `search_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext COLLATE utf8_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8_unicode_ci,
  `result_page` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_search_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search_log`;

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_security_hashes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_security_hashes`;

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`)
VALUES
	(62,1457883856,'58b23790dcef3fd73330f1d76dc8fcba3cbe829f','7c6897da8f70a297dce011f5af5a68b5f18e21fb'),
	(67,1457893877,'0e18b178f724df0142604634a50abbc9d333cde7','c119cc1137cc9ebc3054012a868265b97f3a6850'),
	(66,1457889158,'7adde7933dfc832a3f2e05fa7e73d57f3e03d498','756e62700dacac3f982433058ca28b9ccd836401');

/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sessions`;

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `last_activity`)
VALUES
	('7adde7933dfc832a3f2e05fa7e73d57f3e03d498',4,0,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.3',NULL,'7f8372cc249f18fac2ce7b60f5f3c11a',1457889156,1457889158),
	('58b23790dcef3fd73330f1d76dc8fcba3cbe829f',1,1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.3',NULL,'42dec2872589197e5aed8cda818b6d9f',1457888077,1457889129),
	('0e18b178f724df0142604634a50abbc9d333cde7',1,1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.3',NULL,'42dec2872589197e5aed8cda818b6d9f',1457893877,1457893877);

/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sites`;

CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8_unicode_ci,
  `site_system_preferences` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `site_member_preferences` text COLLATE utf8_unicode_ci NOT NULL,
  `site_template_preferences` text COLLATE utf8_unicode_ci NOT NULL,
  `site_channel_preferences` text COLLATE utf8_unicode_ci NOT NULL,
  `site_bootstrap_checksums` text COLLATE utf8_unicode_ci NOT NULL,
  `site_pages` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`)
VALUES
	(1,'BYG MUSIC','bygmusic',NULL,'YTo4Nzp7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5IjtzOjEwOiJzaXRlX2luZGV4IjtzOjk6ImluZGV4LnBocCI7czo4OiJzaXRlX3VybCI7czoxNjoiaHR0cDovL2J5Z211c2ljLyI7czo2OiJjcF91cmwiO3M6MjU6Imh0dHA6Ly9ieWdtdXNpYy9hZG1pbi5waHAiO3M6MTY6InRoZW1lX2ZvbGRlcl91cmwiO3M6MjM6Imh0dHA6Ly9ieWdtdXNpYy90aGVtZXMvIjtzOjE3OiJ0aGVtZV9mb2xkZXJfcGF0aCI7czo1NjoiL0FwcGxpY2F0aW9ucy9NQU1QL2h0ZG9jcy9wZXJzb25hbC9ieWcvX3JlcG8vYnlnL3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoxNzoiY2hhcnRlZEBnbWFpbC5jb20iO3M6MTQ6IndlYm1hc3Rlcl9uYW1lIjtzOjA6IiI7czoyMDoiY2hhbm5lbF9ub21lbmNsYXR1cmUiO3M6NzoiY2hhbm5lbCI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjMyOiJodHRwOi8vYnlnbXVzaWMvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjYxOiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL3BlcnNvbmFsL2J5Zy9fZnVsbC9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTU6InJlcXVpcmVfY2FwdGNoYSI7czoxOiJuIjtzOjE4OiJlbmFibGVfc3FsX2NhY2hpbmciO3M6MToibiI7czoxODoiZm9yY2VfcXVlcnlfc3RyaW5nIjtzOjE6Im4iO3M6MTM6InNob3dfcHJvZmlsZXIiO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTU6ImNvb2tpZV9odHRwb25seSI7TjtzOjEzOiJjb29raWVfc2VjdXJlIjtOO3M6MjA6IndlYnNpdGVfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTU6ImNwX3Nlc3Npb25fdHlwZSI7czoxOiJjIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjg6InJlZGlyZWN0IjtzOjk6ImRlZnRfbGFuZyI7czo3OiJlbmdsaXNoIjtzOjg6InhtbF9sYW5nIjtzOjI6ImVuIjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjE5OiJBbWVyaWNhL0xvc19BbmdlbGVzIjtzOjExOiJkYXRlX2Zvcm1hdCI7czo4OiIlbi8lai8lWSI7czoxMToidGltZV9mb3JtYXQiO3M6MjoiMTIiO3M6MTM6Im1haWxfcHJvdG9jb2wiO3M6NDoibWFpbCI7czoxMToic210cF9zZXJ2ZXIiO3M6MDoiIjtzOjk6InNtdHBfcG9ydCI7TjtzOjEzOiJzbXRwX3VzZXJuYW1lIjtzOjA6IiI7czoxMzoic210cF9wYXNzd29yZCI7czowOiIiO3M6MTE6ImVtYWlsX2RlYnVnIjtzOjE6Im4iO3M6MTM6ImVtYWlsX2NoYXJzZXQiO3M6NToidXRmLTgiO3M6MTU6ImVtYWlsX2JhdGNobW9kZSI7czoxOiJuIjtzOjE2OiJlbWFpbF9iYXRjaF9zaXplIjtzOjA6IiI7czoxMToibWFpbF9mb3JtYXQiO3M6NToicGxhaW4iO3M6OToid29yZF93cmFwIjtzOjE6InkiO3M6MjI6ImVtYWlsX2NvbnNvbGVfdGltZWxvY2siO3M6MToiNSI7czoyMjoibG9nX2VtYWlsX2NvbnNvbGVfbXNncyI7czoxOiJ5IjtzOjE2OiJsb2dfc2VhcmNoX3Rlcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTI6ImVtb3RpY29uX3VybCI7czozMToiaHR0cDovL2J5Z211c2ljL2ltYWdlcy9zbWlsZXlzLyI7czoxOToicmVjb3VudF9iYXRjaF90b3RhbCI7czo0OiIxMDAwIjtzOjE3OiJuZXdfdmVyc2lvbl9jaGVjayI7czoxOiJ5IjtzOjE3OiJlbmFibGVfdGhyb3R0bGluZyI7czoxOiJuIjtzOjE3OiJiYW5pc2hfbWFza2VkX2lwcyI7czoxOiJ5IjtzOjE0OiJtYXhfcGFnZV9sb2FkcyI7czoyOiIxMCI7czoxMzoidGltZV9pbnRlcnZhbCI7czoxOiI4IjtzOjEyOiJsb2Nrb3V0X3RpbWUiO3M6MjoiMzAiO3M6MTU6ImJhbmlzaG1lbnRfdHlwZSI7czo3OiJtZXNzYWdlIjtzOjE0OiJiYW5pc2htZW50X3VybCI7czowOiIiO3M6MTg6ImJhbmlzaG1lbnRfbWVzc2FnZSI7czo1MDoiWW91IGhhdmUgZXhjZWVkZWQgdGhlIGFsbG93ZWQgcGFnZSBsb2FkIGZyZXF1ZW5jeS4iO3M6MTc6ImVuYWJsZV9zZWFyY2hfbG9nIjtzOjE6InkiO3M6MTk6Im1heF9sb2dnZWRfc2VhcmNoZXMiO3M6MzoiNTAwIjtzOjExOiJydGVfZW5hYmxlZCI7czoxOiJ5IjtzOjIyOiJydGVfZGVmYXVsdF90b29sc2V0X2lkIjtzOjE6IjEiO3M6MTM6ImZvcnVtX3RyaWdnZXIiO047fQ==','YTo0Nzp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToieSI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NjoibWFudWFsIjtzOjIzOiJuZXdfbWVtYmVyX25vdGlmaWNhdGlvbiI7czoxOiJ5IjtzOjIzOiJtYnJfbm90aWZpY2F0aW9uX2VtYWlscyI7czoyMDoiYmxpc3NvY2l0eUBnbWFpbC5jb20iO3M6MjQ6InJlcXVpcmVfdGVybXNfb2Zfc2VydmljZSI7czoxOiJ5IjtzOjIwOiJkZWZhdWx0X21lbWJlcl9ncm91cCI7czoxOiI1IjtzOjE1OiJwcm9maWxlX3RyaWdnZXIiO3M6NjoibWVtYmVyIjtzOjEyOiJtZW1iZXJfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoxNDoiZW5hYmxlX2F2YXRhcnMiO3M6MToieSI7czoyMDoiYWxsb3dfYXZhdGFyX3VwbG9hZHMiO3M6MToibiI7czoxMDoiYXZhdGFyX3VybCI7czozMToiaHR0cDovL2J5Z211c2ljL2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6NjA6Ii9BcHBsaWNhdGlvbnMvTUFNUC9odGRvY3MvcGVyc29uYWwvYnlnL19mdWxsL2ltYWdlcy9hdmF0YXJzLyI7czoxNjoiYXZhdGFyX21heF93aWR0aCI7czozOiIxMDAiO3M6MTc6ImF2YXRhcl9tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMzoiYXZhdGFyX21heF9rYiI7czoyOiI1MCI7czoxMzoiZW5hYmxlX3Bob3RvcyI7czoxOiJuIjtzOjk6InBob3RvX3VybCI7czozNzoiaHR0cDovL2J5Z211c2ljL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czo2NjoiL0FwcGxpY2F0aW9ucy9NQU1QL2h0ZG9jcy9wZXJzb25hbC9ieWcvX2Z1bGwvaW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NDU6Imh0dHA6Ly9ieWdtdXNpYy9pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjc0OiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL3BlcnNvbmFsL2J5Zy9fZnVsbC9pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxNzoic2lnX2ltZ19tYXhfd2lkdGgiO3M6MzoiNDgwIjtzOjE4OiJzaWdfaW1nX21heF9oZWlnaHQiO3M6MjoiODAiO3M6MTQ6InNpZ19pbWdfbWF4X2tiIjtzOjI6IjMwIjtzOjE1OiJwcnZfbXNnX2VuYWJsZWQiO3M6MToieSI7czoyNToicHJ2X21zZ19hbGxvd19hdHRhY2htZW50cyI7czoxOiJ5IjtzOjE5OiJwcnZfbXNnX3VwbG9hZF9wYXRoIjtzOjY3OiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL3BlcnNvbmFsL2J5Zy9fZnVsbC9pbWFnZXMvcG1fYXR0YWNobWVudHMvIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJzY3JlZW5fbmFtZSI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjM6ImFzYyI7czoyMDoibWVtYmVybGlzdF9yb3dfbGltaXQiO3M6MjoiMjAiO3M6Mjg6ImFwcHJvdmVkX21lbWJlcl9ub3RpZmljYXRpb24iO3M6MToieSI7czoyODoiZGVjbGluZWRfbWVtYmVyX25vdGlmaWNhdGlvbiI7czoxOiJ5Ijt9','YTo3OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6MDoiIjtzOjE5OiJzYXZlX3RtcGxfcmV2aXNpb25zIjtzOjE6Im4iO3M6MTg6Im1heF90bXBsX3JldmlzaW9ucyI7czoxOiI1IjtzOjE1OiJzYXZlX3RtcGxfZmlsZXMiO3M6MToieSI7czoxODoidG1wbF9maWxlX2Jhc2VwYXRoIjtOO30=','YToxMzp7czoyMzoiYXV0b19hc3NpZ25fY2F0X3BhcmVudHMiO3M6MToieSI7czoyMzoiYXV0b19jb252ZXJ0X2hpZ2hfYXNjaWkiO3M6MToibiI7czoyMzoiY29tbWVudF9lZGl0X3RpbWVfbGltaXQiO047czoyNzoiY29tbWVudF9tb2RlcmF0aW9uX292ZXJyaWRlIjtOO3M6MjI6ImNvbW1lbnRfd29yZF9jZW5zb3JpbmciO047czoxNToiZW5hYmxlX2NvbW1lbnRzIjtOO3M6MTg6ImltYWdlX2xpYnJhcnlfcGF0aCI7czowOiIiO3M6MjE6ImltYWdlX3Jlc2l6ZV9wcm90b2NvbCI7czozOiJnZDIiO3M6MjI6Im5ld19wb3N0c19jbGVhcl9jYWNoZXMiO3M6MToieSI7czoyMjoicmVzZXJ2ZWRfY2F0ZWdvcnlfd29yZCI7czo4OiJjYXRlZ29yeSI7czoxNjoidGh1bWJuYWlsX3ByZWZpeCI7czo1OiJ0aHVtYiI7czoxNzoidXNlX2NhdGVnb3J5X25hbWUiO3M6MToibiI7czoxNDoid29yZF9zZXBhcmF0b3IiO3M6NDoiZGFzaCI7fQ==','YTozOntzOjU0OiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL3BlcnNvbmFsL2J5Zy9fZnVsbC9pbmRleC5waHAiO3M6MzI6ImE4YzM2MmM4ZGFhN2U2MGVhODUxOWYwYzlkZjgyNDFkIjtzOjU4OiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL3BlcnNvbmFsL2J5Zy9fcmVwby9ieWcvaW5kZXgucGhwIjtzOjMyOiIyMGJmNWNlMzdlYTI3ZDljNTYxYzUyZDUwZGRhZjJkOSI7czo3OiJlbWFpbGVkIjthOjA6e319','YToxOntpOjE7YToxOntzOjM6InVybCI7czoyNjoiaHR0cDovL2J5Z211c2ljL2luZGV4LnBocC8iO319');

/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_snippets`;

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`, `edit_date`)
VALUES
	(1,1,'artist_nav','    <div id=\"navi-wrap\"><div id=\"navi\">\n        \n		<div class=\"row\">\n			<div class=\"row columns twelve\"><ul class=\"menu\">\n				<li><a href=\"/home\"><i class=\"fi-home\"></i> <span>Home</span></a></li>\n				<li><a href=\"/edit/contact\">Edit Contact</a></li>\n				<li><a href=\"/edit/bio\">Edit Bio</a></li>\n				<li><a href=\"/edit/photo\">Edit Photo</a></li>\n				<li style=\"background: rgba(255, 0, 255, .25);\"><a href=\"/edit/social\">Edit Social</a></li>\n				<li><a href=\"/edit/media\">Edit Media</a></li>\n				<!-- <li><a href=\"/invite\">Invite User</a></li> -->\n				<li>{exp:user:logout return=\"/\"}<a href=\"{url}\">Log Out</a>{/exp:user:logout}</li>\n			</ul></div>\n		</div>\n\n    </div></div>',1457885101),
	(2,1,'global_close','    <div id=\"foot-wrap\"><div id=\"foot\">\n        \n    </div></div>\n    \n</div>\n\n\n\n</body>\n</html>',1457473474),
	(3,1,'global_open','<!DOCTYPE html>\n\n<html>\n<head>\n    <meta charset=\"utf-8\" />\n    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <title>Bygmusic</title>\n    <link rel=\"stylesheet\" href=\"/_css/foundation.css\" />\n    <link href=\'https://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300\' rel=\'stylesheet\' type=\'text/css\'>\n	<link rel=\"stylesheet\" href=\"/_css/foundation-icons.css\" />\n    <link rel=\"stylesheet\" href=\"/_css/app.css\" />\n    \n    <!-- <script type=\"text/javascript\" src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js\"></script> -->\n    <script src=\"/_js/vendor/jquery.min.js\"></script>\n    <script src=\"/_js/vendor/what-input.min.js\"></script>\n    <script src=\"/_js/foundation.min.js\"></script>\n    <script src=\"/_js/app.js\"></script>\n    \n</head>\n\n<body>\n	\n<div id=\"wrap\">\n    \n    <div id=\"head-wrap\"><div id=\"head\">\n        \n    </div></div>',1457473469),
	(4,1,'sales_nav','    <div id=\"navi-wrap\"><div id=\"navi\">\n        \n		<div class=\"row\">\n			<div class=\"row columns twelve\"><ul class=\"menu\">\n				<li><a href=\"/home\"><i class=\"fi-home\"></i> <span>Home</span></a></li>\n				<li><a href=\"/invite\"><span>Invite</span></a></li>\n				<li><a href=\"/browse/artists\"><span>Browse Artists</span></a></li>\n				<li><a href=\"/browse/sponsors\"><span>Browse Sponsors</span></a></li>\n				<!-- <li><a href=\"/invite\">Invite User</a></li> -->\n				<li>{exp:user:logout return=\"/\"}<a href=\"{url}\">Log Out</a>{/exp:user:logout}</li>\n			</ul></div>\n		</div>\n\n    </div></div>',1457291589),
	(5,1,'sponsor_nav','    <div id=\"navi-wrap\"><div id=\"navi\">\n        \n		<div class=\"row\">\n			<div class=\"row columns twelve\"><ul class=\"menu\">\n				<li><a href=\"/home\"><i class=\"fi-home\"></i> <span>Home</span></a></li>\n				<li><a href=\"/browse/artists\"><span>Browse Artists</span></a></li>\n				<li><a href=\"/edit\">Edit Profile</a></li>\n				<!-- <li><a href=\"/invite\">Invite User</a></li> -->\n				<li>{exp:user:logout return=\"/\"}<a href=\"{url}\">Log Out</a>{/exp:user:logout}</li>\n			</ul></div>\n		</div>\n\n    </div></div>',1456698161),
	(6,1,'artist_register','			<!-- === REGISTER ARTIST === -->\n			<div id=\"artist-register\" class=\"hide\">\n{exp:user:register admin_register=\"yes\" group_id=\"8\" required=\"\" return=\"register/thankyou\"}				\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Contact Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"contact_name\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Position\n									<input type=\"text\" name=\"contact_position\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Email\n									<input type=\"email\" name=\"username\" id=\"email\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Phone\n									<input type=\"tel\" name=\"artist_contact_phone\" placeholder=\"\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Artist Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"screen_name\" placeholder=\"\">\n								</label>\n								<label>Genre\n									<select name=\"artist_genre\" id=\"\">\n										{select_artist_genre}\n											<option value=\"{value}\">{value}</option>\n										{/select_artist_genre}\n									</select>\n								</label>\n								\n								<div class=\"row\">\n									<div class=\" columns small-8\">\n										<label>City\n											<input type=\"text\" name=\"artist_city\" placeholder=\"\">\n										</label>\n									</div>\n									<div class=\"columns small-4\">\n										<label>State\n											<select name=\"artist_state\" id=\"\">\n												{select_artist_state}\n													<option value=\"{value}\">{value}</option>\n												{/select_artist_state}\n											</select>\n										</label>\n									</div>\n								</div>\n\n								<label>Reach\n									<select name=\"artist_reach\" id=\"\">\n										{select_artist_reach}\n											<option value=\"{value}\">{value}</option>\n										{/select_artist_reach}\n									</select>\n								</label>\n							</div>\n							<div class=\"medium-6 columns end\">\n								<label>Members\n									<textarea name=\"artist_members\" id=\"\" cols=\"30\" rows=\"6\" placeholder=\"Leave blank if solo artist.\"></textarea>\n								</label>\n								<label>Current Label or Affiliation\n									<input type=\"text\" placeholder=\"\" name=\"artist_label\" id=\"artist_label\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Artist Bio</legend>\n							<div class=\"twelve columns\">\n								<label>Photo [ get back to this ]\n									<input type=\"file\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>Bio\n									<textarea name=\"artist_bio\" id=\"artist_bio\" cols=\"30\" rows=\"7\"></textarea>\n								</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>What artists are you inspired by? \n									<textarea name=\"artist_influences\" id=\"artist_influences\" cols=\"30\" rows=\"7\"></textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Current Sponsorship Activity</legend>\n							<div class=\"twelve columns\">\n								<label>Please, tell us what kinds of sponsorship you are currently accepting.\n									<textarea name=\"artist_current_sponsorship\" id=\"artist_current_sponsorship\" cols=\"30\" rows=\"7\"></textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Artist Media</legend>\n							<div class=\"twelve columns\">\n								<label>Website\n									<input type=\"text\" name=\"url\" id=\"url\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>Links to other Media\n									<textarea name=\"artist_other_media\" id=\"artist_other_media\" cols=\"30\" rows=\"7\" placeholder=\"Show us what you got!\"></textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Social Media [ get back to this ]</legend>\n							<div class=\"twelve columns\">\n								<a href=\"\" class=\"button\"><i class=\"fi-social-facebook\"></i> Connect Facebook</a>\n								<a href=\"\" class=\"button\"><i class=\"fi-social-twitter\"></i> Connect Twitter</a>\n								<a href=\"\" class=\"button\"><i class=\"fi-social-instagram\"></i> Connect Instagram</a>\n								<a href=\"\" class=\"button\"><i class=\"fi-sound\"></i> Connect Soundcloud</a>\n								<a href=\"\" class=\"button\"><i class=\"fi-social-youtube\"></i> Connect Youtube</a>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Tell us about your fans.</legend>\n							<fieldset class=\"small-12 medium-6 columns\">\n								<legend>Gender</legend>\n								<select name=\"artist_fans_gender\">\n									{select_artist_fans_gender}\n										<option value=\"{value}\">{value}</option>\n									{/select_artist_fans_gender}\n								</select>\n							</fieldset>\n							<fieldset class=\"small-12 medium-6 columns\">\n								<legend>Aged</legend>\n								<select name=\"artist_fans_age\">\n									{select_artist_fans_age}\n										<option value=\"{value}\">{value}</option>\n									{/select_artist_fans_age}\n								</select>\n							</fieldset>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Agreements</legend>\n							<div class=\"columns twelve\">\n								<label>I accept the <a href=\"terms.php\">Terms of Service</a>\n									<input type=\"checkbox\" name=\"accept_terms\" value=\"y\" />\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Create Password</legend>\n							<div class=\"medium-6 columns\">\n								<label>Password\n									<input type=\"password\" name=\"password\" id=\"password\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Confirm Password\n									<input type=\"password\" name=\"password_confirm\"  id=\"password_confirm\" placeholder=\"\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<button type=\"submit\" class=\"button\">Submit</button>\n				</div>\n\n{/exp:user:register}\n			</div>',1457284462),
	(7,1,'sponsor_register','			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\" class=\"hide\">\n{exp:user:register admin_register=\"yes\" group_id=\"7\" required=\"\" return=\"register/thankyou\"}\n				\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Company Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"screen_name\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns end\">\n								<label>Industry Category\n									<select name=\"sponsor_industry_category\" id=\"\">\n										{select_sponsor_industry_category}\n											<option value=\"{value}\">{value}</option>\n										{/select_sponsor_industry_category}\n									</select>\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Size\n									<select name=\"sponsor_company_size\" id=\"\">\n										{select_sponsor_company_size}\n											<option value=\"{value}\">{value}</option>\n										{/select_sponsor_company_size}\n									</select>\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Website\n									<input type=\"url\" name=\"url\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"columns twelve\">\n								<label>Digital Actions Required\n									<textarea name=\"sponsor_digital_actions_required\" id=\"\" cols=\"30\" rows=\"4\"></textarea>\n								</label>\n							</div>\n							<div class=\"columns twelve\">\n								<label>Please list any advertising agencies we may need to coordinate with.\n									<textarea name=\"sponsor_other_agencies\" id=\"\" cols=\"30\" rows=\"2\"></textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Contact Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"contact_name\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Position\n									<input type=\"text\" name=\"contact_position\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Email\n									<!-- <input type=\"email\" placeholder=\"\"> -->\n									<input type=\"email\" name=\"username\" id=\"email\" />\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Phone\n									<input type=\"tel\" name=\"contact_phone\" placeholder=\"\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Agreements</legend>\n							<div class=\"columns twelve\">\n								<label>I accept the <a href=\"terms.php\">Terms of Service</a>\n									<input type=\"checkbox\" name=\"accept_terms\" value=\"y\" />\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Create Password</legend>\n							<div class=\"medium-6 columns\">\n								<label>Password\n									<input type=\"password\" name=\"password\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Confirm Password\n									<input type=\"password\" name=\"password_confirm\" placeholder=\"\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<button type=\"submit\" class=\"button\">Register</button>\n				</div>\n\n{/exp:user:register}\n			</div>',1457285506),
	(8,1,'sales_dashboard','    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\">\n        	<div class=\"columns twelve\">\n        		<h1>Hi {username}.</h1>\n            </div>\n        </div>\n\n        <div class=\"row\">\n            <div class=\"columns small-12\" style=\"background: rgba(255, 0, 255, .25);\">\n                <h5>Waiting Approval</h5>\n                <table class=\"hover\">\n                    <tr>\n                        <th>Name</th>\n                        <th>Group</th>\n                        <th width=\"100\">Added</th>\n                    </tr>\n{exp:user:users group_id=\"4\"}\n                    {if user_no_results}\n                        <tr><td colspan=\"3\">Sorry, no results were found.</td></tr>\n                    {/if}\n                    <tr>\n                        <td><a href=\"/profile/pending/{member_id}\">{screen_name}</a></td>\n                        <td>{if requested_group == \"7\"}Sponsor{if:else}Artist{/if}</td>\n                        <td>{join_date format=\"%m.%d.%y\"}</td>\n                    </tr>\n{/exp:user:users}\n                </table>\n            </div>\n        </div>\n\n\n        <div class=\"row\">\n            <div class=\"columns small-12 medium-6\">\n                <h5>Newest Artists</h5>\n                <table class=\"hover\">\n                    <tr>\n                        <th>Name</th>\n                        <th width=\"100\">Added</th>\n                    </tr>\n{exp:user:users group_id=\"8\" limit=\"5\"}\n                    <tr>\n                        <td><a href=\"/profile/artist/{member_id}\">{screen_name}</a></td>\n                        <td>{join_date format=\"%m.%d.%y\"}</td>\n                    </tr>\n{/exp:user:users}\n                </table>\n            </div>\n            <div class=\"columns small-12 medium-6\">\n                <h5>Newest Sponsors</h5>\n                <table class=\"hover\">\n                    <tr>\n                        <th>Name</th>\n                        <th width=\"100\">Added</th>\n                    </tr>\n{exp:user:users group_id=\"7\" limit=\"5\"}\n                    <tr>\n                        <td><a href=\"/profile/sponsor/{member_id}\">{screen_name}</a></td>\n                        <td>{join_date format=\"%m.%d.%y\"}</td>\n                    </tr>\n{/exp:user:users}\n                </table>\n            </div>\n        </div>\n        \n    </div></div>',1457311634),
	(12,1,'browse-sponsors','        <div class=\"row\"><div class=\"columns twelve\">\n        	<table class=\"hover\">\n        		\n        		<tr>\n                    <th>Name</th>\n                    <th>Contact</th>\n                    <th width=\"150\">City</th>\n                    <th width=\"200\">Product Type</th>\n                </tr>\n\n{exp:user:users group_id=\"7\" dynamic=\"no\"}\n        		<tr>\n                    <td><a href=\"/profile/sponsor/{member_id}\">{screen_name}</a></td>\n                    <td>{contact_name}</td>\n                    <td>{sponsor_city}, {sponsor_state}</td>\n                    <td>{sponsor_industry_category}</td>\n                </tr>\n{/exp:user:users}\n\n        	</table>\n        </div></div>',1457291109),
	(11,1,'Sales_dashboard','    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\">\n        	<div class=\"columns twelve\">\n        		<h1>Hi {username}.</h1>\n            </div>\n        </div>\n\n        <div class=\"row\">\n            <div class=\"columns small-12\" style=\"background: rgba(255, 0, 255, .25);\">\n                <h5>Waiting Approval</h5>\n                <table class=\"hover\">\n                    <tr>\n                        <th>Name</th>\n                        <th>Group</th>\n                        <th width=\"100\">Added</th>\n                    </tr>\n{exp:user:users group_id=\"4\"}\n                    {if user_no_results}\n                        <tr><td colspan=\"3\">Sorry, no results were found.</td></tr>\n                    {/if}\n                    <tr>\n                        <td><a href=\"/profile/pending/{member_id}\">{screen_name}</a></td>\n                        <td>{if requested_group == \"7\"}Sponsor{if:else}Artist{/if}</td>\n                        <td>{join_date format=\"%m.%d.%y\"}</td>\n                    </tr>\n{/exp:user:users}\n                </table>\n            </div>\n        </div>\n\n\n        <div class=\"row\">\n            <div class=\"columns small-12 medium-6\">\n                <h5>Newest Artists</h5>\n                <table class=\"hover\">\n                    <tr>\n                        <th>Name</th>\n                        <th width=\"100\">Added</th>\n                    </tr>\n{exp:user:users group_id=\"8\" limit=\"5\"}\n                    <tr>\n                        <td><a href=\"/profile/artist/{member_id}\">{screen_name}</a></td>\n                        <td>{join_date format=\"%m.%d.%y\"}</td>\n                    </tr>\n{/exp:user:users}\n                </table>\n            </div>\n            <div class=\"columns small-12 medium-6\">\n                <h5>Newest Sponsors</h5>\n                <table class=\"hover\">\n                    <tr>\n                        <th>Name</th>\n                        <th width=\"100\">Added</th>\n                    </tr>\n{exp:user:users group_id=\"7\" limit=\"5\"}\n                    <tr>\n                        <td><a href=\"/profile/sponsor/{member_id}\">{screen_name}</a></td>\n                        <td>{join_date format=\"%m.%d.%y\"}</td>\n                    </tr>\n{/exp:user:users}\n                </table>\n            </div>\n        </div>\n        \n    </div></div>',1457311634),
	(9,1,'group6_nav','    <div id=\"navi-wrap\"><div id=\"navi\">\n        \n		<div class=\"row\">\n			<div class=\"row columns twelve\"><ul class=\"menu\">\n				<li><a href=\"/sales\"><i class=\"fi-home\"></i> <span>Home</span></a></li>\n				<li><a href=\"/sales/browse/artists\"><span>Browse Artists</span></a></li>\n				<li><a href=\"/sales/browse/sponsors\"><span>Browse Sponsors</span></a></li>\n			</ul></div>\n		</div>\n\n    </div></div>',1456625219),
	(10,1,'Sales_nav','    <div id=\"navi-wrap\"><div id=\"navi\">\n        \n		<div class=\"row\">\n			<div class=\"row columns twelve\"><ul class=\"menu\">\n				<li><a href=\"/home\"><i class=\"fi-home\"></i> <span>Home</span></a></li>\n				<li><a href=\"/invite\"><span>Invite</span></a></li>\n				<li><a href=\"/browse/artists\"><span>Browse Artists</span></a></li>\n				<li><a href=\"/browse/sponsors\"><span>Browse Sponsors</span></a></li>\n				<!-- <li><a href=\"/invite\">Invite User</a></li> -->\n				<li>{exp:user:logout return=\"/\"}<a href=\"{url}\">Log Out</a>{/exp:user:logout}</li>\n			</ul></div>\n		</div>\n\n    </div></div>',1457291589),
	(14,1,'sponsor_profile','    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\"><div class=\"columns twelve\"><h1>Sponsor Profile</h1></div></div>\n\n        <!-- <div class=\"row\"><div class=\"columns twelve sales text-center\">\n			<h5>Approve this sponsor?</h5>\n			<input type=\"radio\" name=\"approve\" value=\"\" id=\"yes\" required><label for=\"yes\">Yes</label>\n			<input type=\"radio\" name=\"approve\" value=\"\" id=\"no\"><label for=\"no\">No</label>\n			<br>\n			<div class=\"button\">Submit</div>\n		</div></div> -->\n\n{exp:user:profile dynamic=\"yes\"}\n        <div class=\"row\">\n        	<div class=\"columns twelve\">\n        		<h2>{screen_name}</h2>\n        	</div>\n        </div>\n\n        <div class=\"row\">\n        	<div class=\"columns small-12 medium-4\">\n        		<h3>Sponsor Details</h3>\n				<ul>\n					<li>City : {sponsor_city}, {sponsor_state}</li>\n					<li>Product Type : {sponsor_industry_category}</li>\n					<li>Company Size : {sponsor_company_size}</li>\n				</ul>\n        	</div>\n        	<div class=\"columns small-12 medium-4\">\n        		<h3>Contact Information</h3>\n				<ul>\n					<li>{contact_name}</a></li>\n					<li><i class=\"fi-mail\"></i> <a href=\"mailto:{email}\">{username}</a></li>\n					<li><i class=\"fi-telephone\"></i> {contact_phone}</li>\n					<li><i class=\"fi-home\"></i> <a href=\"{url}\" target=\"_blank\">{url}</a></li>\n				</ul>\n        	</div>\n        	<div class=\"columns small-12 medium-4\">\n        		<h3>Marketing Details</h3>\n        		<ul>\n        			<li>Actions required : {sponsor_digital_actions_required}</li>\n        			<li>Other Agencies : {sponsor_other_agencies}</li>\n        		</ul>\n        	</div>\n        </div>\n\n        <div class=\"row\">\n			<div class=\"columns small-12\">\n				<h3>Notes</h3>\n{exp:channel:form channel=\"notes\" return=\"/profile/{segment_2}/{segment_3}\"}\n				<div class=\"input-group\">\n					<input type=\"hidden\" name=\"title\" id=\"title\" value=\"Sponsor Note - {segment_3} - {current_time}\"/>\n					<input type=\"hidden\" name=\"note_member_id\" id=\"note_member_id\" value=\"{segment_3}\"/>\n					<input type=\"hidden\" name=\"status\" id=\"status\" value=\"open\">\n					<input class=\"input-group-field\" type=\"text\" placeholder=\"New note\" name=\"note_copy\" id=\"note_copy\"/>\n					<div class=\"input-group-button\">\n						<input type=\"submit\" class=\"button\" value=\"Submit\"/>\n					</div>\n				</div>\n{/exp:channel:form}\n				<table class=\"hover\">\n					<tr>\n						<th>Note</th>\n						<th width=\"150\">Date / Author</th>\n					</tr>\n{exp:channel:entries channel=\"notes\" dynamic=\"no\" require_entry=\"yes\" search:note_member_id=\"={segment_3}\"}\n					<tr>\n						<td>[ {note_member_id} ] {note_copy}</td>\n						<td>\n							{entry_date format=\"%m.%d.%Y\"} <br>\n							{author}\n						</td>\n					</tr>\n					{if no_results}\n						<tr><td colspan=\"2\">There are no notes.</td></tr>\n					{/if}\n{/exp:channel:entries}\n				</table>\n			</div>\n		\n		</div>\n{/exp:user:profile}\n        \n    </div></div>',1457285437),
	(13,1,'browse-artists','        <div class=\"row\"  style=\"background: rgba(255, 0, 255, .25);\">\n            <div class=\"columns medium-2\">\n                <select name=\"\" id=\"\">\n                    <option value=\"\">-Genre-</option>\n                    <option value=\"\">Rock</option>\n                    <option value=\"\">Punk</option>\n                    <option value=\"\">Metal</option>\n                    <option value=\"\">Hip Hop</option>\n                    <option value=\"\">etc</option>\n                </select>\n            </div>\n            <div class=\"columns medium-2\">\n                <select name=\"\" id=\"\">\n                    <option value=\"\">-Demographic-</option>\n                    <option value=\"\">18 - 34 Male</option>\n                    <option value=\"\">18 - 34 Female</option>\n                    <option value=\"\">35 - 54 Male</option>\n                    <option value=\"\">35 - 54 Female</option>\n                    <option value=\"\">etc</option>\n                </select>\n            </div>\n            <div class=\"columns medium-2 end\">\n                <select name=\"\" id=\"\">\n                    <option value=\"\">-Region-</option>\n                    <option value=\"\">Los Angeles, CA</option>\n                    <option value=\"\">etc</option>\n                </select>\n            </div>\n        </div>\n\n        <div class=\"row\"><div class=\"columns twelve\">\n        	<table class=\"hover\">\n        		\n        		<tr>\n        			<th>Name</th>\n        			<th width=\"150\">City</th>\n        			<th width=\"100\">Reach</th>\n        			<th width=\"100\">Genre</th>\n        			<th width=\"150\">Followers</th>\n        		</tr>\n\n{exp:user:users group_id=\"8\" dynamic=\"no\"}\n        		<tr>\n        			<td><a href=\"/profile/artist/{member_id}\">{screen_name}</a></td>\n        			<td>{artist_city}, {artist_state}</td>\n        			<td>{artist_reach}</td>\n        			<td>{artist_genre}</td>\n        			<td>[ follower counts ]</td>\n        		</tr>\n{/exp:user:users}\n\n        	</table>\n        </div></div>',1457283829),
	(15,1,'artist-profile','    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\"><div class=\"columns twelve\">\n        	<h1>Artist Profile</h1>\n        </div></div>\n\n		<!-- <div class=\"row\"><div class=\"columns twelve sales text-center\">\n			<h5>Approve this artist?</h5>\n			<input type=\"radio\" name=\"approve\" value=\"\" id=\"yes\" required><label for=\"yes\">Yes</label>\n			<input type=\"radio\" name=\"approve\" value=\"\" id=\"no\"><label for=\"no\">No</label>\n			<br>\n			<div class=\"button\">Submit</div>\n		</div></div> -->\n\n		<div class=\"row\">\n			<div class=\"columns small-12 medium-6\">\n				<img src=\"/profiles/darwenstheory/profile.jpg\" alt=\"\">\n				<p><strong>Members :</strong> Mike Johnson / vox, JJ Paterak / lead guitar, John Shaw / rythm guitar, Tyler Rollins / bass guitar, [ need drummer ]</p>\n			</div>\n			<div class=\"columns small-12 medium-6\">\n				<h2>Darwen\'s Theory</h2>\n				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in nisi tristique, sollicitudin justo id, dictum dolor. Cras a ipsum placerat, tincidunt nunc et, efficitur ex. Ut tellus diam, sodales quis porttitor et, rutrum non turpis. Fusce eu eros neque. Aliquam erat volutpat. Etiam sed porta nunc, sed suscipit risus. Nam ac blandit est, at egestas quam. Vivamus neque elit, sollicitudin nec porttitor posuere, imperdiet id nibh. Ut pharetra consequat pretium. In non maximus felis, nec molestie nisl. Vestibulum vel purus at sapien vulputate vestibulum.</p>\n				<p>Nunc aliquet diam ut enim blandit consectetur. Etiam turpis orci, blandit eu arcu at, lobortis ultrices purus. Pellentesque cursus tincidunt congue. Nam vitae finibus est. Donec auctor, turpis eget lobortis rutrum, felis libero molestie nisi, eu consectetur ante massa et turpis. In eu tempor arcu. Vestibulum velit mauris, hendrerit vitae nisl eget, malesuada ultricies nisl.</p>\n			</div>\n		</div>\n\n		<div class=\"row\">\n			<div class=\"columns small-12 medium-3\">\n				<h4>Artist Details</h4>\n				<ul>\n					<li>Genre : Metal</li>\n					<li>Reach : Local</li>\n					<li>Fans : Female / 18 - 34</li>\n				</ul>\n			</div>\n			<div class=\"columns small-12 medium-3\">\n				<h4>Social / Followers</h4>\n				<ul>\n					<li><a href=\"\"><i class=\"fi-home\"></i> http://darwenstheory.com</a></li>\n					<li><a href=\"https://www.facebook.com/darwenstheory\" target=\"_blank\"><i class=\"fi-social-facebook\"></i> Facebook</a> / 123456</li>\n					<li><a href=\"https://www.facebook.com/darwenstheory\" target=\"_blank\"><i class=\"fi-social-twitter\"></i> Twitter</a> / 123456</li>\n					<li><a href=\"https://www.facebook.com/darwenstheory\" target=\"_blank\"><i class=\"fi-social-instagram\"></i> Instagram</a> / 123456</li>\n					<li><a href=\"https://www.facebook.com/darwenstheory\" target=\"_blank\"><i class=\"fi-social-youtube\"></i> Youtube</a> / 123456</li>\n					<li><a href=\"https://www.facebook.com/darwenstheory\" target=\"_blank\"><i class=\"fi-sound\"></i> Soundcloud</a> / 123456</li>\n				</ul>\n			</div>\n			<div class=\"columns small-12 medium-3\">\n				<h4>Featured media</h4>\n				<ul>\n					<li><a href=\"https://www.youtube.com/watch?v=Dj_bme3RrEw\" target=\"_blank\">Live at Joint Bar 01.05.2014</a></li>\n					<li><a href=\"https://www.youtube.com/watch?v=TDEXyEYaHwE\" target=\"_blank\">Cleanse ( Official Lyric Video )</li>\n					<li><a href=\"https://www.youtube.com/watch?v=i4nfWNWFYuk\" target=\"_blank\">Rise with Demons ( Live at Ventura Theater 01.07.2011 )</a></li>\n				</ul>\n			</div>\n			<div class=\"columns small-12 medium-3\">\n				<h4>Influences</h4>\n				<ul>\n					<li>Pantera</li>\n					<li>Lamb of God</li>\n				</ul>\n			</div>\n		</div>\n\n		<hr>\n\n		<div class=\"row sales\">\n			<div class=\"columns small-12 medium-3 medium-push-9\">\n				<h3>Contact</h3>\n				<ul>\n					<li>Name : John Shaw</li>\n					<li>Email : <a href=\"mailto:name@email.com\">name@email.com</a></li>\n					<li>Phone : 555.867.5309</li>\n				</ul>\n			</div>\n\n			<div class=\"columns small-12 medium-9 medium-pull-3\">\n				<h3>Notes</h3>\n				<div class=\"input-group\">\n					<input class=\"input-group-field\" type=\"text\" placeholder=\"New note\">\n					<div class=\"input-group-button\">\n						<input type=\"submit\" class=\"button\" value=\"Submit\">\n					</div>\n				</div>\n				<table class=\"hover\">\n					<tr>\n						<th>Note</th>\n						<th width=\"150\">Date / Author</th>\n					</tr>\n					<tr>\n						<td>Donec volutpat volutpat scelerisque. Donec in pulvinar elit. </td>\n						<td>\n							01.27.2016 <br>\n							Rory Bebbington\n						</td>\n					</tr>\n					<tr>\n						<td>Donec volutpat volutpat scelerisque. Donec in pulvinar elit. Proin consectetur fermentum purus ut luctus. Aenean quis venenatis sapien. Nullam id nibh iaculis, viverra diam et.</td>\n						<td>\n							01.26.2016 <br>\n							Krish Sharma\n						</td>\n					</tr>\n					<tr>\n						<td>Donec volutpat volutpat scelerisque. Donec in pulvinar elit. Proin consectetur fermentum purus ut luctus. Aenean quis venenatis sapien. Nullam id nibh iaculis, viverra diam et, vestibulum odio. Suspendisse pretium aliquam urna, eu imperdiet justo dictum vitae. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec est nisl, tincidunt sed arcu varius, rutrum fermentum urna. Pellentesque rutrum congue diam, ac porta odio tristique vitae. Sed a turpis elementum, venenatis purus et, tempus nisl. Etiam eget fringilla libero.</td>\n						<td>\n							01.25.2016 <br>\n							Monica Christopher\n						</td>\n					</tr>\n				</table>\n			</div>\n		</div>\n\n		<div class=\"row\">\n			<div class=\"columns twelve\"><a href=\"browse-artists.php\" class=\"button tiny\">Back to List</a></div>\n		</div>\n   \n    </div></div>',1457886449),
	(16,1,'artist_profile','    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\"><div class=\"columns twelve\">\n        	<h1>Artist Profile</h1>\n        </div></div>\n\n		<!-- <div class=\"row\"><div class=\"columns twelve sales text-center\">\n			<h5>Approve this artist?</h5>\n			<input type=\"radio\" name=\"approve\" value=\"\" id=\"yes\" required><label for=\"yes\">Yes</label>\n			<input type=\"radio\" name=\"approve\" value=\"\" id=\"no\"><label for=\"no\">No</label>\n			<br>\n			<div class=\"button\">Submit</div>\n		</div></div> -->\n\n{exp:user:profile dynamic=\"yes\"}\n		<div class=\"row\">\n			<div class=\"columns small-12 medium-6\">\n		{exp:channel:entries channel=\"artists\" dynamic=\"no\" search:author_id=\"{segment_3}\" limit=\"1\"}\n                <img src=\"{artist_bio_photo}\" alt=\"\">\n        {/exp:channel:entries}\n				<p><strong>Members :</strong> {artist_members}</p>\n			</div>\n			<div class=\"columns small-12 medium-6\">\n				<h2>{screen_name}</h2>\n				{artist_bio}\n			</div>\n		</div>\n\n		<div class=\"row\">\n			<div class=\"columns small-12 medium-3\">\n				<h4>Artist Details</h4>\n				<ul>\n					<li>Genre : {artist_genre}</li>\n					<li>Reach : {artist_reach}</li>\n					<li>Fans : {artist_fans_gender} / {artist_fans_age}</li>\n				</ul>\n			</div>\n		{exp:channel:entries channel=\"artists\" dynamic=\"no\" require_entry=\"yes\" search:author_id=\"{member_id}\" limit=\"1\"}\n			<div class=\"columns small-12 medium-3\" style=\"background: rgba(255, 0, 255, .25);\">\n				<h4>Social / Followers</h4>\n				<ul>\n					{if url}<li><a href=\"{url}\"><i class=\"fi-home\"></i> {url}</a></li>{/if}\n                    {if artist_facebook}<li><a href=\"{artist_facebook}\" target=\"_blank\"><i class=\"fi-social-facebook\"></i> Facebook</a> / ???</li>{/if}\n                    {if artist_twitter}<li><a href=\"{artist_twitter}\" target=\"_blank\"><i class=\"fi-social-twitter\"></i> Twitter</a> / ???</li>{/if}\n                    {if artist_instagram}<li><a href=\"{artist_instagram}\" target=\"_blank\"><i class=\"fi-social-instagram\"></i> Instagram</a> / ???</li>{/if}\n                    {if artist_youtube}<li><a href=\"{artist_youtube}\" target=\"_blank\"><i class=\"fi-social-youtube\"></i> Youtube</a> / ???</li>{/if}\n                    {if artist_soundcloud}<li><a href=\"{artist_soundcloud}\" target=\"_blank\"><i class=\"fi-sound\"></i> Soundcloud</a> / ???</li>{/if}\n				</ul>\n			</div>\n			<div class=\"columns small-12 medium-3\">\n				<h4>Featured media</h4>\n				<ul>\n            {artist_other_media}\n                    <li><a href=\"{artist_other_media:link_url}\">{artist_other_media:link_title}</a></li>\n            {/artist_other_media}\n				</ul>\n			</div>\n		{/exp:channel:entries}\n\n			<div class=\"columns small-12 medium-3\">\n				<h4>Influences</h4>\n				{artist_influences}\n			</div>\n		</div>\n{/exp:user:profile}\n\n{if group_title==\"Sales\"}\n		<hr>\n\n		<div class=\"row sales\">\n{exp:user:profile dynamic=\"yes\"}\n			<div class=\"columns small-12 medium-3 medium-push-9\">\n				<h3>Contact</h3>\n				<ul>\n					<li>Name : {contact_name}{if contact_position}, {contact_position}{/if}</li>\n					<li>Email : <a href=\"mailto:{username}\">{username}</a></li>\n					<li>Phone : {contact_phone}</li>\n				</ul>\n			</div>\n{/exp:user:profile}\n\n			<div class=\"columns small-12 medium-9 medium-pull-3\">\n				<h3>Notes</h3>\n{exp:channel:form channel=\"notes\" return=\"/profile/{segment_2}/{segment_3}\"}\n				<div class=\"input-group\">\n					<input type=\"hidden\" name=\"title\" id=\"title\" value=\"Artist Note - {segment_3} - {current_time}\"/>\n					<input type=\"hidden\" name=\"note_member_id\" id=\"note_member_id\" value=\"{segment_3}\"/>\n					<input type=\"hidden\" name=\"status\" id=\"status\" value=\"open\">\n					<input class=\"input-group-field\" type=\"text\" placeholder=\"New note\" name=\"note_copy\" id=\"note_copy\"/>\n					<div class=\"input-group-button\">\n						<input type=\"submit\" class=\"button\" value=\"Submit\"/>\n					</div>\n				</div>\n{/exp:channel:form}\n				<table class=\"hover\">\n					<tr>\n						<th>Note</th>\n						<th width=\"150\">Date / Author</th>\n					</tr>\n{exp:channel:entries channel=\"notes\" dynamic=\"no\" require_entry=\"yes\" search:note_member_id=\"={segment_3}\"}\n					<tr>\n						<td>[ {note_member_id} ] {note_copy}</td>\n						<td>\n							{entry_date format=\"%m.%d.%Y\"} <br>\n							{author}\n						</td>\n					</tr>\n					{if no_results}\n						<tr><td colspan=\"2\">There are no notes.</td></tr>\n					{/if}\n{/exp:channel:entries}\n				</table>\n			</div>\n		</div>\n{/if}\n\n\n		<div class=\"row\">\n			<div class=\"columns twelve\"><a href=\"/browse/artists\" class=\"button tiny\">Back to List</a></div>\n		</div>\n   \n    </div></div>',1457886262),
	(17,1,'sponsor_dashboard','    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\">\n        	<div class=\"columns twelve\">\n{exp:user:profile}\n                <h1>Howdy {contact_name}.</h1>\n{/exp:user:profile}\n            </div>\n        </div>\n\n        <div class=\"row\">\n            <div class=\"columns small-12 medium-6\" style=\"background: rgba(255, 0, 255, .25);\">\n                <h5>Featured Artist</h5>\n                <img src=\"/profiles/darwenstheory/profile.jpg\" alt=\"\">\n                <h6>Darwen\'s Theory</h6>\n                <p>Nunc aliquet diam ut enim blandit consectetur. Etiam turpis orci, blandit eu arcu at, lobortis ultrices purus. Pellentesque cursus tincidunt congue. Nam vitae finibus est. Donec auctor, turpis eget lobortis rutrum, felis libero molestie nisi, eu consectetur ante massa et turpis. In eu tempor arcu. Vestibulum velit mauris, hendrerit vitae nisl eget, malesuada ultricies nisl.</p>\n            </div>\n            <div class=\"columns small-12 medium-6\">\n                <span class=\"float-right\"><a href=\"/browse/artists\">Browse all</a></span>\n                <h5>Newest Artists</h5>\n                <table class=\"hover\">\n                    <tr>\n                        <th>Name</th>\n                        <th width=\"100\">Added</th>\n                    </tr>\n{exp:user:users group_id=\"8\" limit=\"5\"}\n                    <tr>\n                        <td><a href=\"/profile/artist/{member_id}\">{screen_name}</a></td>\n                        <td>{join_date format=\"%m.%d.%y\"}</td>\n                    </tr>\n{/exp:user:users}\n                </table>\n            </div>\n        </div>\n        \n    </div></div>',1457285811),
	(18,1,'sponsor_edit','		<div id=\"main-wrap\"><div id=\"main\">\n\n			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\">\n\n{exp:user:edit return=\"edit/index\"}\n				\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Company Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"screen_name\" placeholder=\"\" value=\"{screen_name}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns end\">\n								<label>Industry Category\n									<select name=\"sponsor_industry_category\" id=\"\">\n										{select_sponsor_industry_category}\n											<option value=\"{value}\" {selected}>{value}</option>\n										{/select_sponsor_industry_category}\n									</select>\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Size\n									<select name=\"sponsor_company_size\" id=\"\">\n										{select_sponsor_company_size}\n											<option value=\"{value}\" {selected}>{value}</option>\n										{/select_sponsor_company_size}\n									</select>\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Website\n									<input type=\"url\" name=\"url\" placeholder=\"\" value=\"{url}\">\n								</label>\n							</div>\n							<div class=\"columns twelve\">\n								<label>Digital Actions Required\n									<textarea name=\"sponsor_digital_actions_required\" id=\"\" cols=\"30\" rows=\"4\">{sponsor_digital_actions_required}</textarea>\n								</label>\n							</div>\n							<div class=\"columns twelve\">\n								<label>Please list any advertising agencies we may need to coordinate with.\n									<textarea name=\"sponsor_other_agencies\" id=\"\" cols=\"30\" rows=\"2\">{sponsor_other_agencies}</textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Contact Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"contact_name\" placeholder=\"\" value=\"{contact_name}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Position\n									<input type=\"text\" name=\"contact_position\" placeholder=\"\" value=\"{contact_position}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Email\n									<!-- <input type=\"email\" placeholder=\"\"> -->\n									<input type=\"email\" name=\"username\" id=\"email\" value=\"{username}\"/>\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Phone\n									<input type=\"tel\" name=\"contact_phone\" placeholder=\"\" value=\"{contact_phone}\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<button type=\"submit\" class=\"button\">Update</button>\n				</div>\n\n{/exp:user:edit}\n			</div>\n\n    	</div></div>',1457285846),
	(24,1,'pending_profile','    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\"><div class=\"columns twelve\"><h1>Pending Profile</h1></div></div>\n\n        <!-- <div class=\"row\"><div class=\"columns twelve sales text-center\">\n			<h5>Approve this sponsor?</h5>\n			<input type=\"radio\" name=\"approve\" value=\"\" id=\"yes\" required><label for=\"yes\">Yes</label>\n			<input type=\"radio\" name=\"approve\" value=\"\" id=\"no\"><label for=\"no\">No</label>\n			<br>\n			<div class=\"button\">Submit</div>\n		</div></div> -->\n\n{exp:user:profile dynamic=\"yes\"}\n        <div class=\"row\">\n        	<div class=\"columns twelve\">\n        		<h2>{screen_name} </h2>\n                <h6>{if requested_group == \'8\'}Sponsor{if:else}Artist{/if}</h6>\n        	</div>\n        </div>\n\n        <div class=\"row\">\n        	<div class=\"columns small-12 medium-4\">\n        		<h3>Contact Information</h3>\n				<ul>\n					<li>{contact_name}</a></li>\n					<li><i class=\"fi-mail\"></i> <a href=\"mailto:{email}\">{email}</a></li>\n					<li><i class=\"fi-telephone\"></i> {contact_phone}</li>\n				</ul>\n        	</div>\n        	<div class=\"columns small-12 medium-8\">\n        		<h3>Marketing Details</h3>\n        		<ul>\n        			<li>Actions required : {user_needs}</li>\n        		</ul>\n        	</div>\n        </div>\n{/exp:user:profile}\n        \n    </div></div>',1457477726),
	(19,1,'artist_dashboard','<link href=\"{path=css/_ee_channel_form_css}\" type=\"text/css\" rel=\"stylesheet\" media=\"screen\">\n\n    <div id=\"main-wrap\"><div id=\"main\">\n\n        <div class=\"row\">\n        	<div class=\"columns twelve\">\n{exp:user:profile}\n                <h1>Howdy {contact_name}.</h1>\n                <h6>This is what your profile looks like to potential sponsors.</h6>\n{/exp:user:profile}\n            </div>\n        </div>\n\n{exp:user:profile dynamic=\"no\"}\n        <div class=\"row\">\n            <div class=\"columns small-12 medium-6\">\n        {exp:channel:entries channel=\"artists\" dynamic=\"no\" require_entry=\"yes\" search:author_id=\"{member_id}\" limit=\"1\"}\n                <img src=\"{artist_bio_photo}\" alt=\"\">\n        {/exp:channel:entries}\n                <p><strong>Members :</strong> {artist_members}</p>\n            </div>\n            <div class=\"columns small-12 medium-6\">\n                <h2>{screen_name}</h2>\n                {artist_bio}\n            </div>\n        </div>\n\n        <div class=\"row\">\n            <div class=\"columns small-12 medium-3\">\n                <h4>Artist Details</h4>\n                <ul>\n                    <li>Genre : {artist_genre}</li>\n                    <li>Reach : {artist_reach}</li>\n                    <li>Fans : {artist_fans_gender} / {artist_fans_age}</li>\n                </ul>\n            </div>\n        {exp:channel:entries channel=\"artists\" dynamic=\"no\" require_entry=\"yes\" search:author_id=\"{member_id}\" limit=\"1\"}\n            <div class=\"columns small-12 medium-3\" style=\"background: rgba(255, 0, 255, .25);\">\n                <h4>Social / Followers</h4>\n                <ul>\n                    {if url}<li><a href=\"{url}\"><i class=\"fi-home\"></i> {url}</a></li>{/if}\n                    {if artist_facebook}<li><a href=\"{artist_facebook}\" target=\"_blank\"><i class=\"fi-social-facebook\"></i> Facebook</a> / ???</li>{/if}\n                    {if artist_twitter}<li><a href=\"{artist_twitter}\" target=\"_blank\"><i class=\"fi-social-twitter\"></i> Twitter</a> / ???</li>{/if}\n                    {if artist_instagram}<li><a href=\"{artist_instagram}\" target=\"_blank\"><i class=\"fi-social-instagram\"></i> Instagram</a> / ???</li>{/if}\n                    {if artist_youtube}<li><a href=\"{artist_youtube}\" target=\"_blank\"><i class=\"fi-social-youtube\"></i> Youtube</a> / ???</li>{/if}\n                    {if artist_soundcloud}<li><a href=\"{artist_soundcloud}\" target=\"_blank\"><i class=\"fi-sound\"></i> Soundcloud</a> / ???</li>{/if}\n                </ul>\n            </div>\n            <div class=\"columns small-12 medium-3\">\n                <h4>Featured media</h4>\n                <ul>\n        {exp:channel:entries channel=\"artists\" dynamic=\"no\" require_entry=\"yes\" search:author_id=\"{member_id}\" limit=\"1\"}\n            {artist_other_media}\n                    <li><a href=\"{artist_other_media:link_url}\">{artist_other_media:link_title}</a></li>\n            {/artist_other_media}\n        {/exp:channel:entries}\n                </ul>\n            </div>\n            <div class=\"columns small-12 medium-3\">\n                <h4>Influences</h4>\n                {artist_influences}\n            </div>\n        </div>\n{/exp:user:profile}\n        \n    </div></div>',1457884762),
	(20,1,'artist_edit','		<div id=\"main-wrap\"><div id=\"main\">\n\n			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\">\n				<h1>Edit Profile</h1>\n\n{exp:user:edit return=\"edit/index\"}\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Contact Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"artist_contact_name\" placeholder=\"\" value=\"{artist_contact_name}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Position\n									<input type=\"text\" name=\"artist_contact_position\" placeholder=\"\" value=\"{artist_contact_position}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Email\n									<input type=\"email\" name=\"username\" id=\"email\" placeholder=\"\" value=\"{username}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Phone\n									<input type=\"tel\" name=\"artist_contact_phone\" placeholder=\"\" value=\"{artist_contact_phone}\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Artist Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"artist_stage_name\" placeholder=\"\" value=\"{artist_stage_name}\">\n								</label>\n								<label>Genre\n									<select name=\"artist_genre\" id=\"\">\n										{select_artist_genre}\n											<option value=\"{value}\" {selected}>{value}</option>\n										{/select_artist_genre}\n									</select>\n								</label>\n								\n								<div class=\"row\">\n									<div class=\" columns small-8\">\n										<label>City\n											<input type=\"text\" name=\"artist_city\" placeholder=\"\" value=\"{artist_city}\">\n										</label>\n									</div>\n									<div class=\"columns small-4\">\n										<label>State\n											<select name=\"artist_state\" id=\"\">\n												{select_artist_state}\n													<option value=\"{value}\" {selected}>{value}</option>\n												{/select_artist_state}\n											</select>\n										</label>\n									</div>\n								</div>\n\n								<label>Reach\n									<select name=\"artist_reach\" id=\"\">\n										{select_artist_reach}\n											<option value=\"{value}\" {selected}>{value}</option>\n										{/select_artist_reach}\n									</select>\n								</label>\n							</div>\n							<div class=\"medium-6 columns end\">\n								<label>Members\n									<textarea name=\"artist_members\" id=\"\" cols=\"30\" rows=\"6\" placeholder=\"Leave blank if solo artist.\">{artist_members}</textarea>\n								</label>\n								<label>Current Label or Affiliation\n									<input type=\"text\" placeholder=\"\" name=\"artist_label\" value=\"{artist_label}\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Artist Bio</legend>\n							<div class=\"twelve columns\">\n								<label>Photo [ get back to this ]\n									<input type=\"file\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>Bio\n									<textarea name=\"artist_bio\" id=\"artist_bio\" cols=\"30\" rows=\"7\">{artist_bio}</textarea>\n								</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>What artists are you inspired by? \n									<textarea name=\"artist_influences\" id=\"artist_influences\" cols=\"30\" rows=\"7\">{artist_influences}</textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Current Sponsorship Activity</legend>\n							<div class=\"twelve columns\">\n								<label>Please, tell us what kinds of sponsorship you are currently accepting.\n									<textarea name=\"artist_current_sponsorship\" id=\"artist_current_sponsorship\" cols=\"30\" rows=\"7\">{artist_current_sponsorship}</textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Artist Media</legend>\n							<div class=\"twelve columns\">\n								<label>Website\n									<input type=\"text\" name=\"artist_website\" id=\"artist_website\" placeholder=\"\" value=\"{artist_website}\">\n								</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>Links to other Media\n									<textarea name=\"artist_other_media\" id=\"artist_other_media\" cols=\"30\" rows=\"7\" placeholder=\"Show us what you got!\">{artist_other_media}</textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Social Media [ get back to this ]</legend>\n							<div class=\"twelve columns\">\n								<a href=\"\" class=\"button\"><i class=\"fi-social-facebook\"></i> Connect Facebook</a>\n								<a href=\"\" class=\"button\"><i class=\"fi-social-twitter\"></i> Connect Twitter</a>\n								<a href=\"\" class=\"button\"><i class=\"fi-social-instagram\"></i> Connect Instagram</a>\n								<a href=\"\" class=\"button\"><i class=\"fi-sound\"></i> Connect Soundcloud</a>\n								<a href=\"\" class=\"button\"><i class=\"fi-social-youtube\"></i> Connect Youtube</a>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Tell us about your fans.</legend>\n							<fieldset class=\"small-12 medium-6 columns\">\n								<legend>Gender</legend>\n								<select name=\"artist_fans_gender\">\n									{select_artist_fans_gender}\n										<option value=\"{value}\" {selected}>{value}</option>\n									{/select_artist_fans_gender}\n								</select>\n							</fieldset>\n							<fieldset class=\"small-12 medium-6 columns\">\n								<legend>Aged</legend>\n								<select name=\"artist_fans_age\">\n									{select_artist_fans_age}\n										<option value=\"{value}\" {selected}>{value}</option>\n									{/select_artist_fans_age}\n								</select>\n							</fieldset>\n					</fieldset>\n				</div>\n				\n\n				<div class=\"row\">\n					<button type=\"submit\" class=\"button\">Register</button>\n				</div>\n\n{/exp:user:edit}\n			</div>\n\n    	</div></div>',1456702485),
	(21,1,'artist_edit_contact','		<div id=\"main-wrap\"><div id=\"main\">\n\n			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\">\n				<h1>Edit Contact Information</h1>\n\n{exp:user:edit return=\"home/index\"}\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Contact Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"contact_name\" placeholder=\"\" value=\"{contact_name}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Position\n									<input type=\"text\" name=\"contact_position\" placeholder=\"\" value=\"{contact_position}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Email\n									<input type=\"email\" name=\"username\" id=\"email\" placeholder=\"\" value=\"{username}\">\n								</label>\n							</div>\n							<div class=\"medium-6 columns\">\n								<label>Phone\n									<input type=\"tel\" name=\"contact_phone\" placeholder=\"\" value=\"{contact_phone}\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<button type=\"submit\" class=\"button\">Update</button>\n				</div>\n\n{/exp:user:edit}\n			</div>\n\n    	</div></div>',1457284233),
	(22,1,'artist_edit_bio','		<div id=\"main-wrap\"><div id=\"main\">\n\n			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\">\n				<h1>Edit Bio</h1>\n\n{exp:user:edit return=\"home/index\"}\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Artist Information</legend>\n							<div class=\"medium-6 columns\">\n								<label>Name\n									<input type=\"text\" name=\"screen_name\" placeholder=\"\" value=\"{screen_name}\">\n								</label>\n								<label>Genre\n									<select name=\"artist_genre\" id=\"\">\n										{select_artist_genre}\n											<option value=\"{value}\" {selected}>{value}</option>\n										{/select_artist_genre}\n									</select>\n								</label>\n								\n								<div class=\"row\">\n									<div class=\" columns small-8\">\n										<label>City\n											<input type=\"text\" name=\"artist_city\" placeholder=\"\" value=\"{artist_city}\">\n										</label>\n									</div>\n									<div class=\"columns small-4\">\n										<label>State\n											<select name=\"artist_state\" id=\"\">\n												{select_artist_state}\n													<option value=\"{value}\" {selected}>{value}</option>\n												{/select_artist_state}\n											</select>\n										</label>\n									</div>\n								</div>\n\n								<label>Reach\n									<select name=\"artist_reach\" id=\"\">\n										{select_artist_reach}\n											<option value=\"{value}\" {selected}>{value}</option>\n										{/select_artist_reach}\n									</select>\n								</label>\n							</div>\n							<div class=\"medium-6 columns end\">\n								<label>Members\n									<textarea name=\"artist_members\" id=\"\" cols=\"30\" rows=\"6\" placeholder=\"Leave blank if solo artist.\">{artist_members}</textarea>\n								</label>\n								<label>Current Label or Affiliation\n									<input type=\"text\" placeholder=\"\" name=\"artist_label\" value=\"{artist_label}\">\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Artist Bio</legend>\n							<div class=\"twelve columns\">\n								<label>Bio\n									<textarea name=\"artist_bio\" id=\"artist_bio\" cols=\"30\" rows=\"7\">{artist_bio}</textarea>\n								</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>What artists are you inspired by? \n									<textarea name=\"artist_influences\" id=\"artist_influences\" cols=\"30\" rows=\"7\">{artist_influences}</textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Tell us about your fans.</legend>\n							<fieldset class=\"small-12 medium-6 columns\">\n								<legend>Gender</legend>\n								<select name=\"artist_fans_gender\">\n									{select_artist_fans_gender}\n										<option value=\"{value}\" {selected}>{value}</option>\n									{/select_artist_fans_gender}\n								</select>\n							</fieldset>\n							<fieldset class=\"small-12 medium-6 columns\">\n								<legend>Aged</legend>\n								<select name=\"artist_fans_age\">\n									{select_artist_fans_age}\n										<option value=\"{value}\" {selected}>{value}</option>\n									{/select_artist_fans_age}\n								</select>\n							</fieldset>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Current Sponsorship Activity</legend>\n							<div class=\"twelve columns\">\n								<label>Please, tell us what kinds of sponsorship you are currently accepting.\n									<textarea name=\"artist_current_sponsorship\" id=\"artist_current_sponsorship\" cols=\"30\" rows=\"7\">{artist_current_sponsorship}</textarea>\n								</label>\n							</div>\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<button type=\"submit\" class=\"button\">Update</button>\n				</div>\n\n{/exp:user:edit}\n			</div>\n\n    	</div></div>',1457285929),
	(23,1,'artist_edit_media','		<div id=\"main-wrap\"><div id=\"main\">\n\n			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\">\n				<h1>Edit Media</h1>\n\n{exp:channel:entries channel=\"artists\" dynamic=\"no\" require_entry=\"yes\" search:author_id=\"{member_id}\" limit=\"1\"}\n    \n	{exp:channel:form channel=\"artists\" return=\"home/index\" dynamic=\"no\" url_title=\"{url_title}\" class=\"userform\"}\n					<div class=\"row\">\n						<div class=\"row\">\n						<fieldset class=\"fieldset\">\n							<legend>Artist Media</legend>\n								<input type=\"hidden\" name=\"status\" id=\"status\" value=\"open\">\n\n								<div class=\"small-12 columns\">\n									{field:artist_other_media}\n								</div>\n						</fieldset>\n					</div>\n\n					<div class=\"row\">\n						<button type=\"submit\" class=\"button\">Submit</button>\n					</div>\n					\n	{/exp:channel:form}\n\n{/exp:channel:entries}\n\n			</div>\n\n    	</div></div>',1457885118),
	(26,1,'artist_edit_photo','		<div id=\"main-wrap\"><div id=\"main\">\n\n			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\">\n				<h1>Edit Photo</h1>\n\n{exp:channel:entries channel=\"artists\" dynamic=\"no\" require_entry=\"yes\" search:author_id=\"{member_id}\" limit=\"1\"}\n    \n	{exp:channel:form channel=\"artists\" return=\"home/index\" dynamic=\"no\" url_title=\"{url_title}\" class=\"userform\"}\n					<div class=\"row\">\n						<fieldset class=\"fieldset\">\n							<legend>Bio Photo</legend>\n								<input type=\"hidden\" name=\"status\" id=\"status\" value=\"open\">\n\n								<div class=\"small-12 medium-4 columns\">\n									<h4>Current bio photo</h4>\n									<img src=\"{artist_bio_photo}\" alt=\"\">\n								</div>\n								<div class=\"small-12 medium-8 columns\">\n									<label>Replace photo\n										<input type=\"file\" placeholder=\"\" name=\"artist_bio_photo\" id=\"artist_bio_photo\">\n										<input type=\"hidden\" name=\"artist_bio_photo_directory\" value=\"6\" /> <br><br>\n									</label>\n								</div>\n						</fieldset>\n					</div>\n\n					<div class=\"row hidden\">\n						{field:artist_other_media}\n					</div>\n\n					<div class=\"row\">\n						<button type=\"submit\" class=\"button\">Submit</button>\n					</div>\n					\n	{/exp:channel:form}\n\n{/exp:channel:entries}\n\n			</div>\n\n    	</div></div>',1457886030),
	(25,1,'artist_edit_social','		<div id=\"main-wrap\"><div id=\"main\">\n\n			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\">\n				<h1>Edit Social</h1>\n\n{exp:channel:entries channel=\"artists\" dynamic=\"no\" require_entry=\"yes\" search:author_id=\"{member_id}\" limit=\"1\"}\n    \n	{exp:channel:form channel=\"artists\" return=\"home/index\" dynamic=\"no\" url_title=\"{url_title}\" class=\"userform\"}\n					<div class=\"row\">\n						<fieldset class=\"fieldset\">\n							<legend>Profiles</legend>\n								<input type=\"hidden\" name=\"status\" id=\"status\" value=\"open\">\n\n								<div class=\"columns twelve\">\n									<label for=\"\">Facebook\n										<input type=\"text\" name=\"artist_facebook\" id=\"artist_facebook\" value=\"{artist_facebook}\">\n									</label>\n									<label for=\"\">Twitter\n										<input type=\"text\" name=\"artist_twitter\" id=\"artist_twitter\" value=\"{artist_twitter}\">\n									</label>\n									<label for=\"\">Instagram\n										<input type=\"text\" name=\"artist_instagram\" id=\"artist_instagram\" value=\"{artist_instagram}\">\n									</label>\n									<label for=\"\">Youtube\n										<input type=\"text\" name=\"artist_youtube\" id=\"artist_youtube\" value=\"{artist_youtube}\">\n									</label>\n									<label for=\"\">Soundcloud\n										<input type=\"text\" name=\"artist_soundcloud\" id=\"artist_soundcloud\" value=\"{artist_soundcloud}\">\n									</label>\n								</div>\n						</fieldset>\n					</div>\n\n					<div class=\"row\">\n						<button type=\"submit\" class=\"button\">Submit</button>\n					</div>\n					\n	{/exp:channel:form}\n\n{/exp:channel:entries}\n\n			</div>\n\n    	</div></div>',1457884819);

/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_specialty_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_specialty_templates`;

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`)
VALUES
	(1,1,'y','offline_template','','system',NULL,'<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>',NULL,1456289420,0),
	(2,1,'y','message_template','','system',NULL,'<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>',NULL,1456289420,0),
	(3,1,'y','admin_notify_reg','Notification of new member registration','email','members','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}',NULL,1456289420,0),
	(4,1,'y','admin_notify_entry','A new channel entry has been posted','email','content','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n',NULL,1456289420,0),
	(5,1,'y','admin_notify_comment','You have just received a comment','email','comments','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}',NULL,1456289420,0),
	(6,1,'y','mbr_activation_instructions','Enclosed is your activation code','email','members','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}',NULL,1456289420,0),
	(7,1,'y','forgot_password_instructions','Login information','email','members','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}',NULL,1456289420,0),
	(8,1,'y','validated_member_notify','Your membership account has been activated','email','members','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}',NULL,1456289420,0),
	(9,1,'y','decline_member_validation','Your membership account has been declined','email','members','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}',NULL,1456289420,0),
	(10,1,'y','comment_notification','Someone just responded to your comment','email','comments','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}',NULL,1456289420,0),
	(11,1,'y','comments_opened_notification','New comments have been added','email','comments','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}',NULL,1456289420,0),
	(12,1,'y','private_message_notification','Someone has sent you a Private Message','email','private_messages','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}',NULL,1456289420,0),
	(13,1,'y','pm_inbox_full','Your private message mailbox is full','email','private_messages','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}',NULL,1456289420,0);

/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_stats`;

CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`)
VALUES
	(1,1,8,8,'krish',14,0,0,0,1456810080,0,0,1457889158,9,1456612703,1456289420);

/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_status_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_status_groups`;

CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`)
VALUES
	(1,1,'Default');

/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_status_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_status_no_access`;

CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_statuses`;

CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`)
VALUES
	(1,1,1,'open',1,'009933'),
	(2,1,1,'closed',2,'990000');

/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_groups`;

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`)
VALUES
	(1,1,'root',1,'y'),
	(2,1,'register',2,'n'),
	(8,1,'profile',5,'n'),
	(7,1,'browse',4,'n'),
	(6,1,'home',3,'n'),
	(9,1,'invite',6,'n'),
	(10,1,'edit',7,'n'),
	(11,1,'user_inc',9,'n'),
	(12,1,'user_main',8,'n'),
	(13,1,'user_notifications',10,'n'),
	(14,1,'functional',11,'n');

/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_member_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_member_groups`;

CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_template_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_no_access`;

CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_template_no_access` WRITE;
/*!40000 ALTER TABLE `exp_template_no_access` DISABLE KEYS */;

INSERT INTO `exp_template_no_access` (`template_id`, `member_group`)
VALUES
	(8,2),
	(8,3),
	(8,4),
	(8,5),
	(10,2),
	(10,3),
	(10,4),
	(10,5),
	(10,8),
	(11,2),
	(11,3),
	(11,4),
	(11,5),
	(11,8),
	(12,2),
	(12,3),
	(12,4),
	(12,5),
	(12,7),
	(12,8),
	(13,2),
	(13,3),
	(13,4),
	(13,5);

/*!40000 ALTER TABLE `exp_template_no_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_routes`;

CREATE TABLE `exp_template_routes` (
  `route_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `route` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`route_id`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_templates`;

CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext COLLATE utf8_unicode_ci,
  `template_notes` text COLLATE utf8_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`)
VALUES
	(1,1,1,'index','webpage','{global_open}\n\n<link rel=\"stylesheet\" href=\"/_css/home.css\" />\n\n    <div id=\"main-wrap\" class=\"home\"><div id=\"main\">\n        \n        <div class=\"row\">\n        	<div class=\"columns twelve text-center\">\n        		<h1>Welcome to Bygmusic.</h1>\n        		<h3>We\'re here to help.</h3>\n                <h5>Watch this video to see how.</h5>\n\n				<iframe width=\"420\" height=\"315\" src=\"https://www.youtube.com/embed/__zoCMZVN9w?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>\n\n                <h6>Sounds good, right?</h6>\n				\n				<br><div class=\"button hollow\" id=\"login\">Login</div> <a href=\"{path=\'/register\'}\" class=\"button\" id=\"register\">Register</a>\n            </div>\n        </div>\n\n        <div class=\"row hide\" id=\"welcome-login\">\n            <div class=\"columns twelve\">\n\n{exp:member:login_form return=\"home/index\"}\n                    <div class=\"row\">\n                        <div class=\"small-12 medium-5 columns\">\n                            <input type=\"text\" placeholder=\"Email Address\" name=\"username\" id=\"username\">\n                        </div>\n                        <div class=\"small-12 medium-5 columns\">\n                            <input type=\"password\" placeholder=\"Password\" name=\"password\" id=\"password\">\n                        </div>\n                        <div class=\"small-12 medium-2 columns\">\n                            <input type=\"submit\" name=\"submit\" value=\"Submit\" class=\"button\">\n                        </div>\n                    </div>\n{/exp:member:login_form}\n\n            </div>\n        </div>\n        \n    </div></div>\n\n<script>\n    \n    $(\'.button#login\').click(function() {\n        $(this).toggleClass(\'hollow\');\n        $(\'.button#register\').toggleClass(\'hollow\');\n        $(\'#welcome-login\').toggleClass(\'hide\');\n    });\n\n</script>\n\n{global_close}',NULL,1456810632,0,'n',0,'','n','n','o',0,'n'),
	(22,1,11,'profile_column','webpage','				{exp:user:profile\n					member_id=\"{embed:member_id}\"\n					limit=\"1\"\n				}\n					<img src=\"{if avatar_filename}{avatar_url}{avatar_filename}{if:else}{exp:user:theme_folder_url}code_pack/images/no-profile-pic.jpg{/if}\" class=\"img-rounded img-responsive\" style=\"width:100%;height:auto;margin-bottom:20px;\" alt=\"{screen_name}\'s avatar\" />\n					<div class=\"list-group\">\n						<a href=\"{path=\'user_main\'}/{member_id}/\" class=\"list-group-item{if \"{embed:profile_active}\" == \"yes\"} active{/if}\">{if logged_in_member_id == \"{embed:member_id}\"}My{if:else}Users\'{/if} Profile</a>\n						<a href=\"{path=\'user_main/user_entries\'}/{member_id}/\" class=\"list-group-item{if segment_2 == \"user_entries\"} active{/if}\">{if logged_in_member_id == \"{embed:member_id}\"}My{if:else}Users\'{/if} Entries</a>\n						<a href=\"{path=\'user_main/user_comments\'}/{member_id}/\" class=\"list-group-item{if segment_2 == \"user_comments\"} active{/if}\">{if logged_in_member_id == \"{embed:member_id}\"}My{if:else}Users\'{/if} Comments</a>\n					{if logged_in_member_id != \"{embed:member_id}\"} {!-- Only show if viewing someone elses profile --}\n						<a href=\"{path=\'member/messages/pm\'}/{member_id}/\" class=\"list-group-item\">Send a Message</a>\n					{/if}\n					</div>\n				{if logged_in_member_id == \"{embed:member_id}\"} {!-- Only show if viewing own profile --}\n					<p><a href=\"{path=\'user_main/update_profile\'}/\" class=\"btn btn-sm btn-default\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>&nbsp; Update My Profile</a></p>\n				{/if}\n				{/exp:user:profile}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(23,1,12,'delete_account','webpage','{embed=\"user_inc/index\" page_title=\"Delete Account\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Delete Account</h1>\n				<p class=\"lead\">This page allows the currently logged in user to delete their own account, as long as their member group has permissions to delete their own account, and they are not a Super Admin.</p>\n			</div>\n\n			<div class=\"row\">\n{if logged_in} {!-- START - Make sure the user is logged in for updating account --}\n				<div class=\"col-xs-12\">\n					{if segment_3 == \"removed\"}\n						<div class=\"alert alert-success\" role=\"alert\">\n							<p class=\"lead\">Your account has been successfully deleted!</p>\n						</div>\n					{/if}\n					{exp:user:delete_form\n						return=\"user_main/delete_account/removed\"\n						error_page=\"user_inc/error_template\"\n					}\n						<h4>You must confirm your password to complete this action</h4>\n						<p class=\"text-danger\">\n							<strong>WARNING: THIS ACTION CANNOT BE UNDONE!</strong><br />\n							Are you sure you wish to delete your account? All entries, posts, comments, and other content associated with your account will also be deleted.\n						</p> \n						<p>\n							<label for=\"password\">Current Password</label>\n							<input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Enter your current password here\" class=\"form-control\" />\n						</p>\n						<p>\n							<button type=\"submit\" class=\"btn btn-lg btn-danger\">Remove Account</button>\n						</p>\n					{/exp:user:delete_form}\n				</div>\n{/if} {!-- END - Make sure the user is logged in for updating account --}\n{if logged_out} {!-- START - If logged out, show the Login form --}\n				<div class=\"col-xs-12\">\n					{embed=\"user_inc/login\"}\n				</div>\n{/if} {!-- END - If logged out, show the Login form --}\n			</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Delete Account\" page allows the currently logged in user to delete their own account, as long as their member group has permissions to delete their own account, and they are not a Super Admin.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/delete_form\">User:Delete_Form</a> to delete member accounts.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(24,1,12,'forgot_password','webpage','{embed=\"user_inc/index\" page_title=\"Forgot Username or Password\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Forgot Username or Password</h1>\n				<p class=\"lead\">This page allows users to have their username mailed to them or their password reset, in the event they forget it.</p>\n			</div>\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n				{if segment_3 == \"success_username\"}\n					<div class=\"alert alert-success\" role=\"alert\">\n						<p><strong>Success!</strong> Your username has been sent to the email address provided.</p>\n					</div>\n				{/if}\n				{if segment_3 == \"success_password\"}\n					<div class=\"alert alert-success\" role=\"alert\">\n						<p><strong>Success!</strong> Your password reset link has been sent to the email address provided.</p>\n					</div>\n				{/if}\n					<h2>Forgot Username?</h2>\n					<p style=\"margin-bottom:20px;\">If you\'ve forgotten your username, just enter your email address you registered with and you will receive an email informing you of your username.</p>\n					{exp:user:forgot_username\n						return=\"user_main/forgot_password/success_username\"\n						override_return=\"user_main/forgot_password/success_username\"\n						error_page=\"user_inc/error_template\"\n						form:class=\"form-horizontal\"\n					}\n						<div class=\"form-group\">\n							<label for=\"email\" class=\"col-sm-3 col-md-2 control-label\">Email Address</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"email\" name=\"email\" id=\"email\" placeholder=\"Enter your email address here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<div class=\"col-sm-offset-3 col-sm-offset-2 col-sm-7 col-lg-6\">\n								<button type=\"submit\" class=\"btn btn-lg btn-success\">Submit</button>\n							</div>\n						</div>\n					{/exp:user:forgot_username}\n				</div>\n			</div>\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					<h2>Forgot Password?</h2>\n					<p style=\"margin-bottom:20px;\">If you\'ve forgotten your password, just enter your email address you registered with and you will receive an email with instructions for resetting your password.</p>\n					{exp:user:forgot_password\n						secure_reset_link=\"no\"\n						password_reset_template=\"user_main/reset_password/%id%\"\n						password_reset_email_template=\"user_notifications/reset_password\"\n						password_reset_email_subject=\"Password Reset Request\"\n						return=\"user_main/forgot_password/success_password\"\n						error_page=\"user_inc/error_template\"\n						form:class=\"form-horizontal\"\n					}\n						<div class=\"form-group\">\n							<label for=\"email\" class=\"col-sm-3 col-md-2 control-label\">Email Address</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"email\" name=\"email\" id=\"email\" placeholder=\"Enter your email address here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<div class=\"col-sm-offset-3 col-sm-offset-2 col-sm-7 col-lg-6\">\n								<button type=\"submit\" class=\"btn btn-lg btn-success\">Reset</button>\n							</div>\n						</div>\n					{/exp:user:forgot_password}\n				</div>\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Forgot Username / Password\" page allows users to have their username mailed to them or their password reset, in the event they forget it.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/forgot_username\">User:Forgot_Username</a> to allow users have their username mailed to them.</li>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/forgot_password\">User:Forgot_Password</a> to allow users reset their account password.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(20,1,11,'index','webpage','<!DOCTYPE html>\n<html lang=\"en\">\n	<head>\n		<meta charset=\"utf-8\">\n		<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n		<meta name=\"description\" content=\"Demo Templates for User\">\n		<meta name=\"author\" content=\"Solspace\">\n		<title>User | {if embed:page_title}{embed:page_title}{if:else}Home{/if}</title>\n		<link href=\"{exp:user:theme_folder_url}code_pack/css/bootstrap.min.css\" rel=\"stylesheet\">\n		<link href=\"{exp:user:theme_folder_url}code_pack/css/bootstrap-theme.min.css\" rel=\"stylesheet\">\n		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\n		<!--[if lt IE 9]>\n			<script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\n			<script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n		<![endif]-->\n		<style>\n			/* Helpful for testing and debugging. Comment this line out to make more data visible in template. */\n			.solspace-debug { display: none; }\n			body { margin-top: 30px; }\n			.ss-pageinfo {margin-top: 30px; }\n			.ss-pageinfo h2 { margin-top: 5px; }\n		</style>',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(21,1,11,'login','webpage','					<h2>Please login</h2>\n					<p style=\"margin-bottom:20px;\">To view these pages, please sign in with your username and password below:</p>\n					<div class=\"col-sm-7 col-md-8\">\n					{exp:member:login_form\n						return=\"user_main\"\n						form_class=\"form-horizontal\"\n					}\n						<div class=\"form-group\">\n							<label for=\"username\" class=\"col-sm-3 col-md-2 control-label\">Username</label>\n							<div class=\"col-sm-9 col-md-10\">\n								<input type=\"text\" name=\"username\" id=\"username\" placeholder=\"Enter your username here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<label for=\"password\" class=\"col-sm-3 col-md-2 control-label\">Password</label>\n							<div class=\"col-sm-9 col-md-10\">\n								<input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Enter your password here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<div class=\"col-sm-offset-3 col-sm-offset-2 col-sm-9 col-md-10\">\n								<div class=\"checkbox\">\n									<label>\n										<input type=\"checkbox\" name=\"auto_login\" id=\"auto_login\" value=\"1\" />\n										Auto-login on future visits?\n									</label>\n								</div>\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<div class=\"col-sm-offset-3 col-sm-offset-2 col-sm-9 col-md-10\">\n								<button type=\"submit\" class=\"btn btn-lg btn-success\">Login</button>\n							</div>\n						</div>\n					{/exp:member:login_form}\n					</div>\n					<div class=\"col-sm-5 col-md-4\">\n						<a class=\"btn btn-info\" href=\"{path=\'user_main/register\'}/\" role=\"button\" style=\"margin-right:15px;margin-bottom:15px;\">Don\'t have an Account? Sign up here!</a>\n						<div class=\"clearfix\"></div>\n						<a class=\"btn btn-warning\" href=\"{path=\'user_main/forgot_password\'}/\" role=\"button\">Forgot Your Username or Password?</a>\n					</div>',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(3,1,2,'index','webpage','{global_open}\n\n    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\" id=\"begin-register\"><div class=\"columns twelve\">\n        	<h1>Registration</h1>\n        	<p>This is an even better explanation of why you want to joing BYG Music. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer dolor tellus, suscipit vitae auctor iaculis, hendrerit at justo. Proin vitae pellentesque dui. Integer sed urna viverra, luctus mauris non, facilisis ante. Aliquam sit amet nulla eu ligula varius viverra. Fusce semper tortor vitae nunc efficitur aliquam. Sed ultricies placerat interdum. Donec est orci, efficitur in hendrerit ac, pulvinar sit amet lorem.</p>\n        </div></div>\n\n<!-- *------------ registration success messaging ------------* -->\n        {if segment_2 == \"success\"}\n\n        	<div class=\"row\"><div class=\"columns twelve\">\n        		<h3>Awesome.</h3>\n        		<h4>Welcome to BYG Music.</h4>\n        		<p><a href=\"/home\">Click here to goto your dashboard.</a></p>\n        	</div></div>\n\n<!-- *------------ else show registration form ------------* -->\n        {if:else}\n\n			{exp:user:register admin_register=\"yes\" required=\"\" return=\"register/thankyou\" {if segment_2 == \'key\'} require_key=\"yes\" return=\"register/index/success\"{/if}}\n			<div class=\"row\"><div class=\"columns twelve\">\n				<h4>Sign up here.</h4>\n				<fieldset>\n					<legend>Account Type</legend>\n					{if segment_2==\"key\"}\n						<input type=\"hidden\" value=\"{selected_group_id}\" name=\"group_id\">\n					{if:else}\n					<div class=\"row\">\n						<input type=\"hidden\" value=\"4\" name=\"group_id\">\n						<div class=\"small-6 medium-2 columns\">\n							<input type=\"radio\" name=\"requested_group\" value=\"7\"> <label for=\"\">Artist</label>\n						</div>\n						<div class=\"small-6 medium-2 columns end\">\n							<input type=\"radio\" name=\"requested_group\" value=\"8\"> <label for=\"\">Sponsor</label>\n						</div>\n					</div>\n					{/if}\n					<div class=\"row\">\n						<div class=\"small-12 medium-6 columns end\">\n							<label>Group or Company Name<input type=\"text\" name=\"screen_name\" placeholder=\"\"></label>\n						</div>\n					</div>\n					\n				</fieldset>\n\n				<fieldset>\n					<legend>Contact Details</legend>\n					<div class=\"row\">\n						<div class=\"small-12 medium-6 columns\">\n							<label>Name<input type=\"text\" name=\"contact_name\" placeholder=\"\"></label>\n						</div>\n						<div class=\"small-12 medium-6 columns\">\n							<label>Position<input type=\"text\" name=\"contact_position\" placeholder=\"\"></label>\n						</div>\n						<div class=\"small-12 medium-6 columns\">\n							<label>Email<input type=\"email\" name=\"username\" id=\"email\" placeholder=\"\" value=\"\"></label>\n						</div>\n						<div class=\"small-12 medium-6 columns\">\n							<label>Phone<input type=\"tel\" name=\"artist_contact_phone\" placeholder=\"\"></label>\n						</div>\n						<div class=\"twelve columns\">\n							<label>What can we help you with?</label><textarea name=\"user_needs\" id=\"user_needs\" cols=\"30\" rows=\"4\"></textarea>\n						</div>\n						{if segment_2==\"key\"}\n						<div class=\"small-12 medium-6 columns end\">\n							<label for=\"\">Invitation Key<input type=\"text\" name=\"key\" id=\"key\" value=\"{key}\"></label>\n						</div>\n						{/if}\n					</div>\n				</fieldset>\n\n				<fieldset>\n					<legend>Create a Password</legend>\n					<div class=\"row\">\n						<div class=\"small-12 medium-6 columns\">\n							<label>Password<input type=\"password\" name=\"password\" id=\"password\" placeholder=\"\"></label>\n						</div>\n						<div class=\"small-12 medium-6 columns\">\n							<label>Confirm Password<input type=\"password\" name=\"password_confirm\"  id=\"password_confirm\" placeholder=\"\"></label>\n						</div>\n						<div class=\"small-12 medium-6 columns end\">\n							<input type=\"checkbox\" name=\"accept_terms\" value=\"y\" /><label>I accept the <a href=\"terms.php\">Terms of Service</a></label>\n						</div>\n					</div>\n				</fieldset>\n\n				<input type=\"submit\" value=\"Submit\" class=\"button small\">\n			</div></div>\n			{/exp:user:register}\n\n        {/if}\n\n        \n        \n    </div></div>\n\n{global_close}',NULL,1457474764,0,'n',0,'','n','n','o',0,'n'),
	(25,1,12,'index','webpage','{embed=\"user_inc/index\" page_title=\"{if segment_2 == \"\" OR segment_2 == logged_in_member_id}My {/if}Profile\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>{if segment_2 == \"\" OR segment_2 == logged_in_member_id}My {/if}Profile</h1>\n				<p class=\"lead\">This page shows the profile of a given member.</p>\n			</div>\n			<div class=\"row\">\n{if logged_in} {!-- START - Make sure the user is logged in before displaying profiles --}\n				{exp:user:profile\n				{if segment_2}\n					member_id=\"{segment_2}\"\n				{/if}\n				}\n				<div class=\"col-sm-3\">\n					{embed=\"user_inc/profile_column\" member_id=\"{member_id}\" profile_active=\"yes\"}\n				</div>\n				<div class=\"col-sm-9\">\n					<h2 style=\"margin-bottom:20px;\">{screen_name}</h2>\n					<div class=\"panel panel-default\">\n						<div class=\"panel-heading\"><span class=\"glyphicon glyphicon-stats\" aria-hidden=\"true\"></span> &nbsp; Stats</div>\n						<ul class=\"list-group\">\n							<li class=\"list-group-item\">\n								<strong>Birthday:</strong> &nbsp;\n								{if bday_m}\n									{if bday_m == \"01\"}January{if:elseif bday_m == \"02\"}February{if:elseif bday_m == \"03\"}March{if:elseif bday_m == \"04\"}April{if:elseif bday_m == \"05\"}May{if:elseif bday_m == \"06\"}June{if:elseif bday_m == \"07\"}July{if:elseif bday_m == \"08\"}August{if:elseif bday_m == \"09\"}September{if:elseif bday_m == \"10\"}October{if:elseif bday_m == \"11\"}November{if:elseif bday_m == \"12\"}December{if:else}{/if}\n								{/if}\n								{if bday_d}{bday_d}{/if}{if bday_y AND bday_d}, {/if}\n								{if bday_y}{bday_y}{/if}\n							</li>\n							<li class=\"list-group-item\">\n								<strong>Join Date:</strong> &nbsp;\n								{join_date format=\"%F %j, %Y\"}\n							</li>\n							<li class=\"list-group-item\">\n								<strong>Last Activity:</strong> &nbsp;\n								{last_activity format=\"%F %j, %Y\"}\n							</li>\n							<li class=\"list-group-item\">\n								<strong>Total Entries:</strong> &nbsp;\n								{if last_entry_date == \"0\"}\n									This user has not published any entries yet.\n								{if:else}\n									{total_entries} &nbsp; <i>(last published: {last_entry_date format=\"%F %j, %Y\"})</i>\n								{/if}\n									&nbsp; <a href=\"{path=\'user_main/user_entries\'}/{member_id}/\">view all &rarr;</a>\n							</li>\n							<li class=\"list-group-item\">\n								<strong>Total Comments:</strong> &nbsp;\n								{if last_comment_date == \"0\"}\n									This user has not posted any comments yet.\n								{if:else}\n									{total_comments} &nbsp; <i>(last posted: {last_comment_date format=\"%F %j, %Y\"})</i>\n								{/if}\n									&nbsp; <a href=\"{path=\'user_main/user_comments\'}/{member_id}/\">view all &rarr;</a>\n							</li>\n						</ul>\n					</div>\n					<div class=\"panel panel-default\">\n						<div class=\"panel-heading\"><span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\"></span> &nbsp; Profile</div>\n						<ul class=\"list-group\">\n							{if url}\n								<li class=\"list-group-item\">\n									<strong>Website:</strong> &nbsp;\n									<a href=\"{url}\">{url}</a>\n								</li>\n							{/if}\n							<li class=\"list-group-item\">\n								<strong>Location:</strong> &nbsp;\n								{location}\n							</li>\n							<li class=\"list-group-item\">\n								<strong>Occupation:</strong> &nbsp;\n								{occupation}\n							</li>\n							<li class=\"list-group-item\">\n								<strong>Interests:</strong> &nbsp;\n								{interests}\n							</li>\n							<li class=\"list-group-item\">\n								<strong>Bio:</strong>\n								{bio}\n							</li>\n						</ul>\n					</div>\n				</div>\n				{if no_results}\n					<div class=\"col-xs-12\">\n						<div class=\"alert alert-danger\" role=\"alert\">\n							<p class=\"lead\"><strong>Error!</strong> The account you specified does not exist.</p>\n						</div>\n					</div>\n				{/if}\n				{/exp:user:profile}\n{/if} {!-- END - Make sure the user is logged in before displaying profiles --}\n{if logged_out} {!-- START - If logged out, show the Login form --}\n				<div class=\"col-xs-12\">\n					{embed=\"user_inc/login\"}\n				</div>\n{/if} {!-- END - If logged out, show the Login form --}\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Profile\" page shows the profile of a given member. Additionally, a special \"Profile\" menu on the left is called, which creates a shortcut for sending a private message, and links to view that users\' comments and entries.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/profile\">User:Profile</a> to show profile information.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(26,1,12,'invite','webpage','{embed=\"user_inc/index\" page_title=\"Send Invite (Admins Only)\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Send Invite (Admins Only)</h1>\n				<p class=\"lead\">This page allows site admins to send an email notification to people they\'d like to invite to join the site.</p>\n			</div>\n\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					{if segment_3 == \"success\"}\n						<div class=\"alert alert-success\" role=\"alert\">\n							<p class=\"lead\">Invitation key successfully sent!</p>\n						</div>\n					{/if}\n					<div class=\"panel panel-info\">\n						<div class=\"panel-heading\">\n							This form allows admins to invite others to join this site. Recipients will receive an email notification with\n							instructions on how to register on this site. They will be taken to a special registration form to handle this feature.\n						</div>\n					</div>\n				</div>\n			</div>\n{if logged_in_group_id == \"1\"} {!-- Make sure the person viewing this page is a Super Admin --}\n			<div class=\"row\">\n				{exp:user:key\n					return=\"user_main/invite/success\"\n					error_page=\"user_inc/error_template\"\n					template=\"user_notifications/key_invite\"\n					html=\"no\" parse=\"none\" word_wrap=\"no\"\n				}\n				<div class=\"col-sm-6\">\n					<p>\n						<label for=\"sender_name\">From Name:</label>\n						<input type=\"text\" name=\"sender_name\" id=\"sender_name\" value=\"{site_name}\" placeholder=\"Enter the name you want the email to appear from\" class=\"form-control\" />\n					</p>\n					<p>\n						<label for=\"sender_email\">From Email:</label>\n						<input type=\"text\" name=\"sender_email\" id=\"sender_email\" value=\"{webmaster_email}\" placeholder=\"Enter the email address you want the email to appear from\" class=\"form-control\" />\n					</p>\n					<p>\n						<label for=\"subject\">Subject:</label>\n						<input type=\"text\" name=\"subject\" id=\"subject\" value=\"Invitation to join {site_name}!\" placeholder=\"Enter the subject line for the email notification\" class=\"form-control\" />\n					</p>\n				</div>\n\n				<div class=\"col-sm-6\">\n					<p>\n						<label for=\"recipient_email\">Recipient Email:</label>\n						<input type=\"text\" name=\"recipient_email\" id=\"recipient_email\" placeholder=\"Enter the recipients email address here\" class=\"form-control\" />\n					</p>\n					<p>\n						<label for=\"group_id\">Member Group:</label>\n						<select name=\"group_id\" id=\"group_id\" class=\"form-control\">\n							{member_groups}\n							<option value=\"{group_id}\">{group_title}</option>\n							{/member_groups}\n						</select>\n					</p>\n					<p>\n						<button type=\"submit\" class=\"btn btn-lg btn-success\">Invite!</button>\n					</p>\n				</div>\n				{/exp:user:key}\n      		</div>\n{if:else} {!-- If not a Super Admin, show error --}\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					<div class=\"alert alert-warning\" role=\"alert\">\n						<p class=\"lead\"><strong>Error!</strong> You must be a site administrator to view this page.</p>\n					</div>\n				</div>\n			</div>\n{/if} {!-- END check to see if Super Admin --}\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Send Invite\" page allows site admins to send an email notification to people they\'d like to invite to join the site. A member group can be pre-designated as well, so upon signup from the recipient, they\'ll automatically be assigned to that member group.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/key\">User:Key Invite</a> to allow admins to send site invitations.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(27,1,12,'login','webpage','{embed=\"user_inc/index\" page_title=\"Login\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Login</h1>\n				<p class=\"lead\">This page shows the profile of a given member.</p>\n			</div>\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n				{if segment_3 == \"reset\"}\n					<div class=\"alert alert-success\" role=\"alert\">\n						<p class=\"lead\">Your password has been successfully reset!</p>\n					</div>\n				{/if}\n					{embed=\"user_inc/login\"}\n				</div>\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Login\" page allows site visitors to login to the website.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li>Native EE <a href=\"https://docs.expressionengine.com/v3/member/#login-form-tag\">Member:Login_Form</a> to display a form for visitors to login.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(4,1,2,'thankyou','webpage','{global_open}\n\n    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\">\n        	<div class=\"columns twelve text-center\">\n        		<h1>Thanks!</h1>\n        		<h3>We\'ll be in touch.</h3>\n            </div>\n        </div>\n        \n    </div></div>\n\n{global_close}',NULL,1456598757,1,'n',0,'','n','n','o',0,'n'),
	(28,1,12,'memberlist','webpage','{embed=\"user_inc/index\" page_title=\"{if segment_3 == \"results\"}Member Search Results{if:else}Member List / Search{/if}\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"member\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>{if segment_3 == \"results\"}Member Search Results{if:else}Member List / Search{/if}</h1>\n				<p class=\"lead\">This page displays all members of the site. It also contains a member search column and this page doubles to display search results when a search is performed.</p>\n			</div>\n\n			<div class=\"row\">\n				<div class=\"col-sm-3\">\n					<h2>Search</h2>\n					<p style=\"margin-bottom:20px;\">Use the following fields below to perform a search on the member list. Each field searched on generates an inclusive filter.</p>\n					{exp:user:search\n						return=\"user_main/memberlist/results\"\n						error_page=\"user_inc/error_template\"\n					}\n						<p>\n							<label for=\"keywords\">Keywords (all fields):</label>\n							<input type=\"text\" name=\"keywords\" id=\"keywords\" placeholder=\"Enter keywords here\" class=\"form-control input-lg\" />\n						</p>\n						<p>\n							<label for=\"screen_name\">Screen Name:</label>\n							<input type=\"text\" name=\"screen_name\" id=\"screen_name\" placeholder=\"Enter screen name terms here\" class=\"form-control\" />\n						</p>\n						<p>\n							<label for=\"location\">Location:</label>\n							<input type=\"text\" name=\"location\" id=\"location\" placeholder=\"Enter location terms here\" class=\"form-control\" />\n						</p>\n						<p>\n							<label for=\"occupation\">Occupation:</label>\n							<input type=\"text\" name=\"occupation\" id=\"occupation\" placeholder=\"Enter occupation terms here\" class=\"form-control\" />\n						</p>\n						<p>\n							<label for=\"interests\">Interests:</label>\n							<input type=\"text\" name=\"interests\" id=\"interests\" placeholder=\"Enter interests terms here\" class=\"form-control\" />\n						</p>\n						<p>\n							<button type=\"submit\" class=\"btn btn-lg btn-success\">\n								<span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span>&nbsp; Search\n							</button>\n						</p>\n					{/exp:user:search}\n				</div>\n\n				<div class=\"col-sm-9\">\n\n{if segment_3 == \"results\"} {!-- Show this content if using this page to load Search Results --}\n\n					<h2 style=\"margin-bottom:20px;\">Member Search Results</h2>\n					<div class=\"alert alert-info\" role=\"alert\">\n						<p class=\"lead\">\n							<strong>{total_results}</strong>\n							result(s) for\n							<strong>{keywords}</strong>\n							<a href=\"{path=\'user_main/memberlist\'}\" class=\"alert-link pull-right\" style=\"font-size:14px;\">\n								Clear Search <span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>\n							</a>\n						</p>\n					</div>\n\n					{exp:user:results\n						orderby=\"screen_name\"\n						sort=\"asc\"\n						limit=\"10\"\n						paginate=\"bottom\"\n					}\n						{if count == \"1\"}\n							<div class=\"list-group\">\n						{/if}\n							<a href=\"{path=\'user_main\'}/{member_id}/\" class=\"list-group-item\">\n								<img src=\"{if avatar_filename}{avatar_url}{avatar_filename}{if:else}{exp:user:theme_folder_url}code_pack/images/no-profile-pic.jpg{/if}\" height=\"50\" width=\"50\" alt=\"{screen_name}\'s avatar\" class=\"img-rounded\" /> &nbsp;\n								<b>{screen_name}</b>\n								<span class=\"badge\">Joined {join_date format=\"%F %j, %Y\"}</span>\n							</a>\n						{if count == total_results}</div>{/if}\n						{if user_no_results}\n							<div class=\"alert alert-warning\" role=\"alert\">\n								<p>Sorry, no members were found for your search query.</p>\n							</div>\n						{/if}\n						{user_paginate}\n							<ul class=\"pagination pagination-md\">\n							{user_pagination_links}\n							{first_page}\n								<li><a href=\"{pagination_url}\">First</a></li>\n							{/first_page}\n							{previous_page}\n								<li><a href=\"{pagination_url}\">&larr; Previous</a></li>\n							{/previous_page}\n							{page}\n								<li{if current_page} class=\"active\"{/if}><a href=\"{pagination_url}\">{pagination_page_number}</a></li>\n							{/page}\n							{next_page}\n								<li><a href=\"{pagination_url}\">Next &raquo;</a></li>\n							{/next_page}\n							{last_page}\n								<li><a href=\"{pagination_url}\">Last</a></li>\n							{/last_page}\n							{/user_pagination_links}\n							</ul>\n						{/user_paginate}\n					{/exp:user:results}\n\n\n{if:else} {!-- If not Search Results, then we display regular Member List --}\n\n					<h2 style=\"margin-bottom:20px;\">Member List</h2>\n\n				{if segment_3 == \"screen_name\" AND segment_4 != \"\"}\n					<div class=\"alert alert-info\" role=\"alert\">\n						<p class=\"lead\">\n                        	Filtered by members beginning with:\n							<strong class=\"text-uppercase\">{segment_4}</strong>\n							<a href=\"{path=\'user_main/memberlist\'}\" class=\"alert-link pull-right\" style=\"font-size:14px;\">\n								Clear Search <span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>\n							</a>\n						</p>\n					</div>\n				{/if}\n\n					<div class=\"text-center\" style=\"margin-bottom:20px;\">\n						Starts with: &nbsp;\n						<div class=\"btn-group btn-group-xs\" role=\"group\">\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/a/\" class=\"btn btn-default{if segment_4 == \'a\'} btn-primary{/if}\">A</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/b/\" class=\"btn btn-default{if segment_4 == \'b\'} btn-primary{/if}\">B</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/c/\" class=\"btn btn-default{if segment_4 == \'c\'} btn-primary{/if}\">C</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/d/\" class=\"btn btn-default{if segment_4 == \'d\'} btn-primary{/if}\">D</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/e/\" class=\"btn btn-default{if segment_4 == \'e\'} btn-primary{/if}\">E</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/f/\" class=\"btn btn-default{if segment_4 == \'f\'} btn-primary{/if}\">F</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/g/\" class=\"btn btn-default{if segment_4 == \'g\'} btn-primary{/if}\">G</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/h/\" class=\"btn btn-default{if segment_4 == \'h\'} btn-primary{/if}\">H</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/i/\" class=\"btn btn-default{if segment_4 == \'i\'} btn-primary{/if}\">I</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/j/\" class=\"btn btn-default{if segment_4 == \'j\'} btn-primary{/if}\">J</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/k/\" class=\"btn btn-default{if segment_4 == \'k\'} btn-primary{/if}\">K</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/l/\" class=\"btn btn-default{if segment_4 == \'l\'} btn-primary{/if}\">L</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/m/\" class=\"btn btn-default{if segment_4 == \'m\'} btn-primary{/if}\">M</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/n/\" class=\"btn btn-default{if segment_4 == \'n\'} btn-primary{/if}\">N</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/o/\" class=\"btn btn-default{if segment_4 == \'o\'} btn-primary{/if}\">O</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/p/\" class=\"btn btn-default{if segment_4 == \'p\'} btn-primary{/if}\">P</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/q/\" class=\"btn btn-default{if segment_4 == \'q\'} btn-primary{/if}\">Q</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/r/\" class=\"btn btn-default{if segment_4 == \'r\'} btn-primary{/if}\">R</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/s/\" class=\"btn btn-default{if segment_4 == \'s\'} btn-primary{/if}\">S</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/t/\" class=\"btn btn-default{if segment_4 == \'t\'} btn-primary{/if}\">T</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/u/\" class=\"btn btn-default{if segment_4 == \'u\'} btn-primary{/if}\">U</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/v/\" class=\"btn btn-default{if segment_4 == \'v\'} btn-primary{/if}\">V</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/w/\" class=\"btn btn-default{if segment_4 == \'w\'} btn-primary{/if}\">W</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/x/\" class=\"btn btn-default{if segment_4 == \'x\'} btn-primary{/if}\">X</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/y/\" class=\"btn btn-default{if segment_4 == \'y\'} btn-primary{/if}\">Y</a>\n							<a href=\"{path=\'user_main/memberlist/screen_name\'}/z/\" class=\"btn btn-default{if segment_4 == \'z\'} btn-primary{/if}\">Z</a>\n						</div>\n						{if segment_3 == \"screen_name\"}\n						<div class=\"btn-group btn-group-xs\" role=\"group\">\n							<a href=\"{path=\'user_main/memberlist\'}/\" class=\"btn btn-info\">Clear</a>\n						</div>\n						{/if}\n					</div>\n\n					{exp:user:users\n						orderby=\"screen_name\"\n						sort=\"asc\"\n						limit=\"10\"\n						paginate=\"bottom\"\n					{if segment_3 == \"screen_name\"}\n						search:screen_name=\"{segment_4}%\"\n					{/if}\n					}\n						{if count == \"1\"}\n							<div class=\"list-group\">\n						{/if}\n							<a href=\"{path=\'user_main\'}/{member_id}/\" class=\"list-group-item\">\n								<img src=\"{if avatar_filename}{avatar_url}{avatar_filename}{if:else}{exp:user:theme_folder_url}code_pack/images/no-profile-pic.jpg{/if}\" height=\"50\" width=\"50\" alt=\"{screen_name}\'s avatar\" class=\"img-rounded\" /> &nbsp;\n								<b>{screen_name}</b>\n								<span class=\"badge\">Joined {join_date format=\"%F %j, %Y\"}</span>\n							</a>\n						{if count == total_results}</div>{/if}\n						{if user_no_results}\n							<div class=\"alert alert-warning\" role=\"alert\">\n								<p>Sorry, no members were found.</p>\n							</div>\n						{/if}\n						{user_paginate}\n							<ul class=\"pagination pagination-md\">\n							{user_pagination_links}\n							{first_page}\n								<li><a href=\"{pagination_url}\">First</a></li>\n							{/first_page}\n							{previous_page}\n								<li><a href=\"{pagination_url}\">&larr; Previous</a></li>\n							{/previous_page}\n							{page}\n								<li{if current_page} class=\"active\"{/if}><a href=\"{pagination_url}\">{pagination_page_number}</a></li>\n							{/page}\n							{next_page}\n								<li><a href=\"{pagination_url}\">Next &raquo;</a></li>\n							{/next_page}\n							{last_page}\n								<li><a href=\"{pagination_url}\">Last</a></li>\n							{/last_page}\n							{/user_pagination_links}\n							</ul>\n						{/user_paginate}\n					{/exp:user:users}\n\n{/if} {!-- END Search Results vs Member List check --}\n\n				</div>\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Member List\" page shows all members of the site. You can further filter this list of members by member group ID, etc. It also contains a member search column and this page doubles to display search results when a search is performed.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/users/\">User:Users</a> to display a list of all site members.</li>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/search/\">User:Search</a> to perform a search on site members.</li>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/results/\">User:Results</a> to display a list of site members that match search terms provided.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(8,1,6,'index','webpage','{global_open}\n\n	{if group_title == \'Super Admin\'} \n		{sales_nav}\n		{sales_dashboard} \n	{if:elseif group_title == \'Sales\'} \n		{sales_nav}\n		{sales_dashboard} \n	{if:elseif group_title == \'Sponsors\'}\n		{sponsor_nav}\n		{sponsor_dashboard}\n	{if:elseif group_title == \'Artists\'}\n		{artist_nav}\n		{artist_dashboard}\n	{/if}\n\n{global_close}','',1457886519,1,'n',0,'1','n','n','o',0,'n'),
	(11,1,8,'index','webpage','{global_open}\n\n	{if group_title == \'Super Admin\'}\n		{sales_nav}\n	{if:elseif group_title == \'Sales\'}\n		{sales_nav}\n	{if:elseif group_title == \'Sponsors\'}\n		{sponsor_nav}\n	{if:elseif group_title == \'Artists\'}\n		{artist_nav}\n	{/if}\n\n	{if segment_2==\"sponsor\"}\n		{sponsor_profile}\n	{if:elseif segment_2==\"artist\"}\n		{artist_profile}\n	{if:elseif segment_2==\"pending\"}\n		{pending_profile}\n	{/if}\n\n{global_close}','',1457886446,1,'n',0,'1','n','n','o',0,'n'),
	(10,1,7,'index','webpage','{global_open}\n\n	{if group_title == \'Sales\'}\n		{sales_nav}\n	{if:elseif group_title == \'Super Admin\'}\n		{sales_nav}\n	{if:elseif group_title == \'Sponsors\'}\n		{sponsor_nav}\n	{/if}\n\n	<div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\"><div class=\"columns twelve\">	\n			{if group_title == \'Sales\'}\n				<h1>{username}, Browse the {segment_2}</h1>\n			{if:elseif group_title == \'Super Admin\'}\n				<h1>{username}, Browse the {segment_2}</h1>\n			{if:elseif group_title == \'Sponsors\'}\n				{exp:user:profile}<h1>{sponsor_contact_name}, Check out some Artists.</h1>{/exp:user:profile}\n			{/if}\n        </div></div>\n\n		{if segment_2==\'sponsors\'}\n			{browse-sponsors}\n		{if:else}\n			{browse-artists}\n		{/if}\n        \n    </div></div>\n\n{global_close}','',1457291032,1,'n',0,'1','n','n','o',0,'n'),
	(12,1,9,'index','webpage','{global_open}\n\n	{if group_title == \"Super Admin\"}\n		{sales_nav}\n	{/if}\n\n	<div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\"><div class=\"columns twelve\">	\n			<h1>{username}, Invite Someone</h1>\n        </div></div>\n\n        <div class=\"row\"><div class=\"columns twelve\">\n        	{if segment_2 == \"success\"}\n				<div class=\"alert alert-success\" role=\"alert\">\n					<p class=\"lead\">Invitation key successfully sent!</p>\n				</div>\n			{/if}\n        </div></div>\n\n{if logged_in_group_id == \"1\"} {!-- Make sure the person viewing this page is a Super Admin --}\n{exp:user:key template=\"user_notifications/key_invite\" html=\"no\" parse=\"none\" word_wrap=\"no\" return=\"invite/index/success\"}\n				<div class=\"row\">\n					<fieldset class=\"fieldset\">\n						<legend>Company Information</legend>\n\n						<input type=\"hidden\" name=\"sender_email\" id=\"sender_email\" value=\"charted@gmail.com\" />\n						<input type=\"hidden\" name=\"sender_name\" id=\"sender_name\" value=\"{site_name}\" />\n						<input type=\"hidden\" name=\"subject\" id=\"subject\" value=\"Invitation to join {site_name}!\" />\n\n							<div class=\"twelve columns\">\n								<label for=\"\"><input type=\"radio\" name=\"group_id\" value=\"8\"> Artist</label>\n								<label for=\"\"><input type=\"radio\" name=\"group_id\" value=\"7\"> Sponsor</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>Name\n									<input type=\"text\" name=\"screen_name\" placeholder=\"\">\n								</label>\n							</div>\n							<div class=\"twelve columns\">\n								<label>Email\n									<!-- <input type=\"email\" placeholder=\"\"> -->\n									<input type=\"email\" name=\"recipient_email\" id=\"recipient_email\" />\n								</label>\n							</div>\n							\n					</fieldset>\n				</div>\n\n				<div class=\"row\">\n					<button type=\"submit\" class=\"button\">Submit</button>\n				</div>\n{/exp:user:key}\n{if:else} {!-- If not a Super Admin, show error --}\n			<div class=\"row\">\n				<div class=\"columns twelve\">\n					<div class=\"alert warning\">\n						<p class=\"lead\"><strong>Error!</strong> You must be a site administrator to view this page.</p>\n					</div>\n				</div>\n			</div>\n{/if} {!-- END check to see if Super Admin --}\n        \n    </div></div>\n\n{global_close}',NULL,1457295443,1,'n',0,'8','n','n','o',0,'n'),
	(13,1,10,'index','webpage','{global_open}\n\n	{if group_title == \'Sales\'}\n		{sales_nav}\n	{if:elseif group_title == \'Sponsors\'}\n		{sponsor_nav}\n	{if:elseif group_title == \'Artists\'}\n		{artist_nav}\n	{/if}\n\n	{if group_title==\"Sponsors\"}\n		{sponsor_edit}\n	{if:elseif group_title==\"Artists\"}\n		{if segment_2==\'contact\'}\n			{artist_edit_contact}\n		{if:elseif segment_2==\'bio\'}\n			{artist_edit_bio}\n		{if:elseif segment_2==\'photo\'}\n			{artist_edit_photo}\n		{if:elseif segment_2==\'media\'}\n			{artist_edit_media}\n		{if:elseif segment_2==\'social\'}\n			{artist_edit_social}\n		{/if}\n\n	{/if}\n\n{global_close}','',1457885217,1,'n',0,'1','n','n','o',0,'n'),
	(14,1,9,'notify','webpage','\nHello,\n \nYou\'ve recieved a special invitation to register to BYGMusic!\nYour invitation code is: {key}\n \nPlease follow this link to complete your registration:\nhttp://bygmusic/register/key/{key}\n \nThank you,\n \nBYG Music','',1457293096,1,'n',0,'1','n','n','o',0,'n'),
	(15,1,11,'comments_search_links','webpage','{exp:query sql=\"SELECT url_title FROM exp_channel_titles WHERE entry_id = \'{embed:entry_id}\'\"}{url_title}{/exp:query}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(16,1,11,'comments_search_titles','webpage','{exp:query sql=\"SELECT title FROM exp_channel_titles WHERE entry_id = \'{embed:entry_id}\'\"}{title}{/exp:query}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(17,1,11,'error_template','webpage','{embed=\"user_inc/index\" page_title=\"Error\"}\n		<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js\"></script>\n		<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js\"></script>\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Error</h1>\n				<p class=\"lead\">This page allows you to bypass the native EE error message template and create and customize your own.</p>\n			</div>\n\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					<div class=\"alert alert-danger\" role=\"alert\">\n						<h5>{heading}</h5>\n						<p class=\"lead\">{content}</p>\n						<p>{link}</p>\n					</div>\n				</div>\n			</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Error\" page allows you to bypass the native EE error message template and create and customize your own.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/docs/user/error_page/\">Error Page</a> to allow you to bypass the native EE error message template and create and customize your own.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(18,1,11,'footer','webpage','			<div class=\"footer\">\n				<p>&copy; {current_time format=\"%Y\"} Solspace, Inc.</p>\n			</div>\n			\n			{!-- Begin Testing and Debugging --}\n			<div class=\"panel panel-default solspace-debug\">\n				<div class=\"panel-heading\">\n					<h3 class=\"panel-title\">Logged In/Out Testing &amp; Debugging</h3>\n				</div>\n				<div class=\"panel-body\">\n					<ul>\n						<li>Are you Logged in?: {if logged_in}Your are Logged In{/if}{if logged_out}Your are Logged Out{/if}</li>\n						<li>Currently Logged in Member ID: {logged_in_member_id}</li>\n						<li>Currently Logged in Username: {logged_in_username}</li>\n						<li>Currently Logged in Screen Name: {logged_in_screen_name}</li>\n						<li>Currently Logged in Member Group ID: {logged_in_group_id}</li>\n					</ul>\n				</div>\n			</div>\n			{!-- End Testing and Debugging --}\n\n		</div>\n\n		<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n		<script src=\"{exp:user:theme_folder_url}code_pack/js/bootstrap.min.js\"></script>\n		<script>\n			$(document).ready(function(){\n				$(\".tips\").tooltip({\n					placement : \'top\'\n				});\n			});\n		</script>\n	</body>\n</html>',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(19,1,11,'header','webpage','		<div class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n			<div class=\"container\">\n				<div class=\"navbar-header\">\n					<button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n						<span class=\"sr-only\">Toggle navigation</span>\n						<span class=\"icon-bar\"></span>\n						<span class=\"icon-bar\"></span>\n						<span class=\"icon-bar\"></span>\n					</button>\n					<a class=\"navbar-brand\" href=\"{path=\'user_main\'}/\">User Demo</a>\n				</div>\n				<div class=\"navbar-collapse collapse\">\n					<ul class=\"nav navbar-nav\">\n					{if logged_in}\n						<li class=\"dropdown\">\n							<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">My Account <span class=\"caret\"></span></a>\n							<ul class=\"dropdown-menu{if embed:page == \"account\"} active{/if}\" role=\"menu\">\n								<li><a href=\"{path=\'user_main\'}/\">View My Profile</a></li>\n								<li class=\"divider\"></li>\n								<li><a href=\"{path=\'user_main/update_profile\'}/\">Update My Profile</a></li>\n								<li><a href=\"{path=\'user_main/update_avatar\'}/\">Update Avatar</a></li>\n								<li><a href=\"{path=\'user_main/update_settings\'}/\">Update Settings</a></li>\n								<li><a href=\"{path=\'user_main/update_account\'}/\">Update Account</a></li>\n								<li><a href=\"{path=\'user_main/delete_account\'}/\">Delete Account</a></li>\n								<li class=\"divider\"></li>\n								<li><a href=\"{exp:user:logout return=\"user_main\"}{url}{/exp:user:logout}\">Logout</a></li>\n							</ul>\n						</li>\n						<li class=\"dropdown\">\n							<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Messages <span class=\"badge\">{private_messages}</span> <span class=\"caret\"></span></a>\n							<ul class=\"dropdown-menu{if embed:page == \"messages\"} active{/if}\" role=\"menu\">\n								<li><a href=\"{path=\'member/messages/compose\'}/\">Compose New</a></li>\n								<li class=\"divider\"></li>\n								<li><a href=\"{path=member/messages/view_folder}/1/\"><b>Inbox</b> ({private_messages} new)</a></li>\n								<li><a href=\"{path=member/messages/view_folder}/2/\">Sent</a></li>\n								<li><a href=\"{path=member/messages/view_folder}/deleted/\">Trash</a></li>\n							</ul>\n						</li>\n					{/if}\n					{if logged_out}\n						<li>\n							<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Login <span class=\"caret\"></span></a>\n							<ul class=\"dropdown-menu\" role=\"menu\">\n								<li><a href=\"{path=\'user_main/login\'}/\">Login</a></li>\n								<li><a href=\"{path=\'user_main/register\'}/\">Create Account</a></li>\n								<li class=\"divider\"></li>\n								<li><a href=\"{path=\'user_main/forgot_password\'}/\">Forgot Password</a></li>\n								<li><a href=\"{path=\'user_main/forgot_password\'}/\">Forgot Username</a></li>\n							</ul>\n						</li>\n					{/if}\n						<li class=\"dropdown\">\n							<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Members <span class=\"caret\"></span></a>\n							<ul class=\"dropdown-menu{if embed:page == \"member\"} active{/if}\" role=\"menu\">\n								<li><a href=\"{path=\'user_main/memberlist\'}/\">Member List</a></li>\n								<li><a href=\"{path=\'user_main/memberlist\'}/\">Member Search</a></li>\n							{if logged_in_group_id == \"1\"}\n								<li><a href=\"{path=\'user_main/invite\'}\">Invite (Admins Only)</a></li>\n							{/if}\n							</ul>\n						</li>\n					</ul>\n					<ul class=\"nav navbar-nav navbar-right\">\n						<li class=\"dropdown\">\n							<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Resources <span class=\"caret\"></span></a>\n							<ul class=\"dropdown-menu\" role=\"menu\">\n								<li><a href=\"https://solspace.com/\">Solspace.com</a></li>\n								<li><a href=\"https://solspace.com/docs/user/\">Documentation</a></li>\n								<li><a href=\"https://solspace.com/support/\">Support</a></li>\n							</ul>\n						</li>\n					</ul>\n				</div><!--/.nav-collapse -->\n			</div>\n		</div>',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(29,1,12,'register','webpage','{embed=\"user_inc/index\" page_title=\"Register\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Register</h1>\n				<p class=\"lead\">This page allows users to sign up for a member account.</p>\n			</div>\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n{if segment_3 == \"success\"} {!-- Load this content if the user has successfully completed the register form --}\n					<div class=\"alert alert-success\" role=\"alert\">\n						<h4>You\'ve successfully created an account!</h4>\n						<p>\n							Depending on this site\'s Member Activation settings, you\'ll either be able to begin using your account immediately, receive\n							a confirmation email to self activate your account, or an Administrator will need to approve your account manually.\n						</p>\n					</div>\n{if:else} {!-- Otherwise, show the register form --}\n					<h2>Create a New Account</h2>\n					<p style=\"margin-bottom:20px;\">To create a new account, just fill in the form below:</p>\n					{exp:user:register\n						return=\"user_main/register/success\"\n						error_page=\"user_inc/error_template\"\n					{if segment_3 == \"key\"} {!-- If this is a registration from a Key Invite --}\n						require_key=\"yes\" key_email_match=\"yes\"\n					{/if}\n						form:class=\"form-horizontal\"\n					}\n						<div class=\"form-group\">\n							<label for=\"email\" class=\"col-sm-3 col-md-2 control-label\">Email Address</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"email\" name=\"email\" id=\"email\" placeholder=\"Enter your email address here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<label for=\"username\" class=\"col-sm-3 col-md-2 control-label\">Username</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"text\" name=\"username\" id=\"username\" placeholder=\"Enter your username here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<label for=\"screen_name\" class=\"col-sm-3 col-md-2 control-label\">Screen Name</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"text\" name=\"screen_name\" id=\"screen_name\" placeholder=\"Enter your screen name here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<label for=\"password\" class=\"col-sm-3 col-md-2 control-label\">Password</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Enter your password here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<label for=\"password_confirm\" class=\"col-sm-3 col-md-2 control-label\">Confirm Password</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"password\" name=\"password_confirm\" id=\"password_confirm\" placeholder=\"Re-type your password again here\" class=\"form-control\">\n							</div>\n						</div>\n					{if segment_3 == \"key\"} {!-- If this is a registration from a Key Invite --}\n						<div class=\"form-group\">\n							<label for=\"key\" class=\"col-sm-3 col-md-2 control-label\">Invite Key</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"text\" name=\"key\" id=\"key\" value=\"{key}\" placeholder=\"Enter the key from your invite here\" class=\"form-control\">\n							</div>\n						</div>\n					{/if}\n					{if captcha}\n						<div class=\"form-group\">\n							<label for=\"captcha\" class=\"col-sm-3 col-md-2 control-label\">{captcha}</label>\n							<div class=\"col-sm-7 col-lg-6\">\n								<input type=\"text\" name=\"captcha\" id=\"captcha\" placeholder=\"Enter the word you see on the left\" class=\"form-control\">\n							</div>\n						</div>\n					{/if}\n						<div class=\"form-group\">\n							<div class=\"col-sm-offset-3 col-sm-offset-2 col-sm-7 col-lg-6\">\n								<div class=\"checkbox\">\n									<label>\n										<input type=\"checkbox\" name=\"accept_terms\" id=\"accept_terms\" value=\"y\" />\n										Accept Terms?\n									</label>\n								</div>\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<div class=\"col-sm-offset-3 col-sm-offset-2 col-sm-7 col-lg-6\">\n								<button type=\"submit\" class=\"btn btn-lg btn-success\">Register</button>\n							</div>\n						</div>\n					{if user_no_results}\n						<div class=\"alert alert-warning\" role=\"alert\">\n							<p>You\'re currently logged in, and must be logged out to register a new account.</p>\n						</div>\n					{/if}\n					{/exp:user:register}\n{/if} {!-- END Register/Success check --}\n				</div>\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Register\" page allows users to sign up for a member account. This form respects native EE Member registration preferences.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/register\">User:Register</a> to allow users to register for member accounts.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457304946,0,'n',0,'','n','n','o',0,'n'),
	(30,1,12,'reset_password','webpage','{embed=\"user_inc/index\" page_title=\"Reset Password\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Reset Password</h1>\n				<p class=\"lead\">This page allows users to reset their password from the link that was emailed to them from the Forgot Passsword page.</p>\n			</div>\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					<h2>Reset Your Password</h2>\n					<p style=\"margin-bottom:20px;\">Enter a new password for your account in the form fields below:</p>\n					{exp:user:reset_password\n						reset_code=\"{segment_3}\"\n						return=\"user_main/login/reset\"\n						form:class=\"form-horizontal\"\n					}\n						<div class=\"form-group\">\n							<label for=\"password\" class=\"col-sm-4 col-md-3 col-lg-2 control-label\">New Password</label>\n							<div class=\"col-sm-6\">\n								<input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Enter a new password here\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<label for=\"password_confirm\" class=\"col-sm-4 col-md-3 col-lg-2 control-label\">Confirm New Password</label>\n							<div class=\"col-sm-6\">\n								<input type=\"password\" name=\"password_confirm\" id=\"password_confirm\" placeholder=\"Re-type the new password you just entered above\" class=\"form-control\">\n							</div>\n						</div>\n						<div class=\"form-group\">\n							<div class=\"col-sm-offset-4 col-sm-offset-3 col-lg-offset-2 col-sm-6\">\n								<button type=\"submit\" class=\"btn btn-lg btn-success\">Submit</button>\n							</div>\n						</div>\n					{if user_no_results}\n						<div class=\"alert alert-warning\" role=\"alert\">\n							<p><strong>Error!</strong> The reset token provided is invalid.</p>\n						</div>\n					{/if}\n					{/exp:user:reset_password}\n				</div>\n			</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Reset Password\" page allows users to reset their password from the link that was emailed to them from the Forgot Passsword page. This page cannot be used without the ID from the password reset email.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/reset_password\">User:Reset_Password</a> to allow users have their username mailed to them.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(31,1,12,'update_account','webpage','{embed=\"user_inc/index\" page_title=\"Update Account\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Update Account</h1>\n				<p class=\"lead\">This page allows the currently logged in user to edit sensitive account information.</p>\n			</div>\n\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					{if segment_3 == \"updated\"}\n						<div class=\"alert alert-success\" role=\"alert\">\n							<p class=\"lead\">Your account has been successfully updated!</p>\n						</div>\n					{/if}\n					<h4>Edit the fields below to update your account:</h4>\n				</div>\n			</div>\n\n			<div class=\"row\">\n{if logged_in} {!-- START - Make sure the user is logged in for updating account --}\n				{exp:user:edit\n					return=\"user_main/update_account/updated\"\n					screen_name_password_required=\"no\"\n					error_page=\"user_inc/error_template\"\n				}\n				<div class=\"col-sm-6\">\n					<p>\n						<label for=\"username\">Username:</label>\n						<input type=\"text\" name=\"username\" id=\"username\" value=\"{username}\" class=\"form-control\" />\n					</p>\n					<p>\n						<label for=\"password\">New Password:</label>\n						<input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Enter new password here\" class=\"form-control\" />\n					</p>\n					<p>\n						<label for=\"password_confirm\">Confirm New Password:</label>\n						<input type=\"password\" name=\"password_confirm\" id=\"password_confirm\" placeholder=\"Confirm new password here\" class=\"form-control\" />\n					</p>\n				</div>\n\n				<div class=\"col-sm-6\">\n					<p>\n						<label for=\"email\">Email:</label>\n						<input type=\"text\" name=\"email\" id=\"email\" value=\"{email}\" placeholder=\"Enter your email address here\" class=\"form-control\" />\n					</p>\n					<p>\n						<label for=\"current_password\">In order to update this page, you have to submit the current password:</label>\n						<input type=\"password\" name=\"current_password\" id=\"current_password\" placeholder=\"Enter your current password here\" class=\"form-control\" />\n					</p>\n					<p>\n						<button type=\"submit\" class=\"btn btn-lg btn-success\">Update</button>\n					</p>\n				</div>\n				{/exp:user:edit}\n{/if} {!-- END - Make sure the user is logged in for updating account --}\n{if logged_out} {!-- START - If logged out, show the Login form --}\n				<div class=\"col-xs-12\">\n					{embed=\"user_inc/login\"}\n				</div>\n{/if} {!-- END - If logged out, show the Login form --}\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Update Account\" page allows the currently logged in user to edit sensitive account information.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/edit\">User:Edit</a> to edit profile information.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(32,1,12,'update_avatar','webpage','{embed=\"user_inc/index\" page_title=\"Update Avatar\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Update Avatar</h1>\n				<p class=\"lead\">This page allows the currently logged in user to add/change/remove their avatar.</p>\n			</div>\n\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n				{if segment_3 == \"avatar_updated\"}\n					<div class=\"alert alert-success\" role=\"alert\">\n						<p class=\"lead\">You\'ve successfully updated your avatar!</p>\n					</div>\n				{/if}\n				</div>\n			</div>\n\n			<div class=\"row\">\n{if logged_in} {!-- START - Make sure the user is logged in for updating account --}\n				<div class=\"col-xs-12\">\n					{exp:user:edit\n						return=\"user_main/update_avatar/avatar_updated\"\n						override_return=\"user_main/update_avatar/avatar_updated\"\n						screen_name_password_required=\"no\"\n						error_page=\"user_inc/error_template\"\n					}\n					<h4>Avatar</h4>\n					<p>\n						{if avatar_filename}\n							<label>Current Avatar</label>\n							<img src=\"{avatar_url}{avatar_filename}\" width=\"{avatar_width}\" height=\"{avatar_height}\" class=\"img-responsive img-rounded\" style=\"display:block;\" />\n						{if:else}\n							You currently do not have an avatar uploaded.\n						{/if}\n					</p>\n					<p>\n						<label for=\"avatar_filename\">Upload a New Avatar</label>\n						<input type=\"file\" name=\"avatar_filename\" id=\"avatar_filename\" />\n					</p>\n					<p>\n						<button type=\"submit\" class=\"btn btn-md btn-success\" style=\"margin-right:10px;\">Update</button>\n						<button type=\"submit\" name=\"remove_avatar\" class=\"btn btn-md btn-danger\">Remove</button>\n					</p>\n					{/exp:user:edit}\n				</div>\n\n{/if} {!-- END - Make sure the user is logged in for updating account --}\n{if logged_out} {!-- START - If logged out, show the Login form --}\n				<div class=\"col-xs-12\">\n					{embed=\"user_inc/login\"}\n				</div>\n{/if} {!-- END - If logged out, show the Login form --}\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Update Avatar/Photo\" page allows the currently logged in user to add/change/remove their avatar.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/edit\">User:Edit</a> to edit profile information.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(33,1,12,'update_profile','webpage','{embed=\"user_inc/index\" page_title=\"Update My Profile\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Update My Profile</h1>\n				<p class=\"lead\">This page allows the currently logged in user to edit their basic profile information.</p>\n			</div>\n\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					{if segment_3 == \"updated\"}\n						<div class=\"alert alert-success\" role=\"alert\">\n							<p class=\"lead\">Your profile has been successfully updated!</p>\n						</div>\n					{/if}\n					<h4>Fill in or edit the fields below to update your profile:</h4>\n				</div>\n			</div>\n\n			<div class=\"row\">\n{if logged_in} {!-- START - Make sure the user is logged in for updating account --}\n				{exp:user:edit\n					return=\"user_main/update_profile/updated\"\n					screen_name_password_required=\"no\"\n					error_page=\"user_inc/error_template\"\n				}\n				<div class=\"col-sm-6\">\n					<p>\n						<label for=\"screen_name\">Screen Name</label>\n						<input type=\"text\" name=\"screen_name\" id=\"screen_name\" placeholder=\"Enter screen name here\" value=\"{screen_name}\" class=\"form-control\">\n					</p>\n					<p>\n						<label for=\"location\">Location</label>\n						<input type=\"text\" name=\"location\" id=\"location\" placeholder=\"Enter location here\" value=\"{location}\" class=\"form-control\">\n					</p>\n					<p>\n						<label for=\"occupation\">Occupation</label>\n						<input type=\"text\" name=\"occupation\" id=\"occupation\" placeholder=\"Enter occupation here\" value=\"{occupation}\" class=\"form-control\">\n					</p>\n					<p>\n						<label for=\"bday_d\" style=\"display:block;\">Birthday:</label>\n						<select name=\"bday_m\" id=\"bday_m\" class=\"form-control\" style=\"width:47%;margin-right:10px;display:inline-block;\">\n							<option value=\"\">--</option>\n							<option value=\"01\" {if bday_m == \"01\"}selected=\"selected\"{/if}>January</option>\n							<option value=\"02\" {if bday_m == \"02\"}selected=\"selected\"{/if}>February</option>\n							<option value=\"03\" {if bday_m == \"03\"}selected=\"selected\"{/if}>March</option>\n							<option value=\"04\" {if bday_m == \"04\"}selected=\"selected\"{/if}>April</option>\n							<option value=\"05\" {if bday_m == \"05\"}selected=\"selected\"{/if}>May</option>\n							<option value=\"06\" {if bday_m == \"06\"}selected=\"selected\"{/if}>June</option>\n							<option value=\"07\" {if bday_m == \"07\"}selected=\"selected\"{/if}>July</option>\n							<option value=\"08\" {if bday_m == \"08\"}selected=\"selected\"{/if}>August</option>\n							<option value=\"09\" {if bday_m == \"09\"}selected=\"selected\"{/if}>September</option>\n							<option value=\"10\" {if bday_m == \"10\"}selected=\"selected\"{/if}>October</option>\n							<option value=\"11\" {if bday_m == \"11\"}selected=\"selected\"{/if}>November</option>\n							<option value=\"12\" {if bday_m == \"12\"}selected=\"selected\"{/if}>December</option>\n						</select>\n\n						<select name=\"bday_d\" id=\"bday_d\" class=\"form-control\" style=\"width:17%;margin-right:10px;display:inline-block;\">\n							<option value=\"\">--</option>\n							<option value=\"1\" {if bday_d == \"1\"}selected=\"selected\"{/if}>1</option>\n							<option value=\"2\" {if bday_d == \"2\"}selected=\"selected\"{/if}>2</option>\n							<option value=\"3\" {if bday_d == \"3\"}selected=\"selected\"{/if}>3</option>\n							<option value=\"4\" {if bday_d == \"4\"}selected=\"selected\"{/if}>4</option>\n							<option value=\"5\" {if bday_d == \"5\"}selected=\"selected\"{/if}>5</option>\n							<option value=\"6\" {if bday_d == \"6\"}selected=\"selected\"{/if}>6</option>\n							<option value=\"7\" {if bday_d == \"7\"}selected=\"selected\"{/if}>7</option>\n							<option value=\"8\" {if bday_d == \"8\"}selected=\"selected\"{/if}>8</option>\n							<option value=\"9\" {if bday_d == \"9\"}selected=\"selected\"{/if}>9</option>\n							<option value=\"10\" {if bday_d == \"10\"}selected=\"selected\"{/if}>10</option>\n							<option value=\"11\" {if bday_d == \"11\"}selected=\"selected\"{/if}>11</option>\n							<option value=\"12\" {if bday_d == \"12\"}selected=\"selected\"{/if}>12</option>\n							<option value=\"13\" {if bday_d == \"13\"}selected=\"selected\"{/if}>13</option>\n							<option value=\"14\" {if bday_d == \"14\"}selected=\"selected\"{/if}>14</option>\n							<option value=\"15\" {if bday_d == \"15\"}selected=\"selected\"{/if}>15</option>\n							<option value=\"16\" {if bday_d == \"16\"}selected=\"selected\"{/if}>16</option>\n							<option value=\"17\" {if bday_d == \"17\"}selected=\"selected\"{/if}>17</option>\n							<option value=\"18\" {if bday_d == \"18\"}selected=\"selected\"{/if}>18</option>\n							<option value=\"19\" {if bday_d == \"19\"}selected=\"selected\"{/if}>19</option>\n							<option value=\"20\" {if bday_d == \"20\"}selected=\"selected\"{/if}>20</option>\n							<option value=\"21\" {if bday_d == \"21\"}selected=\"selected\"{/if}>21</option>\n							<option value=\"22\" {if bday_d == \"22\"}selected=\"selected\"{/if}>22</option>\n							<option value=\"23\" {if bday_d == \"23\"}selected=\"selected\"{/if}>23</option>\n							<option value=\"24\" {if bday_d == \"24\"}selected=\"selected\"{/if}>24</option>\n							<option value=\"25\" {if bday_d == \"25\"}selected=\"selected\"{/if}>25</option>\n							<option value=\"26\" {if bday_d == \"26\"}selected=\"selected\"{/if}>26</option>\n							<option value=\"27\" {if bday_d == \"27\"}selected=\"selected\"{/if}>27</option>\n							<option value=\"28\" {if bday_d == \"28\"}selected=\"selected\"{/if}>28</option>\n							<option value=\"29\" {if bday_d == \"29\"}selected=\"selected\"{/if}>29</option>\n							<option value=\"30\" {if bday_d == \"30\"}selected=\"selected\"{/if}>30</option>\n							<option value=\"31\" {if bday_d == \"31\"}selected=\"selected\"{/if}>31</option>\n						</select>\n\n						<select name=\"bday_y\" id=\"bday_y\" class=\"form-control\" style=\"width:27%;display:inline-block;\">\n							<option value=\"\">--</option>\n							<option value=\"2006\" {if bday_y == \"2006\"}selected=\"selected\"{/if}>2006</option>\n							<option value=\"2005\" {if bday_y == \"2005\"}selected=\"selected\"{/if}>2005</option>\n							<option value=\"2004\" {if bday_y == \"2004\"}selected=\"selected\"{/if}>2004</option>\n							<option value=\"2003\" {if bday_y == \"2003\"}selected=\"selected\"{/if}>2003</option>\n							<option value=\"2002\" {if bday_y == \"2002\"}selected=\"selected\"{/if}>2002</option>\n							<option value=\"2001\" {if bday_y == \"2001\"}selected=\"selected\"{/if}>2001</option>\n							<option value=\"2000\" {if bday_y == \"2000\"}selected=\"selected\"{/if}>2000</option>\n							<option value=\"1999\" {if bday_y == \"1999\"}selected=\"selected\"{/if}>1999</option>\n							<option value=\"1998\" {if bday_y == \"1998\"}selected=\"selected\"{/if}>1998</option>\n							<option value=\"1997\" {if bday_y == \"1997\"}selected=\"selected\"{/if}>1997</option>\n							<option value=\"1996\" {if bday_y == \"1996\"}selected=\"selected\"{/if}>1996</option>\n							<option value=\"1995\" {if bday_y == \"1995\"}selected=\"selected\"{/if}>1995</option>\n							<option value=\"1994\" {if bday_y == \"1994\"}selected=\"selected\"{/if}>1994</option>\n							<option value=\"1993\" {if bday_y == \"1993\"}selected=\"selected\"{/if}>1993</option>\n							<option value=\"1992\" {if bday_y == \"1992\"}selected=\"selected\"{/if}>1992</option>\n							<option value=\"1991\" {if bday_y == \"1991\"}selected=\"selected\"{/if}>1991</option>\n							<option value=\"1990\" {if bday_y == \"1990\"}selected=\"selected\"{/if}>1990</option>\n							<option value=\"1989\" {if bday_y == \"1989\"}selected=\"selected\"{/if}>1989</option>\n							<option value=\"1988\" {if bday_y == \"1988\"}selected=\"selected\"{/if}>1988</option>\n							<option value=\"1987\" {if bday_y == \"1987\"}selected=\"selected\"{/if}>1987</option>\n							<option value=\"1986\" {if bday_y == \"1986\"}selected=\"selected\"{/if}>1986</option>\n							<option value=\"1985\" {if bday_y == \"1985\"}selected=\"selected\"{/if}>1985</option>\n							<option value=\"1984\" {if bday_y == \"1984\"}selected=\"selected\"{/if}>1984</option>\n							<option value=\"1983\" {if bday_y == \"1983\"}selected=\"selected\"{/if}>1983</option>\n							<option value=\"1982\" {if bday_y == \"1982\"}selected=\"selected\"{/if}>1982</option>\n							<option value=\"1981\" {if bday_y == \"1981\"}selected=\"selected\"{/if}>1981</option>\n							<option value=\"1980\" {if bday_y == \"1980\"}selected=\"selected\"{/if}>1980</option>\n							<option value=\"1979\" {if bday_y == \"1979\"}selected=\"selected\"{/if}>1979</option>\n							<option value=\"1978\" {if bday_y == \"1978\"}selected=\"selected\"{/if}>1978</option>\n							<option value=\"1977\" {if bday_y == \"1977\"}selected=\"selected\"{/if}>1977</option>\n							<option value=\"1976\" {if bday_y == \"1976\"}selected=\"selected\"{/if}>1976</option>\n							<option value=\"1975\" {if bday_y == \"1975\"}selected=\"selected\"{/if}>1975</option>\n							<option value=\"1974\" {if bday_y == \"1974\"}selected=\"selected\"{/if}>1974</option>\n							<option value=\"1973\" {if bday_y == \"1973\"}selected=\"selected\"{/if}>1973</option>\n							<option value=\"1972\" {if bday_y == \"1972\"}selected=\"selected\"{/if}>1972</option>\n							<option value=\"1971\" {if bday_y == \"1971\"}selected=\"selected\"{/if}>1971</option>\n							<option value=\"1970\" {if bday_y == \"1970\"}selected=\"selected\"{/if}>1970</option>\n							<option value=\"1969\" {if bday_y == \"1969\"}selected=\"selected\"{/if}>1969</option>\n							<option value=\"1968\" {if bday_y == \"1968\"}selected=\"selected\"{/if}>1968</option>\n							<option value=\"1967\" {if bday_y == \"1967\"}selected=\"selected\"{/if}>1967</option>\n							<option value=\"1966\" {if bday_y == \"1966\"}selected=\"selected\"{/if}>1966</option>\n							<option value=\"1965\" {if bday_y == \"1965\"}selected=\"selected\"{/if}>1965</option>\n							<option value=\"1964\" {if bday_y == \"1964\"}selected=\"selected\"{/if}>1964</option>\n							<option value=\"1963\" {if bday_y == \"1963\"}selected=\"selected\"{/if}>1963</option>\n							<option value=\"1962\" {if bday_y == \"1962\"}selected=\"selected\"{/if}>1962</option>\n							<option value=\"1961\" {if bday_y == \"1961\"}selected=\"selected\"{/if}>1961</option>\n							<option value=\"1960\" {if bday_y == \"1960\"}selected=\"selected\"{/if}>1960</option>\n							<option value=\"1959\" {if bday_y == \"1959\"}selected=\"selected\"{/if}>1959</option>\n							<option value=\"1958\" {if bday_y == \"1958\"}selected=\"selected\"{/if}>1958</option>\n							<option value=\"1957\" {if bday_y == \"1957\"}selected=\"selected\"{/if}>1957</option>\n							<option value=\"1956\" {if bday_y == \"1956\"}selected=\"selected\"{/if}>1956</option>\n							<option value=\"1955\" {if bday_y == \"1955\"}selected=\"selected\"{/if}>1955</option>\n							<option value=\"1954\" {if bday_y == \"1954\"}selected=\"selected\"{/if}>1954</option>\n							<option value=\"1953\" {if bday_y == \"1953\"}selected=\"selected\"{/if}>1953</option>\n							<option value=\"1952\" {if bday_y == \"1952\"}selected=\"selected\"{/if}>1952</option>\n							<option value=\"1951\" {if bday_y == \"1951\"}selected=\"selected\"{/if}>1951</option>\n							<option value=\"1950\" {if bday_y == \"1950\"}selected=\"selected\"{/if}>1950</option>\n							<option value=\"1949\" {if bday_y == \"1949\"}selected=\"selected\"{/if}>1949</option>\n							<option value=\"1948\" {if bday_y == \"1948\"}selected=\"selected\"{/if}>1948</option>\n							<option value=\"1947\" {if bday_y == \"1947\"}selected=\"selected\"{/if}>1947</option>\n							<option value=\"1946\" {if bday_y == \"1946\"}selected=\"selected\"{/if}>1946</option>\n							<option value=\"1945\" {if bday_y == \"1945\"}selected=\"selected\"{/if}>1945</option>\n							<option value=\"1944\" {if bday_y == \"1944\"}selected=\"selected\"{/if}>1944</option>\n							<option value=\"1943\" {if bday_y == \"1943\"}selected=\"selected\"{/if}>1943</option>\n							<option value=\"1942\" {if bday_y == \"1942\"}selected=\"selected\"{/if}>1942</option>\n							<option value=\"1941\" {if bday_y == \"1941\"}selected=\"selected\"{/if}>1941</option>\n							<option value=\"1940\" {if bday_y == \"1940\"}selected=\"selected\"{/if}>1940</option>\n							<option value=\"1939\" {if bday_y == \"1939\"}selected=\"selected\"{/if}>1939</option>\n							<option value=\"1938\" {if bday_y == \"1938\"}selected=\"selected\"{/if}>1938</option>\n							<option value=\"1937\" {if bday_y == \"1937\"}selected=\"selected\"{/if}>1937</option>\n							<option value=\"1936\" {if bday_y == \"1936\"}selected=\"selected\"{/if}>1936</option>\n							<option value=\"1935\" {if bday_y == \"1935\"}selected=\"selected\"{/if}>1935</option>\n							<option value=\"1934\" {if bday_y == \"1934\"}selected=\"selected\"{/if}>1934</option>\n							<option value=\"1933\" {if bday_y == \"1933\"}selected=\"selected\"{/if}>1933</option>\n							<option value=\"1932\" {if bday_y == \"1932\"}selected=\"selected\"{/if}>1932</option>\n							<option value=\"1931\" {if bday_y == \"1931\"}selected=\"selected\"{/if}>1931</option>\n							<option value=\"1930\" {if bday_y == \"1930\"}selected=\"selected\"{/if}>1930</option>\n							<option value=\"1929\" {if bday_y == \"1929\"}selected=\"selected\"{/if}>1929</option>\n							<option value=\"1928\" {if bday_y == \"1928\"}selected=\"selected\"{/if}>1928</option>\n							<option value=\"1927\" {if bday_y == \"1927\"}selected=\"selected\"{/if}>1927</option>\n							<option value=\"1926\" {if bday_y == \"1926\"}selected=\"selected\"{/if}>1926</option>\n							<option value=\"1925\" {if bday_y == \"1925\"}selected=\"selected\"{/if}>1925</option>\n							<option value=\"1924\" {if bday_y == \"1924\"}selected=\"selected\"{/if}>1924</option>\n							<option value=\"1923\" {if bday_y == \"1923\"}selected=\"selected\"{/if}>1923</option>\n							<option value=\"1922\" {if bday_y == \"1922\"}selected=\"selected\"{/if}>1922</option>\n							<option value=\"1921\" {if bday_y == \"1921\"}selected=\"selected\"{/if}>1921</option>\n							<option value=\"1920\" {if bday_y == \"1920\"}selected=\"selected\"{/if}>1920</option>\n							<option value=\"1919\" {if bday_y == \"1919\"}selected=\"selected\"{/if}>1919</option>\n							<option value=\"1918\" {if bday_y == \"1918\"}selected=\"selected\"{/if}>1918</option>\n							<option value=\"1917\" {if bday_y == \"1917\"}selected=\"selected\"{/if}>1917</option>\n							<option value=\"1916\" {if bday_y == \"1916\"}selected=\"selected\"{/if}>1916</option>\n							<option value=\"1915\" {if bday_y == \"1915\"}selected=\"selected\"{/if}>1915</option>\n							<option value=\"1914\" {if bday_y == \"1914\"}selected=\"selected\"{/if}>1914</option>\n							<option value=\"1913\" {if bday_y == \"1913\"}selected=\"selected\"{/if}>1913</option>\n							<option value=\"1912\" {if bday_y == \"1912\"}selected=\"selected\"{/if}>1912</option>\n							<option value=\"1911\" {if bday_y == \"1911\"}selected=\"selected\"{/if}>1911</option>\n							<option value=\"1910\" {if bday_y == \"1910\"}selected=\"selected\"{/if}>1910</option>\n							<option value=\"1909\" {if bday_y == \"1909\"}selected=\"selected\"{/if}>1909</option>\n							<option value=\"1908\" {if bday_y == \"1908\"}selected=\"selected\"{/if}>1908</option>\n							<option value=\"1907\" {if bday_y == \"1907\"}selected=\"selected\"{/if}>1907</option>\n							<option value=\"1906\" {if bday_y == \"1906\"}selected=\"selected\"{/if}>1906</option>\n							<option value=\"1905\" {if bday_y == \"1905\"}selected=\"selected\"{/if}>1905</option>\n						</select>\n					</p>\n				</div>\n\n				<div class=\"col-sm-6\">\n					<p>\n						<label for=\"url\">URL</label>\n						<input type=\"text\" name=\"url\" id=\"url\" placeholder=\"Enter URL here\" value=\"{url}\" class=\"form-control\">\n					</p>\n					<p>\n						<label for=\"interests\">Interests</label>\n						<input type=\"text\" name=\"interests\" id=\"interests\" placeholder=\"Enter interests here\" value=\"{interests}\" class=\"form-control\">\n					</p>\n					<p>\n						<label for=\"bio\">Bio</label>\n						<textarea name=\"bio\" id=\"bio\" placeholder=\"Enter bio here\" class=\"form-control\" rows=\"5\">{bio}</textarea>\n					</p>						\n					<p>\n						<button type=\"submit\" class=\"btn btn-lg btn-success\">Update</button>\n					</p>\n				</div>\n				{/exp:user:edit}\n{/if} {!-- END - Make sure the user is logged in for updating account --}\n{if logged_out} {!-- START - If logged out, show the Login form --}\n				<div class=\"col-xs-12\">\n					{embed=\"user_inc/login\"}\n				</div>\n{/if} {!-- END - If logged out, show the Login form --}\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Update Profile\" page allows the currently logged in user to edit their basic profile information.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/edit\">User:Edit</a> to edit profile information.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(34,1,12,'update_settings','webpage','{embed=\"user_inc/index\" page_title=\"Update Settings\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>Update Settings</h1>\n				<p class=\"lead\">This page allows the currently logged in user to edit their account settings.</p>\n			</div>\n\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n				{if segment_3 == \"updated\"}\n					<div class=\"alert alert-success\" role=\"alert\">\n						<p class=\"lead\">Your account settings have been successfully updated!</p>\n					</div>\n				{/if}\n				</div>\n			</div>\n\n			<div class=\"row\">\n{if logged_in} {!-- START - Make sure the user is logged in for updating account --}\n				{exp:user:edit\n					return=\"user_main/update_settings/updated\"\n					error_page=\"user_inc/error_template\"\n				}\n				<div class=\"col-sm-6\">\n					<h4>Localization Settings</h4>\n					<p>\n						<label for=\"timezone\">Time Zone</label>\n						{user:timezone_menu\n							id=\"timezone_select_wrapper\"\n							timezone:id=\"timezone_id\"\n							timezone:class=\"form-control\"\n							country:id=\"country_id\"\n							country:class=\"form-control\"\n						}\n					</p>\n					<p>\n						<label for=\"time_format\">Time Formatting</label>\n						<select name=\"time_format\" id=\"time_format\" class=\"form-control\">\n							{time_formats}\n								<option value=\"{time_format_name}\" {selected}>{time_format_label}</option>\n							{/time_formats}\n						</select>\n					</p>\n					<p>\n						<label for=\"language\">Language</label>\n						<select name=\"language\" id=\"language\" class=\"form-control\">\n							{languages}\n								<option value=\"{language_name}\" {selected}>{language_label}</option>\n							{/languages}\n						</select>\n					</p>\n				</div>\n				<div class=\"col-sm-6\">\n					<h4>Email Notifications</h4>\n					<div class=\"checkbox\">\n						<label>\n							<input type=\"checkbox\" name=\"accept_admin_email\" value=\"y\" {if accept_admin_email == \"y\"}checked=\"checked\"{/if} />\n							Accept email from site administrators\n						</label>\n					</div>\n					<div class=\"checkbox\">\n						<label>\n							<input type=\"checkbox\" name=\"accept_user_email\" value=\"y\" {if accept_user_email == \"y\"}checked=\"checked\"{/if} />\n							Accept email from other members of this site\n						</label>\n					</div>\n					<div class=\"checkbox\">\n						<label>\n							<input type=\"checkbox\" name=\"notify_by_default\" value=\"y\" {if notify_by_default == \"y\"}checked=\"checked\"{/if} />\n							Enable email notifications by default when you post messages\n						</label>\n					</div>\n					<div class=\"checkbox\">\n						<label>\n							<input type=\"checkbox\" name=\"notify_of_pm\" value=\"y\" {if notify_of_pm == \"y\"}checked=\"checked\"{/if} />\n							Notify me via email when someone sends me a private message\n						</label>\n					</div>\n					<div class=\"checkbox\">\n						<label>\n							<input type=\"checkbox\" name=\"smart_notifications\" value=\"y\" {if smart_notifications == \"y\"}checked=\"checked\"{/if} />\n							Enable Smart Notifications\n						</label>\n					</div>\n					<p>\n						<button type=\"submit\" class=\"btn btn-lg btn-success\">Update</button>\n					</p>\n				</div>\n				{/exp:user:edit}\n{/if} {!-- END - Make sure the user is logged in for updating account --}\n{if logged_out} {!-- START - If logged out, show the Login form --}\n				<div class=\"col-xs-12\">\n					{embed=\"user_inc/login\"}\n				</div>\n{/if} {!-- END - If logged out, show the Login form --}\n      		</div>\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Update Settings\" page allows the currently logged in user to adjust account settings like notifications and localization.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/edit\">User:Edit</a> to edit profile information.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(35,1,12,'user_comments','webpage','{embed=\"user_inc/index\" page_title=\"{if logged_in_member_id == \"{segment_3}\"}My{if:else}Users\'{/if} Comments\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>\n					{if logged_in_member_id == \"{segment_3}\"}\n						My\n					{if:else}\n						Users\'\n					{/if}\n					Comments\n				</h1>\n				<p class=\"lead\">This page displays a list of comments authored by the given user.</p>\n			</div>\n\n		{if segment_3} {!-- Make sure there\'s a member ID in the URI --}\n			<div class=\"row\">\n				{exp:user:profile\n					member_id=\"{segment_3}\"\n					limit=\"1\"\n				}\n				<div class=\"col-sm-3\">\n					{embed=\"user_inc/profile_column\" member_id=\"{member_id}\"}\n				</div>\n				{/exp:user:profile}\n\n				<div class=\"col-sm-9\">\n					<h2 style=\"margin-bottom:20px;\">\n						{exp:user:profile member_id=\"{segment_3}\" limit=\"1\"}\n							{if logged_in_member_id == \"{segment_3}\"}\n								My\n							{if:else}\n								{screen_name}\'s\n							{/if}\n							Comments\n							<span class=\"label label-warning\">{total_comments}</span>\n						{/exp:user:profile}\n					</h2>\n					{exp:query\n						limit=\"10\"\n						paginate=\"bottom\"\n						sql=\"SELECT author_id, comment_date, comment, name, entry_id FROM exp_comments WHERE author_id = \'{segment_3}\' AND author_id !=\'0\' ORDER BY comment_date DESC \"\n					}\n						{if count == \"1\"}\n							<p>The following are comments posted by this user:</p>\n							<div class=\"list-group\">\n						{/if}\n						<a href=\"{path=\'articles/entry\'}/{embed=\"user_inc/comments_search_links\" entry_id=\"{entry_id}\"}/\" class=\"list-group-item\">\n							<span class=\"badge\">Posted in {embed=\"user_inc/comments_search_titles\" entry_id=\"{entry_id}\"} on {comment_date format=\"%F %j, %Y\"}</span>\n							{comment}\n						</a>\n						{if count == total_results}\n							</div>\n						{/if}\n					{if no_results}\n						<p>This user has not posted any comments.</p>\n					{/if}\n					{paginate}\n						<ul class=\"pagination pagination-md\">\n						{pagination_links}\n						{first_page}\n							<li><a href=\"{pagination_url}\">First</a></li>\n						{/first_page}\n						{previous_page}\n							<li><a href=\"{pagination_url}\">&larr; Previous</a></li>\n						{/previous_page}\n						{page}\n							<li{if current_page} class=\"active\"{/if}><a href=\"{pagination_url}\">{pagination_page_number}</a></li>\n						{/page}\n						{next_page}\n							<li><a href=\"{pagination_url}\">Next &raquo;</a></li>\n						{/next_page}\n						{last_page}\n							<li><a href=\"{pagination_url}\">Last</a></li>\n						{/last_page}\n						{/pagination_links}\n						</ul>\n					{/paginate}\n					{/exp:query}\n				</div>\n				{exp:user:profile\n					member_id=\"{segment_3}\"\n					limit=\"1\"\n				}\n				{if no_results}\n					<div class=\"col-xs-12\">\n						<div class=\"alert alert-danger\" role=\"alert\">\n							<p class=\"lead\"><strong>Error!</strong> The account you specified does not exist.</p>\n						</div>\n					</div>\n				{/if}\n				{/exp:user:profile}\n      		</div>\n		{if:else} {!-- Error if there\'s no member ID in the URI --}\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					<div class=\"alert alert-danger\" role=\"alert\">\n						<p class=\"lead\"><strong>Error!</strong> You have not specified a member ID.</p>\n					</div>\n				</div>\n			</div>\n		{/if}\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Comments\" page displays a list of comments authored by the given user.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/profile\">User:Profile</a> to show profile information.</li>\n					<li><a href=\"https://docs.expressionengine.com/v3/add-ons/query/index.html\">Query Module</a> to create and display a list of comments authored by the given user.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(36,1,12,'user_entries','webpage','{embed=\"user_inc/index\" page_title=\"{if logged_in_member_id == \"{segment_3}\"}My{if:else}Users\'{/if} Entries\"}\n	</head>\n\n	<body role=\"document\">\n\n{embed=\"user_inc/header\" page=\"account\"}\n\n		<div class=\"container\">\n\n			<div class=\"page-header\">\n				<h1>\n					{if logged_in_member_id == \"{segment_3}\"}\n						My\n					{if:else}\n						Users\'\n					{/if}\n					Entries\n				</h1>\n				<p class=\"lead\">This page displays a list of entries authored by the given user.</p>\n			</div>\n\n		{if segment_3} {!-- Make sure there\'s a member ID in the URI --}\n			<div class=\"row\">\n				{exp:user:profile\n					member_id=\"{segment_3}\"\n					limit=\"1\"\n				}\n				<div class=\"col-sm-3\">\n					{embed=\"user_inc/profile_column\" member_id=\"{member_id}\"}\n				</div>\n				{/exp:user:profile}\n\n				<div class=\"col-sm-9\">\n					<h2 style=\"margin-bottom:20px;\">\n						{exp:user:profile member_id=\"{segment_3}\" limit=\"1\"}\n							{if logged_in_member_id == \"{segment_3}\"}\n								My\n							{if:else}\n								{screen_name}\'s\n							{/if}\n							Entries\n							<span class=\"label label-warning\">{total_entries}</span>\n						{/exp:user:profile}\n					</h2>\n					{exp:channel:entries\n						author_id=\"{segment_3}\"\n						dynamic=\"no\"\n						limit=\"15\"\n						paginate=\"bottom\"\n					}\n						{if count == \"1\"}\n							<p>The following are entries posted by this user:</p>\n							<div class=\"list-group\">\n						{/if}\n							<a href=\"{comment_url_title_auto_path}\" class=\"list-group-item\">\n								<span class=\"badge\">{entry_date format=\"%F %j, %Y\"}</span>\n								{title}\n							</a>\n						{if count == total_results}</div>{/if}\n						{if no_results}\n							<p>This user has not posted any entries.</p>\n						{/if}\n						{paginate}\n							<ul class=\"pagination pagination-md\">\n							{pagination_links}\n							{first_page}\n								<li><a href=\"{pagination_url}\">First</a></li>\n							{/first_page}\n							{previous_page}\n								<li><a href=\"{pagination_url}\">&larr; Previous</a></li>\n							{/previous_page}\n							{page}\n								<li{if current_page} class=\"active\"{/if}><a href=\"{pagination_url}\">{pagination_page_number}</a></li>\n							{/page}\n							{next_page}\n								<li><a href=\"{pagination_url}\">Next &raquo;</a></li>\n							{/next_page}\n							{last_page}\n								<li><a href=\"{pagination_url}\">Last</a></li>\n							{/last_page}\n							{/pagination_links}\n							</ul>\n						{/paginate}\n					{/exp:channel:entries}\n				</div>\n				{exp:user:profile\n					member_id=\"{segment_3}\"\n					limit=\"1\"\n				}\n				{if no_results}\n					<div class=\"col-xs-12\">\n						<div class=\"alert alert-danger\" role=\"alert\">\n							<p class=\"lead\"><strong>Error!</strong> The account you specified does not exist.</p>\n						</div>\n					</div>\n				{/if}\n				{/exp:user:profile}\n      		</div>\n		{if:else} {!-- Error if there\'s no member ID in the URI --}\n			<div class=\"row\">\n				<div class=\"col-xs-12\">\n					<div class=\"alert alert-danger\" role=\"alert\">\n						<p class=\"lead\"><strong>Error!</strong> You have not specified a member ID.</p>\n					</div>\n				</div>\n			</div>\n		{/if}\n\n			<div class=\"well ss-pageinfo\">\n				<h2>About This Page</h2>\n				<p>The \"Entries\" page displays a list of entries authored by the given user.</p>\n				<p>It makes use of the following tags:</p>\n				<ul>\n					<li><a href=\"https://solspace.com/expressionengine/user/docs/profile\">User:Profile</a> to show profile information.</li>\n					<li><a href=\"https://docs.expressionengine.com/v3/add-ons/channel/channel_entries.html\">Channel:Entries</a> to show a list of entries authored by the given user.</li>\n				</ul>\n			</div>\n\n{embed=\"user_inc/footer\"}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(37,1,13,'index','webpage','',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(38,1,13,'key_invite','webpage','Hello,\n \nYou\'ve received an invitation to join the \"{site_name}\" website.\n \nPlease follow this link to complete your registration:\n{path=\"user_main/register\"}/key/{key}/\n \nThank you,\n \n{site_name}\n{site_url}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(39,1,13,'reset_password','webpage','Hi {name},\r\n\r\nTo reset your password, please go to the following page:\r\n\r\n{reset_url}\r\n\r\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\r\n\r\n{site_name}\r\n{site_url}',NULL,1457293478,0,'n',0,'','n','n','o',0,'n'),
	(40,1,2,'index_bak','webpage','{global_open}\n\n    <div id=\"main-wrap\"><div id=\"main\">\n        \n        <div class=\"row\" id=\"begin-register\"><div class=\"columns twelve text-center\">\n        	<h1>Register</h1>\n        	<div class=\"button large hollow\" id=\"artist\">Artist</div> <div class=\"button large hollow\" id=\"sponsor\">Sponsor</div>\n        </div></div>\n\n        <!-- === REGISTRATION FORMS === -->\n        <div class=\"row\"><div class=\"columns twelve\">\n\n			<!-- === REGISTER SPONSOR === -->\n			{sponsor_register}\n		\n\n			<!-- === REGISTER ARTIST === -->\n			{artist_register}\n\n		</div></div>\n        \n    </div></div>\n\n\n<script>\n	\n	$(\'.button#artist\').click(function() {\n		$(this).toggleClass(\'hollow\');\n		$(\'#artist-register\').toggleClass(\'hide\');\n		if ( !$(\'#sponsor-register\').hasClass(\'hide\') ) {\n			$(\'#sponsor-register\').addClass(\'hide\');\n			$(\'#sponsor\').addClass(\'hollow\');\n		}\n	});\n\n	$(\'.button#sponsor\').click(function() {\n		$(this).toggleClass(\'hollow\');\n		$(\'#sponsor-register\').toggleClass(\'hide\');\n		if ( !$(\'#artist-register\').hasClass(\'hide\') ) {\n			$(\'#artist-register\').addClass(\'hide\');\n			$(\'#artist\').addClass(\'hollow\');\n		}\n	});\n\n</script>\n\n{global_close}',NULL,1457886589,1,'n',0,'','n','n','o',0,'n'),
	(41,1,14,'index','webpage','',NULL,1457888100,0,'n',0,'','n','n','o',0,'n'),
	(42,1,14,'artist_edit_social','webpage','		<div id=\"main-wrap\"><div id=\"main\">\n\n			<!-- === REGISTER SPONSOR === -->\n			<div action=\"\" id=\"sponsor-register\">\n				<h1>Edit Social</h1>\n\n{exp:channel:entries channel=\"artists\" dynamic=\"no\" require_entry=\"yes\" search:author_id=\"{member_id}\" limit=\"1\"}\n    \n	{exp:channel:form channel=\"artists\" return=\"home/index\" dynamic=\"no\" url_title=\"{url_title}\" class=\"userform\"}\n					<div class=\"row\">\n						<fieldset class=\"fieldset\">\n							<legend>Profiles</legend>\n								<input type=\"hidden\" name=\"status\" id=\"status\" value=\"open\">\n\n								<div class=\"columns twelve\">\n									<label for=\"\">Facebook\n										<input type=\"text\" name=\"artist_facebook\" id=\"artist_facebook\" value=\"{artist_facebook}\">\n									</label>\n									<label for=\"\">Twitter\n										<input type=\"text\" name=\"artist_twitter\" id=\"artist_twitter\" value=\"{artist_twitter}\">\n									</label>\n									<label for=\"\">Instagram\n										<input type=\"text\" name=\"artist_instagram\" id=\"artist_instagram\" value=\"{artist_instagram}\">\n									</label>\n									<label for=\"\">Youtube\n										<input type=\"text\" name=\"artist_youtube\" id=\"artist_youtube\" value=\"{artist_youtube}\">\n									</label>\n									<label for=\"\">Soundcloud\n										<input type=\"text\" name=\"artist_soundcloud\" id=\"artist_soundcloud\" value=\"{artist_soundcloud}\">\n									</label>\n								</div>\n						</fieldset>\n					</div>\n\n					<div class=\"row\">\n						<button type=\"submit\" class=\"button\">Submit</button>\n					</div>\n					\n	{/exp:channel:form}\n\n{/exp:channel:entries}\n\n			</div>\n\n    	</div></div>',NULL,1457888143,1,'n',0,'1','n','y','o',0,'n');

/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_throttle`;

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_update_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_update_log`;

CREATE TABLE `exp_update_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_update_log` WRITE;
/*!40000 ALTER TABLE `exp_update_log` DISABLE KEYS */;

INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`)
VALUES
	(1,1456289420,'Smartforge::add_key failed. Table \'exp_comments\' does not exist.','Smartforge::add_key',120,'/Applications/MAMP/htdocs/personal/byg/_full/system/ee/EllisLab/Addons/comment/upd.comment.php');

/*!40000 ALTER TABLE `exp_update_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_upload_no_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_no_access`;

CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_upload_no_access` WRITE;
/*!40000 ALTER TABLE `exp_upload_no_access` DISABLE KEYS */;

INSERT INTO `exp_upload_no_access` (`upload_id`, `member_group`)
VALUES
	(6,5),
	(6,6),
	(6,7);

/*!40000 ALTER TABLE `exp_upload_no_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_upload_prefs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs`;

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `server_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_types` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'img',
  `default_modal_view` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`)
VALUES
	(1,1,'Avatars','/Applications/MAMP/htdocs/personal/byg/_full/images/avatars/','http://bygmusic/images/avatars/','img','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(2,1,'Default Avatars','/Applications/MAMP/htdocs/personal/byg/_full/images/avatars/default/','http://bygmusic/images/avatars/default/','img','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(3,1,'Member Photos','/Applications/MAMP/htdocs/personal/byg/_full/images/member_photos/','http://bygmusic/images/member_photos/','img','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(4,1,'Signature Attachments','/Applications/MAMP/htdocs/personal/byg/_full/images/signature_attachments/','http://bygmusic/images/signature_attachments/','img','list','30','80','480',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(5,1,'PM Attachments','/Applications/MAMP/htdocs/personal/byg/_full/images/pm_attachments/','http://bygmusic/images/pm_attachments/','img','list','250',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(6,1,'Artist Profile Photos','/Applications/MAMP/htdocs/personal/byg/_repo/byg/_img/artists/','http://bygmusic/_img/artists/','img','list','2','','',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,0);

/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_user_activation_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_activation_group`;

CREATE TABLE `exp_user_activation_group` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `member_id` (`member_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_user_activation_group` WRITE;
/*!40000 ALTER TABLE `exp_user_activation_group` DISABLE KEYS */;

INSERT INTO `exp_user_activation_group` (`member_id`, `group_id`)
VALUES
	(0,7),
	(0,8),
	(0,7),
	(0,7);

/*!40000 ALTER TABLE `exp_user_activation_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_user_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_authors`;

CREATE TABLE `exp_user_authors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `principal` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_cache`;

CREATE TABLE `exp_user_cache` (
  `cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_date` int(10) NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cache_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_category_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_category_posts`;

CREATE TABLE `exp_user_category_posts` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `member_id` (`member_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_keys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_keys`;

CREATE TABLE `exp_user_keys` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` int(10) NOT NULL DEFAULT '0',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hash` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`key_id`),
  KEY `email` (`email`),
  KEY `hash` (`hash`),
  KEY `author_id` (`author_id`),
  KEY `member_id` (`member_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_user_keys` WRITE;
/*!40000 ALTER TABLE `exp_user_keys` DISABLE KEYS */;

INSERT INTO `exp_user_keys` (`key_id`, `author_id`, `member_id`, `group_id`, `date`, `email`, `hash`)
VALUES
	(1,1,10,8,1457295021,'charted@gmail.com','yVgfTXsp'),
	(2,1,11,7,1457308641,'charted@gmail.com','mcMABwPd');

/*!40000 ALTER TABLE `exp_user_keys` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_user_member_channel_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_member_channel_entries`;

CREATE TABLE `exp_user_member_channel_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_params
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_params`;

CREATE TABLE `exp_user_params` (
  `params_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_date` int(10) NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`params_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_user_params` WRITE;
/*!40000 ALTER TABLE `exp_user_params` DISABLE KEYS */;

INSERT INTO `exp_user_params` (`params_id`, `hash`, `entry_date`, `data`)
VALUES
	(405,'',1457883904,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(406,'',1457883975,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(407,'',1457883983,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(408,'',1457884195,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(409,'',1457884234,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(410,'',1457884311,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(411,'',1457884363,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(412,'',1457884366,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(413,'',1457884372,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(414,'',1457884822,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(415,'',1457884823,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(416,'',1457884922,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(417,'',1457884924,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(418,'',1457884924,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"artist_genre|artist_state|artist_reach|artist_fans_gender|artist_fans_age|\",\"username\":\"theory@gmail.com\",\"return\":\"home\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(419,'',1457884947,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(420,'',1457884950,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(421,'',1457884950,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"artist_genre|artist_state|artist_reach|artist_fans_gender|artist_fans_age|\",\"username\":\"theory@gmail.com\",\"return\":\"home\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(422,'',1457885120,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(423,'',1457885191,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(424,'',1457885199,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(425,'',1457885219,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(426,'',1457885333,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(427,'',1457885450,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(428,'',1457885520,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(429,'',1457885522,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(430,'',1457885565,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(431,'',1457885575,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(432,'',1457885678,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(433,'',1457885741,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(434,'',1457885912,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(435,'',1457885929,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(436,'',1457885983,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(437,'',1457886005,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(438,'',1457886034,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(439,'',1457886056,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(440,'',1457886115,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(441,'',1457886115,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"\",\"username\":\"theory@gmail.com\",\"return\":\"home\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(442,'',1457886120,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(443,'',1457886120,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"artist_genre|artist_state|artist_reach|artist_fans_gender|artist_fans_age|\",\"username\":\"theory@gmail.com\",\"return\":\"home\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(444,'',1457886152,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(445,'',1457886157,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(446,'',1457888202,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(447,'',1457888239,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}'),
	(448,'',1457888935,'{\"use_channel_sync\":false,\"member_id\":3,\"checks\":\"\",\"custom_checks\":\"sponsor_industry_category|sponsor_company_size|\",\"username\":\"theory@gmail.com\",\"return\":\"edit\\/index\",\"username_override\":\"\",\"exclude_username\":\"\",\"required\":\"\",\"group_id\":\"\",\"password_required\":\"\",\"secure_action\":\"no\",\"screen_name_password_required\":\"y\",\"user_assigned_roles\":\"n\",\"assign_roles\":[]}');

/*!40000 ALTER TABLE `exp_user_params` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_user_preferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_preferences`;

CREATE TABLE `exp_user_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preference_value` text COLLATE utf8_unicode_ci,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`preference_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_user_preferences` WRITE;
/*!40000 ALTER TABLE `exp_user_preferences` DISABLE KEYS */;

INSERT INTO `exp_user_preferences` (`preference_id`, `preference_name`, `preference_value`, `site_id`)
VALUES
	(1,'email_is_username','y',1),
	(2,'screen_name_override','',1),
	(3,'category_groups','1',1),
	(4,'welcome_email_subject','',1),
	(5,'welcome_email_content','',1),
	(6,'user_forgot_username_message','Hi {screen_name},\n\nPer your request, this email contains your username for {site_name} located at {site_url}.\n\nUsername: {username}',1),
	(7,'member_update_admin_notification_template','',1),
	(8,'member_update_admin_notification_emails','',1),
	(9,'key_expiration','7',1);

/*!40000 ALTER TABLE `exp_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_roles`;

CREATE TABLE `exp_user_roles` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_label` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_roles_assigned
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_roles_assigned`;

CREATE TABLE `exp_user_roles_assigned` (
  `assigned_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content_type` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'member',
  PRIMARY KEY (`assigned_id`),
  KEY `content_id` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_roles_entry_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_roles_entry_permissions`;

CREATE TABLE `exp_user_roles_entry_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `set_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_roles_inherits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_roles_inherits`;

CREATE TABLE `exp_user_roles_inherits` (
  `inherits_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inheriting_role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_role_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`inherits_id`),
  KEY `from_role_id` (`from_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_roles_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_roles_permissions`;

CREATE TABLE `exp_user_roles_permissions` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_label` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_roles_permissions_assigned
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_roles_permissions_assigned`;

CREATE TABLE `exp_user_roles_permissions_assigned` (
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `permission_id` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_search`;

CREATE TABLE `exp_user_search` (
  `search_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `search_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categories` text COLLATE utf8_unicode_ci,
  `member_ids` text COLLATE utf8_unicode_ci,
  `fields` text COLLATE utf8_unicode_ci,
  `cfields` text COLLATE utf8_unicode_ci,
  `query` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table exp_user_welcome_email_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_user_welcome_email_list`;

CREATE TABLE `exp_user_welcome_email_list` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_sent` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `exp_user_welcome_email_list` WRITE;
/*!40000 ALTER TABLE `exp_user_welcome_email_list` DISABLE KEYS */;

INSERT INTO `exp_user_welcome_email_list` (`member_id`, `group_id`, `email_sent`)
VALUES
	(0,4,'n'),
	(0,4,'n'),
	(0,4,'n'),
	(0,4,'n'),
	(0,4,'n'),
	(0,4,'n');

/*!40000 ALTER TABLE `exp_user_welcome_email_list` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
