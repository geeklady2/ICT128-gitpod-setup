WARNING: --master-data is deprecated and will be removed in a future version. Use --source-data instead.
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: toy_sales
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Position to start replication or point-in-time recovery from
--

-- CHANGE MASTER TO MASTER_LOG_FILE='binlog.000025', MASTER_LOG_POS=157;

--
-- Current Database: `toy_sales`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toy_sales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `toy_sales`;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Employees` VALUES (1,'Rob Stevens'),(2,'Jane White'),(3,'Sofia Clark'),(4,'Nobody');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `toy_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `sale_date` date NOT NULL,
  `quantity` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `toy_id` (`toy_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`toy_id`) REFERENCES `Toys` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Sales_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Sales_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Sales` VALUES (1,5,3,'2020-07-03',1),(2,1,1,'2020-07-03',1),(3,3,1,'2020-07-03',1),(4,6,3,'2020-07-03',1),(5,2,3,'2020-07-03',1),(6,4,3,'2020-07-04',2),(7,3,2,'2020-07-04',1),(8,1,1,'2020-07-04',3),(12,2,4,'2020-07-05',4);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Toys`
--

DROP TABLE IF EXISTS `Toys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Toys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `toy_name` varchar(100) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Toys`
--

LOCK TABLES `Toys` WRITE;
/*!40000 ALTER TABLE `Toys` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Toys` VALUES (1,'Bumblebee','Transformers',14.99),(2,'Optimus Prime','Transformers',19.99),(3,'Lightning McQueen','Disney Cars',23.97),(4,'Ramone','Disney Cars',20.99),(5,'Wonder Woman','Barbie',39.99),(6,'Princess Leia','Barbie',99.99),(7,'Wizard of Oz: Glinda','Barbie',43.95),(8,'Yoda','Disney Star Ward',NULL);
/*!40000 ALTER TABLE `Toys` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping events for database 'toy_sales'
--

--
-- Dumping routines for database 'toy_sales'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-05  2:13:32
DROP TABLE IF EXISTS toy_sales.vToy_sales; CREATE OR REPLACE VIEW toy_sales.vToy_sales AS select `toy_sales`.`Employees`.`employee_name` AS `employee_name`,`toy_sales`.`Toys`.`toy_name` AS `toy_name`,`toy_sales`.`Toys`.`brand` AS `brand`,`toy_sales`.`Toys`.`price` AS `price`,`toy_sales`.`Sales`.`quantity` AS `quantity`,`toy_sales`.`Sales`.`sale_date` AS `sale_date` from ((`toy_sales`.`Toys` join `toy_sales`.`Sales` on((`toy_sales`.`Sales`.`toy_id` = `toy_sales`.`Toys`.`id`))) join `toy_sales`.`Employees` on((`toy_sales`.`Employees`.`id` = `toy_sales`.`Sales`.`employee_id`))); 