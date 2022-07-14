/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.19-MariaDB : Database - syarkoni_perpus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`syarkoni_perpus` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `syarkoni_perpus`;

/*Table structure for table `authors` */

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `authorId` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `surname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `authors` */

insert  into `authors`(`authorId`,`name`,`surname`) values 
(1,'Winson','Winson'),
(2,'Naruto','Naruto'),
(3,'Nanda','Nanda'),
(4,'Woke','Woke'),
(5,'Ana','Ana'),
(6,'Ani','Ani'),
(7,'Andi','Andi');

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookid` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `pagecount` int(6) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookid`),
  KEY `authorId` (`authorId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `authors` (`authorId`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `types` (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `books` */

insert  into `books`(`bookid`,`name`,`pagecount`,`point`,`authorId`,`typeId`) values 
(1,'TIK',80,1,1,2),
(2,'SI',82,1,2,1),
(3,'Indo',82,1,3,2),
(4,'Sunda',83,1,4,1),
(5,'Inggris',84,1,5,2),
(6,'IPS',85,1,6,1),
(7,'MI',87,1,7,2);

/*Table structure for table `borrows` */

DROP TABLE IF EXISTS `borrows`;

CREATE TABLE `borrows` (
  `borrorwid` int(11) NOT NULL,
  `studentid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `takenDate` date DEFAULT NULL,
  `broughtDate` date DEFAULT NULL,
  PRIMARY KEY (`borrorwid`),
  KEY `studentid` (`studentid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `borrows_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `borrows_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `borrows` */

insert  into `borrows`(`borrorwid`,`studentid`,`bookid`,`takenDate`,`broughtDate`) values 
(1,1,1,'2022-07-13','2022-07-14'),
(2,2,2,'2022-07-13','2022-07-14'),
(3,3,3,'2022-07-13','2022-07-14'),
(4,4,4,'2022-07-14','2022-07-14'),
(5,5,5,'2022-07-14','2022-07-14'),
(6,6,6,'2022-07-13','2022-07-14'),
(7,6,6,'2022-07-13','2022-07-14'),
(8,6,7,'2022-07-13','2022-07-14');

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `studentid` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `surname` varchar(64) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(64) DEFAULT NULL,
  `class` varchar(64) DEFAULT NULL,
  `pont` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `students` */

insert  into `students`(`studentid`,`name`,`surname`,`birthdate`,`gender`,`class`,`pont`) values 
(1,'Rudi','Rudi','2022-07-14','Male','A1',1),
(2,'Rido','Rido','2022-07-14','Male','A1',1),
(3,'Rada','Rada','2022-07-14','Male','A1',1),
(4,'Rana','Rana','2022-07-14','Male','A1',1),
(5,'Radi','Radi','2022-07-14','Male','A1',1),
(6,'Rama','Rama','2022-07-14','Male','A1',1);

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `typeID` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `types` */

insert  into `types`(`typeID`,`name`) values 
(1,'Ilmu Pasti'),
(2,'Pendidikan');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
