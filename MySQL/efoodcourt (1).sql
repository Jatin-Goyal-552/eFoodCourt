CREATE DATABASE  IF NOT EXISTS `efoodcourt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `efoodcourt`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: efoodcourt
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add customer',7,'add_customer'),(26,'Can change customer',7,'change_customer'),(27,'Can delete customer',7,'delete_customer'),(28,'Can view customer',7,'view_customer'),(29,'Can add customer_order',8,'add_customer_order'),(30,'Can change customer_order',8,'change_customer_order'),(31,'Can delete customer_order',8,'delete_customer_order'),(32,'Can view customer_order',8,'view_customer_order'),(33,'Can add food',9,'add_food'),(34,'Can change food',9,'change_food'),(35,'Can delete food',9,'delete_food'),(36,'Can view food',9,'view_food'),(37,'Can add order_delivery',10,'add_order_delivery'),(38,'Can change order_delivery',10,'change_order_delivery'),(39,'Can delete order_delivery',10,'delete_order_delivery'),(40,'Can view order_delivery',10,'view_order_delivery'),(41,'Can add food_order',11,'add_food_order'),(42,'Can change food_order',11,'change_food_order'),(43,'Can delete food_order',11,'delete_food_order'),(44,'Can view food_order',11,'view_food_order'),(45,'Can add admin',12,'add_admin'),(46,'Can change admin',12,'change_admin'),(47,'Can delete admin',12,'delete_admin'),(48,'Can view admin',12,'view_admin'),(49,'Can add addfood',13,'add_addfood'),(50,'Can change addfood',13,'change_addfood'),(51,'Can delete addfood',13,'delete_addfood'),(52,'Can view addfood',13,'view_addfood');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'FoodCourt','addfood'),(12,'FoodCourt','admin'),(7,'FoodCourt','customer'),(8,'FoodCourt','customer_order'),(9,'FoodCourt','food'),(11,'FoodCourt','food_order'),(10,'FoodCourt','order_delivery'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'FoodCourt','0001_initial','2021-03-25 06:03:03.032672'),(2,'contenttypes','0001_initial','2021-03-25 06:03:52.221486'),(3,'auth','0001_initial','2021-03-25 06:04:08.699428'),(4,'admin','0001_initial','2021-03-25 06:05:15.552252'),(5,'admin','0002_logentry_remove_auto_add','2021-03-25 06:05:34.150316'),(6,'admin','0003_logentry_add_action_flag_choices','2021-03-25 06:05:34.678346'),(7,'contenttypes','0002_remove_content_type_name','2021-03-25 06:05:47.183061'),(8,'auth','0002_alter_permission_name_max_length','2021-03-25 06:05:53.788439'),(9,'auth','0003_alter_user_email_max_length','2021-03-25 06:05:55.386530'),(10,'auth','0004_alter_user_username_opts','2021-03-25 06:05:55.574541'),(11,'auth','0005_alter_user_last_login_null','2021-03-25 06:06:00.108801'),(12,'auth','0006_require_contenttypes_0002','2021-03-25 06:06:00.618830'),(13,'auth','0007_alter_validators_add_error_messages','2021-03-25 06:06:01.002852'),(14,'auth','0008_alter_user_username_max_length','2021-03-25 06:06:08.791297'),(15,'auth','0009_alter_user_last_name_max_length','2021-03-25 06:06:16.402733'),(16,'auth','0010_alter_group_name_max_length','2021-03-25 06:06:17.577800'),(17,'auth','0011_update_proxy_permissions','2021-03-25 06:06:17.803813'),(18,'sessions','0001_initial','2021-03-25 06:06:19.178891'),(19,'FoodCourt','0002_auto_20210325_1439','2021-03-25 09:10:13.054902'),(20,'FoodCourt','0003_remove_customer_order_transaction_id','2021-03-25 09:19:20.933438'),(21,'FoodCourt','0004_addfood_admin','2021-03-29 06:07:09.888179'),(22,'FoodCourt','0005_auto_20210401_1044','2021-04-01 05:14:58.499814');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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

--
-- Table structure for table `foodcourt_addfood`
--

DROP TABLE IF EXISTS `foodcourt_addfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodcourt_addfood` (
  `addfoodid` int NOT NULL AUTO_INCREMENT,
  `ad_id_id` int NOT NULL,
  `food_id_id` int NOT NULL,
  PRIMARY KEY (`addfoodid`),
  KEY `FoodCourt_addfood_ad_id_id_c8b649fc_fk_FoodCourt_admin_aid` (`ad_id_id`),
  KEY `FoodCourt_addfood_food_id_id_82c738ea_fk_FoodCourt_food_fid` (`food_id_id`),
  CONSTRAINT `FoodCourt_addfood_ad_id_id_c8b649fc_fk_FoodCourt_admin_aid` FOREIGN KEY (`ad_id_id`) REFERENCES `foodcourt_admin` (`aid`),
  CONSTRAINT `FoodCourt_addfood_food_id_id_82c738ea_fk_FoodCourt_food_fid` FOREIGN KEY (`food_id_id`) REFERENCES `foodcourt_food` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodcourt_addfood`
