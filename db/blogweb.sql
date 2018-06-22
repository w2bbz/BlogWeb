/*
Navicat MySQL Data Transfer

Source Server         : blog
Source Server Version : 50173
Source Host           : blog.l2you.com:3366
Source Database       : blogweb

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-06-22 16:13:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for baidu_mark_api
-- ----------------------------
DROP TABLE IF EXISTS `baidu_mark_api`;
CREATE TABLE `baidu_mark_api` (
  `id` bigint(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ak` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `exp` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `delete_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of baidu_mark_api
-- ----------------------------
INSERT INTO `baidu_mark_api` VALUES ('1', 'API服务器账号1', '13257919167', 'woailuo0', 'xWsV6O5rGs2u8NuK4o4tbFLCPTgRlReO', 'http://api.map.baidu.com/location/ip', '{\"ip\":\"\",\"ak\":\"xWsV6O5rGs2u8NuK4o4tbFLCPTgRlReO\",\"coor\":\"\"}', 'GET', null, '2018-06-13 18:50:03', '1', '1');

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role` (
  `id` bigint(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `delete_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role
-- ----------------------------
INSERT INTO `base_role` VALUES ('1', 'admin', '管理员', '1', '1');

-- ----------------------------
-- Table structure for base_role_user
-- ----------------------------
DROP TABLE IF EXISTS `base_role_user`;
CREATE TABLE `base_role_user` (
  `id` bigint(11) NOT NULL,
  `user_id` bigint(11) DEFAULT NULL,
  `role_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role_user
-- ----------------------------
INSERT INTO `base_role_user` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` bigint(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `state` int(255) DEFAULT NULL,
  `delete_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
INSERT INTO `base_user` VALUES ('1', '夏至', 'zhouwenjian', 'zhouwenjian', '2018-06-05 23:19:51', '1', '1');

-- ----------------------------
-- Table structure for blog_work_record
-- ----------------------------
DROP TABLE IF EXISTS `blog_work_record`;
CREATE TABLE `blog_work_record` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1、工作日志，2、个人日志',
  `record_time` datetime DEFAULT NULL,
  `content` text,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_state` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_work_record
-- ----------------------------
INSERT INTO `blog_work_record` VALUES ('453953434224164864', '日志记录测试版1.0发布', '1', '2018-06-06 16:08:51', '1、日志记录测试版发布\n2、现有功能满足仅用于日志记录', '27.17.164.107', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-06 16:08:52', null, '1');
INSERT INTO `blog_work_record` VALUES ('454100374907781120', '日志管理升级', '1', '2018-06-07 01:51:22', '<p>1、更新部分接口</p><p>2、美化、实现部分页面功能</p>', '27.17.164.107', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-07 01:52:46', null, '1');
INSERT INTO `blog_work_record` VALUES ('454446563205316608', '工作日志', '1', '2018-06-08 00:47:19', '<p>1、订单处理中心goods表新增广宣类型</p><p>2、jenkins学习</p>', '27.17.164.107', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-08 00:48:23', null, '1');
INSERT INTO `blog_work_record` VALUES ('454448273424384000', '个人日志', '2', '2018-06-08 00:52:10', '<p>1、武汉户口申请</p><p>2、日志系统v1.01，接口使用Restful风格</p><p>3、计划本周五宜昌三峡游玩</p>', '27.17.164.107', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-08 00:55:11', null, '1');
INSERT INTO `blog_work_record` VALUES ('454705662476156928', '物料类型同步', '1', '2018-06-08 17:56:33', '<p>1、商品物料同步goods到fx_base_goods</p><p>2、更改goods_ext5为物料类型（类型1+类型2）</p>', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-08 17:57:57', null, '1');
INSERT INTO `blog_work_record` VALUES ('455806827645370368', '工作日志', '1', '2018-06-11 18:51:38', '<p>1、完成养车店/总部物料同步</p><p>2、拼团活动开始构建</p>', '171.43.160.75', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-11 18:53:36', null, '1');
INSERT INTO `blog_work_record` VALUES ('455807374930739200', '网站升级v1.02', '2', '2018-06-11 18:53:23', '<p>1、日志记录页面构建</p><p>2、修改bug</p><p>3、完成日志网站升级</p>', '171.43.160.75', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-11 18:55:46', null, '1');
INSERT INTO `blog_work_record` VALUES ('456159916080496640', '工作记录', '1', '2018-06-12 18:15:30', '<p>1、开始构建拼团活动列表</p>', '171.43.160.75', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-12 18:16:39', null, '1');
INSERT INTO `blog_work_record` VALUES ('456160999066566656', '个人记录', '2', '2018-06-12 18:16:21', '<p>1、个人SVN搭建 svn://svn.l2you.com</p><p>2、准迁证与户口本已取回</p>', '171.43.160.75', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-12 18:20:57', null, '1');
INSERT INTO `blog_work_record` VALUES ('456562925549649920', '工作日志', '1', '2018-06-13 20:56:29', '<p>1、完成拼团规则读取，完成进度约40%</p>', '171.43.160.75', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-13 20:58:03', null, '1');
INSERT INTO `blog_work_record` VALUES ('456563355620999168', '个人日志', '2', '2018-06-13 20:57:42', '<p>1、修改日志管理地址获取(okhttp、百度api、fastjson)</p><p>2、本周五请假办理户口</p>', '171.43.160.75', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '1', '2018-06-13 20:59:46', null, '1');
INSERT INTO `blog_work_record` VALUES ('457650296303124480', '修改ip获取接口', '2', '2018-06-16 20:56:41', '<p>1、完成百度地址接口从数据库获取</p><p>2、下一步将进行加入<u>缓存技术</u></p>', '117.153.31.83', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', '1', '2018-06-16 20:58:53', null, '1');
INSERT INTO `blog_work_record` VALUES ('458745512477065216', '工作日志', '1', '2018-06-19 21:29:49', '<p>1、完成拼团类目、拼团规则设置。</p><p>2、预计本周四内完成拼团活动后台设置</p>', '27.17.91.209', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '1', '2018-06-19 21:30:53', null, '1');
INSERT INTO `blog_work_record` VALUES ('459062227803045888', '工作记录', '1', '2018-06-20 18:27:53', '<p>1、完成拼团初步活动90% <u>时间控件bug</u></p><p>2、转正申请已取得</p>', '119.96.131.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', '1', '2018-06-20 18:29:24', null, '1');
INSERT INTO `blog_work_record` VALUES ('459078668937854976', '个人日志', '2', '2018-06-20 19:33:41', '1、完成ehcahe加入，<u>未成功</u>', '119.96.131.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', '1', '2018-06-20 19:34:43', null, '1');
INSERT INTO `blog_work_record` VALUES ('459426010035650560', '工作日志', '1', '2018-06-21 18:33:27', '<p>1、完成拼团活动（半成品）</p><p>2、明日开始做养车扫码关怀</p>', '119.96.131.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', '1', '2018-06-21 18:34:56', null, '1');
INSERT INTO `blog_work_record` VALUES ('459426336050511872', '个人日志', '2', '2018-06-21 18:34:28', '<p>1、已找到ehcahe无法生效原因。（同类方法不会被cache）</p><p>2、户口已入，15个工作日后领取</p>', '119.96.131.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134', '1', '2018-06-21 18:36:14', null, '1');

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
