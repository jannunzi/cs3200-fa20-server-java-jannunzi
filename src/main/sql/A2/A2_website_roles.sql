CREATE DATABASE  IF NOT EXISTS `A2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `A2`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: A2
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
-- Table structure for table `website_roles`
--

DROP TABLE IF EXISTS `website_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `website_id` int(11) DEFAULT NULL,
  `developer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_role_enumeration_idx` (`role`),
  KEY `developer_website_role_idx` (`developer_id`),
  KEY `website_role_idx` (`website_id`),
  CONSTRAINT `developer_role` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `website_role` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `website_role_enumeration` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_roles`
--

LOCK TABLES `website_roles` WRITE;
/*!40000 ALTER TABLE `website_roles` DISABLE KEYS */;
INSERT INTO `website_roles` VALUES (123,'admin',123,123),(234,'reviewer',234,123);
/*!40000 ALTER TABLE `website_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `A2`.`website_roles_AFTER_INSERT` AFTER INSERT ON `website_roles` FOR EACH ROW
BEGIN
  IF NEW.role = 'admin' OR NEW.role = 'owner' THEN
    INSERT INTO website_priviledges VALUES (null, 'write', NEW.website_id, NEW.developer_id);
    INSERT INTO website_priviledges VALUES (null, 'update', NEW.website_id, NEW.developer_id);
    INSERT INTO website_priviledges VALUES (null, 'delete', NEW.website_id, NEW.developer_id);
    INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
  END IF;
  IF NEW.role = 'reviewer' THEN
    INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-08 18:16:11
