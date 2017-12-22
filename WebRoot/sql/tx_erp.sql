/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : tx_erp

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2017-12-22 14:54:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `console_log`
-- ----------------------------
DROP TABLE IF EXISTS `console_log`;
CREATE TABLE `console_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `opt_type` varchar(100) NOT NULL,
  `opt_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `emp_id` int(11) NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of console_log
-- ----------------------------
INSERT INTO `console_log` VALUES ('2', '14', 'order_model', '审核订单', '2017-12-15 12:44:42', '1', '情况属实，审核通过');
INSERT INTO `console_log` VALUES ('3', '24', 'order_model', '审核订单', '2017-12-15 15:11:13', '1', '驳回');
INSERT INTO `console_log` VALUES ('4', '25', 'order_model', '审核订单', '2017-12-15 16:57:58', '1', 'xcvxc');
INSERT INTO `console_log` VALUES ('5', '21', 'order_model', '审核订单', '2017-12-19 14:50:58', '1', 'ggg');
INSERT INTO `console_log` VALUES ('6', '26', 'order_model', '审核订单', '2017-12-20 10:30:13', '1', 'ok');
INSERT INTO `console_log` VALUES ('7', '27', 'order_model', '审核订单', '2017-12-21 11:28:25', '4', '');
INSERT INTO `console_log` VALUES ('8', '22', 'order_model', '审核订单', '2017-12-21 11:36:06', '12', '采购吧');

