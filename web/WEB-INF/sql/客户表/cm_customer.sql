/*
Navicat MySQL Data Transfer

Source Server         : IQSYS
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : lpf

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2018-06-20 00:11:50
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_customer
-- ----------------------------
INSERT INTO `cm_customer` VALUES ('1', '常州嬉戏谷有限公司', '常州嬉戏谷有限公司', '9132041258558635XF', '招商银行', '0123000103000008865', '051088550001', '常州市武进区雪堰镇太北路1号', '夏楠', '13806182806', 'mia@demeter7.com', '常州市武进区雪堰镇太北路1号', '夏楠', '13806182806', 'mia@demeter7.com', '常州市武进区雪堰镇太北路1号', '夏楠', '13806182806', 'mia@demeter7.com', '花生', '张浩一', '没有', '2018-06-13 00:08:26', null, '0');
INSERT INTO `cm_customer` VALUES ('2', '埃梯梯精密机械制造（无锡）有限公司', '埃梯梯精密机械制造（无锡）有限公司', '91320214789913869F', '中国银行', '0123000103000008835', '051088550000', '无锡新区梅村锡达路570号', 'Vincent Zhang \r\nVincent Zhang \r\nVincent Zhang ', '13806182805', 'vincent.zhang@itt.com', '无锡新区梅村锡达路570号', 'Vincent Zhang ', '13806182805', 'vincent.zhang@itt.com', '无锡新区梅村锡达路570号', 'Vincent Zhang ', '13806182805', 'vincent.zhang@itt.com', '杨凯', '杨磊', '不要用公司胶带', '2018-06-20 00:08:21', null, '0');
