-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: product_review
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(300) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'BULLU BABI',3000,'made from snake','2024-02-01 17:00:00'),(17,'jar',1111,'asddas','2024-03-07 10:04:15'),(30,'scp-5437',1,'sds','2024-03-08 06:48:46'),(41,'SCP-7',777,'WUWUWUWUW','2024-03-08 10:16:41'),(42,'naga',9876543,'PAAN NEH KOK DIJUAL','2024-03-08 15:29:07');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `rating` int NOT NULL,
  `review_content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
INSERT INTO `product_review` VALUES (1,2,'oensam07@gmail.com',7,'sddsds','2024-03-08 14:37:25'),(2,2,'oensam07@gmail.com',4,'ads','2024-03-08 14:52:29'),(3,2,'oensam07@gmail.com',10,'lalala','2024-03-08 14:56:46'),(4,2,'oensam07@gmail.com',10,'lalala','2024-03-08 14:57:36'),(5,2,'oensam07@gmail.com',10,'lalala','2024-03-08 15:00:15'),(6,2,'oensam07@gmail.com',10,'lalala','2024-03-08 15:00:40'),(7,2,'oensam07@gmail.com',10,'lalala','2024-03-08 15:00:49'),(8,2,'oensam07@gmail.com',10,'lalala','2024-03-08 15:00:58'),(9,42,'oensam07@gmail.com',9,'WAH GAJELAS BANGET TAPI LUCU MUKANYA :3','2024-03-08 15:30:47'),(10,2,'oensam07@gmail.com',7,'ASSAASSAASAS','2024-03-08 15:37:38');
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'oensam07@gmail.com','Sam','$2b$12$d0F4eA0sbmGwP0dthPhZ0uEoDT8sTRLYzZ6a1aE2yfeB/za8mjpSa','2024-03-07 17:20:45'),(2,'test@boneka.iyey','test','$2b$12$cqKKNYRvAYc4wic2kCNhO.oCxbDBqBBuObIh9RhwCzYmz9a1A2Z5K','2024-03-08 00:49:16'),(3,'123@test.uwu','bubu','$2b$12$3f2FHPZnSlIXMYRBcwu87ON6EXEKyco/5VHkyxjDiNLIBtPb1penm','2024-03-08 05:32:54'),(4,'abdulsial@keselaja.yey','abdul','$2b$12$7q8HUqtP4GW2/Bhxfmi4GeDJqKqi3WhGGlO5Je6Gt2.4yBudAhLLm','2024-03-08 06:40:29'),(5,'IPING7@DOTO.COM','IPING','$2b$12$2efBudjsLumG/jnVEPShROQsUmaTTZLLkgt/vr6.MYcwYk7WnhgdC','2024-03-08 10:14:46'),(6,'oensam07@gmail.com','rico','$2b$12$wn3sIG.dH2EuO9.8mYJPKeNXnHRLnCj13Nf3caJhtsV8JWFMBSjZe','2024-03-08 15:28:31');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-09  9:52:44
