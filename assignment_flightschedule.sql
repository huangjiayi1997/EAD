CREATE DATABASE  IF NOT EXISTS `assignment` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `assignment`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: assignment
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `flightschedule`
--

DROP TABLE IF EXISTS `flightschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flightschedule` (
  `flightScheduleID` int(11) NOT NULL AUTO_INCREMENT,
  `aircraftID` int(11) NOT NULL,
  `originAirport` varchar(100) NOT NULL,
  `destinationAirport` varchar(100) NOT NULL,
  `originCountry` varchar(50) NOT NULL,
  `destinationCountry` varchar(50) NOT NULL,
  `economyCost` decimal(6,2) DEFAULT NULL,
  `businessClassCost` decimal(6,2) DEFAULT NULL,
  `firstClassCost` decimal(6,2) DEFAULT NULL,
  `departureDate` date NOT NULL,
  `departureTime` time NOT NULL,
  `arrivalDate` date NOT NULL,
  `arrivalTime` time NOT NULL,
  `flightTime` decimal(4,2) NOT NULL,
  PRIMARY KEY (`flightScheduleID`),
  KEY `aircraft id_idx` (`aircraftID`),
  CONSTRAINT `aircraft id` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`aircraftID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightschedule`
--

LOCK TABLES `flightschedule` WRITE;
/*!40000 ALTER TABLE `flightschedule` DISABLE KEYS */;
INSERT INTO `flightschedule` VALUES (1,1,'Singapore Changi Airport','Hong Kong International Airport','Singapore','Hong Kong',550.00,855.00,1000.00,'2017-07-29','05:30:00','2017-07-29','09:30:00',4.00),(2,1,'Hong Kong International Airport','Singapore Changi Airport','Hong Kong ','Singapore',556.00,883.00,1022.00,'2017-08-03','23:45:00','2017-08-04','03:45:00',4.00),(3,2,'Dubai Interntional Airport','Singapore Changi Airport','United Arab Emirates','Singapore',600.00,899.00,1265.00,'2017-06-08','18:00:00','2017-06-09','02:00:00',8.00),(4,2,'Singapore Changi Airport','Dubai Interntional Airport','Singapore','United Arab Emirates',598.00,889.00,1220.00,'2017-06-16','12:00:00','2017-06-16','20:00:00',8.00),(5,3,'Narita Internation Airport','Kuala Lumpur International Airport','Japan','Malaysia',497.00,785.00,988.00,'2017-06-03','15:20:00','2017-06-03','21:20:00',6.00),(6,3,'Kuala Lumpur International Airport','Narita Internation Airport','Malaysia','Japan',502.00,795.00,995.00,'2017-07-02','09:50:00','2017-07-02','15:50:00',6.00),(7,4,'Singapore Changi Airport','Vancouver International Airport','Singapore','Canada',677.00,922.00,1250.00,'2017-10-23','08:40:00','2017-10-23','16:40:00',8.00),(8,4,'Vancouver International Airport','Singapore Changi Airport','Canada','Singapore',674.00,900.00,1130.00,'2017-11-06','05:15:00','2017-11-06','13:15:00',8.00),(9,5,'Guangzhou Baiyun International Airport','Incheon International Airport','China','Korea',499.00,699.00,999.00,'2017-12-20','21:00:00','2017-12-21','12:00:00',3.00),(10,5,'Incheon International Airport','Guangzhou Baiyun International Airport','Korea','China',505.00,705.00,1000.00,'2017-12-29','08:00:00','2017-12-29','11:00:00',3.00),(11,6,'Haneda International Airport','Singapore Changi Airport','Japan','Singapore',660.00,894.00,1100.00,'2017-09-19','00:30:00','2017-09-19','09:30:00',9.00),(12,6,'Singapore Changi Airport','Haneda International Airport','Singapore','Japan',634.00,843.00,1093.00,'2017-09-18','06:10:00','2017-09-18','15:10:00',9.00),(13,7,'Incheon International Airport','Heathrow Airport','Korea','London',576.00,764.00,1155.00,'2017-07-21','19:30:00','2017-07-21','01:00:00',5.50),(14,7,'Heathrow Airport','Incheon International Airport','London','Korea',588.00,800.00,1205.00,'2017-08-01','03:00:00','2017-08-01','08:30:00',5.50),(15,8,'Kuala Lumpur International Airport','Munich Airport','Malaysia','Germany',699.00,945.00,1332.00,'2017-11-30','09:30:00','2017-11-30','23:00:00',13.50),(16,8,'Munich Airport','Kuala Lumpur International Airport','Germany','Malaysia',723.00,954.00,1355.00,'2017-12-15','04:00:00','2017-12-15','17:30:00',13.50);
/*!40000 ALTER TABLE `flightschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-21 16:21:45
