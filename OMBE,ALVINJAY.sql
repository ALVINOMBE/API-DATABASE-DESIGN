CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `idCustomers` int NOT NULL AUTO_INCREMENT,
  `customers_first_name` varchar(45) NOT NULL,
  `customers_middle_initial` varchar(45) NOT NULL,
  `customers_last_name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `email_add` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `address_line_1` varchar(45) NOT NULL,
  `address_line_2` varchar(45) NOT NULL,
  `town_city` varchar(45) NOT NULL,
  `state_country_province` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `other_details` longtext,
  PRIMARY KEY (`idCustomers`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Gemini','D','Miller','Female','e@example.com','09123313435','Brgy.KAMUNING','panay','Puerto Princesa City','Palawan','Philippines',NULL),(2,'Edmund','C',' Mauch','Male','r@example.com','09123737777','Brgy.Tiniguiban','tacloban ','Taclobcan City','tacloban','philippines',NULL),(3,'alvin','D','Ombe','Male','psu@example.com','09123456789','Brgy. Kmauning Puerto Princesa City','Tiniguiban','Puerto Princesa City','palawan','philippines',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_line_items`
--

DROP TABLE IF EXISTS `invoice_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_line_items` (
  `idinvoice_line_items` int NOT NULL AUTO_INCREMENT,
  `Invoices_invoice_number` int NOT NULL,
  `other_items_idother_items` int NOT NULL,
  `task_name` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  `cost` int NOT NULL,
  `other_details` longtext,
  PRIMARY KEY (`idinvoice_line_items`),
  KEY `fk_invoice_line_items_Invoices1_idx` (`Invoices_invoice_number`),
  KEY `fk_invoice_line_items_other_items1_idx` (`other_items_idother_items`),
  CONSTRAINT `fk_invoice_line_items_Invoices1` FOREIGN KEY (`Invoices_invoice_number`) REFERENCES `invoices` (`invoice_number`),
  CONSTRAINT `fk_invoice_line_items_other_items1` FOREIGN KEY (`other_items_idother_items`) REFERENCES `other_items` (`idother_items`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_line_items`
--

LOCK TABLES `invoice_line_items` WRITE;
/*!40000 ALTER TABLE `invoice_line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_number` int NOT NULL AUTO_INCREMENT,
  `jobs_job_id` int NOT NULL,
  `invoice_date` date NOT NULL,
  `total_cost` int NOT NULL,
  `other_details` longtext,
  PRIMARY KEY (`invoice_number`),
  KEY `fk_Invoices_jobs1_idx` (`jobs_job_id`),
  CONSTRAINT `fk_Invoices_jobs1` FOREIGN KEY (`jobs_job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `Customers_idCustomers` int NOT NULL,
  `date_job_started` int NOT NULL,
  `date_job_complete` varchar(45) NOT NULL,
  `other_details` longtext,
  PRIMARY KEY (`job_id`),
  KEY `fk_jobs_Customers_idx` (`Customers_idCustomers`),
  CONSTRAINT `fk_jobs_Customers` FOREIGN KEY (`Customers_idCustomers`) REFERENCES `customers` (`idCustomers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_items`
--

DROP TABLE IF EXISTS `other_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `other_items` (
  `idother_items` int NOT NULL AUTO_INCREMENT,
  `standard_task_idstandard_task` int NOT NULL,
  `jobs_job_id` int NOT NULL,
  `quantity` int NOT NULL,
  `cost` int DEFAULT NULL,
  `other_details` longtext,
  PRIMARY KEY (`idother_items`),
  KEY `fk_other_items_jobs1_idx` (`jobs_job_id`),
  KEY `fk_other_items_standard_task1_idx` (`standard_task_idstandard_task`),
  CONSTRAINT `fk_other_items_jobs1` FOREIGN KEY (`jobs_job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `fk_other_items_standard_task1` FOREIGN KEY (`standard_task_idstandard_task`) REFERENCES `standard_task` (`idstandard_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_items`
--

LOCK TABLES `other_items` WRITE;
/*!40000 ALTER TABLE `other_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standard_task`
--

DROP TABLE IF EXISTS `standard_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `standard_task` (
  `idstandard_task` int NOT NULL AUTO_INCREMENT,
  `task_name` int NOT NULL,
  `task_price` int NOT NULL,
  `task_description` varchar(45) NOT NULL,
  `other_dertails` longtext,
  PRIMARY KEY (`idstandard_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard_task`
--

LOCK TABLES `standard_task` WRITE;
/*!40000 ALTER TABLE `standard_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `standard_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11 10:00:59
