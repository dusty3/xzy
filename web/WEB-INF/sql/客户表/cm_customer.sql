/*
Navicat MySQL Data Transfer

Source Server         : IQSYS
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : lpf

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2018-06-19 23:55:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cm_customer`
-- ----------------------------
DROP TABLE IF EXISTS `cm_customer`;
CREATE TABLE `cm_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `customer_invoicename` varchar(100) DEFAULT NULL,
  `customer_invoiceduty` varchar(100) DEFAULT NULL,
  `customer_invoicebank` varchar(100) DEFAULT NULL,
  `customer_invoiceaccount` varchar(100) DEFAULT NULL,
  `customer_invoicetele` varchar(100) DEFAULT NULL,
  `customer_invoiceaddress` varchar(100) DEFAULT NULL,
  `customer_linkman` varchar(100) DEFAULT NULL,
  `customer_linktele` varchar(100) DEFAULT NULL,
  `customer_linkemaile` varchar(100) DEFAULT NULL,
  `customer_goodsaddress` varchar(100) DEFAULT NULL,
  `customer_goodsman` varchar(100) DEFAULT NULL,
  `customer_goodstele` varchar(100) DEFAULT NULL,
  `customer_goodsemaile` varchar(100) DEFAULT NULL,
  `customer_ticketaddress` varchar(100) DEFAULT NULL,
  `customer_ticketman` varchar(100) DEFAULT NULL,
  `customer_tickettele` varchar(100) DEFAULT NULL,
  `customer_ticketemaile` varchar(100) DEFAULT NULL,
  `customer_salesman` varchar(100) DEFAULT NULL,
  `customer_makingpart` varchar(100) DEFAULT NULL,
  `logistics_special_requirements` varchar(100) DEFAULT NULL,
  `customer_createtime` datetime DEFAULT NULL,
  `customer_modifytime` datetime DEFAULT NULL,
  `customer_dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是删除',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_customer
-- ----------------------------
