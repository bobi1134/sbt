/*
Navicat MySQL Data Transfer

Source Server         : 陈梅的云数据库
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : data_sbt

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-21 17:57:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bus
-- ----------------------------
DROP TABLE IF EXISTS `t_bus`;
CREATE TABLE `t_bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `time` time DEFAULT NULL COMMENT '发车时间',
  `start` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '发站',
  `end` varchar(3) COLLATE utf8_bin DEFAULT NULL COMMENT '到站',
  `type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '车型',
  `runtime` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '运行时长',
  `price` double DEFAULT NULL COMMENT '票价',
  `surplus` int(11) DEFAULT NULL COMMENT '余票',
  `date` int(11) DEFAULT NULL COMMENT '所属日期,1:今天,2:明天,3:后天,4:大后天,一次类推',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_bus
-- ----------------------------
INSERT INTO `t_bus` VALUES ('1', '07:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '0', '1');
INSERT INTO `t_bus` VALUES ('2', '08:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '0', '1');
INSERT INTO `t_bus` VALUES ('3', '08:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '9', '1');
INSERT INTO `t_bus` VALUES ('4', '09:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '10', '1');
INSERT INTO `t_bus` VALUES ('5', '10:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '13', '1');
INSERT INTO `t_bus` VALUES ('6', '12:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '13', '1');
INSERT INTO `t_bus` VALUES ('7', '13:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '13', '1');
INSERT INTO `t_bus` VALUES ('8', '14:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('9', '15:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('10', '16:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('11', '07:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('12', '08:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('13', '08:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('14', '09:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('15', '10:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('16', '12:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('17', '13:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('18', '14:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('19', '15:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('20', '16:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('21', '07:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('22', '08:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('23', '08:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('24', '09:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('25', '10:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('26', '12:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('27', '13:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('28', '14:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('29', '15:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('30', '16:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('31', '07:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('32', '08:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('33', '08:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('34', '09:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('35', '10:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('36', '12:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('37', '13:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('38', '14:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('39', '15:00:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('40', '16:30:00', '雅安', '温江', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('41', '07:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('42', '08:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('43', '08:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('44', '09:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('45', '10:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('46', '12:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('47', '13:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('48', '14:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('49', '15:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('50', '16:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '1');
INSERT INTO `t_bus` VALUES ('51', '07:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('52', '08:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('53', '08:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('54', '09:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('55', '10:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('56', '12:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('57', '13:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('58', '14:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('59', '15:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('60', '16:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '2');
INSERT INTO `t_bus` VALUES ('61', '07:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('62', '08:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('63', '08:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('64', '09:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('65', '10:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('66', '12:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('67', '13:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('68', '14:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('69', '15:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('70', '16:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '3');
INSERT INTO `t_bus` VALUES ('71', '07:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('72', '08:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('73', '08:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('74', '09:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('75', '10:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('76', '12:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('77', '13:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('78', '14:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('79', '15:00:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('80', '16:30:00', '温江', '雅安', '大型高一级', '2小时', '30', '15', '4');
INSERT INTO `t_bus` VALUES ('81', '07:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('82', '08:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('83', '08:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('84', '09:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('85', '10:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('86', '12:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('87', '13:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('88', '14:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('89', '15:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('90', '16:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('91', '07:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('92', '08:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('93', '08:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('94', '09:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('95', '10:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('96', '12:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('97', '13:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('98', '14:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('99', '15:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('100', '16:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('101', '07:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('102', '08:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('103', '08:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('104', '09:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('105', '10:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('106', '12:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('107', '13:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('108', '14:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('109', '15:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('110', '16:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('111', '07:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('112', '08:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('113', '08:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('114', '09:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('115', '10:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('116', '12:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('117', '13:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('118', '14:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('119', '15:00:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('120', '16:30:00', '雅安', '都江堰', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('121', '07:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('122', '08:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('123', '08:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('124', '09:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('125', '10:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('126', '12:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('127', '13:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('128', '14:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('129', '15:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('130', '16:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '1');
INSERT INTO `t_bus` VALUES ('131', '07:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('132', '08:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('133', '08:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('134', '09:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('135', '10:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('136', '12:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('137', '13:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('138', '14:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('139', '15:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('140', '16:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '2');
INSERT INTO `t_bus` VALUES ('141', '07:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('142', '08:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('143', '08:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('144', '09:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('145', '10:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('146', '12:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('147', '13:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('148', '14:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('149', '15:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('150', '16:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '3');
INSERT INTO `t_bus` VALUES ('151', '07:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('152', '08:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('153', '08:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('154', '09:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('155', '10:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('156', '12:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('157', '13:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('158', '14:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('159', '15:00:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('160', '16:30:00', '都江堰', '雅安', '大型高一级', '3小时10分钟', '40', '15', '4');
INSERT INTO `t_bus` VALUES ('164', '22:03:54', null, null, null, null, '100', null, null);

-- ----------------------------
-- Table structure for t_configure
-- ----------------------------
DROP TABLE IF EXISTS `t_configure`;
CREATE TABLE `t_configure` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `linkname` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '超链接名称',
  `linkurl` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '超链接URL',
  `copyright` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '底部注册信息',
  `advanceorder` int(11) DEFAULT NULL COMMENT '提前几天预定',
  `type` int(11) DEFAULT NULL COMMENT '1:友情链接,2:资源下载,3:站点导航,4:注册信息,5:提前预定天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_configure
-- ----------------------------
INSERT INTO `t_configure` VALUES ('1', '四川农业大学', 'http://www.sicau.edu.cn/', null, null, '1');
INSERT INTO `t_configure` VALUES ('2', '川农教务处', 'http://jiaowu.sicau.edu.cn/', null, null, '1');
INSERT INTO `t_configure` VALUES ('3', '信息工程学院', 'http://xxgc.sicau.edu.cn/', null, null, '1');
INSERT INTO `t_configure` VALUES ('4', '百度', 'https://www.baidu.com/', null, null, '1');
INSERT INTO `t_configure` VALUES ('5', '腾讯', 'http://www.qq.com/', null, null, '1');
INSERT INTO `t_configure` VALUES ('6', '阿里', 'http://www.alibaba.com/', null, null, '1');
INSERT INTO `t_configure` VALUES ('7', '华为', 'http://consumer.huawei.com/', null, null, '1');
INSERT INTO `t_configure` VALUES ('8', '中兴', 'https://www.myzte.com/', null, null, '1');
INSERT INTO `t_configure` VALUES ('9', '小米', 'http://www.mi.com/', null, null, '1');
INSERT INTO `t_configure` VALUES ('10', 'C/C++', null, null, null, '2');
INSERT INTO `t_configure` VALUES ('11', 'Java', null, null, null, '2');
INSERT INTO `t_configure` VALUES ('12', 'PHP', null, null, null, '2');
INSERT INTO `t_configure` VALUES ('13', 'DIV+CSS', null, null, null, '2');
INSERT INTO `t_configure` VALUES ('14', 'HTML5+CSS3', null, null, null, '2');
INSERT INTO `t_configure` VALUES ('15', 'Go', null, null, null, '2');
INSERT INTO `t_configure` VALUES ('16', '查看车次', null, null, null, '3');
INSERT INTO `t_configure` VALUES ('17', '购买车票', null, null, null, '3');
INSERT INTO `t_configure` VALUES ('18', '人工服务', null, null, null, '3');
INSERT INTO `t_configure` VALUES ('19', '联系站长', null, null, null, '3');
INSERT INTO `t_configure` VALUES ('20', null, null, '©2016.10.26  Sichuan Agricultural University by Mr.x66', null, '4');
INSERT INTO `t_configure` VALUES ('21', null, null, null, '3', '5');
INSERT INTO `t_configure` VALUES ('22', '首页', null, null, null, '3');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` mediumtext COLLATE utf8_bin COMMENT '内容',
  `datetime` datetime DEFAULT NULL COMMENT '时间',
  `isread` int(11) DEFAULT NULL COMMENT '是否已读,1:未读 2:已读',
  `userId` int(11) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('10', '亲爱的admin，您好，你有一笔订单还未支付！', 0xE682A8E8B4ADE4B9B0E79A84E4BB8EE99B85E5AE89E5BC80E5BE80E6B8A9E6B19FEFBC8CE697B6E997B4E698AFEFBC9A323031362D31312D31332031333A30303A3030E79A84E8BDA6E7A5A8EFBC8CE8BF98E69CAAE5AE8CE68890E694AFE4BB98EFBC8CE8AFB7E58F8AE697B6E5AE8CE68890E694AFE4BB98EFBC8CE4BBA5E5858DE5BDB1E5938DE682A8E79A84E587BAE8A18CEFBC81, '2016-11-13 13:00:00', '2', '1');
INSERT INTO `t_message` VALUES ('11', '欢迎来到这里！', 0xE59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388E59388, '2016-11-23 16:06:27', '2', '1');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) DEFAULT NULL COMMENT '外键-用户',
  `busId` int(11) DEFAULT NULL COMMENT '外键-车次',
  `riderId` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '外键-乘车人',
  `money` double DEFAULT NULL COMMENT '订单金额',
  `datetime` datetime DEFAULT NULL COMMENT '乘车日期',
  `ispay` int(11) DEFAULT NULL COMMENT '1:未支付,2:已支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '1', '3', '2,30,', '60', '2016-11-12 00:00:00', '1');
INSERT INTO `t_order` VALUES ('2', '1', '3', '2,24,', '60', '2016-11-12 08:30:00', '1');
INSERT INTO `t_order` VALUES ('3', '1', '3', '24,30,', '60', '2016-11-12 08:30:00', '1');
INSERT INTO `t_order` VALUES ('4', '1', '4', '30,', '30', '2016-11-12 09:00:00', '1');
INSERT INTO `t_order` VALUES ('5', '1', '4', '24,', '30', '2016-11-12 09:00:00', '1');
INSERT INTO `t_order` VALUES ('6', '1', '5', '24,30,', '60', '2016-11-13 10:00:00', '1');
INSERT INTO `t_order` VALUES ('7', '1', '6', '24,30,', '60', '2016-11-13 12:00:00', '1');
INSERT INTO `t_order` VALUES ('8', '1', '3', '2,24,', '60', '2016-11-13 08:30:00', '1');
INSERT INTO `t_order` VALUES ('9', '1', '3', '2,30,', '60', '2016-11-13 08:30:00', '1');
INSERT INTO `t_order` VALUES ('10', '21', '4', '31,', '30', '2016-11-13 09:00:00', '1');
INSERT INTO `t_order` VALUES ('11', '1', '7', '24,', '30', '2016-11-13 13:00:00', '1');
INSERT INTO `t_order` VALUES ('12', '1', '4', '2,24,', '60', '2016-11-13 09:00:00', '1');
INSERT INTO `t_order` VALUES ('13', '1', '7', '24,', '30', '2016-11-13 13:00:00', '1');

-- ----------------------------
-- Table structure for t_rider
-- ----------------------------
DROP TABLE IF EXISTS `t_rider`;
CREATE TABLE `t_rider` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '乘车人姓名',
  `idcard` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '乘车人身份证',
  `userId` int(11) DEFAULT NULL COMMENT '外键-所属用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_rider
-- ----------------------------
INSERT INTO `t_rider` VALUES ('2', '罗泽东', '430421197710177896', '1');
INSERT INTO `t_rider` VALUES ('24', '刘林', '430421197710177894', '1');
INSERT INTO `t_rider` VALUES ('29', '陈梅', '555555555555555577', '20');
INSERT INTO `t_rider` VALUES ('30', '陈梅', '430421197710177896', '1');
INSERT INTO `t_rider` VALUES ('31', '美女', '430421197710177896', '21');
INSERT INTO `t_rider` VALUES ('32', '666', '511511165500001916', '20');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `img` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '头像地址',
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `role` int(11) DEFAULT NULL COMMENT '角色,1:管理员,2:普通会员',
  `active` int(1) DEFAULT NULL COMMENT '是否激活,1:已激活,2:未激活',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', 'imgs/head.jpg', '761328790@qq.com', '1', '1');
INSERT INTO `t_user` VALUES ('20', 'test_1', '96e79218965eb72c92a549dd5a330112', 'imgs/head.jpg', '761328790@qq.com', '2', '1');
INSERT INTO `t_user` VALUES ('21', 'test_2', '96e79218965eb72c92a549dd5a330112', 'imgs/head.jpg', '761328790@qq.com', '2', '1');
INSERT INTO `t_user` VALUES ('22', 'xialiangbo', 'e10adc3949ba59abbe56e057f20f883e', 'imgs/head.jpg', '1739398946@qq.com', '2', '1');
INSERT INTO `t_user` VALUES ('23', 'hrhr111', '96e79218965eb72c92a549dd5a330112', 'imgs/head.jpg', '761328790@qq.com', '2', '1');
INSERT INTO `t_user` VALUES ('24', 'chenmei', '25f9e794323b453885f5181f1b624d0b', 'imgs/head.jpg', '1138544296@qq.com', '2', '1');
INSERT INTO `t_user` VALUES ('25', 'chenmei1', '25f9e794323b453885f5181f1b624d0b', 'imgs/head.jpg', '1138544296@qq.om', '2', '2');
INSERT INTO `t_user` VALUES ('26', 'chenmei11', '25f9e794323b453885f5181f1b624d0b', 'imgs/head.jpg', '1138544296@qq.om', '2', '2');
INSERT INTO `t_user` VALUES ('27', 'chenmei111', '25f9e794323b453885f5181f1b624d0b', 'imgs/head.jpg', '1138544296@qq.om', '2', '2');
INSERT INTO `t_user` VALUES ('28', 'xialingb', '25f9e794323b453885f5181f1b624d0b', 'imgs/head.jpg', '1138544296@qq.om', '2', '1');
INSERT INTO `t_user` VALUES ('29', 'hhhhh', '96e79218965eb72c92a549dd5a330112', 'imgs/head.jpg', '761328790@qq.com', '2', '2');
INSERT INTO `t_user` VALUES ('30', 'kkkkkk', '96e79218965eb72c92a549dd5a330112', 'imgs/head.jpg', '761328790@qq.com', '2', '2');
