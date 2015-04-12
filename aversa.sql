-- MySQL dump 10.14  Distrib 5.5.41-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: aversa
-- ------------------------------------------------------
-- Server version	5.5.41-MariaDB

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
-- Table structure for table `engine4_application`
--

DROP TABLE IF EXISTS `engine4_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_application` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_application`
--

LOCK TABLES `engine4_application` WRITE;
/*!40000 ALTER TABLE `engine4_application` DISABLE KEYS */;
INSERT INTO `engine4_application` VALUES (3,'H.I.F. Invest Holding Ltd.','http://portal.hifholding.com/','http://portal.hifholding.com/');
/*!40000 ALTER TABLE `engine4_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_bank`
--

DROP TABLE IF EXISTS `engine4_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `bank` varchar(45) COLLATE utf8_bin NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `currency_code` varchar(3) COLLATE utf8_bin NOT NULL,
  `account_number` varchar(32) COLLATE utf8_bin NOT NULL,
  `swift` varchar(16) COLLATE utf8_bin NOT NULL,
  `routing` varchar(16) COLLATE utf8_bin NOT NULL,
  `iban` varchar(45) COLLATE utf8_bin NOT NULL,
  `sort_code` varchar(10) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `officer_name` varchar(96) COLLATE utf8_bin NOT NULL,
  `officer_telephone` varchar(32) COLLATE utf8_bin NOT NULL,
  `officer_email` varchar(96) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`bank_id`,`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_bank`
--

