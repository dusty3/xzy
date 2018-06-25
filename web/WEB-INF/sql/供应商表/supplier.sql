/*
Navicat MySQL Data Transfer

Source Server         : IQSYS
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : lpf

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2018-06-21 01:58:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_country` varchar(100) DEFAULT NULL,
  `supplier_website` varchar(100) DEFAULT NULL,
  `supplier_inquiryman` varchar(100) DEFAULT NULL,
  `supplier_inquirytele` varchar(100) DEFAULT NULL,
  `supplier_inquiryphone` varchar(100) DEFAULT NULL,
  `supplier_inquiryfax` varchar(100) DEFAULT NULL,
  `supplier_inquiryemail` varchar(100) DEFAULT NULL,
  `supplier_orderman` varchar(100) DEFAULT NULL,
  `supplier_ordertele` varchar(100) DEFAULT NULL,
  `supplier_orderphone` varchar(100) DEFAULT NULL,
  `supplier_orderfax` varchar(100) DEFAULT NULL,
  `supplier_orderemail` varchar(100) DEFAULT NULL,
  `supplier_goodsman` varchar(100) DEFAULT NULL,
  `supplier_goodstele` varchar(100) DEFAULT NULL,
  `supplier_goodsphone` varchar(100) DEFAULT NULL,
  `supplier_goodsfax` varchar(100) DEFAULT NULL,
  `supplier_goodsemail` varchar(100) DEFAULT NULL,
  `supplier_customernumber` varchar(100) DEFAULT NULL,
  `supplier_makingpart` varchar(100) DEFAULT NULL,
  `supplier_createtime` datetime DEFAULT NULL,
  `supplier_modifytime` datetime DEFAULT NULL,
  `supplier_dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是删除',
  `supplier_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
