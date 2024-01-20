-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: 34.71.12.223    Database: HW8
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Article` (
  `ArticleID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `PublicationDate` date NOT NULL,
  `SectionID` int NOT NULL,
  `CommentID` int NOT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `Article_Section_SectionID_fk` (`SectionID`),
  KEY `Article_Comment_CommentID_fk` (`CommentID`),
  CONSTRAINT `Article_Comment_CommentID_fk` FOREIGN KEY (`CommentID`) REFERENCES `Comment` (`CommentID`),
  CONSTRAINT `Article_Section_SectionID_fk` FOREIGN KEY (`SectionID`) REFERENCES `Section` (`SectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArticleAuthor`
--

DROP TABLE IF EXISTS `ArticleAuthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ArticleAuthor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AuthorName` varchar(255) DEFAULT NULL,
  `ArticleID` int DEFAULT NULL,
  `PeopleID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ArticleAuthor_Article_ArticleID_fk` (`ArticleID`),
  KEY `ArticleAuthor_People_PeopleID_fk` (`PeopleID`),
  CONSTRAINT `ArticleAuthor_Article_ArticleID_fk` FOREIGN KEY (`ArticleID`) REFERENCES `Article` (`ArticleID`),
  CONSTRAINT `ArticleAuthor_People_PeopleID_fk` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArticleAuthor`
--

LOCK TABLES `ArticleAuthor` WRITE;
/*!40000 ALTER TABLE `ArticleAuthor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArticleAuthor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comment` (
  `CommentID` int NOT NULL AUTO_INCREMENT,
  `ArticleID` int NOT NULL,
  `Comment` text,
  `Date` date DEFAULT NULL,
  `PeopleID` int DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `Comment___fk` (`ArticleID`),
  KEY `Comment_People_PeopleID_fk` (`PeopleID`),
  CONSTRAINT `Comment___fk` FOREIGN KEY (`ArticleID`) REFERENCES `Article` (`ArticleID`),
  CONSTRAINT `Comment_People_PeopleID_fk` FOREIGN KEY (`PeopleID`) REFERENCES `People` (`PeopleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `People` (
  `PeopleID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) DEFAULT NULL,
  `LastName` varchar(40) DEFAULT NULL,
  `CommentID` int DEFAULT NULL,
  `IsStaff` bool DEFAULT NULL,
  PRIMARY KEY (`PeopleID`),
  KEY `People_Comment_CommentID_fk` (`CommentID`),
  CONSTRAINT `People_Comment_CommentID_fk` FOREIGN KEY (`CommentID`) REFERENCES `Comment` (`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Section` (
  `SectionID` int NOT NULL AUTO_INCREMENT,
  `SectionName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`SectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14  4:32:01
