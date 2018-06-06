/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : baseweb

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2018-05-29 17:06:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `d_id` bigint(20) NOT NULL,
  `d_name` varchar(255) DEFAULT NULL,
  `d_add_time` datetime DEFAULT NULL,
  `d_delete_state` int(11) DEFAULT NULL COMMENT '-1为已删除',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES ('1', '张三', '2018-05-25 15:25:33', '1');
INSERT INTO `demo` VALUES ('2', '李四', '2018-05-25 15:25:33', '1');
INSERT INTO `demo` VALUES ('3', '王五', '2018-05-25 15:25:33', '1');
INSERT INTO `demo` VALUES ('449595126298181632', '王八', '2018-05-25 15:30:31', '1');