LOCK TABLES `engine4_bank` WRITE;
/*!40000 ALTER TABLE `engine4_bank` DISABLE KEYS */;
INSERT INTO `engine4_bank` VALUES (49,164169,'TEST BANK',215,0,'EUR','1234566','TGBATRIS','','TR51636363636','',1,'','','');
/*!40000 ALTER TABLE `engine4_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_country`
--

DROP TABLE IF EXISTS `engine4_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_country`
--

LOCK TABLES `engine4_country` WRITE;
/*!40000 ALTER TABLE `engine4_country` DISABLE KEYS */;
INSERT INTO `engine4_country` VALUES (1,'Afghanistan','AF','AFG','',0,1),(2,'Albania','AL','ALB','',0,1),(3,'Algeria','DZ','DZA','',0,1),(4,'American Samoa','AS','ASM','',0,1),(5,'Andorra','AD','AND','',0,1),(6,'Angola','AO','AGO','',0,1),(7,'Anguilla','AI','AIA','',0,1),(8,'Antarctica','AQ','ATA','',0,1),(9,'Antigua and Barbuda','AG','ATG','',0,1),(10,'Argentina','AR','ARG','',0,1),(11,'Armenia','AM','ARM','',0,1),(12,'Aruba','AW','ABW','',0,1),(13,'Australia','AU','AUS','',0,1),(14,'Austria','AT','AUT','',0,1),(15,'Azerbaijan','AZ','AZE','',0,1),(16,'Bahamas','BS','BHS','',0,1),(17,'Bahrain','BH','BHR','',0,1),(18,'Bangladesh','BD','BGD','',0,1),(19,'Barbados','BB','BRB','',0,1),(20,'Belarus','BY','BLR','',0,1),(21,'Belgium','BE','BEL','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',0,1),(22,'Belize','BZ','BLZ','',0,1),(23,'Benin','BJ','BEN','',0,1),(24,'Bermuda','BM','BMU','',0,1),(25,'Bhutan','BT','BTN','',0,1),(26,'Bolivia','BO','BOL','',0,1),(27,'Bosnia and Herzegovina','BA','BIH','',0,1),(28,'Botswana','BW','BWA','',0,1),(29,'Bouvet Island','BV','BVT','',0,1),(30,'Brazil','BR','BRA','',0,1),(31,'British Indian Ocean Territory','IO','IOT','',0,1),(32,'Brunei Darussalam','BN','BRN','',0,1),(33,'Bulgaria','BG','BGR','',0,1),(34,'Burkina Faso','BF','BFA','',0,1),(35,'Burundi','BI','BDI','',0,1),(36,'Cambodia','KH','KHM','',0,1),(37,'Cameroon','CM','CMR','',0,1),(38,'Canada','CA','CAN','',0,1),(39,'Cape Verde','CV','CPV','',0,1),(40,'Cayman Islands','KY','CYM','',0,1),(41,'Central African Republic','CF','CAF','',0,1),(42,'Chad','TD','TCD','',0,1),(43,'Chile','CL','CHL','',0,1),(44,'China','CN','CHN','',0,1),(45,'Christmas Island','CX','CXR','',0,1),(46,'Cocos (Keeling) Islands','CC','CCK','',0,1),(47,'Colombia','CO','COL','',0,1),(48,'Comoros','KM','COM','',0,1),(49,'Congo','CG','COG','',0,1),(50,'Cook Islands','CK','COK','',0,1),(51,'Costa Rica','CR','CRI','',0,1),(52,'Cote D\'Ivoire','CI','CIV','',0,1),(53,'Croatia','HR','HRV','',0,1),(54,'Cuba','CU','CUB','',0,1),(55,'Cyprus','CY','CYP','',0,1),(56,'Czech Republic','CZ','CZE','',0,1),(57,'Denmark','DK','DNK','',0,1),(58,'Djibouti','DJ','DJI','',0,1),(59,'Dominica','DM','DMA','',0,1),(60,'Dominican Republic','DO','DOM','',0,1),(61,'East Timor','TL','TLS','',0,1),(62,'Ecuador','EC','ECU','',0,1),(63,'Egypt','EG','EGY','',0,1),(64,'El Salvador','SV','SLV','',0,1),(65,'Equatorial Guinea','GQ','GNQ','',0,1),(66,'Eritrea','ER','ERI','',0,1),(67,'Estonia','EE','EST','',0,1),(68,'Ethiopia','ET','ETH','',0,1),(69,'Falkland Islands (Malvinas)','FK','FLK','',0,1),(70,'Faroe Islands','FO','FRO','',0,1),(71,'Fiji','FJ','FJI','',0,1),(72,'Finland','FI','FIN','',0,1),(74,'France, Metropolitan','FR','FRA','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),(75,'French Guiana','GF','GUF','',0,1),(76,'French Polynesia','PF','PYF','',0,1),(77,'French Southern Territories','TF','ATF','',0,1),(78,'Gabon','GA','GAB','',0,1),(79,'Gambia','GM','GMB','',0,1),(80,'Georgia','GE','GEO','',0,1),(81,'Germany','DE','DEU','{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),(82,'Ghana','GH','GHA','',0,1),(83,'Gibraltar','GI','GIB','',0,1),(84,'Greece','GR','GRC','',0,1),(85,'Greenland','GL','GRL','',0,1),(86,'Grenada','GD','GRD','',0,1),(87,'Guadeloupe','GP','GLP','',0,1),(88,'Guam','GU','GUM','',0,1),(89,'Guatemala','GT','GTM','',0,1),(90,'Guinea','GN','GIN','',0,1),(91,'Guinea-Bissau','GW','GNB','',0,1),(92,'Guyana','GY','GUY','',0,1),(93,'Haiti','HT','HTI','',0,1),(94,'Heard and Mc Donald Islands','HM','HMD','',0,1),(95,'Honduras','HN','HND','',0,1),(96,'Hong Kong','HK','HKG','',0,1),(97,'Hungary','HU','HUN','',0,1),(98,'Iceland','IS','ISL','',0,1),(99,'India','IN','IND','',0,1),(100,'Indonesia','ID','IDN','',0,1),(101,'Iran (Islamic Republic of)','IR','IRN','',0,1),(102,'Iraq','IQ','IRQ','',0,1),(103,'Ireland','IE','IRL','',0,1),(104,'Israel','IL','ISR','',0,1),(105,'Italy','IT','ITA','',0,1),(106,'Jamaica','JM','JAM','',0,1),(107,'Japan','JP','JPN','',0,1),(108,'Jordan','JO','JOR','',0,1),(109,'Kazakhstan','KZ','KAZ','',0,1),(110,'Kenya','KE','KEN','',0,1),(111,'Kiribati','KI','KIR','',0,1),(112,'North Korea','KP','PRK','',0,1),(113,'Korea, Republic of','KR','KOR','',0,1),(114,'Kuwait','KW','KWT','',0,1),(115,'Kyrgyzstan','KG','KGZ','',0,1),(116,'Lao People\'s Democratic Republic','LA','LAO','',0,1),(117,'Latvia','LV','LVA','',0,1),(118,'Lebanon','LB','LBN','',0,1),(119,'Lesotho','LS','LSO','',0,1),(120,'Liberia','LR','LBR','',0,1),(121,'Libyan Arab Jamahiriya','LY','LBY','',0,1),(122,'Liechtenstein','LI','LIE','',0,1),(123,'Lithuania','LT','LTU','',0,1),(124,'Luxembourg','LU','LUX','',0,1),(125,'Macau','MO','MAC','',0,1),(126,'FYROM','MK','MKD','',0,1),(127,'Madagascar','MG','MDG','',0,1),(128,'Malawi','MW','MWI','',0,1),(129,'Malaysia','MY','MYS','',0,1),(130,'Maldives','MV','MDV','',0,1),(131,'Mali','ML','MLI','',0,1),(132,'Malta','MT','MLT','',0,1),(133,'Marshall Islands','MH','MHL','',0,1),(134,'Martinique','MQ','MTQ','',0,1),(135,'Mauritania','MR','MRT','',0,1),(136,'Mauritius','MU','MUS','',0,1),(137,'Mayotte','YT','MYT','',0,1),(138,'Mexico','MX','MEX','',0,1),(139,'Micronesia, Federated States of','FM','FSM','',0,1),(140,'Moldova, Republic of','MD','MDA','',0,1),(141,'Monaco','MC','MCO','',0,1),(142,'Mongolia','MN','MNG','',0,1),(143,'Montserrat','MS','MSR','',0,1),(144,'Morocco','MA','MAR','',0,1),(145,'Mozambique','MZ','MOZ','',0,1),(146,'Myanmar','MM','MMR','',0,1),(147,'Namibia','NA','NAM','',0,1),(148,'Nauru','NR','NRU','',0,1),(149,'Nepal','NP','NPL','',0,1),(150,'Netherlands','NL','NLD','',0,1),(151,'Netherlands Antilles','AN','ANT','',0,1),(152,'New Caledonia','NC','NCL','',0,1),(153,'New Zealand','NZ','NZL','',0,1),(154,'Nicaragua','NI','NIC','',0,1),(155,'Niger','NE','NER','',0,1),(156,'Nigeria','NG','NGA','',0,1),(157,'Niue','NU','NIU','',0,1),(158,'Norfolk Island','NF','NFK','',0,1),(159,'Northern Mariana Islands','MP','MNP','',0,1),(160,'Norway','NO','NOR','',0,1),(161,'Oman','OM','OMN','',0,1),(162,'Pakistan','PK','PAK','',0,1),(163,'Palau','PW','PLW','',0,1),(164,'Panama','PA','PAN','',0,1),(165,'Papua New Guinea','PG','PNG','',0,1),(166,'Paraguay','PY','PRY','',0,1),(167,'Peru','PE','PER','',0,1),(168,'Philippines','PH','PHL','',0,1),(169,'Pitcairn','PN','PCN','',0,1),(170,'Poland','PL','POL','',0,1),(171,'Portugal','PT','PRT','',0,1),(172,'Puerto Rico','PR','PRI','',0,1),(173,'Qatar','QA','QAT','',0,1),(174,'Reunion','RE','REU','',0,1),(175,'Romania','RO','ROM','',0,1),(176,'Russian Federation','RU','RUS','',0,1),(177,'Rwanda','RW','RWA','',0,1),(178,'Saint Kitts and Nevis','KN','KNA','',0,1),(179,'Saint Lucia','LC','LCA','',0,1),(180,'Saint Vincent and the Grenadines','VC','VCT','',0,1),(181,'Samoa','WS','WSM','',0,1),(182,'San Marino','SM','SMR','',0,1),(183,'Sao Tome and Principe','ST','STP','',0,1),(184,'Saudi Arabia','SA','SAU','',0,1),(185,'Senegal','SN','SEN','',0,1),(186,'Seychelles','SC','SYC','',0,1),(187,'Sierra Leone','SL','SLE','',0,1),(188,'Singapore','SG','SGP','',0,1),(189,'Slovak Republic','SK','SVK','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}',0,1),(190,'Slovenia','SI','SVN','',0,1),(191,'Solomon Islands','SB','SLB','',0,1),(192,'Somalia','SO','SOM','',0,1),(193,'South Africa','ZA','ZAF','',0,1),(194,'South Georgia &amp; South Sandwich Islands','GS','SGS','',0,1),(195,'Spain','ES','ESP','',0,1),(196,'Sri Lanka','LK','LKA','',0,1),(197,'St. Helena','SH','SHN','',0,1),(198,'St. Pierre and Miquelon','PM','SPM','',0,1),(199,'Sudan','SD','SDN','',0,1),(200,'Suriname','SR','SUR','',0,1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM','',0,1),(202,'Swaziland','SZ','SWZ','',0,1),(203,'Sweden','SE','SWE','{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}',1,1),(204,'Switzerland','CH','CHE','',0,1),(205,'Syrian Arab Republic','SY','SYR','',0,1),(206,'Taiwan','TW','TWN','',0,1),(207,'Tajikistan','TJ','TJK','',0,1),(208,'Tanzania, United Republic of','TZ','TZA','',0,1),(209,'Thailand','TH','THA','',0,1),(210,'Togo','TG','TGO','',0,1),(211,'Tokelau','TK','TKL','',0,1),(212,'Tonga','TO','TON','',0,1),(213,'Trinidad and Tobago','TT','TTO','',0,1),(214,'Tunisia','TN','TUN','',0,1),(215,'Turkey','TR','TUR','',0,1),(216,'Turkmenistan','TM','TKM','',0,1),(217,'Turks and Caicos Islands','TC','TCA','',0,1),(218,'Tuvalu','TV','TUV','',0,1),(219,'Uganda','UG','UGA','',0,1),(220,'Ukraine','UA','UKR','',0,1),(221,'United Arab Emirates','AE','ARE','',0,1),(222,'United Kingdom','GB','GBR','',1,1),(223,'United States','US','USA','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}',0,1),(224,'United States Minor Outlying Islands','UM','UMI','',0,1),(225,'Uruguay','UY','URY','',0,1),(226,'Uzbekistan','UZ','UZB','',0,1),(227,'Vanuatu','VU','VUT','',0,1),(228,'Vatican City State (Holy See)','VA','VAT','',0,1),(229,'Venezuela','VE','VEN','',0,1),(230,'Viet Nam','VN','VNM','',0,1),(231,'Virgin Islands (British)','VG','VGB','',0,1),(232,'Virgin Islands (U.S.)','VI','VIR','',0,1),(233,'Wallis and Futuna Islands','WF','WLF','',0,1),(234,'Western Sahara','EH','ESH','',0,1),(235,'Yemen','YE','YEM','',0,1),(237,'Democratic Republic of Congo','CD','COD','',0,1),(238,'Zambia','ZM','ZMB','',0,1),(239,'Zimbabwe','ZW','ZWE','',0,1),(242,'Montenegro','ME','MNE','',0,1),(243,'Serbia','RS','SRB','',0,1),(244,'Aaland Islands','AX','ALA','',0,1),(245,'Bonaire, Sint Eustatius and Saba','BQ','BES','',0,1),(246,'Curacao','CW','CUW','',0,1),(247,'Palestinian Territory, Occupied','PS','PSE','',0,1),(248,'South Sudan','SS','SSD','',0,1),(249,'St. Barthelemy','BL','BLM','',0,1),(250,'St. Martin (French part)','MF','MAF','',0,1),(251,'Canary Islands','IC','ICA','',0,1),(252,'Ascension Island (British)','AC','ASC','',0,1),(253,'Kosovo, Republic of','XK','UNK','',0,1),(254,'Isle of Man','IM','IMN','',0,1),(255,'Tristan da Cunha','TA','SHN','',0,1),(256,'Guernsey','GG','GGY','',0,1),(257,'Jersey','JE','JEY','',0,1);
/*!40000 ALTER TABLE `engine4_country` ENABLE KEYS */;
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
INSERT INTO `engine4_currency` VALUES (3,'Euro','EUR','','€','2',0.91109997,1,'2015-04-03 17:32:13');
/*!40000 ALTER TABLE `engine4_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_customer`
--

DROP TABLE IF EXISTS `engine4_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_customer` (
  `customer_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `mobile` varchar(32) NOT NULL,
  `status` int(3) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `password` varchar(40) NOT NULL,
  `token` varchar(255) NOT NULL,
  `safe` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `two_way` tinyint(1) NOT NULL DEFAULT '0',
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(4128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(32) NOT NULL,
  `country_id` int(11) NOT NULL,
  `passport` varchar(45) NOT NULL,
  `issue_date` varchar(20) NOT NULL,
  `expiry_date` varchar(20) NOT NULL,
  `date_of_birth` varchar(20) NOT NULL,
  `place_of_birth` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_customer`
--

LOCK TABLES `engine4_customer` WRITE;
/*!40000 ALTER TABLE `engine4_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_customer_activity`
--

DROP TABLE IF EXISTS `engine4_customer_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_customer_activity`
--

LOCK TABLES `engine4_customer_activity` WRITE;
/*!40000 ALTER TABLE `engine4_customer_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_customer_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_customer_company`
--

DROP TABLE IF EXISTS `engine4_customer_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_customer_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `legal_name` varchar(96) NOT NULL,
  `registration_number` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `postcode` varchar(20) NOT NULL,
  `country_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `inc_date` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `vat` varchar(32) NOT NULL,
  `dba` varchar(96) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_customer_company`
--

LOCK TABLES `engine4_customer_company` WRITE;
/*!40000 ALTER TABLE `engine4_customer_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_customer_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_customer_document`
--

DROP TABLE IF EXISTS `engine4_customer_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_customer_document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(96) NOT NULL,
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`document_id`,`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_customer_document`
--

LOCK TABLES `engine4_customer_document` WRITE;
/*!40000 ALTER TABLE `engine4_customer_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_customer_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_customer_group`
--

DROP TABLE IF EXISTS `engine4_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_customer_group`
--

LOCK TABLES `engine4_customer_group` WRITE;
/*!40000 ALTER TABLE `engine4_customer_group` DISABLE KEYS */;
INSERT INTO `engine4_customer_group` VALUES (4,0,2);
/*!40000 ALTER TABLE `engine4_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_customer_group_description`
--

DROP TABLE IF EXISTS `engine4_customer_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_customer_group_description`
--

LOCK TABLES `engine4_customer_group_description` WRITE;
/*!40000 ALTER TABLE `engine4_customer_group_description` DISABLE KEYS */;
INSERT INTO `engine4_customer_group_description` VALUES (4,1,'Business','Business Account');
/*!40000 ALTER TABLE `engine4_customer_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_customer_ip`
--

DROP TABLE IF EXISTS `engine4_customer_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_customer_ip`
--

LOCK TABLES `engine4_customer_ip` WRITE;
/*!40000 ALTER TABLE `engine4_customer_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_customer_ip` ENABLE KEYS */;
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
-- Table structure for table `engine4_information`
--

DROP TABLE IF EXISTS `engine4_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_information`
--

LOCK TABLES `engine4_information` WRITE;
/*!40000 ALTER TABLE `engine4_information` DISABLE KEYS */;
INSERT INTO `engine4_information` VALUES (1,1,1,1),(2,1,2,1);
/*!40000 ALTER TABLE `engine4_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_information_description`
--

DROP TABLE IF EXISTS `engine4_information_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_information_description`
--

LOCK TABLES `engine4_information_description` WRITE;
/*!40000 ALTER TABLE `engine4_information_description` DISABLE KEYS */;
INSERT INTO `engine4_information_description` VALUES (1,1,'Privacy Policy','<p>Users of the H.I.F. Invest Holding, a legal company based in Ajeltake Road, Ajeltake Island Majuro in Marshall Islands with registration number MH-96960 must agree to comply with all of the following Privacy Policy</p>\n\n<p><br />\n1.0 Money Laundering Prevention</p>\n\n<p><br />\n1.1. You may find that you are asked to confirm your identity and other personal details.</p>\n\n<p>&nbsp;</p>\n\n<p>We have established special verification systems involving your bank account or e-banking payment to prove your identity.</p>\n\n<p>To safeguard the integrity of our payment system, your account may also be subject to periodic transaction limits depending on your user status.</p>\n\n<p>&nbsp;</p>\n\n<p>1.2. You could be asked to confirm your identity whether you are applying to be a new customer or have been a customer for some time. While our identity verification systems are designed to minimize any inconvenience for you, the verification process may take several days to complete.</p>\n\n<p>&nbsp;</p>\n\n<p>1.3. Crime and terrorism need cash. Criminals turn the \"dirty\" cash made from drug trafficking, smuggling, and robbery into clean money by using false identities or taking the names of innocent people - like you.</p>\n\n<p>Making sure that people are who they say they are is essential in the fight against crime and terrorism. This does not mean in any way that suspicion is falling on you. Any information about your identity is held confidentially and will help stop your identity being used falsely.</p>\n\n<p>&nbsp;</p>\n\n<p>1.4. All authorized organizations involved in financial services.</p>\n\n<p>All are united in their determination to stop the spread of financial crime as part of the international effort to crack down on financial crime - protecting us all against crime and terrorism.</p>\n\n<p>Your co-operation is vital to the successful fight against crime and terrorism.</p>\n\n<p>&nbsp;</p>\n\n<p>1.5. That we may be required:</p>\n\n<p>&nbsp;</p>\n\n<p>- We may be required to verify your identity and address.</p>\n\n<p>- We are required to keep full records of all transactions together with identification provided.</p>\n\n<p>- We are required to monitor any unusual or suspicious transactions of any size.</p>\n\n<p>- We have a legal obligation to report to the National Crime Agency (NCA) any suspicious transaction.</p>\n\n<p><br />\n2. Classified</p>\n\n<p><br />\nWe recognize the importance of protecting the information collected from our users and we take steps to maintain the security, integrity and privacy of any information in accordance with the privacy policy.</p>\n\n<p>We don\'t sell or rent your personal information to third parties.</p>\n\n<p>We fully cooperate with law enforcement agencies in identifying those who use our services for illegal activities.</p>\n\n<p>We reserve the right to release information about individuals who we believe to be in violation of our content guidelines, and to report to law enforcement agencies any activities which we reasonably believe to be unlawful.</p>\n\n<p>Under certain circumstances, we may be legally obligated to disclose information to the government or third parties under certain circumstances and you hereby authorize us to make such disclosures as permitted by applicable law.</p>\n\n<p>If you have any questions about this Privacy Policy, or would like to check, correct, update or delete your personal information, please contact us.</p>\n\n<p><br />\n3. Information We Collect</p>\n\n<p><br />\nWe may collect and process the following data about you:</p>\n\n<p>&nbsp;</p>\n\n<p>- Your full name, address, email address, telephone number, date of birth and bank details and any proof of your identity and/or address that we may request,</p>\n\n<p>- Details of any transactions you carry out through our Website using your&nbsp; Account and of the fulfillment of your requests,</p>\n\n<p>- Details of any bank account (including, but not limited to, account holder, account name, account number,),</p>\n\n<p>- Correspondence that you send us,</p>\n\n<p>- Calls that we make to you or you make to us,</p>\n\n<p>- Surveys that you complete,</p>\n\n<p>- Information collected through cookies,</p>\n\n<p>- Your IP address, log-in times, operating system and browser type,</p>\n\n<p>- Details of your visits to our Website including, but not limited to, traffic data, location data, weblogs and other communication data, whether this is required for our own billing purposes or otherwise and the resources that you access whilst visiting our Website.</p>\n\n<p><br />\n4. Information We Collect from Third Parties about You</p>\n\n<p><br />\nIn order to fulfill our legal obligations to prevent fraud and money laundering, we will obtain information about you from third party agencies, including your financial history, county court judgments and bankruptcies, from credit reference and fraud prevention agencies when you open an Account with us and at any time when we feel it is necessary to prevent fraud and minimize our financial risks.</p>\n\n<p><br />\n5. How We Use Your Information</p>\n\n<p><br />\nWe use information held about you in the following ways:</p>\n\n<p>&nbsp;</p>\n\n<p>- To operate and administer your account and to provide services that you have requested,</p>\n\n<p>- To carry out your instructions to make and receive e-banking payments and undertake transactions using our services.</p>\n\n<p>- To allow you to participate in interactive features of the Website,</p>\n\n<p>- To notify you about changes to our service(s),</p>\n\n<p>- To comply with financial services regulations including retention of financial information and transactions,</p>\n\n<p>- For customer service, including answering questions and responding to feedback and complaints,</p>\n\n<p>- To enhance the security of our and your service(s),</p>\n\n<p>- To ensure that content/web platform on our Website is presented in the most effective manner for you and for your computer,</p>\n\n<p>- To provide you with information, products or services that you request from us or which we feel may interest you.</p>\n\n<p><br />\n6. Storing Your Personal Data</p>\n\n<p><br />\n6.1. The data that we collect from you may be transferred to, and stored at, our secure serves outside the European Economic Area for the reasons set out below:</p>\n\n<p>&nbsp;</p>\n\n<p>- If this is necessary for providing you with the services you request</p>\n\n<p>- Where our groups of companies, some of which are based in Marshall Islands, store or process your data in accordance with our internal operational requirements and procedures in order to administer the services you require or in connection with anti-fraud measures,</p>\n\n<p>- Where you have consented to receive marketing material from our group companies,</p>\n\n<p>- Where our anti-fraud agencies, credit reference agencies and other service providers are based outside the EEA and require access to your data to perform their obligations to us and provide services to you,</p>\n\n<p>&nbsp;</p>\n\n<p>We have taken and will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this privacy policy no matter where it is located.</p>\n\n<p><br />\n7.&nbsp; Security</p>\n\n<p><br />\nWe are committed to ensuring that your information is secure. To prevent unauthorized access or disclosure of information we have physical, electronic and managerial procedures in place to keep your information safe.</p>\n\n<p>Once logged into your Account, all internet communication is secured using Secure Socket Layer (SSL) technology with high security certified encryption.</p>\n\n<p>However, this high level of protection can only be effective if you follow certain security practices yourself.</p>\n\n<p>You must never share your Account or login details with anyone.<br />\n&nbsp;<br />\nOnce we have received your information, we will use strict procedures and security features to try to prevent unauthorized access.</p>\n\n<p><br />\n8. Retention</p>\n\n<p><br />\nWe are by law required to retain certain records for a period of at least five years after closure of your Account which will include your personal data such as your name, contact details, customer number and transaction history etc.</p>\n\n<p>You can contact us in any question or clarification at <a href=\"mailto:manager@hifholding.com\">manager@hifholding.com</a></p>','','',''),(2,1,'Terms and Conditions','<p>Users of the H.I.F. Invest Holding, Ajeltake Road, Ajeltake Island Majuro in Marshall Islands with registration number MH-96960 &nbsp;must agree to comply with all of the following Terms and Conditions.</p>\n\n<p><br />\n<strong>1.0&nbsp;&nbsp; &nbsp;General Rules</strong></p>\n\n<p>&nbsp;</p>\n\n<p><strong>1.1</strong>&nbsp;&nbsp; &nbsp;This Registration Agreement constitutes the user\'s (you or your) agreement with the H.I.F. Holdings Company LTD (HIF), with respect to your use of the HIF website at <a href=\"http://www.hifholding.com/\">www.hifholding.com</a>&nbsp; (the Site), an Internet service of HIF. By submitting the Registration Form for the Site, you will be legally bound by the terms and conditions of this Agreement, and agree to comply with such terms and conditions in order to become and remain an authorized user of the Site. Individual users must be 18 years or older to register on the Site.</p>\n\n<p><strong>1.2</strong> &nbsp; &nbsp;HIF reserves the right, at its discretion, to change or modify any term or condition of this Registration Agreement at any time. All changes and modifications will be notified to you by being posted on the Site, or sent to you via email, and it is your responsibility to read these changes and modifications. They will come into effect immediately upon being posted, and you will be deemed to have accepted them if you access the Site after that time.</p>\n\n<p><strong>1.3</strong>&nbsp;&nbsp; &nbsp;If these terms or any future changes or modifications are unacceptable to you, you may terminate your registration in accordance with the Termination clause below. Your use of the Site now, or continued use following the notification of any changes or modifications of these terms and conditions, will constitute a binding acceptance by you of such changes or modifications.</p>\n\n<p><strong>1.4</strong>&nbsp;&nbsp; &nbsp;The rights and obligations concerning the use of the Site in accordance with this Registration Agreement are personal to you, and are not transferable to any other person or entity. Any purported assignment by you of any rights under this Registration Agreement shall be void and ineffective.</p>\n\n<p><strong>1.5</strong> &nbsp;&nbsp; No waiver by either party to this Agreement of any of its provisions, or any breach or default of the Agreement, shall be deemed to be a waiver of any preceding or subsequent breach or default.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>2.0&nbsp;&nbsp; &nbsp;Username and Password</strong></p>\n\n<p><br />\n<strong>2.1</strong>&nbsp;&nbsp; &nbsp;Upon registration, you will provide your email address, which will be your user name (Username) and a password (Password) of your own choice. You will be sent a Site activation link via email using the email address provided. You may not (i) use a name of another person with the intent to impersonate that person; (ii) use a name subject to the rights of any other person without authorization; or (iii) use a name that HIF, at its sole discretion, deems offensive. If HIF has reason to believe that any information you have supplied is not accurate it will terminate this Registration Agreement and you will cease to be an authorized user of the Site.<br />\n<strong>2.2</strong>&nbsp;&nbsp; &nbsp;You must provide the HIF with accurate, complete and updated information required by registration to the Site, including your Company’s full details, your legal name, Company’s address, telephone number and an e-mail address. You must notify HIF within 30 days of any changes in such data.</p>\n\n<p>Failure to do so will constitute a breach of this Registration Agreement, which may result in termination of your account, at HIF\' sole discretion.&nbsp;<br />\n<strong>2.3</strong>&nbsp; &nbsp;HIF does not want to receive confidential or proprietary information from you through our website; except that all specifically required registration information which you supply to HIF will be treated as strictly confidential. Please note that any other information or material sent to HIF will be deemed not to be confidential.<br />\n&nbsp;</p>\n\n<p><strong>3.0&nbsp;&nbsp; &nbsp;Security</strong></p>\n\n<p><br />\n<strong>3.1</strong>&nbsp;&nbsp;You will be solely responsible for protecting the confidentiality of your Username and Password, and solely liable for any harm resulting from disclosing or allowing disclosure of any Password.<br />\n<strong>3.2</strong>&nbsp;&nbsp;&nbsp;At all times you will be responsible for all use of the Site under your authorized account (Account), and you will be solely responsible for ensuring that any use of your Account complies fully with the terms of this Registration Agreement.<br />\n<strong>3.3</strong>&nbsp;&nbsp; &nbsp;You must notify HIF immediately of any known or suspected unauthorized use of your Username, Password or Account, or any known or suspected breach of security, including loss, theft, or unauthorized disclosure of your Password or Account information. Any fraudulent, abusive or otherwise illegal activity may be grounds for termination of your Account, at HIF sole discretion, and the matter may be referred to law enforcement agencies for appropriate action.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>4.0&nbsp;&nbsp; &nbsp;Use of the Site</strong></p>\n\n<p><br />\n<strong>4.1</strong>&nbsp;&nbsp; &nbsp;You are permitted to download or print extracts of the material on the Site for your personal use only, and for lawful purposes only, providing that you maintain all copyright and other notices contained in the material and agree to abide by all additional copyright notices, information, or restrictions contained in such material. None of the material on the Site may be used for any public use and no part of such material may be reproduced or stored in or transmitted to any other website.</p>\n\n<p>No material on the Site may be disseminated in any form, either electronic or non-electronic, or included in any retrieval system or Site without the prior written permission of the HIF.</p>\n\n<p>Any request for such permission shall be sent to Attention: HIF Holdings Manager, at xxxx@xxxxx.xx&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><strong>5.0&nbsp;&nbsp; &nbsp;Protected Rights</strong></p>\n\n<p><br />\n<strong>5.1</strong>&nbsp;&nbsp; &nbsp;Except as set forth in Paragraph 5.2, all text, graphics and other material on the Site is Copyright © 2015 H.I.F. Invest Holding, and you shall take no action which is inconsistent with HIF’ rights as owner of the rights in the Site.</p>\n\n<p>No material may be reproduced, modified, stored, transmitted, published, distributed, performed, displayed, sold or exploited in whole or in part, as a derivative e work, or in any form, language or by any media, electronic or otherwise, throughout the world, except as outlined below.<br />\n<strong>5.2</strong>&nbsp;&nbsp; &nbsp;The material relating to procurement opportunities from the HIF and its partners available on the Site is copyrighted by them. It may not be reproduced, stored, transmitted or photocopied in any form or by any means without the prior written consent of the respective Company.&nbsp;&nbsp; &nbsp;<br />\n<strong>5.3</strong>&nbsp;&nbsp; &nbsp;The name and logo of HIF are protected by law worldwide, and you are not permitted to use or reproduce, or allow anyone to use or reproduce this name or logo for any purpose. You are not permitted to use the name, emblem or official seal of the HIF, or any abbreviation thereof, for any purpose.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>6.0&nbsp;&nbsp; &nbsp;Equipment</strong></p>\n\n<p><br />\n<strong>6.1</strong>&nbsp;&nbsp; &nbsp;You will be solely responsible for obtaining, maintaining and meeting all costs associated with any telephone, computer hardware and software, modems, telecommunications connections, and/or other equipment and services which may be needed to access and use the Site.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>7.0&nbsp;&nbsp; &nbsp;Disclaimer</strong></p>\n\n<p><br />\n<strong>7.1</strong>&nbsp;&nbsp; &nbsp;You expressly acknowledge and agree that any and all use of the Site is at your sole risk neither the HIF, its affiliates, or any of their respective employees, agents, third-party content providers, or licensors warrant that access to and use of the Site will be free from interruptions or free from errors; nor do they make any warranty as to the results that may be obtained from use of the Site. You waive and discharge any and all claims against the HIF arising out of related access or lack thereof.<br />\n<strong>7.2</strong>&nbsp;&nbsp; &nbsp;You further expressly acknowledge and agree that information, text, graphics, and hyperlinks provided to you through the Site and located on other Sites throughout the combined global electronic networks known as the internet and the World Wide Web are provided solely as a resource and a convenience to you. Such hyperlinks to other Sites are not an endorsement by HIF.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>8.0&nbsp;&nbsp; &nbsp;Limitation of Liability</strong></p>\n\n<p><br />\n<strong>8.1</strong>&nbsp;&nbsp; &nbsp;Under no circumstances, including negligence, shall HIF, or any person involved in creating, producing or distributing the Site, be liable for any loss of business or profits, or for any direct, indirect, incidental, special or consequential damages that may result from any use of—or inability to use—the Site, even if HIF, was previously advised of the possibility of such damages, including— but not limited to—reliance by any subscriber on any information obtained by way of the Site, or that may result from mistakes, omissions, interruptions, deletion of files or E-mail, errors, defects, viruses, delays in operation or transmission, or any failure of performance, whether or not limited to natural disasters, communications failure, theft, destruction or unauthorized access to the HIF’ records, programs or services.<br />\nYou acknowledge and agree that the delivery system used for the Site (i.e., the Internet, the World Wide Web) is unpredictable and may, from time to time, impede access to the Site. You acknowledge and agree that HIF is in no way responsible whatsoever for any interference with your use of—or access to—the Site, and you expressly waive and forever discharge and release any and all claims against the HIF in connection therewith.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>9.0&nbsp;&nbsp; &nbsp;Indemnification</strong></p>\n\n<p><br />\n<strong>9.1</strong>&nbsp;&nbsp; &nbsp;By using this Site, you agree to defend, indemnify and hold harmless&nbsp;HIF, its affiliates, and their respective officials and employees from and against all claims, suits, demands and liability of any nature, including HIF’ costs and expenses, and attorneys\' fees, arising out of the use of the Site by you or anyone having gained access to the Site by use of your Username and Password.</p>\n\n<p>This provision shall extend to claims and liability arising out of the use of copyrighted material and other intellectual property by you or anyone having access to the material by means of your Account.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>10.0&nbsp;&nbsp; &nbsp;Disputes</strong></p>\n\n<p><br />\n&nbsp;The parties will use their best efforts to settle amicably any dispute, controversy or claim arising out of this Subscriber Agreement, or its breach, termination or invalidity. Any dispute, controversy or claim arising under—or pursuant to—this Registration Agreement shall be settled by an agreed mode of dispute resolution, including—but not limited to—arbitration, in accordance with the UNCITRAL Arbitration Rules then in effect. The arbitral tribunal shall have no authority to award punitive damages. The parties shall be bound by any arbitration award rendered as a result of such arbitration as the final adjudication of any such controversy, claim or dispute.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>11.0&nbsp;&nbsp; &nbsp;Termination of Registration Agreement</strong></p>\n\n<p><br />\n<strong>11.1</strong>&nbsp;&nbsp; &nbsp;This Registration Agreement will take effect when you submit the Registration Form and continue until either you or HIF terminate it, at which time you will cease to be an authorized user of the Site.<br />\n<strong>11.2</strong>&nbsp;&nbsp; &nbsp;You may terminate your Account at any time by sending an e-mail to XXXXX@XXXXX.COM.</p>\n\n<p>Upon termination, you will receive confirmation via e-mail that your request was received, and your access to the Site will be terminated.&nbsp;<br />\n<strong>11.3 </strong>&nbsp; &nbsp;HIF may, at its sole discretion, terminate or suspend your access to the Site for any reason, including, without limitation, any conduct which the HIF, at its sole discretion, believes is in breach of the Registration Agreement or is harmful to HIF’ interests.</p>\n\n<p><strong>11.4</strong>&nbsp;&nbsp; &nbsp;In the event of termination, clauses 2, 5, 7, 8, 9, 10 and 12 will remain binding on the parties.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>12.0&nbsp;&nbsp; &nbsp;Privileges and Immunities</strong></p>\n\n<p><br />\n&nbsp;Nothing in or relating to this Registration Agreement shall be deemed a waiver, express or implied, of any of the privileges and immunities of HIF.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>13.0&nbsp;&nbsp; &nbsp;Communications</strong></p>\n\n<p><br />\n<strong>13.1</strong> &nbsp; &nbsp;HIF reserves the right to send e-mails to subscribers for the purpose of informing them of changes or additions to the Site, or of any related services provided by the HIF, its affiliates, agents, third-party content providers, or licensors that it deems suitable for dissemination.<br />\n<strong>13.2</strong>&nbsp;&nbsp; &nbsp;You may serve a notice on HIF, for the purposes of this Registration Agreement, by sending it by e-mail to XXXX@XXXXX.XX.</p>\n\n<p>HIF may serve a notice on you by sending it to your e-mail address, or to the postal address appearing on your Registration Form. &nbsp;</p>\n\n<p>You are responsible for notifying HIF of any change to your e-mail or postal address.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>14.0 Money Laundering Prevention</strong><br />\n<br />\nWhat am I asked to do?<br />\n<br />\nYou may find that you are asked to confirm your identity and other personal details. We have established special verification systems involving your bank account or payment card to prove your identity. To safeguard the integrity of our payment system, your account may also be subject to periodic transaction limits depending on your user status.<br />\n<br />\nWhen?<br />\n<br />\nYou could be asked to confirm your identity whether you are applying to be a new customer or have been a customer for some time. While our identity verification systems are designed to minimize any inconvenience for you, the verification process may take several days to complete.<br />\n<br />\nWhy?<br />\n<br />\nCrime and terrorism need cash. Criminals turn the \"dirty\" cash made from drug trafficking, smuggling, and robbery into clean money by using false identities or taking the names of innocent people - like you. Making sure that people are who they say they are is essential in the fight against crime and terrorism. This does not mean in any way that suspicion is falling on you. Any information about your identity is held confidentially and will help stop your identity being used falsely.<br />\n<br />\nWho is involved?<br />\n<br />\nHM Government and all organizations involved in financial services. All are united in their determination to stop the spread of financial crime as part of the international effort to crack down on financial crime - protecting us all against crime and terrorism.<br />\n<br />\nYour co-operation is vital to the successful fight against crime and terrorism.<br />\n<br />\nWhat law requires?<br />\n<br />\n- We may be required to verify your identity and address.<br />\n- We are required to keep full records of all transactions together with identification provided.<br />\n- We are required to monitor any unusual or suspicious transactions of any size.<br />\n- We have a legal obligation to report to the National Crime Agency (NCA) any suspicious transaction.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>15. PRIVACY POLICY</strong></p>\n\n<p>&nbsp;</p>\n\n<p>We recognize the importance of protecting the information collected from our users and we take steps to maintain the security, integrity and privacy of any information in accordance with the privacy policy.<br />\n<br />\nWe don\'t sell or rent your personal information to third parties for their marketing purposes without your explicit consent.<br />\n<br />\nWe fully cooperate with law enforcement agencies in identifying those who use our services for illegal activities.<br />\n<br />\nWe reserve the right to release information about individuals who we believe to be in violation of our content guidelines, and to report to law enforcement agencies any activities which we reasonably believe to be unlawful.<br />\n<br />\nUnder certain circumstances, we may be legally obligated to disclose information to the government or third parties under certain circumstances and you hereby authorize us to make such disclosures as permitted by applicable law.<br />\n<br />\nIf you have any questions about this Privacy Policy, or would like to check, correct, update or delete your personal information, please contact us.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>16. Information We Collect</strong><br />\n<br />\nWe may collect and process the following data about you:<br />\n<br />\n- Your full name, address, email address, telephone number, date of birth and bank details and any proof of your identity and/or address that we may request,<br />\n<br />\n- Details of any transactions you carry out through our Website using your&nbsp; Account and of the fulfillment of your requests,<br />\n<br />\n- Details of any bank account (including, but not limited to, account holder, account name, account number,),<br />\n<br />\n- Correspondence that you send us,&nbsp;<br />\n<br />\n- Calls that we make to you or you make to us,&nbsp;<br />\n<br />\n- Surveys that you complete,&nbsp;<br />\n<br />\n- Information collected through cookies,&nbsp;<br />\n<br />\n- Your IP address, log-in times, operating system and browser type,&nbsp;<br />\n<br />\n- Details of your visits to our Website including, but not limited to, traffic data, location data, weblogs and other communication data, whether this is required for our own billing purposes or otherwise and the resources that you access whilst visiting our Website.</p>\n\n<p><br />\n<strong>17. &nbsp;Information We Collect from Third Parties about You</strong><br />\n<br />\nIn order to fulfill our legal obligations to prevent fraud and money laundering, we will obtain information about you from third party agencies, including your financial history, county court judgments and bankruptcies, from credit reference and fraud prevention agencies when you open an Account with us and at any time when we feel it is necessary to prevent fraud and minimize our financial risks.&nbsp;<br />\n<br />\n<strong>18. How We Use Your Information</strong><br />\n<br />\nWe use information held about you in the following ways:<br />\n<br />\n- To operate and administer your account and to provide services that you have requested,<br />\n<br />\n- To carry out your instructions to make and receive payments and undertake transactions using our services.<br />\n<br />\n- To allow you to participate in interactive features of the Website,<br />\n<br />\n- To notify you about changes to our service(s),<br />\n<br />\n- To comply with financial services regulations including retention of financial information and transactions,<br />\n<br />\n- For customer service, including answering questions and responding to feedback and complaints,<br />\n<br />\n- To enhance the security of our and your service(s),<br />\n<br />\n- To ensure that content/web platform on our Website is presented in the most effective manner for you and for your computer,&nbsp;<br />\n<br />\n- To provide you with information, products or services that you request from us or which we feel may interest you.</p>\n\n<p><br />\n<br />\n<strong>19. Storing Your Personal Data</strong><br />\n<br />\n<strong>19.1.</strong> Where is it Stored?<br />\n<br />\nThe data that we collect from you may be transferred to, and stored at, destinations outside the European Economic Area (\"EEA\") for the reasons set out below:<br />\n<br />\n- If this is necessary for providing you with the services you request</p>\n\n<p><br />\n- Where our group of companies, some of which are based in Marshall Islands, store or process your data in accordance with our internal operational requirements and procedures in order to administer the services you require or in connection with anti-fraud measures,<br />\n<br />\n- Where you have consented to receive marketing material from our group companies,<br />\n<br />\n- Where our anti-fraud agencies, credit reference agencies and other service providers are based outside the EEA and require access to your data to perform their obligations to us and provide services to you,<br />\n<br />\nWe have taken and will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this privacy policy no matter where it is located.<br />\n<br />\n<strong>20. Security</strong><br />\n<br />\nWe are committed to ensuring that your information is secure. To prevent unauthorized access or disclosure of information we have physical, electronic and managerial procedures in place to keep your information safe.&nbsp;<br />\n<br />\nOnce logged into your Account, all internet communication is secured using Secure Socket Layer (SSL) technology with high security certified encryption.<br />\n<br />\nHowever, this high level of protection can only be effective if you follow certain security practices yourself.&nbsp;<br />\n<br />\nYou must never share your Account or login details with anyone.&nbsp;<br />\n<br />\nUnfortunately, the transmission of information via the internet is not completely secure. Although we will do our best to protect your personal data, we cannot guarantee the security of your data transmitted to our site. Any transmission is at your own risk.&nbsp;<br />\nOnce we have received your information, we will use strict procedures and security features to try to prevent unauthorized access.<br />\n<br />\n<strong>21. Retention</strong><br />\n<br />\nWe are by law required to retain certain records for a period of at least five years after closure of your Account which will include your personal data such as your name, contact details, customer number and transaction history etc.&nbsp;<br />\n<br />\n<br />\n&nbsp;</p>','','','');
/*!40000 ALTER TABLE `engine4_information_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_information_to_application`
--

DROP TABLE IF EXISTS `engine4_information_to_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_information_to_application` (
  `information_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`application_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_information_to_application`
--

LOCK TABLES `engine4_information_to_application` WRITE;
/*!40000 ALTER TABLE `engine4_information_to_application` DISABLE KEYS */;
INSERT INTO `engine4_information_to_application` VALUES (1,0),(1,3),(2,0),(2,3);
/*!40000 ALTER TABLE `engine4_information_to_application` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
-- Table structure for table `engine4_order`
--

DROP TABLE IF EXISTS `engine4_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_order` (
  `order_id` int(11) NOT NULL,
  `contract_no` varchar(96) NOT NULL,
  `invoice_no` varchar(96) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `application_id` int(11) NOT NULL DEFAULT '0',
  `application_name` varchar(64) NOT NULL,
  `application_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `comment` text NOT NULL,
  `request` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `commission` decimal(15,4) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `settlement` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `issuer_name` varchar(64) NOT NULL,
  `payment_description` text NOT NULL,
  `total_amount` int(11) NOT NULL,
  `down_payment` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_order`
--

LOCK TABLES `engine4_order` WRITE;
/*!40000 ALTER TABLE `engine4_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_order_product`
--

DROP TABLE IF EXISTS `engine4_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `down` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `other` varchar(255) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_order_product`
--

LOCK TABLES `engine4_order_product` WRITE;
/*!40000 ALTER TABLE `engine4_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_order_status`
--

DROP TABLE IF EXISTS `engine4_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_order_status`
--

LOCK TABLES `engine4_order_status` WRITE;
/*!40000 ALTER TABLE `engine4_order_status` DISABLE KEYS */;
INSERT INTO `engine4_order_status` VALUES (2,1,'Processing'),(3,1,'Shipped'),(7,1,'Canceled'),(5,1,'Complete'),(8,1,'Denied'),(9,1,'Canceled Reversal'),(10,1,'Failed'),(11,1,'Refunded'),(12,1,'Reversed'),(13,1,'Chargeback'),(1,1,'Pending'),(16,1,'Voided'),(15,1,'Processed'),(14,1,'Expired'),(17,1,'Verified');
/*!40000 ALTER TABLE `engine4_order_status` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=2312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_setting`
--

LOCK TABLES `engine4_setting` WRITE;
/*!40000 ALTER TABLE `engine4_setting` DISABLE KEYS */;
INSERT INTO `engine4_setting` VALUES (2244,3,'config','config_logo','catalog/logo2.png',0),(2245,3,'config','config_icon','',0),(2246,3,'config','config_secure','0',0),(2243,3,'config','config_account_id','1',0),(2247,0,'config','config_name','H.I.F. Invest Holding Ltd.',0),(2248,0,'config','config_owner','H.I.F. Invest Holding Ltd.',0),(2221,3,'config','config_url','http://portal.hifholding.com/',0),(2250,0,'config','config_geocode','AU',0),(2251,0,'config','config_email','office@hifholding.com',0),(2225,3,'config','config_address','Collmanngasse 3/2/34\r\nA-1100',0),(2223,3,'config','config_name','H.I.F. Invest Holding Ltd.',0),(2224,3,'config','config_owner','H.I.F. Invest Holding Ltd.',0),(2249,0,'config','config_address','Collmanngasse 3/2/34\r\nA-1100',0),(2222,3,'config','config_ssl','http://portal.hifholding.com/',0),(2252,0,'config','config_telephone','+43 644 48 60 653',0),(2254,0,'config','config_image','catalog/Avista/avclogo.png',0),(2290,0,'config','config_ftp_status','0',0),(2291,0,'config','config_mail','a:7:{s:8:\"protocol\";s:4:\"mail\";s:9:\"parameter\";s:0:\"\";s:13:\"smtp_hostname\";s:0:\"\";s:13:\"smtp_username\";s:0:\"\";s:13:\"smtp_password\";s:0:\"\";s:9:\"smtp_port\";s:2:\"25\";s:12:\"smtp_timeout\";s:1:\"5\";}',1),(2289,0,'config','config_ftp_root','',0),(2238,3,'config','config_product_limit','15',0),(2237,3,'config','config_currency','EUR',0),(2236,3,'config','config_language','en',0),(2235,3,'config','config_zone_id','207',0),(2233,3,'config','config_template','hif',0),(2234,3,'config','config_country_id','14',0),(2232,3,'config','config_meta_keyword','',0),(2231,3,'config','config_meta_description','',0),(2230,3,'config','config_meta_title','H.I.F. Invest Holding Ltd.',0),(2229,3,'config','config_fax','+43 1 28 10 602',0),(2227,3,'config','config_email','office@hifholding.com',0),(2287,0,'config','config_ftp_username','',0),(2288,0,'config','config_ftp_password','',0),(2228,3,'config','config_telephone','++43 644 48 60 653',0),(2286,0,'config','config_ftp_port','21',0),(2226,3,'config','config_geocode','AU',0),(2285,0,'config','config_ftp_hostname','map.hifholding.com',0),(2284,0,'config','config_icon','catalog/Avista/avclogo.png',0),(2282,0,'config','config_order_mail','1',0),(2283,0,'config','config_logo','catalog/logo2.png',0),(2281,0,'config','config_complete_status','a:3:{i:0;s:1:\"5\";i:1;s:2:\"15\";i:2;s:2:\"17\";}',1),(2280,0,'config','config_processing_status','a:1:{i:0;s:1:\"2\";}',1),(2279,0,'config','config_order_status_id','1',0),(2276,0,'config','config_cart_weight','0',0),(2277,0,'config','config_checkout_guest','0',0),(2278,0,'config','config_checkout_id','1',0),(2275,0,'config','config_api_id','0',0),(2274,0,'config','config_invoice_prefix','HIF-2015-00',0),(2272,0,'config','config_account_id','1',0),(2273,0,'config','config_account_mail','1',0),(2271,0,'config','config_customer_price','0',0),(2270,0,'config','config_customer_group_display','a:1:{i:0;s:1:\"4\";}',1),(2269,0,'config','config_customer_group_id','4',0),(2268,0,'config','config_customer_online','0',0),(2267,0,'config','config_limit_admin','20',0),(2266,0,'config','config_currency_auto','1',0),(2265,0,'config','config_currency','EUR',0),(2264,0,'config','config_admin_language','en',0),(2263,0,'config','config_language','en',0),(2262,0,'config','config_zone_id','207',0),(2261,0,'config','config_country_id','14',0),(2260,0,'config','config_template','hif',0),(2258,0,'config','config_meta_description','',0),(2259,0,'config','config_meta_keyword','',0),(2257,0,'config','config_meta_title','H.I.F. Invest Holding Ltd.',0),(2256,0,'config','config_comment','',0),(2255,0,'config','config_open','',0),(2253,0,'config','config_fax','+43 1 28 10 602',0),(2299,0,'config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',0),(2298,0,'config','config_shared','0',0),(2297,0,'config','config_secure','0',0),(2296,0,'config','config_fraud_status_id','7',0),(2295,0,'config','config_fraud_score','',0),(2294,0,'config','config_fraud_key','',0),(2293,0,'config','config_fraud_detection','0',0),(2292,0,'config','config_mail_alert','',0),(2303,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet',0),(2302,0,'config','config_file_ext_allowed','txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods',0),(2301,0,'config','config_file_max_size','300000',0),(2300,0,'config','config_seo_url','0',0),(2308,0,'config','config_error_display','1',0),(2307,0,'config','config_compression','',0),(2306,0,'config','config_encryption','f42898ec41938bd417096625223dc4fa',0),(2305,0,'config','config_password','0',0),(2304,0,'config','config_maintenance','0',0),(2311,0,'config','config_google_analytics','',0),(2310,0,'config','config_error_filename','error.log',0),(2309,0,'config','config_error_log','0',0),(2239,3,'config','config_product_description_length','100',0),(2241,3,'config','config_customer_group_display','a:1:{i:0;s:1:\"4\";}',1),(2240,3,'config','config_customer_group_id','4',0),(2242,3,'config','config_customer_price','0',0),(1008,1,'config','config_image_location_height','180',0),(1009,1,'config','config_secure','0',0);
/*!40000 ALTER TABLE `engine4_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-12 20:25:25
