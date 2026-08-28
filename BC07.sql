/*
SQLyog Community v8.71 
MySQL - 5.5.30 : Database - bc07-2025
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bc07-2025` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bc07-2025`;

/*Table structure for table `consumer_keys` */

DROP TABLE IF EXISTS `consumer_keys`;

CREATE TABLE `consumer_keys` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(200) DEFAULT NULL,
  `file_id` int(200) DEFAULT NULL,
  `consumer_id` int(200) DEFAULT NULL,
  `decrypt_key` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `consumer_keys` */

insert  into `consumer_keys`(`id`,`purchase_id`,`file_id`,`consumer_id`,`decrypt_key`,`status`) values (1,1,1,1,'332db7aa814f4913','active'),(2,2,5,2,'a10c39c5125e48b4','active'),(3,3,6,1,'c511d73f33854632','active'),(4,3,6,1,'9564d1932aae4fed','active'),(5,3,6,1,'1aca96334627476e','active'),(6,4,6,2,'2a448add39d6447d','active'),(7,4,6,2,'999875d1ff444d8c','active'),(8,3,6,1,'408e51d04e434b59','active'),(9,5,7,2,'1fe82d39aa4842b3','active'),(10,4,6,2,'c295bec325bc443f','active');

/*Table structure for table `consumers` */

DROP TABLE IF EXISTS `consumers`;

