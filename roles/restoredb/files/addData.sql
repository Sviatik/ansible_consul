use _055_DB


-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Linux (x86_64)
--
-- Host: 192.168.103.148    Database: 192.168.103.148
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

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
-- Table structure for table `CardType`
--

DROP TABLE IF EXISTS `CardType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CardType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CardType` varchar(255) DEFAULT NULL,
  `CardNumber` varchar(255) DEFAULT NULL,
  `CardCvv2` int(11) DEFAULT NULL,
  `Expiration_Date` varchar(255) DEFAULT NULL,
  `IssueDate` varchar(255) DEFAULT NULL,
  `IssueNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CardType`
--

LOCK TABLES `CardType` WRITE;
/*!40000 ALTER TABLE `CardType` DISABLE KEYS */;
/*!40000 ALTER TABLE `CardType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerTypes`
--

DROP TABLE IF EXISTS `CustomerTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerTypes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Discount` double DEFAULT NULL,
  `MaxRange` double DEFAULT NULL,
  `MinRange` double DEFAULT NULL,
  `TypeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerTypes`
--

LOCK TABLES `CustomerTypes` WRITE;
/*!40000 ALTER TABLE `CustomerTypes` DISABLE KEYS */;
INSERT INTO `CustomerTypes` VALUES (1,0,1000,0,'Standart'),(2,0,3000,1000,'Silver'),(3,0,10000,3000,'Gold'),(4,0,NULL,10000,'Platinum');
/*!40000 ALTER TABLE `CustomerTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dimensions`
--

DROP TABLE IF EXISTS `Dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dimensions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DimensionName` varchar(255) DEFAULT NULL,
  `NumberOfProducts` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dimensions`
--

LOCK TABLES `Dimensions` WRITE;
/*!40000 ALTER TABLE `Dimensions` DISABLE KEYS */;
INSERT INTO `Dimensions` VALUES (1,'Item',1),(2,'Box',5),(3,'Package',10);
/*!40000 ALTER TABLE `Dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItems`
--

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderItems` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cost` double DEFAULT NULL,
  `ItemPrice` double DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `DimensionRef` int(11) DEFAULT NULL,
  `OrderRef` int(11) DEFAULT NULL,
  `ProductRef` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKA2B1AD32BCDB3C97` (`OrderRef`),
  KEY `FKA2B1AD3262E1ABF7` (`ProductRef`),
  KEY `FKA2B1AD32A6376397` (`DimensionRef`),
  CONSTRAINT `FKA2B1AD32A6376397` FOREIGN KEY (`DimensionRef`) REFERENCES `Dimensions` (`ID`),
  CONSTRAINT `FKA2B1AD3262E1ABF7` FOREIGN KEY (`ProductRef`) REFERENCES `Products` (`ID`),
  CONSTRAINT `FKA2B1AD32BCDB3C97` FOREIGN KEY (`OrderRef`) REFERENCES `Orders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
INSERT INTO `OrderItems` VALUES (1,20,10,2,1,1,1),(2,100,10,2,2,1,2),(3,200,10,2,3,1,3),(4,20,10,2,1,1,4),(5,100,10,2,2,1,4),(6,200,10,2,3,1,3),(7,20,10,2,1,2,1),(8,100,10,2,2,2,2);
/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatuses`
--

DROP TABLE IF EXISTS `OrderStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderStatuses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrederStatusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatuses`
--

LOCK TABLES `OrderStatuses` WRITE;
/*!40000 ALTER TABLE `OrderStatuses` DISABLE KEYS */;
INSERT INTO `OrderStatuses` VALUES (1,'Created'),(2,'Pending'),(3,'Ordered'),(4,'Delivered');
/*!40000 ALTER TABLE `OrderStatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DeliveryDate` datetime DEFAULT NULL,
  `IsGift` bit(1) DEFAULT NULL,
  `MaxDiscount` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `OrderName` varchar(100) DEFAULT NULL,
  `OrderNumber` int(11) DEFAULT NULL,
  `PreferableDeliveryDate` datetime DEFAULT NULL,
  `TotalPrice` double DEFAULT NULL,
  `Assigne` int(11) DEFAULT NULL,
  `Customer` int(11) DEFAULT NULL,
  `OrderStatusRef` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `OrderNumber` (`OrderNumber`),
  KEY `FK8D444F05990DB877` (`OrderStatusRef`),
  KEY `FK8D444F05C0F431DD` (`Assigne`),
  KEY `FK8D444F05F161465` (`Customer`),
  CONSTRAINT `FK8D444F05F161465` FOREIGN KEY (`Customer`) REFERENCES `Users` (`ID`),
  CONSTRAINT `FK8D444F05990DB877` FOREIGN KEY (`OrderStatusRef`) REFERENCES `OrderStatuses` (`ID`),
  CONSTRAINT `FK8D444F05C0F431DD` FOREIGN KEY (`Assigne`) REFERENCES `Users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'2012-12-02 00:00:00','',11,'2010-12-02 00:00:00','OrderName1',1,'2011-12-02 00:00:00',640,1,10,4),(2,'2012-12-02 00:00:00','\0',12,'2010-12-02 00:00:00','OrderName2',2,'2011-12-02 00:00:00',120,3,11,3),(3,'2012-12-02 00:00:00','',13,'2010-12-02 00:00:00','OrderName3',3,'2011-12-02 00:00:00',0,7,10,2),(4,'2012-12-02 00:00:00','\0',14,'2010-12-02 00:00:00','OrderName4',4,'2011-12-02 00:00:00',0,4,10,1),(5,'2012-12-02 00:00:00','',15,'2010-12-02 00:00:00','OrderName5',5,'2011-12-02 00:00:00',0,2,11,4),(6,'2012-12-02 00:00:00','\0',16,'2010-12-02 00:00:00','OrderName6',6,'2011-12-02 00:00:00',0,2,10,1);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IsProductActive` bit(1) DEFAULT NULL,
  `ProductDescription` varchar(255) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductPrice` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'','productDescription1','productName1',1),(2,'','productDescription2','productName2',2),(3,'','productDescription3','productName3',3),(4,'','productDescription4','productName4',4),(5,'','productDescription5','productName5',5),(6,'','productDescription6','productName6',1),(7,'','productDescription7','productName7',2),(8,'','productDescription8','productName8',3),(9,'','productDescription9','productName9',4),(10,'','productDescription10','productNam10',5),(11,'','tasty','tomato',2),(12,'','ugly','brains',3),(13,'','i like it','bear',4),(14,'','very nice','sweets',5);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Regions`
--

DROP TABLE IF EXISTS `Regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regions`
--

LOCK TABLES `Regions` WRITE;
/*!40000 ALTER TABLE `Regions` DISABLE KEYS */;
INSERT INTO `Regions` VALUES (1,'East'),(2,'North'),(3,'South'),(4,'West');
/*!40000 ALTER TABLE `Regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Administrator'),(2,'Customer'),(3,'Merchandiser'),(4,'Supervisor');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IsUserActive` bit(1) DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Login` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CustomerTypeRef` int(11) DEFAULT NULL,
  `RegionRef` int(11) DEFAULT NULL,
  `RoleRef` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4E39DE8FEAD4DCF` (`RegionRef`),
  KEY `FK4E39DE89AEF426F` (`CustomerTypeRef`),
  KEY `FK4E39DE83D05058F` (`RoleRef`),
  CONSTRAINT `FK4E39DE83D05058F` FOREIGN KEY (`RoleRef`) REFERENCES `Roles` (`ID`),
  CONSTRAINT `FK4E39DE89AEF426F` FOREIGN KEY (`CustomerTypeRef`) REFERENCES `CustomerTypes` (`ID`),
  CONSTRAINT `FK4E39DE8FEAD4DCF` FOREIGN KEY (`RegionRef`) REFERENCES `Regions` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'',10,'mail@gmail.com','ivanka','horoshko','iva','qwerty',1,4,1),(2,'',10,'mail@gmail.com','myroslav','shram','myroslav','qwerty',2,3,1),(3,'',10,'mail@gmail.com','marko','bekhta','marko','qwerty',3,2,1),(4,'',10,'mail@gmail.com','vitalik','nobis','vitalik','qwerty',4,1,1),(5,'',10,'mail@gmail.com','orest','vovchack','orest','qwerty',1,4,1),(6,'',10,'mail@gmail.com','roman','nazarevuch','romanN','qwerty',2,3,1),(7,'',10,'mail@gmail.com','roman','svustyn','romanS','qwerty',3,2,1),(8,'',10,'mail@gmail.com','firstName1','lastName1','login1','qwerty',1,1,2),(9,'',10,'mail@gmail.com','firstName2','lastName2','login2','qwerty',1,1,3),(10,'',10,'mail@gmail.com','firstName3','lastName3','login3','qwerty',1,1,4),(11,'',10,'mail@gmail.com','firstName4','lastName4','login4','qwerty',1,2,4),(12,'',10,'mail@gmail.com','noneivanka','nonehoroshko','noneiva','qwerty',1,4,1),(13,'',10,'mail@gmail.com','nonemyroslav','noneshram','nonemyroslav','qwerty',2,3,1),(14,'',10,'mail@gmail.com','nonemarko','nonebekhta','nonemarko','qwerty',3,2,1),(15,'',10,'mail@gmail.com','nonevitalik','nonenobis','nonevitalik','qwerty',4,1,1),(16,'',10,'mail@gmail.com','noneorest','nonevovchack','noneorest','qwerty',1,4,1),(17,'',10,'mail@gmail.com','noneroman','nonenazarevuch','noneromanN','qwerty',2,3,1),(18,'',10,'mail@gmail.com','noneroman','nonesvustyn','noneromanS','qwerty',3,2,1),(19,'',10,'mail@gmail.com','nonefirstName1','nonelastName1','nonelogin1','qwerty',1,1,2),(20,'',10,'mail@gmail.com','nonefirstName2','nonelastName2','nonelogin2','qwerty',1,1,3),(21,'',10,'mail@gmail.com','nonefirstName3','nonelastName3','nonelogin3','qwerty',1,1,4),(22,'',10,'mail@gmail.com','nonefirstName4','nonelastName4','nonelogin4','qwerty',1,2,4);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-06 14:34:38
