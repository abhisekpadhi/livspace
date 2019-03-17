-- MySQL dump 10.13  Distrib 8.0.11, for macos10.13 (x86_64)
--
-- Host: localhost    Database: livspace
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_choice`
--

DROP TABLE IF EXISTS `api_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(1024) NOT NULL,
  `is_inactive` tinyint(1) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_choice_question_id_b820d384_fk_api_question_id` (`question_id`),
  CONSTRAINT `api_choice_question_id_b820d384_fk_api_question_id` FOREIGN KEY (`question_id`) REFERENCES `api_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_choice`
--

LOCK TABLES `api_choice` WRITE;
/*!40000 ALTER TABLE `api_choice` DISABLE KEYS */;
INSERT INTO `api_choice` VALUES (1,'30-50',0,1),(2,'50-70',0,1),(3,'70+',0,1),(4,'Male',0,2),(5,'Female',0,2),(6,'Office',0,3),(7,'Playing Ground',0,3),(8,'Personal Home',0,3),(9,'Bar',0,3),(10,'Marriage Palace',0,3),(11,'Dining',0,4),(12,'Kitchen',0,4),(13,'Pet space',0,4),(14,'Ground',0,4),(15,'Tennis Court',0,4),(16,'Master Bedroom',0,4),(17,'Children Room',0,4),(18,'Guest Room',0,4),(19,'Washroom',0,4),(20,'Hall',0,4),(21,'Library',0,4),(22,'Retro',0,5),(23,'Modern',0,5),(24,'Traditional',0,5),(25,'Regional',0,5),(26,'Classic',0,5),(27,'Marvel Theme',0,5),(28,'Captain America Theme',0,5),(29,'RED',0,6),(30,'GREEN',0,6),(31,'BLUE',0,6),(32,'MAGENTA',0,6),(33,'WHITE',0,6),(34,'5000-20000',0,7),(35,'20000-50000',0,7),(36,'50000-100000',0,7),(37,'100000+',0,7),(38,'YES',0,8),(39,'NO',0,8),(40,'Badminton',0,9),(41,'Tennis',0,9),(42,'Football',0,9),(43,'Chess',0,9),(44,'Swimming',0,9),(45,'Writing',0,9),(46,'Reading',0,9),(47,'2 months',0,10),(48,'6 months',0,10),(49,'1 year',0,10),(50,'1-2 year',0,10),(51,'2-5 year',0,10);
/*!40000 ALTER TABLE `api_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_design`
--

DROP TABLE IF EXISTS `api_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_design`
--

LOCK TABLES `api_design` WRITE;
/*!40000 ALTER TABLE `api_design` DISABLE KEYS */;
INSERT INTO `api_design` VALUES (1,'/static/images/Vittoria-Orlandi-6.jpg'),(2,'/static/images/Vittoria-Orlandi-6.jpg'),(3,'/static/images/Vittoria-Orlandi-6_JoAAJqx.jpg'),(4,'/static/images/Vittoria-Orlandi-6_lC4nMY5.jpg'),(5,'/static/images/3D-Interior-Design-Service-Contractorbhai-Modern-Design-4-400x265.jpg'),(6,'/static/images/T.jpg'),(7,'/static/images/M.jpg'),(8,'/static/images/royal-bedroom.jpg');
/*!40000 ALTER TABLE `api_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_designtagmapping`
--

DROP TABLE IF EXISTS `api_designtagmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_designtagmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `design_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_designtagmapping_design_id_2cda852b_fk_api_design_id` (`design_id`),
  KEY `api_designtagmapping_tag_id_73bf838b_fk_api_tag_id` (`tag_id`),
  CONSTRAINT `api_designtagmapping_design_id_2cda852b_fk_api_design_id` FOREIGN KEY (`design_id`) REFERENCES `api_design` (`id`),
  CONSTRAINT `api_designtagmapping_tag_id_73bf838b_fk_api_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `api_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_designtagmapping`
--

LOCK TABLES `api_designtagmapping` WRITE;
/*!40000 ALTER TABLE `api_designtagmapping` DISABLE KEYS */;
INSERT INTO `api_designtagmapping` VALUES (1,1,1),(2,1,1),(3,3,1),(4,4,1),(5,5,1),(6,1,1),(7,1,2),(8,1,4),(9,1,5),(10,1,8),(11,1,11),(12,1,12),(13,1,23),(14,1,30),(15,1,31),(16,1,33),(17,1,35),(18,1,36),(19,1,47),(20,6,1),(21,6,2),(22,6,4),(23,6,5),(24,6,8),(25,6,11),(26,6,12),(27,6,23),(28,6,30),(29,6,31),(30,6,33),(31,6,35),(32,6,36),(33,6,47),(34,7,1),(35,7,4),(36,7,6),(37,7,7),(38,7,20),(39,7,23),(40,7,31),(41,7,36),(42,7,42),(43,7,45),(44,7,48),(45,8,1);
/*!40000 ALTER TABLE `api_designtagmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_question`
--

DROP TABLE IF EXISTS `api_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `name` varchar(1024) NOT NULL,
  `type_for_customer` varchar(1024) DEFAULT NULL,
  `type_for_designer` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_question`
--

LOCK TABLES `api_question` WRITE;
/*!40000 ALTER TABLE `api_question` DISABLE KEYS */;
INSERT INTO `api_question` VALUES (1,'What is your age bracket from following ?','age','single-select','multiple-select'),(2,'Gender ?','gender','single-select','multiple-select'),(3,'What is the purpose of place ?','purpose_of_place','multiple-select','multiple-select'),(4,'What kind of room you are looking for ?','room_type','multiple-select','multiple-select'),(5,'What kind of decor style you like ?','style_type','multiple-select','multiple-select'),(6,'Colour Choices ?','colour','multiple-select','multiple-select'),(7,'Budget Bracket ?','budget','single-select','multiple-select'),(8,'Do you require a vehicle parking space ?','vehicle','single-select','single-select'),(9,'Hobbies/Activities ?','hobby','single-select','multiple-select'),(10,'What is the suitable time frame for this decor project ?','time_frame','single-select','multiple-select');
/*!40000 ALTER TABLE `api_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_relatedtagmap`
--

DROP TABLE IF EXISTS `api_relatedtagmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_relatedtagmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_1_id` int(11) DEFAULT NULL,
  `tag_2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_relatedtagmap_tag_1_id_7265fa9e_fk_api_tag_id` (`tag_1_id`),
  KEY `api_relatedtagmap_tag_2_id_2b6d7a06_fk_api_tag_id` (`tag_2_id`),
  CONSTRAINT `api_relatedtagmap_tag_1_id_7265fa9e_fk_api_tag_id` FOREIGN KEY (`tag_1_id`) REFERENCES `api_tag` (`id`),
  CONSTRAINT `api_relatedtagmap_tag_2_id_2b6d7a06_fk_api_tag_id` FOREIGN KEY (`tag_2_id`) REFERENCES `api_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_relatedtagmap`
--

LOCK TABLES `api_relatedtagmap` WRITE;
/*!40000 ALTER TABLE `api_relatedtagmap` DISABLE KEYS */;
INSERT INTO `api_relatedtagmap` VALUES (1,1,7),(2,2,8),(3,2,9),(4,1,6),(5,8,11),(6,8,12),(7,8,13),(8,8,14),(9,8,15),(10,8,16),(11,8,17),(12,8,18),(13,8,19),(14,8,20),(15,8,21),(16,27,28),(17,43,24),(18,26,43);
/*!40000 ALTER TABLE `api_relatedtagmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tag`
--

DROP TABLE IF EXISTS `api_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_tag_choice_id_f28f2e5e_fk_api_choice_id` (`choice_id`),
  KEY `api_tag_question_id_f0dc6e3d_fk_api_question_id` (`question_id`),
  CONSTRAINT `api_tag_choice_id_f28f2e5e_fk_api_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `api_choice` (`id`),
  CONSTRAINT `api_tag_question_id_f0dc6e3d_fk_api_question_id` FOREIGN KEY (`question_id`) REFERENCES `api_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tag`
