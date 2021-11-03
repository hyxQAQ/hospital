/*
SQLyog Ultimate v8.32 
MySQL - 5.7.29 : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hospital`;

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `areaId` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(50) NOT NULL,
  PRIMARY KEY (`areaId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `area` */

insert  into `area`(`areaId`,`areaName`) values (4,'河南省a有限公司 ');

/*Table structure for table `ban` */

DROP TABLE IF EXISTS `ban`;

CREATE TABLE `ban` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `ban` */

insert  into `ban`(`bid`,`bname`) values (1,'有班'),(2,'无班');

/*Table structure for table `baoque` */

DROP TABLE IF EXISTS `baoque`;

CREATE TABLE `baoque` (
  `baoqueid` int(11) NOT NULL AUTO_INCREMENT,
  `baoqueName` varchar(100) DEFAULT NULL,
  `baoqueNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`baoqueid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `baoque` */

/*Table structure for table `bed` */

DROP TABLE IF EXISTS `bed`;

CREATE TABLE `bed` (
  `bedId` int(11) NOT NULL AUTO_INCREMENT,
  `bedname` varchar(300) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`bedId`) USING BTREE,
  KEY `fk_bedDepartmentid` (`departmentId`) USING BTREE,
  CONSTRAINT `fk_bedDepartmentid` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `bed` */

insert  into `bed`(`bedId`,`bedname`,`departmentId`,`state`,`Price`) values (8,'外科1',8,0,10),(9,'内科一',7,1,10);

/*Table structure for table `caigou` */

DROP TABLE IF EXISTS `caigou`;

CREATE TABLE `caigou` (
  `caigouid` int(11) NOT NULL AUTO_INCREMENT,
  `caigouname` varchar(50) DEFAULT NULL,
  `gonghuoshang` varchar(50) DEFAULT NULL,
  `danwei` varchar(10) DEFAULT NULL,
  `candi` varchar(100) DEFAULT NULL,
  `leixing` varchar(20) DEFAULT NULL,
  `shuliang` int(11) DEFAULT NULL,
  PRIMARY KEY (`caigouid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `caigou` */

insert  into `caigou`(`caigouid`,`caigouname`,`gonghuoshang`,`danwei`,`candi`,`leixing`,`shuliang`) values (16,'阿莫西林','春天大药房 ','盒','河南省a有限公司 ','西药',20);

/*Table structure for table `cashier` */

DROP TABLE IF EXISTS `cashier`;

CREATE TABLE `cashier` (
  `cashier` int(11) NOT NULL AUTO_INCREMENT,
  `reportId` int(11) NOT NULL,
  `durgname` varchar(500) NOT NULL,
  `durgnum` int(11) NOT NULL,
  `repiceprice` double NOT NULL,
  `repicetotal` double NOT NULL,
  `state` int(11) DEFAULT NULL,
  `ctime` date DEFAULT NULL,
  `ostate` int(11) DEFAULT NULL,
  `jie` varchar(500) DEFAULT NULL,
  `mstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`cashier`) USING BTREE,
  KEY `fk_reportId` (`reportId`) USING BTREE,
  CONSTRAINT `fk_reportId` FOREIGN KEY (`reportId`) REFERENCES `report` (`reportid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `cashier` */

insert  into `cashier`(`cashier`,`reportId`,`durgname`,`durgnum`,`repiceprice`,`repicetotal`,`state`,`ctime`,`ostate`,`jie`,`mstate`) values (34,28,'板蓝根',1,30,30,0,'2019-11-21',NULL,NULL,NULL),(35,28,'阿莫西林',1,30,30,0,'2019-11-21',NULL,NULL,NULL),(36,28,'挂号费',1,30,30,2,'2019-11-21',NULL,NULL,NULL),(37,29,'ct',1,100,100,1,'2019-11-21',1,'脑部肿瘤',1),(38,29,'打针',1,20,20,1,'2019-11-21',0,NULL,1),(39,30,'阿莫西林',1,30,30,0,'2019-11-21',NULL,NULL,NULL),(40,30,'ct',1,100,100,1,'2019-11-21',1,'良好',1),(41,30,'挂号费',1,30,30,2,'2019-11-21',NULL,NULL,NULL),(43,31,'ct',1,100,100,1,'2019-11-26',1,'良好',1),(44,31,'打针',1,20,20,1,'2019-11-26',0,NULL,1),(45,36,'阿莫西林',1,30,30,0,'2021-09-14',NULL,NULL,NULL),(46,36,'板蓝根',1,30,30,0,'2021-09-14',NULL,NULL,NULL),(48,35,'板蓝根',1,30,30,0,'2021-09-14',NULL,NULL,NULL),(49,36,'打针',1,20,20,1,'2021-09-14',0,NULL,1),(50,36,'挂号费',1,30,30,2,'2021-09-14',NULL,NULL,NULL);

/*Table structure for table `checkup` */

DROP TABLE IF EXISTS `checkup`;

CREATE TABLE `checkup` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `registerid` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  KEY `fk_rid` (`registerid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `checkup` */

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(300) NOT NULL,
  PRIMARY KEY (`departmentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `departments` */

insert  into `departments`(`departmentId`,`department`) values (7,'内科'),(8,'外科');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(300) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `registeredId` int(11) NOT NULL,
  `dstate` int(11) DEFAULT NULL,
  `amStartTime` varchar(10) DEFAULT '8:00',
  `amEndTime` varchar(10) DEFAULT '12:00',
  `pmStartTime` varchar(10) DEFAULT '14:00',
  `pmEndTime` varchar(10) DEFAULT '18:00',
  PRIMARY KEY (`doctorId`) USING BTREE,
  KEY `fk_department` (`departmentId`) USING BTREE,
  KEY `fk_registeredtype` (`registeredId`) USING BTREE,
  CONSTRAINT `fk_department` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`),
  CONSTRAINT `fk_registeredtype` FOREIGN KEY (`registeredId`) REFERENCES `registeredtype` (`registeredid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `doctor` */

insert  into `doctor`(`doctorId`,`doctorName`,`departmentId`,`registeredId`,`dstate`,`amStartTime`,`amEndTime`,`pmStartTime`,`pmEndTime`) values (13,'华佗',7,5,0,'8:00','12:00','14:00','18:00'),(14,'扁鹊',7,6,0,'8:00','12:00','14:00','18:00'),(15,'张春明',7,5,1,'8:00','12:00','14:00','18:00'),(16,'王二',8,5,1,'8:00','12:00','14:00','18:00');

/*Table structure for table `drugdictionary` */

DROP TABLE IF EXISTS `drugdictionary`;

CREATE TABLE `drugdictionary` (
  `drugId` int(11) NOT NULL AUTO_INCREMENT,
  `drugName` varchar(50) NOT NULL,
  `unitId` int(11) NOT NULL,
  `sellingPrice` double NOT NULL,
  `areaId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  PRIMARY KEY (`drugId`) USING BTREE,
  KEY `fk_unitid` (`unitId`) USING BTREE,
  KEY `fk_areaId` (`areaId`) USING BTREE,
  KEY `fk_typeId` (`typeId`) USING BTREE,
  CONSTRAINT `fk_areaId` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`),
  CONSTRAINT `fk_typeId` FOREIGN KEY (`typeId`) REFERENCES `type` (`typeid`),
  CONSTRAINT `fk_unitid` FOREIGN KEY (`unitId`) REFERENCES `unit` (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `drugdictionary` */

insert  into `drugdictionary`(`drugId`,`drugName`,`unitId`,`sellingPrice`,`areaId`,`typeId`) values (9,'阿莫西林',7,30,4,5),(10,'板蓝根',9,30,4,5);

/*Table structure for table `drugstore` */

DROP TABLE IF EXISTS `drugstore`;

CREATE TABLE `drugstore` (
  `rugstoreId` int(11) NOT NULL AUTO_INCREMENT,
  `drugstoreName` varchar(100) NOT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `skullId` int(11) DEFAULT NULL,
  `warehouseId` int(11) DEFAULT NULL,
  `unit` int(11) NOT NULL,
  `tradePrice` double NOT NULL,
  `sellingPrice` double NOT NULL,
  `area` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `produceDate` date NOT NULL,
  `validDate` date NOT NULL,
  `drugstorenum` int(11) NOT NULL,
  `batch` varchar(200) NOT NULL,
  PRIMARY KEY (`rugstoreId`) USING BTREE,
  KEY `fk_supplierId` (`supplierId`) USING BTREE,
  KEY `fk_skullId` (`skullId`) USING BTREE,
  KEY `fk_warehouseId` (`warehouseId`) USING BTREE,
  KEY `fk_dgarea` (`area`) USING BTREE,
  KEY `fk_dgunit` (`unit`) USING BTREE,
  KEY `fk_dtype` (`type`) USING BTREE,
  CONSTRAINT `fk_dgarea` FOREIGN KEY (`area`) REFERENCES `area` (`areaId`),
  CONSTRAINT `fk_dgunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`),
  CONSTRAINT `fk_dtype` FOREIGN KEY (`type`) REFERENCES `type` (`typeid`),
  CONSTRAINT `fk_skullId` FOREIGN KEY (`skullId`) REFERENCES `skull` (`skullid`),
  CONSTRAINT `fk_supplierId` FOREIGN KEY (`supplierId`) REFERENCES `upplier` (`supplierid`),
  CONSTRAINT `fk_warehouseId` FOREIGN KEY (`warehouseId`) REFERENCES `warehuose` (`warehouseid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `drugstore` */

insert  into `drugstore`(`rugstoreId`,`drugstoreName`,`supplierId`,`skullId`,`warehouseId`,`unit`,`tradePrice`,`sellingPrice`,`area`,`type`,`produceDate`,`validDate`,`drugstorenum`,`batch`) values (12,'板蓝根',5,4,2,9,10,30,4,5,'2019-10-30','2020-01-04',40,'20191121');

/*Table structure for table `home` */

DROP TABLE IF EXISTS `home`;

CREATE TABLE `home` (
  `homeId` int(11) NOT NULL AUTO_INCREMENT,
  `homeName` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `carId` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`homeId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `home` */

insert  into `home`(`homeId`,`homeName`,`sex`,`age`,`carId`,`phone`) values (73,'敲门','男',19,NULL,NULL),(74,'魏坚','男',19,'412823199912242414','17634525258');

/*Table structure for table `hospitalprice` */

DROP TABLE IF EXISTS `hospitalprice`;

CREATE TABLE `hospitalprice` (
  `hospitalpriceid` int(11) NOT NULL AUTO_INCREMENT,
  `registerId` int(11) NOT NULL,
  `durgname` varchar(500) NOT NULL,
  `durgnum` int(11) NOT NULL,
  `repiceprice` double NOT NULL,
  `repicetotal` double NOT NULL,
  `htime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`hospitalpriceid`) USING BTREE,
  KEY `fk_registerId` (`registerId`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `hospitalprice` */

insert  into `hospitalprice`(`hospitalpriceid`,`registerId`,`durgname`,`durgnum`,`repiceprice`,`repicetotal`,`htime`,`state`) values (104,12,'开颅手术',1,500,500,'2019-11-21 15:12:26',1),(105,12,'阿莫西林',2,30,60,'2019-11-21 15:13:47',2),(106,13,'板蓝根',1,30,30,'2019-11-26 19:11:44',0);

/*Table structure for table `huishou` */

DROP TABLE IF EXISTS `huishou`;

CREATE TABLE `huishou` (
  `huishouid` int(11) NOT NULL AUTO_INCREMENT,
  `huishouname` varchar(50) NOT NULL,
  `huishounumber` int(11) NOT NULL,
  `huishoupihao` varchar(50) DEFAULT NULL,
  `jbr` varchar(10) DEFAULT NULL,
  `beizhu` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`huishouid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `huishou` */

insert  into `huishou`(`huishouid`,`huishouname`,`huishounumber`,`huishoupihao`,`jbr`,`beizhu`) values (5,'阿莫西林',17,'20191121','门诊','有问题，请更换 20盒');

/*Table structure for table `inhospitaltype` */

DROP TABLE IF EXISTS `inhospitaltype`;

CREATE TABLE `inhospitaltype` (
  `inhospitalId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) NOT NULL,
  `unit` int(11) NOT NULL,
  `price` double NOT NULL,
  `bigprojectId` int(11) NOT NULL,
  PRIMARY KEY (`inhospitalId`) USING BTREE,
  KEY `fk_inhospitaltype` (`bigprojectId`) USING BTREE,
  KEY `fk_inhunit` (`unit`) USING BTREE,
  CONSTRAINT `fk_inhospitaltype` FOREIGN KEY (`bigprojectId`) REFERENCES `projecttype` (`projectid`),
  CONSTRAINT `fk_inhunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `inhospitaltype` */

/*Table structure for table `inoutpatienttype` */

DROP TABLE IF EXISTS `inoutpatienttype`;

CREATE TABLE `inoutpatienttype` (
  `inoutpatientId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) NOT NULL,
  `unit` int(11) NOT NULL,
  `bigproJectId` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`inoutpatientId`) USING BTREE,
  KEY `fk_inoutpatienttype` (`bigproJectId`) USING BTREE,
  KEY `fk_intunit` (`unit`) USING BTREE,
  CONSTRAINT `fk_inoutpatienttype` FOREIGN KEY (`bigproJectId`) REFERENCES `projecttype` (`projectid`),
  CONSTRAINT `fk_intunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `inoutpatienttype` */

insert  into `inoutpatienttype`(`inoutpatientId`,`projectName`,`unit`,`bigproJectId`,`price`) values (5,'开颅手术',8,1,500);

/*Table structure for table `jilu` */

DROP TABLE IF EXISTS `jilu`;

CREATE TABLE `jilu` (
  `jiluid` int(11) NOT NULL AUTO_INCREMENT,
  `jiluname` varchar(50) NOT NULL,
  `jilutime` datetime NOT NULL,
  `jilutype` varchar(50) NOT NULL,
  `jilupeople` varchar(20) NOT NULL,
  `jilunumber` int(11) DEFAULT NULL,
  `jilupihao` varchar(50) NOT NULL,
  PRIMARY KEY (`jiluid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `jilu` */

insert  into `jilu`(`jiluid`,`jiluname`,`jilutime`,`jilutype`,`jilupeople`,`jilunumber`,`jilupihao`) values (187,'板蓝根','2019-11-21 14:58:00','常规入库','门诊',100,'20191121'),(188,'阿莫西林','2019-11-21 14:58:46','常规入库','门诊',30,'20191121'),(189,'阿莫西林','2019-11-21 14:59:42','正常出库','门诊',20,'20191121'),(190,'板蓝根','2019-11-21 14:59:49','正常出库','门诊',50,'20191121'),(191,'板蓝根','2019-11-21 15:17:48','紧急补给药房','门诊',10,'20191121'),(192,'阿莫西林','2019-11-21 15:24:55','正常出库','门诊',10,'20191121');

/*Table structure for table `moneytype` */

DROP TABLE IF EXISTS `moneytype`;

CREATE TABLE `moneytype` (
  `MoneyId` int(11) NOT NULL AUTO_INCREMENT,
  `Moneytype` varchar(300) NOT NULL,
  `Percent` varchar(30) NOT NULL,
  PRIMARY KEY (`MoneyId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `moneytype` */

insert  into `moneytype`(`MoneyId`,`Moneytype`,`Percent`) values (10,'无','0%'),(11,'城镇社保','30%'),(12,'农村医疗合作社','35%');

/*Table structure for table `outpatienttype` */

DROP TABLE IF EXISTS `outpatienttype`;

CREATE TABLE `outpatienttype` (
  `outpatientId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) NOT NULL,
  `unit` int(11) NOT NULL,
  `bigprojectId` int(11) NOT NULL,
  `price` double NOT NULL,
  `ostate` int(10) DEFAULT NULL,
  PRIMARY KEY (`outpatientId`) USING BTREE,
  KEY `fk_outpatienttype` (`bigprojectId`) USING BTREE,
  KEY `fk_outunit` (`unit`) USING BTREE,
  CONSTRAINT `fk_outpatienttype` FOREIGN KEY (`bigprojectId`) REFERENCES `projecttype` (`projectid`),
  CONSTRAINT `fk_outunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `outpatienttype` */

insert  into `outpatienttype`(`outpatientId`,`projectName`,`unit`,`bigprojectId`,`price`,`ostate`) values (7,'ct',8,2,100,1),(8,'打针',8,2,20,0);

/*Table structure for table `paiban` */

DROP TABLE IF EXISTS `paiban`;

CREATE TABLE `paiban` (
  `paiId` int(11) NOT NULL AUTO_INCREMENT,
  `one` varchar(50) DEFAULT '无班',
  `two` varchar(50) DEFAULT '无班',
  `three` varchar(50) DEFAULT '无班',
  `four` varchar(50) DEFAULT '无班',
  `five` varchar(50) DEFAULT '无班',
  `six` varchar(50) DEFAULT '无班',
  `seven` varchar(50) DEFAULT '无班',
  `doctorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`paiId`) USING BTREE,
  KEY `fk_paiId` (`doctorId`) USING BTREE,
  CONSTRAINT `fk_paiId` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `paiban` */

insert  into `paiban`(`paiId`,`one`,`two`,`three`,`four`,`five`,`six`,`seven`,`doctorId`) values (12,'有班','有班','有班','有班','有班','有班','有班',16),(13,'有班','有班','有班','有班','有班','有班','有班',15),(14,'有班','有班','有班','有班','有班','有班','有班',14),(15,'有班','有班','有班','无班','有班','有班','有班',13);

/*Table structure for table `pay` */

DROP TABLE IF EXISTS `pay`;

CREATE TABLE `pay` (
  `payid` int(11) NOT NULL AUTO_INCREMENT,
  `registerid` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `pay` */

insert  into `pay`(`payid`,`registerid`,`money`,`payDate`) values (9,12,10,'2019-11-21 15:13:09'),(10,13,10,'2019-11-26 09:44:56');

/*Table structure for table `pharmacy` */

DROP TABLE IF EXISTS `pharmacy`;

CREATE TABLE `pharmacy` (
  `pharmacyId` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacyName` varchar(50) NOT NULL,
  `drugstoreId` int(11) DEFAULT NULL,
  `skullId` int(11) DEFAULT NULL,
  `warehouseId` int(11) DEFAULT NULL,
  `unit` int(11) NOT NULL,
  `sellingPrice` double NOT NULL,
  `area` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `produceDate` date NOT NULL,
  `validDate` date NOT NULL,
  `drugstorenum` int(11) NOT NULL,
  `skullbatch` varchar(200) NOT NULL,
  PRIMARY KEY (`pharmacyId`) USING BTREE,
  KEY `fk_drugstoreIdp` (`drugstoreId`) USING BTREE,
  KEY `fk_skullIdp` (`skullId`) USING BTREE,
  KEY `fk_warehouseIdp` (`warehouseId`) USING BTREE,
  KEY `fk_dgareap` (`area`) USING BTREE,
  KEY `fk_unitp` (`unit`) USING BTREE,
  KEY `fk_typep` (`type`) USING BTREE,
  CONSTRAINT `fk_dgareap` FOREIGN KEY (`area`) REFERENCES `area` (`areaId`),
  CONSTRAINT `fk_drugstoreIdp` FOREIGN KEY (`drugstoreId`) REFERENCES `drugstore` (`rugstoreId`),
  CONSTRAINT `fk_skullIdp` FOREIGN KEY (`skullId`) REFERENCES `skull` (`skullid`),
  CONSTRAINT `fk_typep` FOREIGN KEY (`type`) REFERENCES `type` (`typeid`),
  CONSTRAINT `fk_unitp` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`),
  CONSTRAINT `fk_warehouseIdp` FOREIGN KEY (`warehouseId`) REFERENCES `warehuose` (`warehouseid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `pharmacy` */

insert  into `pharmacy`(`pharmacyId`,`pharmacyName`,`drugstoreId`,`skullId`,`warehouseId`,`unit`,`sellingPrice`,`area`,`type`,`produceDate`,`validDate`,`drugstorenum`,`skullbatch`) values (11,'板蓝根',NULL,4,2,9,30,4,5,'2019-10-30','2020-01-04',56,'20191121'),(12,'阿莫西林',NULL,4,2,7,30,4,5,'2019-10-25','2020-02-01',8,'20191121');

/*Table structure for table `projecttype` */

DROP TABLE IF EXISTS `projecttype`;

CREATE TABLE `projecttype` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) NOT NULL,
  PRIMARY KEY (`projectId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `projecttype` */

insert  into `projecttype`(`projectId`,`projectName`) values (1,'住院医疗综合服务类'),(2,'门诊医疗综合服务类');

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `registerid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `department` int(11) NOT NULL,
  `doctor` int(11) NOT NULL,
  `diagnose` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Idcard` varchar(60) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `bedNum` int(11) DEFAULT NULL,
  `Operator` varchar(200) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `price` double unsigned DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `zhuan` datetime DEFAULT NULL,
  PRIMARY KEY (`registerid`) USING BTREE,
  KEY `fk_regdepartment` (`department`) USING BTREE,
  KEY `fk_regdoctor` (`doctor`) USING BTREE,
  CONSTRAINT `fk_regdepartment` FOREIGN KEY (`department`) REFERENCES `departments` (`departmentId`),
  CONSTRAINT `fk_regdoctor` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`doctorId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `register` */

insert  into `register`(`registerid`,`userName`,`age`,`sex`,`department`,`doctor`,`diagnose`,`address`,`Phone`,`Idcard`,`registerDate`,`bedNum`,`Operator`,`money`,`state`,`endDate`,`price`,`discount`,`zhuan`) values (12,'李福州',20,'男',7,15,'脑部肿瘤','河南','15565792390','412827199605062586','2019-11-21 15:11:17',9,'门诊',10010,1,'2019-11-21 15:14:05',392,'30%',NULL),(13,'song',12,'男',7,15,'良好','河南','13271678052','412702199902080557','2019-11-26 09:39:50',9,'超级管理员',1010,0,NULL,NULL,'35%',NULL);

/*Table structure for table `registeredtype` */

DROP TABLE IF EXISTS `registeredtype`;

CREATE TABLE `registeredtype` (
  `registeredId` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(300) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`registeredId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `registeredtype` */

insert  into `registeredtype`(`registeredId`,`type`,`price`) values (5,'普通挂号',20),(6,'专家号',30);

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `reportId` int(11) NOT NULL AUTO_INCREMENT,
  `reportName` varchar(100) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `doctor` int(11) DEFAULT NULL,
  `reportType` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `users` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `carid` varchar(100) NOT NULL,
  `zhuan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`reportId`) USING BTREE,
  KEY `fk_departmentr` (`department`) USING BTREE,
  KEY `fk_doctor` (`doctor`) USING BTREE,
  KEY `fk_reportType` (`reportType`) USING BTREE,
  CONSTRAINT `fk_departmentr` FOREIGN KEY (`department`) REFERENCES `departments` (`departmentId`),
  CONSTRAINT `fk_doctor` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`doctorId`),
  CONSTRAINT `fk_reportType` FOREIGN KEY (`reportType`) REFERENCES `registeredtype` (`registeredId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `report` */

insert  into `report`(`reportId`,`reportName`,`sex`,`age`,`department`,`doctor`,`reportType`,`price`,`time`,`users`,`state`,`phone`,`carid`,`zhuan`) values (28,'送高帅','男',20,7,14,6,30,'2019-11-21 14:00:00',NULL,3,'13183380740','412827199807156595','头痛，发烧'),(29,'李福州','男',20,7,14,6,30,'2019-11-21 15:04:50','门诊',5,'15565792390','412827199605062586','脑部肿瘤'),(30,'杨帅','男',20,7,14,6,30,'2019-11-21 14:00:00',NULL,3,'13183380740','412369199512023695','头痛'),(31,'song','男',12,7,13,5,20,'2019-11-26 09:16:47','超级管理员',5,'13271678052','412702199902080557','良好'),(32,'最代码','男',10,7,14,6,30,'2020-06-27 19:53:37','最代码管理员',0,'13520109202','232323188201202718',NULL),(33,'测试','男',12,7,13,5,20,'2020-12-15 14:13:31','最代码管理员',4,'13333333333','431128198808136890','顶顶顶顶'),(34,'hyx','男',20,7,13,5,20,'2021-09-13 17:37:03','超级管理员',4,'17773348481','420621200004163958','发烧'),(35,'hyx','男',20,7,13,5,20,'2021-09-14 14:49:14','超级管理员',1,'17773348481','420621200004163958','感冒'),(36,'fvcxv','男',23,7,14,6,30,'2021-09-14 14:49:55','超级管理员',2,'18327255780','123123341314123412','发烧了'),(39,'aaa','男',20,7,13,6,30,'2021-09-22 17:32:18','超级管理员',1,'1232132134','42062120000400858',NULL),(42,'呵呵呵好人','女',14,7,13,5,20,'2021-09-22 18:32:48','超级管理员',1,'17773348484','420621200004195858',NULL),(43,'呵呵呵好人fsdf','男',15,7,13,5,20,'2021-09-22 18:36:17','超级管理员',1,'17773348480','420621200004191314',NULL);

/*Table structure for table `skull` */

DROP TABLE IF EXISTS `skull`;

CREATE TABLE `skull` (
  `skullId` int(11) NOT NULL AUTO_INCREMENT,
  `skullName` varchar(300) NOT NULL,
  PRIMARY KEY (`skullId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `skull` */

insert  into `skull`(`skullId`,`skullName`) values (4,'张山');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `spread` int(255) DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `available` int(255) DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`pid`,`title`,`href`,`spread`,`target`,`icon`,`available`) values (1,0,'医院管理系统','',1,NULL,'&#xe68e;',1),(2,1,'门诊管理','',0,NULL,'&#xe653;',1),(3,1,'住院管理','',0,NULL,'&#xe663;',1),(4,1,'系统管理','',0,'','&#xe716;',1),(5,1,'统计管理','',0,NULL,'&#xe629;',1),(6,2,'用户挂号','cao/report.html',0,NULL,'&#xe770;',1),(7,2,'处方划价','cao/Ccfhj.html',0,NULL,'&#xe657;',1),(8,3,'入院登记','views/hospitalized-controls/ruyuandengji.html',0,NULL,'&#xe65b;',1),(9,3,'缴费管理','views/hospitalized-controls/jiaofeiguanli.html',0,NULL,'&#xe6b2;',1),(11,3,'药品记账','views/hospitalized-controls/yaopinjizhang.html',0,NULL,'&#xe705;',1),(12,4,'菜单管理','views/system-management/caidanguanli.html',0,NULL,'&#xe60f;',1),(13,4,'角色管理','views/system-management/jueseguanli.html',0,'','&#xe66f;',1),(14,4,'用户管理','views/system-management/tubiaoguanli.html',0,NULL,'&#xe770;',1),(15,4,'图标管理','views/system-management/tubiaoguanli.html',0,NULL,'&#xe655;',1),(17,4,'数据源监控','views/system-management/shujuyuanjiankong.html',0,NULL,'&#xe857;',1),(18,5,'门诊月度统计','views/statistical-management/menzhenyuedu.html',0,NULL,'&#xe63c;',1),(19,5,'住院月度统计','views/statistical-management/zhuyuanyuedu.html',0,NULL,'&#xe62c;',1),(20,5,'门诊年度统计','views/statistical-management/menzhenniandu.html',0,NULL,'&#xe62d;',1),(27,2,'项目划价','cao/Cxmhj.html',0,NULL,'&#xe60a;',1),(28,2,'项目缴费','cao/Cxmjf.html',0,NULL,'&#xe65e;',1),(30,1,'数据中心','',0,NULL,'&#xe60a;',1),(31,30,'科室中心','views/center-records/keshizhongxin.html',0,NULL,'&#xe68e;',1),(32,30,'医生列表','views/center-records/doctorlist.html',0,NULL,'&#xe66f;',1),(33,30,'药品产地','views/center-records/yaopincandi.html',0,NULL,'&#xe630;',1),(36,30,'项目大类','views/center-records/xiangmudalei.html',0,NULL,'&#xe620;',1),(37,30,'挂号类型','views/center-records/guahaoleixing.html',0,NULL,'&#xe672;',1),(40,30,'仓库','views/center-records/cangku.html',0,NULL,'&#xe60a;',1),(41,30,'经办人','views/center-records/jibanren.html',0,NULL,'&#xe612;',1),(42,30,'计量单位','views/center-records/jiliangdanwei.html',0,NULL,'&#xe62a;',1),(43,30,'供货商','views/center-records/gonghuosang.html',0,NULL,'&#xe613;',1),(44,30,'药品分类','views/center-records/yaopinfenlei.html',0,NULL,'&#xe656;',1),(46,1,'排班管理','1',0,NULL,'&#xe770;',1),(47,46,'医生排班','views/center/paiban.html',0,NULL,'&#xe770;',1),(48,30,'药品字典','views/center-records/yaopinzidian.html',0,NULL,'&#xe64d;',1),(49,3,'项目记账','views/hospitalized-controls/xiangmujizhang.html',0,NULL,'&#xe705;',1),(52,5,'住院年度统计','views/statistical-management/zhuyuanniandu.html',0,NULL,'&#xe630;',1),(53,2,'项目检查','cao/jiancha.html',0,NULL,'&#xe674;',1),(54,1,'仓库管理','',0,NULL,'&#xe61c;',1),(55,54,'入库单','views/store-controls/rukudan.html',0,NULL,'&#xe657;',1),(56,5,'医生统计对比','views/statistical-management/yishengtongjiduibi.html',0,NULL,'&#xe770;',1),(57,54,'库存查询','views/store-controls/kucunchaxun.html',0,NULL,'&#xe62a;',1),(58,54,'出库单','views/store-controls/outkudan.html',0,NULL,'&#xe621;',1),(59,54,'库存不足','views/store-controls/kucunbuzu.html',0,NULL,'&#xe6b2;',1),(60,54,'过期提醒','views/store-controls/guoqitixing.html',0,NULL,'&#xe702;',1),(61,1,'药房管理','',0,NULL,'&#xe705;',1),(62,61,'药房详情','views/pharmacy-management/yaofangxiangqing.html',0,NULL,'&#xe632;',1),(64,2,'药品缴费','cao/Cywjf.html',0,NULL,'&#xe65e;',1),(65,5,'门诊当天统计','views/statistical-management/menzhendangtiantongji.html',0,NULL,'&#xe60e;',1),(69,2,'门诊患者库','cao/mzhzk.html',0,NULL,'&#xe66f;',1),(70,54,'操作记录','views/store-controls/caozuojilu.html',0,NULL,'&#xe6b2;',1),(71,54,'药品回收','views/store-controls/yaopinhuishou.html',0,NULL,'&#xe669;',1),(72,61,'门诊取药','views/pharmacy-management/menzhenquyao.html',0,NULL,'&#xe857;',1),(73,61,'住院取药','views/pharmacy-management/zhuyuanquyao.html',0,NULL,'&#xe63c;',1),(86,3,'出院结算','views/hospitalized-controls/chuyuanjiesuan.html',0,NULL,'&#xe65a;',1),(90,2,'test','',0,NULL,'&#xe678;',1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `roledesc` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `sys_role` */

insert  into `sys_role`(`roleid`,`rolename`,`roledesc`,`available`) values (1,'超级管理员','拥有所有菜单权限',1),(4,'门诊管理','拥有门诊管理的权限',1);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`rid`,`mid`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,17),(1,18),(1,19),(1,20),(1,27),(1,28),(1,30),(1,31),(1,32),(1,33),(1,36),(1,37),(1,40),(1,41),(1,42),(1,43),(1,44),(1,46),(1,47),(1,48),(1,49),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,64),(1,65),(1,69),(1,70),(1,71),(1,72),(1,73),(1,86),(1,88),(4,1),(4,2),(4,6),(4,7),(4,27),(4,28),(4,53),(4,64),(4,69),(4,90);

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`uid`,`rid`) values (1,1),(9,1),(10,1),(11,1),(12,1),(13,1),(28,4);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` int(255) DEFAULT NULL COMMENT '0女1男',
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `type` int(255) DEFAULT '2' COMMENT '1，超级管理员,2，系统用户',
  `available` int(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `sys_user` */

insert  into `sys_user`(`userid`,`loginname`,`identity`,`realname`,`sex`,`address`,`phone`,`pwd`,`position`,`type`,`available`,`salt`) values (1,'admin','412365199601236544','超级管理员',1,'武汉','13183380740','123456','CEO',1,1,'d21fd4'),(28,'mz','412827199807156565','门诊',1,'河南','13183365365','123456','门诊管理员',2,1,'b16016'),(29,'hyx','1234','护士',1,'武汉','17773348481','123','ceo',2,1,'b16016');

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `type` */

insert  into `type`(`typeId`,`typeName`) values (5,'西药'),(6,'中药');

/*Table structure for table `unit` */

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `unitId` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(50) NOT NULL,
  PRIMARY KEY (`unitId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `unit` */

insert  into `unit`(`unitId`,`unitName`) values (7,'盒'),(8,'次'),(9,'袋');

/*Table structure for table `upplier` */

DROP TABLE IF EXISTS `upplier`;

CREATE TABLE `upplier` (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(300) NOT NULL,
  `supplierPhone` varchar(100) DEFAULT NULL,
  `supplierAddress` varchar(300) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`supplierId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `upplier` */

insert  into `upplier`(`supplierId`,`supplierName`,`supplierPhone`,`supplierAddress`,`state`) values (5,'春天大药房 ',NULL,NULL,0);

/*Table structure for table `warehuose` */

DROP TABLE IF EXISTS `warehuose`;

CREATE TABLE `warehuose` (
  `warehouseId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(300) NOT NULL,
  PRIMARY KEY (`warehouseId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `warehuose` */

insert  into `warehuose`(`warehouseId`,`supplierName`) values (2,'仓库');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
