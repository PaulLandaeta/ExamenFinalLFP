CREATE DATABASE  IF NOT EXISTS `spotify` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `spotify`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: spotify
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
-- Table structure for table `Songs`
--

DROP TABLE IF EXISTS `Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `duration` varchar(8) NOT NULL,
  `path` varchar(500) NOT NULL,
  `albumOrder` int(11) NOT NULL,
  `plays` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idgenres_idx` (`genre`),
  KEY `idal_idx` (`albumOrder`),
  KEY `idartis_idx` (`artist`),
  CONSTRAINT `id` FOREIGN KEY (`genre`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idal` FOREIGN KEY (`albumOrder`) REFERENCES `albums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idartis` FOREIGN KEY (`artist`) REFERENCES `artists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs`
--

LOCK TABLES `Songs` WRITE;
/*!40000 ALTER TABLE `Songs` DISABLE KEYS */;
INSERT INTO `Songs` VALUES (1,'Acoustic Breeze',1,5,8,'2:37','assets/music/bensound-acousticbreeze.mp3',1,10),(2,'A new beginning',1,5,1,'2:35','assets/music/bensound-anewbeginning.mp3',2,4),(3,'Better Days',1,5,2,'2:33','assets/music/bensound-betterdays.mp3',3,10),(4,'Buddy',1,5,3,'2:02','assets/music/bensound-buddy.mp3',4,13),(5,'Clear Day',1,5,4,'1:29','assets/music/bensound-clearday.mp3',5,8),(6,'Going Higher',2,1,1,'4:04','assets/music/bensound-goinghigher.mp3',1,29),(7,'Funny Song',2,4,2,'3:07','assets/music/bensound-funnysong.mp3',2,11),(8,'Funky Element',2,1,3,'3:08','assets/music/bensound-funkyelement.mp3',2,24),(9,'Extreme Action',2,1,4,'8:03','assets/music/bensound-extremeaction.mp3',3,26),(10,'Epic',2,4,5,'2:58','assets/music/bensound-epic.mp3',3,16),(11,'Energy',2,1,6,'2:59','assets/music/bensound-energy.mp3',4,21),(12,'Dubstep',2,1,7,'2:03','assets/music/bensound-dubstep.mp3',5,21),(13,'Happiness',3,6,8,'4:21','assets/music/bensound-happiness.mp3',5,3),(14,'Happy Rock',3,6,9,'1:45','assets/music/bensound-happyrock.mp3',4,8),(15,'Jazzy Frenchy',3,6,10,'1:44','assets/music/bensound-jazzyfrenchy.mp3',3,8),(16,'Little Idea',3,6,1,'2:49','assets/music/bensound-littleidea.mp3',2,11),(17,'Memories',3,6,2,'3:50','assets/music/bensound-memories.mp3',1,6),(18,'Moose',4,7,1,'2:43','assets/music/bensound-moose.mp3',5,2),(19,'November',4,7,2,'3:32','assets/music/bensound-november.mp3',4,5),(20,'Of Elias Dream',4,7,3,'4:58','assets/music/bensound-ofeliasdream.mp3',3,3),(21,'Pop Dance',4,7,2,'2:42','assets/music/bensound-popdance.mp3',2,10),(22,'Retro Soul',4,7,5,'3:36','assets/music/bensound-retrosoul.mp3',1,10),(23,'Sad Day',5,2,1,'2:28','assets/music/bensound-sadday.mp3',1,9),(24,'Sci-fi',5,2,2,'4:44','assets/music/bensound-scifi.mp3',2,2),(25,'Slow Motion',5,2,3,'3:26','assets/music/bensound-slowmotion.mp3',3,3),(26,'Sunny',5,2,4,'2:20','assets/music/bensound-sunny.mp3',4,18),(27,'Sweet',5,2,5,'5:07','assets/music/bensound-sweet.mp3',5,14),(28,'Tenderness ',3,3,7,'2:03','assets/music/bensound-tenderness.mp3',4,12),(29,'The Lounge',3,3,8,'4:16','assets/music/bensound-thelounge.mp3 ',3,6),(30,'Ukulele',3,3,9,'2:26','assets/music/bensound-ukulele.mp3 ',2,18),(31,'Tomorrow',3,3,1,'4:54','assets/music/bensound-tomorrow.mp3 ',1,9);
/*!40000 ALTER TABLE `Songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `artworkPath` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idgenres_idx` (`genre`),
  KEY `idartist_idx` (`artist`),
  CONSTRAINT `idartist` FOREIGN KEY (`artist`) REFERENCES `artists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idgenres` FOREIGN KEY (`genre`) REFERENCES `genres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Bacon and Eggs',2,4,'assets/images/artwork/clearday.jpg'),(2,'Pizza head',5,10,'assets/images/artwork/energy.jpg'),(3,'Summer Hits',3,1,'assets/images/artwork/goinghigher.jpg'),(4,'The movie soundtrack',2,9,'assets/images/artwork/funkyelement.jpg'),(5,'Best of the Worst',1,3,'assets/images/artwork/popdance.jpg'),(6,'Hello World',3,6,'assets/images/artwork/ukulele.jpg'),(7,'Best beats',4,7,'assets/images/artwork/sweet.jpg');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Mickey Mouse'),(2,'Goofy'),(3,'Bart Simpson'),(4,'Homer'),(5,'Bruce Lee');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Rock'),(2,'Pop'),(3,'Hip-hop'),(4,'Rap'),(5,'R & B'),(6,'Classical'),(7,'Techno'),(8,'Jazz'),(9,'Folk'),(10,'Country');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlistSongs`
--

DROP TABLE IF EXISTS `playlistSongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlistSongs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `songId` int(11) NOT NULL,
  `playlistId` int(11) NOT NULL,
  `playlistOrder` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idsongs_idx` (`songId`),
  KEY `idplay_idx` (`playlistId`),
  CONSTRAINT `idplay` FOREIGN KEY (`playlistId`) REFERENCES `playlists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idsongs` FOREIGN KEY (`songId`) REFERENCES `Songs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlistSongs`
--

LOCK TABLES `playlistSongs` WRITE;
/*!40000 ALTER TABLE `playlistSongs` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlistSongs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `signUpDate` datetime NOT NULL,
  `profilePic` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'reece-kenney','Reece','Kenney','Reece@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','2017-06-28 00:00:00','assets/images/profile-pics/head_emerald.png'),(2,'donkey-kong','Donkey','Kong','Dk@yahoo.com','7c6a180b36896a0a8c02787eeafb0e4c','2017-06-28 00:00:00','assets/images/profile-pics/head_emerald.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 16:33:55