CREATE TABLE `consumers` (
  `consumer_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT 'unique',
  `mobile` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `wallet_balance` double DEFAULT '0',
  `registered_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`consumer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `consumers` */

insert  into `consumers`(`consumer_id`,`name`,`email`,`mobile`,`password`,`wallet_balance`,`registered_on`) values (1,'consumer','consumer@gmail.com','7845984758','consumer@123',500,'2025-11-28 11:13:02'),(2,'client','client@gmail.com','6547895478','client@123',400,'2026-02-14 17:03:22');

/*Table structure for table `data_items` */

DROP TABLE IF EXISTS `data_items`;

CREATE TABLE `data_items` (
  `data_id` int(255) NOT NULL AUTO_INCREMENT,
  `producer_id` int(200) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `encrypted_path` varchar(300) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `hash_value` varchar(200) DEFAULT NULL,
  `relay_list` varchar(300) DEFAULT NULL,
  `aes_key` longtext,
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `data_items` */

insert  into `data_items`(`data_id`,`producer_id`,`file_name`,`encrypted_path`,`price`,`hash_value`,`relay_list`,`aes_key`,`upload_time`) values (1,2,'data','F:\\mnt\\data\\uploads\\enc_1763961775662_gtr.txt',500,'fe7fe15298a950b63087efaacef3327b650ee83ee713084728ad8a5cf0439ea1','1',NULL,'2025-11-24 10:55:08'),(2,1,'java','F:\\mnt\\data\\uploads\\enc_1763962060211_ffff.txt',300,'d452838a7fbeb1c890a14661b0c52d81b75107ca838104d39804a0fc646ff75d','1',NULL,'2025-11-24 10:58:10'),(3,1,'servlets','F:\\mnt\\data\\uploads\\enc_1763963718429_data.txt',700,'4f8ea0fd46d88d2ce7029b107b9251019036bc7d0495d7ff2019073a38007bfc','2,1',NULL,'2025-11-24 11:25:59'),(5,2,'jsp','F:\\mnt\\data\\uploads\\enc_1764050137570_java.txt',400,'7b415e0d9c76d11857d638ff07e036e0612123ce60c469bb9b3901f04797aac9','3','bI0kC1fRgArdY+pqWYwXKsOXmCLffdxgQuFnh09Lmd4=','2025-11-25 11:30:21'),(6,1,'random','F:\\mnt\\data\\uploads\\enc_1764223684830_Hibernate.txt',300,'87bbed172e79177ade4cff8981a1f9499fae1f54a0eacc621e173ab485668f0d','3,2,1','jb02+GtPWHg41yZ/5mtsltO7iTzqf6ZTD7qWPF6DDfE=','2025-11-27 11:39:23'),(7,3,'review','F:\\mnt\\data\\uploads\\enc_1771057802840_random.txt',400,'23d38a0d6faf429c8cc54a2665d36e2871874c979dd581eeafd7b15341f1f554','4','i2LVlkmTjmCF8oVO3K7mhxqds4+OdaiIVNSfqNAHuvs=','2026-02-14 16:58:50');

/*Table structure for table `producers` */

DROP TABLE IF EXISTS `producers`;

CREATE TABLE `producers` (
  `producer_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT 'unique',
  `password` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `organization` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `registered_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`producer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `producers` */

insert  into `producers`(`producer_id`,`name`,`email`,`password`,`mobile`,`organization`,`address`,`registered_on`) values (1,'producer','producer@gmail.com','producer@123','8749654784','Vertilink','Hyd','2025-11-21 12:33:28'),(2,'Sandeep','sandeep@gmail.com','Sandeep@16','9874586587','ghjbhjdw','Hyd\r\n','2025-11-24 10:43:32'),(3,'owner','owner@gmail.com','owner@123','8747896547','fbgn','jkb','2026-02-14 13:56:26');

/*Table structure for table `purchases` */

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `file_id` int(200) DEFAULT NULL,
  `consumer_id` int(200) DEFAULT NULL,
  `purchase_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(200) DEFAULT NULL,
  `price` int(200) DEFAULT NULL,
  `producer_share` int(200) DEFAULT NULL,
  `relay_share` int(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `purchases` */

insert  into `purchases`(`id`,`file_id`,`consumer_id`,`purchase_time`,`status`,`price`,`producer_share`,`relay_share`) values (1,1,1,'2025-11-24 15:57:26','ready_for_download',500,350,150),(2,5,2,'2025-11-25 11:37:45','ready_for_download',400,280,120),(3,6,1,'2025-11-28 11:13:02','ready_for_download',300,210,90),(4,6,2,'2026-02-14 17:57:24','producer_approved',300,NULL,NULL),(5,7,2,'2026-02-14 17:03:22','ready_for_download',400,280,120);

/*Table structure for table `relay_storage` */

DROP TABLE IF EXISTS `relay_storage`;

CREATE TABLE `relay_storage` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `relay_id` int(200) DEFAULT NULL,
  `data_id` int(200) DEFAULT NULL,
  `encrypted_copy_path` varchar(300) DEFAULT NULL,
  `stored_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'pending',
  `stored_path` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `relay_storage` */

insert  into `relay_storage`(`id`,`relay_id`,`data_id`,`encrypted_copy_path`,`stored_on`,`status`,`stored_path`) values (1,1,1,'F:\\mnt\\data\\uploads\\enc_1763961775662_gtr.txt','2025-11-24 11:49:41','accepted','F:\\mnt\\data\\relay_uploaded\\enc_1763961775662_gtr.txt'),(2,1,2,'F:\\mnt\\data\\uploads\\enc_1763962060211_ffff.txt','2025-11-27 11:34:45','rejected','F:\\mnt\\data\\relay_uploaded\\enc_1763962060211_ffff.txt'),(4,2,3,'F:\\mnt\\data\\uploads\\enc_1763963718429_data.txt','2025-11-24 11:49:10','accepted','F:\\mnt\\data\\relay_uploaded\\enc_1763963718429_data.txt'),(5,1,3,'F:\\mnt\\data\\uploads\\enc_1763963718429_data.txt','2025-11-24 11:50:22','accepted','F:\\mnt\\data\\relay_uploaded\\enc_1763963718429_data.txt'),(6,3,5,'F:\\mnt\\data\\uploads\\enc_1764050137570_java.txt','2025-11-25 11:33:06','accepted','F:\\mnt\\data\\relay_uploaded\\enc_1764050137570_java.txt'),(7,3,6,'F:\\mnt\\data\\uploads\\enc_1764223684830_Hibernate.txt','2025-11-27 11:42:03','accepted','F:\\mnt\\data\\relay_uploaded\\enc_1764223684830_Hibernate.txt'),(8,2,6,'F:\\mnt\\data\\uploads\\enc_1764223684830_Hibernate.txt','2025-11-27 11:41:37','accepted','F:\\mnt\\data\\relay_uploaded\\enc_1764223684830_Hibernate.txt'),(9,1,6,'F:\\mnt\\data\\uploads\\enc_1764223684830_Hibernate.txt','2025-11-27 18:36:37','accepted','F:\\mnt\\data\\relay_uploaded\\enc_1764223684830_Hibernate.txt'),(10,4,7,'F:\\mnt\\data\\uploads\\enc_1771057802840_random.txt','2026-02-14 17:00:43','accepted','F:\\mnt\\data\\relay_uploaded\\enc_1771057802840_random.txt');

/*Table structure for table `relays` */

DROP TABLE IF EXISTS `relays`;

CREATE TABLE `relays` (
  `relay_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT 'unique',
  `password` varchar(100) DEFAULT NULL,
  `storage_capacity` longtext,
  `used_storage` bigint(20) DEFAULT '0',
  `bandwidth` varchar(200) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `registered_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `endpoint_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`relay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `relays` */

insert  into `relays`(`relay_id`,`name`,`email`,`password`,`storage_capacity`,`used_storage`,`bandwidth`,`location`,`registered_on`,`endpoint_url`) values (1,'relay','relay@gmail.com','relay@123','50',31,'20','hyd','2025-11-24 10:53:53','http://localhost:8080/VTJBC07-2025/RelayUploadServlet'),(2,'hp','hp@gmail.com','hp@123','40',17,'15','hyd','2025-11-24 11:17:40','http://localhost:8080/VTJBC07-2025/RelayUploadServlet'),(3,'owner','owner@gmail.com','owner@123','80',45,'20','Hyderabad','2025-11-25 11:27:15','http://localhost:8080/VTJBC07-2025/RelayUploadServlet'),(4,'auditor','auditor@gmail.com','auditor@123','60',0,'20','hyd','2026-02-14 15:59:37','http://localhost:8082/VTJBC07-2025/RelayUploadServlet');

/*Table structure for table `wallet_transactions` */

DROP TABLE IF EXISTS `wallet_transactions`;

CREATE TABLE `wallet_transactions` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `consumer_id` int(200) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `type` varchar(200) DEFAULT 'credit',
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `wallet_transactions` */

insert  into `wallet_transactions`(`id`,`consumer_id`,`amount`,`type`,`timestamp`) values (1,2,500,'credit','2025-11-25 12:28:54');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
