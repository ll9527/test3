/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.49 : Database - totalshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`totalshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `totalshop`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `address` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '地址详情',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `tel` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收货电话',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='用户地址关联表';

/*Data for the table `address` */

insert  into `address`(`id`,`address`,`user_id`,`user_name`,`tel`) values (1,'广东省湛江市赤坎区321',35,'李生','321'),(2,'广东省湛江市赤坎区海田路65号',35,'洪生','13855555555'),(3,'广东省湛江市赤坎区海田东35号',35,'主胜','13939999999'),(4,'广东省湛江市赤坎区沙湾路32号',35,'哈哈','13666665555');

/*Table structure for table `admin_profit` */

DROP TABLE IF EXISTS `admin_profit`;

CREATE TABLE `admin_profit` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(225) DEFAULT NULL COMMENT '密码',
  `percent_class` varchar(225) DEFAULT NULL COMMENT '扣点类目名',
  `shop_percent` double(50,2) DEFAULT NULL COMMENT '平台扣点',
  `seller_apply_money` decimal(12,2) DEFAULT NULL COMMENT '商家入驻费用',
  `vip_money` decimal(12,2) DEFAULT NULL COMMENT '会员费用',
  `bonus_pools` decimal(12,2) DEFAULT NULL COMMENT '奖金池金额',
  `pools_persent` int(20) DEFAULT NULL COMMENT '奖金池百分比',
  `discount_amount` decimal(12,2) DEFAULT NULL COMMENT '全场优惠金额',
  `discount_persent` int(20) DEFAULT NULL COMMENT '全场优惠百分比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统设置表';

/*Data for the table `admin_profit` */

insert  into `admin_profit`(`id`,`password`,`percent_class`,`shop_percent`,`seller_apply_money`,`vip_money`,`bonus_pools`,`pools_persent`,`discount_amount`,`discount_persent`) values (1,NULL,NULL,NULL,NULL,'199.00',NULL,NULL,NULL,NULL);

/*Table structure for table `class_with_product` */

DROP TABLE IF EXISTS `class_with_product`;

CREATE TABLE `class_with_product` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) DEFAULT NULL,
  `level2_class_id` int(20) DEFAULT NULL COMMENT '二级目录id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品与2级目录的关联表';

/*Data for the table `class_with_product` */

insert  into `class_with_product`(`id`,`product_id`,`level2_class_id`) values (25,39,11),(26,40,56),(27,41,56),(28,42,11),(29,43,21),(30,44,29),(31,45,11),(32,46,11);

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `seller_id` int(20) DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `collect` */

insert  into `collect`(`id`,`user_id`,`seller_id`,`product_id`) values (1,35,NULL,39);

/*Table structure for table `coupons` */

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `isAdmin` int(20) DEFAULT NULL COMMENT '是否全场通用 1通用',
  `product_id` int(20) DEFAULT NULL,
  `seller_id` int(20) DEFAULT NULL,
  `preferential_money` int(20) DEFAULT NULL COMMENT '优惠券金额',
  `add_time` datetime DEFAULT NULL,
  `over_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='优惠券表';

/*Data for the table `coupons` */

insert  into `coupons`(`id`,`user_id`,`isAdmin`,`product_id`,`seller_id`,`preferential_money`,`add_time`,`over_time`) values (1,43,1,NULL,NULL,2,'2019-03-04 11:54:12','2019-03-07 11:54:18'),(2,43,1,NULL,NULL,3,'2019-03-04 11:54:33','2019-03-07 11:54:35'),(3,35,1,NULL,NULL,4,'2019-03-04 15:13:44','2019-03-07 15:13:48');

/*Table structure for table `product_comment_freight` */

DROP TABLE IF EXISTS `product_comment_freight`;

CREATE TABLE `product_comment_freight` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL COMMENT '评论',
  `freight` decimal(12,2) DEFAULT NULL COMMENT '运费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品运费评论关联表';

/*Data for the table `product_comment_freight` */

insert  into `product_comment_freight`(`id`,`product_id`,`comment`,`freight`) values (1,39,NULL,'22.00'),(2,46,NULL,'55.00');

/*Table structure for table `product_img` */

DROP TABLE IF EXISTS `product_img`;

CREATE TABLE `product_img` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL COMMENT '图片名字',
  `is_cover` int(20) DEFAULT '0' COMMENT '是否封面 1：是封面',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品图片关联表';

/*Data for the table `product_img` */

