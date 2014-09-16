-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hadly
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `device_quota` int(11) DEFAULT NULL,
  `device_used` int(11) DEFAULT NULL,
  `user_quota` int(11) DEFAULT NULL,
  `user_used` int(11) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'2011-03-29 14:50:52',1,'Unassigned','Default account for nomad users',2147483647,1,2147483647,1,'2011000152S'),(2,'2011-11-24 20:35:59',1,'KAI Square Demo','KAI Square demo account',100,3,100,3,'2011001S22H'),(3,'2012-09-03 12:06:09',0,'KAI Square Unified Platform',NULL,2147483647,0,2147483647,0,'2012000309O');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_assignments`
--

DROP TABLE IF EXISTS `alert_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_assignments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `event_type_id` bigint(20) DEFAULT NULL,
  `browser_alert` bit(1) DEFAULT NULL,
  `email_alert` bit(1) DEFAULT NULL,
  `sms_alert` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK18CC10E347140EFE` (`user_id`),
  KEY `FK18CC10E3B9DAB9EB` (`event_type_id`),
  CONSTRAINT `FK18CC10E347140EFE` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK18CC10E3B9DAB9EB` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_assignments`
--

LOCK TABLES `alert_assignments` WRITE;
/*!40000 ALTER TABLE `alert_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `time` datetime NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB8308E047140EFE` (`user_id`),
  CONSTRAINT `FKB8308E047140EFE` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_recording_info`
--

