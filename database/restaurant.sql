CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `restaurant`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `slogan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES ('Grazing in style'),(NULL),('Bovine friendly and heart smart'),('Where the grazin\'s good'),('The grass is greener here'),('Welcome to the \"other side\"');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredientid` char(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `unit` char(10) DEFAULT NULL,
  `unitprice` decimal(5,2) DEFAULT NULL,
  `foodgroup` char(15) DEFAULT NULL,
  `inventory` int(11) DEFAULT '0',
  `vendorid` char(5) DEFAULT NULL,
  PRIMARY KEY (`ingredientid`),
  KEY `vendorid` (`vendorid`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`vendorid`) REFERENCES `vendors` (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES ('CHESE','Cheese','scoop',0.03,'Milk',150,'DNDRY'),('CHIKN','Chicken','strip',0.45,'Meat',120,'DNDRY'),('CRUTN','Crouton','piece',0.01,'Bread',400,'EDDRS'),('GRAPE','Grape','piece',0.01,'Fruit',300,'FRTFR'),('LETUS','Lettuce','bowl',0.01,'Vegetable',200,'VGRUS'),('ORNG','Orange','slice',0.05,'Fruit',10,'FRTFR'),('PICKL','Pickle','slice',0.04,'Vegetable',800,'VGRUS'),('SCTDR','Secret Dressing','ounce',0.03,NULL,120,NULL),('SODA','Soda','glass',0.69,NULL,5000,'SPWTR'),('TOMTO','Tomato','slice',0.03,'Fruit',15,'VGRUS'),('WATER','Water','glass',0.06,NULL,NULL,'SPWTR'),('WTRML','Watermelon','piece',0.02,'Fruit',NULL,'FRTFR');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemid` char(5) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `dateadded` date DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('CHKSD','Chicken Salad',2.85,'2013-06-05'),('FRPLT','Fruit Plate',3.99,'2013-09-22'),('FRTSD','Fruit Salad',3.45,'2013-06-06'),('GDNSD','Garden Salad',0.99,'2014-02-03'),('MILSD','Millennium Salad',NULL,'2014-07-16'),('SODA','Soda',0.99,'2014-02-02'),('WATER','Water',0.00,'2013-02-20');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madewith`
--

DROP TABLE IF EXISTS `madewith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `madewith` (
  `itemid` char(5) NOT NULL,
  `ingredientid` char(5) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`,`ingredientid`),
  KEY `ingredientid` (`ingredientid`),
  CONSTRAINT `madewith_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`),
  CONSTRAINT `madewith_ibfk_2` FOREIGN KEY (`ingredientid`) REFERENCES `ingredients` (`ingredientid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madewith`
--

LOCK TABLES `madewith` WRITE;
/*!40000 ALTER TABLE `madewith` DISABLE KEYS */;
INSERT INTO `madewith` VALUES ('CHKSD','CHESE',2),('CHKSD','CHIKN',4),('CHKSD','LETUS',1),('CHKSD','SCTDR',1),('FRPLT','CHESE',10),('FRPLT','CRUTN',10),('FRPLT','GRAPE',10),('FRPLT','ORNG',10),('FRPLT','TOMTO',8),('FRPLT','WTRML',10),('FRTSD','GRAPE',10),('FRTSD','WTRML',5),('GDNSD','LETUS',4),('GDNSD','TOMTO',8),('SODA','SODA',1),('WATER','WATER',1);
/*!40000 ALTER TABLE `madewith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meals` (
  `mealid` char(5) NOT NULL,
  `name` char(20) DEFAULT NULL,
  PRIMARY KEY (`mealid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES ('CKSDS','Chicken N Suds'),('VGNET','Vegan Eatin\'');
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ordernumber` int(11) NOT NULL,
  `linenumber` int(11) NOT NULL,
  `storeid` char(5) NOT NULL,
  `menuitemid` char(5) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`storeid`,`ordernumber`,`linenumber`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`storeid`) REFERENCES `stores` (`storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'#2STR','CKSDS',3.68,'2014-04-26 02:02:04'),(1,2,'#2STR','CHKSD',2.85,'2014-04-26 02:02:19'),(1,3,'#2STR','SODA',0.99,'2014-04-26 02:02:34'),(1,4,'#2STR','GDNSD',0.99,'2014-04-26 02:02:49'),(2,1,'#2STR','CHKSD',2.85,'2014-04-26 02:04:04'),(2,2,'#2STR','SODA',0.99,'2014-04-26 02:04:19'),(3,1,'#2STR','CHKSD',2.85,'2014-04-26 02:05:34'),(3,2,'#2STR','FRPLT',3.99,'2014-04-26 02:05:49'),(3,3,'#2STR','GDNSD',0.99,'2014-04-26 02:06:04'),(1,1,'CASTR','CHKSD',2.85,'2014-04-26 02:22:04'),(1,2,'CASTR','GDNSD',0.99,'2014-04-26 02:22:19'),(2,1,'CASTR','SODA',0.99,'2014-04-26 02:23:34'),(2,2,'CASTR','FRTSD',3.45,'2014-04-26 02:23:49'),(2,3,'CASTR','SODA',0.99,'2014-04-26 02:24:04'),(2,4,'CASTR','VGNET',4.38,'2014-04-26 02:24:19'),(3,1,'CASTR','VGNET',4.38,'2014-04-26 02:25:34'),(3,2,'CASTR','FRPLT',3.99,'2014-04-26 02:25:49'),(3,3,'CASTR','FRTSD',3.45,'2014-04-26 02:26:04'),(3,4,'CASTR','WATER',0.00,'2014-04-26 02:26:19'),(3,5,'CASTR','CHKSD',2.85,'2014-04-26 02:26:34'),(1,1,'FIRST','FRTSD',3.45,'2014-04-26 01:46:04'),(1,2,'FIRST','WATER',0.00,'2014-04-26 01:46:19'),(1,3,'FIRST','WATER',0.00,'2014-04-26 01:46:34'),(2,1,'FIRST','CHKSD',2.85,'2014-04-26 01:47:49'),(3,1,'FIRST','SODA',0.99,'2014-04-26 01:49:04'),(3,2,'FIRST','FRPLT',3.99,'2014-04-26 01:49:19'),(3,3,'FIRST','VGNET',4.38,'2014-04-26 01:49:34'),(1,1,'NDSTR','WATER',0.00,'2014-04-26 02:01:04'),(1,2,'NDSTR','FRPLT',3.99,'2014-04-26 02:01:19'),(2,1,'NDSTR','GDNSD',0.99,'2014-04-26 02:15:34'),(3,1,'NDSTR','VGNET',4.38,'2014-04-26 02:16:49'),(3,2,'NDSTR','FRPLT',3.99,'2014-04-26 02:17:04'),(3,3,'NDSTR','FRTSD',3.45,'2014-04-26 02:17:19'),(3,4,'NDSTR','SODA',0.99,'2014-04-26 02:17:34');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partof`
--

DROP TABLE IF EXISTS `partof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partof` (
  `mealid` char(5) NOT NULL,
  `itemid` char(5) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discount` decimal(2,2) DEFAULT '0.00',
  PRIMARY KEY (`mealid`,`itemid`),
  KEY `itemid` (`itemid`),
  CONSTRAINT `partof_ibfk_1` FOREIGN KEY (`mealid`) REFERENCES `meals` (`mealid`),
  CONSTRAINT `partof_ibfk_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partof`
--

LOCK TABLES `partof` WRITE;
/*!40000 ALTER TABLE `partof` DISABLE KEYS */;
INSERT INTO `partof` VALUES ('CKSDS','CHKSD',1,0.02),('CKSDS','SODA',1,0.10),('VGNET','FRTSD',1,0.01),('VGNET','GDNSD',1,0.03),('VGNET','WATER',1,0.00);
/*!40000 ALTER TABLE `partof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `storeid` char(5) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(10) DEFAULT NULL,
  `manager` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES ('#2STR','2222 2nd Ave.','Waco','TX','76798-7356','Greg Speegle'),('CASTR','4444 4th Blvd','San Francsico','CA','94101-4150','Greg Donahoo'),('FIRST','1111 Main St.','Waco','TX','76798','Jeff Donahoo'),('NDSTR','3333 3rd St.','Fargo','ND','58106','Jeff Speegle'),('NWSTR',NULL,NULL,'TX',NULL,'Man Ager');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendorid` char(5) NOT NULL,
  `companyname` varchar(30) NOT NULL DEFAULT 'SECRET',
  `repfname` varchar(20) DEFAULT 'Mr. or Ms.',
  `replname` varchar(20) DEFAULT NULL,
  `referredby` char(5) DEFAULT NULL,
  PRIMARY KEY (`vendorid`),
  UNIQUE KEY `repfname` (`repfname`,`replname`),
  KEY `referredby` (`referredby`),
  CONSTRAINT `vendors_ibfk_1` FOREIGN KEY (`referredby`) REFERENCES `vendors` (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES ('DNDRY','Don\'s Dairy','Marla','Milker','VGRUS'),('EDDRS','Ed\'s Dressings','Sam','Sauce','FRTFR'),('FLVCR','Flavorful Creams','Sherman','Sherbert','VGRUS'),('FRTFR','\"Fruit Eating\" Friends','Gilbert','Grape','FLVCR'),('SPWTR','Spring Water Supply','Gus','Hing','EDDRS'),('VGRUS','Veggies_R_Us','Candy','Corn',NULL);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 16:42:20
