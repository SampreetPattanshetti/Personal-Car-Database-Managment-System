-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema car_managment
--

CREATE DATABASE IF NOT EXISTS car_managment;
USE car_managment;

--
-- Definition of table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `reg_no` varchar(20) NOT NULL,
  `car_name` varchar(20) default NULL,
  `car_model` varchar(20) default NULL,
  `car_color` varchar(20) default NULL,
  PRIMARY KEY  (`reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` (`reg_no`,`car_name`,`car_model`,`car_color`) VALUES 
 (' KA 49 M 21XX',' INNOVA',' zx ',' Silver'),
 ('eg: KA 49 M 21XX','eg: INNOVA','eg: zx ','eg: Silver'),
 ('KA 49 M 2155','INNOVA',' zx ','Silver');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;


--
-- Definition of trigger `car`
--

DROP TRIGGER IF EXISTS `car`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trig_car` BEFORE DELETE ON `car` FOR EACH ROW insert into triger
values(old.reg_no,'DELETED',now()) $$

DELIMITER ;

--
-- Definition of table `car_owner`
--

DROP TABLE IF EXISTS `car_owner`;
CREATE TABLE `car_owner` (
  `owner_dl` varchar(20) default NULL,
  `owner_name` varchar(20) default NULL,
  `owner_address` varchar(20) default NULL,
  `reg_no` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_owner`
--

/*!40000 ALTER TABLE `car_owner` DISABLE KEYS */;
INSERT INTO `car_owner` (`owner_dl`,`owner_name`,`owner_address`,`reg_no`) VALUES 
 (' KA49 2018XXX13XX','DANY',' SAVAGAON BELAGAVI',' KA 49 M 21XX'),
 ('KA49 2018XXX13XX',' DANY',' SAVAGAON BELAGAVI',': KA 49 M 21XX'),
 ('KA49 2018XXX1369','DANY','SAVAGAON BELAGAVI','KA 49 M 2156');
/*!40000 ALTER TABLE `car_owner` ENABLE KEYS */;


--
-- Definition of table `car_service`
--

DROP TABLE IF EXISTS `car_service`;
CREATE TABLE `car_service` (
  `service_id` varchar(30) NOT NULL,
  `reg_no` varchar(20) default NULL,
  `job_card_status` varchar(40) default NULL,
  `cost_estimation` varchar(30) default NULL,
  PRIMARY KEY  (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_service`
--

/*!40000 ALTER TABLE `car_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_service` ENABLE KEYS */;


--
-- Definition of table `minor_checks`
--

DROP TABLE IF EXISTS `minor_checks`;
CREATE TABLE `minor_checks` (
  `running` varchar(20) default NULL,
  `milage` varchar(20) default NULL,
  `fills` varchar(20) default NULL,
  `reg_no` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `minor_checks`
--

/*!40000 ALTER TABLE `minor_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `minor_checks` ENABLE KEYS */;


--
-- Definition of table `rc_card`
--

DROP TABLE IF EXISTS `rc_card`;
CREATE TABLE `rc_card` (
  `reg_no` varchar(20) default NULL,
  `chassis_no` varchar(20) NOT NULL,
  `engine_no` varchar(20) default NULL,
  `owner_name` varchar(20) default NULL,
  PRIMARY KEY  (`chassis_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rc_card`
--

/*!40000 ALTER TABLE `rc_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `rc_card` ENABLE KEYS */;


--
-- Definition of table `triger`
--

DROP TABLE IF EXISTS `triger`;
CREATE TABLE `triger` (
  `reg_no` varchar(20) default NULL,
  `Message` varchar(100) default NULL,
  `time_date` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `triger`
--

/*!40000 ALTER TABLE `triger` DISABLE KEYS */;
INSERT INTO `triger` (`reg_no`,`Message`,`time_date`) VALUES 
 ('KA 49 M 21XX','DELETED','2019-12-08 04:29:06');
/*!40000 ALTER TABLE `triger` ENABLE KEYS */;


--
-- Definition of procedure `cars`
--

DROP PROCEDURE IF EXISTS `cars`;

DELIMITER $$

CREATE DEFINER="root"@"localhost" PROCEDURE "cars"()
BEGIN
  select  c.reg_no,c.car_name,c.car_model,c.car_color,o.owner_dl,o.owner_name,o.owner_address,rc.chassis_no,rc.engine_no,a.service_id,a.job_card_status,a.cost_estimation,mc.running,mc.milage,mc.fills
  from car c,car_owner o,car_service a,minor_checks mc,rc_card rc
  where c.reg_no=o.reg_no
  AND c.reg_no=a.reg_no
  AND c.reg_no=mc.reg_no
  AND c.reg_no=rc.reg_no;
END $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