insert  into `product_img`(`id`,`product_id`,`image`,`is_cover`) values (67,39,'5f686614-7571-45ce-a4ca-07f66c366b4d.png',1),(68,39,'d8b5bb6d-6f7e-4104-9aba-1842ed069cef.jpg',0),(69,40,'c98c001e-d0c5-4fbb-bd6e-0852c8823eaa.jpg',1),(70,40,'274fff63-f7d6-4d35-be03-95c16e25ab3e.jpg',0),(71,40,'3508f5f6-a983-45fc-af5a-3feb6fdf1c2f.jpg',0),(72,40,'2ed0790a-af2d-4fb1-b867-dbabbdea314f.jpg',0),(73,41,'8a4c7bc4-3781-4093-92e0-fb37b23d2c9b.jpg',1),(74,41,'947664d7-911a-46bc-97a0-427de0bac2d6.jpg',0),(75,41,'4202da3f-7dfe-4eaf-a4df-5ab94b9502db.jpg',0),(76,41,'daa88041-8270-4b42-9284-0f09c4a7beb6.jpg',0),(77,42,'be468e87-bc46-49c4-b42b-2efd94d6c31a.jpg',1),(78,42,'02cd8b9a-2c35-4040-b70f-9afc29cd8b44.jpg',0),(79,42,'f563f1d8-665a-4fcc-af8a-0fcfaa7e33de.jpg',0),(80,42,'e426c9ee-39f4-4820-a825-ebd1ce8568f7.jpg',0),(81,43,'5131915f-a871-4156-ae2a-465ed734dbbb.jpg',1),(82,43,'60d0e115-0d90-4b85-9aa2-10fd03349b7d.jpg',0),(83,43,'5fa21393-3eef-4d64-a2a3-08f8c3853359.jpg',0),(84,43,'c370eb20-1ddc-4375-8181-246749988f4a.jpg',0),(85,44,'5908c4e5-fa90-4fb8-b71f-b4487320e794.jpg',0),(86,44,'35d45cbf-39f8-4e15-8fa5-0fc6b654fea0.jpg',1),(87,44,'d7583e13-b902-49e3-9846-5c2ddb000299.jpg',0),(88,45,'54bfca1d-a25b-43ba-b3dd-744eb2cb963e.png',1),(89,45,'2169b3a7-8f93-41f1-9e41-16777bfe7a87.png',0),(90,46,'326384fe-b06a-4ada-8fe2-d8556997bb36.jpg',0),(91,46,'5d04928c-74c1-4568-8cd4-0cad93fa2acc.jpg',1);

/*Table structure for table `product_item` */

DROP TABLE IF EXISTS `product_item`;

CREATE TABLE `product_item` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` decimal(20,2) DEFAULT NULL COMMENT '商品价格，单位为：角',
  `group_price` decimal(20,2) DEFAULT NULL COMMENT '商品拼团价格，单位为：角',
  `is_group` int(20) DEFAULT NULL COMMENT '是否团购商品',
  `num` int(10) DEFAULT NULL COMMENT '库存数量',
  `cid` int(10) DEFAULT NULL COMMENT '所属类目，叶子类目',
  `status` tinyint(4) DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  `sales_volume` int(255) DEFAULT '0' COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `updated` (`updated`) USING BTREE,
  CONSTRAINT `product_item_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `shop_classify` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品表';

/*Data for the table `product_item` */

insert  into `product_item`(`id`,`title`,`sell_point`,`price`,`group_price`,`is_group`,`num`,`cid`,`status`,`created`,`updated`,`sales_volume`) values (39,'外套男士春秋季2019新款韩版潮流春装潮牌上衣服',NULL,'128.00','118.00',1,22,11,1,'2019-02-16 20:04:12','2019-02-16 20:04:12',0),(40,'VIVO X21 全屏幕指纹 vivox21 手机',NULL,'1770.00','1700.00',1,10,56,0,'2019-02-18 15:37:13','2019-02-18 15:37:13',0),(41,'VIVO X21 全屏幕指纹 vivox21 手机',NULL,'1790.00','1680.00',1,100,56,1,'2019-02-18 15:43:47','2019-02-18 15:43:47',0),(42,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春',NULL,'35.00','29.00',1,50,11,0,'2019-02-18 15:52:21','2019-02-18 15:52:21',0),(43,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春',NULL,'35.00','29.00',1,50,21,1,'2019-02-18 15:55:23','2019-02-18 15:55:23',0),(44,'苏泊尔5L双胆智能电压力锅家用高压锅电饭煲全自动官',NULL,'268.00','240.00',1,50,29,1,'2019-02-18 16:04:30','2019-02-18 16:04:30',0),(45,'测试商品',NULL,'20.90','10.99',1,22,11,1,'2019-02-21 16:13:14','2019-02-21 16:13:14',0),(46,'测试运费商品',NULL,'99.00','88.00',1,999,11,1,'2019-03-05 17:06:22','2019-03-05 17:06:22',0);

