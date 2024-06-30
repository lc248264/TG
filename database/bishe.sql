/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : spbootpetb20521tgzyglpt

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2024-03-14 17:58:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `dianzan`
-- ----------------------------
DROP TABLE IF EXISTS `dianzan`;
CREATE TABLE `dianzan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户',
  `biaoid` int(11) NOT NULL DEFAULT '0' COMMENT '关联表id',
  `biao` varchar(50) NOT NULL COMMENT '关联表',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='点赞';

-- ----------------------------
-- Records of dianzan
-- ----------------------------
INSERT INTO `dianzan` VALUES ('16', '111', '2', 'tiezi', '往期XX志愿活动回顾', '2024-03-14 16:58:51');
INSERT INTO `dianzan` VALUES ('17', '111', '3', 'tiezi', '志愿活动回顾2', '2024-03-14 16:58:52');
INSERT INTO `dianzan` VALUES ('19', '222', '4', 'tiezi', '志愿活动回顾3', '2024-03-14 17:55:54');
INSERT INTO `dianzan` VALUES ('20', '222', '3', 'tiezi', '志愿活动回顾2', '2024-03-14 17:56:06');
INSERT INTO `dianzan` VALUES ('21', '222', '2', 'tiezi', '往期XX志愿活动回顾', '2024-03-14 17:56:18');
INSERT INTO `dianzan` VALUES ('22', '222', '1', 'tiezi', 'XX志愿活动回顾', '2024-03-14 17:56:19');
INSERT INTO `dianzan` VALUES ('24', '222', '5', 'tiezi', '志愿精彩回顾', '2024-03-14 17:57:07');

-- ----------------------------
-- Table structure for `diqu`
-- ----------------------------
DROP TABLE IF EXISTS `diqu`;
CREATE TABLE `diqu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diquming` varchar(50) NOT NULL COMMENT '地区名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='地区';

-- ----------------------------
-- Records of diqu
-- ----------------------------
INSERT INTO `diqu` VALUES ('1', 'A区');
INSERT INTO `diqu` VALUES ('2', 'B区');
INSERT INTO `diqu` VALUES ('3', 'C区');
INSERT INTO `diqu` VALUES ('4', 'D区');
INSERT INTO `diqu` VALUES ('5', 'E区');
INSERT INTO `diqu` VALUES ('6', 'F区');

-- ----------------------------
-- Table structure for `fankui`
-- ----------------------------
DROP TABLE IF EXISTS `fankui`;
CREATE TABLE `fankui` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `fankuineirong` text NOT NULL COMMENT '反馈内容',
  `fankuiren` varchar(50) NOT NULL COMMENT '反馈人',
  `zhuangtai` varchar(50) NOT NULL COMMENT '状态',
  `huifuneirong` text NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='反馈';

-- ----------------------------
-- Records of fankui
-- ----------------------------
INSERT INTO `fankui` VALUES ('1', 'xx', '15485698653', '反馈内容反馈内容反馈内容', '111', '已回复', '回复内容\n回复内容');
INSERT INTO `fankui` VALUES ('2', 'xx', '15485698656', '反馈内容反馈内容', '500', '已回复', '反馈内容');

-- ----------------------------
-- Table structure for `guanfangzuzhi`
-- ----------------------------
DROP TABLE IF EXISTS `guanfangzuzhi`;
CREATE TABLE `guanfangzuzhi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zhanghao` varchar(50) NOT NULL COMMENT '账号',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(10) NOT NULL COMMENT '性别',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='官方组织';

-- ----------------------------
-- Records of guanfangzuzhi
-- ----------------------------
INSERT INTO `guanfangzuzhi` VALUES ('1', '100', '100', '小红', '女', '15485698656', '/upload/67dafcff4c3d43aba0f60a4845ef0b26.png');
INSERT INTO `guanfangzuzhi` VALUES ('2', '200', '200', '小蓝', '女', '15485698654', '/upload/9623b06fb145427d8ada190302aabfe2.png');
INSERT INTO `guanfangzuzhi` VALUES ('3', '300', '300', '小黄', '男', '15465465586', '/upload/c36f3ea0c7d840ad9893531f130101dd.png');
INSERT INTO `guanfangzuzhi` VALUES ('4', '400', '400', '小王', '男', '15485665454', '/upload/ad6a609ae6a248f4ad389a558c58446a.png');
INSERT INTO `guanfangzuzhi` VALUES ('5', '500', '500', '王五', '女', '15485695652', '/upload/841a5c9996414a7ebc166000e73c93f7.png');

-- ----------------------------
-- Table structure for `huifu`
-- ----------------------------
DROP TABLE IF EXISTS `huifu`;
CREATE TABLE `huifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tieziid` int(10) unsigned NOT NULL COMMENT '帖子id',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `huifuneirong` text NOT NULL COMMENT '回复内容',
  `huifuren` varchar(50) NOT NULL COMMENT '回复人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  PRIMARY KEY (`id`),
  KEY `huifu_tieziid_index` (`tieziid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='回复';

