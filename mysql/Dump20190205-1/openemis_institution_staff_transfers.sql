-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: openemis
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `institution_staff_transfers`
--

DROP TABLE IF EXISTS `institution_staff_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution_staff_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL COMMENT 'links to security_users.id',
  `new_institution_id` int(11) NOT NULL COMMENT 'links to institutions.id',
  `previous_institution_id` int(11) NOT NULL COMMENT 'links to institutions.id',
  `status_id` int(11) NOT NULL COMMENT 'links to workflow_steps.id',
  `assignee_id` int(11) NOT NULL DEFAULT '0' COMMENT 'links to security_users.id',
  `new_institution_position_id` int(11) DEFAULT NULL COMMENT 'links to institution_positions.id',
  `new_staff_type_id` int(11) DEFAULT NULL COMMENT 'links to staff_types.id',
  `new_FTE` decimal(5,2) DEFAULT NULL,
  `new_start_date` date DEFAULT NULL,
  `new_end_date` date DEFAULT NULL,
  `previous_institution_staff_id` int(11) DEFAULT NULL COMMENT 'links to institution_staff.id',
  `previous_staff_type_id` int(11) DEFAULT NULL COMMENT 'links to staff_types.id',
  `previous_FTE` decimal(5,2) DEFAULT NULL,
  `previous_end_date` date DEFAULT NULL,
  `previous_effective_date` date DEFAULT NULL,
  `comment` text,
  `transfer_type` int(1) NOT NULL DEFAULT '0' COMMENT '1 -> Full Transfer, 2 -> Partial Transfer, 3 -> No Change',
  `all_visible` int(1) NOT NULL DEFAULT '0',
  `modified_user_id` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created_user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `new_institution_id` (`new_institution_id`),
  KEY `previous_institution_id` (`previous_institution_id`),
  KEY `status_id` (`status_id`),
  KEY `assignee_id` (`assignee_id`),
  KEY `new_institution_position_id` (`new_institution_position_id`),
  KEY `new_staff_type_id` (`new_staff_type_id`),
  KEY `previous_institution_staff_id` (`previous_institution_staff_id`),
  KEY `previous_staff_type_id` (`previous_staff_type_id`),
  KEY `modified_user_id` (`modified_user_id`),
  KEY `created_user_id` (`created_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_staff_transfers`
--

LOCK TABLES `institution_staff_transfers` WRITE;
/*!40000 ALTER TABLE `institution_staff_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_staff_transfers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-05 16:33:25