/*Table structure for table `referrer` */

DROP TABLE IF EXISTS `referrer`;

CREATE TABLE `referrer` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `referrer_id` int(20) DEFAULT NULL COMMENT '推荐人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与推荐人关联表';

/*Data for the table `referrer` */

/*Table structure for table `seller` */

DROP TABLE IF EXISTS `seller`;

CREATE TABLE `seller` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商户id',
  `tel` bigint(50) DEFAULT NULL COMMENT '商户电话',
  `title_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名字',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `seller_class` varchar(225) COLLATE utf8_bin DEFAULT '' COMMENT '商户类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `title_name` (`title_name`) USING BTREE,
  CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商户表';

/*Data for the table `seller` */

insert  into `seller`(`id`,`tel`,`title_name`,`user_id`,`seller_class`) values (24,18718212688,'几何符号旗舰店',35,'连锁超市'),(25,13763012343,'七彩人生',36,'服饰其他');

/*Table structure for table `seller_address` */

DROP TABLE IF EXISTS `seller_address`;

CREATE TABLE `seller_address` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '商家地址id',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商家地址',
  `seller_id` int(20) DEFAULT NULL COMMENT '商家id',
  `seller_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '店长名字',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `seller_id` (`seller_id`) USING BTREE,
  CONSTRAINT `seller_address_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商户地址关联表';

/*Data for the table `seller_address` */

insert  into `seller_address`(`id`,`address`,`seller_id`,`seller_name`) values (30,'湛江市海田路65号',24,'李生'),(31,'湛江市赤坎区',25,'13149988');

/*Table structure for table `seller_bcimg` */

DROP TABLE IF EXISTS `seller_bcimg`;

CREATE TABLE `seller_bcimg` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '证件id',
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '证件路径',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `seller_id` int(20) DEFAULT NULL COMMENT '商家id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `seller_id` (`seller_id`) USING BTREE,
  CONSTRAINT `seller_bcimg_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `seller_bcimg` */

insert  into `seller_bcimg`(`id`,`img`,`user_id`,`seller_id`) values (21,'e42079d4-3784-4304-a555-fa4cc2b1318a.jpg',35,24),(22,'7d9d2ec1-07cf-4649-9c01-a7b65e1e042c.jpg',36,25);

/*Table structure for table `seller_visit` */

DROP TABLE IF EXISTS `seller_visit`;

CREATE TABLE `seller_visit` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `seller_id` int(20) DEFAULT NULL,
  `visit_num` bigint(50) DEFAULT '0' COMMENT '每天访问人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商户每天访问人数表';

/*Data for the table `seller_visit` */

insert  into `seller_visit`(`id`,`seller_id`,`visit_num`) values (1,24,0),(3,25,0);

/*Table structure for table `seller_with_product_img` */

DROP TABLE IF EXISTS `seller_with_product_img`;