-- ----------------------------
-- Table structure for `dep`
-- ----------------------------
DROP TABLE IF EXISTS `dep`;
CREATE TABLE `dep` (
  `dep_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dep
-- ----------------------------
INSERT INTO `dep` VALUES ('1', '会计部门', '010-8168122');
INSERT INTO `dep` VALUES ('2', '运输部门', '010-8168123');
INSERT INTO `dep` VALUES ('4', '人力资源部门', '010-8168122');
INSERT INTO `dep` VALUES ('5', '销售部', '010-8168122');
INSERT INTO `dep` VALUES ('6', '财务部', '010-8168128');
INSERT INTO `dep` VALUES ('7', '总裁室', '010-8168126');
INSERT INTO `dep` VALUES ('8', '采购部门', '010-8168121');
INSERT INTO `dep` VALUES ('9', '仓储部', '0532-7942875');

-- ----------------------------
-- Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `emp_id` int(20) NOT NULL AUTO_INCREMENT,
  `dep_id` int(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '8', '张三', 'zhansan', '835540436@qq.com', '15010090634', '2', '长春', '2016-05-01', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `emp` VALUES ('2', '1', '管理员', 'admina', '835540436@qq.com', '15010090634', '1', '长春', '2016-05-04', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `emp` VALUES ('4', '8', '章子怡', 'zhangzi', '835540436@qq.com', '15010090634', '1', '长春', '2016-04-01', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `emp` VALUES ('5', '2', '李大勇', 'lidayong', '835540436@qq.com', '15010090634', '1', '', '2016-05-01', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `emp` VALUES ('6', '9', '张希希', 'zhangxi', '835540436@qq.com', '15010090634', '2', '长春二道', '2016-05-01', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `emp` VALUES ('7', '5', '李四', 'lisi123', '', '', '1', '', '2017-12-04', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `emp` VALUES ('11', '1', '任亮0', 'renliang0', 'renliangge@126.com', '9999', '1', '北京0', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('12', '2', '小明', 'xiaoming', 'renliangge@126.com', '', '1', '北京1', '2017-12-13', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `emp` VALUES ('13', '2', '任亮2', 'renliang2', 'renliangge@126.com', '9999', '1', '北京2', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('14', '2', '任亮3', 'renliang3', 'renliangge@126.com', '9999', '1', '北京3', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('15', '2', '任亮4', 'renliang4', 'renliangge@126.com', '9999', '1', '北京4', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('18', '4', '任亮7', 'renliang7', 'renliangge@126.com', '9999', '1', '北京7', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('19', '4', '任亮8', 'renliang8', 'renliangge@126.com', '9999', '1', '北京8', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('20', '4', '任亮9', 'renliang9', 'renliangge@126.com', '9999', '1', '北京9', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('22', '4', '任亮11', 'renliang11', 'renliangge@126.com', '9999', '1', '北京11', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('24', '1', '任亮13', 'renliang13', 'renliangge@126.com', '9999', '1', '北京13', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('25', '4', '任亮14', 'renliang14', 'renliangge@126.com', '9999', '1', '北京14', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('26', '1', '任亮15', 'renliang15', 'renliangge@126.com', '9999', '1', '北京15', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('27', '4', '任亮16', 'renliang16', 'renliangge@126.com', '9999', '1', '北京16', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('28', '1', '任亮17', 'renliang17', 'renliangge@126.com', '9999', '1', '北京17', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('29', '1', '任亮18', 'renliang18', 'renliangge@126.com', '9999', '1', '北京18', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('30', '1', '任亮19', 'renliang19', 'renliangge@126.com', '9999', '1', '北京19', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('31', '1', '任亮20', 'renliang20', 'renliangge@126.com', '9999', '1', '北京20', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('32', '1', '任亮21', 'renliang21', 'renliangge@126.com', '9999', '1', '北京21', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('33', '1', '任亮22', 'renliang22', 'renliangge@126.com', '9999', '1', '北京22', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('34', '1', '任亮23', 'renliang23', 'renliangge@126.com', '9999', '1', '北京23', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('35', '1', '任亮24', 'renliang24', 'renliangge@126.com', '9999', '1', '北京24', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('36', '1', '任亮25', 'renliang25', 'renliangge@126.com', '9999', '1', '北京25', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('37', '1', '任亮26', 'renliang26', 'renliangge@126.com', '9999', '1', '北京26', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('38', '1', '任亮27', 'renliang27', 'renliangge@126.com', '9999', '1', '北京27', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('39', '1', '任亮28', 'renliang28', 'renliangge@126.com', '9999', '1', '北京28', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('40', '1', '任亮29', 'renliang29', 'renliangge@126.com', '9999', '1', '北京29', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('41', '1', '任亮30', 'renliang30', 'renliangge@126.com', '9999', '1', '北京30', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('42', '1', '任亮31', 'renliang31', 'renliangge@126.com', '9999', '1', '北京31', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('43', '1', '任亮32', 'renliang32', 'renliangge@126.com', '9999', '1', '北京32', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('44', '1', '任亮33', 'renliang33', 'renliangge@126.com', '9999', '1', '北京33', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('45', '1', '任亮34', 'renliang34', 'renliangge@126.com', '9999', '1', '北京34', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('46', '1', '任亮35', 'renliang35', 'renliangge@126.com', '9999', '1', '北京35', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('47', '1', '任亮36', 'renliang36', 'renliangge@126.com', '9999', '1', '北京36', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('48', '4', '任亮37', 'renliang37', 'renliangge@126.com', '9999', '1', '北京37', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('49', '4', '任亮38', 'renliang38', 'renliangge@126.com', '9999', '1', '北京38', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('51', '2', '任亮40', 'renliang40', 'renliangge@126.com', '9999', '1', '北京40', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('52', '1', '任亮41', 'renliang41', 'renliangge@126.com', '9999', '1', '北京41', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('53', '5', '任亮42', 'renliang42', 'renliangge@126.com', '9999', '1', '北京42', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('54', '4', '任亮43', 'renliang43', 'renliangge@126.com', '9999', '1', '北京43', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('56', '2', '任亮45', 'renliang45', 'renliangge@126.com', '9999', '1', '北京45', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('58', '5', '任亮47', 'renliang47', 'renliangge@126.com', '9999', '1', '北京47', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('59', '4', '任亮48', 'renliang48', 'renliangge@126.com', '9999', '1', '北京48', '2017-12-13', '123');
INSERT INTO `emp` VALUES ('60', '7', '任亮', 'renliang', 'renliangge@126.com', '', '1', '北京49', '2017-12-13', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(20) NOT NULL AUTO_INCREMENT,
  `parent_menu_id` int(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_menu` int(1) DEFAULT NULL,
  `level` int(2) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=807 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', null, '系统菜单', null, '1', '1');
INSERT INTO `menu` VALUES ('2', '1', '商品管理', null, '1', '2');
INSERT INTO `menu` VALUES ('3', '1', '采购管理', null, '1', '2');
INSERT INTO `menu` VALUES ('4', '1', '销售管理', null, '1', '2');
INSERT INTO `menu` VALUES ('5', '1', '商品运输', null, '1', '2');
INSERT INTO `menu` VALUES ('6', '1', '仓库管理', null, '1', '2');
INSERT INTO `menu` VALUES ('7', '1', '报表中心', null, '1', '2');
INSERT INTO `menu` VALUES ('8', '1', '基础维护', null, '1', '2');
INSERT INTO `menu` VALUES ('201', '2', '供应商', 'supplier_list', '1', '3');
INSERT INTO `menu` VALUES ('202', '2', '商品类别', 'productType_list.action', '1', '3');
INSERT INTO `menu` VALUES ('203', '2', '商品', 'product_list.action', '1', '3');
INSERT INTO `menu` VALUES ('301', '3', '采购订单', 'orderModel_list?query.orderType=1&query.orderState=1', '1', '3');
INSERT INTO `menu` VALUES ('302', '3', '采购退货', '', '1', '3');
INSERT INTO `menu` VALUES ('303', '3', '采购审批', 'orderModel_checklist?query.orderType=1&query.orderState=1', '1', '3');
INSERT INTO `menu` VALUES ('401', '4', '销售订单', null, '1', '3');
INSERT INTO `menu` VALUES ('402', '4', '销售退货', null, '1', '3');
INSERT INTO `menu` VALUES ('403', '4', '销售审批', null, '1', '3');
INSERT INTO `menu` VALUES ('501', '5', '运输任务查询', 'assignTask_tasks?query.orderType=2&query.orderState=1', '1', '3');
INSERT INTO `menu` VALUES ('502', '5', '运输任务指派', 'assignTask_taskList?query.orderType=1&query.orderState=2', '1', '3');
INSERT INTO `menu` VALUES ('601', '6', '库存查询', 'store_storeList', '1', '3');
INSERT INTO `menu` VALUES ('602', '6', '入库', 'assignTask_inList?query.orderType=3&query.orderState=1', '1', '3');
INSERT INTO `menu` VALUES ('603', '6', '出库', 'assignTask_inList?query.orderType=3&query.orderState=1', '1', '3');
INSERT INTO `menu` VALUES ('604', '6', '仓库操作明细', null, '1', '3');
INSERT INTO `menu` VALUES ('701', '7', '进货报表', 'bill_listBuyBill.action', '1', '3');
INSERT INTO `menu` VALUES ('702', '7', '销售报表', null, '1', '3');
INSERT INTO `menu` VALUES ('703', '7', '仓库报表', null, '1', '3');
INSERT INTO `menu` VALUES ('801', '8', '部门维护', 'dep_list.action', '1', '3');
INSERT INTO `menu` VALUES ('802', '8', '员工维护', 'emp_list.action', '1', '3');
INSERT INTO `menu` VALUES ('803', '8', '角色维护', 'role_list.action', '1', '3');
INSERT INTO `menu` VALUES ('804', '8', '资源维护', 'resource_list.action', '1', '3');
INSERT INTO `menu` VALUES ('805', '8', '菜单维护', 'menu_list.action', '1', '3');
INSERT INTO `menu` VALUES ('806', '8', '仓库管理', 'store_list.action', '1', '3');

-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(20) NOT NULL AUTO_INCREMENT,
  `detail_num` int(20) DEFAULT NULL,
  `detail_price` double(10,2) DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  `order_id` varchar(20) DEFAULT NULL,
  `surplus` int(10) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('21', '1', '1.00', '1', '13', '1');
INSERT INTO `order_detail` VALUES ('22', '1', '3.00', '3', '14', '1');
INSERT INTO `order_detail` VALUES ('23', '1', '1.00', '1', '15', '0');
INSERT INTO `order_detail` VALUES ('28', '11', '11.00', '1', '18', '0');
INSERT INTO `order_detail` VALUES ('29', '10', '1.00', '1', '19', '0');
INSERT INTO `order_detail` VALUES ('30', '10', '5.00', '5', '19', '0');
INSERT INTO `order_detail` VALUES ('31', '10', '30.00', '3', '19', '0');
INSERT INTO `order_detail` VALUES ('32', '100', '5.00', '5', '20', '97');
INSERT INTO `order_detail` VALUES ('33', '100', '1.00', '1', '20', '100');
INSERT INTO `order_detail` VALUES ('34', '100', '3.00', '3', '20', '100');
INSERT INTO `order_detail` VALUES ('35', '100', '2.00', '2', '20', '100');
INSERT INTO `order_detail` VALUES ('36', '200', '1.00', '1', '21', '160');
INSERT INTO `order_detail` VALUES ('37', '200', '5.00', '5', '21', '0');
INSERT INTO `order_detail` VALUES ('38', '200', '3.00', '3', '21', '0');
INSERT INTO `order_detail` VALUES ('39', '200', '2.00', '2', '21', '0');
INSERT INTO `order_detail` VALUES ('40', '6', '100.00', '4', '22', null);
INSERT INTO `order_detail` VALUES ('41', '1', '120.00', '6', '22', null);
INSERT INTO `order_detail` VALUES ('42', '1', '3.00', '3', '23', null);
INSERT INTO `order_detail` VALUES ('43', '1', '1.00', '1', '23', null);
INSERT INTO `order_detail` VALUES ('44', '130', '3.00', '3', '24', null);
INSERT INTO `order_detail` VALUES ('45', '100', '5.00', '5', '24', null);
INSERT INTO `order_detail` VALUES ('46', '34', '3.00', '3', '25', '34');
INSERT INTO `order_detail` VALUES ('47', '111', '1.00', '1', '25', '111');
INSERT INTO `order_detail` VALUES ('48', '100', '100.00', '4', '26', '0');
INSERT INTO `order_detail` VALUES ('49', '100', '120.00', '6', '26', '0');
INSERT INTO `order_detail` VALUES ('50', '1', '100.00', '4', '27', '0');
INSERT INTO `order_detail` VALUES ('51', '1', '120.00', '6', '27', '0');

-- ----------------------------
-- Table structure for `order_model`
-- ----------------------------
DROP TABLE IF EXISTS `order_model`;
CREATE TABLE `order_model` (
  `order_id` int(20) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(30) DEFAULT NULL,
  `creater` int(20) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `checker` int(20) DEFAULT NULL,
  `check_time` date DEFAULT NULL,
  `completer` int(20) DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `order_type` int(1) DEFAULT NULL,
  `order_state` int(3) DEFAULT NULL,
  `total_num` int(11) DEFAULT NULL,
  `total_price` double(10,2) DEFAULT NULL,
  `supplier_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_model
-- ----------------------------
INSERT INTO `order_model` VALUES ('13', '1463588120593636', '2', '2016-05-19', '2', null, null, null, '1', '1', '1', '1.00', '1');
INSERT INTO `order_model` VALUES ('14', '1463588236063616', '2', '2016-05-19', '1', '2017-12-15', '1', null, '2', '3', '1', '3.00', '1');
INSERT INTO `order_model` VALUES ('15', '1463588259890905', '2', '2016-05-19', '2', '2016-05-23', '2', null, '1', '1', '1', '1.00', '1');
INSERT INTO `order_model` VALUES ('18', '1463673410134972', '2', '2016-05-19', '2', '2016-05-21', '2', null, '1', '1', '11', '121.00', '1');
INSERT INTO `order_model` VALUES ('19', '1463711664215440', '2', '2016-05-20', '2', '2016-05-21', '13', null, '2', '3', '30', '360.00', '1');
INSERT INTO `order_model` VALUES ('20', '1465468290270105', '2', '2016-06-09', '2', '2016-06-10', '6', null, '1', '3', '400', '1100.00', '1');
INSERT INTO `order_model` VALUES ('21', '1465488343016669', '2', '2016-06-10', '1', '2017-12-19', '1', '2017-12-19', '3', '2', '800', '2200.00', '1');
INSERT INTO `order_model` VALUES ('22', '20171214171603113', '1', '2017-12-14', '12', '2017-12-21', null, null, '1', '2', '7', '720.00', '4');
INSERT INTO `order_model` VALUES ('23', '20171215110428995', '1', '2017-12-15', '1', '2017-12-15', '1', null, '2', '3', '2', '4.00', '9');
INSERT INTO `order_model` VALUES ('24', '20171215151042980', '1', '2017-12-15', '1', '2017-12-15', null, null, '1', '3', '230', '890.00', '9');
INSERT INTO `order_model` VALUES ('25', '20171215165744379', '1', '2017-12-15', '1', '2017-12-15', '1', '2017-12-18', '3', '1', '145', '213.00', '9');
INSERT INTO `order_model` VALUES ('26', '20171220102951114', '1', '2017-12-20', '1', '2017-12-20', '1', '2017-12-20', '3', '3', '200', '22000.00', '4');
INSERT INTO `order_model` VALUES ('27', '20171221112516734', '1', '2017-12-21', '4', '2017-12-21', '5', '2017-12-21', '3', '3', '2', '220.00', '4');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(20) NOT NULL AUTO_INCREMENT,
  `product_type_id` int(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `origin` varchar(30) DEFAULT NULL,
  `producer` varchar(30) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `in_price` double(10,2) DEFAULT NULL,
  `out_price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', '2016年新款男士休闲袜', '福建', '晋江总部厂', '双', '1.00', '200.00');
INSERT INTO `product` VALUES ('2', '2', '2016年新款男士休闲七分短裤', '福建', '晋江总部厂', '条', '2.00', '200.00');
INSERT INTO `product` VALUES ('3', '1', '丝袜', '福建', '福建晋江', '双', '3.00', '200.00');
INSERT INTO `product` VALUES ('4', '6', '2016年新款女士休闲上衣', '安徽', '晋江总部厂', '件', '100.00', '300.00');
INSERT INTO `product` VALUES ('5', '1', '2016年新款男士运动袜', '福建', '晋江总部厂', '双', '5.00', '50.00');
INSERT INTO `product` VALUES ('6', '6', '2016年春季新款男士休闲网鞋', '福建', '晋江总部厂', '双', '120.00', '200.00');

-- ----------------------------
-- Table structure for `product_type`
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `product_type_id` int(20) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('1', '9', '袜子');
INSERT INTO `product_type` VALUES ('2', '1', '短裤');
INSERT INTO `product_type` VALUES ('3', '2', '上衣');
INSERT INTO `product_type` VALUES ('4', '2', '鞋');
INSERT INTO `product_type` VALUES ('5', '1', '长筒牛仔裤');
INSERT INTO `product_type` VALUES ('6', '4', '鞋');
INSERT INTO `product_type` VALUES ('11', '4', '篮球');
INSERT INTO `product_type` VALUES ('13', '3', '鞋');

-- ----------------------------
-- Table structure for `relation_emp_role`
-- ----------------------------
DROP TABLE IF EXISTS `relation_emp_role`;
CREATE TABLE `relation_emp_role` (
  `relation_id` int(20) NOT NULL AUTO_INCREMENT,
  `emp_id` int(20) DEFAULT NULL,
  `role_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_emp_role
-- ----------------------------
INSERT INTO `relation_emp_role` VALUES ('9', '2', '1');
INSERT INTO `relation_emp_role` VALUES ('11', '59', '1');
INSERT INTO `relation_emp_role` VALUES ('12', '59', '2');
INSERT INTO `relation_emp_role` VALUES ('14', '60', '4');
INSERT INTO `relation_emp_role` VALUES ('16', '54', '6');
INSERT INTO `relation_emp_role` VALUES ('17', '1', '6');
INSERT INTO `relation_emp_role` VALUES ('18', '4', '5');
INSERT INTO `relation_emp_role` VALUES ('19', '5', '3');
INSERT INTO `relation_emp_role` VALUES ('21', '12', '8');
INSERT INTO `relation_emp_role` VALUES ('22', '6', '2');

-- ----------------------------
-- Table structure for `relation_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `relation_role_menu`;
CREATE TABLE `relation_role_menu` (
  `role_id` int(20) DEFAULT NULL,
  `menu_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_role_menu
-- ----------------------------
INSERT INTO `relation_role_menu` VALUES ('6', '301');
INSERT INTO `relation_role_menu` VALUES ('6', '3');
INSERT INTO `relation_role_menu` VALUES ('4', '302');
INSERT INTO `relation_role_menu` VALUES ('4', '4');
INSERT INTO `relation_role_menu` VALUES ('4', '803');
INSERT INTO `relation_role_menu` VALUES ('4', '403');
INSERT INTO `relation_role_menu` VALUES ('4', '601');
INSERT INTO `relation_role_menu` VALUES ('4', '806');
INSERT INTO `relation_role_menu` VALUES ('4', '8');
INSERT INTO `relation_role_menu` VALUES ('4', '301');
INSERT INTO `relation_role_menu` VALUES ('4', '805');
INSERT INTO `relation_role_menu` VALUES ('4', '703');
INSERT INTO `relation_role_menu` VALUES ('4', '201');
INSERT INTO `relation_role_menu` VALUES ('4', '3');
INSERT INTO `relation_role_menu` VALUES ('4', '602');
INSERT INTO `relation_role_menu` VALUES ('4', '501');
INSERT INTO `relation_role_menu` VALUES ('4', '303');
INSERT INTO `relation_role_menu` VALUES ('4', '5');
INSERT INTO `relation_role_menu` VALUES ('4', '604');
INSERT INTO `relation_role_menu` VALUES ('4', '702');
INSERT INTO `relation_role_menu` VALUES ('4', '203');
INSERT INTO `relation_role_menu` VALUES ('4', '802');
INSERT INTO `relation_role_menu` VALUES ('4', '801');
INSERT INTO `relation_role_menu` VALUES ('4', '804');
INSERT INTO `relation_role_menu` VALUES ('4', '6');
INSERT INTO `relation_role_menu` VALUES ('4', '402');
INSERT INTO `relation_role_menu` VALUES ('4', '401');
INSERT INTO `relation_role_menu` VALUES ('4', '7');
INSERT INTO `relation_role_menu` VALUES ('4', '701');
INSERT INTO `relation_role_menu` VALUES ('4', '603');
INSERT INTO `relation_role_menu` VALUES ('4', '202');
INSERT INTO `relation_role_menu` VALUES ('4', '2');
INSERT INTO `relation_role_menu` VALUES ('4', '502');
INSERT INTO `relation_role_menu` VALUES ('7', '203');
INSERT INTO `relation_role_menu` VALUES ('7', '201');
INSERT INTO `relation_role_menu` VALUES ('7', '202');
INSERT INTO `relation_role_menu` VALUES ('7', '2');
INSERT INTO `relation_role_menu` VALUES ('8', '502');
INSERT INTO `relation_role_menu` VALUES ('8', '5');
INSERT INTO `relation_role_menu` VALUES ('5', '3');
INSERT INTO `relation_role_menu` VALUES ('5', '303');
INSERT INTO `relation_role_menu` VALUES ('3', '501');
INSERT INTO `relation_role_menu` VALUES ('3', '5');
INSERT INTO `relation_role_menu` VALUES ('2', '603');
INSERT INTO `relation_role_menu` VALUES ('2', '601');
INSERT INTO `relation_role_menu` VALUES ('2', '602');
INSERT INTO `relation_role_menu` VALUES ('2', '6');
INSERT INTO `relation_role_menu` VALUES ('2', '604');
INSERT INTO `relation_role_menu` VALUES ('9', '402');
INSERT INTO `relation_role_menu` VALUES ('9', '401');
INSERT INTO `relation_role_menu` VALUES ('9', '4');
INSERT INTO `relation_role_menu` VALUES ('9', '403');
INSERT INTO `relation_role_menu` VALUES ('10', '402');
INSERT INTO `relation_role_menu` VALUES ('10', '401');
INSERT INTO `relation_role_menu` VALUES ('10', '4');
INSERT INTO `relation_role_menu` VALUES ('11', '702');
INSERT INTO `relation_role_menu` VALUES ('11', '701');
INSERT INTO `relation_role_menu` VALUES ('11', '7');
INSERT INTO `relation_role_menu` VALUES ('11', '703');
INSERT INTO `relation_role_menu` VALUES ('5', '302');
INSERT INTO `relation_role_menu` VALUES ('5', '301');
INSERT INTO `relation_role_menu` VALUES ('8', '501');

-- ----------------------------
-- Table structure for `relation_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `relation_role_resource`;
CREATE TABLE `relation_role_resource` (
  `relation_id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) DEFAULT NULL,
  `resource_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relation_role_resource
-- ----------------------------
INSERT INTO `relation_role_resource` VALUES ('7', '3', '2');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '员工添加', 'cn.txjava.erp.action.EmpAction.input');
INSERT INTO `resource` VALUES ('2', '员工删除', 'cn.txjava.erp.action.EmpAction.delete');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '经理', '000');
INSERT INTO `role` VALUES ('2', '仓库管理员', '001');
INSERT INTO `role` VALUES ('3', '运输员', '002');
INSERT INTO `role` VALUES ('4', '超级管理员', '003');
INSERT INTO `role` VALUES ('5', '采购审核员', '004');
INSERT INTO `role` VALUES ('6', '采购员', '005');
INSERT INTO `role` VALUES ('7', '商品管理员', '006');
INSERT INTO `role` VALUES ('8', '运输管理员', '007');
INSERT INTO `role` VALUES ('9', '销售管理员', '008');
INSERT INTO `role` VALUES ('10', '销售员', '009');
INSERT INTO `role` VALUES ('11', '报表管理员', '010');

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(20) NOT NULL AUTO_INCREMENT,
  `stockman` int(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '2', '服装仓库', '北京亦庄园');
INSERT INTO `store` VALUES ('2', '1', '电子仓库', '北京中关村');
INSERT INTO `store` VALUES ('3', '1', '食品仓库', '北京回龙观');
INSERT INTO `store` VALUES ('4', '2', '贵金属仓库', '北京朝阳区');
INSERT INTO `store` VALUES ('5', '7', '服装仓库', '长春高新区');

-- ----------------------------
-- Table structure for `store_detail`
-- ----------------------------
DROP TABLE IF EXISTS `store_detail`;
CREATE TABLE `store_detail` (
  `detail_id` int(20) NOT NULL AUTO_INCREMENT,
  `store_id` int(20) DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '仓库明细中已经存储的商品量',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store_detail
-- ----------------------------
INSERT INTO `store_detail` VALUES ('1', '1', '5', '213');
INSERT INTO `store_detail` VALUES ('2', '1', '3', '210');
INSERT INTO `store_detail` VALUES ('3', '1', '1', '252');
INSERT INTO `store_detail` VALUES ('5', '1', '2', '200');
INSERT INTO `store_detail` VALUES ('7', '2', '6', '100');
INSERT INTO `store_detail` VALUES ('8', '1', '4', '100');
INSERT INTO `store_detail` VALUES ('9', '3', '4', '1');
INSERT INTO `store_detail` VALUES ('10', '3', '6', '1');

-- ----------------------------
-- Table structure for `store_log`
-- ----------------------------
DROP TABLE IF EXISTS `store_log`;
CREATE TABLE `store_log` (
  `log_id` int(20) NOT NULL AUTO_INCREMENT,
  `emp_id` int(20) DEFAULT NULL,
  `order_detail_id` int(20) DEFAULT NULL,
  `store_id` int(20) DEFAULT NULL,
  `oper_time` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '1��2��',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store_log
-- ----------------------------
INSERT INTO `store_log` VALUES ('1', '2', '30', '1', '2016-05-23', '5', '1');
INSERT INTO `store_log` VALUES ('2', '2', '30', '1', '2016-05-23', '1', '1');
INSERT INTO `store_log` VALUES ('3', '2', '30', '1', '2016-05-23', '1', '1');
INSERT INTO `store_log` VALUES ('4', '2', '30', '1', '2016-05-23', '1', '1');
INSERT INTO `store_log` VALUES ('5', '2', '30', '1', '2016-05-23', '1', '1');
INSERT INTO `store_log` VALUES ('6', '2', '30', '1', '2016-05-23', '1', '1');
INSERT INTO `store_log` VALUES ('7', '2', '30', '1', '2016-05-23', '0', '1');
INSERT INTO `store_log` VALUES ('8', '2', '30', '1', '2016-05-23', '0', '1');
INSERT INTO `store_log` VALUES ('9', '2', '30', '1', '2016-05-23', '0', '1');
INSERT INTO `store_log` VALUES ('10', '2', '30', '1', '2016-05-23', '0', '1');
INSERT INTO `store_log` VALUES ('11', '2', '31', '1', '2016-05-23', '10', '1');
INSERT INTO `store_log` VALUES ('12', '2', '29', '1', '2016-05-23', '10', '1');
INSERT INTO `store_log` VALUES ('13', '2', '28', '1', '2016-05-23', '11', '1');
INSERT INTO `store_log` VALUES ('14', '2', '32', '1', '2016-06-13', '1', '1');
INSERT INTO `store_log` VALUES ('15', '2', '32', '1', '2016-06-13', '1', '1');
INSERT INTO `store_log` VALUES ('16', '2', '32', '1', '2016-06-13', '1', '1');
INSERT INTO `store_log` VALUES ('17', '2', '23', '1', '2016-06-13', '1', '1');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplier_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `needs` int(1) DEFAULT NULL COMMENT '如果是1，那么是送货，如果是2那么是自提',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '福建七匹狼实业股份有限公司', '江苏', '李大明', '400-8868677', '2');
INSERT INTO `supplier` VALUES ('2', '安踏体育用品有限公司', '福建', '张全德', '86-595 8592 9999', '1');
INSERT INTO `supplier` VALUES ('3', '李宁（中国）体育用品有限公司', '北京市通州区中关村科技园区通州园光电一体基地兴光五街8号', '李建', '010-80800808', '2');
INSERT INTO `supplier` VALUES ('4', '鸿星尔克（中国）体育用品有限公司', '福建', '张大鹏', '18244016623', '1');
INSERT INTO `supplier` VALUES ('5', '鸿星尔克（中国）体育用品有限公司', '北京市通州区中关村科技园区通州园光电一体基地兴光五街8号', '李大刀', '18244014432', '2');
INSERT INTO `supplier` VALUES ('9', '安踏体育中国店', '北京优衣库南50米', '小屋子', '18395203784', '2');
