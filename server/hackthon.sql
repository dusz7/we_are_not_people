-- MySQL dump 10.13  Distrib 5.7.19, for osx10.12 (x86_64)
--
-- Host: localhost    Database: hackthon
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `accompany`
--

DROP TABLE IF EXISTS `accompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accompany` (
  `user_id` int(11) DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accompany`
--

LOCK TABLES `accompany` WRITE;
/*!40000 ALTER TABLE `accompany` DISABLE KEYS */;
INSERT INTO `accompany` VALUES (2,'ffffff',12,'2010-09-09 19:19:19'),(2,'ffffff',12,'2010-09-09 19:19:19'),(2,'ffffff',12,'2010-09-09 19:19:19'),(2,'ffffff',12,'2010-09-09 19:19:19'),(2,'ffffff',12,'2010-09-09 19:19:19'),(2,'ffffff',12,'2010-09-09 19:19:19'),(2,'ffffff',12,'2010-09-09 19:19:19'),(2,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(4,'ffffff',12,'2010-09-09 19:19:19'),(1,'60:73:BC:2B:6E:46',3,'2017-08-27 10:01:19'),(1,'60:73:BC:2B:6E:46',3,'2017-08-27 10:06:25'),(1,'60:73:BC:2B:6E:46',1,'2017-08-27 10:10:58'),(1,'60:73:BC:2B:6E:46',1,'2017-08-27 10:19:19');
/*!40000 ALTER TABLE `accompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distance`
--

DROP TABLE IF EXISTS `distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distance` (
  `user_id` int(11) DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distance`
--

LOCK TABLES `distance` WRITE;
/*!40000 ALTER TABLE `distance` DISABLE KEYS */;
INSERT INTO `distance` VALUES (1,'D8:C7:71:22:90:3F',0,'2017-08-27 00:00:00'),(1,'60:73:BC:2B:6E:46',0,'2017-08-27 09:58:34'),(1,'60:73:BC:2B:6E:46',0,'2017-08-27 10:00:40'),(1,'60:73:BC:2B:6E:46',0,'2017-08-27 10:06:19'),(1,'60:73:BC:2B:6E:46',0,'2017-08-27 10:10:12'),(1,'60:73:BC:2B:6E:46',0,'2017-08-27 10:16:46'),(1,'60:73:BC:2B:6E:46',21,'2017-08-27 10:19:19');
/*!40000 ALTER TABLE `distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environment`
--

DROP TABLE IF EXISTS `environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environment` (
  `device` varchar(100) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `humidity` float DEFAULT NULL,
  `smoke` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment`
--

LOCK TABLES `environment` WRITE;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latest`
--

DROP TABLE IF EXISTS `latest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest` (
  `user_id` int(11) DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latest`
--

LOCK TABLES `latest` WRITE;
/*!40000 ALTER TABLE `latest` DISABLE KEYS */;
INSERT INTO `latest` VALUES (1,'60:73:BC:2B:6E:46',8,21),(1,'60:73:BC:2B:6E:46',8,21);
/*!40000 ALTER TABLE `latest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `raise_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES (9,'哈哈哈','60:73:BC:2B:6E:46','哈哈',18,'1995-09-28'),(10,'哈很好奇','60:73:BC:2B:6E:46','看看书',18,'1995-09-11');
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `user_id` int(11) DEFAULT NULL,
  `device` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES (1,'60:73:BC:2B:6E:46');
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'hacker'),(2,'test'),(3,'123'),(4,'123'),(5,'123'),(6,'123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-27 10:53:51