CREATE TABLE `seller_with_product_img` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `seller_id` int(20) DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `seller_id` (`seller_id`) USING BTREE,
  CONSTRAINT `seller_with_product_img_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商户和商品的关联表';

/*Data for the table `seller_with_product_img` */

insert  into `seller_with_product_img`(`id`,`seller_id`,`product_id`) values (25,24,39),(26,25,40),(27,25,41),(28,25,42),(29,25,43),(30,25,44),(31,24,45),(32,24,46);

/*Table structure for table `shop_classify` */

DROP TABLE IF EXISTS `shop_classify`;

CREATE TABLE `shop_classify` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `class_key` int(11) DEFAULT NULL COMMENT '外键',
  `level` int(11) DEFAULT NULL COMMENT '1一级目录  2二级目录',
  `ondelect` int(11) DEFAULT '0' COMMENT '显示 0显示，1不显示',
  `images` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`class_id`) USING BTREE,
  KEY `fk_id` (`class_key`) USING BTREE,
  CONSTRAINT `fk_id` FOREIGN KEY (`class_key`) REFERENCES `shop_classify` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='分类表';

/*Data for the table `shop_classify` */

insert  into `shop_classify`(`class_id`,`class_name`,`class_key`,`level`,`ondelect`,`images`) values (1,'服装饰品',NULL,1,0,NULL),(2,'鞋包配件',NULL,1,0,NULL),(3,'电器玩具',NULL,1,0,NULL),(4,'零食生鲜',NULL,1,1,NULL),(5,'百货家具',NULL,1,1,NULL),(6,'家电数码',NULL,1,0,NULL),(7,'办公五金',NULL,1,1,NULL),(8,'户外乐器',NULL,1,1,NULL),(9,'美妆洗护',NULL,1,1,NULL),(10,'游戏影视',NULL,1,1,NULL),(11,'男装',1,2,0,'nanxie.png'),(12,'女装',1,2,0,'lianyiqun.png'),(13,'羽绒服',1,2,0,'yurongfu.png'),(14,'棉服',1,2,1,NULL),(15,'大衣夹克',1,2,0,'jiake.png'),(16,'卫衣',1,2,0,'weiyi.png'),(17,'牛仔裤',1,2,0,'niuziku.png'),(18,'休闲裤',1,2,1,NULL),(19,'衬衫',1,2,0,'chenshan.png'),(20,'女鞋',2,2,0,'nvxie.png'),(21,'男鞋',2,2,0,'nanxie.png'),(22,'靴子',2,2,0,'xiezi.png'),(23,'低帮鞋',2,2,0,'xiezi_1.png'),(24,'高帮鞋',2,2,0,'chaoyipu.png'),(25,'皮鞋',2,2,0,'pixie.png'),(26,'帆布鞋',2,2,1,NULL),(27,'箱包皮具',2,2,1,NULL),(28,'双肩包',2,2,0,'shuangjianbao.png'),(29,'饭锅电磁炉',3,2,0,'dianfanguo.png'),(30,'取暖电器',3,2,1,NULL),(31,'洗衣机',3,2,0,'xiyiji.png'),(32,'厨房电器',3,2,1,NULL),(33,'个护健康',3,2,1,NULL),(34,'冰箱空调',3,2,1,NULL),(35,'生活电器',3,2,1,NULL),(36,'电视',3,2,0,'dianshi.png'),(37,'烟灶热水器',3,2,0,'reshuiqi.png'),(38,'休闲零食',4,2,1,'xiuxianlingshi.png'),(39,'乳制品',4,2,1,'tubiao.png'),(40,'饼干糕点',4,2,1,'gaodian.png'),(41,'茶叶冲饮',4,2,1,'chaye.png'),(42,'速食',4,2,1,NULL),(43,'中外名酒',4,2,1,'jiu.png'),(44,'新鲜水果',4,2,1,'shuiguo.png'),(45,'进口优选',4,2,1,NULL),(46,'海鲜水产',4,2,1,'haixian.png'),(47,'床和床垫',5,2,1,'chuang.png'),(48,'沙发电视柜',5,2,1,'shafa.png'),(49,'餐桌电脑桌',5,2,1,'fanzhuo.png'),(50,'柜子架子',5,2,1,'jiazi.png'),(51,'椅子凳子',5,2,1,'yizi.png'),(52,'儿童家具',5,2,1,NULL),(53,'办公家具',5,2,1,NULL),(54,'户外家具',5,2,1,NULL),(55,'学习桌',5,2,1,NULL),(56,'平板电脑',6,2,0,'pingbandiannao.png'),(57,'学习机',6,2,1,NULL),(58,'电脑整机',6,2,0,'icon-test.png'),(59,'笔类',6,2,1,NULL),(60,'外设配件',6,2,1,NULL),(61,'学生文具',6,2,0,'wenjuwujin.png'),(62,'游戏设备',6,2,1,NULL),(63,'办公设备',6,2,1,NULL),(64,'网络设备',6,2,1,NULL),(65,'面部护理',9,2,1,NULL),(66,'面膜',9,2,1,NULL),(67,'彩妆香氛',9,2,1,NULL),(68,'美发护发',9,2,1,NULL),(69,'口红唇膏',9,2,1,NULL),(70,'水乳面霜',9,2,1,NULL),(71,'护手霜',9,2,1,NULL),(72,'个人洗护',9,2,1,NULL),(73,'美妆工具',9,2,1,NULL),(74,'手机',6,2,0,'shouji.png');

/*Table structure for table `shop_order` */

DROP TABLE IF EXISTS `shop_order`;

CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(225) DEFAULT NULL COMMENT '订单编号',
  `express_sn` varchar(225) DEFAULT NULL COMMENT '快递单号',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_address` varchar(200) DEFAULT NULL COMMENT '用户地址',
  `tel` bigint(50) DEFAULT NULL COMMENT '用户电话',
  `user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `seller_id` int(11) DEFAULT NULL,
  `seller_name` varchar(225) DEFAULT NULL,
  `total_money` decimal(12,2) DEFAULT NULL COMMENT '总金额',
  `order_status` int(20) DEFAULT '0' COMMENT '0为待支付，1为待发货，2已发货，3确认收货，4退款，已发货，5退款已收到',
  `mark` varchar(225) DEFAULT NULL,
  `is_pick` int(20) DEFAULT NULL COMMENT '1.用户自提 2.快递发货',
  `prepay_id` varchar(200) DEFAULT NULL COMMENT 'prepay_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

/*Data for the table `shop_order` */

insert  into `shop_order`(`id`,`order_sn`,`express_sn`,`add_time`,`user_name`,`user_address`,`tel`,`user_id`,`seller_id`,`seller_name`,`total_money`,`order_status`,`mark`,`is_pick`,`prepay_id`) values (42,'d32d8194b7504618857a472b24fe1651',NULL,'2019-03-07 21:07:44',NULL,NULL,NULL,35,NULL,NULL,'0.02',0,'会员费用',NULL,NULL),(55,'897bda6a4a0c41899d15d2403b50d792',NULL,'2019-03-11 17:40:33','哈哈','广东省湛江市赤坎区沙湾路32号',13666665555,35,24,'几何符号旗舰店','20.00',0,NULL,2,'prepay_id=wx1117403243287834b626a6982760089397'),(56,'2fd666b4a1524991bc549d736c4a56e9',NULL,'2019-03-11 20:30:18',NULL,NULL,NULL,35,NULL,NULL,'0.02',0,'会员费用',NULL,NULL),(57,'73ea016c111b4b25a5528ab9e4b93fbc',NULL,'2019-03-11 20:34:20',NULL,NULL,NULL,35,NULL,NULL,'199.00',0,'会员费用',NULL,NULL);

/*Table structure for table `shop_order_goods` */

DROP TABLE IF EXISTS `shop_order_goods`;

CREATE TABLE `shop_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `user_id` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL COMMENT '商品上架时间',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '商品名字',
  `is_group` int(10) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `group_price` decimal(12,2) DEFAULT NULL,
  `go_num` int(11) DEFAULT NULL COMMENT '购买数量',
  `total_price` decimal(12,2) DEFAULT NULL COMMENT '总价',
  `order_id` int(11) DEFAULT NULL COMMENT '订单表id',
  `p_version` varchar(225) DEFAULT NULL COMMENT '商品版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品和订单关联表';

