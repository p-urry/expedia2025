/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - expedia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expedia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `expedia`;

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `airlineid` int(11) NOT NULL AUTO_INCREMENT,
  `airlinename` varchar(100) NOT NULL,
  `airlinelogo` varchar(100) NOT NULL,
  `countryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`airlineid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airline` */

insert  into `airline`(`airlineid`,`airlinename`,`airlinelogo`,`countryid`) values 
(1,'Kenya Airways','kq.jpeg',NULL),
(2,'Jambo Jet','jj.jpeg',3);

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `airportid` int(12) NOT NULL AUTO_INCREMENT,
  `airportname` varchar(100) NOT NULL,
  `airportcode` varchar(100) NOT NULL,
  `cityid` int(100) NOT NULL,
  PRIMARY KEY (`airportid`),
  KEY `foreign` (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airport` */

insert  into `airport`(`airportid`,`airportname`,`airportcode`,`cityid`) values 
(1,'JKIA','',0),
(2,'','KAA111',0),
(3,'','',10),
(4,'JFK','',0),
(5,'','KAA112',0),
(6,'','',11),
(7,'JFj','',0),
(8,'','KAc112',0),
(9,'','',13),
(10,'wilson','wil',4);

/*Table structure for table `bookingclass` */

DROP TABLE IF EXISTS `bookingclass`;

