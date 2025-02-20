-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalmanagement
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` bigint NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Darshan Parameshwar Moger','Bhatkal','2002-08-26','Male',6360364431,'darshan@gmail.com','12345678');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `patient_name` varchar(45) NOT NULL,
  `patient_address` text NOT NULL,
  `patient_gender` varchar(45) NOT NULL,
  `patient_dob` date NOT NULL,
  `patient_email` varchar(45) NOT NULL,
  `patient_phno` varchar(45) NOT NULL,
  `patient_diseases` varchar(45) NOT NULL,
  `appoint_date_time` datetime NOT NULL,
  `doc_id` int NOT NULL,
  `confirmation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doc_id` (`doc_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,'Ganesh','Bangalore','Male','1990-06-15','ganesh@gmail.com','9876543210','Fever','2025-02-20 10:00:00',1,'Confirmed'),(2,2,'Kumar','Vijayanagara','Female','1985-11-22','kumar@gmail.com','8765432109','Skin Rash','2025-02-21 14:30:00',2,'Confirmed'),(3,3,'Mahesh','Mangalore','Male','1992-02-03','mahesh@gmail.com','7654321098','Back Pain','2025-02-22 09:00:00',3,'Pending'),(4,4,'Nagendra','Koppala','Female','1988-09-10','nagendra@gmail.com','6543210987','Anxiety','2025-02-23 16:15:00',4,'Confirmed'),(5,5,'Bhalu','Dandeli','Male','1995-04-27','bhalu@gmail.com','5432109876','Joint Pain','2025-02-24 11:45:00',5,'Pending'),(6,6,'Narendra DP','Davanagere','Male','2002-11-17','nari@gmail.com','9845027972','Cold and Cough','2025-02-25 08:30:00',6,'Confirmed'),(7,7,'Harshitha PM','Bhatkal','Female','2001-04-02','harshitha@gmail.com','8088944065','Migraine','2025-02-26 13:00:00',7,'Confirmed'),(8,8,'Keshav Moger','Bhatkal','Male','1999-06-16','keshav@gmail.com','9353077530','Knee Injury','2025-02-27 15:00:00',8,'Pending'),(9,9,'Aishu','Madikeri','Female','2003-05-26','aishu@gmail.com','9902400204','Stomach Ache','2025-02-28 12:30:00',9,'Confirmed'),(10,10,'Abhi Shetty','Shivamogga','Male','2002-03-25','abhi@gmail.com','7022734655','Cough and Cold','2025-03-01 10:15:00',10,'Confirmed');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `specialist` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Dr. Alice Johnson','MBBS, MD','Cardiologist','1980-05-12','Female','1234567890','alice@gmail.com','12345678'),(2,'Dr. Robert Smith','MBBS, FRCP','Dermatologist','1975-11-22','Male','2345678901','robert@gmail.com','12345678'),(3,'Dr. Clara Williams','MBBS, MS','Orthopedic Surgeon','1982-07-30','Female','3456789012','clara@gmail.com','12345678'),(4,'Dr. Michael Brown','MD, PhD','Neurologist','1978-02-18','Male','4567890123','michael@gmail.com','12345678'),(5,'Dr. Emma Davis','MBBS, DCH','Pediatrician','1990-04-10','Female','5678901234','emma@gmail.com','12345678'),(6,'Dr. Daniel Lee','MBBS, MD','Psychiatrist','1985-08-24','Male','6789012345','daniel@gmail.com','12345678'),(7,'Dr. Sarah Miller','MBBS, MS','Cardiologist','1983-09-15','Female','7890123456','miller@gmail.com','12345678'),(8,'Dr. James Wilson','MBBS, DNB','Dermatologist','1992-12-01','Male','8901234567','james@gmail.com','12345678'),(9,'Dr. Olivia Clark','MBBS, MD','Orthopedic Surgeon','1987-06-20','Female','9012345678','olivia@gmail.com','12345678'),(10,'Dr. William Harris','MBBS, FRCP','Neurologist','1980-01-11','Male','0123456789','william@gmail.com','12345678');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Ganesh','Bangalore','1990-06-15','Male','9876543210','ganesh@gmail.com','12345678'),(2,'Kumar','Vijayanagara','1985-11-22','Female','8765432109','kumar@gmail.com','12345678'),(3,'Mahesh','Mangalore','1992-02-03','Male','7654321098','mahesh@gmail.com','12345678'),(4,'Nagendra','Koppala','1988-09-10','Female','6543210987','nagendra@gmail.com','12345678'),(5,'Bhalu','Dandeli','1995-04-27','Male','5432109876','bhalu@gmail.com','12345678'),(6,'Narendra DP','Davanagere','2002-11-17','Male','9845027972','nari@gmail.com','12345678'),(7,'Harshitha PM','Bhatkal','2001-04-02','Female','8088944065','harshitha@gmail.com','12345678'),(8,'Keshav Moger','Bhatkal','1999-06-16','Male','9353077530','keshav@gmail.com','12345678'),(9,'Aishu','Madikeri','2003-05-26','Female','9902400204','aishu@gmail.com','12345678'),(10,'Abhi Shetty','Shivamogga','2002-03-25','Male','7022734655','abhi@gmail.com','12345678');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialist`
--

LOCK TABLES `specialist` WRITE;
/*!40000 ALTER TABLE `specialist` DISABLE KEYS */;
INSERT INTO `specialist` VALUES (1,'Cardiologist'),(2,'Dermatologist'),(3,'Orthopedic Surgeon'),(4,'Neurologist'),(5,'Pediatrician'),(6,'Psychiatrist');
/*!40000 ALTER TABLE `specialist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-20 13:11:51
