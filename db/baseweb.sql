/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : baseweb

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2018-05-24 22:29:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `d_id` bigint(20) NOT NULL,
  `d_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES ('1', '张三');
INSERT INTO `demo` VALUES ('2', '李四');
INSERT INTO `demo` VALUES ('3', '王五');
