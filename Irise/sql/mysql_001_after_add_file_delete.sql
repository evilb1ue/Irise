-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Irise
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB-6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add code lib',1,'add_codelib'),(2,'Can change code lib',1,'change_codelib'),(3,'Can delete code lib',1,'delete_codelib'),(4,'Can view code lib',1,'view_codelib'),(5,'Can add code search info',2,'add_codesearchinfo'),(6,'Can change code search info',2,'change_codesearchinfo'),(7,'Can delete code search info',2,'delete_codesearchinfo'),(8,'Can view code search info',2,'view_codesearchinfo'),(9,'Can add extra info',3,'add_extrainfo'),(10,'Can change extra info',3,'change_extrainfo'),(11,'Can delete extra info',3,'delete_extrainfo'),(12,'Can view extra info',3,'view_extrainfo'),(13,'Can add language',4,'add_language'),(14,'Can change language',4,'change_language'),(15,'Can delete language',4,'delete_language'),(16,'Can view language',4,'view_language'),(17,'Can add tag',5,'add_tag'),(18,'Can change tag',5,'change_tag'),(19,'Can delete tag',5,'delete_tag'),(20,'Can view tag',5,'view_tag'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add content type',10,'add_contenttype'),(38,'Can change content type',10,'change_contenttype'),(39,'Can delete content type',10,'delete_contenttype'),(40,'Can view content type',10,'view_contenttype'),(41,'Can add session',11,'add_session'),(42,'Can change session',11,'change_session'),(43,'Can delete session',11,'delete_session'),(44,'Can view session',11,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$2cYSQAzQZmjZ$yGlyHjWxGFqSS1iB3g/XHEfTMvdZbww+2+7orO9ks7Y=','2018-09-11 20:13:07.277568',1,'Irise','','','',1,1,'2018-09-11 00:10:18.526477');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clibs_codelib`
--

DROP TABLE IF EXISTS `clibs_codelib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clibs_codelib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_name` varchar(32) NOT NULL,
  `code_content` longtext NOT NULL,
  `order` int(11) NOT NULL,
  `search_info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clibs_codelib_search_info_id_64769776_fk_clibs_codesearchinfo_id` (`search_info_id`),
  CONSTRAINT `clibs_codelib_search_info_id_64769776_fk_clibs_codesearchinfo_id` FOREIGN KEY (`search_info_id`) REFERENCES `clibs_codesearchinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clibs_codelib`
--

LOCK TABLES `clibs_codelib` WRITE;
/*!40000 ALTER TABLE `clibs_codelib` DISABLE KEYS */;
/*!40000 ALTER TABLE `clibs_codelib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clibs_codesearchinfo`
--

DROP TABLE IF EXISTS `clibs_codesearchinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clibs_codesearchinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_keyword` varchar(32) NOT NULL,
  `code_description` varchar(256) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `last_modified_date` datetime(6) NOT NULL,
  `relation_info` varchar(256) NOT NULL,
  `code_language_id` varchar(32) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clibs_codesearchinfo_code_language_id_003d2e6a_fk_clibs_lan` (`code_language_id`),
  CONSTRAINT `clibs_codesearchinfo_code_language_id_003d2e6a_fk_clibs_lan` FOREIGN KEY (`code_language_id`) REFERENCES `clibs_language` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clibs_codesearchinfo`
--

LOCK TABLES `clibs_codesearchinfo` WRITE;
/*!40000 ALTER TABLE `clibs_codesearchinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `clibs_codesearchinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clibs_codesearchinfo_tag`
--

DROP TABLE IF EXISTS `clibs_codesearchinfo_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clibs_codesearchinfo_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codesearchinfo_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clibs_codesearchinfo_tag_codesearchinfo_id_tag_id_6702e429_uniq` (`codesearchinfo_id`,`tag_id`),
  KEY `clibs_codesearchinfo_tag_tag_id_900d61be_fk_clibs_tag_id` (`tag_id`),
  CONSTRAINT `clibs_codesearchinfo_codesearchinfo_id_c98ca304_fk_clibs_cod` FOREIGN KEY (`codesearchinfo_id`) REFERENCES `clibs_codesearchinfo` (`id`),
  CONSTRAINT `clibs_codesearchinfo_tag_tag_id_900d61be_fk_clibs_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `clibs_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clibs_codesearchinfo_tag`
--

LOCK TABLES `clibs_codesearchinfo_tag` WRITE;
/*!40000 ALTER TABLE `clibs_codesearchinfo_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `clibs_codesearchinfo_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clibs_language`
--

DROP TABLE IF EXISTS `clibs_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clibs_language` (
  `lang` varchar(32) NOT NULL,
  PRIMARY KEY (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clibs_language`
--

LOCK TABLES `clibs_language` WRITE;
/*!40000 ALTER TABLE `clibs_language` DISABLE KEYS */;
INSERT INTO `clibs_language` VALUES ('Bash'),('C/C++'),('Javascript'),('Python'),('Python2'),('Python3');
/*!40000 ALTER TABLE `clibs_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clibs_tag`
--

DROP TABLE IF EXISTS `clibs_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clibs_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_text` varchar(32) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clibs_tag`
--

LOCK TABLES `clibs_tag` WRITE;
/*!40000 ALTER TABLE `clibs_tag` DISABLE KEYS */;
INSERT INTO `clibs_tag` VALUES (2,'Crypto','2018-09-11'),(3,'Misc','2018-09-11'),(4,'Reverse','2018-09-11'),(5,'Stega','2018-09-11'),(6,'Pwn','2018-09-11'),(7,'Web','2018-09-12');
/*!40000 ALTER TABLE `clibs_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-09-11 20:24:30.460168','Bash','Language object (Bash)',1,'[{\"added\": {}}]',4,1),(2,'2018-09-11 20:25:15.611973','C/C++','Language object (C/C++)',1,'[{\"added\": {}}]',4,1),(3,'2018-09-11 20:26:03.036836','Python2','Language object (Python2)',1,'[{\"added\": {}}]',4,1),(4,'2018-09-11 20:26:08.692000','Python3','Language object (Python3)',1,'[{\"added\": {}}]',4,1),(5,'2018-09-11 20:26:23.924594','Javascript','Language object (Javascript)',1,'[{\"added\": {}}]',4,1),(6,'2018-09-11 20:29:06.315348','1','Tag object (1)',1,'[{\"added\": {}}]',5,1),(7,'2018-09-11 20:29:51.813756','2','Tag object (2)',1,'[{\"added\": {}}]',5,1),(8,'2018-09-11 20:31:21.188608','3','Tag object (3)',1,'[{\"added\": {}}]',5,1),(9,'2018-09-11 20:31:36.670574','4','Tag object (4)',1,'[{\"added\": {}}]',5,1),(10,'2018-09-11 20:31:55.924835','5','Tag object (5)',1,'[{\"added\": {}}]',5,1),(11,'2018-09-11 20:32:09.266230','6','Tag object (6)',1,'[{\"added\": {}}]',5,1),(12,'2018-09-11 22:02:02.500173','1','CodeSearchInfo object (1)',1,'[{\"added\": {}}]',2,1),(13,'2018-09-11 22:02:45.520399','2','CodeSearchInfo object (2)',1,'[{\"added\": {}}]',2,1),(14,'2018-09-11 22:40:34.841752','2','测试',2,'[{\"changed\": {\"fields\": [\"code_description\"]}}]',2,1),(15,'2018-09-12 00:28:34.601791','2','测试',2,'[{\"added\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\"}}, {\"added\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\"}}]',2,1),(16,'2018-09-12 00:28:53.805504','2','测试',2,'[]',2,1),(17,'2018-09-12 00:31:29.010712','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\", \"fields\": [\"order\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}]',2,1),(18,'2018-09-12 00:32:05.796832','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}]',2,1),(19,'2018-09-12 00:32:20.703103','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\", \"fields\": [\"order\"]}}]',2,1),(20,'2018-09-12 00:32:37.141843','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\", \"fields\": [\"order\"]}}]',2,1),(21,'2018-09-12 00:32:46.356413','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}]',2,1),(22,'2018-09-12 00:34:24.787186','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\", \"fields\": [\"order\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}]',2,1),(23,'2018-09-12 00:44:03.319801','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"abc\", \"fields\": [\"code_name\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"123\", \"fields\": [\"code_name\"]}}]',2,1),(24,'2018-09-12 00:44:14.324840','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"abc\", \"fields\": [\"order\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"123\", \"fields\": [\"order\"]}}]',2,1),(25,'2018-09-12 21:07:48.963198','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(26,'2018-09-12 21:49:37.530093','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(27,'2018-09-12 21:52:30.096611','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(28,'2018-09-12 21:53:20.287045','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(29,'2018-09-12 21:54:13.179904','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(30,'2018-09-12 21:59:34.440026','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(31,'2018-09-12 22:34:25.831783','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(32,'2018-09-12 22:35:14.494943','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(33,'2018-09-12 23:01:30.647019','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(34,'2018-09-12 23:02:19.072355','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(35,'2018-09-12 23:07:17.496938','1','Web2',2,'[{\"changed\": {\"fields\": [\"tag_text\"]}}]',5,1),(36,'2018-09-12 23:08:00.214584','1','Web2',3,'',5,1),(37,'2018-09-12 23:09:19.256407','7','Web',1,'[{\"added\": {}}]',5,1),(38,'2018-09-12 23:09:50.823232','1','web',2,'[{\"changed\": {\"fields\": [\"tag\"]}}]',2,1),(39,'2018-09-12 23:24:37.830868','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(40,'2018-09-12 23:34:33.869400','Python','Python',2,'[{\"changed\": {\"fields\": [\"lang\"]}}]',4,1),(41,'2018-09-12 23:35:04.560163','Python00','Python00',2,'[{\"changed\": {\"fields\": [\"lang\"]}}]',4,1),(42,'2018-09-12 23:35:37.610380','Python11','Python11',2,'[{\"changed\": {\"fields\": [\"lang\"]}}]',4,1),(43,'2018-09-12 23:36:51.621958','3','1',1,'[{\"added\": {}}]',2,1),(44,'2018-09-12 23:37:08.461656','Python11','Python11',3,'',4,1),(45,'2018-09-12 23:37:51.105029','Python00','Python00',3,'',4,1),(46,'2018-09-12 23:53:02.396470','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(47,'2018-09-12 23:54:25.386931','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(48,'2018-09-12 23:54:57.844652','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(49,'2018-09-12 23:55:21.847109','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(50,'2018-09-12 23:58:02.322273','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(51,'2018-09-12 23:58:15.412222','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(52,'2018-09-13 22:03:17.945311','2','测试',2,'[]',2,1),(53,'2018-09-13 22:04:04.656014','2','测试',2,'[]',2,1),(54,'2018-09-13 22:04:25.568020','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"123\", \"fields\": [\"code_content\"]}}]',2,1),(55,'2018-09-13 22:05:42.555154','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"123\", \"fields\": [\"code_content\"]}}]',2,1),(56,'2018-09-13 22:06:35.851303','2','测试',2,'[]',2,1),(57,'2018-09-13 22:08:16.357087','2','测试',2,'[]',2,1),(58,'2018-09-13 22:09:37.133182','1','web',2,'[]',2,1),(59,'2018-09-13 22:11:13.826186','2','测试',2,'[]',2,1),(60,'2018-09-13 22:12:06.494306','2','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(61,'2018-09-13 22:15:21.270372','1','web',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(62,'2018-09-13 22:19:42.041280','2','测试',2,'[]',2,1),(63,'2018-09-13 22:25:27.688108','1','web',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(64,'2018-09-13 22:27:40.755357','1','web',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(65,'2018-09-13 22:36:52.440412','1','web',2,'[]',2,1),(66,'2018-09-13 22:37:40.523642','2','测试',2,'[]',2,1),(67,'2018-09-13 22:39:15.235879','2','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(68,'2018-09-13 23:50:16.913657','2','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(69,'2018-09-13 23:55:46.910806','2','测试',2,'[]',2,1),(70,'2018-09-14 00:01:59.457934','2','测试',3,'',2,1),(71,'2018-09-14 00:01:59.459548','1','web',3,'',2,1),(72,'2018-09-14 00:05:39.743600','2','测试',3,'',2,1),(73,'2018-09-14 00:05:50.609862','1','web',3,'',2,1),(74,'2018-09-14 00:09:15.093606','4','web',1,'[{\"added\": {}}]',2,1),(75,'2018-09-14 00:09:43.659243','5','测试',1,'[{\"added\": {}}]',2,1),(76,'2018-09-14 00:12:48.419880','5','测试',2,'[]',2,1),(77,'2018-09-14 00:25:59.640652','5','测试',2,'[]',2,1),(78,'2018-09-14 00:27:50.389907','5','测试',2,'[]',2,1),(79,'2018-09-14 00:28:11.674266','5','测试',2,'[]',2,1),(80,'2018-09-14 00:28:39.426400','5','测试',2,'[]',2,1),(81,'2018-09-14 00:30:19.114607','5','测试',2,'[]',2,1),(82,'2018-09-14 00:31:38.939027','5','测试',2,'[]',2,1),(83,'2018-09-14 00:33:29.851044','5','测试',2,'[]',2,1),(84,'2018-09-14 00:34:09.761267','5','测试',2,'[]',2,1),(85,'2018-09-14 00:34:31.949214','5','测试',2,'[]',2,1),(86,'2018-09-14 00:36:37.428414','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(87,'2018-09-14 00:37:50.133415','5','测试',2,'[]',2,1),(88,'2018-09-14 00:40:28.665208','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(89,'2018-09-14 00:42:01.110555','5','测试',2,'[]',2,1),(90,'2018-09-14 00:42:28.842039','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(91,'2018-09-14 00:46:13.054509','5','测试',2,'[]',2,1),(92,'2018-09-14 00:46:34.007395','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(93,'2018-09-14 00:48:16.333247','5','测试',2,'[]',2,1),(94,'2018-09-14 22:25:01.438534','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(95,'2018-09-14 22:38:21.190490','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(96,'2018-09-14 22:42:42.235502','5','测试',2,'[]',2,1),(97,'2018-09-14 23:14:14.926399','4','web',2,'[]',2,1),(98,'2018-09-14 23:14:22.210298','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(99,'2018-09-14 23:15:16.231769','5','测试',2,'[]',2,1),(100,'2018-09-14 23:15:36.216466','5','测试',2,'[]',2,1),(101,'2018-09-14 23:15:53.155212','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(102,'2018-09-14 23:16:16.050172','5','测试',2,'[]',2,1),(103,'2018-09-14 23:16:22.231247','5','测试',2,'[]',2,1),(104,'2018-09-14 23:16:36.085706','4','web',2,'[]',2,1),(105,'2018-09-14 23:16:42.490865','5','测试',2,'[]',2,1),(106,'2018-09-14 23:17:06.315608','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(107,'2018-09-14 23:17:30.590297','5','测试',2,'[]',2,1),(108,'2018-09-14 23:19:45.570674','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(109,'2018-09-14 23:20:56.441195','5','测试',3,'',2,1),(110,'2018-09-14 23:25:05.810318','4','web',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(111,'2018-09-14 23:27:11.030779','4','web',3,'',2,1),(112,'2018-09-14 23:29:42.529705','5','key',1,'[{\"added\": {}}]',2,1),(113,'2018-09-14 23:31:04.688062','6','key2',1,'[{\"added\": {}}]',2,1),(114,'2018-09-14 23:32:21.944981','6','key2',3,'',2,1),(115,'2018-09-14 23:33:15.864724','5','key',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(116,'2018-09-14 23:33:44.972613','5','key',3,'',2,1),(117,'2018-09-14 23:33:44.983553','4','web',3,'',2,1),(118,'2018-09-14 23:34:51.279758','7','key',1,'[{\"added\": {}}]',2,1),(119,'2018-09-14 23:35:48.467055','7','key',3,'',2,1),(120,'2018-09-14 23:37:26.072757','7','key',3,'',2,1),(121,'2018-09-14 23:48:10.406412','8','key',1,'[{\"added\": {}}]',2,1),(122,'2018-09-14 23:48:38.295948','9','png',1,'[{\"added\": {}}]',2,1),(123,'2018-09-14 23:48:44.857037','9','png',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(124,'2018-09-14 23:49:13.762468','8','key',3,'',2,1),(125,'2018-09-14 23:49:51.862496','9','png',3,'',2,1),(126,'2018-09-14 23:52:48.737616','9','png',3,'',2,1),(127,'2018-09-14 23:54:30.846512','9','png',3,'',2,1),(128,'2018-09-14 23:55:51.265004','9','png',3,'',2,1),(129,'2018-09-15 00:02:09.604111','9','png',3,'',2,1),(130,'2018-09-15 00:05:23.227770','9','png',3,'',2,1),(131,'2018-09-15 00:05:56.726808','9','png',3,'',2,1),(132,'2018-09-15 00:11:35.219202','9','png',3,'',2,1),(133,'2018-09-15 00:21:29.286871','9','png',3,'',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(9,'auth','user'),(1,'clibs','codelib'),(2,'clibs','codesearchinfo'),(3,'clibs','extrainfo'),(4,'clibs','language'),(5,'clibs','tag'),(10,'contenttypes','contenttype'),(11,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-09-11 00:08:25.147760'),(2,'auth','0001_initial','2018-09-11 00:08:25.365954'),(3,'admin','0001_initial','2018-09-11 00:08:25.423416'),(4,'admin','0002_logentry_remove_auto_add','2018-09-11 00:08:25.431065'),(5,'admin','0003_logentry_add_action_flag_choices','2018-09-11 00:08:25.439117'),(6,'contenttypes','0002_remove_content_type_name','2018-09-11 00:08:25.489983'),(7,'auth','0002_alter_permission_name_max_length','2018-09-11 00:08:25.509599'),(8,'auth','0003_alter_user_email_max_length','2018-09-11 00:08:25.522128'),(9,'auth','0004_alter_user_username_opts','2018-09-11 00:08:25.528180'),(10,'auth','0005_alter_user_last_login_null','2018-09-11 00:08:25.546917'),(11,'auth','0006_require_contenttypes_0002','2018-09-11 00:08:25.548744'),(12,'auth','0007_alter_validators_add_error_messages','2018-09-11 00:08:25.564996'),(13,'auth','0008_alter_user_username_max_length','2018-09-11 00:08:25.581302'),(14,'auth','0009_alter_user_last_name_max_length','2018-09-11 00:08:25.596025'),(15,'clibs','0001_initial','2018-09-11 00:08:25.711561'),(16,'sessions','0001_initial','2018-09-11 00:08:25.736796'),(17,'clibs','0002_auto_20180912_2106','2018-09-12 21:06:56.023693'),(18,'clibs','0003_auto_20180913_2057','2018-09-13 20:58:08.084606'),(19,'clibs','0004_auto_20180914_0006','2018-09-14 00:08:22.511938');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('mmzntv4ftzjpyysqy4jsnxboasqbwpo6','OTdiOWRiY2RjNDdjZGNjNjg5OWJiNTkyNzNlYTQzNjgyNmExMWMwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMmVhY2QzZDFmOWYyMjhhNzdmYWQ5ODhlN2IwMDUzZDg1OTcxZWFlIn0=','2018-09-25 20:13:07.280877'),('uwcy6m4uycbomi473n7nz5caunn3pf7f','OTdiOWRiY2RjNDdjZGNjNjg5OWJiNTkyNzNlYTQzNjgyNmExMWMwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMmVhY2QzZDFmOWYyMjhhNzdmYWQ5ODhlN2IwMDUzZDg1OTcxZWFlIn0=','2018-09-25 00:10:30.464705');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-15 14:54:22
