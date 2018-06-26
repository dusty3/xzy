/*
Navicat MySQL Data Transfer

Source Server         : 0
Source Server Version : 50546
Source Host           : localhost:3306
Source Database       : lpf

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2018-06-25 19:30:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL,
  `brand_manufacturersid` int(11) DEFAULT NULL,
  `brand_manufacturers` varchar(100) DEFAULT NULL,
  `brand_website` varchar(100) DEFAULT NULL,
  `brand_tele` varchar(100) DEFAULT NULL,
  `brand_email` varchar(100) DEFAULT NULL,
  `brand_description` varchar(100) DEFAULT NULL,
  `brand_createtime` datetime DEFAULT NULL,
  `brand_modifytime` datetime DEFAULT NULL,
  `brand__makingpartid` int(11) DEFAULT NULL,
  `brand__makingpartname` varchar(100) DEFAULT NULL,
  `brand_dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是删除',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'wika', '11', 'wika gmbh', 'www.baidu.com', '10086', '1251508@qq.com', '价格好', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '1', '徐张悦', '0');
INSERT INTO `brand` VALUES ('2', 'beck', '12', 'beck gmbh', 'www.163.com', '10087', 'aa@163.com', '不好', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '1', '徐张悦', '0');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
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
  `customer_salesmanid` int(11) DEFAULT NULL,
  `customer_salesmanname` varchar(100) DEFAULT NULL,
  `customer_makingpartid` int(11) DEFAULT NULL,
  `customer_makingpartname` varchar(100) DEFAULT NULL,
  `logistics_special_requirements` varchar(100) DEFAULT NULL,
  `customer_createtime` datetime DEFAULT NULL,
  `customer_modifytime` datetime DEFAULT NULL,
  `customer_dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是删除',
  PRIMARY KEY (`customer_id`),
  KEY `customer_salesmanid` (`customer_salesmanid`),
  KEY `customer_makingpartid` (`customer_makingpartid`),
  CONSTRAINT `customer_makingpartid` FOREIGN KEY (`customer_makingpartid`) REFERENCES `lm_userinfo` (`userinfo_id`),
  CONSTRAINT `customer_salesmanid` FOREIGN KEY (`customer_salesmanid`) REFERENCES `lm_userinfo` (`userinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '常州嬉戏谷有限公司', '常州嬉戏谷有限公司', '9132041258558635XF', '招商银行', '0123000103000008865', '051088550001', '常州市武进区雪堰镇太北路1号', '夏楠', '13806182806', 'mia@demeter7.com', '常州市武进区雪堰镇太北路1号', '夏楠', '13806182806', 'mia@demeter7.com', '常州市武进区雪堰镇太北路1号', '夏楠', '13806182806', 'mia@demeter7.com', '1', '徐张悦', '2', '杨凯', '没有', '2018-06-13 00:08:26', null, '0');
INSERT INTO `customer` VALUES ('2', '埃梯梯精密机械制造（无锡）有限公司', '埃梯梯精密机械制造（无锡）有限公司', '91320214789913869F', '中国银行', '0123000103000008835', '051088550000', '无锡新区梅村锡达路570号', '张三', '13806182805', 'vincent.zhang@itt.com', '无锡新区梅村锡达路570号', 'Vincent Zhang', '13806182805', 'vincent.zhang@itt.com', '无锡新区梅村锡达路570号', 'Vincent Zhang', '13806182805', 'vincent.zhang@itt.com', '2', '杨凯', '2', '杨凯', '不要用公司胶带', '2018-06-20 00:08:21', null, '0');
INSERT INTO `customer` VALUES ('3', '上海用友', '上海用友金融有限公司', '12345678989913869F', '中国银行新德路支行', '1234561234560008835', '021-10086', '上海陆家嘴', '王五', '13812345678', '123@163.com', '上海川沙', '张四', '13812345678', '124@163.com', '上海杨浦', '张五', '13812345678', '125@163.com', '1', '徐张悦', '1', '徐张悦', '不用带logo胶带', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '0');
INSERT INTO `customer` VALUES ('4', '上海阿里巴巴', '阿里巴巴有限公司', '123456789321', '招商银行上海路支行', '1232582582580008835', '021-10001', '上海张江', '李四', '15895933100', '158959@163.com', '上海张江', '李四', '15895933111', '1585959@163.com', '上海迪士尼', '李四他哥', '15895933123', '158636@163.com', '2', '杨凯', '2', '杨凯', '发顺丰', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '0');

-- ----------------------------
-- Table structure for `inquiry`
-- ----------------------------
DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry` (
  `inquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `inquiry_style` int(11) DEFAULT NULL,
  `inquiry_send` int(11) DEFAULT NULL,
  `inquiry_reply` int(11) DEFAULT NULL,
  `inquiry_mark` varchar(100) DEFAULT NULL,
  `userinfo_id` int(11) DEFAULT NULL,
  `userinfo_name` varchar(100) DEFAULT NULL,
  `inquiry_makingpartid` int(11) DEFAULT NULL,
  `inquiry_makingpartname` varchar(100) DEFAULT NULL,
  `inquiry_createtime` datetime DEFAULT NULL,
  `inquiry_modifytime` datetime DEFAULT NULL,
  `inquiry_replytime` datetime DEFAULT NULL,
  `inquiry_dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是删除',
  PRIMARY KEY (`inquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inquiry
-- ----------------------------
INSERT INTO `inquiry` VALUES ('123', '2', 'beck', '1', '11', '1', '嬉戏谷', '1', '1', '1', '111', '1', '徐张悦', '1', '徐张悦', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '2018-06-14 00:08:00', '0');
INSERT INTO `inquiry` VALUES ('124', '2', 'beck', '1', '11', '2', '用友', '0', '1', '1', '2132', '1', '徐张悦', '1', '徐张悦', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '2018-06-14 00:08:00', '0');

-- ----------------------------
-- Table structure for `inquiryproduct`
-- ----------------------------
DROP TABLE IF EXISTS `inquiryproduct`;
CREATE TABLE `inquiryproduct` (
  `cp_id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_type` varchar(100) DEFAULT NULL,
  `product_description` varchar(100) DEFAULT NULL,
  `inquiry_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inquiryproduct
-- ----------------------------
INSERT INTO `inquiryproduct` VALUES ('1', '123', '12323', 'abc-123', '', '2');
INSERT INTO `inquiryproduct` VALUES ('2', '124', '3442', 'a-1-123-d', '', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_user
-- ----------------------------
INSERT INTO `lm_user` VALUES ('1', 'xuzhangyue', '1', '2018-06-21 23:35:26', null, '0');
INSERT INTO `lm_user` VALUES ('2', 'yangkai', '1', '2018-06-21 23:35:42', null, '0');

-- ----------------------------
-- Table structure for `lm_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `lm_userinfo`;
CREATE TABLE `lm_userinfo` (
  `userinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `userinfo_name` varchar(100) NOT NULL,
  `userinfo_email` varchar(100) DEFAULT NULL,
  `userinfo_phone` varchar(100) DEFAULT NULL,
  `userinfo_tele` varchar(100) DEFAULT NULL,
  `userinfo_fax` varchar(100) DEFAULT NULL,
  `userinfo_createtime` datetime NOT NULL,
  `userinfo_modifytime` datetime DEFAULT NULL,
  `dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0.    1为删除',
  PRIMARY KEY (`userinfo_id`),
  KEY `login_id` (`login_id`),
  KEY `userinfo_id` (`userinfo_id`,`userinfo_name`),
  CONSTRAINT `login_id` FOREIGN KEY (`login_id`) REFERENCES `lm_user` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lm_userinfo
-- ----------------------------
INSERT INTO `lm_userinfo` VALUES ('1', '1', '徐张悦', '1215057641@qq.com', '17621703801', '17621703801', null, '2018-06-21 23:36:29', null, '0');
INSERT INTO `lm_userinfo` VALUES ('2', '2', '杨凯', '1240497721@qq.com', '13182746408', '13182746408', null, '2018-06-21 23:37:24', null, '0');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `product_type` varchar(100) NOT NULL,
  `product_description` varchar(100) DEFAULT NULL,
  `product_chinesename` varchar(100) DEFAULT NULL,
  `product_foreignname` varchar(100) DEFAULT NULL,
  `product_customsname` varchar(100) DEFAULT NULL,
  `product_customsduty` varchar(100) DEFAULT NULL,
  `product_chinesehs` varchar(100) DEFAULT NULL,
  `product_foreignhs` varchar(100) DEFAULT NULL,
  `customs_element` varchar(100) DEFAULT NULL,
  `customs_parameter` varchar(100) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `isofficial` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是正式',
  `product_makingpartid` int(11) DEFAULT NULL,
  `product_makingpartname` varchar(100) DEFAULT NULL,
  `product_createtime` datetime DEFAULT NULL,
  `product_modifytime` datetime DEFAULT NULL,
  `product_dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是删除',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', 'nike', '空军一号', '鞋子1', '鞋子01', 'shows1', '篮球鞋', '0.1', '123456', '8888801', '大小 颜色', '40码 白色', '中国', '0', '1', '徐张悦', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '0');
INSERT INTO `product` VALUES ('2', '1', 'nike', '空军二号', '鞋子2', '鞋子02', 'shows2', '篮球鞋', '0.1', '123457', '8888802', '大小 颜色', '41码 白色', '中国', '1', '1', '徐张悦', '2018-06-14 00:08:00', '2018-06-14 00:08:00', '0');
INSERT INTO `product` VALUES ('3', '1', 'nike', '空军三号', '鞋子3', '鞋子03', 'shows3', '篮球鞋', '0.1', '123458', '8888803', '大小 颜色', '42码 白色', '中国', '0', '1', '徐张悦', '2018-06-15 00:08:00', '2018-06-15 00:08:00', '0');
INSERT INTO `product` VALUES ('4', '1', 'nike', '空军四号', '鞋子4', '鞋子04', 'shows4', '篮球鞋', '0.1', '123459', '8888804', '大小 颜色', '43码 白色', '中国', '0', '1', '徐张悦', '2018-06-16 00:08:00', '2018-06-16 00:08:00', '0');

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
  `supplier_makingpartid` int(11) DEFAULT NULL,
  `supplier_makingpartname` varchar(100) DEFAULT NULL,
  `supplier_createtime` datetime DEFAULT NULL,
  `supplier_modifytime` datetime DEFAULT NULL,
  `supplier_dr` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0  ， 1是删除',
  `supplier_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `supplier_makingpartid` (`supplier_makingpartid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'puettmann KG-1', '德国', 'puettmann.com', 'Tom', '+49-10086', '+49-10086', '', 'puettmann@qq.com', 'Tom', '+49-10086', '+49-10086', '', 'puettmann@qq.com', 'Tom', '+49-10086', '+49-10086', '', 'puettmann@qq.com', 'H001', '1', '徐张悦', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '0', '价格好');
INSERT INTO `supplier` VALUES ('2', 'Sauter-Cumulus GmbH', '德国', 'www.Sauter-Cumulus.de', 'Lily', '+49-10085', '+49-10085', '', 'Sauter-Cumulus@qq.com', 'Lily', '+49-10085', '+49-10085', '', 'Sauter-Cumulus@qq.com', 'Lily', '+49-10085', '+49-10085', '', 'Sauter-Cumulus@qq.com', '', '1', '徐张悦', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '0', '禁止询价');
INSERT INTO `supplier` VALUES ('3', 'microsonic GmbH', '德国', 'www.microsonic.de', 'Susa', '+49-10000', '+49-10000', '', 'microsonic@qq.com', 'Susa', '+49-10000', '+49-10000', '', 'microsonic@qq.com', 'Susa', '+49-10000', '+49-10000', '', 'microsonic@qq.com', '', '1', '徐张悦', '2018-06-13 00:08:00', '2018-06-13 00:08:00', '0', '无');
