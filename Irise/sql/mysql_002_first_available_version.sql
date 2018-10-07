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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add code lib',1,'add_codelib'),(2,'Can change code lib',1,'change_codelib'),(3,'Can delete code lib',1,'delete_codelib'),(4,'Can view code lib',1,'view_codelib'),(5,'Can add code search info',2,'add_codesearchinfo'),(6,'Can change code search info',2,'change_codesearchinfo'),(7,'Can delete code search info',2,'delete_codesearchinfo'),(8,'Can view code search info',2,'view_codesearchinfo'),(9,'Can add extra info',3,'add_extrainfo'),(10,'Can change extra info',3,'change_extrainfo'),(11,'Can delete extra info',3,'delete_extrainfo'),(12,'Can view extra info',3,'view_extrainfo'),(13,'Can add language',4,'add_language'),(14,'Can change language',4,'change_language'),(15,'Can delete language',4,'delete_language'),(16,'Can view language',4,'view_language'),(17,'Can add tag',5,'add_tag'),(18,'Can change tag',5,'change_tag'),(19,'Can delete tag',5,'delete_tag'),(20,'Can view tag',5,'view_tag'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add content type',10,'add_contenttype'),(38,'Can change content type',10,'change_contenttype'),(39,'Can delete content type',10,'delete_contenttype'),(40,'Can view content type',10,'view_contenttype'),(41,'Can add session',11,'add_session'),(42,'Can change session',11,'change_session'),(43,'Can delete session',11,'delete_session'),(44,'Can view session',11,'view_session'),(45,'Can add cmd history',12,'add_cmdhistory'),(46,'Can change cmd history',12,'change_cmdhistory'),(47,'Can delete cmd history',12,'delete_cmdhistory'),(48,'Can view cmd history',12,'view_cmdhistory'),(49,'Can add input history',13,'add_inputhistory'),(50,'Can change input history',13,'change_inputhistory'),(51,'Can delete input history',13,'delete_inputhistory'),(52,'Can view input history',13,'view_inputhistory'),(53,'Can add output history',14,'add_outputhistory'),(54,'Can change output history',14,'change_outputhistory'),(55,'Can delete output history',14,'delete_outputhistory'),(56,'Can view output history',14,'view_outputhistory'),(57,'Can add page row',15,'add_pagerow'),(58,'Can change page row',15,'change_pagerow'),(59,'Can delete page row',15,'delete_pagerow'),(60,'Can view page row',15,'view_pagerow'),(61,'Can add task',16,'add_task'),(62,'Can change task',16,'change_task'),(63,'Can delete task',16,'delete_task'),(64,'Can view task',16,'view_task'),(65,'Can add page',17,'add_page'),(66,'Can change page',17,'change_page'),(67,'Can delete page',17,'delete_page'),(68,'Can view page',17,'view_page');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$2cYSQAzQZmjZ$yGlyHjWxGFqSS1iB3g/XHEfTMvdZbww+2+7orO9ks7Y=','2018-09-26 21:34:31.591194',1,'Irise','','','',1,1,'2018-09-11 00:10:18.526477');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clibs_codelib`
--

