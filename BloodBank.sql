-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: BLOODBANK
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `BLOOD`
--

DROP TABLE IF EXISTS `BLOOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLOOD` (
  `blood_bag_number` int(11) NOT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `blood_amount` varchar(10) DEFAULT NULL,
  `haemoglobin_count` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`blood_bag_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLOOD`
--

LOCK TABLES `BLOOD` WRITE;
/*!40000 ALTER TABLE `BLOOD` DISABLE KEYS */;
INSERT INTO `BLOOD` VALUES (1,'A+','23',2.20);
/*!40000 ALTER TABLE `BLOOD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLOOD_COST`
--

DROP TABLE IF EXISTS `BLOOD_COST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLOOD_COST` (
  `blood_bag_number` int(11) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`blood_bag_number`),
  CONSTRAINT `BLOOD_COST_ibfk_1` FOREIGN KEY (`blood_bag_number`) REFERENCES `BLOOD` (`blood_bag_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLOOD_COST`
--

LOCK TABLES `BLOOD_COST` WRITE;
/*!40000 ALTER TABLE `BLOOD_COST` DISABLE KEYS */;
INSERT INTO `BLOOD_COST` VALUES (1,50);
/*!40000 ALTER TABLE `BLOOD_COST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPANION`
--

DROP TABLE IF EXISTS `COMPANION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANION` (
  `donor_id` int(11) DEFAULT NULL,
  `companion_name` varchar(10) DEFAULT NULL,
  `relationship` varchar(10) DEFAULT NULL,
  KEY `donor_id` (`donor_id`),
  CONSTRAINT `COMPANION_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `DONORS` (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPANION`
--

LOCK TABLES `COMPANION` WRITE;
/*!40000 ALTER TABLE `COMPANION` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPANION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DONORS`
--

DROP TABLE IF EXISTS `DONORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DONORS` (
  `donor_id` int(11) NOT NULL,
  `date_of_donation` date NOT NULL,
  PRIMARY KEY (`donor_id`,`date_of_donation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DONORS`
--

LOCK TABLES `DONORS` WRITE;
/*!40000 ALTER TABLE `DONORS` DISABLE KEYS */;
INSERT INTO `DONORS` VALUES (1,'1999-11-11');
/*!40000 ALTER TABLE `DONORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DONOR_INFO`
--

DROP TABLE IF EXISTS `DONOR_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DONOR_INFO` (
  `donor_id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lName` varchar(30) DEFAULT NULL,
  `blood_type` varchar(30) DEFAULT NULL,
  `phone_no` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`donor_id`),
  CONSTRAINT `DONOR_INFO_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `DONORS` (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DONOR_INFO`
--

LOCK TABLES `DONOR_INFO` WRITE;
/*!40000 ALTER TABLE `DONOR_INFO` DISABLE KEYS */;
INSERT INTO `DONOR_INFO` VALUES (1,'qw','rt','A+',1234321345,12,'M');
/*!40000 ALTER TABLE `DONOR_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENT_TRANSACTION`
--

DROP TABLE IF EXISTS `PAYMENT_TRANSACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAYMENT_TRANSACTION` (
  `rec_id` int(11) DEFAULT NULL,
  `payment_amt` int(11) DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  KEY `rec_id` (`rec_id`),
  CONSTRAINT `PAYMENT_TRANSACTION_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `RECIPIENT` (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENT_TRANSACTION`
--

LOCK TABLES `PAYMENT_TRANSACTION` WRITE;
/*!40000 ALTER TABLE `PAYMENT_TRANSACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAYMENT_TRANSACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECIEVES`
--

DROP TABLE IF EXISTS `RECIEVES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECIEVES` (
  `emp_id` int(11) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  KEY `rec_id` (`rec_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `RECIEVES_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `RECIPIENT` (`rec_id`),
  CONSTRAINT `RECIEVES_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `STAFF` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECIEVES`
--

LOCK TABLES `RECIEVES` WRITE;
/*!40000 ALTER TABLE `RECIEVES` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECIEVES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECIPIENT`
--

DROP TABLE IF EXISTS `RECIPIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECIPIENT` (
  `rec_id` int(11) NOT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `quantity_needed` int(11) DEFAULT NULL,
  `date_of_request` date DEFAULT NULL,
  `Fname` varchar(10) DEFAULT NULL,
  `dOB` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECIPIENT`
--

LOCK TABLES `RECIPIENT` WRITE;
/*!40000 ALTER TABLE `RECIPIENT` DISABLE KEYS */;
INSERT INTO `RECIPIENT` VALUES (1,'A+',23,'1999-10-10','Div Gh','1998-10-10','M',23);
/*!40000 ALTER TABLE `RECIPIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTERS`
--

DROP TABLE IF EXISTS `REGISTERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGISTERS` (
  `donor_id` int(11) DEFAULT NULL,
  `rec_id` int(11) DEFAULT NULL,
  KEY `rec_id` (`rec_id`),
  KEY `donor_id` (`donor_id`),
  CONSTRAINT `REGISTERS_ibfk_1` FOREIGN KEY (`rec_id`) REFERENCES `RECIPIENT` (`rec_id`),
  CONSTRAINT `REGISTERS_ibfk_2` FOREIGN KEY (`donor_id`) REFERENCES `DONORS` (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTERS`
--

LOCK TABLES `REGISTERS` WRITE;
/*!40000 ALTER TABLE `REGISTERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REGISTERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF`
--

DROP TABLE IF EXISTS `STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STAFF` (
  `emp_id` int(11) NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `address1` varchar(10) DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
INSERT INTO `STAFF` VALUES (1,'Def Gef','23 A','1234567890',23411);
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13  9:05:22
