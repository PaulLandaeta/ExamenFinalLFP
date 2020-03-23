CREATE DATABASE  IF NOT EXISTS `bookstore` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bookstore`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: bookstore
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
-- Table structure for table `control`
--

DROP TABLE IF EXISTS `control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control` (
  `parametro` varchar(50) NOT NULL,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`parametro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control`
--

LOCK TABLES `control` WRITE;
/*!40000 ALTER TABLE `control` DISABLE KEYS */;
INSERT INTO `control` VALUES ('Empleado','7'),('Empresa','EGCC'),('IGV','0.18'),('Site','www.egcc.net'),('venta','24');
/*!40000 ALTER TABLE `control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'AGUERO RAMOS','EMILIO','Lima','emilio@gmail.com'),(2,'SANCHEZ ROMERO','KATHIA','Miraflores','kathia@yahoo.es'),(3,'LUNG WON','FELIX','Los Olivos','gato@hotmail.com'),(4,'CASTILLO RAMOS','EDUARDO','Barrios altos','lalo@gmail.com'),(5,'MILICICH FLORES','LAURA','Collique','laura@usil.pe'),(6,'DELGADO BARRERA','KENNETH','La punta','pochita@gmail.com'),(7,'GARCIA SOLIS','JOSE ELVIS','Barranco','pepe@gmail.com');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `idpromocion` smallint(6) NOT NULL,
  `cantmin` smallint(6) NOT NULL,
  `cantmax` smallint(6) NOT NULL,
  `porcentaje` decimal(4,2) NOT NULL,
  PRIMARY KEY (`idpromocion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` VALUES (1,1,4,0.00),(2,5,10,0.03),(3,11,20,0.05),(4,21,50,0.07),(5,51,100,0.10),(6,101,1000,0.12);
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `idpublicacion` char(8) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `nroedicion` smallint(6) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `idtipo` char(3) NOT NULL,
  PRIMARY KEY (`idpublicacion`),
  KEY `fk_publicacion_tipo` (`idtipo`),
  CONSTRAINT `fk_publicacion_tipo` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES ('LIB00001','Power Builder 6.0','William B. Heys',1,50.00,1000,'LIB'),('LIB00002','Visual Basic 6.0','Joel Carrasco',2,45.00,1500,'LIB'),('LIB00003','Programación C/S con VB','Kenneth L. Spenver',1,45.00,450,'LIB'),('LIB00004','VBScript a través de Ejemplos','Jery Honeycutt',1,35.00,720,'LIB'),('LIB00005','UNIX en 12 lecciones','Juan Matías Matías',1,25.00,500,'LIB'),('LIB00006','Visual Basic y SQL Server','Eric G. Coronel Castillo',1,35.00,5000,'LIB'),('LIB00007','Power Builder y SQL Server','Eric G. Coronel Castillo',1,35.00,5000,'LIB'),('LIB00008','PHP y MySQL','Eric G. Coronel Castillo',1,55.00,5000,'LIB'),('LIB00009','Lenguaje de Programación Java 2','Eric G. Coronel Castillo',1,55.00,5000,'LIB'),('LIB00010','Oracle Database 10g','Eric G. Coronel Castillo',1,75.00,5000,'LIB'),('REV00001','Eureka','GrapPeru',1,4.00,770,'REV'),('REV00002','El Programador','ElectroSoft S.A.C.',1,6.00,1200,'REV'),('REV00003','La Revista del Programador','PeruDev',1,10.00,590,'REV'),('SEP00001','Power Builder 7.0 Básico','Eric G. Coronel C.',1,20.00,500,'SEP'),('SEP00002','Power Builder 7.0 Avanzado','Eric G. Coronel C.',1,20.00,500,'SEP'),('SEP00003','Visual Basic 6.0 Básico','Hugo Valencia M.',1,20.00,500,'SEP'),('SEP00004','Visual Bsic 6.0 Avanzado','Hugo Valencia M.',1,20.00,500,'SEP'),('SEP00005','SQL Server 7.0 Básico','Sergio Matsukawa',1,20.00,500,'SEP'),('SEP00006','SQL Server 7.0 Avanzado','Sergio Matsukawa',1,20.00,500,'SEP'),('SEP00007','Windows 2000','Hugo Valencia',1,8.00,1190,'SEP'),('SEP00008','windows 2000','Sergio Matsukawa ',1,10.00,2000,'SEP');
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `idtest` int(11) NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`idtest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'08:00:00');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `idtipo` char(3) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `contador` int(11) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES ('ABC','Comic',0),('LIB','Libro',10),('REV','Revista',3),('SEP','Separata',8);
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idempleado` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`idempleado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'eaguero','a78b6ea3c3d1b4e9a5c464b96258455cb524bb2b',1),(2,'ksanchez','38ea2969155dc3b534271971753347a680ca572e',1),(3,'flung','9a27438ac52b22805f831b2ffd62ef7347d488b7',0),(4,'ecastillo','5f563b3b3f942be03ce2ff36b7a7c5bdda2d9df5',1),(5,'lmilicich','aac93008f65166d7ccd3bb40092ca0c2773284a3',0),(6,'kdelgado','c30811c2a03b335610f0e138b73de9d86dcde7e1',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `idempleado` int(11) NOT NULL,
  `idpublicacion` char(8) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `dcto` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `impuesto` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_venta_publicacion` (`idpublicacion`),
  KEY `fk_venta_empleado` (`idempleado`),
  CONSTRAINT `fk_venta_empleado` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`idempleado`),
  CONSTRAINT `fk_venta_publicacion` FOREIGN KEY (`idpublicacion`) REFERENCES `publicacion` (`idpublicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'ISIL','2020-01-18',5,'LIB00003',2,45.00,0.00,75.63,14.37,90.00),(2,'UNI','2020-01-19',1,'REV00002',4,6.00,0.00,20.17,3.83,24.00),(3,'Pedro','2020-01-20',3,'LIB00005',6,25.00,0.75,122.27,23.23,145.50),(4,'Pablo','2020-01-20',2,'SEP00002',1,20.00,0.00,16.81,3.19,20.00),(5,'Vilma','2020-01-21',1,'LIB00003',3,45.00,0.00,113.45,21.55,135.00),(6,'Betty','2020-01-21',5,'REV00002',7,6.00,0.18,34.24,6.50,40.74),(7,'Mercy','2020-01-22',6,'LIB00010',3,75.00,0.00,189.08,35.92,225.00),(8,'Cesar','2020-01-23',3,'SEP00002',5,20.00,0.60,81.51,15.49,97.00),(9,'Delia','2020-01-24',6,'LIB00006',8,35.00,1.05,228.24,43.36,271.60),(10,'Nora','2020-01-25',5,'SEP00008',2,10.00,0.00,16.81,3.19,20.00),(11,'Marcelo','2020-01-26',2,'SEP00007',5,8.00,0.24,32.61,6.19,38.80),(12,'Edgar','2020-01-27',2,'LIB00006',3,35.00,0.00,88.24,16.76,105.00),(13,'IPAE','2020-01-28',3,'LIB00003',2,45.00,0.00,75.63,14.37,90.00),(14,'ISL','2020-01-29',6,'REV00002',4,6.00,0.00,20.17,3.83,24.00),(15,'UNI','2020-01-31',1,'LIB00005',6,25.00,0.75,122.27,23.23,145.50),(16,'Carmen','2020-01-31',3,'SEP00005',1,20.00,0.00,16.81,3.19,20.00),(17,'Delia','2020-01-31',5,'LIB00003',3,45.00,0.00,113.45,21.55,135.00),(18,'Ricardo','2020-02-07',1,'REV00002',7,6.00,0.18,34.24,6.50,40.74),(19,'Claudia','2020-02-10',4,'LIB00005',3,25.00,0.00,63.03,11.97,75.00),(20,'Roberto','2020-02-10',6,'SEP00006',5,20.00,0.60,81.51,15.49,97.00),(21,'Nora','2020-02-15',2,'LIB00006',8,35.00,1.05,228.24,43.36,271.60),(22,'Elena','2020-02-15',1,'SEP00004',2,20.00,0.00,33.61,6.39,40.00),(23,'Cynthia','2020-02-18',4,'SEP00007',5,8.00,0.24,32.61,6.19,38.80),(24,'Alejandra','2020-02-18',3,'LIB00007',3,35.00,0.00,88.24,16.76,105.00);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 16:53:22