/*Data for the table `shop_order_goods` */

insert  into `shop_order_goods`(`id`,`goods_id`,`user_id`,`add_time`,`goods_name`,`is_group`,`price`,`group_price`,`go_num`,`total_price`,`order_id`,`p_version`) values (50,39,35,'2019-03-11 15:53:08','外套男士春秋季2019新款韩版潮流春装潮牌上衣服',0,'128.00',NULL,1,'128.00',44,'L,'),(51,39,35,'2019-03-11 16:20:47','外套男士春秋季2019新款韩版潮流春装潮牌上衣服',0,'128.00',NULL,1,'12800.00',45,'L,'),(52,46,35,'2019-03-11 16:52:03','测试运费商品',0,'99.00',NULL,1,'99.00',46,'l,黑'),(53,46,35,'2019-03-11 16:59:46','测试运费商品',0,'99.00',NULL,1,'99.00',47,'l,黑'),(54,46,35,'2019-03-11 17:17:28','测试运费商品',0,'99.00',NULL,1,'99.00',48,'l,黑'),(55,46,35,'2019-03-11 17:23:36','测试运费商品',0,'99.00',NULL,1,'154.00',49,'l,黑'),(56,46,35,'2019-03-11 17:27:47','测试运费商品',0,'99.00',NULL,1,'154.00',50,'l,黑'),(57,46,35,'2019-03-11 17:28:22','测试运费商品',0,'99.00',NULL,1,'99.00',51,'l,黑'),(58,45,35,'2019-03-11 17:39:35','测试商品',0,'20.90',NULL,1,'20.90',52,'22,'),(59,45,35,'2019-03-11 17:39:36','测试商品',0,'20.90',NULL,1,'20.90',53,'22,'),(60,45,35,'2019-03-11 17:39:57','测试商品',0,'20.90',NULL,1,'20.90',54,'22,'),(61,45,35,'2019-03-11 17:40:33','测试商品',0,'20.90',NULL,1,'20.90',55,'22,');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `is_vip` int(10) DEFAULT '0' COMMENT '是否为vip 1-vip',
  `is_seller` int(20) DEFAULT '0' COMMENT '是否为商家 1-是商家',
  `tel` bigint(50) DEFAULT NULL COMMENT '手机号码',
  `score` int(20) DEFAULT '0' COMMENT '积分',
  `money` decimal(20,0) unsigned DEFAULT '0' COMMENT '用户余额',
  `is_admin` int(20) DEFAULT '0' COMMENT '是否为管理员 1-是管理员',
  `is_apply` int(20) DEFAULT '0' COMMENT '是否提交商家注册 1-提交注册',
  `apply_money` decimal(50,0) DEFAULT '0' COMMENT '申请金额',
  `applied_mark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '申请后返回备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`is_vip`,`is_seller`,`tel`,`score`,`money`,`is_admin`,`is_apply`,`apply_money`,`applied_mark`) values (33,'1','c4ca4238a0b923820dcc509a6f75849b',0,1,1,0,'0',1,1,'0',''),(34,'2','c81e728d9d4c2f636f067f89cc14862c',0,1,2,0,'0',0,1,'0',''),(35,'李生','202cb962ac59075b964b07152d234b70',0,1,18718212688,0,'0',1,1,'0',''),(36,'13149988','12413116f0327ab857ceb2b9dcf7580e',0,1,13763012343,0,'0',1,1,'0',''),(37,'8058','f54c77d59132ac26a4fb7e8e611d1dd3',0,0,18520081873,0,'0',0,0,'0',''),(38,'19860729','7c7f6cd41099e91abdc5a89ba3a3687a',0,0,18218870150,0,'0',0,0,'0',''),(39,'720108','629ddea77ebb0009363816cf35cbc3f9',0,0,15113611112,0,'0',0,0,'0',''),(40,'1823810554','4a6ea9d394695e30110f0ba9f75822a3',0,0,15768862291,0,'0',0,0,'0','');

/*Table structure for table `version` */

DROP TABLE IF EXISTS `version`;

CREATE TABLE `version` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '型号id',
  `product_id` int(20) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名字',
  `version_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '型号名字',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  CONSTRAINT `version_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商品的规格表';

/*Data for the table `version` */

insert  into `version`(`id`,`product_id`,`product_name`,`version_name`) values (49,39,'外套男士春秋季2019新款韩版潮流春装潮牌上衣服','M'),(50,39,'外套男士春秋季2019新款韩版潮流春装潮牌上衣服','L'),(51,40,'VIVO X21 全屏幕指纹 vivox21 手机','6+128G'),(52,40,'VIVO X21 全屏幕指纹 vivox21 手机','6+64G'),(53,41,'VIVO X21 全屏幕指纹 vivox21 手机','6+64G'),(54,41,'VIVO X21 全屏幕指纹 vivox21 手机','6+128G'),(55,42,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','H07白黑'),(56,42,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','39'),(57,42,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','40'),(58,42,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','41'),(59,42,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','42'),(60,42,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春',''),(61,42,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','43'),(62,43,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','H07'),(63,43,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','39'),(64,43,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','40'),(65,43,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','41'),(66,43,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','42'),(67,43,'2019新款鞋子男韩版潮流小白鞋百搭休闲运动潮鞋春','43'),(68,44,'苏泊尔5L双胆智能电压力锅家用高压锅电饭煲全自动官','5L'),(69,44,'苏泊尔5L双胆智能电压力锅家用高压锅电饭煲全自动官','CYSB50YCWI'),(70,45,'测试商品','22'),(71,46,'测试运费商品','x'),(72,46,'测试运费商品','l');

/*Table structure for table `version1` */

DROP TABLE IF EXISTS `version1`;

CREATE TABLE `version1` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '型号id',
  `product_id` int(20) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名字',
  `version1_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '型号（颜色）名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品的型号颜色表';

/*Data for the table `version1` */

insert  into `version1`(`id`,`product_id`,`product_name`,`version1_name`) values (1,46,'测试运费商品','黑'),(2,46,'测试运费商品','白');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
