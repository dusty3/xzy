/*
Navicat MySQL Data Transfer

Source Server         : IQSYS
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : lpf

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2018-06-18 20:15:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lm_user`
-- ----------------------------
DROP TABLE IF EXISTS `lm_user`;
CREATE TABLE `lm_user` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_usercode` varchar(100) NOT NULL,
  `login_password` varchar(100) NOT NULL,
  `createtime` datetime NOT NULL,
  `modifytime` datetime DEFAULT NULL,
  `dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是删除',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_user
-- ----------------------------