--

LOCK TABLES `foodcourt_addfood` WRITE;
/*!40000 ALTER TABLE `foodcourt_addfood` DISABLE KEYS */;
INSERT INTO `foodcourt_addfood` VALUES (1,1,6),(2,1,10),(3,1,12);
/*!40000 ALTER TABLE `foodcourt_addfood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodcourt_admin`
--

DROP TABLE IF EXISTS `foodcourt_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodcourt_admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) NOT NULL,
  `admin_password` varchar(200) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_phone` int NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodcourt_admin`
--

LOCK TABLES `foodcourt_admin` WRITE;
/*!40000 ALTER TABLE `foodcourt_admin` DISABLE KEYS */;
INSERT INTO `foodcourt_admin` VALUES (1,'jatin123','12345','sdad@gmail.com',351355),(2,'admin','12345','admin123@gmail.com',64646);
/*!40000 ALTER TABLE `foodcourt_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodcourt_customer`
--

DROP TABLE IF EXISTS `foodcourt_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodcourt_customer` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodcourt_customer`
--

LOCK TABLES `foodcourt_customer` WRITE;
/*!40000 ALTER TABLE `foodcourt_customer` DISABLE KEYS */;
INSERT INTO `foodcourt_customer` VALUES (1,'jatin2','123789lk','goyaljatin310@gmail.com',585446885),(2,'JatinGoyal','123789lk','goyaljatin310@gmail.com',585446885),(3,'jatin','jatin','goyaljatin310@gmail.com',585446885),(4,'admin','admin','admin@gmail.com',123456789);
/*!40000 ALTER TABLE `foodcourt_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodcourt_customer_order`
--

DROP TABLE IF EXISTS `foodcourt_customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodcourt_customer_order` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `date_ordered` datetime(6) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `order_amount` double DEFAULT NULL,
  `cid_id` int NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `FoodCourt_customer_o_cid_id_47f83ba6_fk_FoodCourt` (`cid_id`),
  CONSTRAINT `FoodCourt_customer_o_cid_id_47f83ba6_fk_FoodCourt` FOREIGN KEY (`cid_id`) REFERENCES `foodcourt_customer` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodcourt_customer_order`
--

LOCK TABLES `foodcourt_customer_order` WRITE;
/*!40000 ALTER TABLE `foodcourt_customer_order` DISABLE KEYS */;
INSERT INTO `foodcourt_customer_order` VALUES (12,'2021-03-25 11:00:49.850852',1,110,1,1),(13,'2021-03-25 11:01:38.871051',1,150,1,1),(14,'2021-03-25 11:02:39.653178',1,100,1,1),(15,'2021-03-25 12:17:09.061898',1,50,2,1),(16,'2021-03-25 12:17:43.819296',1,90,2,1),(17,'2021-03-25 13:14:11.387122',1,190,1,1),(18,'2021-03-25 14:06:22.845222',1,110,1,1),(19,'2021-03-26 10:23:05.493118',1,0,2,1),(21,'2021-03-26 10:29:27.868877',1,50,3,1),(22,'2021-03-26 10:39:30.666659',1,90,3,1),(23,'2021-03-27 07:02:26.860604',1,90,3,1),(25,'2021-03-29 06:24:16.131877',1,260,1,1),(26,'2021-03-29 08:23:25.762812',1,190,1,1),(27,'2021-04-01 05:26:38.178833',1,60,1,1),(28,'2021-04-01 05:34:13.057851',0,0,1,0),(29,'2021-04-01 06:16:52.447240',1,110,2,1),(30,'2021-04-01 06:24:08.576185',1,90,2,1),(31,'2021-04-15 14:55:58.467966',0,NULL,2,0),(32,'2021-04-15 15:06:31.895196',1,150,3,1),(33,'2021-04-15 15:07:06.641183',1,60,3,1),(34,'2021-04-18 14:48:45.534454',1,50,3,1),(36,'2021-04-21 14:22:49.529574',1,100,3,1),(37,'2021-04-21 15:28:37.321375',1,140,3,1),(39,'2021-04-24 05:32:57.288438',1,230,4,1),(40,'2021-04-24 05:36:39.271135',0,NULL,4,0),(41,'2021-04-24 05:54:38.550866',1,140,3,1),(42,'2021-04-24 11:57:29.055068',0,NULL,3,0);
/*!40000 ALTER TABLE `foodcourt_customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodcourt_food`
--

DROP TABLE IF EXISTS `foodcourt_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodcourt_food` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `rating` double NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodcourt_food`
--

LOCK TABLES `foodcourt_food` WRITE;
/*!40000 ALTER TABLE `foodcourt_food` DISABLE KEYS */;
INSERT INTO `foodcourt_food` VALUES (1,'Veg Burger','Aaloo Tikki Burger',50,3.5,'/media/b0.jpg'),(2,'Non veg burger','made with chicken',60,4,'/media/bur.jpg'),(3,'Pizza','best pizza ever',150,4.5,'/media/piz.jpg'),(4,'Fries','potato fries',40,30,'/media/fr.jpg'),(6,'Pasta','Made with red sauce',80,4.2,'/media/pasta.jpg'),(10,'Chow mein','A Chinese stir-fried noodle dish.',80,4.3,'/media/images.jpg'),(12,'Momos','Momo is a type of East and South Asian.',60,4.5,'/media/IndiaTv94add1_momos-main-pic.jpg');
/*!40000 ALTER TABLE `foodcourt_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodcourt_food_order`
--

DROP TABLE IF EXISTS `foodcourt_food_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodcourt_food_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `fid_id` int NOT NULL,
  `oid_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FoodCourt_food_order_fid_id_7271c3ce_fk_FoodCourt_food_fid` (`fid_id`),
  KEY `FoodCourt_food_order_oid_id_349757fd_fk_FoodCourt` (`oid_id`),
  CONSTRAINT `FoodCourt_food_order_fid_id_7271c3ce_fk_FoodCourt_food_fid` FOREIGN KEY (`fid_id`) REFERENCES `foodcourt_food` (`fid`),
  CONSTRAINT `FoodCourt_food_order_oid_id_349757fd_fk_FoodCourt` FOREIGN KEY (`oid_id`) REFERENCES `foodcourt_customer_order` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodcourt_food_order`
--

LOCK TABLES `foodcourt_food_order` WRITE;
/*!40000 ALTER TABLE `foodcourt_food_order` DISABLE KEYS */;
INSERT INTO `foodcourt_food_order` VALUES (1,1,1,12),(2,1,2,12),(4,1,3,13),(6,1,1,15),(9,1,4,14),(10,1,2,14),(14,1,4,17),(15,1,3,17),(19,1,1,16),(20,1,4,16),(24,1,1,21),(32,1,1,22),(33,1,4,22),(34,1,1,23),(35,1,4,23),(40,1,1,18),(41,1,2,18),(42,1,1,25),(43,1,2,25),(44,1,3,25),(54,1,3,26),(57,1,4,26),(58,1,2,27),(59,1,6,19),(60,1,3,19),(61,1,4,19),(62,1,2,29),(63,1,1,29),(64,1,1,30),(65,1,4,30),(66,1,3,32),(67,1,2,33),(68,1,1,34),(71,1,2,36),(72,1,4,36),(73,1,2,37),(74,1,6,37),(81,1,1,39),(82,1,12,39),(83,1,10,39),(84,1,4,39),(87,1,6,41),(88,1,12,41);
/*!40000 ALTER TABLE `foodcourt_food_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodcourt_order_delivery`
--

DROP TABLE IF EXISTS `foodcourt_order_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodcourt_order_delivery` (
  `did` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `cid_id` int NOT NULL,
  `oid_id` int NOT NULL,
  `card_no` int DEFAULT NULL,
  `cvv` int DEFAULT NULL,
  `expirydate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `FoodCourt_order_deli_cid_id_681984e6_fk_FoodCourt` (`cid_id`),
  KEY `FoodCourt_order_deli_oid_id_2e02f360_fk_FoodCourt` (`oid_id`),
  CONSTRAINT `FoodCourt_order_deli_cid_id_681984e6_fk_FoodCourt` FOREIGN KEY (`cid_id`) REFERENCES `foodcourt_customer` (`cid`),
  CONSTRAINT `FoodCourt_order_deli_oid_id_2e02f360_fk_FoodCourt` FOREIGN KEY (`oid_id`) REFERENCES `foodcourt_customer_order` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodcourt_order_delivery`
--

LOCK TABLES `foodcourt_order_delivery` WRITE;
/*!40000 ALTER TABLE `foodcourt_order_delivery` DISABLE KEYS */;
INSERT INTO `foodcourt_order_delivery` VALUES (1,'bgcgc','bgcg','Haryana','123001',1,12,73,7676,'737'),(2,'bgcgc','bgcg','Haryana','123001',1,13,54252,7575,'752785'),(3,'bgcgc','bgcg','Haryana','123001',2,15,7575,5775,'575'),(6,'bgcgc','bgcg','Haryana','123001',1,14,3654365,456456,'46456'),(7,'bgcgc','bgcg','Haryana','123001',1,17,55,6456,'4645'),(8,'bgcgc','bgcg','Haryana','123001',2,16,7678,7676,'7676'),(10,'bgcgc','bgcg','Haryana','123001',3,21,767,76786,'867'),(11,'dggsdgs','sgsgs','sgsgsg','123456',3,22,34343,8368767,'67678678'),(12,'fhdrhrd','gtrdhr','sfseg','8736',3,23,786786,768786,'766786'),(13,'gsgs','dfhdfgd','gdfgdfg','43453',1,18,34374,676,'676786786'),(14,'gnfb','fdgdf','fgdfgdf','43453',1,25,4345,45354,'343453'),(15,'bgcgc','bgcg','Haryana','123001',1,26,758,857,'575'),(16,'bgcgc','bgcg','Haryana','123001',1,27,875578,57,'75785'),(17,'bgcgc','bgcg','Haryana','123001',2,19,453453,434345,'4345345'),(18,'bgcgc','bgcg','Haryana','123001',2,29,5786,778676,'7676'),(19,'bgcgc','bgcg','Haryana','123001',2,30,8767,7676,'6767'),(20,'bgcgc','bgcg','Haryana','123001',3,32,464767,767,'7676'),(21,'bgcgc','bgcg','Haryana','123001',3,33,56356356,5363563,'53563'),(22,'bgcgc','bgcg','Haryana','123001',3,34,52872587,58757,'78575'),(23,'bgcgc','bgcg','Haryana','123001',3,36,436876876,7678678,'67867'),(24,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(25,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(26,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(27,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(28,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(29,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(30,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(31,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(32,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(33,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(34,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(35,'bgcgc','bgcg','Haryana','123001',3,37,578785,75785,'75785785'),(36,'Paras Colony,Pull Bazar','Narnaul','Haryana','123001',4,39,123456789,123,'12/26'),(37,'Paras Colony,Pull Bazar','Narnaul','Haryana','123001',3,41,12346789,853,'12/25');
/*!40000 ALTER TABLE `foodcourt_order_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'efoodcourt'
--

--
-- Dumping routines for database 'efoodcourt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-24 20:02:15