-- ----------------------------
-- Records of huifu
-- ----------------------------
INSERT INTO `huifu` VALUES ('3', '2', '往期XX志愿活动回顾', 'qqq', '111', '2024-03-07 22:15:41');
INSERT INTO `huifu` VALUES ('4', '1', 'XX志愿活动回顾', 'sadasdasd', '111', '2024-03-07 22:15:50');
INSERT INTO `huifu` VALUES ('5', '4', '志愿活动回顾3', '很好', '222', '2024-03-07 23:57:01');
INSERT INTO `huifu` VALUES ('6', '3', '志愿活动回顾2', '不错', '222', '2024-03-07 23:57:11');
INSERT INTO `huifu` VALUES ('7', '2', '往期XX志愿活动回顾', '还可以吧', '222', '2024-03-07 23:57:20');
INSERT INTO `huifu` VALUES ('8', '2', '往期XX志愿活动回顾', '啊实打实', '111', '2024-03-14 15:40:55');
INSERT INTO `huifu` VALUES ('9', '4', '志愿活动回顾3', '好的', '111', '2024-03-14 15:47:52');
INSERT INTO `huifu` VALUES ('10', '4', '志愿活动回顾3', 'sss', '111', '2024-03-14 16:51:17');
INSERT INTO `huifu` VALUES ('11', '5', '志愿精彩回顾', '嗯嗯额', '222', '2024-03-14 17:51:29');
INSERT INTO `huifu` VALUES ('12', '5', '志愿精彩回顾', 'sss', '222', '2024-03-14 17:55:49');
INSERT INTO `huifu` VALUES ('13', '4', '志愿活动回顾3', 'ddd', '222', '2024-03-14 17:56:00');
INSERT INTO `huifu` VALUES ('14', '3', '志愿活动回顾2', 'ddd', '222', '2024-03-14 17:56:11');

