-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: mysqltarget
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
-- Table structure for table `targetemployee`
--

DROP TABLE IF EXISTS `targetemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targetemployee` (
  `employeeid` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targetemployee`
--

LOCK TABLES `targetemployee` WRITE;
/*!40000 ALTER TABLE `targetemployee` DISABLE KEYS */;
INSERT INTO `targetemployee` VALUES (1,'Mustermann','Max','M.Mustermann','test','2000-07-21',NULL),(2,'Peter','Maier','P.Maier','test','2000-07-21',NULL),(3,'John','Doe','J.Doe','test','2000-07-21',NULL),(4,'Müller','Ralf','R.Mueller','test','1990-01-13',NULL),(5,'Eisenhof','Frank','F.Eisenhof','test','1995-05-31',NULL),(6,'Lupin','Anja','A.Lupin','test','1998-02-17',NULL),(7,'Lempe','Dirk','D.Lempke','test','2017-07-21',NULL),(8,'Müller','Iris','I.Mueller','test','1970-03-15',NULL);
/*!40000 ALTER TABLE `targetemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targetemployee2`
--

DROP TABLE IF EXISTS `targetemployee2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targetemployee2` (
  `employeeid` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targetemployee2`
--

LOCK TABLES `targetemployee2` WRITE;
/*!40000 ALTER TABLE `targetemployee2` DISABLE KEYS */;
INSERT INTO `targetemployee2` VALUES (48,'Klein','Thomas'),(49,'Lang','Ute'),(1122,'Klein',NULL),(1123,'Lang',NULL);
/*!40000 ALTER TABLE `targetemployee2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mysqltarget'
--

--
-- Dumping routines for database 'mysqltarget'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-30  2:46:09
