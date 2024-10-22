/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.61 : Database - 刘梓淳
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`刘梓淳` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `刘梓淳`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `课号` char(3) NOT NULL,
  `课名` char(20) NOT NULL,
  `教师` char(4) DEFAULT NULL,
  `教室` char(5) DEFAULT NULL,
  `先修课` char(3) DEFAULT NULL,
  PRIMARY KEY (`课号`),
  KEY `fk_js` (`教师`),
  CONSTRAINT `fk_js` FOREIGN KEY (`教师`) REFERENCES `teacher` (`工号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`课号`,`课名`,`教师`,`教室`,`先修课`) values ('C01','高等数学','T01','1-115',NULL),('C02','数据库原理','T10','1-109','C07'),('C03','信息系统','T02','2-104','C02'),('C04','微机应用基础','T03','1-109',NULL),('C05','计算机组成原理','T04','3-504','C07'),('C06','C语言程序设计','T05','1-110',NULL),('C07','数据结构','T11','2-104','C06'),('C08','软件工程','T07','3-104','C06'),('C09','网络原理','T04','','C01'),('C10','应用数学','T01','1-303',NULL),('C11','微机原理','T04','1-109','C05'),('C12','接口技术','T15','2-508','C11');

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `学号` char(5) NOT NULL,
  `课号` char(3) NOT NULL,
  `成绩` int(10) DEFAULT NULL,
  PRIMARY KEY (`学号`,`课号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `score` */

insert  into `score`(`学号`,`课号`,`成绩`) values ('S01','C01',67),('S01','C02',86),('S01','C09',81),('S01','C11',75),('S02','C01',96),('S02','C05',95),('S03','C01',70),('S03','C12',94),('S04','C03',91),('S04','C05',65),('S05','C06',84),('S05','C09',90),('S05','C12',66),('S06','C03',74),('S06','C05',89),('S06','C07',65),('S06','C10',94),('S07','C03',85),('S07','C11',70),('S08','C02',73),('S08','C04',79),('S08','C10',65),('S09','C03',84),('S09','C04',72),('S09','C07',70),('S10','C07',95),('S10','C12',100),('S11','C01',78),('S11','C04',71),('S11','C05',82),('S11','C06',82),('S11','C09',99),('S12','C01',100),('S12','C02',93),('S12','C03',70),('S12','C04',74),('S12','C05',97),('S12','C06',90),('S12','C07',96),('S12','C08',73),('S12','C09',82),('S12','C10',96),('S12','C11',85),('S12','C12',96),('S13','C03',91),('S13','C06',69),('S13','C09',95),('S13','C11',92),('S13','C12',85),('S14','C01',100),('S14','C02',83),('S14','C07',85),('S14','C12',67),('S15','C02',100),('S15','C06',74),('S15','C07',36),('S15','C11',76),('S15','C12',90),('S16','C05',80),('S16','C06',77),('S17','C07',77),('S17','C09',89),('S17','C10',88),('S18','C11',87),('S19','C05',97),('S19','C09',76),('S19','C10',98),('S20','C05',85),('S20','C07',98),('S20','C11',79),('S21','C02',88),('S21','C03',67),('S21','C08',71),('S21','C11',97),('S22','C10',86),('S22','C11',67),('S22','C12',68),('S23','C01',87),('S23','C02',85),('S23','C03',99),('S23','C04',55),('S23','C06',85),('S23','C08',81),('S24','C01',35),('S24','C05',74),('S24','C06',52),('S24','C10',58),('S24','C11',78),('S25','C01',68),('S25','C05',95),('S25','C06',72),('S25','C09',68),('S25','C11',66),('S26','C05',88),('S26','C06',100),('S26','C07',96),('S26','C08',69),('S26','C09',70),('S27','C01',79),('S27','C04',94),('S27','C07',39),('S27','C08',94),('S27','C09',89),('S27','C11',80),('S28','C02',92),('S28','C04',96),('S28','C10',86),('S29','C04',89),('S30','C05',97),('S30','C11',83),('S30','C12',75),('S31','C01',74),('S31','C11',99),('S32','C01',73),('S32','C02',74),('S32','C03',76),('S32','C08',66),('S32','C09',71),('S32','C10',87),('S33','C09',39),('S33','C12',73),('S34','C02',77),('S34','C07',88),('S35','C07',86),('S35','C10',44),('S35','C11',83),('S36','C02',77),('S36','C04',83),('S36','C09',97),('S37','C02',98),('S37','C04',68),('S38','C06',85),('S39','C07',73),('S39','C12',72),('S40','C01',66),('S40','C09',98),('S41','C01',99),('S41','C05',99),('S41','C06',89),('S41','C09',87),('S42','C03',75),('S42','C06',68),('S42','C12',80),('S43','C01',74),('S43','C02',88),('S43','C07',84),('S43','C11',100),('S43','C12',94),('S44','C01',98),('S44','C06',82),('S44','C07',86),('S44','C12',84),('S46','C01',93),('S46','C02',86),('S46','C03',98),('S46','C05',83),('S46','C06',67),('S46','C07',87),('S46','C09',76),('S46','C10',74),('S46','C11',78),('S46','C12',76),('S47','C01',68),('S47','C06',83),('S48','C01',75),('S48','C06',84),('S48','C10',65),('S48','C12',76),('S49','C03',73),('S49','C05',67),('S49','C09',88),('S50','C04',79),('S50','C08',69),('S50','C10',65),('S50','C11',95),('S51','C02',87),('S51','C09',71),('S52','C02',95),('S52','C03',73),('S52','C04',77),('S53','C03',69),('S53','C06',89),('S53','C11',93),('S53','C12',97),('S54','C09',72),('S54','C10',95),('S54','C12',82),('S55','C02',72),('S55','C06',92),('S55','C09',72),('S56','C02',70),('S56','C04',82),('S56','C05',77),('S56','C11',83),('S57','C06',68),('S57','C10',67),('S57','C11',78),('S58','C10',90),('S59','C12',78),('S60','C03',72),('S61','C01',84),('S61','C02',92),('S62','C04',74),('S62','C10',91),('S62','C11',99),('S63','C01',65),('S64','C03',96),('S64','C06',86),('S64','C11',43),('S65','C06',91),('S65','C09',80),('S65','C10',87),('S65','C12',88),('S66','C08',93),('S66','C09',89),('S67','C04',77),('S67','C12',86),('S68','C01',82),('S68','C02',66),('S68','C07',91),('S68','C10',94),('S68','C12',84),('S69','C01',90),('S69','C02',69),('S69','C06',82),('S69','C09',92),('S69','C11',66),('S70','C11',86),('S71','C01',97),('S71','C02',82),('S71','C03',66),('S71','C07',99),('S71','C08',80),('S71','C09',71),('S71','C11',81),('S72','C01',66),('S72','C02',69),('S73','C05',97),('S73','C10',70),('S74','C02',67),('S74','C10',89),('S74','C11',74),('S75','C02',100),('S75','C08',94),('S75','C11',80),('S76','C05',92),('S77','C05',96),('S77','C11',77),('S78','C01',71),('S78','C02',67),('S78','C04',87),('S78','C08',79),('S78','C10',100),('S79','C02',95),('S79','C07',66),('S79','C09',98),('S80','C01',93),('S80','C04',87),('S80','C05',99),('S80','C06',76),('S80','C08',89),('S81','C01',99),('S81','C06',73),('S81','C08',88),('S81','C11',96),('S81','C12',71),('S82','C02',65),('S82','C06',94),('S82','C10',71),('S82','C11',70),('S83','C01',99),('S83','C06',77),('S83','C11',84),('S83','C12',92),('S84','C09',92),('S84','C10',82),('S84','C12',82),('S85','C07',72),('S87','C02',84),('S87','C07',81),('S88','C01',74),('S88','C07',71),('S88','C11',81),('S89','C03',67),('S89','C06',70),('S89','C10',83),('S89','C11',36),('S90','C01',93),('S90','C02',71),('S90','C03',72),('S90','C06',68),('S90','C07',72),('S90','C09',77),('S90','C10',86),('S91','C02',83),('S91','C05',92),('S91','C12',43),('S92','C01',85),('S92','C02',74),('S92','C03',65),('S92','C10',68),('S92','C11',100),('S93','C12',91),('S94','C07',95),('S95','C03',95),('S95','C09',95),('S95','C10',99),('S96','C08',87),('S96','C09',81),('S96','C10',66),('S98','C03',69),('S98','C05',98),('S98','C12',69),('S99','C09',87);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `学号` varchar(5) NOT NULL,
  `姓名` varchar(120) DEFAULT NULL,
  `性别` char(2) NOT NULL DEFAULT '男',
  `年龄` int(11) DEFAULT NULL,
  `系别` varchar(15) DEFAULT NULL,
  `身高` int(11) DEFAULT NULL,
  PRIMARY KEY (`学号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`学号`,`姓名`,`性别`,`年龄`,`系别`,`身高`) values ('S01','王建薄','男',24,'自动化',161),('S02','刘华','女',19,'自动化',186),('S03','范林军','女',18,'计算机',178),('S04','李伟军','男',19,'物联网',149),('S05','黄河','男',18,'物联网',143),('S06','长江','男',20,'物联网',158),('S07','刘阳河','女',20,'计算机',169),('S08','李岚','女',18,'信息',186),('S09','周洪峰','男',19,'计算机',153),('S10','陈海阳','男',18,'信息',187),('S11','朱小红','女',18,'自动化',164),('S12','孙二空','男',21,'信息',183),('S13','黄尉','男',20,'信息',161),('S14','刘明','男',19,'自动化',182),('S15','袁爱民','男',21,'信息',172),('S16','陈中国','男',18,'物联网',176),('S17','王军源','男',17,'计算机',189),('S18','周华','女',19,'计算机',177),('S19','袁函萍','女',21,'计算机',164),('S20','唐太中','男',19,'自动化',166),('S21','李桂芸','女',20,'物联网',156),('S22','古倩男','女',18,'计算机',164),('S23','刘心芳','女',20,'计算机',161),('S24','郭水全','男',18,'物联网',183),('S25','赵明明','男',19,'计算机',152),('S26','陈务实','男',19,'信息',166),('S27','万星海','男',20,'自动化',186),('S28','唐季','男',21,'自动化',145),('S29','刘德花','女',18,'物联网',196),('S30','孙江河','男',19,'计算机',196),('S31','黄玉冰','男',20,'物联网',185),('S32','郑德才','男',21,'计算机',156),('S33','吴春磊','女',23,'计算机',176),('S34','吴玉静','男',17,'计算机',169),('S35','朱明旺','女',19,'计算机',156),('S36','魏建政','男',22,'物联网',155),('S37','郑波','男',23,'计算机',173),('S38','赵治均','男',17,'计算机',168),('S39','徐明伟','女',17,'计算机',151),('S40','吴沈鹏','男',23,'信息',152),('S41','包德彬','女',17,'计算机',167),('S42','任小东','男',22,'物联网',184),('S43','张启明','男',21,'信息',161),('S44','李华军','女',20,'物联网',192),('S45','杨晓磊','女',19,'计算机',181),('S46','刘小清','男',17,'计算机',177),('S47','胡葆恒','女',17,'信息',186),('S48','陈江','男',17,'物联网',167),('S49','殷俊杰','女',23,'信息',192),('S50','王朔','男',17,'物联网',161),('S51','吴启猛','女',19,'物联网',169),('S52','代晓维','男',23,'计算机',183),('S53','陈塨','女',20,'物联网',178),('S54','李正清','男',22,'信息',168),('S55','游义兵','男',22,'信息',163),('S56','向绍兵','女',22,'信息',150),('S57','卢中伟','女',17,'信息',172),('S58','常晓敏','男',23,'物联网',157),('S59','周总明','男',23,'物联网',168),('S60','唐闽','女',17,'物联网',185),('S61','李俊','男',20,'计算机',150),('S62','袁乃刚','女',17,'计算机',197),('S63','康中林','男',18,'物联网',158),('S64','张利','女',22,'信息',161),('S65','杨盛','男',22,'信息',164),('S66','晏久焱','男',19,'计算机',169),('S67','杨小兵','男',21,'计算机',198),('S68','田昆','女',18,'物联网',152),('S69','吴天贵','女',22,'信息',176),('S70','胡林霞','女',21,'信息',192),('S71','李伟','女',21,'信息',173),('S72','柏勇','女',20,'信息',189),('S73','肖锋','女',17,'计算机',164),('S74','彭科','男',22,'信息',192),('S75','王杨军','女',20,'信息',159),('S76','汶李强','男',21,'物联网',170),('S77','张杰','男',17,'物联网',194),('S78','杨立坤','男',22,'物联网',183),('S79','刘勇','女',21,'物联网',174),('S80','何履明','女',21,'计算机',182),('S81','张陵波','女',22,'计算机',188),('S82','冯浩','女',21,'物联网',170),('S83','韩亚强','女',18,'计算机',166),('S84','寻思良','男',22,'信息',194),('S85','余勇','女',18,'信息',150),('S86','苟鹏','女',22,'计算机',158),('S87','刘志忠','女',20,'物联网',160),('S88','杜小顺','女',20,'计算机',188),('S89','胡昌辉','女',20,'信息',195),('S90','张雯静','男',22,'信息',177),('S91','沈明明','女',17,'物联网',186),('S92','杜娜','男',20,'信息',161),('S93','何戬','男',17,'信息',158),('S94','刘维君','男',18,'信息',177),('S95','姜炜','男',19,'信息',176),('S96','汤建成','女',21,'计算机',176),('S97','杨建兵','男',23,'信息',177),('S98','舒畅','女',22,'计算机',183),('S99','张海洋','女',23,'物联网',172);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `工号` varchar(4) NOT NULL,
  `姓名` varchar(8) DEFAULT NULL,
  `生日` datetime NOT NULL,
  `性别` varchar(2) NOT NULL DEFAULT '男',
  `职称` varchar(8) DEFAULT NULL,
  `婚否` int(1) DEFAULT NULL,
  `工资` int(11) DEFAULT NULL,
  PRIMARY KEY (`工号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`工号`,`姓名`,`生日`,`性别`,`职称`,`婚否`,`工资`) values ('T01','李民','1970-01-05 00:00:00','男','讲师',1,3800),('T02','刘军','1974-01-11 00:00:00','女','助教',0,3300),('T03','李_明','1974-10-22 00:00:00','男','助教',1,2800),('T04','罗明军','1973-09-05 00:00:00','女','讲师',0,4700),('T05','潘强','1957-04-05 00:00:00','女','副教授',1,6400),('T06','程真','1976-02-08 00:00:00','女','讲师',1,4200),('T07','周华','1964-08-04 00:00:00','男','副教授',1,5200),('T08','刘大明','1974-05-06 00:00:00','男','教授',0,7900),('T09','陈胜','1980-09-08 00:00:00','男','助教',0,2300),('T10','吴广','1976-08-12 00:00:00','男','助教',1,2400),('T11','刘蓄','1978-02-16 00:00:00','女','教授',0,8400),('T12','朱虹','1980-04-17 00:00:00','女','助教',0,2500),('T13','黄莺','1979-11-11 00:00:00','女','讲师',1,4400),('T14','刘成功','1976-08-12 00:00:00','男','讲师',0,4100),('T15','王凤','1981-12-09 00:00:00','女','教授',1,6700),('T16','吴军','1980-09-12 00:00:00','男','助教',0,2800),('T17','周洋','1967-09-14 00:00:00','男','副教授',1,4800),('T18','陈其实','1975-08-12 00:00:00','男','讲师',1,3800),('T19','古洪明','1972-08-02 00:00:00','男','讲师',1,3600),('T20','李曼韬','1976-03-15 00:00:00','男','副教授',1,5100);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
