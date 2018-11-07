/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.55 : Database - sean_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sean_blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sean_blog`;

/*Table structure for table `t_blog` */

DROP TABLE IF EXISTS `t_blog`;

CREATE TABLE `t_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客类型',
  `blog_title` varchar(200) NOT NULL COMMENT '博客题目',
  `blog_summary` varchar(400) DEFAULT NULL COMMENT '博客摘要',
  `blog_Date` datetime DEFAULT NULL COMMENT '发布日期',
  `blog_content` text COMMENT '博客内容',
  `blog_type_id` int(11) DEFAULT NULL COMMENT '外键关联博客类别',
  PRIMARY KEY (`blog_id`),
  KEY `blog_type_id` (`blog_type_id`),
  CONSTRAINT `t_blog_ibfk_1` FOREIGN KEY (`blog_type_id`) REFERENCES `t_blogtype` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Table structure for table `t_blogger` */

DROP TABLE IF EXISTS `t_blogger`;

CREATE TABLE `t_blogger` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博主id',
  `user_name` varchar(50) NOT NULL COMMENT '博主姓名',
  `user_password` varchar(100) NOT NULL COMMENT '博主密码',
  `user_profile` text COMMENT '博主信息',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `t_blogtype` */

DROP TABLE IF EXISTS `t_blogtype`;

CREATE TABLE `t_blogtype` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `type_Name` varchar(30) DEFAULT NULL COMMENT '博客类别',
  `type_orderNum` int(11) DEFAULT NULL COMMENT '博客排序',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `comer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表id',
  `comer_Name` varchar(50) DEFAULT NULL COMMENT '评论者的名字',
  `com_content` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `com_commentDate` datetime DEFAULT NULL COMMENT '评论日期',
  `com_state` int(11) DEFAULT NULL COMMENT '审核状态',
  `com_blog_id` int(11) DEFAULT NULL COMMENT '外键关联具体博客',
  PRIMARY KEY (`comer_id`),
  KEY `com_blog_id` (`com_blog_id`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`com_blog_id`) REFERENCES `t_blog` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
