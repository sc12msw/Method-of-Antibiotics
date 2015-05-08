-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: cfmeddb
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `adult_administration`
--

DROP TABLE IF EXISTS `adult_administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adult_administration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oral` mediumtext,
  `IV` mediumtext,
  `Inhaled` mediumtext,
  `IM` mediumtext,
  `PR` mediumtext,
  `SC` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Adult_Administration_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Adult_Administration_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adult_administration`
--

LOCK TABLES `adult_administration` WRITE;
/*!40000 ALTER TABLE `adult_administration` DISABLE KEYS */;
INSERT INTO `adult_administration` VALUES (1,'1a','1iv','1i','1im','1pr','1sc',1),(2,'1a','1iv','1i','1im','1pr','1sc',2),(3,'3','NULL','NULL','NULL','NULL','NULL',3);
/*!40000 ALTER TABLE `adult_administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adult_dose`
--

DROP TABLE IF EXISTS `adult_dose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adult_dose` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oral` mediumtext,
  `IV` mediumtext,
  `Inhaled` mediumtext,
  `IM` mediumtext,
  `PR` mediumtext,
  `SC` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Adult_Dose_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Adult_Dose_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adult_dose`
--

LOCK TABLES `adult_dose` WRITE;
/*!40000 ALTER TABLE `adult_dose` DISABLE KEYS */;
INSERT INTO `adult_dose` VALUES (1,'1ad','1ivd','1id','1imd','1prd','1scd',1),(2,'1ad','1ivd','1id','1imd','1prd','1scd',2),(3,'3','NULL','NULL','NULL','NULL','NULL',3);
/*!40000 ALTER TABLE `adult_dose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_names`
--

DROP TABLE IF EXISTS `brand_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_names` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Brand_Name` varchar(100) DEFAULT NULL,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Brand_Names_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Brand_Names_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_names`
--

LOCK TABLES `brand_names` WRITE;
/*!40000 ALTER TABLE `brand_names` DISABLE KEYS */;
INSERT INTO `brand_names` VALUES (1,'1',1),(2,'2',1),(3,'3',1),(4,'4',1),(5,'5',1),(6,'1',2),(7,'3',3),(8,'3',3),(9,'3',3),(10,'3',3),(11,'3',3);
/*!40000 ALTER TABLE `brand_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Indication` mediumtext,
  `Side_Effects` mediumtext,
  `Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (1,'1','1','1','1'),(2,'2','1','1','1'),(3,'3','3','3','3');
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_line`
--

DROP TABLE IF EXISTS `first_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `first_line` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Drug_Name` varchar(100) DEFAULT NULL,
  `Pathogens_Pathogen_ID` int(11) NOT NULL,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_First_Line_Pathogens1_idx` (`Pathogens_Pathogen_ID`),
  KEY `fk_First_Line_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_First_Line_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_First_Line_Pathogens1` FOREIGN KEY (`Pathogens_Pathogen_ID`) REFERENCES `pathogens` (`Pathogen_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_line`
--

LOCK TABLES `first_line` WRITE;
/*!40000 ALTER TABLE `first_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `first_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interactions`
--

DROP TABLE IF EXISTS `interactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interactions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Interacting_Drug` varchar(100) DEFAULT NULL,
  `Effect` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Interactions_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Interactions_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interactions`
--

LOCK TABLES `interactions` WRITE;
/*!40000 ALTER TABLE `interactions` DISABLE KEYS */;
INSERT INTO `interactions` VALUES (1,'1','1',1),(2,'2','2',1),(3,'3','3',1),(4,'4','4',1),(5,'5','5',1),(6,'6','6',1),(7,'7','7',1),(8,'8','8',1),(9,'9','9',1),(10,'1','1',2),(11,'2','2',2),(12,'3','3',2),(13,'4','4',2),(14,'5','5',2),(15,'6','6',2),(16,'7','7',2),(17,'8','8',2),(18,'9','9',2),(19,'1','1',3),(20,'2','2',3),(21,'3','3',3),(22,'4','4',3),(23,'5','5',3),(24,'6','6',3),(25,'7','7',3),(26,'8','8',3),(27,'9','9',3),(28,'10','10',3);
/*!40000 ALTER TABLE `interactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paediatric_administration`
--

DROP TABLE IF EXISTS `paediatric_administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paediatric_administration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oral` mediumtext,
  `IV` mediumtext,
  `Inhaled` mediumtext,
  `IM` mediumtext,
  `PR` mediumtext,
  `SC` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Paediatric_Administration_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Paediatric_Administration_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paediatric_administration`
--

LOCK TABLES `paediatric_administration` WRITE;
/*!40000 ALTER TABLE `paediatric_administration` DISABLE KEYS */;
INSERT INTO `paediatric_administration` VALUES (1,'1pa','1piv','1ipd','1imp','1prp','1scp',1),(2,'1pa','1piv','1ipd','1imp','1prp','1scp',2),(3,'3','NULL','NULL','NULL','NULL','NULL',3);
/*!40000 ALTER TABLE `paediatric_administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paediatric_dose`
--

DROP TABLE IF EXISTS `paediatric_dose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paediatric_dose` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oral` mediumtext,
  `IV` mediumtext,
  `Inhaled` mediumtext,
  `IM` mediumtext,
  `PR` mediumtext,
  `SC` mediumtext,
  `Drugs_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Paediatric_Dose_Drugs1_idx` (`Drugs_ID`),
  CONSTRAINT `fk_Paediatric_Dose_Drugs1` FOREIGN KEY (`Drugs_ID`) REFERENCES `drugs` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paediatric_dose`
--

LOCK TABLES `paediatric_dose` WRITE;
/*!40000 ALTER TABLE `paediatric_dose` DISABLE KEYS */;
INSERT INTO `paediatric_dose` VALUES (1,'1pd','1ivpd','1ipd','1impd','1prpd','1scpd',1),(2,'1pd','1ivpd','1ipd','1impd','1prpd','1scpd',2),(3,'3','NULL','NULL','NULL','NULL','NULL',3);
/*!40000 ALTER TABLE `paediatric_dose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathogens`
--

DROP TABLE IF EXISTS `pathogens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathogens` (
  `Pathogen_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Description` mediumtext,
  PRIMARY KEY (`Pathogen_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathogens`
--

LOCK TABLES `pathogens` WRITE;
/*!40000 ALTER TABLE `pathogens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pathogens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `second_line`
--

DROP TABLE IF EXISTS `second_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `second_line` (
  `ID` int(11) NOT NULL,
  `Drug_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `second_line`
--

LOCK TABLES `second_line` WRITE;
/*!40000 ALTER TABLE `second_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `second_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-05 17:39:23