DROP TABLE IF EXISTS `cloud_recording_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_recording_info` (
  `device_id` bigint(20) NOT NULL,
  `server_id` bigint(20) DEFAULT NULL,
  `task` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  KEY `server_id` (`server_id`),
  CONSTRAINT `cloud_recording_info_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `ds_device_info` (`id`),
  CONSTRAINT `cloud_recording_info_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `ds_server_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_recording_info`
--

LOCK TABLES `cloud_recording_info` WRITE;
/*!40000 ALTER TABLE `cloud_recording_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_recording_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_data`
--

DROP TABLE IF EXISTS `custom_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_data`
--

LOCK TABLES `custom_data` WRITE;
/*!40000 ALTER TABLE `custom_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_events`
--

DROP TABLE IF EXISTS `device_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` mediumtext,
  `event_type` int(11) NOT NULL,
  `received_time` datetime DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAE941322A1D5461E` (`device_id`),
  CONSTRAINT `FKAE941322A1D5461E` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135324 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_events`
--

LOCK TABLES `device_events` WRITE;
/*!40000 ALTER TABLE `device_events` DISABLE KEYS */;
INSERT INTO `device_events` VALUES (135247,'{\"time\":1388986961581,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:42:41','2014-01-06 13:42:41',3),(135248,'{\"time\":1388986973581,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:42:53','2014-01-06 13:42:53',3),(135249,'{\"time\":1388986982910,\"message\":\"event-connected\"}',5,'2014-01-06 13:43:02','2014-01-06 13:43:02',1),(135250,'{\"time\":1388986983109,\"message\":\"event-connected\"}',5,'2014-01-06 13:43:03','2014-01-06 13:43:03',2),(135251,'{\"time\":1388986985581,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:43:05','2014-01-06 13:43:05',3),(135252,'{\"time\":1388986997581,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:43:17','2014-01-06 13:43:17',3),(135253,'{\"time\":1388987009581,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:43:29','2014-01-06 13:43:29',3),(135254,'{\"time\":1388987021581,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:43:41','2014-01-06 13:43:41',3),(135255,'{\"time\":1388987041307,\"message\":\"event-connected\"}',5,'2014-01-06 13:44:01','2014-01-06 13:44:01',4),(135256,'{\"time\":1388987047698,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:44:07','2014-01-06 13:44:07',3),(135257,'{\"time\":1388987076761,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:44:36','2014-01-06 13:44:36',3),(135258,'{\"time\":1388987105825,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:45:05','2014-01-06 13:45:05',3),(135259,'{\"time\":1388987134901,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:45:34','2014-01-06 13:45:34',3),(135260,'{\"time\":1388987163953,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:46:03','2014-01-06 13:46:03',3),(135261,'{\"time\":1388987193041,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:46:33','2014-01-06 13:46:33',3),(135262,'{\"time\":1388987222093,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:47:02','2014-01-06 13:47:02',3),(135263,'{\"time\":1388987251157,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:47:31','2014-01-06 13:47:31',3),(135264,'{\"time\":1388987280210,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:48:00','2014-01-06 13:48:00',3),(135265,'{\"time\":1388987309277,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:48:29','2014-01-06 13:48:29',3),(135266,'{\"time\":1388987338329,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:48:58','2014-01-06 13:48:58',3),(135267,'{\"time\":1388987367405,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:49:27','2014-01-06 13:49:27',3),(135268,'{\"time\":1388987396457,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:49:56','2014-01-06 13:49:56',3),(135269,'{\"time\":1388987425521,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:50:25','2014-01-06 13:50:25',3),(135270,'{\"time\":1388987454597,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:50:54','2014-01-06 13:50:54',3),(135271,'{\"time\":1388987483657,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:51:23','2014-01-06 13:51:23',3),(135272,'{\"time\":1388987512713,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:51:52','2014-01-06 13:51:52',3),(135273,'{\"time\":1388987541777,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:52:21','2014-01-06 13:52:21',3),(135274,'{\"time\":1388987570861,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:52:50','2014-01-06 13:52:50',3),(135275,'{\"time\":1388987599881,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:53:19','2014-01-06 13:53:19',3),(135276,'{\"time\":1388987628961,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:53:48','2014-01-06 13:53:48',3),(135277,'{\"time\":1388987658033,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:54:18','2014-01-06 13:54:18',3),(135278,'{\"time\":1388987687089,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:54:47','2014-01-06 13:54:47',3),(135279,'{\"time\":1388987716153,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:55:16','2014-01-06 13:55:16',3),(135280,'{\"time\":1388987745217,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:55:45','2014-01-06 13:55:45',3),(135281,'{\"time\":1388987774281,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:56:14','2014-01-06 13:56:14',3),(135282,'{\"time\":1388987803409,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:56:43','2014-01-06 13:56:43',3),(135283,'{\"time\":1388987832457,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:57:12','2014-01-06 13:57:12',3),(135284,'{\"time\":1388987861509,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:57:41','2014-01-06 13:57:41',3),(135285,'{\"time\":1388987890585,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:58:10','2014-01-06 13:58:10',3),(135286,'{\"time\":1388987919637,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:58:39','2014-01-06 13:58:39',3),(135287,'{\"time\":1388987948753,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:59:08','2014-01-06 13:59:08',3),(135288,'{\"time\":1388987977777,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 13:59:37','2014-01-06 13:59:37',3),(135289,'{\"time\":1388988006845,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:00:06','2014-01-06 14:00:06',3),(135290,'{\"time\":1388988035909,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:00:35','2014-01-06 14:00:35',3),(135291,'{\"time\":1388988064965,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:01:04','2014-01-06 14:01:04',3),(135292,'{\"time\":1388988094030,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:01:34','2014-01-06 14:01:34',3),(135293,'{\"time\":1388988123149,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:02:03','2014-01-06 14:02:03',3),(135294,'{\"time\":1388988152169,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:02:32','2014-01-06 14:02:32',3),(135295,'{\"time\":1388988181233,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:03:01','2014-01-06 14:03:01',3),(135296,'{\"time\":1388988210309,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:03:30','2014-01-06 14:03:30',3),(135297,'{\"time\":1388988364725,\"message\":\"event-connected\"}',5,'2014-01-06 14:06:04','2014-01-06 14:06:04',1),(135298,'{\"time\":1388988364920,\"message\":\"event-connected\"}',5,'2014-01-06 14:06:04','2014-01-06 14:06:04',2),(135299,'{\"time\":1388988365108,\"message\":\"event-connected\"}',5,'2014-01-06 14:06:05','2014-01-06 14:06:05',3),(135300,'{\"time\":1388988365298,\"message\":\"event-connected\"}',5,'2014-01-06 14:06:05','2014-01-06 14:06:05',4),(135301,'{\"time\":1388988394517,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:06:34','2014-01-06 14:06:34',3),(135302,'{\"time\":1388988430586,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:07:10','2014-01-06 14:07:10',3),(135303,'{\"time\":1388988462623,\"channel\":0,\"message\":\"event-connection-lost\"}',4,'2014-01-06 14:07:42','2014-01-06 14:07:42',3),(135304,'{\"time\":1388988492085,\"message\":\"event-connected\"}',5,'2014-01-06 14:08:12','2014-01-06 14:08:12',3),(135305,'{\"time\":1388988523330,\"message\":\"event-passive-infrared\"}',5015,'2014-01-06 14:08:43','2014-01-06 14:08:43',3),(135306,'{\"time\":1388988673173,\"message\":\"event-connected\"}',5,'2014-01-06 14:11:13','2014-01-06 14:11:13',1),(135307,'{\"time\":1388988673232,\"message\":\"event-connected\"}',5,'2014-01-06 14:11:13','2014-01-06 14:11:13',4),(135308,'{\"time\":1388988673218,\"message\":\"event-connected\"}',5,'2014-01-06 14:11:13','2014-01-06 14:11:13',3),(135309,'{\"time\":1388988673206,\"message\":\"event-connected\"}',5,'2014-01-06 14:11:13','2014-01-06 14:11:13',2),(135310,'{\"time\":1388991954809,\"message\":\"event-connected\"}',5,'2014-01-06 15:05:54','2014-01-06 15:05:54',1),(135311,'{\"time\":1388991954891,\"message\":\"event-connected\"}',5,'2014-01-06 15:05:54','2014-01-06 15:05:54',4),(135312,'{\"time\":1388991954878,\"message\":\"event-connected\"}',5,'2014-01-06 15:05:54','2014-01-06 15:05:54',3),(135313,'{\"time\":1388991954851,\"message\":\"event-connected\"}',5,'2014-01-06 15:05:55','2014-01-06 15:05:54',2),(135314,'{\"time\":1388993062859,\"message\":\"event-connected\"}',5,'2014-01-06 15:24:22','2014-01-06 15:24:22',1),(135315,'{\"time\":1388993062915,\"message\":\"event-connected\"}',5,'2014-01-06 15:24:22','2014-01-06 15:24:22',3),(135316,'{\"time\":1388993062890,\"message\":\"event-connected\"}',5,'2014-01-06 15:24:23','2014-01-06 15:24:22',2),(135317,'{\"time\":1388993062933,\"message\":\"event-connected\"}',5,'2014-01-06 15:24:23','2014-01-06 15:24:22',4),(135319,'{\"time\":1388993321497,\"message\":\"event-connected\"}',5,'2014-01-06 15:28:41','2014-01-06 15:28:41',1),(135320,'{\"time\":1388993321534,\"message\":\"event-connected\"}',5,'2014-01-06 15:28:41','2014-01-06 15:28:41',2),(135321,'{\"time\":1388993321548,\"message\":\"event-connected\"}',5,'2014-01-06 15:28:41','2014-01-06 15:28:41',3),(135323,'{\"time\":1388993321559,\"message\":\"event-connected\"}',5,'2014-01-06 15:28:41','2014-01-06 15:28:41',4);
/*!40000 ALTER TABLE `device_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_functionalities`
--

DROP TABLE IF EXISTS `device_functionalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_functionalities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_functionalities`
--

LOCK TABLES `device_functionalities` WRITE;
/*!40000 ALTER TABLE `device_functionalities` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_functionalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_models`
--

DROP TABLE IF EXISTS `device_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_models` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `channels` int(11) NOT NULL,
  `data` varchar(255) DEFAULT NULL,
  `action` text,
  `misc` text,
  `liveview` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_models`
--

LOCK TABLES `device_models` WRITE;
/*!40000 ALTER TABLE `device_models` DISABLE KEYS */;
INSERT INTO `device_models` VALUES (100,NULL,NULL,NULL,NULL,'Dahua IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"dahua-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<object id=\'ocx\' width=\'100%\' height=\'100%\' classid=\'CLSID:D8993483-BB2A-42b1-A3DF-52290DB03FAE\' codebase=\'webrec.cab#version=2,1,6,25\' ><param name=\'lVideoWindNum\' value=1><param name=\'VideoWindBGColor\' value=\'\'><param name=\'VideoWindBarColor\' value=\'\'><param name=\'VideoWindTextColor\' value=\'\'><param name=\'SetLangFromIP\' value=\'localhost\'><param name=\'SetHostPort\' value=37777><param name=\'SetLanguage\' value=101></object><script defer type=\\\"text/javascript\\\">function init_dahua() {ocx.LoginDeviceEx(\\\"#{device:host}\\\",0,\\\"#{device:misc:login}\\\",\\\"#{device:misc:password}\\\",0);ocx.ConnectRealVideo(0,0);}setTimeout(\'init_dahua()\',6000);</script>\"\r\n		}\r\n	}\r\n\n}'),(101,NULL,NULL,NULL,NULL,'Dahua DVR 4-Channel',4,NULL,NULL,'{\r\n	\"servertype\": \"dahua-dvr-4\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<object id=\'ocx\' width=\'100%\' height=\'100%\' classid=\'CLSID:D8993483-BB2A-42b1-A3DF-52290DB03FAE\' codebase=\'webrec.cab#version=2,1,6,25\' ><param name=\'lVideoWindNum\' value=1><param name=\'VideoWindBGColor\' value=\'\'><param name=\'VideoWindBarColor\' value=\'\'><param name=\'VideoWindTextColor\' value=\'\'><param name=\'SetLangFromIP\' value=\'localhost\'><param name=\'SetHostPort\' value=37777><param name=\'SetLanguage\' value=101></object><script defer type=\\\"text/javascript\\\">function init_dahua() {ocx.LoginDeviceEx(\\\"#{device:host}\\\",0,\\\"#{device:misc:login}\\\",\\\"#{device:misc:password}\\\",0);ocx.ConnectRealVideo(0,0);}setTimeout(\'init_dahua()\',6000);</script>\"\r\n		}\r\n	},\r\n\n	\"1\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<object id=\'ocx\' width=\'100%\' height=\'100%\' classid=\'CLSID:D8993483-BB2A-42b1-A3DF-52290DB03FAE\' codebase=\'webrec.cab#version=2,1,6,25\' ><param name=\'lVideoWindNum\' value=1><param name=\'VideoWindBGColor\' value=\'\'><param name=\'VideoWindBarColor\' value=\'\'><param name=\'VideoWindTextColor\' value=\'\'><param name=\'SetLangFromIP\' value=\'localhost\'><param name=\'SetHostPort\' value=37777><param name=\'SetLanguage\' value=101></object><script defer type=\\\"text/javascript\\\">function init_dahua() {ocx.LoginDeviceEx(\\\"#{device:host}\\\",0,\\\"#{device:misc:login}\\\",\\\"#{device:misc:password}\\\",0);ocx.ConnectRealVideo(1,0);}setTimeout(\'init_dahua()\',6000);</script>\"\r\n		}\r\n	},\r\n\n	\"2\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<object id=\'ocx\' width=\'100%\' height=\'100%\' classid=\'CLSID:D8993483-BB2A-42b1-A3DF-52290DB03FAE\' codebase=\'webrec.cab#version=2,1,6,25\' ><param name=\'lVideoWindNum\' value=1><param name=\'VideoWindBGColor\' value=\'\'><param name=\'VideoWindBarColor\' value=\'\'><param name=\'VideoWindTextColor\' value=\'\'><param name=\'SetLangFromIP\' value=\'localhost\'><param name=\'SetHostPort\' value=37777><param name=\'SetLanguage\' value=101></object><script defer type=\\\"text/javascript\\\">function init_dahua() {ocx.LoginDeviceEx(\\\"#{device:host}\\\",0,\\\"#{device:misc:login}\\\",\\\"#{device:misc:password}\\\",0);ocx.ConnectRealVideo(2,0);}setTimeout(\'init_dahua()\',6000);</script>\"\r\n		}\r\n	},\r\n\n	\"3\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<object id=\'ocx\' width=\'100%\' height=\'100%\' classid=\'CLSID:D8993483-BB2A-42b1-A3DF-52290DB03FAE\' codebase=\'webrec.cab#version=2,1,6,25\' ><param name=\'lVideoWindNum\' value=1><param name=\'VideoWindBGColor\' value=\'\'><param name=\'VideoWindBarColor\' value=\'\'><param name=\'VideoWindTextColor\' value=\'\'><param name=\'SetLangFromIP\' value=\'localhost\'><param name=\'SetHostPort\' value=37777><param name=\'SetLanguage\' value=101></object><script defer type=\\\"text/javascript\\\">function init_dahua() {ocx.LoginDeviceEx(\\\"#{device:host}\\\",0,\\\"#{device:misc:login}\\\",\\\"#{device:misc:password}\\\",0);ocx.ConnectRealVideo(3,0);}setTimeout(\'init_dahua()\',6000);</script>\"\r\n		}\r\n	}\r\n\n}'),(102,NULL,NULL,NULL,NULL,'Amegia IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"amegia-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<object id=\'RTSPCtl\' width=\'100%\' height=\'100%\' classid=\'CLSID:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\' codebase=\'http://www.apple.com/qtactivex/qtplugin.cab\'><param name=\'qtsrc\' value=\'rtsp://#{device:host}:554/v05\'><param name=\'type\' value=\'video/quicktime\'><param name=\'scale\' value=\'tofit\'><param name=\'bgcolor\' value=\'black\'><param name=\'controller\' value=\'false\'></object>\"\r\n		}\r\n	}\r\n\n}'),(103,NULL,NULL,NULL,NULL,'HiSharp Mobile DVR 4 Channel',4,NULL,NULL,'{\r\n	\"servertype\": \"hisharp-mdvr-4\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-gsensor\",\"live-gps\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"1\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"2\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"3\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	}\r\n\n}'),(104,NULL,NULL,NULL,NULL,'TVT DVR 4 Channel',4,NULL,NULL,'{\r\n	\"servertype\": \"tvt-dvr-4\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"1\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"2\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"3\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	}\r\n\n}'),(105,NULL,NULL,NULL,NULL,'TVT Mobile DVR 4 Channel',4,NULL,NULL,'{\r\n	\"servertype\": \"tvt-mdvr-4\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"1\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"2\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"3\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	}\r\n\n}'),(106,NULL,NULL,NULL,NULL,'Vivotek IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"vivotek-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<OBJECT onmouseover=\"mousein(this)\" onmouseout=\"mouseout(this)\" style=\"z-index:1;\" id=\"#{system:random_id}\" WIDTH=\"100%\" HEIGHT=\"100%\" standby=\"Loading plug-in...\" name=\"VitCtrl\" CLASSID=\"CLSID:70EDCF63-CA7E-4812-8528-DA1EA2FD53B6\" CODEBASE=\"#{system:static_path}/J4SVitCtrl.cab#version=4,0,0,5\"><PARAM NAME=\"Language\" VALUE=\"EN\"><PARAM NAME=\"RemoteIPAddr\" VALUE=\"#{device:host}\"><PARAM NAME=\"HttpPort\" VALUE=\"#{device:misc:port}\"><PARAM NAME=\"ViewStream\" VALUE=\"#{device:video_stream}\"><PARAM NAME=\"UserName\" VALUE=\"#{device:misc:login}\"><PARAM NAME=\"Password\" VALUE=\"#{device:misc:password}\"><PARAM NAME=\"IgnoreBorder\" VALUE=\"true\"><PARAM NAME=\"ServerModelType\" VALUE=\"5\"><PARAM NAME=\"IgnoreCaption\" VALUE=\"true\"><PARAM NAME=\"ControlType\" VALUE=\"0\"><PARAM NAME=\"HideConnectIP\" VALUE=\"true\"><PARAM NAME=\"DisplayErrorMsg\" VALUE=\"false\"></OBJECT>\",\r\n	\"ptz\": {\r\n\n                                \"left\": \"#{system:random_id}.SendCameraCommand(\'left\');\",\r\n\n                                \"right\": \"#{system:random_id}.SendCameraCommand(\'right\');\",\r\n\n                                \"up\": \"#{system:random_id}.SendCameraCommand(\'up\');\",\r\n\n                                \"down\": \"#{system:random_id}.SendCameraCommand(\'down\');\",\r\n\n                                \"in\": \"#{system:random_id}.SendCameraCommand(\'tele\');\",\r\n\n                                \"out\": \"#{system:random_id}.SendCameraCommand(\'wide\');\",\r\n\n                                \"home\": \"#{system:random_id}.SendCameraCommand(\'home\');\"\r\n\n                        }	}\r\n	}\r\n\n}'),(107,NULL,NULL,NULL,NULL,'Axis IP Camera',1,NULL,NULL,'{\r\n  \"servertype\": \"axis-ipc\",\r\n       \"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n   \"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n        \"0\": {\r\n            \"mjpeg\": {\r\n                        \"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n   }\r\n   },\r\n\n        \"1\": {\r\n            \"mjpeg\": {\r\n                        \"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n   }\r\n   },\r\n\n        \"2\": {\r\n            \"mjpeg\": {\r\n                        \"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n   }\r\n   },\r\n\n        \"3\": {\r\n            \"mjpeg\": {\r\n                        \"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n   }\r\n   }\r\n\n}'),(108,NULL,NULL,NULL,NULL,'Amegia PnP IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"amegia-pnp-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<object id=\'RTSPCtl\' width=\'100%\' height=\'100%\' classid=\'CLSID:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\' codebase=\'http://www.apple.com/qtactivex/qtplugin.cab\'><param name=\'qtsrc\' value=\'rtsp://#{device:host}:554/v05\'><param name=\'type\' value=\'video/quicktime\'><param name=\'scale\' value=\'tofit\'><param name=\'bgcolor\' value=\'black\'><param name=\'controller\' value=\'false\'></object>\"\r\n		}\r\n	}\r\n\n}'),(109,NULL,NULL,NULL,NULL,'TVT PNP DVR 4 Channel',4,NULL,NULL,'{\r\n  \"servertype\": \"tvt-pnp-dvr-4\",\r\n  \"supportedtasktypes\": [\"live-image\"],\r\n   \"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n        \"0\": {\r\n            \"mjpeg\": {\r\n                        \"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n   }\r\n   },\r\n\n        \"1\": {\r\n            \"mjpeg\": {\r\n                        \"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n   }\r\n   },\r\n\n        \"2\": {\r\n            \"mjpeg\": {\r\n                        \"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n   }\r\n   },\r\n\n        \"3\": {\r\n            \"mjpeg\": {\r\n                        \"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n   }\r\n   }\r\n\n}'),(110,NULL,NULL,NULL,NULL,'General RTSP IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"general-rtsp-ipc\",\r\n	\"supportedtasktypes\": [\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		}\n		}\r\n\n}'),(111,NULL,NULL,NULL,NULL,'Amtk IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"amtk-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"1\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"2\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"3\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	}\r\n\n}'),(112,NULL,NULL,NULL,NULL,'Panasonic IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"panasonic-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	}\r\n\n}'),(113,NULL,NULL,NULL,NULL,'Etrovision IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"etrovision-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	}\r\n\n}'),(115,NULL,NULL,NULL,NULL,'KAI NODE',16,NULL,NULL,'{\r\n	\"servertype\": \"kai-node\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"1\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"2\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"3\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"4\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"5\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"6\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"7\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"8\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"9\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"10\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"11\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"12\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"13\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:1}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"14\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:2}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	},\r\n\n	\"15\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:3}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	}\r\n\n}'),(116,NULL,NULL,NULL,NULL,'Messoa IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"messoa-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\",\"live-rtsp\",\"live-rtmp\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		},\n            \r\n		\"activex\":{\r\n			\"objectcode\": \"<object id=\'RTSPCtl\' width=\'100%\' height=\'100%\' classid=\'CLSID:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\' codebase=\'http://www.apple.com/qtactivex/qtplugin.cab\'><param name=\'qtsrc\' value=\'rtsp://#{device:host}:554/v05\'><param name=\'type\' value=\'video/quicktime\'><param name=\'scale\' value=\'tofit\'><param name=\'bgcolor\' value=\'black\'><param name=\'controller\' value=\'false\'></object>\"\r\n		}\r\n	}\r\n\n}'),(235,NULL,NULL,NULL,NULL,'Atracker GPS',1,NULL,NULL,'{\r\n	\"servertype\": \"atracker\",\r\n	\"supportedtasktypes\": [\"live-gps\",\"gpio\",\"live-gsensor\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n	}\r\n	}\r\n\n}'),(236,NULL,NULL,NULL,NULL,'VCA device',0,NULL,NULL,'{\r\n	\"servertype\": \"vca-device\",\r\n	\"supportedtasktypes\": [\"live-gps\"]\r\n}\r\n',NULL),(237,NULL,NULL,NULL,NULL,'General MJPEG IP Camera',1,NULL,NULL,'{\r\n	\"servertype\": \"general-mjpeg-ipc\",\r\n	\"supportedtasktypes\": [\"live-image\",\"live-mjpeg\"],\r\n	\"device_url\": \"http://#{device:host}:#{device:misc:port}/ \r\n\"}','{\n	\"0\": {\r\n		\"mjpeg\": {\r\n			\"objectcode\": \"<applet id=\\\"#{system:random_id}\\\" name=\\\"Motion JPEG Player\\\" code=\\\"com.kaisquare.player.mjpeg.MJPEGPlayer\\\" archive=\\\"#{system:static_path}/kaisquare-player-mjpeg.jar\\\" width=\\\"100%\\\" height=\\\"100%\\\" mayscript=\\\"true\\\"><param name=\\\"url\\\" value=\\\"#{device:device_server_mjpeg_url_map:0}\\\" /><param name=\\\"username\\\" value=\\\"#{device:misc:login}\\\" /><param name=\\\"password\\\" value=\\\"#{device:misc:password}\\\" /><param name=\\\"mouse_click_javascript\\\" value=\\\"liveview_mjpeg_click(document.getElementById(\'#{system:random_id}\'));\\\" /><p style=\\\"color: white;\\\">Your browser does not support <a href=\\\"http://www.java.com/\\\">Java applets</a>.</p></applet>\" \r\n		}\n		}\r\n\n}'),(238,NULL,NULL,NULL,NULL,'Ekahau RTLS Controller',0,NULL,NULL,'{\r\n	\"servertype\": \"ekahau-rtls-controller\",\r\n	\"supportedtasktypes\": [\"live-indoor-location\",\" live-indoor-maps\"]\r\n}\r\n',NULL);
/*!40000 ALTER TABLE `device_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `device_key` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `lat` int(11) DEFAULT NULL,
  `lng` int(11) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `model_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `functionality_id` bigint(20) DEFAULT NULL,
  `alert_flag` bit(1) NOT NULL,
  `alive` bit(1) NOT NULL,
  `current_position_id` bigint(20) DEFAULT NULL,
  `action` text,
  `misc` text,
  `events_settings` text,
  `device_server_urls` text,
  `liveview` text,
  `snapshot_recording_enabled` bit(1) NOT NULL,
  `snapshot_recording_interval` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5CF8ACDD9737AEF6` (`account_id`),
  KEY `FK5CF8ACDDEE3626C0` (`model_id`),
  KEY `FK5CF8ACDD3F52909E` (`status_id`),
  KEY `FK5CF8ACDD136CC580` (`functionality_id`),
  KEY `FK5CF8ACDDED2F2678` (`current_position_id`),
  CONSTRAINT `FK5CF8ACDD136CC580` FOREIGN KEY (`functionality_id`) REFERENCES `device_functionalities` (`id`),
  CONSTRAINT `FK5CF8ACDD3F52909E` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `FK5CF8ACDDED2F2678` FOREIGN KEY (`current_position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'181','','10.101.0.181',37,37,3,111,NULL,NULL,'\0','\0',NULL,NULL,'{\"port\":\"80\",\"login\":\"admin\",\"password\":\"\",\"address\":\"Beijing Office\",\"cloud_recording_enabled\":\"true\"}',NULL,'{\"jpeg\":{\"0\":\"http://10.101.0.206:9111/snap/1/0\"},\"mjpeg\":{\"0\":\"http://10.101.0.181:80/mjpeg/video.cgi&resolution=320X240\"},\"rtsp\":{\"0\":\"rtsp://10.101.0.206:12021/rtsp/1/0\"},\"rtmp\":{\"0\":\"rtmp://10.101.0.206/flvplayback/live1-0\"},\"gsensor\":{\"0\":\"http://10.101.0.206:9111/gsensor/1/0\"}}',NULL,'\0',0),(2,'182','','10.101.0.182',37,120,3,111,NULL,NULL,'\0','\0',NULL,NULL,'{\"port\":\"80\",\"login\":\"admin\",\"password\":\"\",\"address\":\"Beijing Office\",\"cloud_recording_enabled\":\"true\"}',NULL,'{\"jpeg\":{\"0\":\"http://10.101.0.206:9111/snap/2/0\"},\"mjpeg\":{\"0\":\"http://10.101.0.182:80/mjpeg/video.cgi&resolution=320X240\"},\"rtsp\":{\"0\":\"rtsp://10.101.0.206:12021/rtsp/2/0\"},\"rtmp\":{\"0\":\"rtmp://10.101.0.206/flvplayback/live2-0\"},\"gsensor\":{\"0\":\"http://10.101.0.206:9111/gsensor/2/0\"}}',NULL,'\0',0),(3,'183','','10.101.0.183',37,37,3,111,NULL,NULL,'\0','\0',NULL,NULL,'{\"port\":\"80\",\"login\":\"admin\",\"password\":\"\",\"address\":\"Beijing Office\",\"cloud_recording_enabled\":\"true\"}',NULL,'{\"jpeg\":{\"0\":\"http://10.101.0.206:9111/snap/3/0\"},\"mjpeg\":{\"0\":\"http://10.101.0.183:80/mjpeg/video.cgi&resolution=320X240\"},\"rtsp\":{\"0\":\"rtsp://10.101.0.206:12021/rtsp/3/0\"},\"rtmp\":{\"0\":\"rtmp://10.101.0.206/flvplayback/live3-0\"},\"gsensor\":{\"0\":\"http://10.101.0.206:9111/gsensor/3/0\"}}',NULL,'\0',0),(4,'184','','10.101.0.186',37,120,3,111,NULL,NULL,'\0','\0',NULL,NULL,'{\"port\":\"80\",\"login\":\"admin\",\"password\":\"\",\"address\":\"Beijing Office\",\"cloud_recording_enabled\":\"true\"}',NULL,'{\"jpeg\":{\"0\":\"http://10.101.0.206:9111/snap/4/0\"},\"mjpeg\":{\"0\":\"http://10.101.0.186:80/mjpeg/video.cgi&resolution=320X240\"},\"rtsp\":{\"0\":\"rtsp://10.101.0.206:12021/rtsp/4/0\"},\"rtmp\":{\"0\":\"rtmp://10.101.0.206/flvplayback/live4-0\"},\"gsensor\":{\"0\":\"http://10.101.0.206:9111/gsensor/4/0\"}}',NULL,'\0',0);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_device_info`
--

DROP TABLE IF EXISTS `ds_device_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_device_info` (
  `id` bigint(20) NOT NULL,
  `device_key` varchar(255) DEFAULT NULL,
  `device_info` text,
  `status` tinyint(2) DEFAULT NULL,
  `server_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_device_info`
--

LOCK TABLES `ds_device_info` WRITE;
/*!40000 ALTER TABLE `ds_device_info` DISABLE KEYS */;
INSERT INTO `ds_device_info` VALUES (1,'juzz4v2-generated-key-1','{\"name\":\"181\",\"servertype\":\"amtk-ipc\",\"device_url\":\"http://#{device:host}:#{device:misc:port}/ \\r\\n\",\"port\":\"80\",\"password\":\"\",\"address\":\"Beijing Office\",\"cloud_recording_enabled\":\"true\",\"num-channels\":1,\"host\":\"10.101.0.181\",\"username\":\"admin\"}',2,21),(2,'juzz4v2-generated-key-2','{\"name\":\"182\",\"servertype\":\"amtk-ipc\",\"device_url\":\"http://#{device:host}:#{device:misc:port}/ \\r\\n\",\"port\":\"80\",\"password\":\"\",\"address\":\"Beijing Office\",\"cloud_recording_enabled\":\"true\",\"num-channels\":1,\"host\":\"10.101.0.182\",\"username\":\"admin\"}',2,21),(3,'juzz4v2-generated-key-3','{\"name\":\"183\",\"servertype\":\"amtk-ipc\",\"device_url\":\"http://#{device:host}:#{device:misc:port}/ \\r\\n\",\"port\":\"80\",\"password\":\"\",\"address\":\"Beijing Office\",\"cloud_recording_enabled\":\"true\",\"num-channels\":1,\"host\":\"10.101.0.183\",\"username\":\"admin\"}',2,21),(4,'juzz4v2-generated-key-4','{\"name\":\"184\",\"servertype\":\"amtk-ipc\",\"device_url\":\"http://#{device:host}:#{device:misc:port}/ \\r\\n\",\"port\":\"80\",\"password\":\"\",\"address\":\"Beijing Office\",\"cloud_recording_enabled\":\"true\",\"num-channels\":1,\"host\":\"10.101.0.186\",\"username\":\"admin\"}',2,21);
/*!40000 ALTER TABLE `ds_device_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_server_info`
--

DROP TABLE IF EXISTS `ds_server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_server_info` (
  `id` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` smallint(5) unsigned DEFAULT NULL,
  `register_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_server_info`
--

LOCK TABLES `ds_server_info` WRITE;
/*!40000 ALTER TABLE `ds_server_info` DISABLE KEYS */;
INSERT INTO `ds_server_info` VALUES (21,'amtk-ipc','10.101.0.206',10801,1388993328057);
/*!40000 ALTER TABLE `ds_server_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_types`
--

DROP TABLE IF EXISTS `event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tech_name` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9801 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_types`
--

LOCK TABLES `event_types` WRITE;
/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;
INSERT INTO `event_types` VALUES (1,'Alarm','event-alarm',NULL),(2,'Motion','event-motion',NULL),(3,'Video loss','event-video-loss',NULL),(4,'Connection lost','event-connection-lost',NULL),(5,'Connected','event-connected',NULL),(512,'Digital input','event-input',NULL),(513,'Digital output','event-output',NULL),(514,'Manual','event-manual',NULL),(1024,'Idle','event-idle',NULL),(1025,'Speeding','event-speeding',NULL),(2048,'Sudden acceleration','event-sudden-acceleration',NULL),(2049,'Sudden braking','event-sudden-braking',NULL),(2050,'Sudden left','event-sudden-left',NULL),(2051,'Sudden right','event-sudden-right',NULL),(2052,'Sudden up','event-sudden-up',NULL),(2053,'Sudden down','event-sudden-down',NULL),(4096,'Entering geofence','event-geofence-enter',NULL),(4097,'Exiting geofence','event-geofence-exit',NULL),(5010,'Audio','event-audio',NULL),(5015,'Passive infrared','event-passive-infrared',NULL),(8192,'Count','event-count',NULL),(8200,'Intrusion Detected','event-vca-intrusion',NULL),(8201,'Loitering Detected','event-vca-loitering',NULL),(8202,'Face Detected','event-vca-face',NULL),(8203,'Heat Map Alert','event-vca-heatmap',NULL),(8204,'Licecse Plate Detected','event-vca-lpr',NULL),(8205,'Counting Triggered','event-vca-counting',NULL),(8206,'View Obstructed','event-vca-viewobstructed',NULL),(8207,'Audience Event','event-vca-audienceprofiling',NULL),(8208,'Vca Video Blur','event-vca-video-blur',NULL),(8209,'Vca Perimeter','event-vca-perimeter',NULL),(8210,'Vca People Counting','event-vca-people-counting',NULL),(8211,'Vca Object Counting','event-vca-object-counting',NULL),(8212,'Vca Video Loss','event-vca-video-loss',NULL),(9800,'Event video recording','event-recording',NULL);
/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpsdata`
--

DROP TABLE IF EXISTS `gpsdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpsdata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `lat` int(11) DEFAULT NULL,
  `lng` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `fixed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpsdata`
--

LOCK TABLES `gpsdata` WRITE;
/*!40000 ALTER TABLE `gpsdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpsdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsensordata`
--

DROP TABLE IF EXISTS `gsensordata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsensordata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devidindex` (`device_id`),
  KEY `createdatindex` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsensordata`
--

LOCK TABLES `gsensordata` WRITE;
/*!40000 ALTER TABLE `gsensordata` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsensordata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `display` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (111,'Add Role','management.role.add'),(112,'Delete Role','management.role.delete'),(113,'Edit Role','management.role.edit'),(114,'List Roles','management.role.list'),(121,'Add Account','management.account.add'),(122,'Delete Account','management.account.delete'),(123,'Edit Account','management.account.edit'),(124,'List Accounts','management.account.list'),(125,'Assign Users/Devices to Accounts','management.account.assign'),(126,'Grant Device Rights to Users','management.account.grant'),(131,'Add Device','management.device.add'),(132,'Delete Device','management.device.delete'),(133,'Edit Device','management.device.edit'),(134,'List Devices','management.device.list'),(141,'Add User','management.user.add'),(142,'Delete User','management.user.delete'),(143,'Edit User','management.user.edit'),(144,'List Users','management.user.list'),(211,'Live View','view.live.camera'),(212,'Live Location','view.live.location'),(311,'Cloud Recording List','recording.camera.cloud.list'),(312,'Device Recording List','recording.camera.onboard.list'),(411,'List Events','report.event.list'),(412,'Receive Event Alerts','report.event.alert'),(413,'Device File Recording List','recording.camera.file.list');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modified_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lat` int(11) DEFAULT NULL,
  `lng` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `current_gpsdata_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK65C08C6AB9A8DC3C` (`current_gpsdata_id`),
  KEY `speedindex` (`speed`),
  KEY `latindex` (`lat`),
  KEY `modifiedatindex` (`modified_at`),
  KEY `lngindex` (`lng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK67A8EBD9737AEF6` (`account_id`),
  CONSTRAINT `FK67A8EBD9737AEF6` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'NOOP','Invalid',NULL),(2,'superadmin','Superadmin',NULL),(3,'admin','Admin',NULL),(5,'user','User',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK250AE02A1E94B1E` (`role_id`),
  KEY `FK250AE023494357E` (`permission_id`),
  CONSTRAINT `FK250AE023494357E` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `FK250AE02A1E94B1E` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_permissions`
--

LOCK TABLES `roles_permissions` WRITE;
/*!40000 ALTER TABLE `roles_permissions` DISABLE KEYS */;
INSERT INTO `roles_permissions` VALUES (1,111,2),(2,112,2),(3,113,2),(4,114,2),(5,121,2),(6,122,2),(7,123,2),(8,124,2),(9,125,2),(10,126,2),(11,131,2),(12,132,2),(13,133,2),(14,134,2),(15,141,2),(16,142,2),(17,143,2),(18,144,2),(19,211,2),(20,212,2),(21,311,2),(22,312,2),(23,411,2),(24,412,2),(25,125,3),(26,126,3),(27,131,3),(28,132,3),(29,133,3),(30,134,3),(31,141,3),(32,142,3),(33,143,3),(34,144,3),(35,211,3),(36,212,3),(37,311,3),(38,312,3),(39,411,3),(40,412,3),(41,211,5),(42,212,5),(43,311,5),(44,312,5),(45,411,5),(46,412,5),(47,413,2);
/*!40000 ALTER TABLE `roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rs_device_info`
--

DROP TABLE IF EXISTS `rs_device_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rs_device_info` (
  `id` bigint(20) NOT NULL,
  `device_info` text,
  `server_id` bigint(20) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rs_device_info`
--

LOCK TABLES `rs_device_info` WRITE;
/*!40000 ALTER TABLE `rs_device_info` DISABLE KEYS */;
INSERT INTO `rs_device_info` VALUES (1,'{\"server-id\":21,\"device-key\":\"123\",\"type\":\"amtk-ipc\",\"channel-count\":1,\"stream-type\":\"h264\",\"publisher\":\"tcp://10.101.0.206:17021\"}',90001,2),(2,'{\"server-id\":21,\"device-key\":\"123\",\"type\":\"amtk-ipc\",\"channel-count\":1,\"stream-type\":\"h264\",\"publisher\":\"tcp://10.101.0.206:17021\"}',90001,2),(3,'{\"server-id\":21,\"device-key\":\"123\",\"type\":\"amtk-ipc\",\"channel-count\":1,\"stream-type\":\"h264\",\"publisher\":\"tcp://10.101.0.206:17021\"}',90001,2),(4,'{\"server-id\":21,\"device-key\":\"123\",\"type\":\"amtk-ipc\",\"channel-count\":1,\"stream-type\":\"h264\",\"publisher\":\"tcp://10.101.0.206:17021\"}',90001,2),(40,'{\"server-id\":21,\"device-key\":\"123\",\"type\":\"amtk-ipc\",\"channel-count\":1,\"stream-type\":\"h264\",\"publisher\":\"tcp://10.101.0.206:17021\"}',90001,2);
/*!40000 ALTER TABLE `rs_device_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rs_server_info`
--

DROP TABLE IF EXISTS `rs_server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rs_server_info` (
  `id` bigint(20) NOT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` smallint(5) unsigned DEFAULT NULL,
  `server_info` text,
  `register_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rs_server_info`
--

LOCK TABLES `rs_server_info` WRITE;
/*!40000 ALTER TABLE `rs_server_info` DISABLE KEYS */;
INSERT INTO `rs_server_info` VALUES (90001,'127.0.0.1',18010,'{\"streams\":0,\"max-streams\":256,\"free-space\":2048,\"total-space\":10240,\"cpu-cost\":0,\"mem-cost\":0,\"host\":\"127.0.0.1\",\"port\":18010}',1388993334184);
/*!40000 ALTER TABLE `rs_server_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'pending'),(2,'active');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_session_info`
--

DROP TABLE IF EXISTS `stream_session_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream_session_info` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `ttl` bigint(20) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `channel_id` tinyint(2) DEFAULT NULL,
  `start_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_session_info`
--

LOCK TABLES `stream_session_info` WRITE;
/*!40000 ALTER TABLE `stream_session_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream_session_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_events`
--

DROP TABLE IF EXISTS `system_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` varchar(255) DEFAULT NULL,
  `event_type` int(11) NOT NULL,
  `received_time` datetime DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_events`
--

LOCK TABLES `system_events` WRITE;
/*!40000 ALTER TABLE `system_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `alert_type` int(11) DEFAULT NULL,
  `alert_event_types` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `two_factor_mode` int(11) DEFAULT NULL,
  `misc` text,
  `description` varchar(255) DEFAULT NULL,
  `custom_fields` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `num_views` int(11) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `session_timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6A68E08A1E94B1E` (`role_id`),
  KEY `FK6A68E089737AEF6` (`account_id`),
  CONSTRAINT `FK6A68E089737AEF6` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK6A68E08A1E94B1E` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'kaiadmin','rEX6j/Hg4RLGf8RJW+KvGT4eVMOkueNQWpksZKT624k=','KAI Square Super Admin','','',2,2,0,'',NULL,NULL,'{\"views\":{\"1\":[170,0],\"4\":[170,170,171,171,0,0,0,0],\"16\":[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\"9\":[169,169,169,170,170,170,171,171,171,0,0,0,0,0,0,0,0,0]}}',NULL,NULL,'','',1,'zh',1800000),(3,'admin','7tvtzPuGjHuO8+MlhMFDfPi/P40BembNhBY4viluoiI=','Admin','','',2,3,0,'',NULL,NULL,'{\"views\":{\"4\":[170,8,171,200000,0,0,0,0],\"1\":[170,0]}}',NULL,NULL,'','',1,'zh',900000),(4,'demo','+3YhRWdLNTcKcX5vkazVpOcUEhTuFznu+2CriDHI/R4=','Demo','','',2,5,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'',1,'zh',900000);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_devices`
--

DROP TABLE IF EXISTS `users_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_devices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_right` bit(1) NOT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK81E459A647140EFE` (`user_id`),
  KEY `FK81E459A6A1D5461E` (`device_id`),
  CONSTRAINT `FK81E459A647140EFE` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK81E459A6A1D5461E` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_devices`
--

LOCK TABLES `users_devices` WRITE;
/*!40000 ALTER TABLE `users_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vouchers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contact_number` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `customer_addr` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `device_quota` int(11) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_quota` int(11) DEFAULT NULL,
  `voucher_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-06 16:00:30
