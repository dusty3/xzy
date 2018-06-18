/*
Navicat MySQL Data Transfer

Source Server         : IQSYS
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : lpf

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2018-06-18 20:15:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lm_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `lm_userinfo`;
CREATE TABLE `lm_userinfo` (
  `userinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `userinfo_name` varchar(100) DEFAULT NULL,
  `userinfo_email` varchar(100) DEFAULT NULL,
  `userinfo_phone` varchar(100) DEFAULT NULL,
  `userinfo_tele` varchar(100) DEFAULT NULL,
  `userinfo_fax` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `dr` int(11) DEFAULT NULL COMMENT '默认为0.    1为删除',
  PRIMARY KEY (`userinfo_id`),
  KEY `login_id` (`login_id`),
  CONSTRAINT `login_id` FOREIGN KEY (`login_id`) REFERENCES `lm_user` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_userinfo
-- ----------------------------