-- ----------------------------
-- Table structure for `huodongshenhe`
-- ----------------------------
DROP TABLE IF EXISTS `huodongshenhe`;
CREATE TABLE `huodongshenhe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zuzhihuodongid` int(10) unsigned NOT NULL COMMENT '组织活动id',
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `huodongzhuti` varchar(255) NOT NULL COMMENT '活动主题',
  `kaishishijian` varchar(25) NOT NULL COMMENT '开始时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `huodongdizhi` varchar(50) NOT NULL COMMENT '活动地址',
  `huodongshizhang` int(11) NOT NULL DEFAULT '0' COMMENT '活动时长',
  `shenhe` varchar(50) NOT NULL COMMENT '审核',
  `yijian` text NOT NULL COMMENT '意见',
  PRIMARY KEY (`id`),
  KEY `huodongshenhe_zuzhihuodongid_index` (`zuzhihuodongid`),
  KEY `huodongshenhe_zuzhixinxiid_index` (`zuzhixinxiid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='活动审核';

-- ----------------------------
-- Records of huodongshenhe
-- ----------------------------
INSERT INTO `huodongshenhe` VALUES ('1', '3', '3', '蒙山青年志愿者协会', '300', 'XXx青年志愿活动', '2024-03-07 20:36:49', '2024-03-10 20:36:00', 'XXX地址', '71', '同意', '意见');
INSERT INTO `huodongshenhe` VALUES ('2', '2', '1', '广州市志愿者协会', '100', 'XX志愿活动', '2024-03-07 20:35:50', '2024-03-09 20:35:00', 'XXX地址', '47', '同意', '意见');
INSERT INTO `huodongshenhe` VALUES ('3', '1', '4', '神木青年志愿者协会', '400', '神木XX志愿活动', '2024-03-07 20:26:26', '2024-03-08 20:26:00', 'XX地址', '23', '同意', '意见');
INSERT INTO `huodongshenhe` VALUES ('4', '4', '2', '青年志愿者协会', '200', 'XXXX志愿协会活动', '2024-03-08 20:39:00', '2024-03-09 20:39:00', 'xx地址', '24', '同意', '意见');
INSERT INTO `huodongshenhe` VALUES ('5', '5', '5', '香香志愿者协会', '500', '香香组织XX志愿活动', '2024-03-07 23:40:55', '2024-03-09 23:40:00', 'XX地址', '47', '同意', '意见意见');
INSERT INTO `huodongshenhe` VALUES ('6', '6', '5', '香香志愿者协会', '500', 'XXX活动', '2024-03-14 17:39:53', '2024-03-19 17:39:53', 'XXXX活动地址', '120', '同意', '意见意见');

-- ----------------------------
-- Table structure for `huodongshenqing`
-- ----------------------------
DROP TABLE IF EXISTS `huodongshenqing`;
CREATE TABLE `huodongshenqing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zuzhihuodongid` int(10) unsigned NOT NULL COMMENT '组织活动id',
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `huodongzhuti` varchar(255) NOT NULL COMMENT '活动主题',
  `kaishishijian` varchar(25) NOT NULL COMMENT '开始时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `huodongshizhang` int(11) NOT NULL DEFAULT '0' COMMENT '活动时长',
  `huodongdizhi` varchar(50) NOT NULL COMMENT '活动地址',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `shenqingyuanyin` text NOT NULL COMMENT '申请原因',
  `shenqingzhuangtai` varchar(50) NOT NULL COMMENT '申请状态',
  `shenqingren` varchar(50) NOT NULL COMMENT '申请人',
  PRIMARY KEY (`id`),
  KEY `huodongshenqing_zuzhihuodongid_index` (`zuzhihuodongid`),
  KEY `huodongshenqing_zuzhixinxiid_index` (`zuzhixinxiid`),
  KEY `huodongshenqing_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='活动申请';

-- ----------------------------
-- Records of huodongshenqing
-- ----------------------------
INSERT INTO `huodongshenqing` VALUES ('1', '1', '4', '030720242884', '神木青年志愿者协会', '4', '400', '神木XX志愿活动', '2024-03-07 20:26:26', '2024-03-08 20:26:00', '23', 'XX地址', '张三', '15485698656', '阿三大苏打', '已结算', '111');
INSERT INTO `huodongshenqing` VALUES ('2', '5', '5', '030723396210', '香香志愿者协会', '6', '500', '香香组织XX志愿活动', '2024-03-07 23:40:55', '2024-03-09 23:40:00', '47', 'XX地址', 'xx', '15546545698', '备注', '已结算', '222');
INSERT INTO `huodongshenqing` VALUES ('3', '6', '5', '030723396210', '香香志愿者协会', '6', '500', 'XXX活动', '2024-03-14 17:39:53', '2024-03-19 17:39:53', '120', 'XXXX活动地址', '娜美', '15454646466', 'XXXXXXX', '已结算', '222');

-- ----------------------------
-- Table structure for `jiesuanshenhe`
-- ----------------------------
DROP TABLE IF EXISTS `jiesuanshenhe`;
CREATE TABLE `jiesuanshenhe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jiesuanzhiyuanid` int(10) unsigned NOT NULL COMMENT '结算志愿id',
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `zuzhihuodongid` int(10) unsigned NOT NULL COMMENT '组织活动id',
  `huodongshenqingid` int(10) unsigned NOT NULL COMMENT '活动申请id',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `huodongzhuti` varchar(255) NOT NULL COMMENT '活动主题',
  `huodongshizhang` int(11) NOT NULL DEFAULT '0' COMMENT '活动时长',
  `shenqingren` varchar(50) NOT NULL COMMENT '申请人',
  `wanchengqingkuang` varchar(50) NOT NULL COMMENT '完成情况',
  `shenhe` varchar(50) NOT NULL COMMENT '审核',
  `jiesuanshizhang` int(11) NOT NULL DEFAULT '0' COMMENT '结算时长',
  `beizhu` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `jiesuanshenhe_jiesuanzhiyuanid_index` (`jiesuanzhiyuanid`),
  KEY `jiesuanshenhe_zuzhixinxiid_index` (`zuzhixinxiid`),
  KEY `jiesuanshenhe_zuzhihuodongid_index` (`zuzhihuodongid`),
  KEY `jiesuanshenhe_huodongshenqingid_index` (`huodongshenqingid`),
  KEY `jiesuanshenhe_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='结算审核';

-- ----------------------------
-- Records of jiesuanshenhe
-- ----------------------------
INSERT INTO `jiesuanshenhe` VALUES ('3', '1', '4', '1', '1', '神木青年志愿者协会', '4', '400', '神木XX志愿活动', '23', '111', '优秀', '通过', '5', '备注');
INSERT INTO `jiesuanshenhe` VALUES ('4', '2', '5', '5', '2', '香香志愿者协会', '6', '500', '香香组织XX志愿活动', '47', '222', '良好', '通过', '4', '备注备注');
INSERT INTO `jiesuanshenhe` VALUES ('5', '3', '5', '6', '3', '香香志愿者协会', '6', '500', 'XXX活动', '120', '222', '良好', '通过', '100', '备注');

-- ----------------------------
-- Table structure for `jiesuanzhiyuan`
-- ----------------------------
DROP TABLE IF EXISTS `jiesuanzhiyuan`;
CREATE TABLE `jiesuanzhiyuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `huodongshenqingid` int(10) unsigned NOT NULL COMMENT '活动申请id',
  `zuzhihuodongid` int(10) unsigned NOT NULL COMMENT '组织活动id',
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `huodongzhuti` varchar(255) NOT NULL COMMENT '活动主题',
  `kaishishijian` varchar(25) NOT NULL COMMENT '开始时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `huodongshizhang` int(11) NOT NULL DEFAULT '0' COMMENT '活动时长',
  `shenqingren` varchar(50) NOT NULL COMMENT '申请人',
  `wanchengqingkuang` varchar(50) NOT NULL COMMENT '完成情况',
  `shenhezhuangtai` varchar(50) NOT NULL COMMENT '审核状态',
  `yijian` text NOT NULL COMMENT '意见',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `jiesuanzhiyuan_huodongshenqingid_index` (`huodongshenqingid`),
  KEY `jiesuanzhiyuan_zuzhihuodongid_index` (`zuzhihuodongid`),
  KEY `jiesuanzhiyuan_zuzhixinxiid_index` (`zuzhixinxiid`),
  KEY `jiesuanzhiyuan_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='结算志愿';

-- ----------------------------
-- Records of jiesuanzhiyuan
-- ----------------------------
INSERT INTO `jiesuanzhiyuan` VALUES ('1', '1', '1', '4', '神木青年志愿者协会', '4', '400', '神木XX志愿活动', '2024-03-07 20:26:26', '2024-03-08 20:26:00', '23', '111', '优秀', '已结算', '结算志愿备注', '2024-03-07 23:13:18');
INSERT INTO `jiesuanzhiyuan` VALUES ('2', '2', '5', '5', '香香志愿者协会', '6', '500', '香香组织XX志愿活动', '2024-03-07 23:40:55', '2024-03-09 23:40:00', '47', '222', '良好', '已结算', '依旧阿斯顿撒旦', '2024-03-07 23:53:57');
INSERT INTO `jiesuanzhiyuan` VALUES ('3', '3', '6', '5', '香香志愿者协会', '6', '500', 'XXX活动', '2024-03-14 17:39:53', '2024-03-19 17:39:53', '120', '222', '良好', '已结算', '意见意见意见', '2024-03-14 17:45:51');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '连接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='轮播图';

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '1', '/upload/8e139c34edf846ff98262eb7f65723a6.png', '#');
INSERT INTO `lunbotu` VALUES ('2', '2', '/upload/34ea39ca263e47b493c962effe31e0b0.png', '#');
INSERT INTO `lunbotu` VALUES ('3', '3', '/upload/5b95d257ea6f4257b91f422e690b12c1.png', '#');
INSERT INTO `lunbotu` VALUES ('4', '4', '/upload/3030462ca3164e51864b0c1491190a31.png', '#');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biao` varchar(50) NOT NULL COMMENT '表',
  `biaoid` int(11) NOT NULL DEFAULT '0' COMMENT '表id',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `pinglunneirong` text NOT NULL COMMENT '评论内容',
  `pinglunren` varchar(50) NOT NULL COMMENT '评论人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='评论';

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', 'zhiyuanqiang', '1', 'XXX志愿问答1', '回答回答回答回答回答回答回答回答回答', '111', '2024-03-07 22:19:49');
INSERT INTO `pinglun` VALUES ('2', 'zhiyuanqiang', '2', 'XX志愿问题', 'asdasdasdsa', '222', '2024-03-07 23:56:41');
INSERT INTO `pinglun` VALUES ('3', 'zhiyuanqiang', '1', 'XXX志愿问答1', 'sdfsdfsdfsdf阿三大苏打撒旦', '222', '2024-03-07 23:56:48');
INSERT INTO `pinglun` VALUES ('4', 'zhiyuanqiang', '3', 'XXXX志愿问题', '阿萨大大是', '222', '2024-03-14 17:50:05');

-- ----------------------------
-- Table structure for `ruzushenhe`
-- ----------------------------
DROP TABLE IF EXISTS `ruzushenhe`;
CREATE TABLE `ruzushenhe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruzushenqingid` int(10) unsigned NOT NULL COMMENT '入组申请id',
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `dizhi` varchar(50) NOT NULL COMMENT '地址',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `shenqingren` varchar(50) NOT NULL COMMENT '申请人',
  `shenhe` varchar(50) NOT NULL COMMENT '审核',
  `yijian` text NOT NULL COMMENT '意见',
  PRIMARY KEY (`id`),
  KEY `ruzushenhe_ruzushenqingid_index` (`ruzushenqingid`),
  KEY `ruzushenhe_zuzhixinxiid_index` (`zuzhixinxiid`),
  KEY `ruzushenhe_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='入组审核';

-- ----------------------------
-- Records of ruzushenhe
-- ----------------------------
INSERT INTO `ruzushenhe` VALUES ('1', '1', '4', '030720242884', '神木青年志愿者协会', '4', 'XXX地址', '400', '张三', '15485698656', '111', '同意', '同意了');
INSERT INTO `ruzushenhe` VALUES ('2', '2', '5', '030723396210', '香香志愿者协会', '6', 'XX地址', '500', '娜美', '15485698656', '222', '同意', 'yiaj');

-- ----------------------------
-- Table structure for `ruzushenqing`
-- ----------------------------
DROP TABLE IF EXISTS `ruzushenqing`;
CREATE TABLE `ruzushenqing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `dizhi` varchar(50) NOT NULL COMMENT '地址',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `shenqingyuanyin` text NOT NULL COMMENT '申请原因',
  `shenqingzhuangtai` varchar(50) NOT NULL COMMENT '申请状态',
  `shenqingren` varchar(50) NOT NULL COMMENT '申请人',
  PRIMARY KEY (`id`),
  KEY `ruzushenqing_zuzhixinxiid_index` (`zuzhixinxiid`),
  KEY `ruzushenqing_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='入组申请';

-- ----------------------------
-- Records of ruzushenqing
-- ----------------------------
INSERT INTO `ruzushenqing` VALUES ('1', '4', '030720242884', '神木青年志愿者协会', '4', 'XXX地址', '400', '张三', '15485698656', '申请原因申请原因申请原因', '同意', '111');
INSERT INTO `ruzushenqing` VALUES ('2', '5', '030723396210', '香香志愿者协会', '6', 'XX地址', '500', '娜美', '15485698656', '454645', '同意', '222');

-- ----------------------------
-- Table structure for `shenheshenqing`
-- ----------------------------
DROP TABLE IF EXISTS `shenheshenqing`;
CREATE TABLE `shenheshenqing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `huodongshenqingid` int(10) unsigned NOT NULL COMMENT '活动申请id',
  `zuzhihuodongid` int(10) unsigned NOT NULL COMMENT '组织活动id',
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `shenqingren` varchar(50) NOT NULL COMMENT '申请人',
  `shenhe` varchar(50) NOT NULL COMMENT '审核',
  `yijian` text NOT NULL COMMENT '意见',
  PRIMARY KEY (`id`),
  KEY `shenheshenqing_huodongshenqingid_index` (`huodongshenqingid`),
  KEY `shenheshenqing_zuzhihuodongid_index` (`zuzhihuodongid`),
  KEY `shenheshenqing_zuzhixinxiid_index` (`zuzhixinxiid`),
  KEY `shenheshenqing_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='审核申请';

-- ----------------------------
-- Records of shenheshenqing
-- ----------------------------
INSERT INTO `shenheshenqing` VALUES ('1', '1', '1', '4', '神木青年志愿者协会', '4', '400', '张三', '15485698656', '111', '同意', '同意了');
INSERT INTO `shenheshenqing` VALUES ('2', '2', '5', '5', '香香志愿者协会', '6', '500', 'xx', '15546545698', '222', '同意', '同意');
INSERT INTO `shenheshenqing` VALUES ('3', '3', '6', '5', '香香志愿者协会', '6', '500', '娜美', '15454646466', '222', '同意', '意见意见');

-- ----------------------------
-- Table structure for `tiezi`
-- ----------------------------
DROP TABLE IF EXISTS `tiezi`;
CREATE TABLE `tiezi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `tupian` text NOT NULL COMMENT '图片',
  `shipin` varchar(255) NOT NULL COMMENT '视频',
  `neirong` longtext NOT NULL COMMENT '内容',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='帖子';

-- ----------------------------
-- Records of tiezi
-- ----------------------------
INSERT INTO `tiezi` VALUES ('1', 'XX志愿活动回顾', '/upload/e08565fb85b04774a97766eed7bb53e6.jpg,/upload/58f394d2186f404daeaa342326d5540e.jpg', '/upload/41b70beb2ad94931a2f13b28aab026a7.mp4', '志愿活动回顾志愿活动回顾志愿活动回顾志愿活动回顾志愿活动回顾志愿活动回顾志愿活动回顾志愿活动回顾志愿活动回顾志愿活动回顾志愿活动回顾', '200', '2024-03-07 21:20:47');
INSERT INTO `tiezi` VALUES ('2', '往期XX志愿活动回顾', '', '/upload/43f2c7c6c1254902baa64e2613667d4e.mp4', '志愿活动回顾...', '100', '2024-03-07 21:49:17');
INSERT INTO `tiezi` VALUES ('3', '志愿活动回顾2', '/upload/009c0648c0dc4392a340c0b635a1bef2.jpg,/upload/650b03619ebc45319adc400304806691.jpg,/upload/e83280413737457fbbd6698d733e51be.jpg', '', '回顾回顾', '500', '2024-03-07 23:55:35');
INSERT INTO `tiezi` VALUES ('4', '志愿活动回顾3', '', '/upload/faf01dcf95b548fdb5443f2b59e70642.mp4', '回顾视频', '500', '2024-03-07 23:56:02');
INSERT INTO `tiezi` VALUES ('5', '志愿精彩回顾', '/upload/3ed4070792244065ba18c2fb6a280a5d.png', '/upload/a0e4223989a4460c9dc89788f6a4837a.mp4', '<p><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span><span style=\"color: rgb(96, 98, 102); font-family: 微软雅黑, \'Microsoft YaHei\', sans-serif, Arial, \'Times New Roman\', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">内容</span></p>', '500', '2024-03-14 17:51:05');

-- ----------------------------
-- Table structure for `wxuser`
-- ----------------------------
DROP TABLE IF EXISTS `wxuser`;
CREATE TABLE `wxuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL COMMENT '用户',
  `nickName` varchar(50) NOT NULL COMMENT '昵称',
  `avatarUrl` varchar(255) NOT NULL COMMENT '头像',
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `country` varchar(50) NOT NULL COMMENT '国家',
  `province` varchar(50) NOT NULL COMMENT '省份',
  `city` varchar(50) NOT NULL COMMENT '城市',
  `longitude` varchar(50) NOT NULL COMMENT '经度',
  `latitude` varchar(50) NOT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信用户';

-- ----------------------------
-- Records of wxuser
-- ----------------------------

-- ----------------------------
-- Table structure for `zhiyuanqiang`
-- ----------------------------
DROP TABLE IF EXISTS `zhiyuanqiang`;
CREATE TABLE `zhiyuanqiang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `wenti` text NOT NULL COMMENT '问题',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='志愿墙';

-- ----------------------------
-- Records of zhiyuanqiang
-- ----------------------------
INSERT INTO `zhiyuanqiang` VALUES ('1', 'XXX志愿问答1', '/upload/152dca687f344209b3c04814310fb5bc.jpg', '志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题志愿问题', '200', '2024-03-07 21:12:22');
INSERT INTO `zhiyuanqiang` VALUES ('2', 'XX志愿问题', '/upload/de7bd669e2224fd790b9db623cea2cb4.jpg', '志愿问题志愿问题志愿问题志愿问题志愿问题', '500', '2024-03-07 23:54:58');
INSERT INTO `zhiyuanqiang` VALUES ('3', 'XXXX志愿问题', '/upload/98339b524b16447b954e8960adeecec6.png', '志愿问题志愿问题志愿问题志愿问题志愿问题', '500', '2024-03-14 17:49:52');

-- ----------------------------
-- Table structure for `zhiyuanzhe`
-- ----------------------------
DROP TABLE IF EXISTS `zhiyuanzhe`;
CREATE TABLE `zhiyuanzhe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xuehao` varchar(50) NOT NULL COMMENT '学号',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(10) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `youxiang` varchar(50) NOT NULL COMMENT '邮箱',
  `yuanxi` varchar(50) NOT NULL COMMENT '院系',
  `xuexiao` varchar(50) NOT NULL COMMENT '学校',
  `gongyishizhang` int(11) NOT NULL DEFAULT '0' COMMENT '公益时长',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='志愿者';

-- ----------------------------
-- Records of zhiyuanzhe
-- ----------------------------
INSERT INTO `zhiyuanzhe` VALUES ('1', '111', '111', '张三', '女', '1564654568', '4654@qq.com', 'XX', 'XX', '23', '/upload/89c58cb13a374c429e9ea36fbc7bc225.png');
INSERT INTO `zhiyuanzhe` VALUES ('2', '222', '222', '娜美', '女', '15485695656', '46546@qq.com', 'XX系', 'XX学校', '147', '/upload/763d6c8180a5414192998067f45a69e1.jpg');

-- ----------------------------
-- Table structure for `zuzhihuodong`
-- ----------------------------
DROP TABLE IF EXISTS `zuzhihuodong`;
CREATE TABLE `zuzhihuodong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `huodongzhuti` varchar(255) NOT NULL COMMENT '活动主题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `kaishishijian` varchar(25) NOT NULL COMMENT '开始时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `huodongshizhang` int(11) NOT NULL DEFAULT '0' COMMENT '活动时长',
  `huodongrenshu` int(11) NOT NULL DEFAULT '0' COMMENT '活动人数',
  `huodongdizhi` varchar(50) NOT NULL COMMENT '活动地址',
  `shenhezhuangtai` varchar(50) NOT NULL COMMENT '审核状态',
  `huodongjieshao` text NOT NULL COMMENT '活动介绍',
  PRIMARY KEY (`id`),
  KEY `zuzhihuodong_zuzhixinxiid_index` (`zuzhixinxiid`),
  KEY `zuzhihuodong_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='组织活动';

-- ----------------------------
-- Records of zuzhihuodong
-- ----------------------------
INSERT INTO `zuzhihuodong` VALUES ('1', '4', '030720242884', '神木青年志愿者协会', '4', '400', '神木XX志愿活动', '/upload/3508a6081d754786b716ad8c5182fe9f.jpg', '2024-03-07 20:26:26', '2024-03-08 20:26:00', '23', '20', 'XX地址', '同意', '活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍');
INSERT INTO `zuzhihuodong` VALUES ('2', '1', '030720045872', '广州市志愿者协会', '1', '100', 'XX志愿活动', '/upload/8ac41fed92de44f1a4309ad9e7b48f89.jpg', '2024-03-07 20:35:50', '2024-03-09 20:35:00', '47', '20', 'XXX地址', '同意', '活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍');
INSERT INTO `zuzhihuodong` VALUES ('3', '3', '030720234344', '蒙山青年志愿者协会', '3', '300', 'XXx青年志愿活动', '/upload/17e620896c824f89998a606230d6d32e.jpg', '2024-03-07 20:36:49', '2024-03-10 20:36:00', '71', '20', 'XXX地址', '同意', '活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍');
INSERT INTO `zuzhihuodong` VALUES ('4', '2', '030720224434', '青年志愿者协会', '2', '200', 'XXXX志愿协会活动', '/upload/3bb9e2b2f89f458297aa61eb16bbad26.jpg', '2024-03-08 20:39:00', '2024-03-09 20:39:00', '24', '20', 'xx地址', '同意', '活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍');
INSERT INTO `zuzhihuodong` VALUES ('5', '5', '030723396210', '香香志愿者协会', '6', '500', '香香组织XX志愿活动', '/upload/63ca8a9996d9441e8918d86b48d42fcf.jpg', '2024-03-07 23:40:55', '2024-03-09 23:40:00', '47', '20', 'XX地址', '同意', '活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍');
INSERT INTO `zuzhihuodong` VALUES ('6', '5', '030723396210', '香香志愿者协会', '6', '500', 'XXX活动', '/upload/a7964e0872a845c7bdfd7fcaf9da3a92.png', '2024-03-14 17:39:53', '2024-03-19 17:39:53', '120', '19', 'XXXX活动地址', '同意', '活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍活动介绍');

-- ----------------------------
-- Table structure for `zuzhishenhe`
-- ----------------------------
DROP TABLE IF EXISTS `zuzhishenhe`;
CREATE TABLE `zuzhishenhe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zuzhixinxiid` int(10) unsigned NOT NULL COMMENT '组织信息id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `dizhi` varchar(50) NOT NULL COMMENT '地址',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  `shenhe` varchar(50) NOT NULL COMMENT '审核',
  `yijian` text NOT NULL COMMENT '意见',
  PRIMARY KEY (`id`),
  KEY `zuzhishenhe_zuzhixinxiid_index` (`zuzhixinxiid`),
  KEY `zuzhishenhe_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='组织审核';

-- ----------------------------
-- Records of zuzhishenhe
-- ----------------------------
INSERT INTO `zuzhishenhe` VALUES ('1', '1', '030720045872', '广州市志愿者协会', '1', '/upload/3d1a7394dbb8454789bac9c643476507.png', 'XX地址', '100', '同意', '意见意见');
INSERT INTO `zuzhishenhe` VALUES ('2', '4', '030720242884', '神木青年志愿者协会', '4', '/upload/13541e237c5c4de285a108395592e45f.png', 'XXX地址', '400', '同意', '意见');
INSERT INTO `zuzhishenhe` VALUES ('3', '3', '030720234344', '蒙山青年志愿者协会', '3', '/upload/3b14fb7fd7f44d60bffe899e36eee95c.jpg', 'XX地址', '300', '同意', '意见');
INSERT INTO `zuzhishenhe` VALUES ('4', '2', '030720224434', '青年志愿者协会', '2', '/upload/f88122ca7b0e49c7917d4e2bdd5cf822.jpg', 'XX地址', '200', '同意', '意见');
INSERT INTO `zuzhishenhe` VALUES ('5', '5', '030723396210', '香香志愿者协会', '6', '/upload/4d41388050694c08bcb1542be827d6a5.png', 'XX地址', '500', '同意', '意见');

-- ----------------------------
-- Table structure for `zuzhixinxi`
-- ----------------------------
DROP TABLE IF EXISTS `zuzhixinxi`;
CREATE TABLE `zuzhixinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '名称',
  `diqu` int(10) unsigned NOT NULL COMMENT '地区',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `dizhi` varchar(50) NOT NULL COMMENT '地址',
  `jianjie` text NOT NULL COMMENT '简介',
  `shenhezhuangtai` varchar(50) NOT NULL COMMENT '审核状态',
  `chuangjianren` varchar(50) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `zuzhixinxi_diqu_index` (`diqu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='组织信息';

-- ----------------------------
-- Records of zuzhixinxi
-- ----------------------------
INSERT INTO `zuzhixinxi` VALUES ('1', '030720045872', '广州市志愿者协会', '1', '/upload/3d1a7394dbb8454789bac9c643476507.png', '15458545861', 'XX地址', '组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介', '同意', '100');
INSERT INTO `zuzhixinxi` VALUES ('2', '030720224434', '青年志愿者协会', '2', '/upload/f88122ca7b0e49c7917d4e2bdd5cf822.jpg', '15458965956', 'XX地址', '组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介', '同意', '200');
INSERT INTO `zuzhixinxi` VALUES ('3', '030720234344', '蒙山青年志愿者协会', '3', '/upload/3b14fb7fd7f44d60bffe899e36eee95c.jpg', '15485698656', 'XX地址', '组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介', '同意', '300');
INSERT INTO `zuzhixinxi` VALUES ('4', '030720242884', '神木青年志愿者协会', '4', '/upload/13541e237c5c4de285a108395592e45f.png', '15646548862', 'XXX地址', '组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介', '同意', '400');
INSERT INTO `zuzhixinxi` VALUES ('5', '030723396210', '香香志愿者协会', '6', '/upload/4d41388050694c08bcb1542be827d6a5.png', '15485698656', 'XX地址', '组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介组织简介', '同意', '500');
