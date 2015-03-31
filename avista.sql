-- MySQL dump 10.13  Distrib 5.5.35, for Linux (x86_64)
--
-- Host: localhost    Database: avista
-- ------------------------------------------------------
-- Server version	5.5.35

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
-- Table structure for table `engine4_api`
--

DROP TABLE IF EXISTS `engine4_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_api`
--

LOCK TABLES `engine4_api` WRITE;
/*!40000 ALTER TABLE `engine4_api` DISABLE KEYS */;
INSERT INTO `engine4_api` VALUES (3,'avst.admin','','','KvLg5KyzxOZ4B7UGtxdAiFmqgGNH28QIKqyUBb3KcKF40zlhQ4d2QUQ8DKFQ6jzsiCNFUYLHkZIRsKHTOw1OKkQuC3tnpRCpfVUZkJEe71ukmgFMdbExJLM4AxoecvkzrpdIeo3L6IEMl2p5NGquFN4aQfmMV8oWGiRp5ZTheu5U2cWhfklxdlzxAxn6z3LFlFqwdKZPBO4On3We1VzVUSj4o4hcOPBig6DWH0Raku1nIETLUndNaBAwr15tDQ70',1,'2015-03-17 12:35:51','2015-03-17 12:35:51');
/*!40000 ALTER TABLE `engine4_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_currency`
--

DROP TABLE IF EXISTS `engine4_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_currency`
--

LOCK TABLES `engine4_currency` WRITE;
/*!40000 ALTER TABLE `engine4_currency` DISABLE KEYS */;
INSERT INTO `engine4_currency` VALUES (1,'Pound Sterling','GBP','£','','2',0.61250001,1,'2014-09-25 14:40:00'),(2,'US Dollar','USD','$','','2',1.00000000,1,'2014-09-25 14:40:00'),(3,'Euro','EUR','','€','2',0.78460002,1,'2014-09-25 14:40:00');
/*!40000 ALTER TABLE `engine4_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_event`
--

DROP TABLE IF EXISTS `engine4_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_event`
--

LOCK TABLES `engine4_event` WRITE;
/*!40000 ALTER TABLE `engine4_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_language`
--

DROP TABLE IF EXISTS `engine4_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_language`
--

LOCK TABLES `engine4_language` WRITE;
/*!40000 ALTER TABLE `engine4_language` DISABLE KEYS */;
INSERT INTO `engine4_language` VALUES (1,'English','en','en_US.UTF-8,en_US,en-gb,english','gb.png','english',1,1);
/*!40000 ALTER TABLE `engine4_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_merchant`
--

DROP TABLE IF EXISTS `engine4_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_merchant` (
  `merchant_id` int(11) NOT NULL AUTO_INCREMENT,
  `has_parent` tinyint(1) NOT NULL DEFAULT '0',
  `registration_number` varchar(20) NOT NULL,
  `legal_name` varchar(96) NOT NULL,
  `registred_dba` varchar(96) NOT NULL,
  `business_type_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `incorporation_date` date NOT NULL DEFAULT '0000-00-00',
  `vat_number` varchar(16) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_merchant`
--

LOCK TABLES `engine4_merchant` WRITE;
/*!40000 ALTER TABLE `engine4_merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_setting`
--

DROP TABLE IF EXISTS `engine4_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_setting`
--

LOCK TABLES `engine4_setting` WRITE;
/*!40000 ALTER TABLE `engine4_setting` DISABLE KEYS */;
INSERT INTO `engine4_setting` VALUES (13,0,'config','config_secure','0',0),(14,0,'config','config_error_filename','error.log',0),(15,0,'config','config_error_display','1',0),(16,0,'config','config_error_log','0',0),(17,0,'config','config_admin_language','en',0),(18,0,'config','config_limit_admin','20',0);
/*!40000 ALTER TABLE `engine4_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user`
--

DROP TABLE IF EXISTS `engine4_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user`
--

LOCK TABLES `engine4_user` WRITE;
/*!40000 ALTER TABLE `engine4_user` DISABLE KEYS */;
INSERT INTO `engine4_user` VALUES (1,1,'admin','f67da967379085e2fba0f6e6aacdc92c5c66864c','4ec4e9e39','Ahmet','Goudenoglu','ahmet.gudenoglu@semitepayment.com','catalog/chris_palmer_profile_11.jpg','','127.0.0.1',1,'2014-10-27 12:03:39');
/*!40000 ALTER TABLE `engine4_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_group`
--

DROP TABLE IF EXISTS `engine4_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_group`
--

LOCK TABLES `engine4_user_group` WRITE;
/*!40000 ALTER TABLE `engine4_user_group` DISABLE KEYS */;
INSERT INTO `engine4_user_group` VALUES (1,'Administrator','a:2:{s:6:\"access\";a:6:{i:0;s:16:\"account/merchant\";i:1;s:18:\"common/filemanager\";i:2;s:11:\"common/menu\";i:3;s:8:\"user/api\";i:4;s:9:\"user/user\";i:5;s:20:\"user/user_permission\";}s:6:\"modify\";a:6:{i:0;s:16:\"account/merchant\";i:1;s:18:\"common/filemanager\";i:2;s:11:\"common/menu\";i:3;s:8:\"user/api\";i:4;s:9:\"user/user\";i:5;s:20:\"user/user_permission\";}}'),(10,'Demonstration','');
/*!40000 ALTER TABLE `engine4_user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-31 14:29:04