CREATE TABLE `bookingclass` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(100) NOT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingclass` */

/*Table structure for table `bookingtype` */

DROP TABLE IF EXISTS `bookingtype`;

CREATE TABLE `bookingtype` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(10) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingtype` */

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `cityid` int(100) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(18) NOT NULL,
  `countryid` int(100) NOT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cities` */

insert  into `cities`(`cityid`,`cityname`,`countryid`) values 
(1,'Kisumu',0);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(100) NOT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

insert  into `country`(`countryid`,`countryname`) values 
(1,'Ethiopia'),
(2,'Angola'),
(3,'Kenya'),
(4,'hawaii');

/*Table structure for table `flightbooking` */

DROP TABLE IF EXISTS `flightbooking`;

CREATE TABLE `flightbooking` (
  `flightid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) NOT NULL,
  `bookingdate` datetime NOT NULL,
  `paymentmethod` varchar(100) NOT NULL,
  `bookingtypeid` int(11) NOT NULL,
  PRIMARY KEY (`flightid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbooking` */

/*Table structure for table `flightbookingclasses` */

DROP TABLE IF EXISTS `flightbookingclasses`;

CREATE TABLE `flightbookingclasses` (
  `bookingclassid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) NOT NULL,
  `noofseats` int(11) NOT NULL,
  `unitprice` double NOT NULL,
  `currencyid` int(11) NOT NULL,
  PRIMARY KEY (`bookingclassid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingclasses` */

/*Table structure for table `flightbookingpassangers` */

DROP TABLE IF EXISTS `flightbookingpassangers`;

CREATE TABLE `flightbookingpassangers` (
  `passengerbookingid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingclassid` int(11) NOT NULL,
  `documentid` int(11) NOT NULL,
  `iddocumentno` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `DOB` datetime NOT NULL,
  PRIMARY KEY (`passengerbookingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingpassangers` */

/*Table structure for table `flightclasses` */

DROP TABLE IF EXISTS `flightclasses`;

CREATE TABLE `flightclasses` (
  `flightclassid` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` int(11) NOT NULL,
  `bookingclassid` int(11) NOT NULL,
  `noofseats` int(11) NOT NULL,
  `unitprice` double DEFAULT NULL,
  `currencyid` int(11) NOT NULL,
  PRIMARY KEY (`flightclassid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightclasses` */

/*Table structure for table `flights` */

DROP TABLE IF EXISTS `flights`;

CREATE TABLE `flights` (
  `flightid` int(11) NOT NULL AUTO_INCREMENT,
  `airlineid` int(11) NOT NULL,
  `flightnumber` varchar(100) NOT NULL,
  `departurecity` varchar(100) NOT NULL,
  `destinationcity` varchar(100) NOT NULL,
  `departuretime` time NOT NULL,
  `duration` time NOT NULL,
  `departureairportid` int(100) NOT NULL,
  PRIMARY KEY (`flightid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flights` */

/*Table structure for table `paymentmethods` */

DROP TABLE IF EXISTS `paymentmethods`;

CREATE TABLE `paymentmethods` (
  `methodid` int(10) NOT NULL AUTO_INCREMENT,
  `methodname` varchar(100) NOT NULL,
  PRIMARY KEY (`methodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paymentmethods` */

/*Table structure for table `traveldocuments` */

DROP TABLE IF EXISTS `traveldocuments`;

CREATE TABLE `traveldocuments` (
  `documentid` int(10) NOT NULL AUTO_INCREMENT,
  `documentname` varchar(100) NOT NULL,
  `documentexpires` tinyint(1) NOT NULL,
  PRIMARY KEY (`documentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `traveldocuments` */

/* Procedure structure for procedure `sp_checkairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairline`($airlineid INT,$airlinename VARCHAR(100))
BEGIN
		SELECT * FROM `airline`
		WHERE `airlineid` !=$airlineid AND `airlinename`=$airlinename;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkairports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairports`($airportid INT,$airportname VARCHAR(100))
BEGIN
		SELECT * FROM `airport`
		WHERE `airportid` !=$airportid AND `airportname`=$airportname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingclasses`($classid INT,$classname VARCHAR(100))
BEGIN
		SELECT * FROM `bookingclass`
		WHERE `classid` !=$classid AND `classname`=$classname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingtype`($typeid INT,$typename VARCHAR(100))
BEGIN
		SELECT * FROM `bookingtype`
		WHERE `typeid` !=$typeid AND `typename`=$typename;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcities`($cityid INT,$cityname VARCHAR(100))
BEGIN
		SELECT * FROM `cities`
		WHERE `cityid` !=$cityid AND `cityname`=$cityname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcountry`($countryid int,$countryname varchar(100))
BEGIN
		select * from `country`
		where `countryid` !=$countryid and `countryname`=$countryname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflightbooking`($flightid INT,$bookingid int)
BEGIN
		SELECT * FROM `flightbooking`
		WHERE `flightid` !=$flightid AND `bookingid`=$bookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflightbookingclasses`($bookingclassid INT,$bookingid int)
BEGIN
		SELECT * FROM `flightbookingclasses`
		WHERE `bookingclassid` !=$bookingclassid AND `bookingid`=$bookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflightbookingpassangers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflightbookingpassangers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflightbookingpassangers`($passengerbookingid INT,$documentid int)
BEGIN
		SELECT * FROM `flightbookingpassangers`
		WHERE `passengerbookingid` !=$passengerbookingid AND`documentid`=$documentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflightclasses`($flightclassid INT,$flightid int)
BEGIN
		SELECT * FROM `flightclasses`
		WHERE `flightclassid` !=$flightclassid AND `flightid`=$flightid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflights`($flightid INT,$flightnumber VARCHAR(100))
BEGIN
		SELECT * FROM `flights`
		WHERE `flightid` !=$flightid AND `flightnumber`=$flightnumber;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkpaymentmethods` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkpaymentmethods` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkpaymentmethods`($methodid INT,$methodname VARCHAR(100))
BEGIN
		SELECT * FROM `paymentmethods`
		WHERE `methodid` !=$methodid AND `methodname`=$methodname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checktraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checktraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checktraveldocuments`($documentid INT,$documentname VARCHAR(100))
BEGIN
		SELECT * FROM `traveldocuments`
		WHERE `documentid` !=$documentid AND `documentname`=$documentname
		;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairline`($airlineid INT)
BEGIN
		DELETE FROM `airline`
		WHERE `airlineid`=$airlineid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairport`($airportid INT)
BEGIN
		DELETE FROM `airport`
		WHERE `airportid`=$airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingclass`($classid INT)
BEGIN
		DELETE FROM `bookingclass`
		WHERE `classid`=$classid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingtype`($typeid INT)
BEGIN
		DELETE FROM `bookingtype`
		WHERE `typeid`=$typeid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecities`($cityid INT)
BEGIN
		DELETE FROM `cities`
		WHERE `cityid`=$cityid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecountry`($countryid int)
BEGIN
		delete from `country`
		where `countryid`=$countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbooking`($flightid INT)
BEGIN
		DELETE FROM `flightbooking`
		WHERE `flightid`=$flightid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookingclasses`($bookingclassid INT)
BEGIN
		DELETE FROM `flightbookingclasses`
		WHERE `bookingclassid`=$bookingclassid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookingpassangers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookingpassangers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookingpassangers`($passengerbookingid INT)
BEGIN
		DELETE FROM `flightbookingpassangers`
		WHERE `passengerbookingid`=$passengerbookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightclasses`($flightclassid INT)
BEGIN
		DELETE FROM `flightclasses`
		WHERE `flightclassid`=$flightclassid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflights`($flightid INT)
BEGIN
		DELETE FROM `flights`
		WHERE `flightid`=$flightid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepaymentmethods` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepaymentmethods` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepaymentmethods`($methodid INT)
BEGIN
		DELETE FROM `paymentmethods`
		WHERE `methodid`=$methodid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletetraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletetraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletetraveldocuments`($countryid INT)
BEGIN
		DELETE FROM `traveldocuments`
		WHERE `documentid`=$documentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairlines`($airlinename varchar(100),$countryname varchar(100))
BEGIN
		
	IF $countryname='' THEN
			SET $countryname='@@@@';
		END IF;
		
		IF $airlinename='' THEN
			SET $airlinename='@@@@';
		END IF;
			
		SELECT a.*,countryname
		FROM`airline` a
		JOIN `country` c ON c.countryid=a.countryid
		WHERE airlinename LIKE CONCAT ('%',$airlinename,'%')
		OR countryname LIKE CONCAT ('%',$countryname,'%')
		ORDER BY airlinename;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairports`($cityname varchar (100), $airportname varchar(100))
BEGIN
		
		if $cityname='' then
			set $cityname='@@@@';
		end if;
		
		if $airportname='' THEN
			SET $airportname='@@@@';
		END IF;
			
		select a.*,cityname
		from`airport` a
		join `cities` c on c.cityid=a.cityid
		where c.cityname like concat ('%',$cityname,'%')
		or a.airportname like concat ('%',$airportname,'%')
		order by cityname,airportname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercities`($countryid int)
BEGIN
		if $countryid=0 then
			select c.*,countryname
			from `cities` c
			join `country` o on o.countryid=c.countryid
			order by countryname,cityname;
		else
			SELECT c.*,countryname
			FROM `cities` c
			JOIN `country` o ON o.countryid=c.countryid
			where c.countryid=$countryid
			ORDER BY countryname,cityname;
		end if;
		
		

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairline`()
BEGIN
		SELECT * FROM `airline`
		ORDER BY `airlinename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairlinedetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairlinedetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairlinedetails`($airlineid INT)
BEGIN
		SELECT * FROM `airline`
		WHERE `airlineid`=$airlineid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairport`($airportid int)
begin
		SELECT a.*,cityname, n.countryname
		FROM`airport` a
		JOIN `cities` c ON c.cityid=a.cityid
		join `country` n on n.coutryid=c.countryid
		where a.airportid=$airportid;
	end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairportdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairportdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairportdetails`($airportid INT)
BEGIN
		SELECT * FROM `airport`
		WHERE `airportid`=$airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclass`()
BEGIN
		SELECT * FROM `bookingclass`
		ORDER BY `classname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingclassdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclassdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclassdetails`($classtid INT)
BEGIN
		SELECT * FROM `bookingclass`
		WHERE `classid`=$classid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtype`()
BEGIN
		SELECT * FROM `bookingtype`
		ORDER BY `typename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtypedetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtypedetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtypedetails`($typeid INT)
BEGIN
		SELECT * FROM `bookingtype`
		WHERE `typeid`=$typeid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcities`()
BEGIN
		SELECT * FROM `cities`
		ORDER BY `cityname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcitydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcitydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcitydetails`($cityid INT)
BEGIN
		SELECT * FROM `cities`
		WHERE `cityid`=$cityid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountry`()
BEGIN
		SELECT * FROM `country`
		ORDER BY `countryname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountrydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountrydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountrydetails`($countryid int)
BEGIN
		SELECT * FROM `country`
		where `countryid`=$countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbooking`()
BEGIN
		SELECT * FROM `flightbooking`
		ORDER BY `bookingid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingclasses`()
BEGIN
		SELECT * FROM `flightbookingclasses`
		ORDER BY `bookingclassid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingpassengers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingpassengers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingpassengers`()
BEGIN
		SELECT * FROM `flightbookingpassangers`
		ORDER BY `documentid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclasses`()
BEGIN
		SELECT * FROM `flightclasses`
		ORDER BY `bookingclassid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclassesdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclassesdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclassesdetails`($flightclassid INT)
BEGIN
		SELECT * FROM `flightclasses`
		WHERE `flightclassid`=$flightclassid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightdetails`($flightid INT)
BEGIN
		SELECT * FROM `flights`
		WHERE `flightid`=$flightid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflights`()
BEGIN
		SELECT * FROM `flights`
		ORDER BY `flightnumber`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentmethods` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentmethods` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentmethods`($methodid INT)
BEGIN
		SELECT * FROM `paymentmethods`
		WHERE `methodid`=$methodid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_gettraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_gettraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gettraveldocuments`()
BEGIN
		SELECT * FROM `traveldocuments`
		ORDER BY `documentid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_gettraveldocumentsdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_gettraveldocumentsdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gettraveldocumentsdetails`($document INT)
BEGIN
		SELECT * FROM `traveldocuments`
		WHERE `documentid`=$documentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairline`($airlineid INT, $airlinename VARCHAR(100),$airlinelogo varchar(100),$countryid int)
BEGIN
		IF $airlineid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `airline` WHERE `airlinename`=$airlinename) THEN 
				INSERT INTO `airline`(`airlinename`,`airlinelogo`,`countryid`)
				VALUES ($airlinename,$airlinelogo,$countryid);
			END IF;
		ELSE
			UPDATE `airline`
			SET `airlinename`=$airlinename,`airlinelogo`=$airlinelogo,`countryid`=$countryid
			WHERE `airlineid`=$airlineid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairport`($airportid INT, $airportname VARCHAR(100),$airportcode varchar(100),$cityid int)
BEGIN
-- check if we are adding new one
    IF $airportid = 0 THEN
     -- check airport code or name
        IF NOT EXISTS (
            SELECT * FROM `airport` WHERE `AirportCode` = $airportcode OR `Airportname` = $airportname
        ) THEN
            INSERT INTO `airport` (`Airportname`, `Airportcode`, `Cityid`)
            VALUES ($airportname, $airportcode, $cityid);
        END IF;
    ELSE
       IF NOT EXISTS (SELECT * FROM `airport` WHERE `Airportid`=$airportid AND (`AirportCode` = $airportcode OR `Airportname` = $airportname)) THEN
       
  UPDATE `airport`
  SET `Airportname` = $airportname, `Airportcode` = $airportcode, `Cityid` = $cityid
  WHERE `Airportid` = $airportid;
 END IF; 
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingclass`($classid INT, $classname VARCHAR(100))
BEGIN
		IF $classid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `bookingclass` WHERE `classname`=$classname) THEN 
				INSERT INTO `bookingclass`(`classname`)
				VALUES ($classname);
			END IF;
		ELSE
			UPDATE `bookingclass`
			SET `classname`=$classname
			WHERE `classid`=$classid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingtype`($typeid INT, $typename VARCHAR(10))
BEGIN
		IF $typeid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `bookingtype` WHERE `typename`=$typename) THEN 
				INSERT INTO `bookingtype`(`typename`)
				VALUES ($typename);
			END IF;
		ELSE
			UPDATE `bookingtype`
			SET `typename`=$typename
			WHERE `typeid`=$typeid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecities`($cityid INT, $cityname VARCHAR(18),$countryid INT)
BEGIN
		IF $cityid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `cities` WHERE `cityname`=$cityname) THEN 
				INSERT INTO `cities`(`cityname`,`countryid`)
				VALUES ($cityname,$countryid);
				
			END IF;
		ELSE
			UPDATE `cities`
			SET `cityname`=$cityname, `countryid`=$countryid
			WHERE `cityid`=$cityid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`($countryid INT, $countryname VARCHAR(100))
BEGIN
		IF $countryid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `country` WHERE `countryname`=$countryname) THEN 
				INSERT INTO `country`(`countryname`)
				VALUES ($countryname);
			END IF;
		ELSE
			UPDATE `country`
			SET `countryname`=$countryname
			WHERE`countryid`=$countryid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveFlightBooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveFlightBooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveFlightBooking`(
    IN $BookingID INT,
    IN $BookingDate DATE,
    IN $FlightID INT,
    IN $BookingClassID INT,
    IN $BookingTypeID INT
)
BEGIN
    IF $BookingID = 0 THEN
        -- New booking: check if flight+class+date exists
        IF NOT EXISTS (
            SELECT 1 FROM flightbooking 
            WHERE FlightID = $FlightID 
              AND BookingClassID = $BookingClassID 
              AND BookingDate = $BookingDate
        ) THEN
            INSERT INTO flightbooking (BookingDate, FlightID, BookingClassID, BookingTypeID)
            VALUES ($BookingDate, $FlightID, $BookingClassID, $BookingTypeID);
        END IF;
    ELSE
        -- Updating: check if another booking has the same flight+class+date
        IF NOT EXISTS (
            SELECT 1 FROM flightbooking 
            WHERE FlightID = $FlightID 
              AND BookingClassID = $BookingClassID 
              AND BookingDate = $BookingDate
              AND BookingID != $BookingID
        ) THEN
            UPDATE flightbooking
            SET BookingDate = $BookingDate,
                FlightID = $FlightID,
                BookingClassID = $BookingClassID,
                BookingTypeID = $BookingTypeID
            WHERE BookingID = $BookingID;
        END IF;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingclasses`($bookingclassid INT, $bookingid INT,$noofseats int, $unitprice double, $currencyid INT)
BEGIN
		IF $bookingclassid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `flightbookingclasses` WHERE `bookingid`=$bookingid) THEN 
				 INSERT INTO `flightbookingclasses`(`bookingid`, `noofseats`, `unitprice`,`currencyid`)
            VALUES ($bookingid, $noofseats, $unitprice,$currencyid);
        END IF;
   
		ELSE
			UPDATE `flightbookingclasses`
			SET `bookingid`=$bookingid,`noofseats`=$noofseats,`unitprice`=$unitprice,`currencyid`=$currencyid
			WHERE `bookingclassid`=$bookingclassid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingpassangers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingpassangers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingpassangers`($passengerbookingid INT,$bookingclassid INT,$documentid int, $iddocumentno int, $firstname VARCHAR(100), $middlename varchar(100), $lastname varchar(100), $gender bool, $DOB date)
BEGIN
		IF $passengerbookingid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `flightbookingpassangers` WHERE `bookingclassid`=$bookingclassid) THEN 
				INSERT INTO `flightbookingpassangers`(`bookingclassid`,`documentid`,`iddocumentno`,`firstname`,`middlename`,`lastname`,`gender`,`DOB`)
				VALUES ($bookingclassid,$documentid,$iddocumentno,$firstname,$middlename,$lastname,$gender,$DOB);
				
			END IF;
		ELSE
			UPDATE `flightbookingpassangers`
			SET `bookingclassid`=$bookingclassid,`documentid`=$documentid,`iddocumentno`=$iddocumentno,`firstname`=$firstname,`middlename`=$middlename,`lastname`=$lastname,`gender`=$gender,`DOB`=$DOB
			WHERE `flightid`=$flightid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightclasses`($flightclassid INT, $bookingclassid int,$flightid INT,$noofseats INT, $unitprice DOUBLE, $currencyid INT)
BEGIN
		IF $flightclassid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `flightclasses` WHERE `bookingclassid`=$bookingclassid) THEN 
				 INSERT INTO `flightclasses`(`flightid`,`bookingclassid`, `noofseats`, `unitprice`,`currencyid`)
            VALUES ($flightid,$bookingclassid, $noofseats, $unitprice,$currencyid);
        END IF;
   
		ELSE
			UPDATE `flightclasses`
			SET `bookingclassid`=$bookingclassid,`noofseats`=$noofseats,`unitprice`=$unitprice,`currencyid`=$currencyid,`flightid`=$flightid
			WHERE `flightclassid`=$flightclassid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflights`($flightid INT, $airlineid int,$flightnumber varchar(100), $departurecity varchar(100), $destinationcity VARCHAR(100), $departuretime time, $duration time, $departureairportid int)
BEGIN
		IF $flightid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `flights` WHERE `flightnumber`=$flightnumber) THEN 
				 INSERT INTO `flights`(`airlineid`, `flightnumber`, `departurecity`,`destinationcity`,`departuretime`,`duration`,`departureairportid`)
            VALUES ($airlineid, $flightnumber, $departurecity,$destinationcity,$departuretime,$duration,$departureairportid);
        END IF;
   
		ELSE
			UPDATE `flights`
			SET `airlineid`=$airlineid,`flightnumber`=$flightnumber,`departurecity`=$departurecity,`destinationcity`=$destinationcity,`departuretime`=$departuretime,`duration`=$duration,`departureairportid`=$departureairportid
			WHERE `flightid`=$flightid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepaymentmethods` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepaymentmethods` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepaymentmethods`($methodid INT, $methodname VARCHAR(100))
BEGIN
		IF $methodid=0 THEN 
			IF NOT EXISTS(SELECT * FROM `paymentmethods` WHERE `methodname`=$methodname) THEN 
				INSERT INTO `paymentmethods`(`methodname`)
				VALUES ($methodname);
			END IF;
		ELSE
			UPDATE`paymentmethods`
			SET `methodname`=$methodname
			WHERE `methodid`=$methodid;
		END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savetraveldocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savetraveldocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savetraveldocuments`($documentid INT, $documentname VARCHAR(100),$documentexpires tinyint)
BEGIN
-- check if we are adding new one
    IF $documentid = 0 THEN
     
        IF NOT EXISTS (
            SELECT * FROM `traveldocuments` WHERE `documentname` = $documentname 
        ) THEN
            INSERT INTO `traveldocuments` (`documentname`, `documentexpires`)
            VALUES ($documentname, $documentexpires);
        END IF;
    ELSE
       IF NOT EXISTS (SELECT * FROM `traveldocuments` WHERE `documentid`=$documentid AND (`documentexpires` = $documentexpires OR `documentname` = $documentname)) THEN
       
  UPDATE `traveldocuments`
  SET `documentname` = $documentname, `documentexpires` = $documentexpires
  WHERE`documentid`= $documentid;
 END IF; 
    END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