--

LOCK TABLES `api_tag` WRITE;
/*!40000 ALTER TABLE `api_tag` DISABLE KEYS */;
INSERT INTO `api_tag` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,2),(5,5,2),(6,6,3),(7,7,3),(8,8,3),(9,9,3),(10,10,3),(11,11,4),(12,12,4),(13,13,4),(14,14,4),(15,15,4),(16,16,4),(17,17,4),(18,18,4),(19,19,4),(20,20,4),(21,21,4),(22,22,5),(23,23,5),(24,24,5),(25,25,5),(26,26,5),(27,27,5),(28,28,5),(29,29,6),(30,30,6),(31,31,6),(32,32,6),(33,33,6),(34,34,7),(35,35,7),(36,36,7),(37,37,7),(38,38,8),(39,39,8),(40,40,9),(41,41,9),(42,42,9),(43,43,9),(44,44,9),(45,45,9),(46,46,9),(47,47,10),(48,48,10),(49,49,10),(50,50,10),(51,51,10);
/*!40000 ALTER TABLE `api_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_user`
--

DROP TABLE IF EXISTS `api_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `api_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_user`
--

LOCK TABLES `api_user` WRITE;
/*!40000 ALTER TABLE `api_user` DISABLE KEYS */;
INSERT INTO `api_user` VALUES (1,'avisek@gmail.com','2019-03-16 17:26:14','1'),(2,'nipun@gmail.com','2019-03-16 17:26:23','1'),(3,'shashank@gmail.com','2019-03-16 17:26:28','1');
/*!40000 ALTER TABLE `api_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add design',8,'add_design'),(30,'Can change design',8,'change_design'),(31,'Can delete design',8,'delete_design'),(32,'Can view design',8,'view_design'),(33,'Can add related tag map',9,'add_relatedtagmap'),(34,'Can change related tag map',9,'change_relatedtagmap'),(35,'Can delete related tag map',9,'delete_relatedtagmap'),(36,'Can view related tag map',9,'view_relatedtagmap'),(37,'Can add choice',10,'add_choice'),(38,'Can change choice',10,'change_choice'),(39,'Can delete choice',10,'delete_choice'),(40,'Can view choice',10,'view_choice'),(41,'Can add question',11,'add_question'),(42,'Can change question',11,'change_question'),(43,'Can delete question',11,'delete_question'),(44,'Can view question',11,'view_question'),(45,'Can add tag',12,'add_tag'),(46,'Can change tag',12,'change_tag'),(47,'Can delete tag',12,'delete_tag'),(48,'Can view tag',12,'view_tag'),(49,'Can add design tag mapping',13,'add_designtagmapping'),(50,'Can change design tag mapping',13,'change_designtagmapping'),(51,'Can delete design tag mapping',13,'delete_designtagmapping'),(52,'Can view design tag mapping',13,'view_designtagmapping');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(10,'api','choice'),(8,'api','design'),(13,'api','designtagmapping'),(11,'api','question'),(9,'api','relatedtagmap'),(12,'api','tag'),(7,'api','user'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-16 09:57:26.807243'),(2,'auth','0001_initial','2019-03-16 09:57:26.995407'),(3,'admin','0001_initial','2019-03-16 09:57:27.051340'),(4,'admin','0002_logentry_remove_auto_add','2019-03-16 09:57:27.059610'),(5,'admin','0003_logentry_add_action_flag_choices','2019-03-16 09:57:27.068304'),(6,'contenttypes','0002_remove_content_type_name','2019-03-16 09:57:27.113693'),(7,'auth','0002_alter_permission_name_max_length','2019-03-16 09:57:27.149284'),(8,'auth','0003_alter_user_email_max_length','2019-03-16 09:57:27.170041'),(9,'auth','0004_alter_user_username_opts','2019-03-16 09:57:27.177942'),(10,'auth','0005_alter_user_last_login_null','2019-03-16 09:57:27.203680'),(11,'auth','0006_require_contenttypes_0002','2019-03-16 09:57:27.205820'),(12,'auth','0007_alter_validators_add_error_messages','2019-03-16 09:57:27.214364'),(13,'auth','0008_alter_user_username_max_length','2019-03-16 09:57:27.242500'),(14,'auth','0009_alter_user_last_name_max_length','2019-03-16 09:57:27.275108'),(15,'sessions','0001_initial','2019-03-16 09:57:27.290901'),(16,'api','0001_initial','2019-03-16 11:35:27.930506'),(17,'api','0002_remove_user_phone_number','2019-03-16 11:39:04.710920'),(18,'api','0003_auto_20190316_1143','2019-03-16 11:44:06.336630'),(19,'api','0004_design_image_file','2019-03-16 19:18:09.584751'),(20,'api','0005_remove_design_image_file','2019-03-16 19:42:26.446121');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
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

-- Dump completed on 2019-03-17 15:28:26