LOCK TABLES `clibs_codelib` WRITE;
/*!40000 ALTER TABLE `clibs_codelib` DISABLE KEYS */;
INSERT INTO `clibs_codelib` VALUES (1,'Caesar','#!/usr/bin/env python3\r\n# -*- coding: utf-8 -*-\r\n\r\nimport re\r\n\r\n\"\"\"\r\n{\r\n    \"Author\":\"evilb1ue\",\r\n    \"Language\":\"Python3\",\r\n    \"CodeDescription\":\"使用Caesar方法进行加解密\",\r\n    \"Cmd\":{\r\n        \"cmd_range\":{\r\n            \"Caption\":\"变换范围\",\r\n            \"Help\":\"Format(start,end),分号分隔，闭区间，可以写<span style=\'color:red\'>多个范围</span>，但每个范围必须区间<span style=\'color:red\'>长度一致</span>，默认范围为\'A\'-\'Z\'和\'a\'-\'z\'\",\r\n            \"View\":{\r\n            \"Type\":\"text\",\r\n            \"Default\":\"(65,90);(97,122);\"\r\n            }\r\n        },\r\n        \"cmd_ouput_format\":{\r\n            \"Caption\":\"输出格式\",\r\n            \"Help\":\"控制输出显示格式\",\r\n            \"View\":{\r\n                \"Type\":\"radio\",\r\n                \"List\":[\"人类友好\", \"机器友好\"],\r\n                \"Default\":\"人类友好\"\r\n            }		\r\n        },\r\n        \"cmd_filter\":{\r\n            \"Caption\":\"过滤关键词\",\r\n            \"Help\":\"未选择时，不过滤任何结果;选择后，将只保留含有关键字的结果，忽略大小写\",\r\n            \"View\":{\r\n                \"Type\":\"checkbox\",\r\n                \"List\":[\"flag\", \"key\"],\r\n                \"Default\":[]\r\n            }		\r\n        }\r\n    },\r\n    \"Input\":{\r\n        \"input_data\":{\r\n            \"Caption\":\"Input Data\",\r\n            \"Help\":\"输入\",\r\n            \"View\":{\r\n                \"Type\":\"textarea\",\r\n                \"Default\":\"\"						\r\n            }\r\n        }\r\n    },\r\n    \"Output\":{\r\n        \"output_data\":{\r\n            \"Caption\":\"Output Data\",\r\n            \"Help\":\"输出\",\r\n            \"View\":{\r\n                \"Type\":\"textarea\",\r\n                \"Default\":\"\"						\r\n            }\r\n        }\r\n    }\r\n}\r\n\"\"\"\r\n\r\n\"\"\"\r\n使用Json方式处理配置\r\nCaption 可选  如果不写，将显示为所在对象对应的Key名称 input_data output_data 测试\r\nHelp 可选  没有Help时，不显示提示信息  input_data output_data用来测试\r\nView 必须\r\nType 必须  Type为checkbox时，获取的是内容为字符串的数组，其余情况获取时就仅仅为字符串\r\nList 必须  仅用在Type为 radio 和 checkbox 时  其它情况不需要\r\nDefault 必须  checkbox时，为数组，空数组不选则   radio时，就为单个值\r\n第一个三引号注释，必须为配置Json   且属性名称必须用双引号\r\nCmd可以是空的，但不能没有  Input Output都是必须的\r\nCmd Input Output中的属性名都要不相同\r\nradio 的 Default必须指定一个值且只有一个值， checkbox Default可以指定空数组，或者字符串数组\r\n\"\"\"\r\n\r\n\r\n# 不处理异常，如果出现问题，就放弃执行，退回准备状态，假定数据都是正确格式进行处理\r\ndef handle(dict_cmd, dict_input, dict_output):\r\n\r\n    # 参数获取失败抛出KeyError\r\n    cmd_range = dict_cmd[\'cmd_range\']\r\n    # 应该是个字符串\r\n    cmd_output_format = dict_cmd[\'cmd_ouput_format\']\r\n    # 这里应该是个Array\r\n    cmd_filter = dict_cmd[\'cmd_filter\']\r\n    # 获取拆分后的cmd_range,cmd_range中的元素是元组,失败抛出SyntaxError\r\n    cmd_range = [eval(x) for x in cmd_range.split(\';\') if x != \'\']\r\n    # 获取输入数据\r\n    input_data = dict_input[\'input_data\']\r\n    # 调用caesar方法,内部处理了dict_output\r\n    caesar(cmd_range, cmd_output_format, cmd_filter, input_data, dict_output)\r\n\r\n    return dict_output\r\n\r\n\r\ndef caesar(cmd_range, cmd_output_format, cmd_filter, input_data, dict_output):\r\n    max_offset = cmd_range[0][1] - cmd_range[0][0]\r\n    mod_num = max_offset + 1\r\n    case_arr = []\r\n\r\n    for offset in range(0, mod_num):\r\n        str_content = \'\'\r\n        if cmd_output_format == \'人类友好\':\r\n            str_content = \'偏移K=\' + offset.__str__() + \':\'\r\n        for c in input_data:\r\n            flag_in = False\r\n            flag_in_start = -1\r\n            for r in cmd_range:\r\n                if r[0] <= ord(c) <= r[1]:\r\n                    flag_in = True\r\n                    flag_in_start = r[0]\r\n                    break\r\n            if flag_in:\r\n                caesar_num = flag_in_start + (ord(c) - flag_in_start + offset) % mod_num\r\n                # 将c转换为新值\r\n                c = chr(caesar_num)\r\n            str_content += c\r\n        case_arr.append(str_content)\r\n    str_content = \'\'\r\n    for s in case_arr:\r\n        if len(cmd_filter) == 0:\r\n            flag_in = True\r\n        else:\r\n            flag_in = False\r\n            for f in cmd_filter:\r\n                if re.search(f, s, re.I) is not None:\r\n                    flag_in = True\r\n                    break\r\n        if flag_in:\r\n            str_content += s + \'\\n\'\r\n    dict_output[\'output_data\'] = str_content\r\n    return dict_output\r\n\r\n\r\n# 入口函数\r\ndef main(context, dict_cmd, dict_input, dict_output):\r\n    return handle(dict_cmd, dict_input, dict_output)\r\n\r\n# context dict_cmd dict_input dict_output 在执行时会动传递\r\n# main(context=context, dict_cmd=dict_cmd, dict_input=dict_input, dict_output=dict_output)\r\n# main(context,dict_cmd,dict_input,dict_output)\r\n#handle(b, c, d)\r\n# print(context,dict_cmd,main)\r\nmain(context, dict_cmd, dict_input, dict_output)\r\n# test\r\nprint(main(context={}, dict_cmd= {\'cmd_range\': \'(65,90);(97,122);\', \'cmd_ouput_format\': \'人类友好\', \'cmd_filter\': []}, dict_input= {\'input_data\':\'Uryyb, Unpxre jbeyq!\'}, dict_output={})[\'output_data\'])',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clibs_codesearchinfo`
--

LOCK TABLES `clibs_codesearchinfo` WRITE;
/*!40000 ALTER TABLE `clibs_codesearchinfo` DISABLE KEYS */;
INSERT INTO `clibs_codesearchinfo` VALUES (1,'Caesar','凯撒密码','2018-09-28 00:02:17.611201','2018-10-06 13:43:22.821021','','Python3',''),(2,'Fence','栅栏密码','2018-09-28 00:04:16.512459','2018-09-28 00:04:16.512482','','Python3','');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clibs_codesearchinfo_tag`
--

LOCK TABLES `clibs_codesearchinfo_tag` WRITE;
/*!40000 ALTER TABLE `clibs_codesearchinfo_tag` DISABLE KEYS */;
INSERT INTO `clibs_codesearchinfo_tag` VALUES (1,1,2),(2,2,2);
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
-- Table structure for table `cviews_cmdhistory`
--

DROP TABLE IF EXISTS `cviews_cmdhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cviews_cmdhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `value` longtext NOT NULL,
  `tid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cviews_cmdhistory_tid_id_14095277_fk_cviews_task_id` (`tid_id`),
  CONSTRAINT `cviews_cmdhistory_tid_id_14095277_fk_cviews_task_id` FOREIGN KEY (`tid_id`) REFERENCES `cviews_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cviews_cmdhistory`
--

LOCK TABLES `cviews_cmdhistory` WRITE;
/*!40000 ALTER TABLE `cviews_cmdhistory` DISABLE KEYS */;
INSERT INTO `cviews_cmdhistory` VALUES (64,'cmd_range','(65,90);(97,122);',25),(65,'cmd_ouput_format','人类友好',25),(66,'cmd_filter','[]',25),(67,'cmd_range','(65,90);(97,122);',26),(68,'cmd_ouput_format','人类友好',26),(69,'cmd_filter','[]',26);
/*!40000 ALTER TABLE `cviews_cmdhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cviews_inputhistory`
--

DROP TABLE IF EXISTS `cviews_inputhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cviews_inputhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `value` longtext NOT NULL,
  `tid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cviews_inputhistory_tid_id_4e912374_fk_cviews_task_id` (`tid_id`),
  CONSTRAINT `cviews_inputhistory_tid_id_4e912374_fk_cviews_task_id` FOREIGN KEY (`tid_id`) REFERENCES `cviews_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cviews_inputhistory`
--

LOCK TABLES `cviews_inputhistory` WRITE;
/*!40000 ALTER TABLE `cviews_inputhistory` DISABLE KEYS */;
INSERT INTO `cviews_inputhistory` VALUES (24,'input_data','Uryyb, Unpxre jbeyq!',25),(25,'input_data','',26);
/*!40000 ALTER TABLE `cviews_inputhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cviews_outputhistory`
--

DROP TABLE IF EXISTS `cviews_outputhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cviews_outputhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `value` longtext NOT NULL,
  `tid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cviews_outputhistory_tid_id_72c8b4b2_fk_cviews_task_id` (`tid_id`),
  CONSTRAINT `cviews_outputhistory_tid_id_72c8b4b2_fk_cviews_task_id` FOREIGN KEY (`tid_id`) REFERENCES `cviews_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cviews_outputhistory`
--

LOCK TABLES `cviews_outputhistory` WRITE;
/*!40000 ALTER TABLE `cviews_outputhistory` DISABLE KEYS */;
INSERT INTO `cviews_outputhistory` VALUES (20,'output_data','偏移K=0:Uryyb, Unpxre jbeyq!\n偏移K=1:Vszzc, Voqysf kcfzr!\n偏移K=2:Wtaad, Wprztg ldgas!\n偏移K=3:Xubbe, Xqsauh mehbt!\n偏移K=4:Yvccf, Yrtbvi nficu!\n偏移K=5:Zwddg, Zsucwj ogjdv!\n偏移K=6:Axeeh, Atvdxk phkew!\n偏移K=7:Byffi, Buweyl qilfx!\n偏移K=8:Czggj, Cvxfzm rjmgy!\n偏移K=9:Dahhk, Dwygan sknhz!\n偏移K=10:Ebiil, Exzhbo tloia!\n偏移K=11:Fcjjm, Fyaicp umpjb!\n偏移K=12:Gdkkn, Gzbjdq vnqkc!\n偏移K=13:Hello, Hacker world!\n偏移K=14:Ifmmp, Ibdlfs xpsme!\n偏移K=15:Jgnnq, Jcemgt yqtnf!\n偏移K=16:Khoor, Kdfnhu zruog!\n偏移K=17:Lipps, Legoiv asvph!\n偏移K=18:Mjqqt, Mfhpjw btwqi!\n偏移K=19:Nkrru, Ngiqkx cuxrj!\n偏移K=20:Olssv, Ohjrly dvysk!\n偏移K=21:Pmttw, Piksmz ewztl!\n偏移K=22:Qnuux, Qjltna fxaum!\n偏移K=23:Rovvy, Rkmuob gybvn!\n偏移K=24:Spwwz, Slnvpc hzcwo!\n偏移K=25:Tqxxa, Tmowqd iadxp!\n',25),(21,'output_data','',26);
/*!40000 ALTER TABLE `cviews_outputhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cviews_page`
--

DROP TABLE IF EXISTS `cviews_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cviews_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `order` int(11) NOT NULL,
  `prid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cviews_page`
--

LOCK TABLES `cviews_page` WRITE;
/*!40000 ALTER TABLE `cviews_page` DISABLE KEYS */;
INSERT INTO `cviews_page` VALUES (1,'Web',1,-1),(2,'Crypto',2,1),(3,'Misc',3,-1),(4,'Reverse',4,-1),(5,'Pwn',5,-1);
/*!40000 ALTER TABLE `cviews_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cviews_pagerow`
--

DROP TABLE IF EXISTS `cviews_pagerow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cviews_pagerow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `order` int(11) NOT NULL,
  `pid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cviews_pagerow_pid_id_e9750761_fk_cviews_page_id` (`pid_id`),
  CONSTRAINT `cviews_pagerow_pid_id_e9750761_fk_cviews_page_id` FOREIGN KEY (`pid_id`) REFERENCES `cviews_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cviews_pagerow`
--

LOCK TABLES `cviews_pagerow` WRITE;
/*!40000 ALTER TABLE `cviews_pagerow` DISABLE KEYS */;
INSERT INTO `cviews_pagerow` VALUES (1,1,25,'凯撒密码',1,2);
/*!40000 ALTER TABLE `cviews_pagerow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cviews_task`
--

DROP TABLE IF EXISTS `cviews_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cviews_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `task_progress` int(11) NOT NULL,
  `prid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cviews_task_prid_id_2a276330_fk_cviews_pagerow_id` (`prid_id`),
  CONSTRAINT `cviews_task_prid_id_2a276330_fk_cviews_pagerow_id` FOREIGN KEY (`prid_id`) REFERENCES `cviews_pagerow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cviews_task`
--

LOCK TABLES `cviews_task` WRITE;
/*!40000 ALTER TABLE `cviews_task` DISABLE KEYS */;
INSERT INTO `cviews_task` VALUES (25,'2018-10-06 17:20:12.510064',2,1),(26,'2018-10-06 17:21:45.118363',0,1);
/*!40000 ALTER TABLE `cviews_task` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-09-11 20:24:30.460168','Bash','Language object (Bash)',1,'[{\"added\": {}}]',4,1),(2,'2018-09-11 20:25:15.611973','C/C++','Language object (C/C++)',1,'[{\"added\": {}}]',4,1),(3,'2018-09-11 20:26:03.036836','Python2','Language object (Python2)',1,'[{\"added\": {}}]',4,1),(4,'2018-09-11 20:26:08.692000','Python3','Language object (Python3)',1,'[{\"added\": {}}]',4,1),(5,'2018-09-11 20:26:23.924594','Javascript','Language object (Javascript)',1,'[{\"added\": {}}]',4,1),(6,'2018-09-11 20:29:06.315348','1','Tag object (1)',1,'[{\"added\": {}}]',5,1),(7,'2018-09-11 20:29:51.813756','2','Tag object (2)',1,'[{\"added\": {}}]',5,1),(8,'2018-09-11 20:31:21.188608','3','Tag object (3)',1,'[{\"added\": {}}]',5,1),(9,'2018-09-11 20:31:36.670574','4','Tag object (4)',1,'[{\"added\": {}}]',5,1),(10,'2018-09-11 20:31:55.924835','5','Tag object (5)',1,'[{\"added\": {}}]',5,1),(11,'2018-09-11 20:32:09.266230','6','Tag object (6)',1,'[{\"added\": {}}]',5,1),(12,'2018-09-11 22:02:02.500173','1','CodeSearchInfo object (1)',1,'[{\"added\": {}}]',2,1),(13,'2018-09-11 22:02:45.520399','2','CodeSearchInfo object (2)',1,'[{\"added\": {}}]',2,1),(14,'2018-09-11 22:40:34.841752','2','测试',2,'[{\"changed\": {\"fields\": [\"code_description\"]}}]',2,1),(15,'2018-09-12 00:28:34.601791','2','测试',2,'[{\"added\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\"}}, {\"added\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\"}}]',2,1),(16,'2018-09-12 00:28:53.805504','2','测试',2,'[]',2,1),(17,'2018-09-12 00:31:29.010712','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\", \"fields\": [\"order\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}]',2,1),(18,'2018-09-12 00:32:05.796832','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}]',2,1),(19,'2018-09-12 00:32:20.703103','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\", \"fields\": [\"order\"]}}]',2,1),(20,'2018-09-12 00:32:37.141843','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\", \"fields\": [\"order\"]}}]',2,1),(21,'2018-09-12 00:32:46.356413','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}]',2,1),(22,'2018-09-12 00:34:24.787186','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78011\", \"fields\": [\"order\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"\\u4ee3\\u78012\", \"fields\": [\"order\"]}}]',2,1),(23,'2018-09-12 00:44:03.319801','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"abc\", \"fields\": [\"code_name\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"123\", \"fields\": [\"code_name\"]}}]',2,1),(24,'2018-09-12 00:44:14.324840','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"abc\", \"fields\": [\"order\"]}}, {\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"123\", \"fields\": [\"order\"]}}]',2,1),(25,'2018-09-12 21:07:48.963198','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(26,'2018-09-12 21:49:37.530093','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(27,'2018-09-12 21:52:30.096611','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(28,'2018-09-12 21:53:20.287045','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(29,'2018-09-12 21:54:13.179904','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(30,'2018-09-12 21:59:34.440026','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(31,'2018-09-12 22:34:25.831783','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(32,'2018-09-12 22:35:14.494943','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(33,'2018-09-12 23:01:30.647019','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(34,'2018-09-12 23:02:19.072355','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(35,'2018-09-12 23:07:17.496938','1','Web2',2,'[{\"changed\": {\"fields\": [\"tag_text\"]}}]',5,1),(36,'2018-09-12 23:08:00.214584','1','Web2',3,'',5,1),(37,'2018-09-12 23:09:19.256407','7','Web',1,'[{\"added\": {}}]',5,1),(38,'2018-09-12 23:09:50.823232','1','web',2,'[{\"changed\": {\"fields\": [\"tag\"]}}]',2,1),(39,'2018-09-12 23:24:37.830868','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(40,'2018-09-12 23:34:33.869400','Python','Python',2,'[{\"changed\": {\"fields\": [\"lang\"]}}]',4,1),(41,'2018-09-12 23:35:04.560163','Python00','Python00',2,'[{\"changed\": {\"fields\": [\"lang\"]}}]',4,1),(42,'2018-09-12 23:35:37.610380','Python11','Python11',2,'[{\"changed\": {\"fields\": [\"lang\"]}}]',4,1),(43,'2018-09-12 23:36:51.621958','3','1',1,'[{\"added\": {}}]',2,1),(44,'2018-09-12 23:37:08.461656','Python11','Python11',3,'',4,1),(45,'2018-09-12 23:37:51.105029','Python00','Python00',3,'',4,1),(46,'2018-09-12 23:53:02.396470','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(47,'2018-09-12 23:54:25.386931','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(48,'2018-09-12 23:54:57.844652','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(49,'2018-09-12 23:55:21.847109','1','web',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(50,'2018-09-12 23:58:02.322273','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(51,'2018-09-12 23:58:15.412222','2','测试',2,'[{\"changed\": {\"fields\": [\"extra_file\"]}}]',2,1),(52,'2018-09-13 22:03:17.945311','2','测试',2,'[]',2,1),(53,'2018-09-13 22:04:04.656014','2','测试',2,'[]',2,1),(54,'2018-09-13 22:04:25.568020','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"123\", \"fields\": [\"code_content\"]}}]',2,1),(55,'2018-09-13 22:05:42.555154','2','测试',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"123\", \"fields\": [\"code_content\"]}}]',2,1),(56,'2018-09-13 22:06:35.851303','2','测试',2,'[]',2,1),(57,'2018-09-13 22:08:16.357087','2','测试',2,'[]',2,1),(58,'2018-09-13 22:09:37.133182','1','web',2,'[]',2,1),(59,'2018-09-13 22:11:13.826186','2','测试',2,'[]',2,1),(60,'2018-09-13 22:12:06.494306','2','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(61,'2018-09-13 22:15:21.270372','1','web',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(62,'2018-09-13 22:19:42.041280','2','测试',2,'[]',2,1),(63,'2018-09-13 22:25:27.688108','1','web',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(64,'2018-09-13 22:27:40.755357','1','web',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(65,'2018-09-13 22:36:52.440412','1','web',2,'[]',2,1),(66,'2018-09-13 22:37:40.523642','2','测试',2,'[]',2,1),(67,'2018-09-13 22:39:15.235879','2','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(68,'2018-09-13 23:50:16.913657','2','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(69,'2018-09-13 23:55:46.910806','2','测试',2,'[]',2,1),(70,'2018-09-14 00:01:59.457934','2','测试',3,'',2,1),(71,'2018-09-14 00:01:59.459548','1','web',3,'',2,1),(72,'2018-09-14 00:05:39.743600','2','测试',3,'',2,1),(73,'2018-09-14 00:05:50.609862','1','web',3,'',2,1),(74,'2018-09-14 00:09:15.093606','4','web',1,'[{\"added\": {}}]',2,1),(75,'2018-09-14 00:09:43.659243','5','测试',1,'[{\"added\": {}}]',2,1),(76,'2018-09-14 00:12:48.419880','5','测试',2,'[]',2,1),(77,'2018-09-14 00:25:59.640652','5','测试',2,'[]',2,1),(78,'2018-09-14 00:27:50.389907','5','测试',2,'[]',2,1),(79,'2018-09-14 00:28:11.674266','5','测试',2,'[]',2,1),(80,'2018-09-14 00:28:39.426400','5','测试',2,'[]',2,1),(81,'2018-09-14 00:30:19.114607','5','测试',2,'[]',2,1),(82,'2018-09-14 00:31:38.939027','5','测试',2,'[]',2,1),(83,'2018-09-14 00:33:29.851044','5','测试',2,'[]',2,1),(84,'2018-09-14 00:34:09.761267','5','测试',2,'[]',2,1),(85,'2018-09-14 00:34:31.949214','5','测试',2,'[]',2,1),(86,'2018-09-14 00:36:37.428414','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(87,'2018-09-14 00:37:50.133415','5','测试',2,'[]',2,1),(88,'2018-09-14 00:40:28.665208','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(89,'2018-09-14 00:42:01.110555','5','测试',2,'[]',2,1),(90,'2018-09-14 00:42:28.842039','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(91,'2018-09-14 00:46:13.054509','5','测试',2,'[]',2,1),(92,'2018-09-14 00:46:34.007395','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(93,'2018-09-14 00:48:16.333247','5','测试',2,'[]',2,1),(94,'2018-09-14 22:25:01.438534','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(95,'2018-09-14 22:38:21.190490','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(96,'2018-09-14 22:42:42.235502','5','测试',2,'[]',2,1),(97,'2018-09-14 23:14:14.926399','4','web',2,'[]',2,1),(98,'2018-09-14 23:14:22.210298','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(99,'2018-09-14 23:15:16.231769','5','测试',2,'[]',2,1),(100,'2018-09-14 23:15:36.216466','5','测试',2,'[]',2,1),(101,'2018-09-14 23:15:53.155212','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(102,'2018-09-14 23:16:16.050172','5','测试',2,'[]',2,1),(103,'2018-09-14 23:16:22.231247','5','测试',2,'[]',2,1),(104,'2018-09-14 23:16:36.085706','4','web',2,'[]',2,1),(105,'2018-09-14 23:16:42.490865','5','测试',2,'[]',2,1),(106,'2018-09-14 23:17:06.315608','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(107,'2018-09-14 23:17:30.590297','5','测试',2,'[]',2,1),(108,'2018-09-14 23:19:45.570674','5','测试',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(109,'2018-09-14 23:20:56.441195','5','测试',3,'',2,1),(110,'2018-09-14 23:25:05.810318','4','web',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(111,'2018-09-14 23:27:11.030779','4','web',3,'',2,1),(112,'2018-09-14 23:29:42.529705','5','key',1,'[{\"added\": {}}]',2,1),(113,'2018-09-14 23:31:04.688062','6','key2',1,'[{\"added\": {}}]',2,1),(114,'2018-09-14 23:32:21.944981','6','key2',3,'',2,1),(115,'2018-09-14 23:33:15.864724','5','key',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(116,'2018-09-14 23:33:44.972613','5','key',3,'',2,1),(117,'2018-09-14 23:33:44.983553','4','web',3,'',2,1),(118,'2018-09-14 23:34:51.279758','7','key',1,'[{\"added\": {}}]',2,1),(119,'2018-09-14 23:35:48.467055','7','key',3,'',2,1),(120,'2018-09-14 23:37:26.072757','7','key',3,'',2,1),(121,'2018-09-14 23:48:10.406412','8','key',1,'[{\"added\": {}}]',2,1),(122,'2018-09-14 23:48:38.295948','9','png',1,'[{\"added\": {}}]',2,1),(123,'2018-09-14 23:48:44.857037','9','png',2,'[{\"changed\": {\"fields\": [\"file\"]}}]',2,1),(124,'2018-09-14 23:49:13.762468','8','key',3,'',2,1),(125,'2018-09-14 23:49:51.862496','9','png',3,'',2,1),(126,'2018-09-14 23:52:48.737616','9','png',3,'',2,1),(127,'2018-09-14 23:54:30.846512','9','png',3,'',2,1),(128,'2018-09-14 23:55:51.265004','9','png',3,'',2,1),(129,'2018-09-15 00:02:09.604111','9','png',3,'',2,1),(130,'2018-09-15 00:05:23.227770','9','png',3,'',2,1),(131,'2018-09-15 00:05:56.726808','9','png',3,'',2,1),(132,'2018-09-15 00:11:35.219202','9','png',3,'',2,1),(133,'2018-09-15 00:21:29.286871','9','png',3,'',2,1),(134,'2018-09-26 21:37:02.663733','1','Page object (1)',1,'[{\"added\": {}}]',17,1),(135,'2018-09-26 21:37:16.958400','2','Page object (2)',1,'[{\"added\": {}}]',17,1),(136,'2018-09-26 21:37:31.297185','3','Page object (3)',1,'[{\"added\": {}}]',17,1),(137,'2018-09-26 21:37:38.947664','4','Page object (4)',1,'[{\"added\": {}}]',17,1),(138,'2018-09-26 21:38:00.291867','5','Page object (5)',1,'[{\"added\": {}}]',17,1),(139,'2018-09-26 21:41:07.245103','7','5',1,'[{\"added\": {}}]',17,1),(140,'2018-09-27 20:58:00.272341','7','6',2,'[{\"changed\": {\"fields\": [\"order\"]}}]',17,1),(141,'2018-09-27 20:58:06.353159','5','Pwn',2,'[{\"changed\": {\"fields\": [\"order\"]}}]',17,1),(142,'2018-09-27 20:58:11.106285','4','Reverse',2,'[{\"changed\": {\"fields\": [\"order\"]}}]',17,1),(143,'2018-09-27 20:58:15.758018','3','Misc',2,'[{\"changed\": {\"fields\": [\"order\"]}}]',17,1),(144,'2018-09-27 20:58:21.414820','2','Crypto',2,'[{\"changed\": {\"fields\": [\"order\"]}}]',17,1),(145,'2018-09-27 20:58:26.079308','1','Web',2,'[{\"changed\": {\"fields\": [\"order\"]}}]',17,1),(146,'2018-09-28 00:02:17.691288','1','Caesar',1,'[{\"added\": {}}]',2,1),(147,'2018-09-28 00:04:16.568421','2','Fence',1,'[{\"added\": {}}]',2,1),(148,'2018-09-28 00:07:34.256377','1','凯撒',1,'[{\"added\": {}}]',15,1),(149,'2018-09-28 00:08:09.736199','2','栅栏密码',1,'[{\"added\": {}}]',15,1),(150,'2018-09-28 00:08:23.956787','1','凯撒密码',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',15,1),(151,'2018-09-28 21:05:38.599854','2','Crypto',2,'[{\"changed\": {\"fields\": [\"prid\"]}}]',17,1),(152,'2018-09-30 22:25:31.342790','1','Caesar',2,'[{\"added\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\"}}]',2,1),(153,'2018-10-02 16:32:13.596292','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(154,'2018-10-02 17:10:34.207922','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(155,'2018-10-02 17:11:00.686341','1','Caesar',2,'[]',2,1),(156,'2018-10-02 21:17:42.673381','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(157,'2018-10-02 22:23:02.421345','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(158,'2018-10-02 22:34:31.205155','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(159,'2018-10-02 22:35:03.047872','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(160,'2018-10-02 22:59:31.934406','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(161,'2018-10-02 23:01:08.824880','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(162,'2018-10-02 23:10:58.122441','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(163,'2018-10-02 23:11:24.115161','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(164,'2018-10-04 00:14:53.481390','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(165,'2018-10-04 00:16:20.995397','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(166,'2018-10-04 00:17:37.510548','1','Caesar',2,'[]',2,1),(167,'2018-10-04 00:20:11.749918','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(168,'2018-10-04 00:40:50.958210','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(169,'2018-10-06 11:33:32.209646','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(170,'2018-10-06 11:44:03.556613','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(171,'2018-10-06 11:46:31.045985','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(172,'2018-10-06 12:57:38.861671','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(173,'2018-10-06 12:58:53.649685','9','2018-10-06 11:35:00.904417 progress:0',2,'[{\"changed\": {\"fields\": [\"task_progress\"]}}]',16,1),(174,'2018-10-06 13:12:14.186944','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(175,'2018-10-06 13:13:17.681817','9','2018-10-06 11:35:00.904417 progress:0',2,'[{\"changed\": {\"fields\": [\"task_progress\"]}}]',16,1),(176,'2018-10-06 13:17:16.179402','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(177,'2018-10-06 13:18:26.516177','9','2018-10-06 11:35:00.904417 progress:0',2,'[{\"changed\": {\"fields\": [\"task_progress\"]}}]',16,1),(178,'2018-10-06 13:20:46.710701','9','2018-10-06 11:35:00.904417 progress:0',2,'[{\"changed\": {\"fields\": [\"task_progress\"]}}]',16,1),(179,'2018-10-06 13:23:14.049788','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(180,'2018-10-06 13:28:11.558345','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(181,'2018-10-06 13:29:41.436009','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(182,'2018-10-06 13:29:55.601438','9','2018-10-06 11:35:00.904417 progress:0',2,'[{\"changed\": {\"fields\": [\"task_progress\"]}}]',16,1),(183,'2018-10-06 13:30:32.463325','9','2018-10-06 11:35:00.904417 progress:0',2,'[{\"changed\": {\"fields\": [\"task_progress\"]}}]',16,1),(184,'2018-10-06 13:31:29.879682','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(185,'2018-10-06 13:31:38.941815','9','2018-10-06 11:35:00.904417 progress:0',2,'[{\"changed\": {\"fields\": [\"task_progress\"]}}]',16,1),(186,'2018-10-06 13:33:44.740728','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(187,'2018-10-06 13:33:59.635971','9','2018-10-06 11:35:00.904417 progress:0',2,'[{\"changed\": {\"fields\": [\"task_progress\"]}}]',16,1),(188,'2018-10-06 13:35:23.375264','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(189,'2018-10-06 13:38:28.697194','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(190,'2018-10-06 13:40:16.274844','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(191,'2018-10-06 13:43:22.850216','1','Caesar',2,'[{\"changed\": {\"name\": \"\\u4ee3\\u7801\", \"object\": \"Caesar\", \"fields\": [\"code_content\"]}}]',2,1),(192,'2018-10-07 11:02:20.921569','2','栅栏密码',3,'',15,1),(193,'2018-10-07 11:02:38.038688','7','6',3,'',17,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(9,'auth','user'),(1,'clibs','codelib'),(2,'clibs','codesearchinfo'),(3,'clibs','extrainfo'),(4,'clibs','language'),(5,'clibs','tag'),(10,'contenttypes','contenttype'),(12,'cviews','cmdhistory'),(13,'cviews','inputhistory'),(14,'cviews','outputhistory'),(17,'cviews','page'),(15,'cviews','pagerow'),(16,'cviews','task'),(11,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-09-11 00:08:25.147760'),(2,'auth','0001_initial','2018-09-11 00:08:25.365954'),(3,'admin','0001_initial','2018-09-11 00:08:25.423416'),(4,'admin','0002_logentry_remove_auto_add','2018-09-11 00:08:25.431065'),(5,'admin','0003_logentry_add_action_flag_choices','2018-09-11 00:08:25.439117'),(6,'contenttypes','0002_remove_content_type_name','2018-09-11 00:08:25.489983'),(7,'auth','0002_alter_permission_name_max_length','2018-09-11 00:08:25.509599'),(8,'auth','0003_alter_user_email_max_length','2018-09-11 00:08:25.522128'),(9,'auth','0004_alter_user_username_opts','2018-09-11 00:08:25.528180'),(10,'auth','0005_alter_user_last_login_null','2018-09-11 00:08:25.546917'),(11,'auth','0006_require_contenttypes_0002','2018-09-11 00:08:25.548744'),(12,'auth','0007_alter_validators_add_error_messages','2018-09-11 00:08:25.564996'),(13,'auth','0008_alter_user_username_max_length','2018-09-11 00:08:25.581302'),(14,'auth','0009_alter_user_last_name_max_length','2018-09-11 00:08:25.596025'),(15,'clibs','0001_initial','2018-09-11 00:08:25.711561'),(16,'sessions','0001_initial','2018-09-11 00:08:25.736796'),(17,'clibs','0002_auto_20180912_2106','2018-09-12 21:06:56.023693'),(18,'clibs','0003_auto_20180913_2057','2018-09-13 20:58:08.084606'),(19,'clibs','0004_auto_20180914_0006','2018-09-14 00:08:22.511938'),(20,'cviews','0001_initial','2018-09-24 21:01:29.016144'),(21,'cviews','0002_page_prid','2018-09-25 21:25:29.811152'),(22,'cviews','0003_auto_20181003_2235','2018-10-03 22:36:00.227424'),(23,'cviews','0004_auto_20181003_2337','2018-10-03 23:37:21.681310');
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
INSERT INTO `django_session` VALUES ('iuqjhxqcraaoc8buf3xtszy8ufg82i93','OTdiOWRiY2RjNDdjZGNjNjg5OWJiNTkyNzNlYTQzNjgyNmExMWMwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMmVhY2QzZDFmOWYyMjhhNzdmYWQ5ODhlN2IwMDUzZDg1OTcxZWFlIn0=','2018-10-10 21:34:31.687028'),('mmzntv4ftzjpyysqy4jsnxboasqbwpo6','OTdiOWRiY2RjNDdjZGNjNjg5OWJiNTkyNzNlYTQzNjgyNmExMWMwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMmVhY2QzZDFmOWYyMjhhNzdmYWQ5ODhlN2IwMDUzZDg1OTcxZWFlIn0=','2018-09-25 20:13:07.280877'),('uwcy6m4uycbomi473n7nz5caunn3pf7f','OTdiOWRiY2RjNDdjZGNjNjg5OWJiNTkyNzNlYTQzNjgyNmExMWMwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMmVhY2QzZDFmOWYyMjhhNzdmYWQ5ODhlN2IwMDUzZDg1OTcxZWFlIn0=','2018-09-25 00:10:30.464705');
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

-- Dump completed on 2018-10-07 11:03:33
