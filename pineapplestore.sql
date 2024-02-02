/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : pineapplestore

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 03/02/2024 03:15:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '主键 分类id主键',
  `category_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分类名称 分类名称',
  `category_level` int NOT NULL COMMENT '分类层级 分类得类型，\n1:一级大分类\n2:二级分类\n3:三级小分类',
  `parent_id` int NOT NULL COMMENT '父层级id 父id 上一级依赖的id，1级分类则为0，二级三级分别依赖上一级',
  `category_img` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `category_icon` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标 logo',
  `category_slogan` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '口号',
  `category_pic` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类图',
  `category_bg_color` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '背景颜色',
  `category_star` int NULL DEFAULT NULL COMMENT '推荐商品：1为轮播图，2为板块推荐',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品分类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '点心/蛋糕', 1, 0, 'https://s2.loli.net/2023/01/27/j8isX46RIpGofyc.jpg', 'cake.png', '每一道甜品都有一个故事', 'act1.png', 'black', 1);
INSERT INTO `category` VALUES (2, '饼干/膨化', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', 'cookies.png', '健康饮食远离我', 'act2.png', 'black', 1);
INSERT INTO `category` VALUES (3, '熟食/肉类', 1, 0, 'https://s2.loli.net/2023/01/27/3EjzmLwYWsQZRg5.jpg', 'meat.png', 'nice！nice！nice！', 'act3.png', 'black', 1);
INSERT INTO `category` VALUES (4, '素食/卤味', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', 'bamboo.png', NULL, 'act1.png', 'black', 1);
INSERT INTO `category` VALUES (5, '坚果/炒货', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', 'nut.png', '酥酥脆脆，回味无穷', 'act2.png', 'black', 1);
INSERT INTO `category` VALUES (6, '糖果/蜜饯', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', 'candy.png', NULL, 'act3.png', 'black', 1);
INSERT INTO `category` VALUES (7, '巧克力', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', 'chocolate.png', NULL, 'act1.png', 'black', 1);
INSERT INTO `category` VALUES (8, '海味/河鲜', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', 'fish.png', NULL, 'act2.png', 'black', 1);
INSERT INTO `category` VALUES (9, '花茶/果茶', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', 'tea.png', '健康快乐每一天', 'act3.png', 'black', 1);
INSERT INTO `category` VALUES (10, '品牌/礼包', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', 'package.png', '每日一个小惊喜', 'act1.png', 'black', 1);
INSERT INTO `category` VALUES (11, '蛋糕', 2, 1, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, '66', NULL, NULL, 2);
INSERT INTO `category` VALUES (12, '点心', 2, 1, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (13, '饼干', 2, 2, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (14, '薯片', 2, 2, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (15, '虾条', 2, 2, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (16, '猪肉脯', 2, 3, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (17, '牛肉丝', 2, 3, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (18, '小香肠', 2, 3, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (19, '豆干', 2, 4, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (21, '鸭脖', 2, 4, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (22, '坚果', 2, 5, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (23, '锅巴', 2, 5, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (24, '糖果', 2, 6, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (25, '蜜饯', 2, 6, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (26, '巧克力', 2, 7, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (27, '果冻', 2, 7, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (28, '海带丝', 2, 8, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (29, '小鱼干', 2, 8, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (30, '鱿鱼丝', 2, 8, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (31, '花茶', 2, 9, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (32, '果茶', 2, 9, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (33, '品牌套餐', 2, 10, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (34, '活动礼包', 2, 10, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (35, '蒸蛋糕', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (36, '脱水蛋糕', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (37, '瑞士卷', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (38, '软面包', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (39, '马卡龙', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (40, '千层饼', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (41, '甜甜圈', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (42, '蒸三明治', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (43, '铜锣烧', 3, 11, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (44, '华夫饼', 3, 12, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (45, '老婆饼', 3, 12, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (46, '奥利奥', 3, 13, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (47, '粤利粤', 3, 13, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (49, '膨化虾条', 3, 15, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (50, '油炸虾条', 3, 15, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (51, '海鲜大虾条', 3, 15, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', '', '', '', '', 0);
INSERT INTO `category` VALUES (58, '数码科技', 1, 0, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 3);
INSERT INTO `category` VALUES (60, '笔记本', 1, 58, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (61, '家电', 1, 58, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);
INSERT INTO `category` VALUES (62, '配件', 1, 58, 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for index_img
-- ----------------------------
DROP TABLE IF EXISTS `index_img`;
CREATE TABLE `index_img`  (
  `img_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键',
  `img_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '名字 轮播图名字',
  `img_url` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片 图片地址',
  `img_bg_color` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '背景色 背景颜色',
  `prod_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品id 商品id',
  `category_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品分类id 商品分类id',
  `index_type` int NULL DEFAULT NULL COMMENT '轮播图类型 轮播图类型，用于判断，可以根据商品id或者分类进行页面跳转，1：商品 2：分类',
  `seq` int NULL DEFAULT NULL COMMENT '轮播图展示顺序 轮播图展示顺序，从小到大',
  `status` int NOT NULL COMMENT '是否展示:1表示正常显示，0表示下线 是否展示，1：展示    0：不展示',
  `create_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间 更新',
  `describes` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片在无法正确显示的时候文本替代'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '轮播图 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of index_img
-- ----------------------------
INSERT INTO `index_img` VALUES ('1', '洗衣机', 'https://s2.loli.net/2023/01/10/PBQRSe18oMkvq6w.jpg', 'pink', NULL, '1', 2, 2, 1, '2021-04-14 17:21:49', '2023-01-11 22:52:01', 'QAQ111');
INSERT INTO `index_img` VALUES ('2', '智能门锁', 'https://s2.loli.net/2023/01/28/2h7T1MovYIVrJRw.jpg', 'black', '103', NULL, 1, 3, 1, '2021-04-14 17:22:23', '2023-01-28 04:01:33', '123');
INSERT INTO `index_img` VALUES ('3', '手机', 'https://s2.loli.net/2023/01/28/YbUVaOt6DxzyZpE.jpg', 'orange', NULL, '2', 2, 4, 1, '2021-04-14 17:23:06', '2023-01-10 09:44:47', '当图片没有显示显示文字2');
INSERT INTO `index_img` VALUES ('4', '扫地鸡', 'https://s2.loli.net/2023/01/28/pJfCGbqOYRTIW9r.jpg', 'green', '101', NULL, 1, 1, 1, '2021-04-14 17:21:13', '2023-01-10 20:01:04', '当图片没有显示显示文字3');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `item_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单项ID',
  `order_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单ID',
  `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品ID',
  `product_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `product_img` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `sku_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'skuID',
  `sku_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'sku名称',
  `product_price` decimal(32, 8) NOT NULL COMMENT '商品价格',
  `buy_counts` int NOT NULL COMMENT '购买数量',
  `total_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '商品总金额',
  `basket_date` datetime NULL DEFAULT NULL COMMENT '加入购物车时间',
  `buy_time` datetime NULL DEFAULT NULL COMMENT '购买时间',
  `is_comment` int NULL DEFAULT NULL COMMENT '评论状态： 0 未评价  1 已评价',
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `sku_id`(`sku_id` ASC) USING BTREE,
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_item_ibfk_3` FOREIGN KEY (`sku_id`) REFERENCES `product_sku` (`sku_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单项/快照 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('20221209013398064', 'f30a09ef-2e73-43e0-b59b-b12c08450ae7', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-09 01:33:37', NULL);
INSERT INTO `order_item` VALUES ('20221209014024025', 'c057f22d-19f8-4968-8786-63adefa0b336', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-09 01:40:22', NULL);
INSERT INTO `order_item` VALUES ('20221209015838084', 'c3636cc4-b8f1-48ab-aa8f-0314cf84b469', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-09 01:58:43', NULL);
INSERT INTO `order_item` VALUES ('20221210010752561', 'b44bfe6a-d2c4-4308-9b19-bbf5364d3f8e', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-10 01:07:20', NULL);
INSERT INTO `order_item` VALUES ('20221210011185906', 'be2a1ea2-a635-48c7-9a0b-0da5bd02db42', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-10 01:11:03', NULL);
INSERT INTO `order_item` VALUES ('20221210013473988', '366fcb43-136a-4313-98d0-ef234e23d5d2', '106', '香瓜子葵花籽', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2209047029735/O1CN01efaj7S2LmgUv9XRmp_!!2209047029735.jpg_180x180.jpg_.webp', '106', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-10 01:34:32', NULL);
INSERT INTO `order_item` VALUES ('20221210014465279', '2ba16c48-914c-4adc-b430-f6158eb03030', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-10 01:44:24', NULL);
INSERT INTO `order_item` VALUES ('20221210014953049', 'c722eb62-f2bf-4b88-9b9b-becbcd1a233f', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-10 01:49:24', NULL);
INSERT INTO `order_item` VALUES ('20221210015490196', 'b5ee1ef3-b03e-4925-9f34-9290f1acc020', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-10 01:54:45', NULL);
INSERT INTO `order_item` VALUES ('20221210015824710', '3439def0-dfef-4035-9cda-306de259da67', '102', '老街口开心果', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01k7Q6LP2K7AzIfpJht_!!0-item_pic.jpg_180x180.jpg_.webp', '102', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-10 01:58:20', NULL);
INSERT INTO `order_item` VALUES ('20221210015936717', '37590629-712b-459b-b207-7546c9e1853e', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-10 01:59:41', NULL);
INSERT INTO `order_item` VALUES ('20221210020189944', '98a98ed4-dc22-4287-b202-29e262d717ca', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-10 02:01:35', NULL);
INSERT INTO `order_item` VALUES ('20221210020505125', '0c3294d4-4d9f-4a02-8b04-09ba270d3ce4', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-10 02:05:00', NULL);
INSERT INTO `order_item` VALUES ('20221210021229092', '184b80b1-6233-4fe9-a6b8-b2dcb57d8b02', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-10 02:12:15', NULL);
INSERT INTO `order_item` VALUES ('20221210021715533', 'c552246e-206c-4a1c-8ceb-6d9c3ec2cff7', '100', '焦糖/山核桃味瓜子', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01lEycCW2K7AzLZgkEZ_!!0-item_pic.jpg_180x180.jpg_.webp', '100', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-10 02:17:13', NULL);
INSERT INTO `order_item` VALUES ('20221210021970089', '477f5e18-2ba0-4489-8b00-d124196bf57c', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-10 02:19:34', NULL);
INSERT INTO `order_item` VALUES ('20221210022980600', '8efa76a1-eea3-43b8-9ea5-7cabb23bd99a', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-10 02:29:14', NULL);
INSERT INTO `order_item` VALUES ('20221210023087458', '7c4bbbd0-3ec1-4822-8175-921edddac678', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-10 02:30:03', NULL);
INSERT INTO `order_item` VALUES ('20221210023264364', '6b1e7ede-8318-4e8f-abb7-983ae178cc4b', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-10 02:32:57', NULL);
INSERT INTO `order_item` VALUES ('20221210023966131', '04bb9755-3c0e-429e-8901-df60463d8a9d', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-10 02:39:02', NULL);
INSERT INTO `order_item` VALUES ('20221210024342970', '241dc6d0-06d1-4018-854e-a0c092306b64', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-10 02:43:06', NULL);
INSERT INTO `order_item` VALUES ('20221210024480442', '1d95f14c-55b8-418e-b789-c35ab18e2f10', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-10 02:44:15', NULL);
INSERT INTO `order_item` VALUES ('20221210024501727', '510322ca-f2e7-49e8-80c1-64e34e0509a8', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-10 02:45:56', NULL);
INSERT INTO `order_item` VALUES ('20221210024595700', '510322ca-f2e7-49e8-80c1-64e34e0509a8', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-10 02:45:56', NULL);
INSERT INTO `order_item` VALUES ('20221210024636831', 'cd80d807-1d92-45f4-a99f-a8417d8eb12f', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-10 02:46:27', NULL);
INSERT INTO `order_item` VALUES ('20221211094521622', '1b7e1dc4-d844-4ea6-a0ba-cb23444ac598', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 09:45:33', NULL);
INSERT INTO `order_item` VALUES ('20221211094537390', 'ad894a3a-d6e7-41a6-bd7a-86b2cf2b3537', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 09:45:41', NULL);
INSERT INTO `order_item` VALUES ('20221211094778993', '0befb8d6-5311-4683-b7e7-f9610c9cd008', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 09:47:58', NULL);
INSERT INTO `order_item` VALUES ('20221211094828738', 'b26a2d96-b7c4-4496-8c01-cc38f0935cd4', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 09:48:31', NULL);
INSERT INTO `order_item` VALUES ('20221211094836012', '2cbeb4ad-c934-4847-819d-84db52d62a3e', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 09:48:22', NULL);
INSERT INTO `order_item` VALUES ('20221211094844916', '50c96d3a-d872-4f66-a275-eab95f9e7689', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-11 09:48:36', NULL);
INSERT INTO `order_item` VALUES ('20221211095411894', '3db875f5-8168-4ca9-9128-2a12e3b4dea7', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 09:54:56', NULL);
INSERT INTO `order_item` VALUES ('20221211100123389', '752aed1b-5f29-41fb-9798-18af9360b4fb', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-11 10:01:58', NULL);
INSERT INTO `order_item` VALUES ('20221211100292666', '7b4e1d72-1f14-41ae-9d3d-686e15be50be', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 10:02:27', NULL);
INSERT INTO `order_item` VALUES ('20221211100465950', '76b16123-1e78-4ae8-874a-2370adfb58c3', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 10:04:51', NULL);
INSERT INTO `order_item` VALUES ('20221211102865871', 'cc1e45a5-f945-4c6a-b872-4ae930d23a98', '102', '老街口开心果', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01k7Q6LP2K7AzIfpJht_!!0-item_pic.jpg_180x180.jpg_.webp', '102', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 10:28:57', NULL);
INSERT INTO `order_item` VALUES ('20221211104695856', '66ba21bb-eb56-41f1-8ef0-45347bbfc153', '248', 'Xiaomi Buds 4 Pro', 'https://img1.imgtp.com/2022/12/03/sOYjl0dR.png', '245', '测试', 879.20000000, 2, 1758.40000000, NULL, '2022-12-11 10:47:00', NULL);
INSERT INTO `order_item` VALUES ('20221211104699696', '66ba21bb-eb56-41f1-8ef0-45347bbfc153', '246', 'Galaxy S22', 'https://img1.imgtp.com/2022/12/03/rqnt5XGf.jpg', '243', '测试', 7759.20000000, 2, 15518.40000000, NULL, '2022-12-11 10:47:00', NULL);
INSERT INTO `order_item` VALUES ('20221211104703427', '66ba21bb-eb56-41f1-8ef0-45347bbfc153', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 2, 11998.00000000, NULL, '2022-12-11 10:47:00', NULL);
INSERT INTO `order_item` VALUES ('20221211110030959', '769109a2-c06b-475c-8742-0e2b33abf7eb', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-11 11:00:07', NULL);
INSERT INTO `order_item` VALUES ('20221211110056204', 'ae40947f-b503-479e-948f-3868ba3e755b', '244', 'Apple/苹果 MacBook Air', 'https://img1.imgtp.com/2022/12/03/ZHYUaBX7.png', '241', '测试', 19599.02000000, 1, 19599.02000000, NULL, '2022-12-11 11:00:48', NULL);
INSERT INTO `order_item` VALUES ('20221211110151712', '8766b474-a638-444e-b15e-4a2dc85d8e12', '244', 'Apple/苹果 MacBook Air', 'https://img1.imgtp.com/2022/12/03/ZHYUaBX7.png', '241', '测试', 19599.02000000, 1, 19599.02000000, NULL, '2022-12-11 11:01:35', NULL);
INSERT INTO `order_item` VALUES ('20221211110198444', 'c9fba330-137e-4b87-bfde-523824bc8a9d', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-11 11:01:41', NULL);
INSERT INTO `order_item` VALUES ('20221211110328810', 'efb0bed8-c2fd-4fbd-8aea-413f19b00585', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 11:03:59', NULL);
INSERT INTO `order_item` VALUES ('20221211110494203', 'c16fb6d1-fcc3-4ece-98e4-cb234219cee8', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-11 11:04:11', NULL);
INSERT INTO `order_item` VALUES ('20221211110513785', 'e0373674-8385-40df-b908-1300d087b461', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-11 11:05:27', NULL);
INSERT INTO `order_item` VALUES ('20221211110546014', '0e40e15a-1532-4f3f-a396-8b0e7629ea81', '244', 'Apple/苹果 MacBook Air', 'https://img1.imgtp.com/2022/12/03/ZHYUaBX7.png', '241', '测试', 19599.02000000, 1, 19599.02000000, NULL, '2022-12-11 11:05:38', NULL);
INSERT INTO `order_item` VALUES ('20221211110927136', 'bc79a074-2ee3-4b36-894d-101596bccf3e', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-11 11:09:47', NULL);
INSERT INTO `order_item` VALUES ('20221211111131917', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '23', '旺旺雪饼仙贝', 'https://gw.alicdn.com/imgextra/i1/3586740366/O1CN0108CZpX1EZfgms5pRc_!!3586740366-0-lubanu-s.jpg_Q75.jpg_.webp', '227', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 11:11:02', NULL);
INSERT INTO `order_item` VALUES ('20221211111135893', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '13', '中式小吃虎年礼盒', 'https://gd1.alicdn.com/imgextra/i1/807674560/O1CN01Lb13I41jYWnnEECHF_!!807674560.jpg_400x400.jpg', '13', '测试', 1.50000000, 2, 3.00000000, NULL, '2022-12-11 11:11:02', NULL);
INSERT INTO `order_item` VALUES ('20221211111139705', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '114', '每日坚果', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/3937219703/O1CN01eqfE3R2LY1p5aP7Ge_!!3937219703-0-C2M.jpg_180x180.jpg_.webp', '114', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 11:11:02', NULL);
INSERT INTO `order_item` VALUES ('20221211111143604', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '113', '山核桃仁坚果', 'https://gw.alicdn.com/imgextra/O1CN01gL6trl1SNg0NSzQ4o_!!2745562235-0-picasso.jpg_180x180.jpg_.webp', '113', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 11:11:02', NULL);
INSERT INTO `order_item` VALUES ('20221211111147512', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '112', '福气礼盒', 'https://img1.imgtp.com/2022/12/03/EVF1C8jz.jpg', '112', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 11:11:03', NULL);
INSERT INTO `order_item` VALUES ('20221211111151376', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '107', '原味巴旦木仁', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/4070486739/O1CN01M3BZne1zeVidczWNC_!!0-item_pic.jpg_180x180.jpg_.webp', '107', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 11:11:03', NULL);
INSERT INTO `order_item` VALUES ('20221211111155360', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '104', '紫皮腰果', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/880734502/O1CN0163GmSd1j7xt05hlNH-880734502.jpg_180x180.jpg_.webp', '104', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 11:11:03', NULL);
INSERT INTO `order_item` VALUES ('20221211111159164', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 2, 3.00000000, NULL, '2022-12-11 11:11:03', NULL);
INSERT INTO `order_item` VALUES ('20221211111163059', '5221cdd7-b8b2-425d-b65f-172f3f30ccab', '100', '焦糖/山核桃味瓜子', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01lEycCW2K7AzLZgkEZ_!!0-item_pic.jpg_180x180.jpg_.webp', '100', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 11:11:03', NULL);
INSERT INTO `order_item` VALUES ('20221211111729031', '459b3125-a875-4642-ac5e-402365edb171', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 11:17:01', NULL);
INSERT INTO `order_item` VALUES ('20221211112022758', 'a991981a-dcfb-4c0f-9f00-9097ed9c10dd', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 11:20:25', NULL);
INSERT INTO `order_item` VALUES ('20221211112450626', 'a617b2ad-f986-4fd7-98ad-fddf84a3b356', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 2, 5598.60000000, NULL, '2022-12-11 11:24:27', NULL);
INSERT INTO `order_item` VALUES ('20221211113107661', '2f45b23f-b3f7-417d-bddf-1157f10949d3', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '测试', 1.50000000, 1, 1.50000000, NULL, '2022-12-11 11:31:57', NULL);
INSERT INTO `order_item` VALUES ('20221211113305053', 'eda1ae9d-989a-4796-b9d3-de670d3c4842', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-11 11:33:52', NULL);
INSERT INTO `order_item` VALUES ('20221211113827879', '7131a89c-038f-4af5-b230-b53570ecb62f', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '测试', 2324.25000000, 1, 2324.25000000, NULL, '2022-12-11 11:38:44', NULL);
INSERT INTO `order_item` VALUES ('20221211114371203', '03fee4c0-809c-4a89-874b-63dbd16e235f', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 11:43:58', NULL);
INSERT INTO `order_item` VALUES ('20221211114727022', 'a96285aa-054e-4645-bdd8-719626a3594d', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 11:47:27', NULL);
INSERT INTO `order_item` VALUES ('20221211114844090', '05732a0b-ad02-405b-a0db-574d27f954b9', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '测试', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-11 11:48:31', NULL);
INSERT INTO `order_item` VALUES ('20221211115247648', 'b0b9c658-42c3-43f9-8d8b-94dfc0212e78', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-11 11:52:37', NULL);
INSERT INTO `order_item` VALUES ('20221211124940930', '612952ee-21ab-4015-b89c-d29104bd30d7', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-11 12:49:49', NULL);
INSERT INTO `order_item` VALUES ('20221211210520217', '459b0bf9-8f7e-4fa7-86e4-10c5a67545f3', '105', '坚果炒货零食', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/880734502/O1CN01yUqSwM1j7xsy2GlVp_!!0-item_pic.jpg_180x180.jpg_.webp', '105', '测试', 1.50000000, 2, 3.00000000, NULL, '2022-12-11 21:05:57', NULL);
INSERT INTO `order_item` VALUES ('20221211210520472', '459b0bf9-8f7e-4fa7-86e4-10c5a67545f3', '107', '原味巴旦木仁', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/4070486739/O1CN01M3BZne1zeVidczWNC_!!0-item_pic.jpg_180x180.jpg_.webp', '107', '测试', 1.50000000, 2, 3.00000000, NULL, '2022-12-11 21:05:57', NULL);
INSERT INTO `order_item` VALUES ('20221211210520530', '459b0bf9-8f7e-4fa7-86e4-10c5a67545f3', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '测试', 5999.00000000, 2, 11998.00000000, NULL, '2022-12-11 21:05:57', NULL);
INSERT INTO `order_item` VALUES ('20221213022215562', 'b9aaa4e8-5d80-4c4a-8c5c-71cb624b5654', '245', '小米小爱音箱Play增强版', 'https://img1.imgtp.com/2022/12/03/2mMw5GmJ.jpg', '242', '测试', 134.10000000, 1, 134.10000000, NULL, '2022-12-13 02:22:20', NULL);
INSERT INTO `order_item` VALUES ('20221213022215796', 'b9aaa4e8-5d80-4c4a-8c5c-71cb624b5654', '250', '小米氮化镓GaN充电器 Type-C 55W', 'https://img1.imgtp.com/2022/12/03/qCcJkhtt.jpg', '248', '测试', 99.00000000, 1, 99.00000000, NULL, '2022-12-13 02:22:20', NULL);
INSERT INTO `order_item` VALUES ('20221213022215802', 'b9aaa4e8-5d80-4c4a-8c5c-71cb624b5654', '246', 'Galaxy S22', 'https://img1.imgtp.com/2022/12/03/rqnt5XGf.jpg', '243', '测试', 7759.20000000, 1, 7759.20000000, NULL, '2022-12-13 02:22:20', NULL);
INSERT INTO `order_item` VALUES ('20221213022215922', 'b9aaa4e8-5d80-4c4a-8c5c-71cb624b5654', '253', '小米WiFi放大器 Pro', 'https://img1.imgtp.com/2022/12/03/aUEwn1wS.jpg', '250', '测试', 69.00000000, 1, 69.00000000, NULL, '2022-12-13 02:22:20', NULL);
INSERT INTO `order_item` VALUES ('20221220193103321', '78743294-d765-4d0f-9781-cf54ca06852a', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '339', '加力加 200g', 1.50000000, 10, 15.00000000, NULL, '2022-12-20 19:31:56', NULL);
INSERT INTO `order_item` VALUES ('20221220193128898', '78743294-d765-4d0f-9781-cf54ca06852a', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '加力加 100g', 2799.30000000, 3, 8397.90000000, NULL, '2022-12-20 19:31:56', NULL);
INSERT INTO `order_item` VALUES ('20221220193134055', '78743294-d765-4d0f-9781-cf54ca06852a', '290', '一加 10 Pro 12GB+256GB', 'https://img1.imgtp.com/2022/12/03/nSGQRIIZ.jpg', '269', '加力加 100g', 3989.30000000, 1, 3989.30000000, NULL, '2022-12-20 19:31:56', NULL);
INSERT INTO `order_item` VALUES ('20221220193139273', '78743294-d765-4d0f-9781-cf54ca06852a', '290', '一加 10 Pro 12GB+256GB', 'https://img1.imgtp.com/2022/12/03/nSGQRIIZ.jpg', '341', '100g', 134.10000000, 1, 134.10000000, NULL, '2022-12-20 19:31:56', NULL);
INSERT INTO `order_item` VALUES ('20221220193144492', '78743294-d765-4d0f-9781-cf54ca06852a', '290', '一加 10 Pro 12GB+256GB', 'https://img1.imgtp.com/2022/12/03/nSGQRIIZ.jpg', '342', '200g', 134.10000000, 1, 134.10000000, NULL, '2022-12-20 19:31:56', NULL);
INSERT INTO `order_item` VALUES ('20221220193149514', '78743294-d765-4d0f-9781-cf54ca06852a', '290', '一加 10 Pro 12GB+256GB', 'https://img1.imgtp.com/2022/12/03/nSGQRIIZ.jpg', '343', '300g', 134.10000000, 1, 134.10000000, NULL, '2022-12-20 19:31:57', NULL);
INSERT INTO `order_item` VALUES ('20221220193154784', '78743294-d765-4d0f-9781-cf54ca06852a', '290', '一加 10 Pro 12GB+256GB', 'https://img1.imgtp.com/2022/12/03/nSGQRIIZ.jpg', '344', '400g', 134.10000000, 1, 134.10000000, NULL, '2022-12-20 19:31:57', NULL);
INSERT INTO `order_item` VALUES ('20221220193398180', 'dc40efdd-aed8-4c51-8c92-648ca5820156', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '加力加 100g', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-20 19:33:49', NULL);
INSERT INTO `order_item` VALUES ('20221220193843013', '50aaaf83-cbb9-4228-b4b1-74c2c27b2352', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://img1.imgtp.com/2022/12/03/Xn3u9MfX.png', '240', '加力加 100g', 5999.00000000, 1, 5999.00000000, NULL, '2022-12-20 19:38:24', NULL);
INSERT INTO `order_item` VALUES ('20221220194330638', 'f49a5ac9-868f-446f-b752-d2ea4853c329', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '加力加 100g', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-20 19:43:15', NULL);
INSERT INTO `order_item` VALUES ('20221220195049196', '8e8c1379-8a5a-41a7-8c01-fb38077b658d', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '加力加 100g', 2799.30000000, 1, 2799.30000000, NULL, '2022-12-20 19:50:11', NULL);
INSERT INTO `order_item` VALUES ('20221220195051504', '8e8c1379-8a5a-41a7-8c01-fb38077b658d', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '339', '加力加 200g', 1.50000000, 1, 1.50000000, NULL, '2022-12-20 19:50:11', NULL);
INSERT INTO `order_item` VALUES ('20221226202259981', '26b90401-0194-4f41-8ec0-9cd122030b0a', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '24', '加力加 100g', 2799.30000000, 2, 5598.60000000, NULL, '2022-12-26 20:22:14', NULL);
INSERT INTO `order_item` VALUES ('20221226202260022', '26b90401-0194-4f41-8ec0-9cd122030b0a', '242', 'Redmi Note 12 Pro', 'https://img1.imgtp.com/2022/12/03/qu5eZ0Bn.png', '339', '加力加 200g', 1.50000000, 2, 3.00000000, NULL, '2022-12-26 20:22:14', NULL);
INSERT INTO `order_item` VALUES ('20230127220601576', 'ecdc68b2-6621-4ce7-80d8-79624b64bd91', '241', 'Redmi Note 12 5G', 'https://img1.imgtp.com/2022/12/03/OaBNjrBA.png', '239', '加力加 100g', 2324.25000000, 2, 4648.50000000, NULL, '2023-01-27 22:06:16', NULL);
INSERT INTO `order_item` VALUES ('20230127220601582', 'ecdc68b2-6621-4ce7-80d8-79624b64bd91', '101', '好核小核桃', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', '101', '加力加 100g', 1.50000000, 1, 1.50000000, NULL, '2023-01-27 22:06:16', NULL);
INSERT INTO `order_item` VALUES ('20230127230600716', '95867288-ca8c-4298-b0af-7b28ecf4649c', '242', 'Redmi Note 12 Pro', 'https://s2.loli.net/2023/01/27/5LXCJzopQlrqERw.png', '339', '加力加 200g', 1.50000000, 2, 3.00000000, NULL, '2023-01-27 23:06:08', NULL);
INSERT INTO `order_item` VALUES ('20230127230600793', '95867288-ca8c-4298-b0af-7b28ecf4649c', '242', 'Redmi Note 12 Pro', 'https://s2.loli.net/2023/01/27/5LXCJzopQlrqERw.png', '24', '加力加 100g', 2799.30000000, 2, 5598.60000000, NULL, '2023-01-27 23:06:08', NULL);
INSERT INTO `order_item` VALUES ('20230128035205876', 'd66c2c4a-c155-43eb-95e5-2409c2d2bb08', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://s2.loli.net/2023/01/27/EmjVcWrBn71wQxu.png', '240', '加力加 100g', 5999.00000000, 1, 5999.00000000, NULL, '2023-01-28 03:52:59', NULL);
INSERT INTO `order_item` VALUES ('20230128035705164', '364dc1c8-cbd5-429d-be36-95dd5da59665', '243', 'Apple/苹果 iPhone 14 Pro Max', 'https://s2.loli.net/2023/01/27/EmjVcWrBn71wQxu.png', '240', '加力加 100g', 5999.00000000, 1, 5999.00000000, NULL, '2023-01-28 03:57:52', NULL);
INSERT INTO `order_item` VALUES ('20230129162100318', '7018cf24-d1c4-420f-a0c1-9ef2b0336477', '241', 'Note12', 'https://s2.loli.net/2023/01/28/rq28Mh69oP53umj.png', '239', '加力加 100g', 2324.25000000, 1, 2324.25000000, NULL, '2023-01-29 16:21:03', NULL);
INSERT INTO `order_item` VALUES ('20230129200105945', 'a737fac4-beed-445b-bb7f-cf1a06936bab', '241', 'Note12', 'https://s2.loli.net/2023/01/28/rq28Mh69oP53umj.png', '239', '加力加 100g', 2324.25000000, 4, 9297.00000000, NULL, '2023-01-29 20:01:59', NULL);
INSERT INTO `order_item` VALUES ('20230129200105961', 'a737fac4-beed-445b-bb7f-cf1a06936bab', '241', 'Note12', 'https://s2.loli.net/2023/01/28/rq28Mh69oP53umj.png', '86cfe4f3-ffe4-4395-adb4-e28274cccbf0', '8+128G', 2699.00000000, 7, 18893.00000000, NULL, '2023-01-29 20:01:59', NULL);
INSERT INTO `order_item` VALUES ('20230129200300649', '358dc064-9bb5-4785-b118-0850800f9ad5', '242', 'Redmi Note 12 Pro', 'https://s2.loli.net/2023/01/27/5LXCJzopQlrqERw.png', '24', '加力加 100g', 2799.30000000, 2, 5598.60000000, NULL, '2023-01-29 20:03:07', NULL);
INSERT INTO `order_item` VALUES ('20230304211502400', '55cb9889-490b-4f92-9e8a-a61f3da8eebe', '241', 'Note12', 'https://s2.loli.net/2023/01/28/rq28Mh69oP53umj.png', '239', '加力加 100g', 2324.25000000, 2, 4648.50000000, NULL, '2023-03-04 21:15:24', NULL);
INSERT INTO `order_item` VALUES ('20230304211502414', '55cb9889-490b-4f92-9e8a-a61f3da8eebe', '241', 'Note12', 'https://s2.loli.net/2023/01/28/rq28Mh69oP53umj.png', '86cfe4f3-ffe4-4395-adb4-e28274cccbf0', '8+128G', 2699.00000000, 2, 5398.00000000, NULL, '2023-03-04 21:15:24', NULL);
INSERT INTO `order_item` VALUES ('20230304211502457', '55cb9889-490b-4f92-9e8a-a61f3da8eebe', '110', '沃隆扁桃仁', 'https://picasso.alicdn.com/imgextra/O1CNA1JDPrQS1SNg0Rfl0nb_!!2745562235-0-psf.jpg_180x180.jpg_.webp', '110', '加力加 100g', 1.50000000, 2, 3.00000000, NULL, '2023-03-04 21:15:24', NULL);
INSERT INTO `order_item` VALUES ('20230304211502499', '55cb9889-490b-4f92-9e8a-a61f3da8eebe', '103', '巴旦木仁', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2137401477/O1CN01sa6bQr1MmVmwEXBlj_!!2137401477.jpg_180x180.jpg_.webp', '103', '加力加 100g', 1.50000000, 2, 3.00000000, NULL, '2023-03-04 21:15:24', NULL);
INSERT INTO `order_item` VALUES ('20230304211603308', 'd874064c-7a23-4a73-b26f-f7d2af0e8a23', '242', 'Redmi Note 12 Pro', 'https://s2.loli.net/2023/01/27/5LXCJzopQlrqERw.png', '339', '加力加 200g', 1.50000000, 2, 3.00000000, NULL, '2023-03-04 21:16:33', NULL);
INSERT INTO `order_item` VALUES ('20230304211603360', 'd874064c-7a23-4a73-b26f-f7d2af0e8a23', '242', 'Redmi Note 12 Pro', 'https://s2.loli.net/2023/01/27/5LXCJzopQlrqERw.png', '24', '加力加 100g', 2799.30000000, 2, 5598.60000000, NULL, '2023-03-04 21:16:33', NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单ID 同时也是订单编号',
  `user_id` int NOT NULL COMMENT '用户ID',
  `untitled` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '产品名称（多个产品用,隔开）',
  `receiver_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人快照',
  `receiver_mobile` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人手机号快照',
  `receiver_address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货地址快照',
  `total_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '订单总价格',
  `actual_amount` int NULL DEFAULT NULL COMMENT '实际支付总价格',
  `pay_type` int NULL DEFAULT NULL COMMENT '支付方式 1:微信 2:支付宝',
  `order_remark` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `status` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态 1:待付款 2:待发货 3:待收货 4:待评价 5:已完成 6:已关闭',
  `delivery_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '配送方式',
  `delivery_flow_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `order_freight` decimal(32, 8) NULL DEFAULT 0.00000000 COMMENT '订单运费 默认可以为零，代表包邮',
  `delete_status` int NULL DEFAULT 0 COMMENT '逻辑删除状态 1: 删除 0:未删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间（成交时间）',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `flish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '取消时间',
  `close_type` int NULL DEFAULT NULL COMMENT '订单关闭类型1-超时未支付 2-退款关闭 4-买家取消 15-已通过货到付款交易',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('03fee4c0-809c-4a89-874b-63dbd16e235f', 78, 'Redmi Note 12 Pro * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-11 11:43:58', '2022-12-11 11:44:25', '2022-12-11 11:44:23', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('04bb9755-3c0e-429e-8901-df60463d8a9d', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 02:39:02', '2022-12-10 02:40:44', '2022-12-10 02:40:30', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('05732a0b-ad02-405b-a0db-574d27f954b9', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-11 11:48:31', '2022-12-11 11:49:13', '2022-12-11 11:49:10', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('0befb8d6-5311-4683-b7e7-f9610c9cd008', 78, '好核小核桃 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 09:47:58', '2022-12-11 09:47:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('0c3294d4-4d9f-4a02-8b04-09ba270d3ce4', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 02:05:00', '2022-12-10 02:05:24', '2022-12-10 02:05:22', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('0e40e15a-1532-4f3f-a396-8b0e7629ea81', 78, 'Apple/苹果 MacBook Air * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 19599.02000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:05:37', '2022-12-11 11:05:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('184b80b1-6233-4fe9-a6b8-b2dcb57d8b02', 78, '好核小核桃 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 02:12:15', '2022-12-10 02:12:51', '2022-12-10 02:12:48', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('1b7e1dc4-d844-4ea6-a0ba-cb23444ac598', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 09:45:33', '2022-12-11 09:45:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('1d95f14c-55b8-418e-b789-c35ab18e2f10', 78, 'Redmi Note 12 5G * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2324.25000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 02:44:15', '2022-12-10 02:45:10', '2022-12-10 02:45:07', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('241dc6d0-06d1-4018-854e-a0c092306b64', 78, '好核小核桃 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-10 02:43:05', '2022-12-10 02:43:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('26b90401-0194-4f41-8ec0-9cd122030b0a', 78, 'Redmi Note 12 Pro * 2|Redmi Note 12 Pro * 2|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 5601.60000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-26 20:22:14', '2022-12-26 20:22:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('2ba16c48-914c-4adc-b430-f6158eb03030', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 01:44:24', '2022-12-10 01:46:13', '2022-12-10 01:46:07', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('2cbeb4ad-c934-4847-819d-84db52d62a3e', 78, '好核小核桃 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 09:48:22', '2022-12-11 09:48:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('2f45b23f-b3f7-417d-bddf-1157f10949d3', 78, '好核小核桃 * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 1.50000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-11 11:31:57', '2022-12-11 11:32:31', '2022-12-11 11:32:28', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('3439def0-dfef-4035-9cda-306de259da67', 78, '老街口开心果 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 01:58:20', '2022-12-10 01:59:14', '2022-12-10 01:59:11', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('358dc064-9bb5-4785-b118-0850800f9ad5', 83, 'Redmi Note 12 Pro * 2|', '陈冠希', '13100000000', '台湾省高雄市新兴区湾仔码头海上花园11栋1102室', 5598.60000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2023-01-29 20:03:07', '2023-01-29 20:03:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('364dc1c8-cbd5-429d-be36-95dd5da59665', 83, 'Apple/苹果 iPhone 14 Pro Max * 1|', '陈冠希', '13100000000', '台湾省高雄市新兴区湾仔码头海上花园11栋1102室', 5999.00000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2023-01-28 03:57:52', '2023-01-28 03:58:42', '2023-01-28 03:58:37', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('366fcb43-136a-4313-98d0-ef234e23d5d2', 78, '香瓜子葵花籽 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-10 01:34:32', '2022-12-10 01:34:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('37590629-712b-459b-b207-7546c9e1853e', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 01:59:41', '2022-12-10 02:00:26', '2022-12-10 02:00:24', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('3db875f5-8168-4ca9-9128-2a12e3b4dea7', 78, '好核小核桃 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 09:54:56', '2022-12-11 09:54:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('459b0bf9-8f7e-4fa7-86e4-10c5a67545f3', 78, '坚果炒货零食 * 2|原味巴旦木仁 * 2|Apple/苹果 iPhone 14 Pro Max * 2|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 12004.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 21:05:57', '2022-12-11 21:05:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('459b3125-a875-4642-ac5e-402365edb171', 78, 'Redmi Note 12 Pro * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2799.30000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:17:01', '2022-12-11 11:17:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('477f5e18-2ba0-4489-8b00-d124196bf57c', 78, 'Redmi Note 12 5G * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2324.25000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 02:19:34', '2022-12-10 02:20:03', '2022-12-10 02:20:01', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('50aaaf83-cbb9-4228-b4b1-74c2c27b2352', 79, 'Apple/苹果 iPhone 14 Pro Max * 1|', '黄sir', '17677275020', '广西壮族自治区钦州市钦南区菜鸟驿站', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-20 19:38:24', '2022-12-20 19:38:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('50c96d3a-d872-4f66-a275-eab95f9e7689', 78, 'Redmi Note 12 5G * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2324.25000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 09:48:36', '2022-12-11 09:48:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('510322ca-f2e7-49e8-80c1-64e34e0509a8', 78, 'Redmi Note 12 5G * 1|Redmi Note 12 5G * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 4648.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-10 02:45:56', '2022-12-10 02:45:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('5221cdd7-b8b2-425d-b65f-172f3f30ccab', 78, '旺旺雪饼仙贝 * 1|中式小吃虎年礼盒 * 2|每日坚果 * 1|山核桃仁坚果 * 1|福气礼盒 * 1|原味巴旦木仁 * 1|紫皮腰果 * 1|好核小核桃 * 2|焦糖/山核桃味瓜子 * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 16.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:11:02', '2022-12-11 11:11:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('55cb9889-490b-4f92-9e8a-a61f3da8eebe', 83, 'Note12 * 2|Note12 * 2|沃隆扁桃仁 * 2|巴旦木仁 * 2|', '何延卿', '100861314150', '广西壮族自治区来宾市兴宾区广西科技师范学院', 10052.50000000, NULL, NULL, NULL, '1', NULL, NULL, 0.00000000, 0, '2023-03-04 21:15:24', '2023-03-04 21:15:24', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('612952ee-21ab-4015-b89c-d29104bd30d7', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 12:49:49', '2022-12-11 12:49:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('66ba21bb-eb56-41f1-8ef0-45347bbfc153', 78, 'Xiaomi Buds 4 Pro * 2|Galaxy S22 * 2|Apple/苹果 iPhone 14 Pro Max * 2|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 29274.80000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 10:47:00', '2022-12-11 10:47:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('6b1e7ede-8318-4e8f-abb7-983ae178cc4b', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-10 02:32:57', '2022-12-10 02:32:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('7018cf24-d1c4-420f-a0c1-9ef2b0336477', 83, 'Note12 * 1|', '陈冠希', '13100000000', '台湾省高雄市新兴区湾仔码头海上花园11栋1102室', 2324.25000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2023-01-29 16:21:03', '2023-01-29 16:21:57', '2023-01-29 16:21:53', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('7131a89c-038f-4af5-b230-b53570ecb62f', 78, 'Redmi Note 12 5G * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2324.25000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-11 11:38:44', '2022-12-11 11:39:58', '2022-12-11 11:39:54', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('752aed1b-5f29-41fb-9798-18af9360b4fb', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 10:01:58', '2022-12-11 10:01:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('769109a2-c06b-475c-8742-0e2b33abf7eb', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:00:07', '2022-12-11 11:00:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('76b16123-1e78-4ae8-874a-2370adfb58c3', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 10:04:51', '2022-12-11 10:04:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('78743294-d765-4d0f-9781-cf54ca06852a', 79, 'Redmi Note 12 Pro * 10|Redmi Note 12 Pro * 3|一加 10 Pro 12GB+256GB * 1|一加 10 Pro 12GB+256GB * 1|一加 10 Pro 12GB+256GB * 1|一加 10 Pro 12GB+256GB * 1|一加 10 Pro 12GB+256GB * 1|', '黄sir', '17677275020', '广西壮族自治区钦州市钦南区菜鸟驿站', 12938.60000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-20 19:31:56', '2022-12-20 19:33:22', '2022-12-20 19:33:16', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('7b4e1d72-1f14-41ae-9d3d-686e15be50be', 78, '好核小核桃 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 10:02:27', '2022-12-11 10:02:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('7c4bbbd0-3ec1-4822-8175-921edddac678', 78, 'Redmi Note 12 5G * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2324.25000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-10 02:30:03', '2022-12-10 02:30:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('8766b474-a638-444e-b15e-4a2dc85d8e12', 78, 'Apple/苹果 MacBook Air * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 19599.02000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:01:35', '2022-12-11 11:01:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('8e8c1379-8a5a-41a7-8c01-fb38077b658d', 78, 'Redmi Note 12 Pro * 1|Redmi Note 12 Pro * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2800.80000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-20 19:50:10', '2022-12-20 19:50:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('8efa76a1-eea3-43b8-9ea5-7cabb23bd99a', 78, 'Redmi Note 12 5G * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2324.25000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-10 02:29:14', '2022-12-10 02:29:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('95867288-ca8c-4298-b0af-7b28ecf4649c', 83, 'Redmi Note 12 Pro * 2|Redmi Note 12 Pro * 2|', '陈冠希', '13100000000', '台湾省高雄市新兴区湾仔码头海上花园11栋1102室', 5601.60000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2023-01-27 23:06:08', '2023-01-27 23:06:46', '2023-01-27 23:06:43', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('98a98ed4-dc22-4287-b202-29e262d717ca', 78, '好核小核桃 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 02:01:35', '2022-12-10 02:02:02', '2022-12-10 02:01:59', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('a617b2ad-f986-4fd7-98ad-fddf84a3b356', 78, 'Redmi Note 12 Pro * 2|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 5598.60000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:24:27', '2022-12-11 11:24:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('a737fac4-beed-445b-bb7f-cf1a06936bab', 83, 'Note12 * 7|Note12 * 4|', '陈冠希', '13100000000', '台湾省高雄市新兴区湾仔码头海上花园11栋1102室', 28190.00000000, NULL, 2, '可以的很小伙子', '2', NULL, NULL, 0.00000000, 0, '2023-01-29 20:01:59', '2023-03-04 21:21:41', '2023-01-29 20:02:33', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('a96285aa-054e-4645-bdd8-719626a3594d', 78, 'Redmi Note 12 Pro * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-11 11:47:27', '2022-12-11 11:47:52', '2022-12-11 11:47:49', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('a991981a-dcfb-4c0f-9f00-9097ed9c10dd', 78, 'Redmi Note 12 Pro * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2799.30000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:20:25', '2022-12-11 11:20:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('ad894a3a-d6e7-41a6-bd7a-86b2cf2b3537', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 09:45:41', '2022-12-11 09:45:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('ae40947f-b503-479e-948f-3868ba3e755b', 78, 'Apple/苹果 MacBook Air * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 19599.02000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:00:48', '2022-12-11 11:00:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('b0b9c658-42c3-43f9-8d8b-94dfc0212e78', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 5999.00000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-11 11:52:37', '2022-12-11 11:54:10', '2022-12-11 11:54:06', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('b26a2d96-b7c4-4496-8c01-cc38f0935cd4', 78, '好核小核桃 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 09:48:31', '2022-12-11 09:48:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('b44bfe6a-d2c4-4308-9b19-bbf5364d3f8e', 78, 'Redmi Note 12 5G * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2324.25000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-10 01:07:20', '2022-12-10 01:07:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('b5ee1ef3-b03e-4925-9f34-9290f1acc020', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 01:54:45', '2022-12-10 01:55:56', '2022-12-10 01:55:51', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('b9aaa4e8-5d80-4c4a-8c5c-71cb624b5654', 78, '小米小爱音箱Play增强版 * 1|小米氮化镓GaN充电器 Type-C 55W * 1|Galaxy S22 * 1|小米WiFi放大器 Pro * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 8061.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-13 02:22:20', '2022-12-13 02:37:33', '2022-12-13 02:37:27', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('bc79a074-2ee3-4b36-894d-101596bccf3e', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:09:47', '2022-12-11 11:09:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('be2a1ea2-a635-48c7-9a0b-0da5bd02db42', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-10 01:11:03', '2022-12-10 01:11:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('c057f22d-19f8-4968-8786-63adefa0b336', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-09 01:40:22', '2022-12-09 01:40:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('c16fb6d1-fcc3-4ece-98e4-cb234219cee8', 78, 'Redmi Note 12 5G * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2324.25000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:04:11', '2022-12-11 11:04:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('c3636cc4-b8f1-48ab-aa8f-0314cf84b469', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-09 01:58:43', '2022-12-09 01:58:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('c552246e-206c-4a1c-8ceb-6d9c3ec2cff7', 78, '焦糖/山核桃味瓜子 * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 1.50000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 02:17:13', '2022-12-10 02:17:42', '2022-12-10 02:17:39', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('c722eb62-f2bf-4b88-9b9b-becbcd1a233f', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 5999.00000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 01:49:24', '2022-12-10 01:50:13', '2022-12-10 01:50:11', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('c9fba330-137e-4b87-bfde-523824bc8a9d', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:01:41', '2022-12-11 11:01:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('cc1e45a5-f945-4c6a-b872-4ae930d23a98', 78, '老街口开心果 * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 1.50000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 10:28:57', '2022-12-11 10:28:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('cd80d807-1d92-45f4-a99f-a8417d8eb12f', 78, 'Redmi Note 12 Pro * 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-10 02:46:27', '2022-12-10 02:46:57', '2022-12-10 02:46:54', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('d66c2c4a-c155-43eb-95e5-2409c2d2bb08', 83, 'Apple/苹果 iPhone 14 Pro Max * 1|', '陈冠希', '13100000000', '台湾省高雄市新兴区湾仔码头海上花园11栋1102室', 5999.00000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2023-01-28 03:52:59', '2023-01-28 03:53:33', '2023-01-28 03:53:30', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('d874064c-7a23-4a73-b26f-f7d2af0e8a23', 83, 'Redmi Note 12 Pro * 2|Redmi Note 12 Pro * 2|', '何延卿', '100861314150', '广西壮族自治区来宾市兴宾区广西科技师范学院', 5601.60000000, NULL, NULL, NULL, '1', NULL, NULL, 0.00000000, 0, '2023-03-04 21:16:33', '2023-03-04 21:16:33', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('dc40efdd-aed8-4c51-8c92-648ca5820156', 79, 'Apple/苹果 iPhone 14 Pro Max * 1|', '黄sir', '17677275020', '广西壮族自治区钦州市钦南区菜鸟驿站', 5999.00000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-20 19:33:49', '2022-12-20 19:35:44', '2022-12-20 19:35:41', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('e0373674-8385-40df-b908-1300d087b461', 78, 'Apple/苹果 iPhone 14 Pro Max * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:05:27', '2022-12-11 11:05:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('ecdc68b2-6621-4ce7-80d8-79624b64bd91', 83, 'Redmi Note 12 5G * 2|好核小核桃 * 1|', '陈冠希', '13100000000', '台湾省高雄市新兴区湾仔码头海上花园11栋1102室', 4650.00000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2023-01-27 22:06:15', '2023-01-27 22:07:19', '2023-01-27 22:07:13', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('eda1ae9d-989a-4796-b9d3-de670d3c4842', 78, 'Redmi Note 12 5G * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2324.25000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-11 11:33:52', '2022-12-11 11:36:04', '2022-12-11 11:36:00', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES ('efb0bed8-c2fd-4fbd-8aea-413f19b00585', 78, 'Redmi Note 12 Pro * 1|', '黄琳盛', '17677275020', '广西壮族自治区来宾市兴宾区广西科技师范学院菜鸟驿站', 2799.30000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-11 11:03:59', '2022-12-11 11:03:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('f30a09ef-2e73-43e0-b59b-b12c08450ae7', 78, 'Apple/苹果 iPhone 14 Pro Max* 1|', '阿九阿九', '123456', '北京市市辖区东城区阿萨的', 5999.00000000, NULL, NULL, NULL, '6', NULL, NULL, 0.00000000, 0, '2022-12-09 01:33:37', '2022-12-09 01:33:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `orders` VALUES ('f49a5ac9-868f-446f-b752-d2ea4853c329', 79, 'Redmi Note 12 Pro * 1|', '黄sir', '17677275020', '广西壮族自治区钦州市钦南区菜鸟驿站', 2799.30000000, NULL, 2, NULL, '2', NULL, NULL, 0.00000000, 0, '2022-12-20 19:43:15', '2022-12-20 19:45:52', '2022-12-20 19:45:48', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品主键id',
  `product_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称 商品名称',
  `category_id` int NOT NULL COMMENT '分类外键id 分类id',
  `root_category_id` int NULL DEFAULT NULL COMMENT '一级分类外键id 一级分类id，用于优化查询',
  `sold_num` int NOT NULL COMMENT '销量 累计销售',
  `product_status` int NOT NULL COMMENT '默认是1，表示正常状态, -1表示删除, 0下架 默认是1，表示正常状态, -1表示删除, 0下架',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品内容 商品内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `product_star` int NULL DEFAULT NULL COMMENT '1为轮播图商品推荐，3为分类推荐',
  `product_preferred` int NULL DEFAULT NULL COMMENT '商品优选',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('085e8880-780d-4661-a655-5bb780e6505a', '测试123', 5, NULL, 0, 1, '我要飞的更高！！！', '2023-01-25 20:02:57', '2023-01-25 20:02:57', 0, NULL);
INSERT INTO `product` VALUES ('1', '百草味手撕面包', 1, 2, 128, 1, '百草味手撕面包1kg蛋糕早餐代餐休闲小吃食品零食整箱囤货糕点心', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('10', '轩妈家经典蛋黄酥糕', 1, 2, 128, 1, '轩妈家经典蛋黄酥糕点礼盒雪媚娘面包甜品点心零食休闲食品小吃', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('100', '焦糖/山核桃味瓜子', 5, 2, 128, 1, '老街口 焦糖/山核桃味瓜子500g*4袋装葵花籽坚果炒货零食散装批发', '2021-04-26 11:11:11', '2023-01-27 02:41:37', 1, 0);
INSERT INTO `product` VALUES ('101', '好核小核桃', 5, 2, 128, 1, '来伊份百年好核小核桃仁118g坚果炒货临安特产', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('102', '老街口开心果', 5, 2, 128, 1, '老街口开心果500g 年货零食坚果炒货特产干果仁孕妇', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('102d4ad1-ade3-4268-9398-7e636ffda775', '特色飞机3', 5, NULL, 0, 1, '123飞机', '2023-01-25 20:31:55', '2023-01-26 06:58:03', 0, NULL);
INSERT INTO `product` VALUES ('103', '巴旦木仁', 5, 2, 128, 1, '天虹牌巴旦木仁500g 无壳原味坚果炒货零食孕妇食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('104', '紫皮腰果', 5, 2, 128, 1, '【三只松鼠_紫皮腰果160gx2袋】带衣原味坚果仁干', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('105', '坚果炒货零食', 5, 2, 128, 1, '【三只松鼠_坚果炒货零食组合】零食小吃休闲食品夜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('106', '香瓜子葵花籽', 5, 2, 128, 1, '蜜雪冰城雪王魔法铺 香瓜子葵花籽洽洽坚果炒货休闲', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('107', '原味巴旦木仁', 5, 2, 128, 1, '每果时光原味巴旦木仁500g扁桃仁杏仁巴达木干果孕', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('108', '洽洽焦糖味瓜子', 5, 2, 128, 1, '洽洽焦糖味瓜子坚果炒货108g*6袋休闲零食批发恰恰葵', '2022-12-03 00:52:24', '2022-12-03 00:52:26', 1, 0);
INSERT INTO `product` VALUES ('109', '夏威夷果', 5, 2, 128, 1, '新农哥夏威夷果500g海盐撞奶味坚果炒货孕妇儿童烘', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('11', '百草味华夫饼', 1, 2, 128, 1, '\r\n百草味华夫饼1kg整箱营养早餐蛋糕食品办公室休闲零食西式糕点心', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('110', '沃隆扁桃仁', 5, 2, 128, 1, '沃隆扁桃仁950g无壳原味坚果巴旦木仁零食干果炒货', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('111', '五香味坚果', 5, 2, 128, 1, '新瓜子脱皮五香味坚果零食网红炒货多味葵花籽白皮', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('112', '福气礼盒', 5, 2, 128, 1, '良品铺子福气礼盒1460g坚果炒货干果年货礼盒高端送礼休', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('113', '山核桃仁坚果', 5, 2, 128, 1, '沃隆碧根果仁650g山核桃仁坚果干果炒货营养零食量', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('114', '每日坚果', 5, 2, 128, 1, '每日坚果混合坚果500g包邮大罐装巴旦木果仁干果坚', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('115', '芥末味夏威夷果', 5, 2, 128, 1, ' 山姆会员超市500g芥末味夏威夷果仁坚果 山姆代购炒', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('116', '洽洽瓜子海盐味', 5, 2, 128, 1, '洽洽瓜子海盐味500g恰恰瓜子葵花籽葵花子休闲零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('117', '三只松鼠坚果', 5, 2, 128, 1, '三只松鼠坚果零食大礼包网红礼品干果炒货送女友组', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('118', '新货巴旦木仁', 5, 2, 128, 1, '2022年新货巴旦木仁罐装原味干果坚果大杏仁片扁桃', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('119', '混合坚果仁', 5, 2, 128, 1, '每日坚果混合坚果仁干果500g包邮大罐装营养休闲孕', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('12', '披风卷毛巾', 1, 2, 128, 1, '好利来奥巧披风卷毛巾卷脏脏包芝士奶油圣诞零食糕点点心', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('120', '毛嗑瓜子', 5, 2, 128, 1, '【4斤装】毛嗑瓜子500g*4袋新鲜原味五香葵花籽', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('121', '秋田满满山楂卷', 6, 2, 128, 1, '秋田满满山楂卷棒棒糖果丹皮老式片零食果干脯蜜饯', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('122', '怡达VC山楂棒棒', 6, 2, 128, 1, '怡达VC山楂棒棒糖糖果10g*30支山楂果脯蜜饯零食棒', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('123', '有零有食草莓', 6, 2, 128, 1, '有零有食草莓+芒果冻干96g酸奶水果干儿童孕妇零食糖果蜜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('124', '铝金盖塑料瓶', 6, 2, 128, 1, ' 铝金盖塑料瓶食品罐带盖饼干糖果蜜饯蜂蜜杂粮收纳', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('125', '千禧园美国西梅话梅', 6, 2, 128, 1, '千禧园美国西梅话梅干果蜜饯订婚结婚庆喜糖散装网', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('126', '大号蜜饯饼干盒', 6, 2, 128, 1, ' 带盖塑料瓶透明食品密封罐子空瓶子大号蜜饯饼干盒', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('127', '陈皮蓝莓山楂棒儿', 6, 2, 128, 1, '金晔小牛山楂棒棒糖蜜饯果脯原味陈皮蓝莓山楂棒儿', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('128', '低脂肪【草莓干】', 6, 2, 128, 1, '低脂肪【草莓干】散装酸甜果脯果干蜜饯独立包装结', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('129', '零食点心饼干', 6, 2, 128, 1, '8510 透明盖 零食点心饼干罐子 辣椒酱蜜饯 蜂蜜糖果 塑料', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('13', '中式小吃虎年礼盒', 1, 2, 128, 1, '正宗北京三禾稻香村传统手工点心零食老式中式小吃虎年礼盒大礼包', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('130', '冰糖莲子', 6, 2, 128, 1, '潮汕特产零食冰糖莲子糖结婚糖果蜜饯年货蔬果干即', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('131', '混合蜜饯话梅', 6, 2, 128, 1, '混合蜜饯话梅果干组合果脯水果干酸甜梅肉凉果梅子糖果儿', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('132', ' 承德兴隆山楂丝', 6, 2, 128, 1, ' 承德兴隆山楂丝雪花条糖果脯蜜饯学生儿童零食小包', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('133', '糖莲子莲藕', 6, 2, 128, 1, '糖莲子莲藕即食广东省结婚特产零食喜糖冰蜜饯年货', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('134', '5斤装山楂卷', 6, 2, 128, 1, '5斤装山楂卷果丹皮京卷山里红球糕铁山楂组合蜜饯年', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('135', '快乐果园QQ', 6, 2, 128, 1, '快乐果园QQ老婆梅松辉绿茶梅珍珠九制话梅肉湿话梅', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('136', '梅槑果优选原味', 6, 2, 128, 1, '梅槑果优选原味梅肉酸甜梅子话梅办公室休闲零食糖果果干', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('14', '稻香村拿破仑', 1, 2, 128, 1, '稻香村拿破仑700G蛋糕糕点早餐营养奶油面包整箱点心办公室小零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('140', '青梅子酸味', 6, 2, 128, 1, '广东5斤装新兴四通爽口青梅子酸味泡水新鲜脆梅果脯', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('141', '糖莲子即食莲', 6, 2, 128, 1, '糖莲子即食莲藕结婚庆喜糖果500g蜜饯传统零食小吃', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('142', '粒上皇奶香奶芙草莓', 6, 2, 128, 1, '粒上皇奶香奶芙草莓干夹心奶枣奶芙黄桃干果奶球蜜饯糖果', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('143', ' 杰龙果园美式', 6, 2, 128, 1, ' 杰龙果园美式西梅话梅干果蜜饯500g结婚庆喜糖果年', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('144', '零度深林三分', 6, 2, 128, 1, '零度深林三分甜减糖果脯蜜饯500g小包装凉果杏脯加', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('145', 'GODIVA歌帝梵', 7, 2, 128, 1, 'GODIVA歌帝梵72% 85%浓醇可可黑巧克力21片装', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('146', 'Lindt瑞士莲软', 7, 2, 128, 1, '【自营】Lindt瑞士莲软心巧克力球50粒600g喜糖礼', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('147', '费列罗巧克力', 7, 2, 128, 1, '费列罗巧克力官方旗舰店榛果威化巧克力金球48粒经', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('148', '好利来冰山', 7, 2, 128, 1, '好利来冰山熔岩巧克力糕点纯可可脂礼盒甜品网红休闲圣诞', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('149', '费列罗金球榛果', 7, 2, 128, 1, '费列罗金球榛果威化巧克力48粒零食婚礼礼物散装批发喜糖', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('15', '蛋黄酥零食整箱', 1, 2, 128, 1, '蛋黄酥零食整箱夜宵充饥早餐休闲食品面包糕点网红雪媚娘小吃点心', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('150', '费列罗巧克力', 7, 2, 128, 1, '【自营】Ferrero费列罗巧克力软心榛果夹心零食婚礼', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('151', '德芙巧克力', 7, 2, 128, 1, '德芙巧克力礼盒装3碗牛奶黑巧克力多口味零食小吃休', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('152', '榛果威化巧克力', 7, 2, 128, 1, ' 费列罗官方旗舰店榛果威化巧克力96粒婚礼2粒装喜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('153', '歌帝梵欢', 7, 2, 128, 1, 'GODIVA歌帝梵欢享牛奶黑巧克力制品40颗比利时进', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('154', '费列罗榛果威', 7, 2, 128, 1, '费列罗榛果威化巧克力零食96粒婚礼装喜糖糖果礼物', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('155', '德芙巧克力', 7, 2, 128, 1, '德芙巧克力小碗装112g*6碗小吃零食食品黑巧克', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('156', '士力架花生夹心', 7, 2, 128, 1, '士力架花生夹心巧克力460g分享装全家桶装补充能量棒休闲', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('157', '费列罗婚礼装巧克力', 7, 2, 128, 1, ' 费列罗婚礼装巧克力t96粒金莎网红零食喜糖伴手礼礼', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('158', '喜糖散装批发', 7, 2, 128, 1, '喜糖散装批发结婚礼订婚糖专用混合徐福记满月糖果', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('159', '结婚喜糖散装', 7, 2, 128, 1, '结婚喜糖散装批发徐福记订婚糖巧克力喜枣乔迁满月', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('16', '友臣小贝肉松', 1, 2, 128, 1, '友臣小贝肉松海苔蛋糕整箱营养早餐面包网红食品宵夜点心休闲小吃', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('160', '诺梵金松露', 7, 2, 128, 1, '诺梵金松露巧克力零食官方旗舰店礼盒装圣诞礼物喜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('161', 'Laderach莱德拉', 7, 2, 128, 1, 'Laderach莱德拉坚果小袋装巧克力礼盒瑞士进口纯可可脂零', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('162', '牛奶黑巧克力', 7, 2, 128, 1, '法国Lindt瑞士莲日历巧克力倒数牛奶黑巧圣诞节礼物', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('163', '诺梵金松露巧克力', 7, 2, 128, 1, '诺梵金松露巧克力官方旗舰店零食喜糖礼盒纯可可脂', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('164', '日本北海道进口', 7, 2, 128, 1, 'ROYCE若翼族生巧克力制品日本北海道进口零食生巧', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('165', '比利时进口巧克力', 7, 2, 128, 1, '朵娜贝拉比利时进口巧克力礼盒装酒心黑圣诞节送女', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('166', '比利时小金罐', 7, 2, 128, 1, 'PIERREMARCOLINI皮尔马可里尼进口比利时小金罐', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('167', '球白巧黑巧榛仁', 7, 2, 128, 1, 'Lindt瑞士莲进口软心精选牛奶巧克力球白巧黑巧榛仁600克', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('168', '乐奈黑松露巧克力', 7, 2, 128, 1, '乐奈黑松露黑巧克力礼盒装零食旗舰店圣诞节礼物喜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('169', '香辣鱼仔即食', 8, 2, 128, 1, '100包香辣鱼仔即食深海小鱼干湖南特产麻辣海味零食小吃休闲食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('17', '纯蛋糕小面包', 1, 2, 128, 1, '纯蛋糕小面包牛奶鸡蛋糕老式整箱批发原味糕点心袋装早餐网红零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('170', '三只松鼠香烤鱿鱼丝', 8, 2, 128, 1, '三只松鼠香烤鱿鱼丝88g_海味即食零食鱿鱼丝', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('171', '鲜香烤鱿鱼丝', 8, 2, 128, 1, '【三只松鼠_鲜香烤鱿鱼丝88gx2袋】休闲海味即食零食手撕鱼类食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('172', '老海公黄鱼酥深海', 8, 2, 128, 1, '老海公黄鱼酥深海小黄鱼香酥鱼干零食即食孕妇海味', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('173', '海带丝香辣即食', 8, 2, 128, 1, ' 100包海带丝香辣即食裙带菜海带海味即食海带结零', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('174', ' 鱿鱼丝鱿鱼干', 8, 2, 128, 1, ' 鱿鱼丝鱿鱼干网红零食大全各种解馋美食追剧推荐手', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('175', '韩国进口大林鳕龙', 8, 2, 128, 1, ' 韩国进口思潮大林鳕龙虾蟹肉棒模拟手撕蟹柳蟹棒即', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('176', ' 元臻鲜烤鳕鱼片盒装', 8, 2, 128, 1, ' 元臻鲜烤鳕鱼片盒装 休闲即食海味零食办公室小吃鲜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('177', '老鲜生鱿鱼仔满籽', 8, 2, 128, 1, '老鲜生鱿鱼仔满籽海味小吃零食带籽墨鱼仔即食海鲜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('178', '卫龙零食麻辣海带', 8, 2, 128, 1, '卫龙零食麻辣海带26g*20包盒装休闲海味网红小吃榨菜下饭', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('179', '好照头黄金渔翅鱼', 8, 2, 128, 1, '好照头黄金渔翅鱼翅鱼刺香辣鱼排湖南特产海味即食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('18', '百草味肉松饼', 1, 2, 128, 1, '百草味肉松饼1kg蛋糕点心营养早餐代餐面包美食小吃传统零食整箱', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('180', '劲仔香辣味深海小鱼', 8, 2, 128, 1, '劲仔香辣味深海小鱼300g鱼仔鱼干海味怀旧宿舍好耐吃零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('181', ' 香辣鱿鱼仔带籽满籽', 8, 2, 128, 1, ' 香辣鱿鱼仔带籽满籽鱿鱼丝干墨鱼仔即食海味零食熟', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('182', '卫龙小鱼干海味', 8, 2, 128, 1, '卫龙小鱼干海味开袋即食辣条解馋零食小吃休闲食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('183', '过年货送礼置办', 8, 2, 128, 1, '过年货送礼置办高档淡干海参鲍鱼礼盒装花胶人参四', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('184', '手撕鱿鱼条罐装', 8, 2, 128, 1, '手撕鱿鱼条罐装碳烤鱿鱼须丝孕妇零食海味小吃即食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('185', '香辣鱿鱼仔鱼干', 8, 2, 128, 1, '【百草味-带籽鱿鱼仔180g】香辣鱿鱼仔鱼干零食熟', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('186', '手撕蟹柳蟹棒', 8, 2, 128, 1, '力诚原味手撕蟹柳蟹棒500g即食海味解馋儿童零食螺蛳粉方', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('187', '口水娃小鱼仔', 8, 2, 128, 1, '口水娃小鱼仔口水鱼小包装小鱼干湖南特产海味即食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('188', '百草味海苔肉松蛋卷', 8, 2, 128, 1, '百草味海苔肉松蛋卷100g*2罐夹心网红小吃海味休闲零食即', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('189', ' 鳕鱼片', 8, 2, 128, 1, ' 鳕鱼片500g鱼片干烤鱼片即食原味孕妇儿童海味零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('19', '稻香村糕点礼盒', 1, 2, 128, 1, '稻香村糕点礼盒2000g特产传统中式老式散装点心茶点零食送礼长辈', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('190', '渔大叔零食大礼包', 8, 2, 128, 1, '渔大叔零食大礼包虾即食鱿鱼扇贝海味礼盒大连特产', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('191', '里奈零食香辣鱿鱼仔', 8, 2, 128, 1, '里奈零食香辣鱿鱼仔500g满籽鱿鱼丝即食海味聚餐零食小吃', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('192', ' 鱿鱼条碳烤鱿鱼干', 8, 2, 128, 1, ' 鱿鱼条碳烤鱿鱼干海鲜即食零食手撕鱿鱼丝网红孕妇', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('193', '蜜桃乌龙茶', 9, 2, 129, 1, 'CHALI 蜜桃乌龙茶玫瑰花桂花乌龙花茶果茶茶叶茶里公司', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('194', '霸气超级桶蜜桃乌龙', 9, 2, 129, 1, 'CHALI 霸气超级桶蜜桃乌龙桂花乌龙茶花茶果茶包茶', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('195', '干柠檬片泡茶', 9, 2, 129, 1, '买1发3冻干柠檬片泡茶干片蜂蜜花茶养生茶水果茶泡', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('196', '红枣桂圆枸杞茶', 9, 2, 129, 1, '良品铺子红枣桂圆枸杞茶花茶包红枣茶小袋装花茶水', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('197', '雪王花果茶白桃', 9, 2, 129, 1, '蜜雪冰城雪王魔法铺 雪王花果茶白桃/草莓乌龙茶手工', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('198', '水果茶茶包', 9, 2, 129, 1, '蜜桃乌龙茶白桃绿茶花茶水果茶茶包冷泡茶养生茶茶', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('199', '立顿茉莉花', 9, 2, 129, 1, '立顿茉莉花茶绿茶红茶乌龙茶菊花茶玫瑰花茶茶包伯爵冷泡', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('2', '奇亚籽低脂全麦面包', 1, 2, 128, 1, '良品铺子——奇亚籽低脂全麦面包1kg早餐糕点心面包吐司整箱', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('20', '奇亚籽低脂全麦面包', 1, 2, 128, 1, '良品铺子——奇亚籽低脂全麦面包1kg早餐糕点心面包吐司整箱', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('200', '洛神花茶玫瑰', 9, 2, 129, 1, '洛神花茶玫瑰茄果脯洛神花新鲜洛神花干商用茶包旗', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('201', '洛神花茶玫瑰', 9, 2, 129, 1, '洛神花茶玫瑰茄旗舰店花茶水果茶好在乎云南精挑大', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('202', '黑枸杞桑葚', 9, 2, 129, 1, '黑枸杞桑葚干玫瑰花茶组合花茶养生茶女搭刺梨花果', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('203', '杏林草堂冻', 9, 2, 129, 1, '杏林草堂冻干水果茶花茶果干冷泡茶冲泡茶包多种口', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('204', '聚广德冻干柠檬片', 9, 2, 129, 1, '聚广德冻干柠檬片泡水喝蜂蜜干柠檬冲饮花茶茶包水', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('205', '奈雪的茶', 9, 2, 129, 1, '奈雪的茶一周好茶7袋/盒茶包冷泡水果茶花茶乌龙茶', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('206', '北鼎袋泡茶桂花', 9, 2, 129, 1, '北鼎袋泡茶桂花雪梨茶无花果茶花茶茶包糖水材料冷', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('207', '蜂蜜冻干柠檬片', 9, 2, 129, 1, '蜂蜜冻干柠檬片泡水喝水果茶花茶单独包装加蜂蜜味', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('208', '布兰兔爱丽丝', 9, 2, 129, 1, '布兰兔爱丽丝之梦花茶礼盒果粒茶果茶组合水果茶果', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('209', '冷泡茶水果茶', 9, 2, 129, 1, '冷泡茶水果茶茶包多种口味纯果茶孕妇花果茶花茶夏', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('21', '旺旺大礼包628g袋装', 2, 2, 128, 1, '旺旺大礼包628g袋装680g818g礼盒饼干膨化组合走亲访友送人食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('210', '乌龙白桃茶', 9, 2, 129, 1, '良品铺子-007日茶20g/袋茶包果茶茉莉花茶红茶乌龙白桃茶', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('211', ' 艺福堂金桔柠', 9, 2, 129, 1, ' 艺福堂金桔柠檬百香果蜂蜜柠檬片冻干水果茶泡水花', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('212', '精选柠檬片', 9, 2, 129, 1, '精选柠檬片500g包邮 柠檬干片泡水喝干柠檬片水果茶', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('213', '蜜桃乌龙茶', 9, 2, 129, 1, '蜜桃乌龙茶+茉莉花茶袋泡茶白桃乌龙花果水果茶组合', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('214', '水果茶茶包', 9, 2, 129, 1, '水果茶茶包多种口味金桔百香果茶冲泡花茶冻干柠檬', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('215', '精选柠檬片', 9, 2, 129, 1, '精选柠檬片不加糖泡茶干片泡水喝的花茶水果茶500g', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('216', '冻干柠檬片', 9, 2, 129, 1, '冻干柠檬片旗舰店蜂蜜香水柠檬干水果茶花茶养生茶', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('217', '品牌面包饼干', 10, 2, 1210, 1, '品牌面包饼干零食大礼包健康面食早餐糕点心休闲食品买一送一整箱', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('218', '品牌蓝色装零食', 10, 2, 1210, 1, '品牌蓝色装零食大礼包适合送男友男生闺蜜儿童小孩小朋友生日礼物', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('219', '品牌食品泰国炒米', 10, 2, 1210, 1, '品牌食品泰国炒米小包装风味牛肉味休闲食品解馋小', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('22', '三角酥夹心威化饼干', 2, 2, 128, 1, '熔岩巧克力味三角酥夹心威化饼干儿童休闲小吃零食品网红点心膨化', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('220', '品牌零食大礼包', 10, 2, 1210, 1, '品牌零食大礼包麻薯干吃汤圆糯米糍糕点孕妇儿童女', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('221', '好丽友零食', 10, 2, 1210, 1, '好丽友零食大礼包送女友小孩礼物巧克力派品牌礼包', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('222', '良品铺子零食', 10, 2, 1210, 1, '良品铺子零食大礼包生日礼物网红品牌肉食送女友官', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('223', '中样礼包套盒', 10, 2, 1210, 1, '中样礼包套盒各种全部来自专柜品牌采购的小样们库', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('224', '儿童品牌零食', 10, 2, 1210, 1, '儿童品牌零食大礼包 组合 营养健康超大行李箱小孩儿童节', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('225', '零食水果味夹心饼', 10, 2, 1210, 1, '品牌零食水果味夹心饼干零食大礼包组合一整箱女生', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('226', '网红开心鸭混合零食', 10, 2, 1210, 1, '品牌网红开心鸭混合零食大礼包礼盒装组合一整箱送', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('227', '网红品牌零食大礼包', 10, 2, 1210, 1, ' 网红品牌零食大礼包儿童整箱巨型组合休闲食品猪饲', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('228', '品牌零食大礼包', 10, 2, 1210, 1, ' 品牌零食大礼包麻辣网红小吃休闲食品卤味肉类巨型', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('229', '俄罗斯巧克力', 10, 2, 1210, 1, '品牌零食俄罗斯巧克力糖果零食大礼包孕妇女生混合', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('23', '旺旺雪饼仙贝', 2, 2, 128, 1, '旺旺雪饼仙贝520g大米饼零食锅巴饼干膨化休闲食品批发年货大礼包', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('230', '休闲小零食大礼包', 10, 2, 1210, 1, '品牌休闲小零食大礼包送男女朋友生日礼物混组合多', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('231', '品牌礼物零食大礼包', 10, 2, 1210, 1, '品牌礼物零食大礼包肉食类整箱送女友好吃的充饥夜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('232', ' 旗舰品牌零食大礼包', 10, 2, 1210, 1, ' 旗舰品牌零食大礼包混合小吃圣诞节礼物送女友老婆', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('233', '品牌零食大礼包', 10, 2, 1210, 1, '品牌零食大礼包小孩生日礼物情侣零食大礼包女孩子', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('234', '澳味坊品牌老婆饼', 10, 2, 1210, 1, '澳味坊品牌直发老婆饼广东特产零食大礼包送女友网', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('235', ' 高端品牌零食大礼包', 10, 2, 1210, 1, ' 高端品牌零食大礼包生日礼物送闺蜜女生仪式感高级', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('236', '多比伦零食大礼包', 10, 2, 1210, 1, '多比伦品牌零食大礼包纯肉送女友网红爆款小吃休闲', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('237', '旺旺大礼包', 10, 2, 1210, 1, '旺旺大礼包送孩子送女友节日礼包万圣节圣诞大箱零', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('238', '旺旺儿童零食大礼包', 10, 2, 1210, 1, '旺旺儿童零食大礼包一整箱混合装品牌送男女朋友小', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('239', '品牌坚果肉食零食', 10, 2, 1210, 1, '品牌坚果肉食零食大礼包礼盒休闲高端儿童零食大礼', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('24', '旺旺仙贝雪饼零', 2, 2, 128, 1, '旺旺仙贝雪饼零食米饼休闲聚会童年怀旧雪米饼膨化饼干仙贝80包', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('240', '零食大礼包', 10, 2, 1210, 1, '零食大礼包一整箱混装送女朋友儿童品牌小吃休闲食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('241', 'Note12', 11, 2, 1211, 1, '三星 OLED 护眼屏｜骁龙 5G 芯｜5000mAh 电量', '2021-04-26 11:11:11', '2023-01-27 22:20:43', 1, 1);
INSERT INTO `product` VALUES ('242', 'Redmi Note 12 Pro', 11, 2, 1211, 1, '「256GB版本优惠100元」IMX766 防抖相机｜OLED 柔性直屏｜67W 闪充\r\n\r\n「256GB版本优惠100元」IMX766 防抖相机｜OLED 柔性直屏｜67W 闪充\r\n\r\nIMX766 防抖相机｜OLED 柔性直屏｜67W 闪充', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('243', 'Apple/苹果 iPhone 14 Pro Max', 11, 2, 1211, 1, '每位顾客限购2部IPhone14手机', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('244', 'Apple/苹果 MacBook Air', 11, 2, 1211, 1, 'Apple/苹果 MacBook Air Apple M2 芯片 8 核中央处理器 8 核图形处理器 8GB 统一内存 256GB 固态硬盘', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('245', '小米小爱音箱增强版', 62, 2, 1262, 1, '内置红外遥控，一句话控制传统家电内置红外遥控，一句话控制传统家电 | LED时钟显示，自适应亮度调节', '2021-09-26 11:11:11', '2023-01-26 06:26:50', 1, 0);
INSERT INTO `product` VALUES ('246', 'Galaxy S22', 11, 2, 1211, 1, '三星Galaxy S22+将精致的设计与一流的内部结构相结合，提供纤薄且精心打造的设计，具有令人惊叹的显示屏、性能强大的处理器和改进的摄像头。', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('247', 'Galaxy S22 Ultra', 11, 2, 1211, 1, '三星Galaxy S22+将精致的设计与一流的内部结构相结合，提供纤薄且精心打造的设计，具有令人惊叹的显示屏、性能强大的处理器和改进的摄像头。', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('248', 'Xiaomi Buds 4 Pro', 62, 2, 1262, 1, '48dB智能动态降噪｜骨声纹通话降噪 | 独立空间音频', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('249', '小米移动电源3 20000mAh USB-C双向快充版', 62, 2, 1262, 1, 'USB-C 18W双向快充 / 可为三台设备同时充电 / 高品质锂离子聚合物电池', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('25', '米格玛', 2, 2, 128, 1, '徐福记米格玛500g糙米卷夹心米果棒蛋卷饼干膨化休闲零食奶油牛排', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('250', '小米氮化镓GaN充电器 Type-C 55W', 62, 2, 1262, 1, '精致小巧，快速回血所有常用设备', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('251', '黑鲨电竞手游肩键', 62, 2, 1262, 1, '安卓苹果通用 / 亚光合金按键 / 欧姆龙微动开关 / 灵巧便携设计', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('252', 'CyberDog 仿生四足机器人', 62, 2, 1262, 1, '探索让未来更酷', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('253', '小米WiFi放大器 Pro', 62, 2, 1262, 1, '智能设备上网伴侣 | 2X2外置天线 | 极速配对 | 300Mbps强电版', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('254', '米家声波电动牙刷T700', 61, 2, 1262, 1, '无级动力调节 / 39600次/分强劲动力 / 磁悬浮声波马达，低噪更减震 / 山形结构，2倍植毛 / LED智能屏，米家互联', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('255', '米家全能扫拖机器人', 61, 2, 1262, 1, '自动洗拖布+自集尘| AI+3D避障|激光导航|全场景智能联动|热风烘干', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('256', 'BESPOKE 缤色铂格冰箱', 61, 2, 1262, 1, 'BESPOKE 缤色铂格冰箱 RF60A91C355', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('257', '米家空气净化器 4 Pro', 61, 2, 1262, 1, '强效除醛去味 | 99.99%抗菌抗病毒 | 母婴优选', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('258', 'BESPOKE 缤色铂格', 61, 2, 1262, 1, '三星衣物护理机专属香氛盒*2(赠品)', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('259', 'BESPOKE 缤色铂格吸尘器', 61, 2, 1262, 1, 'BESPOKE Jet 缤色铂格吸尘器', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('26', '旺旺正品雪饼', 2, 2, 128, 1, '旺旺正品雪饼仙贝散装零食品饼干大包整箱网红小吃膨化休闲大礼包', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('260', 'Redmi电竞路由器AX5400', 61, 2, 1262, 1, '2.5G次世代网口 | 高通专业级芯片 | 双WAN接入+双LAN聚合，支持双运营商宽带叠加 | 赠330天游戏加速器', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('261', 'Redmi G Pro 游戏本', 60, 2, 1262, 1, 'Redmi G Pro 游戏本', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('262', 'Redmi Book Pro 15 2022', 60, 2, 1262, 1, '全新12代英特尔处理器 | Windows 11 家庭中文版 | 可选RTX 2050高性能独立显卡 | 3.2K 90Hz 原色超清屏', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('263', 'Galaxy Tab S8 Ultra ', 60, 2, 1262, 1, 'Galaxy Tab S8 Ultra WLAN (Wi-Fi) 键盘套装', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('264', 'Galaxy Tab S8 Ultra', 60, 2, 1262, 1, 'Galaxy Tab S8 Ultra', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('265', 'ROG幻16', 60, 2, 1262, 1, 'ROG幻16 2022 第12代英特尔酷睿 2.5K165Hz16英寸设计师轻薄高性能游戏笔记本电脑  (i7-12700H 16G 512G RTX3060 P3广色域)', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('266', 'MacBook Air', 60, 2, 1262, 1, '定制你的 MacBook Air', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('267', 'MacBook Pro', 60, 2, 1262, 1, 'Apple M1 Max 芯片 (10 核中央处理器、32 核图形处理器和 16 核神经网络引擎)\r\n32GB 统一内存\r\n1TB 固态硬盘\r\n16 英寸 Liquid 视网膜 XDR 显示屏\r\n三个雷雳 4 端口，以及 HDMI 端口、SDXC 卡插槽和 MagSafe 3 端口\r\n140W USB-C 电源适配器\r\n带有触控 ID 的背光妙控键盘 - 中文 (拼音)', '2021-09-26 11:11:11', '2021-09-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('27', '丹麦进口 蓝罐曲奇饼', 2, 2, 128, 1, '丹麦进口 蓝罐曲奇饼干908g膨化罐装铁盒休闲零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('28', '惟度台湾风味米饼', 2, 2, 128, 1, '惟度台湾风味米饼袋芝士蛋黄饼干糙米卷休闲膨化好吃的零食排行榜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('29', '旺旺旺仔小馒头', 2, 2, 128, 1, '旺旺旺仔小馒头小包装饼干儿童零食膨化散装宝宝零食小吃休闲食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('290', '一加 10 Pro', 11, 2, 1211, 1, '广角摄像头：4800 万像素，IMX789，1/1.43\"，1.12μm，7P，光圈：f/1.8，OIS，等效焦距：23mm\r\n超广角摄像头: 5000 万像素，JN1，1/2.76\"，0.64μm，6P，f/2.2，150° 超大广角\r\n长焦摄像头: 800 万像素，5P，f/2.4，OIS，等效 77mm（3.3x）\r\n前置摄像头\r\n3200 万像素，IMX615，f/2.4', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('2af1d5d1-f09f-42b7-8f27-304af55492f3', '音箱Play增强版', 5, NULL, 0, 1, '内置红外遥控，一句话控制传统家电内置红外遥控，一句话控制传统家电 | LED时钟显示，自适应亮度调节', '2023-01-26 05:13:59', '2023-01-26 06:43:12', 1, NULL);
INSERT INTO `product` VALUES ('3', '良品铺子-牛乳沙琪玛', 1, 2, 128, 1, '\r\n【良品铺子-牛乳沙琪玛500g】早餐零食整箱传统糕点心休闲小吃', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('30', '日本KUKKIA巧克力', 2, 2, 128, 1, '日本红帽子KUKKIA巧克力奶油威化夹心饼干四种口味', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('31', '天日盐小圆饼', 2, 2, 128, 1, '良品铺子天日盐小圆饼102gx2袋咸味饼干膨化零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('32', '旺旺黑米雪饼', 2, 2, 128, 1, '旺旺黑米雪饼零食大礼包膨化休闲食品旺仔小吃饼干散装组合170g*4', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('32d064a9-201a-4ed2-a00b-faf3b430df75', '测试飞机2', 5, NULL, 0, 1, '11123', '2023-01-25 20:27:14', '2023-01-25 20:27:14', 0, NULL);
INSERT INTO `product` VALUES ('33', '旺旺仙贝雪饼', 2, 2, 128, 1, '旺旺仙贝雪饼520g大礼包小小酥大米饼膨化营养儿童饼干休闲零食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('34', '日本KUKKIA巧克力', 2, 2, 128, 1, '日本红帽子KUKKIA巧克力奶油威化夹心饼干四种口味', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('35', '泡吧小脆饼', 2, 2, 128, 1, '泡吧小脆饼干非油炸薯片膨化食品芥末烧烤鸡肉味网红休闲零食小吃', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('36', '百草味花椒锅巴', 2, 2, 128, 1, '百草味花椒锅巴110gx3饼干膨化网红休闲零食小吃耐吃宿舍薯片怀旧', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('37', '美国玉米片', 2, 2, 128, 1, '现货~美国POPCORNERS玉米片噗噗脆零食薯片膨化小吃饼干食品142g', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('38', '倍利客台湾风味米饼', 2, 2, 128, 1, '倍利客台湾风味米饼原味膨化饼干休闲食品办公室零食正品大礼包', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('39', '米多奇粗粮雪米饼', 2, 2, 128, 1, '米多奇粗粮雪米饼饼干膨化零食大礼包整箱批发家庭装散装50包600g\r\n月销 3000+', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('4', '宫廷桃酥饼', 1, 2, 128, 1, '\r\n宫廷桃酥饼干整箱年货老式糕点散装早餐手工休闲零食小吃点心食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('40', '旺旺雪饼', 2, 2, 128, 1, '旺旺雪饼84g*20/10袋整箱包邮 休闲膨化酥性饼干点心小吃办公零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('41', '韩国切达芝士球', 2, 2, 128, 1, '韩国nobrand切达芝士球大桶装小零食即食奶酪脆饼干膨化食品网红', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('42', '小黑饼夹心饼', 2, 2, 128, 1, '小黑饼夹心饼干膨化零食小吃休闲食品网红爆款整箱散装多口味吃货', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('43', '韩国进口小零食礼包', 2, 2, 128, 1, '韩国进口小零食大礼包原装小吃网红爆款礼盒膨化特产明星同款饼干', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('44', '旺旺仙贝膨化零食', 2, 2, 128, 1, '旺旺仙贝膨化零食400g休闲饼干儿童小吃下午茶', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('45', '三只松鼠_鸭脖', 3, 2, 128, 1, '三只松鼠_鸭脖154g】肉类熟食卤味小零食鸭', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('46', '蜂蜜烤鸡小腿鸡翅', 3, 2, 128, 1, '无穷食品旗舰店蜂蜜烤鸡小腿鸡翅肉类休闲小吃小鸡腿熟食零食整箱', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('47', '麻辣解馋熟食', 3, 2, 128, 1, '零食大礼包麻辣解馋熟食小吃卤味肉类休闲食品网红', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('48', '五香猪耳', 3, 2, 128, 1, '500g五香猪耳朵熟食卤味真空开袋即食下酒菜肉类休', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('49', '盐焗鸡腿', 3, 2, 128, 1, '无穷食品旗舰店盐焗鸡腿70g*5袋充饥零食肉类熟食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('5', '百草味零食大礼包', 1, 2, 128, 1, '百草味零食大礼包糕点点心早餐充饥饼干面包整箱小吃大全休闲食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('50', '百草味肉类卤味礼盒', 3, 2, 128, 1, '百草味肉类卤味礼盒580g麻辣礼包休闲零食牛肉条鸡腿熟食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('51', '舜华临武鸭', 3, 2, 128, 1, '舜华临武鸭湖南特产鸭脖鸭翅鸭胗肉类卤味零食混装', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('52', '北京烤鸭全聚德', 3, 2, 128, 1, '全聚德旗舰店北京烤鸭全聚德烤鸭含饼酱北京特产熟', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('53', '百草味-鸭脖子', 3, 2, 128, 1, '满减【百草味-鸭脖子170g】甜辣五香休闲食品鸭肉类零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('54', '三凤桥酱排骨', 3, 2, 128, 1, '三凤桥酱排骨卤味熟食红烧排骨佐餐肉类小吃无锡特', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('542fe357-283d-4732-8987-42d8ad7301fe', '箱Play增强版', 5, NULL, 0, 1, '内置红外遥控，一句话控制传统家电内置红外遥控，一句话控制传统家电 | LED时钟显示，自适应亮度调节', '2023-01-26 05:17:06', '2023-01-26 05:17:06', 1, NULL);
INSERT INTO `product` VALUES ('55', '虎皮凤爪香辣', 3, 2, 128, 1, '虎皮凤爪香辣虎皮鸡爪零食麻辣凤爪肉类卤味熟食休', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('56', '周黑鸭零食大礼包', 3, 2, 128, 1, '周黑鸭零食大礼包整箱网红卤味肉类熟食小吃男生圣', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('57', '牛脆骨零食肉类', 3, 2, 128, 1, '牛脆骨零食肉类牛脆骨软骨追剧解馋熟食香辣脆骨办', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('571de01b-ecc8-4002-b164-ca411416fcf2', '测试', 5, NULL, 0, 1, '我要飞的更高！！！', '2023-01-25 20:01:04', '2023-01-25 20:01:04', 0, NULL);
INSERT INTO `product` VALUES ('58', '良品铺子猪肉粒', 3, 2, 128, 1, '【149元任选10件】良品铺子猪肉粒98g肉干肉脯肉类零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('59', '湘霸王香辣鸭', 3, 2, 128, 1, ' 湘霸王香辣鸭翅整箱18gx30袋卤味酱香小鸭翅肉类', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('5c129ecb-21e2-409f-81cd-d369b036aea0', '测试飞机1', 5, NULL, 0, 0, '飞机!!!', '2023-01-25 20:25:11', '2023-01-25 20:25:11', 0, NULL);
INSERT INTO `product` VALUES ('6', '嘉华鲜花饼经典玫瑰饼', 1, 2, 128, 1, '嘉华鲜花饼经典玫瑰饼10枚家庭装云南特产零食小吃传统糕点心饼干', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('60', '五香猪皮熟食', 3, 2, 128, 1, '五香猪皮熟食小吃真空肉类零食下酒菜即食食品好吃', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('61', '卤味香辣鸡排', 3, 2, 128, 1, '卤味香辣鸡排50g鸡块真空包装鸡骨头蜜汁鸡架肉类', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('62', '来伊份盐焗卤味', 3, 2, 128, 1, '新品 来伊份盐焗卤味弹力鸡爪125g凤爪肉类网红零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('625b361c-4fbe-4161-b51b-8b713846a075', '123', 1, NULL, 0, 1, '啊啊', '2023-01-25 03:12:44', '2023-01-25 03:12:44', 0, NULL);
INSERT INTO `product` VALUES ('63', '小帅虎手撕烤脖', 3, 2, 128, 1, '小帅虎手撕烤脖特产卤味熟食肉类小零食小吃休闲食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('64', '老街口鸭货卤味', 3, 2, 128, 1, '老街口鸭货卤味大礼包小龙虾尾鸭脖鸭锁骨鸭翅根熟', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('65', '蹄猪蹄髈猪肘', 3, 2, 128, 1, '沈万三 年货周庄特产万三蹄猪蹄髈猪肘1000g肉类熟', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('66', '卤味鸭架货肉', 3, 2, 128, 1, '老街口甜辣鸭锁骨 卤味鸭架货肉类解馋零食小吃熟食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('67', '正宗德州乡盛扒鸡', 3, 2, 128, 1, '正宗德州乡盛扒鸡五香鸡清真鸡熟食即食肉类零食整', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('68', '舜华临武鸭', 3, 2, 128, 1, '舜华临武鸭湖南郴州特产香辣鸭肉零食鸭货即食鸭肉', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('69', '杨先生桂花芡实八珍糕', 1, 2, 128, 1, '杨先生桂花芡实八珍糕杭州特产健康食品糕点孕妇零食小吃点心美食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('6b7a74b1-ee63-44dc-93cb-89eacee66c2c', '焦糖/山核桃味瓜子', 5, NULL, 0, 1, '老街口 焦糖/山核桃味瓜子500g*4袋装葵花籽坚果炒货零食散装批发', '2023-01-26 05:12:22', '2023-01-26 05:12:22', 1, NULL);
INSERT INTO `product` VALUES ('7', '友臣肉松饼', 1, 2, 128, 1, '友臣肉松饼1kg早餐零食食品手撕传统糕点休闲面包食品小点心整箱', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('70', '三只松鼠和风麻薯', 1, 2, 128, 1, '三只松鼠和风麻薯150g_休闲零食糕点心糯米雪媚娘', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('71', '早餐小口袋营养面包', 1, 2, 128, 1, '【三只松鼠_乳酸菌小伴侣520g】早餐小口袋营养面包零食蛋糕点心', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('72', '轩妈家低糖版蛋黄酥', 1, 2, 128, 1, '轩妈家低糖版蛋黄酥月饼330g雪媚娘糕点食品点心休闲零食早餐食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('7399292a-c97e-475e-8732-d18847ed3cc1', '669a', 1, NULL, 0, 1, 'asd', '2023-01-25 19:40:49', '2023-01-25 19:40:49', 0, NULL);
INSERT INTO `product` VALUES ('74', '香辣藕片', 4, 2, 128, 1, '香辣藕片即食麻辣素食辣味解馋零食小吃休闲食品网', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('75', '百草味鱼豆腐', 4, 2, 128, 1, '百草味鱼豆腐烧烤味185g休闲零食小吃卤味豆干豆腐干素食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('76', '辣卤零食大礼包', 4, 2, 128, 1, '辣卤零食大礼包鸭脖肉食类卤味熟食素食网红辣条解', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('77', '豆干豆腐干素食肉', 4, 2, 128, 1, '久久丫甜辣味薄豆干豆腐干素食肉干卤味休闲零食145g*3包', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('78', '甜辣薄豆干', 4, 2, 128, 1, '久久丫甜辣薄豆干500g麻辣豆腐干网红零食卤味食品', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('79', '口水娃藕片', 4, 2, 128, 1, '口水娃藕片500g卤味莲藕素食麻辣藕丁网红解馋小零', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('8', '三只松鼠手撕面包', 1, 2, 128, 1, '三只松鼠手撕面包1000gX1箱零食早餐休闲食品蛋糕点心吐司', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('80', '功德林上海素鸭', 4, 2, 128, 1, '功德林上海素鸭素食食品纯素素肉豆干素鸡豆制品零', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('81', '如约夹笋豆脯', 4, 2, 128, 1, '如约夹笋豆脯270g笋丝豆干烤肉夹豆干香辣手撕卤味', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('82', '无锡特产卤汁豆腐', 4, 2, 128, 1, '包邮无锡特产卤汁豆腐干80g10盒苏州风味卤味熟食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('83', '湘滨土豆丸', 4, 2, 128, 1, '湘滨土豆丸家香辣小土豆麻辣即食烤土豆小吃卤味休', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('84', '辣卤零食大礼', 4, 2, 128, 1, '辣卤零食大礼包鸭脖辣条熟素食即食夜宵充饥卤味网', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('85', '如约夹笋豆脯', 4, 2, 128, 1, '如约夹笋豆脯笋丝豆干烤肉夹豆干香辣手撕卤味素食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('86', '鲜蔬麻辣味零食', 4, 2, 128, 1, '百草味鲜蔬麻辣味零食大礼包510g网红卤味零食素食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('87', '福州永日香卤味', 4, 2, 128, 1, '福建特产福州永日香卤味豆丝105克/190克 豆腐皮素', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('88', '笋丝豆干', 4, 2, 128, 1, '卤半卤 笋丝豆干150g*2袋 夹笋豆脯豆腐干卤味素食办', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('89', '福州永日香卤味', 4, 2, 128, 1, '福州永日香卤味豆丝190g豆腐皮素食香干豆干小包105g早餐', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('9', '好丽友巧克力派', 1, 2, 128, 1, '好丽友巧克力派30枚1020g送礼糕点点心新下午茶早餐零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 1);
INSERT INTO `product` VALUES ('90', '台湾特产素食大溪豆', 4, 2, 128, 1, '台湾特产素食大溪豆干沙茶香辣卤味250g佛学院纯素', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('91', '口口巧藕片卤味', 4, 2, 128, 1, '口口巧藕片卤味香辣脆藕片麻辣素食莲藕丁小包装下', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('92', '肉香菇素肉', 4, 2, 128, 1, ' 三只松鼠菇的肉香菇素肉220g×3袋零食特产麻辣味', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('93', '福州永日香卤味豆丝', 4, 2, 128, 1, '福州永日香卤味豆丝小包105克大包190g 豆腐干素食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('94', '沙县油豆腐', 4, 2, 128, 1, '沙县小吃卤味油豆腐片豆制品火锅冷冻豆腐干油炸素', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('95', '馋嘴猴香菇豆', 4, 2, 128, 1, '馋嘴猴香菇豆干500g散装卤味素食豆制品零食小包装', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('96', ' 馋嘴猴手磨豆干', 4, 2, 128, 1, ' 馋嘴猴手磨豆干500g散装卤味素食豆制品零食小包装', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('97', '奶油味吊瓜子', 5, 2, 128, 1, ' 正宗奶油味吊瓜子2022坚果炒货原味新货休闲零食瓜', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('976d549e-bc8a-4226-b98e-55075c3a3e1a', '9988', 1, NULL, 0, 1, '669', '2023-01-26 06:45:49', '2023-01-26 06:45:49', 0, NULL);
INSERT INTO `product` VALUES ('98', '蜂蜂蜜黄油扁桃仁', 5, 2, 128, 1, '汤姆农场韩国进口芭蜂蜂蜜黄油扁桃仁80g坚果炒货', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 1, 0);
INSERT INTO `product` VALUES ('99', '洽洽香瓜子', 2, 2, 128, 1, '洽洽香瓜子160g五香味童年回忆恰恰香瓜子休闲零食', '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0, 0);
INSERT INTO `product` VALUES ('a873317d-9b92-42af-b3c4-324a998e40fc', '焦糖/山核桃味瓜子', 5, NULL, 0, 1, '老街口 焦糖/山核桃味瓜子500g*4袋装葵花籽坚果炒货零食散装批发', '2023-01-26 05:12:14', '2023-01-26 05:12:14', 1, NULL);
INSERT INTO `product` VALUES ('af88de9b-c450-440f-b74b-2794b5c426fe', '16464', 1, NULL, 0, 1, '123', '2023-01-26 06:43:56', '2023-01-26 06:43:56', 0, NULL);
INSERT INTO `product` VALUES ('dd4345ed-ae7b-46fb-ad7e-499b0be89a8b', '测试飞机3', 5, NULL, 0, 1, '11123', '2023-01-25 20:27:29', '2023-01-25 20:27:29', 0, NULL);
INSERT INTO `product` VALUES ('f2daf683-ecfa-4fe6-a088-d76153406454', '79112', 1, NULL, 0, 1, '666', '2023-01-26 06:45:02', '2023-01-26 06:45:02', 0, NULL);
INSERT INTO `product` VALUES ('ff7a8a72-0f9d-4769-b0de-2c478c722b70', '测试飞机', 5, NULL, 0, 1, 'asd', '2023-01-25 20:17:38', '2023-01-25 20:17:38', 0, NULL);

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments`  (
  `comm_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID',
  `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
  `product_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `order_item_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单项(商品快照)ID 可为空',
  `user_id` int NULL DEFAULT NULL COMMENT '评论用户id 用户名须脱敏',
  `is_anonymous` int NULL DEFAULT NULL COMMENT '是否匿名（1:是，0:否）',
  `comm_type` int NULL DEFAULT NULL COMMENT '评价类型（1好评，0中评，-1差评）',
  `comm_level` int NOT NULL COMMENT '评价等级 1：好评 2：中评 3：差评',
  `comm_content` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评价内容',
  `comm_imgs` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评价晒图(JSON {img1:url1,img2:url2}  )',
  `sepc_name` datetime NULL DEFAULT NULL COMMENT '评价时间 可为空',
  `reply_status` int NULL DEFAULT NULL COMMENT '是否回复（0:未回复，1:已回复）',
  `reply_content` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `is_show` int NULL DEFAULT NULL COMMENT '是否显示（1:是，0:否）',
  PRIMARY KEY (`comm_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `order_item_id`(`order_item_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `product_comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_comments_ibfk_2` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品评价 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_comments
-- ----------------------------

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片主键',
  `item_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品外键id 商品外键id',
  `url` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图片地址 图片地址',
  `sort` int NULL DEFAULT NULL COMMENT '顺序 图片顺序，从小到大',
  `is_main` int NOT NULL COMMENT '是否主图 是否主图，1：是，0：否',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `product_star` int NULL DEFAULT NULL COMMENT '是否为推荐的商品图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`item_id` ASC) USING BTREE,
  CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品图片 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES ('07c5d329-de7f-4b0a-af77-9757842b834e', '32d064a9-201a-4ed2-a00b-faf3b430df75', 'https://s2.loli.net/2023/01/25/mJFw1WSoZzKkp73.jpg', NULL, 0, '2023-01-25 20:27:22', '2023-01-25 20:27:22', 0);
INSERT INTO `product_img` VALUES ('0f0ad4d5-1fbe-4cb1-899b-bbe37c84a523', '542fe357-283d-4732-8987-42d8ad7301fe', 'https://img1.imgtp.com/2022/12/03/2mMw5GmJ.jpg', NULL, 1, '2023-01-26 05:17:07', '2023-01-26 05:17:07', 0);
INSERT INTO `product_img` VALUES ('0f132754-7c1c-41e5-a614-89d923201e1e', '5c129ecb-21e2-409f-81cd-d369b036aea0', 'https://s2.loli.net/2023/01/25/lB1LINuSYWwn3Oi.jpg', NULL, 0, '2023-01-25 20:25:12', '2023-01-25 20:25:12', 0);
INSERT INTO `product_img` VALUES ('0f8d5c6a-6eaf-45de-aba4-5b261d0f8a26', '100', 'https://s2.loli.net/2023/01/26/2tJWiyMlkVeA3BZ.jpg', NULL, 0, '2023-01-26 12:20:54', '2023-01-26 12:20:54', 0);
INSERT INTO `product_img` VALUES ('1', '100', 'https://s2.loli.net/2023/01/26/2tJWiyMlkVeA3BZ.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('10', '101', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01HnmbtE1OwFRMZp73v_!!732501769.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('100', '102', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01k7Q6LP2K7AzIfpJht_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('101', '103', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2137401477/O1CN01sa6bQr1MmVmwEXBlj_!!2137401477.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('102', '104', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/880734502/O1CN0163GmSd1j7xt05hlNH-880734502.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('1026dc33-381e-425f-b3ae-6d41df57d3cc', '102d4ad1-ade3-4268-9398-7e636ffda775', 'https://s2.loli.net/2023/01/26/V16tuW3gi9Z8DPc.jpg', NULL, 0, '2023-01-26 06:57:47', '2023-01-26 06:57:47', 0);
INSERT INTO `product_img` VALUES ('103', '105', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/880734502/O1CN01yUqSwM1j7xsy2GlVp_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('104', '106', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2209047029735/O1CN01efaj7S2LmgUv9XRmp_!!2209047029735.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('105', '107', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/4070486739/O1CN01M3BZne1zeVidczWNC_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('106', '108', 'https://img1.imgtp.com/2022/12/03/tf3G5hlb.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('107', '109', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/105152347/O1CN01ixseQs1TCyMVH0hQP_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('108', '11', 'https://gw.alicdn.com/imgextra/i4/628189716/O1CN01cNxuKZ2LdyyBmRbd9_!!628189716.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('109', '110', 'https://picasso.alicdn.com/imgextra/O1CNA1JDPrQS1SNg0Rfl0nb_!!2745562235-0-psf.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('11', '111', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/2211313128676/O1CN01kF0fJl2Dxf34FOPDM_!!2211313128676.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('110', '112', 'https://img1.imgtp.com/2022/12/03/EVF1C8jz.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('111', '113', 'https://gw.alicdn.com/imgextra/O1CN01gL6trl1SNg0NSzQ4o_!!2745562235-0-picasso.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('112', '114', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/3937219703/O1CN01eqfE3R2LY1p5aP7Ge_!!3937219703-0-C2M.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('113', '115', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/914181358/O1CN01c2o39E1Lu0eY1yjV9_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('114', '116', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/742982950/O1CN01jxnFeX1Xf9BmeeeXO_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('115', '117', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2208039733002/O1CN01LOxQjN1Y2xle6DfMp_!!2208039733002.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('116', '118', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/2200662340883/O1CN01VgohhL1IOSWPhTGr3_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('117', '119', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/3937219703/O1CN01fVnDOH2LY1oPngxe7_!!3937219703-0-C2M.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('118', '12', 'https://gw.alicdn.com/imgextra/i4/2455221099/O1CN01Lzn3ts1JzO3u1aXIB_!!2455221099.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('119', '120', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2214603206114/O1CN01yA0XpC1v2GLOKLUDS_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('12', '121', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/2454544321/O1CN01Dm4qwi1hn4BjKscyA-2454544321.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('120', '122', 'https://img1.imgtp.com/2022/12/03/S4xQYUfq.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('121', '123', 'https://img1.imgtp.com/2022/12/03/gTyFg8oJ.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('122', '124', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/2209027812348/O1CN01sQhLik1TDQclycalZ_!!2209027812348.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('123', '125', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2210969231848/O1CN01m2MFLJ1PWQi0rsMTZ_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('124', '126', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2315839183/O1CN01BMO2ff2HhrnLikEgZ_!!2315839183.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('125', '127', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/1014978183/O1CN0158MBpS2AJrmzldkn1_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('126', '128', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/918087376/O1CN011i0irf24MG3s5uJ52_!!918087376.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('127', '129', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/3455712009/O1CN019c8TMI1QiAKiaHHWu_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('128', '13', 'https://gd1.alicdn.com/imgextra/i1/807674560/O1CN01Lb13I41jYWnnEECHF_!!807674560.jpg_400x400.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('129', '130', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/829393627/O1CN01I833cA1cfDFu1xPGB_!!829393627.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('13', '131', 'https://img1.imgtp.com/2022/12/03/BvGS8CBZ.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('130', '132', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2923710944/O1CN012whTAZ1IqOa9egq2g_!!2923710944.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('131', '133', 'https://img1.imgtp.com/2022/12/03/7aSzVv5f.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('132', '134', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/3171797070/O1CN01SAQqPb2266r4okX9y_!!3171797070.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('133', '135', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/752121475/O1CN01hJXi9H1MlagDQXM9T_!!752121475.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('134', '136', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2208144599973/O1CN01H9uxmZ2NXgbUAH1xS_!!2208144599973.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('135', '136', 'https://gw.alicdn.com/imgextra/i1/628189716/O1CN01aImqXQ2LdyyO9TTXI-628189716.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('136', '136', 'https://gw.alicdn.com/imgextra/i1/628189716/O1CN01aImqXQ2LdyyO9TTXI-628189716.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('137', '136', 'https://gw.alicdn.com/imgextra/i1/628189716/O1CN01aImqXQ2LdyyO9TTXI-628189716.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('138', '14', 'https://gw.alicdn.com/imgextra/i1/1692258071/O1CN01bEJ66t29UZRSNhR5C_!!0-item_pic.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('139', '140', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2211616325377/O1CN01BmSRYO1paiLOK8oBw_!!2211616325377.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('14', '141', 'https://img1.imgtp.com/2022/12/03/gQpRHfSQ.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('140', '142', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/104214133/O1CN01hFsvQq1gOxgfHzedM_!!104214133.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('141', '143', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/256596659/O1CN014L9sIk1z3sB9PTKo9_!!256596659.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('142', '144', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/160899307/O1CN01nir3172IcesDf4ZsE_!!160899307.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('143', '145', 'https://picasso.alicdn.com/imgextra/O1CNA1QdJPkf1lqy2FmlkNB_!!885684871-0-psf.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('144', '146', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/2549841410/O1CN0137lYgF1MHpFRQbpvz_!!2549841410-0-sm.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('145', '147', 'https://picasso.alicdn.com/imgextra/O1CNA1c8E85d1zYYjYdBOUx_!!814886726-0-psf.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('146', '148', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/2455221099/O1CN015qiR0C1JzO4WOW4fO_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('147', '149', 'https://img1.imgtp.com/2022/12/03/Gp8w5n4s.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('148', '15', 'https://gw.alicdn.com/imgextra/i4/2123446495/O1CN01lJv3j31xqlF3uCAAh_!!0-item_pic.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('149', '150', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2549841410/O1CN01C6h93V1MHpFegnCOi_!!2549841410-0-sm.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('15', '151', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/877104952/O1CN01GTHGig1mS47HVIkdD_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('150', '152', 'https://picasso.alicdn.com/imgextra/O1CNA1IiEnGx1zYYjhpHagS_!!814886726-0-psf.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('151', '153', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/885684871/O1CN0178tD4P1lqy1qoZaDH_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('152', '154', 'https://img1.imgtp.com/2022/12/03/ockan6dx.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('153', '155', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/877104952/O1CN01OAkPs21mS46sg1DoA_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('154', '156', 'https://img1.imgtp.com/2022/12/03/bKuFu6r7.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('155', '157', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/3365155289/O1CN01r4GOYY1owPaMHVk1m_!!3365155289.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('156', '158', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/2056503521/O1CN01EK1bfO1bsfKIg480o_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('157', '159', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/354608922/O1CN01v7niYK2FmKUljE1eC_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('158', '16', 'https://gw.alicdn.com/imgextra/O1CNA1z7nr0W1FEtP4ee5yY_!!1690440456-0-psf.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('159', '160', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/848228203/O1CN01nI2hvv2AT1iuK7IYZ_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('16', '161', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2209133360674/O1CN01OaqWMN1GqjjxixDmI_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('160', '162', 'https://img1.imgtp.com/2022/12/03/AX3XbR5C.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('161', '163', 'https://gw.alicdn.com/imgextra/O1CN01H09dul268ddI7KU4X_!!3790477617-0-picasso.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('162', '164', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/2743979168/O1CN01DKkXTD2HazmrekQzN_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('163', '165', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/2208801566581/O1CN01U3usqr1yU9J1DcSyM_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('164', '166', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1107557890/O1CN01elveHm289fl3ulYwh_!!1107557890.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('165', '167', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/739302607/O1CN01qdK0xM1V83LHAISnz_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('166', '168', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/4105886707/O1CN01WN2eC91zPr5DEFCcX_!!4105886707.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('167', '169', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/3937219703/O1CN01tmaL6c2LY1oe09LL7_!!3937219703-0-C2M.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('168', '17', 'https://gw.alicdn.com/imgextra/i3/3937219703/O1CN01lCuGGf2LY1owSfg2y_!!3937219703-0-C2M.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('169', '170', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/880734502/O1CN01YEo7W01j7xsws1E8z-880734502.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('17', '171', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/880734502/O1CN01ymcLn21j7xsySVyuC-880734502.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('170', '172', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2200635781575/O1CN01SJj9mg1NVObPRU57H_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('171', '173', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/3937219703/O1CN01amrwkH2LY1n8STpVm_!!3937219703-0-C2M.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('172', '174', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2207874828404/O1CN01RQoUrj2Bx5ET1237S_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('173', '175', 'https://gw.alicdn.com/imgextra/O1CN01g74kD51pWasYqSOhf_!!2208691975368-0-picasso.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('174', '176', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/3017776938/O1CN01sRgGr1217ehCsJEYh_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('175', '177', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/1084887957/O1CN01TnuQIQ28eMIM9tLbp_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('176', '178', 'https://img1.imgtp.com/2022/12/03/NA8cXgvb.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('177', '179', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2207874828404/O1CN01RQoUrj2Bx5ET1237S_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('178', '18', 'https://img.alicdn.com/imgextra/i1/6000000003465/O1CN01IfN24E1bT1AOXMTNa_!!6000000003465-0-picassoopen.jpg_430x430q90.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('179', '180', 'https://gw.alicdn.com/imgextra/O1CN01g74kD51pWasYqSOhf_!!2208691975368-0-picasso.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('18', '181', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/3017776938/O1CN01sRgGr1217ehCsJEYh_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('180', '182', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/1084887957/O1CN01TnuQIQ28eMIM9tLbp_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('181', '183', 'https://img1.imgtp.com/2022/12/03/NA8cXgvb.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('182', '184', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2126571636/O1CN012LWwcL1NxKkt807Nb_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('183', '185', 'https://img1.imgtp.com/2022/12/03/2uuKTQJn.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('184', '186', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2126571636/O1CN012LWwcL1NxKkt807Nb_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('185', '187', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1715535627/O1CN01sjgjMD1rRDBrfFbGO_!!1715535627.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('186', '188', 'https://img1.imgtp.com/2022/12/03/LZOyorLd.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('187', '189', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2942872819/O1CN011jtOdo1Wh9GKfLLTB_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('188', '19', 'https://gw.alicdn.com/imgextra/i2/1692258071/O1CN01bguawX29UZRWsd8Wh_!!0-item_pic.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('189', '190', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/2200718410550/O1CN01PqcFTo1FvwbxDbK80_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('19', '191', 'https://img1.imgtp.com/2022/12/03/4awsBpvG.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('190', '192', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/2942872819/O1CN01mQPWcV1Wh9GG9m6Z2_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('191', '193', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/2033033217/O1CN01pAIfhf1ZdQwCGKA2w_!!2033033217.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('192', '194', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2033033217/O1CN016Yz3uR1ZdQwABEuxp_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('193', '195', 'https://img1.imgtp.com/2022/12/03/jZjpttrL.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('194', '196', 'https://img1.imgtp.com/2022/12/03/BiwLUVM6.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('195', '197', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/2209047029735/O1CN01PiwgJ02LmgTl7JaG2_!!2209047029735.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('196', '198', 'https://img1.imgtp.com/2022/12/03/BiwLUVM6.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('197', '199', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/288922974/O1CN01EmOX1r1Xq8hA38UFl_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('198', '2', 'https://gw.alicdn.com/imgextra/i1/619123122/O1CN01WJaNIx1YvvJSr5e7S-619123122.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('199', '20', 'https://gw.alicdn.com/imgextra/i1/619123122/O1CN01WJaNIx1YvvJSr5e7S-619123122.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('1ec81016-7c65-4562-b586-3bc9a710c261', '5c129ecb-21e2-409f-81cd-d369b036aea0', 'https://s2.loli.net/2023/01/25/sLQzPNUWIDp9aCu.jpg', NULL, 1, '2023-01-25 20:25:11', '2023-01-25 20:25:11', 0);
INSERT INTO `product_img` VALUES ('1fd21fd6-3d1c-4b0d-8830-b293ca373a69', 'a873317d-9b92-42af-b3c4-324a998e40fc', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01lEycCW2K7AzLZgkEZ_!!0-item_pic.jpg_180x180.jpg_.webp', NULL, 1, '2023-01-26 05:12:14', '2023-01-26 05:12:14', 0);
INSERT INTO `product_img` VALUES ('2', '200', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/2271789261/O1CN01TehUwQ2IHajD6ZDd1_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('20', '201', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2452407048/O1CN01bXPkiz21w2EtMrNXy_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('200', '202', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2928278102/O1CN01mS4mP329ilijU0nd8_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('201', '203', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/3336196577/O1CN01dX6LdU1ySJgkIMfoa_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('202', '204', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2271789261/O1CN01qvRpGx2IHajFTAU3L_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('203', '205', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/2207459016846/O1CN01yf5j8F20RWGQ05da1_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('204', '206', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/508370014/O1CN014c6PGF1BySLOb2diD_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('205', '207', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2923712711/O1CN01yzRWT31VtgUpcuYiy_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('206', '208', 'https://picasso.alicdn.com/imgextra/O1CNA1Hj7AG12BXR9blHYGn_!!2201435958348-0-psf.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('207', '209', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/2211696450840/O1CN01VHhN601I4lQKo3yXZ_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('208', '21', 'https://gw.alicdn.com/imgextra/i1/628189716/O1CN01aImqXQ2LdyyO9TTXI-628189716.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('209', '210', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/619123122/O1CN019fYHpS1YvvJi84P0E_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('21', '211', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/184783763/O1CN01p8x8uo1dfVBwfxTvS_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('210', '212', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/402009904/O1CN01iC1zSk2N25JFsfE36_!!402009904.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('211', '213', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/2200654953183/O1CN01nrDMCq1ZNrRDwBp1E_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('212', '214', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2209155832404/O1CN01DWwB4c1Td4uawRqwc_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('213', '215', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2869175655/O1CN010ts6zs1re2XMfj4wQ_!!2869175655.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('214', '216', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/4235503249/O1CN01Kux6jQ1Zs5aHGLMl7_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('215', '217', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/877104952/O1CN011cpEPK1mS47BUBhcs_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('216', '218', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/4035167786/O1CN01wMEzY627O2YpqQ9vh_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('217', '219', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/877104952/O1CN01hMQli01mS47AvnmOe_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('218', '22', 'https://img.alicdn.com/imgextra/i4/6000000003374/O1CN01T4tdxl1anKyoemKus_!!6000000003374-0-at.jpg_430x430q90.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('219', '220', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2214326183810/O1CN01Pb2PsG1e11nrftjIq_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('22', '221', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/2210369470923/O1CN01SEKp1w1IgmKPAx45T_!!2210369470923.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('220', '222', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/3086043724/O1CN01aqsd5P1dNdcl8OPKe_!!3086043724.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('221', '223', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/4035167786/O1CN01wA2S5y27O2Yp0ZkQv_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('222', '224', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/2200716305283/O1CN01vnqC661otf0qOuOds_!!2200716305283.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('223', '225', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/2472111525/O1CN019Oi9Bb1N8UlfkfbNy_!!2472111525.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('224', '226', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/2204181115591/O1CN01mkWxDI1rAj9ldo2bT_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('225', '227', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/2207672192043/O1CN01fMFhjV1QxjqDNqJyg_!!2207672192043.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('226', '228', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2201297798356/O1CN013kBTSz2Bb68xbnibo_!!2201297798356.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('227', '229', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2048931804/O1CN01mlBwgU1PCHHYejXJ0_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('228', '23', 'https://gw.alicdn.com/imgextra/i1/3586740366/O1CN0108CZpX1EZfgms5pRc_!!3586740366-0-lubanu-s.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('229', '230', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/2212030281792/O1CN01e45TOy1P6mXp3bLTd_!!2212030281792.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('23', '231', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2207117991341/O1CN010oR9IB1LmDv2J4KXc_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('230', '232', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/718783471/O1CN01WKR7IY1bVlFqfWhng_!!718783471.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('231', '233', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/4066663004/O1CN01Edez5N1Y3sOb7vjMM_!!4066663004.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('232', '234', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2200716305283/O1CN019SJ4yH1otf3jSW1mW_!!2200716305283.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('233', '235', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2472111525/O1CN01zJV2aq1N8UlEFJMH4_!!2472111525.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('234', '236', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/3360775925/O1CN01EfSeYN1tdhQxHkVXl_!!3360775925.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('235', '237', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/2202155395398/O1CN0194Z1gm1pkKjxFEw4x_!!2202155395398.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('236', '238', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/3086043724/O1CN011oyXFk1dNdj7PiPTG_!!3086043724.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('237', '239', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/3360775925/O1CN01Ay4gFh1tdhQlkulIK_!!3360775925.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('238', '24', 'https://gd2.alicdn.com/imgextra/i2/1865856284/O1CN01YbdAzs1wI7fkZMard_!!1865856284.jpg_400x400.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('239', '240', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/2472380996/O1CN013sfIh41JEDFsm4UGG_!!2472380996.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('24', '241', 'https://s2.loli.net/2023/01/28/rq28Mh69oP53umj.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('240', '242', 'https://s2.loli.net/2023/01/27/5LXCJzopQlrqERw.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('241', '243', 'https://s2.loli.net/2023/01/27/EmjVcWrBn71wQxu.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('242', '244', 'https://s2.loli.net/2023/01/27/UJRWqxj7rw8tvkf.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('243', '245', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1627877128.28898525.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('244', '246', 'https://s2.loli.net/2023/01/27/SA6hXuIzPL9UJVg.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('245', '247', 'https://s2.loli.net/2023/01/27/tV9mOLk8672vhlF.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('246', '248', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1660191428.10535375.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('247', '249', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1572510715.11624812.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('248', '25', 'https://gw.alicdn.com/imgextra/i4/2212197296702/O1CN018YqMVj1zNZEKLxByx_!!2212197296702.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('249', '250', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609137528.17462695.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('25', '251', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1596103484.64061523.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('251', '248', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1660191428.13455433.png', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('252', '249', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1572510715.0557557.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('253', '251', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1596103484.66092912.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('254', '252', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628592561.80292537.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('256', '253', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1500368449.16695185.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('257', '254', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e2ad7080408a1434b90f824f50293b89.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('258', '26', 'https://gd2.alicdn.com/imgextra/i2/3064975198/O1CN01XRRGpI1oGjSmyt8gb_!!3064975198.jpg_400x400.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('259', '255', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/35b5669b506219fe7252ac5fa9baa1b5.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('26', '256', 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205092043_8e116beacaabd74787822b33d920a2c9.png', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('260', '257', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/fd1cad9acc509b5395d7993d5bb86411.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('261', '258', 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202210171128_135af20d457fa65b12eaca0fa787491e.png', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('262', '259', 'https://img1.imgtp.com/2022/12/03/7SpnHgTm.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('263', '260', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c2af30d499323618f9abdaffd82b581b.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('264', '261', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/50b73aeedeeb27392a15d9d479e5d793.png', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('265', '262', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01d9571051a91e540e5c644fa60cc858.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('266', '263', 'https://s2.loli.net/2023/01/27/ZQEubCSMfy2hXwp.webp', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('267', '264', 'https://s2.loli.net/2023/01/27/ZQEubCSMfy2hXwp.webp', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('268', '27', 'https://img.alicdn.com/imgextra/i3/2200877014436/O1CN01rC21mQ1idjeS1IX7l_!!2200877014436.jpg_430x430q90.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('269', '265', 'https://gd1.alicdn.com/imgextra/i2/18202260/O1CN01sDuxwo1SZ7qKdiyqa_!!18202260.png_400x400.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('27', '266', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/1917047079/O1CN01tFxgiR22AEVhb79IQ_!!2-item_pic.png_230x230.jpg_.webp', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('270', '267', 'https://img.alicdn.com/imgextra/i1/1917047079/O1CN01tFxgiR22AEVhb79IQ_!!2-item_pic.png_430x430q90.jpg', 1, 1, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('276', '242', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1672038500.61639624.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('277', '242', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1672038500.63261533.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('278', '28', 'https://gw.alicdn.com/imgextra/i1/2448418966/O1CN01eeLoqJ2G6TsnLtSYa_!!0-item_pic.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('279', '242', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1672216264.77496129.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('28', '243', 'https://s2.loli.net/2023/01/27/Rh4alwSbFC3VZPk.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('280', '243', 'https://s2.loli.net/2023/01/27/ShlwXcCUaPOgH6f.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('281', '243', 'https://s2.loli.net/2023/01/27/QheLUE3JPDi4Gxq.jpg', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('282', '244', 'https://s2.loli.net/2023/01/27/NGSsyme1P2694Tu.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('283', '244', 'https://s2.loli.net/2023/01/27/FiLxU6hWmvasZB8.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('284', '244', 'https://s2.loli.net/2023/01/27/L6UvzNg91y2u3ed.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('285', '244', 'https://s2.loli.net/2023/01/27/MWLjdzB3Z78Cl4r.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('286', '246', 'https://s2.loli.net/2023/01/27/lPwKQk9mgsTYbdn.jpg', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('287', '246', 'https://s2.loli.net/2023/01/27/RSaDmpNrcdjV1Lu.jpg', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('288', '29', 'https://gw.alicdn.com/imgextra/i1/1799996758/O1CN01zjLgVY1znDMGOZJHt_!!1799996758-0-lubanu-s.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('291', '247', 'https://s2.loli.net/2023/01/27/JblsRk9fioznaZG.jpg', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('296', '290', 'https://s2.loli.net/2023/01/27/BXCcAaOjT71ldEz.png', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('297', '290', 'https://s2.loli.net/2023/01/27/vcX6bGRuyUM4naf.png', 1, 0, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('298', '3', 'https://gw.alicdn.com/imgextra/i1/619123122/O1CN016xQaHN1YvvJgmVN53-619123122.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('299', '30', 'https://gw.alicdn.com/imgextra/O1CN01bOx9601YxkrmVy1b2_!!1588913126.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('2c28ad3b-4944-47f5-a208-0f26e4e3ceca', '32d064a9-201a-4ed2-a00b-faf3b430df75', 'https://s2.loli.net/2023/01/25/lB1LINuSYWwn3Oi.jpg', NULL, 0, '2023-01-25 20:27:22', '2023-01-25 20:27:22', 0);
INSERT INTO `product_img` VALUES ('2c3d0668-0824-41fe-9a81-91c4e9479b52', '241', 'https://s2.loli.net/2023/01/27/oC6VPEMvtwU7pi4.png', NULL, 0, '2023-01-27 22:19:58', '2023-01-27 22:19:58', 0);
INSERT INTO `product_img` VALUES ('3', '254', 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202208121605_89f90ee66b37506fdae89fef03e16962.png', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('30', '254', 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206131049_c88201c0d878a8168fd3c8de3bc26c96.png', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('300', '256', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1244196903a9c81c0d41f462ff719ded.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('301', '257', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d9e887830eee09bd341b9ed130db2d9c.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('302', '257', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5f2d5c086ec68c203d22b09af10233cf.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('303', '258', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1666013248.58295720.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('304', '258', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1666013248.54832750.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('305', '259', 'https://img1.imgtp.com/2022/12/03/44Bj28Lk.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('306', '259', 'https://img1.imgtp.com/2022/12/03/30PkV9tr.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('307', '259', 'https://img1.imgtp.com/2022/12/03/MhtM4oqV.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('308', '31', 'https://gw.alicdn.com/imgextra/i4/619123122/O1CN01wiDRlR1YvvJOTq20T_!!0-item_pic.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('309', '260', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1626674832.46747183.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('31', '260', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1626674832.54821837.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('310', '260', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1626674832.44773320.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('312', '245', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1627877128.27218674.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('313', '254', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d6db71390101abb15e5e80b323fb8901.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('314', '254', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c17423bde74a4073c2f83e698c00e409.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('315', '248', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1660191427.97348956.png', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('316', '248', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1660191428.1035109.png', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('317', '249', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1572510715.11624812.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('318', '32', 'https://gw.alicdn.com/imgextra/O1CN01uKXIzY1Yxks94zhLi_!!1588913126.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('319', '249', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1572510715.01916653.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('32', '251', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1596103484.65027752.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('320', '251', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1596103484.64312095.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('321', '252', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628592561.88392513.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('322', '252', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628592561.88334119.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('323', '252', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628592561.85919643.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('324', '263', 'https://s2.loli.net/2023/01/27/ysOle7hcjugJ5X6.webp', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('325', '263', 'https://s2.loli.net/2023/01/27/3nAfNBHFQyU1D4K.webp', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('326', '263', 'https://s2.loli.net/2023/01/27/7tNUQIbml8J2wKD.webp', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('327', '264', 'https://s2.loli.net/2023/01/27/ysOle7hcjugJ5X6.webp', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('328', '33', 'https://gd3.alicdn.com/imgextra/i3/2212501973430/O1CN01AKoZEs1bCzCt4QINL_!!2212501973430.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('329', '264', 'https://s2.loli.net/2023/01/27/7tNUQIbml8J2wKD.webp', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('33', '265', 'https://gd4.alicdn.com/imgextra/i4/18202260/O1CN01MeQuhe1SZ7uDXUJZY_!!18202260.jpg_400x400.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('330', '265', 'https://gd4.alicdn.com/imgextra/i4/18202260/O1CN01KUpoeB1SZ7qpAbJnZ_!!18202260.jpg_400x400.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('331', '266', 'https://img.alicdn.com/imgextra/i2/1917047079/O1CN012RmNxT22AEVYKqKTf_!!2-item_pic.png_430x430q90.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('332', '266', 'https://img.alicdn.com/imgextra/i3/1917047079/O1CN010WGslW22AEVfL0tHp_!!2-item_pic.png_430x430q90.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('333', '266', 'https://img.alicdn.com/imgextra/i3/1917047079/O1CN01ia5zFx22AEVhb7cNh_!!2-item_pic.png_430x430q90.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('334', '267', 'https://gd4.alicdn.com/imgextra/i4/2214833533239/O1CN01kieMFT1ZnVf7gr9A6_!!2214833533239.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('335', '267', 'https://gd3.alicdn.com/imgextra/i3/2214833533239/O1CN01cuSOSh1ZnVfCtM4NZ_!!2214833533239.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('336', '267', 'https://gd1.alicdn.com/imgextra/i1/2214833533239/O1CN01i8Rpu41ZnVf96S3Xk_!!2214833533239.jpg', 1, 0, '2021-09-26 11:11:11', '2021-09-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('337', '34', 'https://img.alicdn.com/imgextra/i1/2211324479546/O1CN01R5k7Cm2KO7a7Zfec6_!!2211324479546-0-scmitem1000.jpg_430x430q90.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('338', '35', 'https://img.alicdn.com/imgextra/i1/3084961806/O1CN01mzzRqf1PDC5Y9w2sg_!!3084961806.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('34', '36', 'https://gw.alicdn.com/imgextra/i1/628189716/O1CN01yjq7Ge2LdyxJG6TJW_!!628189716.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('35', '37', 'https://gd2.alicdn.com/imgextra/i3/346858986/O1CN01FFRzVF2GFdpLop9jx_!!346858986.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('36', '38', 'https://gw.alicdn.com/imgextra/i2/2200662070237/O1CN01PrihgV1DcaWffLXDO_!!2200662070237.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('37', '39', 'https://gw.alicdn.com/imgextra/i2/2250179613/O1CN01H6LUhN2Kso9yzAiFh_!!2250179613.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('38', '4', 'https://gw.alicdn.com/imgextra/i4/3937219703/O1CN01mMtttV2LY1ok0ZfM8_!!3937219703-0-C2M.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('39', '40', 'https://gd4.alicdn.com/imgextra/i4/0/O1CN01zClRe71JYMhYSeKaW_!!0-item_pic.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('4', '41', 'https://gw.alicdn.com/imgextra/i2/2209299059672/O1CN01b6Czcd2LJpRzT8eec_!!2209299059672.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('40', '42', 'https://gw.alicdn.com/imgextra/i4/2123446495/O1CN01RK9BSD1xqlD6Dl7ot_!!2123446495.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('41', '43', 'https://gw.alicdn.com/imgextra/i3/2206761305360/O1CN01JQJl9v1pSveM8fRbx_!!2206761305360.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('42', '44', 'https://img.alicdn.com/imgextra/i1/6000000001093/O1CN01vGzBNV1JwdYSTsvWd_!!6000000001093-0-at.jpg_430x430q90.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('43', '45', 'https://img1.imgtp.com/2022/12/03/QalayPYd.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('44', '46', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/3937219703/O1CN01fO2q3u2LY1oDjUcY1_!!3937219703-0-C2M.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('45', '47', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/3937219703/O1CN01QsOT8U2LY1nLZA9gh_!!3937219703-0-C2M.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('46', '48', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/2200530886785/O1CN0175uN9e1zzZz90zWES_!!2200530886785.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('47', '49', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/1657487457/O1CN01YQp3bm24xMCPq19Cz_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('48', '5', 'https://gw.alicdn.com/imgextra/i4/2338667260/O1CN01ULCM5z23V8DGeOWbA_!!0-item_pic.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('49', '50', 'https://img1.imgtp.com/2022/12/03/cPCf54sG.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('4dd1d6b7-900a-46d3-8c08-bc39c014531b', 'dd4345ed-ae7b-46fb-ad7e-499b0be89a8b', 'https://s2.loli.net/2023/01/25/lB1LINuSYWwn3Oi.jpg', NULL, 0, '2023-01-25 20:27:30', '2023-01-25 20:27:30', 0);
INSERT INTO `product_img` VALUES ('5', '51', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/174910742/O1CN01nkwHlW1HLsg2Gji8D_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('50', '52', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/729513733/O1CN01jUQgtZ1dRlD2r3SDK_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('51', '53', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/628189716/O1CN01wcMDR92LdyyOA3A1S_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('52', '54', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/1664435174/O1CN01TAxM9m1o5k2U0ll6w_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('53', '55', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/2201418541708/O1CN01fNQf641OUJBAYRAGF_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('54', '56', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/3932986478/O1CN01oardMP1xiyTkLjTKX_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('55', '57', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/2207329758315/O1CN015DUy2F2BIK58QhmBU_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('56', '58', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/619123122/O1CN01LX9N2m1YvvJZ898XT_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('57', '59', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/855220264/O1CN01f6tblo1DoxKEYGthu_!!855220264.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('57621627-4640-4b00-b2e7-92efa8a1e687', '32d064a9-201a-4ed2-a00b-faf3b430df75', 'https://s2.loli.net/2023/01/25/sLQzPNUWIDp9aCu.jpg', NULL, 1, '2023-01-25 20:27:14', '2023-01-25 20:27:14', 0);
INSERT INTO `product_img` VALUES ('58', '6', 'https://gw.alicdn.com/imgextra/O1CNA1CQyqsz1UzLobOEDQ9_!!911772588-0-psf.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('59', '60', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2200530886785/O1CN01FqM0oZ1zza1G9sJrN_!!2200530886785.png_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('5cffbe82-fb32-472b-b531-4d62d81f2582', '102d4ad1-ade3-4268-9398-7e636ffda775', 'https://s2.loli.net/2023/01/26/6DgXvptUoWyYe7V.jpg', NULL, 0, '2023-01-26 06:58:03', '2023-01-26 06:58:03', 0);
INSERT INTO `product_img` VALUES ('5fa69bc3-c8fa-43af-853c-9c4dbf558c12', '976d549e-bc8a-4226-b98e-55075c3a3e1a', 'https://s2.loli.net/2023/01/26/26hSdVwmqYpj3WG.jpg', NULL, 0, '2023-01-26 06:45:50', '2023-01-26 06:45:50', 0);
INSERT INTO `product_img` VALUES ('6', '61', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/855220264/O1CN015rcflg1DoxKgXq3v2_!!855220264.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('60', '62', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i3/732501769/O1CN01QIawET1OwFR9W2t0X_!!732501769.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('61', '63', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/661780489/O1CN01tvOOXC1FU0RWxJOiZ_!!661780489.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('61e200bf-e1aa-4912-8639-cf6378a05a6f', 'af88de9b-c450-440f-b74b-2794b5c426fe', 'https://s2.loli.net/2023/01/26/6DgXvptUoWyYe7V.jpg', NULL, 1, '2023-01-26 06:43:56', '2023-01-26 06:43:56', 0);
INSERT INTO `product_img` VALUES ('62', '64', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01AWlbtR2K7AzKLnN30_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('63', '65', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/3083026886/O1CN01jEZeIc20jq6P3I4Bn_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('64', '66', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01MJzlWz2K7AzN76RPy_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('65', '67', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/500570219/O1CN01CzCsEt1DULTCDb5z6_!!500570219.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('66', '68', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/500570219/O1CN01CzCsEt1DULTCDb5z6_!!500570219.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('67', '69', 'https://gw.alicdn.com/imgextra/O1CN01iTMqBM1sAYfSo79S9_!!3257215726-0-picasso.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('68', '7', 'https://gw.alicdn.com/imgextra/O1CNA1zxJVUp1FEtP7OIPj3_!!1690440456-0-psf.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('69', '70', 'https://gw.alicdn.com/imgextra/i1/880734502/O1CN01mV2z5C1j7xsnf3SMe-880734502.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('7', '71', 'https://gw.alicdn.com/imgextra/i1/880734502/O1CN01YdIqEI1j7xssSDgHs_!!0-item_pic.jpg_Q75.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('70', '72', 'https://img.alicdn.com/imgextra/i1/6000000004854/O1CN01xlwUnM1ljBIiL9d1j_!!6000000004854-0-at.jpg_430x430q90.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('705b51a7-cda5-457d-9d31-f5fa386f8ade', '5c129ecb-21e2-409f-81cd-d369b036aea0', 'https://s2.loli.net/2023/01/25/mJFw1WSoZzKkp73.jpg', NULL, 0, '2023-01-25 20:25:12', '2023-01-25 20:25:12', 0);
INSERT INTO `product_img` VALUES ('71', '72', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/3937219703/O1CN01oKdwH62LY1nOXku1f_!!3937219703-0-C2M.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('72', '74', 'https://img1.imgtp.com/2022/12/03/cPCf54sG.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('73', '75', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/3160935493/O1CN01YapBou1qRqMc4XIHB_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('74', '76', 'https://img1.imgtp.com/2022/12/03/tf3G5hlb.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('75', '77', 'https://img1.imgtp.com/2022/12/03/tf3G5hlb.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('76', '78', 'https://img1.imgtp.com/2022/12/03/tf3G5hlb.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('77', '79', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/1715535627/O1CN01QcTB5O1rRDOfijkB0_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('78', '8', 'https://img.alicdn.com/imgextra/i4/6000000000298/O1CN01JbdWcE1E4WpIGiTWP_!!6000000000298-0-picassoopen.jpg_430x430q90.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('79', '80', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/2200735250530/O1CN018jrOZX1FmmhwnDzcp_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('7a432448-b053-41b8-96bd-8270d26ae933', '6b7a74b1-ee63-44dc-93cb-89eacee66c2c', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2258229509/O1CN01lEycCW2K7AzLZgkEZ_!!0-item_pic.jpg_180x180.jpg_.webp', NULL, 1, '2023-01-26 05:12:23', '2023-01-26 05:12:23', 0);
INSERT INTO `product_img` VALUES ('7f8b34f3-dfce-4d04-a8f8-e38df8ef5c84', '2af1d5d1-f09f-42b7-8f27-304af55492f3', 'https://s2.loli.net/2023/01/26/V16tuW3gi9Z8DPc.jpg', NULL, 0, '2023-01-26 06:42:01', '2023-01-26 06:42:01', 0);
INSERT INTO `product_img` VALUES ('8', '81', 'https://gw.alicdn.com/imgextra/O1CN01NA4n2w1ez1grHERuQ_!!2210097053941-0-picasso.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('80', '82', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/141896236/O1CN01hCLZKw1vw8bNyiTC8_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('8052c61c-4a01-4f33-94b7-b062791ce908', '102d4ad1-ade3-4268-9398-7e636ffda775', 'https://s2.loli.net/2023/01/26/26hSdVwmqYpj3WG.jpg', NULL, 0, '2023-01-26 06:57:47', '2023-01-26 06:57:47', 0);
INSERT INTO `product_img` VALUES ('81', '83', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2207437596552/O1CN01d3j7zc1yGrlHvjyxf_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('82', '84', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/3160935493/O1CN01thUQo01qRqNbAJWSj_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('83', '85', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/1889933745/O1CN01Uga9C51dXG1P88u7f_!!1889933745.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('84', '86', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i4/118213460/O1CN01VLb7cY1bQjBOHGnMF_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('85', '87', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/4248250203/O1CN01g5Vye21DN156yfsQu_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('86', '88', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/2212764689782/O1CN01P723r02M8D6mGOs4z_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('87', '89', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/1644760581/O1CN0149HChT1GA8gVpP2ay_!!1644760581.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('88', '9', 'https://img.alicdn.com/imgextra/i4/725677994/O1CN01i4SrXU28vIskyP1gs_!!725677994.jpg_430x430q90.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('89', '90', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2611157574/O1CN01gK1TMA25owYwXl3XY_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('9', '91', 'https://g-search1.alicdn.com/img/bao/uploaded/i4/i1/2208500725685/O1CN01aOOFUD1rrmQRVKPlF_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('90', '92', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/1938671916/O1CN018iY2fZ1Q1ZdUi6hC3_!!1938671916.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('91', '93', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2446654791/O1CN01bSzbea1lGKHhchpnO_!!2446654791.png_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('92', '94', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i1/2037973344/O1CN01bzcg6X1aZbBqnwan6_!!2037973344.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('93', '95', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/2214701587615/O1CN01zOnMvP267iq0RpROQ_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('93d89ca2-1077-42b9-9533-f6d1cc8e41fe', '32d064a9-201a-4ed2-a00b-faf3b430df75', 'https://s2.loli.net/2023/01/25/mJFw1WSoZzKkp73.jpg', NULL, 0, '2023-01-25 20:27:15', '2023-01-25 20:27:15', 0);
INSERT INTO `product_img` VALUES ('94', '96', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/4084203199/O1CN01TrNybK1ZVBoIz3WQx_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('95', '97', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/3099733994/O1CN01oyx2pw1fNIXiKdVb6_!!0-item_pic.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('96', '98', 'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/1865856284/O1CN015by9XB1wI7fTGJf0H_!!1865856284.jpg_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('97', '99', 'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1865856284/O1CN01GvszIn1wI7fF41aJt_!!1865856284.png_180x180.jpg_.webp', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11', 0);
INSERT INTO `product_img` VALUES ('9c54cfd0-1702-435f-addb-6b45180d170c', 'f2daf683-ecfa-4fe6-a088-d76153406454', 'https://s2.loli.net/2023/01/26/26hSdVwmqYpj3WG.jpg', NULL, 1, '2023-01-26 06:45:02', '2023-01-26 06:45:02', 0);
INSERT INTO `product_img` VALUES ('abc84cdc-834b-4e83-96d0-a513b32e6817', '976d549e-bc8a-4226-b98e-55075c3a3e1a', 'https://s2.loli.net/2023/01/26/6DgXvptUoWyYe7V.jpg', NULL, 1, '2023-01-26 06:45:49', '2023-01-26 06:45:49', 0);
INSERT INTO `product_img` VALUES ('b32e7088-3dc4-487b-846f-d71e53e1b58a', '2af1d5d1-f09f-42b7-8f27-304af55492f3', 'https://s2.loli.net/2023/01/26/V16tuW3gi9Z8DPc.jpg', NULL, 1, '2023-01-26 05:13:59', '2023-01-26 05:13:59', 0);
INSERT INTO `product_img` VALUES ('b333bb3b-4ca9-4e8d-b17c-416cc8505ce0', '571de01b-ecc8-4002-b164-ca411416fcf2', 'https://s2.loli.net/2023/01/25/mJFw1WSoZzKkp73.jpg', NULL, 0, '2023-01-25 20:01:14', '2023-01-25 20:01:14', 0);
INSERT INTO `product_img` VALUES ('b4719405-947e-469d-a16b-8b70f6096af9', '241', 'https://s2.loli.net/2023/01/27/zCbF8MIdPh9uyet.png', NULL, 0, '2023-01-27 22:20:44', '2023-01-27 22:20:44', 0);
INSERT INTO `product_img` VALUES ('b6ec8efc-0cbb-4f42-bca2-7f5e6d195fbc', '5c129ecb-21e2-409f-81cd-d369b036aea0', 'https://s2.loli.net/2023/01/25/BcKeDMlUvpj4R8L.jpg', NULL, 0, '2023-01-25 20:25:12', '2023-01-25 20:25:12', 0);
INSERT INTO `product_img` VALUES ('b7a1b718-a455-464f-9ed5-168c0d755919', '32d064a9-201a-4ed2-a00b-faf3b430df75', 'https://s2.loli.net/2023/01/25/lB1LINuSYWwn3Oi.jpg', NULL, 0, '2023-01-25 20:27:15', '2023-01-25 20:27:15', 0);
INSERT INTO `product_img` VALUES ('b9023eb1-bfc8-4009-8121-3d67bef9ee87', 'dd4345ed-ae7b-46fb-ad7e-499b0be89a8b', 'https://s2.loli.net/2023/01/25/sLQzPNUWIDp9aCu.jpg', NULL, 1, '2023-01-25 20:27:29', '2023-01-25 20:27:29', 0);
INSERT INTO `product_img` VALUES ('beb626ea-b216-4182-8f1b-623e752d96b7', '085e8880-780d-4661-a655-5bb780e6505a', 'https://s2.loli.net/2023/01/25/sLQzPNUWIDp9aCu.jpg', NULL, 1, '2023-01-25 20:02:57', '2023-01-25 20:02:57', 0);
INSERT INTO `product_img` VALUES ('bfa3218a-3ed9-4445-be52-68bbd83816f8', '542fe357-283d-4732-8987-42d8ad7301fe', 'https://img1.imgtp.com/2022/12/03/C1FZNkZO.jpg', NULL, 0, '2023-01-26 05:17:07', '2023-01-26 05:17:07', 0);
INSERT INTO `product_img` VALUES ('c4af2f54-4dc4-47cb-b716-8b57b03845b8', '571de01b-ecc8-4002-b164-ca411416fcf2', 'https://s2.loli.net/2023/01/25/sLQzPNUWIDp9aCu.jpg', NULL, 1, '2023-01-25 20:01:04', '2023-01-25 20:01:04', 0);
INSERT INTO `product_img` VALUES ('c7edc99f-3b59-4174-b6ad-91753f54f17a', '542fe357-283d-4732-8987-42d8ad7301fe', 'https://img1.imgtp.com/2022/12/03/2mMw5GmJ.jpg', NULL, 0, '2023-01-26 05:17:07', '2023-01-26 05:17:07', 0);
INSERT INTO `product_img` VALUES ('c82a8a83-45ee-47d4-a9ae-29ba52c68660', '100', 'https://s2.loli.net/2023/01/27/zip6uvfbVOo9lIa.png', NULL, 0, '2023-01-27 02:41:38', '2023-01-27 02:41:38', 0);
INSERT INTO `product_img` VALUES ('c8d3c9f3-f04d-4202-bd1c-88cda8b4d422', '571de01b-ecc8-4002-b164-ca411416fcf2', 'https://s2.loli.net/2023/01/25/lB1LINuSYWwn3Oi.jpg', NULL, 0, '2023-01-25 20:01:14', '2023-01-25 20:01:14', 0);
INSERT INTO `product_img` VALUES ('cd13b6b4-6955-4b04-a740-c8328b3eba15', '100', 'https://s2.loli.net/2023/01/26/Sf7cROr6pgaNz81.jpg', NULL, 0, '2023-01-26 12:20:54', '2023-01-26 12:20:54', 0);
INSERT INTO `product_img` VALUES ('cfc1cf7c-52b2-419c-bcaf-c9520306ccee', '571de01b-ecc8-4002-b164-ca411416fcf2', 'https://s2.loli.net/2023/01/25/BcKeDMlUvpj4R8L.jpg', NULL, 0, '2023-01-25 20:01:14', '2023-01-25 20:01:14', 0);
INSERT INTO `product_img` VALUES ('dc051d53-a87c-41b7-805c-4db889e76863', '542fe357-283d-4732-8987-42d8ad7301fe', 'https://img1.imgtp.com/2022/12/03/2mMw5GmJ.jpg', NULL, 0, '2023-01-26 05:17:07', '2023-01-26 05:17:07', 0);
INSERT INTO `product_img` VALUES ('de476a5e-c5a6-45cc-9a64-6fe3ef9dd617', 'ff7a8a72-0f9d-4769-b0de-2c478c722b70', 'https://s2.loli.net/2023/01/25/mJFw1WSoZzKkp73.jpg', NULL, 1, '2023-01-25 20:17:38', '2023-01-25 20:17:38', 0);
INSERT INTO `product_img` VALUES ('ed0a5d36-0587-4233-a903-0d8fd215f693', '241', 'https://s2.loli.net/2023/01/27/Oi4LDYNSHcTzJKf.png', NULL, 0, '2023-01-27 22:17:36', '2023-01-27 22:17:36', 0);
INSERT INTO `product_img` VALUES ('f31414ef-43b4-46db-9853-654a2f09d4d8', '102d4ad1-ade3-4268-9398-7e636ffda775', 'https://s2.loli.net/2023/01/26/V16tuW3gi9Z8DPc.jpg', NULL, 1, '2023-01-25 20:31:55', '2023-01-25 20:31:55', 0);

-- ----------------------------
-- Table structure for product_params
-- ----------------------------
DROP TABLE IF EXISTS `product_params`;
CREATE TABLE `product_params`  (
  `param_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品参数id',
  `product_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
  `product_place` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '产地 产地，例：中国江苏',
  `foot_period` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '保质期 保质期，例：180天',
  `brand` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '品牌名 品牌名，例：三只大灰狼',
  `factory_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '生产厂名 生产厂名，例：大灰狼工厂',
  `factory_address` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '生产厂址 生产厂址，例：大灰狼生产基地',
  `packaging_method` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '包装方式 包装方式，例：袋装',
  `weight` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '规格重量 规格重量，例：35g',
  `storage_method` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '存储方法 存储方法，例：常温5~25°',
  `eat_method` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '食用方式 食用方式，例：开袋即食',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`param_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_params_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品参数 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_params
-- ----------------------------

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `sku_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'sku编号',
  `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
  `sku_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'sku名称',
  `sku_img` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku图片',
  `untitled` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '属性组合（格式是p1:v1;p2:v2）',
  `original_price` int NOT NULL COMMENT '原价',
  `sell_price` int NOT NULL COMMENT '销售价格',
  `discounts` decimal(4, 2) NOT NULL COMMENT '折扣力度',
  `stock` int NOT NULL COMMENT '库存',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `status` int NULL DEFAULT NULL COMMENT 'sku状态(1启用，0禁用，-1删除)',
  `sku_star` int NULL DEFAULT NULL COMMENT '是否为推荐商品的 推荐价格（1启用）',
  PRIMARY KEY (`sku_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_sku_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES ('08a40548-648d-43fe-9f21-80df9f900c58', '5c129ecb-21e2-409f-81cd-d369b036aea0', '飞机1', NULL, NULL, 199, 197, 0.99, 200, '2023-01-25 20:25:11', '2023-01-25 20:25:11', 1, 1);
INSERT INTO `product_sku` VALUES ('0b4c37de-b588-4974-8675-a777df501e71', '5c129ecb-21e2-409f-81cd-d369b036aea0', '飞机2', NULL, NULL, 299, 296, 0.99, 200, '2023-01-25 20:25:11', '2023-01-25 20:25:11', 1, 0);
INSERT INTO `product_sku` VALUES ('0bca4221-7818-48b8-ac16-0347fef1f0fa', '100', '9494', NULL, NULL, 11, 10, 0.99, 100, '2023-01-26 12:01:32', '2023-01-28 03:51:47', 1, 1);
INSERT INTO `product_sku` VALUES ('1', '1', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('10', '10', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('100', '100', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 80, '2021-05-10 09:56:09', '2023-01-27 02:41:37', 1, 0);
INSERT INTO `product_sku` VALUES ('101', '101', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('102', '102', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('103', '103', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('104', '104', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('105', '105', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('106', '106', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('107', '107', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('108', '108', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('109', '109', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('11', '11', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('110', '110', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 98, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('111', '111', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 97, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('112', '112', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 80, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('113', '113', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 92, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('114', '114', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 120, '2021-05-10 09:56:09', '2023-01-23 20:19:00', 1, 1);
INSERT INTO `product_sku` VALUES ('115', '115', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('116', '116', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('117', '117', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('118', '118', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('119', '119', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('12', '12', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('120', '120', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('121', '121', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 99, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('122', '122', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2023-01-23 20:19:01', 1, 1);
INSERT INTO `product_sku` VALUES ('123', '123', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2023-01-23 20:19:03', 1, 1);
INSERT INTO `product_sku` VALUES ('124', '124', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('125', '125', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('126', '126', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('127', '127', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('128', '128', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('129', '129', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('13', '13', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('130', '130', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('131', '131', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('132', '132', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('133', '133', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('134', '134', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('135', '135', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('136', '136', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('137', '14', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('138', '140', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('139', '141', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('14', '142', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('140', '143', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('141', '144', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 490, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('142', '145', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 490, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('143', '146', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 490, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('144', '147', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('145', '148', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('146', '149', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 490, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('147', '15', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('148', '150', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('149', '151', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('15', '152', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('150', '153', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('151', '154', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('152', '155', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('153', '156', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('154', '157', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('155', '158', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('156', '159', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('157', '16', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('158', '160', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('159', '161', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('16', '162', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('160', '163', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('161', '164', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('162', '165', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('163', '166', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('164', '167', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('165', '168', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('166', '169', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('167', '17', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('168', '170', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('169', '171', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('17', '172', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('170', '173', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('171', '174', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('172', '175', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('173', '176', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('174', '177', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('175', '178', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('176', '179', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('177', '18', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('178', '180', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('179', '181', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('18', '182', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('180', '183', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('181', '184', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('182', '185', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('183', '186', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('184', '187', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('185', '188', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('186', '189', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('187', '19', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('188', '190', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('189', '191', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('18c16a29-6b00-4940-a766-6ad742435892', '102d4ad1-ade3-4268-9398-7e636ffda775', '飞机113', NULL, NULL, 299, 296, 0.99, 100, '2023-01-25 20:31:55', '2023-01-26 06:58:03', 1, 1);
INSERT INTO `product_sku` VALUES ('19', '192', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('190', '193', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('191', '194', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('192', '195', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('193', '196', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('194', '197', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('195', '198', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('196', '199', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('197', '2', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('198', '20', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('199', '200', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('2', '201', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('20', '202', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('200', '203', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('201', '204', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('202', '205', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('203', '206', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('204', '207', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('205', '208', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('206', '209', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('207', '21', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('208', '210', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('209', '211', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('21', '212', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('210', '213', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('211', '214', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('212', '215', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('213', '216', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('214', '217', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('215', '218', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('216', '219', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('217', '22', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('218', '220', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('219', '221', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('22', '222', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('220', '223', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('221', '224', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('222', '225', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('223', '226', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('224', '227', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('225', '228', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('226', '229', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('227', '23', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('228', '230', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('229', '231', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('22e1dc60-7394-4fdc-97a4-9324cb44c94a', '976d549e-bc8a-4226-b98e-55075c3a3e1a', '669', NULL, NULL, 1, 1, 1.00, 100, '2023-01-26 06:45:49', '2023-01-26 06:45:49', 1, 1);
INSERT INTO `product_sku` VALUES ('23', '232', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('230', '233', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('23023ab0-3d9a-4da6-939d-cd170236a880', '100', '9491', NULL, NULL, 11, 10, 0.99, 100, '2023-01-26 12:01:32', '2023-01-28 03:50:09', 0, 0);
INSERT INTO `product_sku` VALUES ('231', '234', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('232', '235', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('233', '236', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('234', '237', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('235', '238', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('236', '239', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('237', '24', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('238', '240', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('239', '241', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3099, 2, 0.75, 500, '2021-05-10 09:56:09', '2023-01-27 22:20:44', 1, 1);
INSERT INTO `product_sku` VALUES ('24', '242', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3999, 2, 0.70, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('240', '243', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 5999, 2, 1.00, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('241', '244', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 19999, 2, 0.98, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('242', '245', '100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 149, 2, 0.90, 500, '2021-05-10 09:56:09', '2023-01-26 06:26:50', 1, 1);
INSERT INTO `product_sku` VALUES ('243', '246', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 9699, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('244', '247', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 9699, 2, 0.90, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('245', '248', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 1099, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('246', '249', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 129, 2, 0.90, 493, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('247', '25', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('248', '250', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 99, 2, 1.00, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('249', '251', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 79, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('25', '252', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 9999, 2, 1.00, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('250', '253', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 69, 2, 1.00, 493, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('251', '254', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 349, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('2517e139-fa60-4b6e-a6ab-3641dee6cccb', '542fe357-283d-4732-8987-42d8ad7301fe', '100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 149, 2, 0.90, 500, '2023-01-26 05:17:07', '2023-01-26 05:17:07', 1, 1);
INSERT INTO `product_sku` VALUES ('252', '255', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 4599, 2, 0.85, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('253', '256', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 29999, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('254', '257', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 1499, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('256', '258', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 20999, 2, 1.00, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('257', '259', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 5999, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('258', '26', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('258fa784-9d7c-4074-a8b7-a63b07f74191', '100', '101', NULL, NULL, 0, 0, 0.00, 99, '2023-01-26 12:03:36', '2023-01-28 03:52:33', 0, 0);
INSERT INTO `product_sku` VALUES ('259', '260', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 599, 2, 0.90, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('26', '261', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 11499, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('260', '262', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 5599, 2, 0.90, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('261', '263', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 10999, 2, 1.00, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('262', '264', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 8999, 2, 0.80, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('263', '265', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 11499, 2, 0.86, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('264', '266', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 11899, 2, 1.00, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('265', '267', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 26499, 2, 1.00, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('266', '27', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('267', '28', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('268', '29', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('269', '290', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 5699, 2, 0.70, 500, '2021-05-10 09:56:09', '2023-01-23 20:26:29', 0, 1);
INSERT INTO `product_sku` VALUES ('27', '3', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('270', '30', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('271', '31', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('272', '32', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 493, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('275', '33', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('276', '34', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('277', '35', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('278', '36', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('279', '37', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('28', '38', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 493, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('280', '39', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('281', '4', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 493, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('282', '40', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('283', '41', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('284', '42', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('285', '43', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('286', '44', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('287', '45', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('288', '46', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('289', '47', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('29', '48', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('290', '49', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('291', '5', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('292', '50', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('293', '51', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('294', '52', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('295', '53', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('296', '54', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('297', '55', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('298', '56', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('299', '57', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('2d0d4bc7-3626-4455-b449-610b538a1866', '100', 'asd', NULL, NULL, 0, 0, 0.00, 100, '2023-01-26 12:04:59', '2023-01-28 03:50:08', 0, 0);
INSERT INTO `product_sku` VALUES ('2d1c163b-fd04-438c-b51e-59e0de5127aa', '102d4ad1-ade3-4268-9398-7e636ffda775', '666', NULL, NULL, 0, 0, 0.00, 0, '2023-01-26 06:57:46', '2023-01-26 06:58:03', 1, 0);
INSERT INTO `product_sku` VALUES ('3', '58', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('30', '59', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('300', '6', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('301', '60', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('302', '61', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('303', '62', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('304', '63', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('305', '64', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('306', '65', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('307', '66', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('308', '67', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('309', '68', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('31', '69', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('310', '7', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('311', '70', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('312', '71', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('313', '72', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('314', '74', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('315', '75', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('316', '76', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('317', '77', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('318', '78', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('319', '79', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('32', '8', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('320', '80', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('321', '81', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('322', '82', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('323', '83', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('324', '84', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('325', '85', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('326', '86', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('327', '87', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('328', '88', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('329', '89', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('33', '9', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('330', '90', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('331', '91', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('332', '92', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('333', '93', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('334', '94', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('335', '95', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('336', '96', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('337', '97', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('338', '98', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('339', '242', '加力加 200g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 0);
INSERT INTO `product_sku` VALUES ('34', '99', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 500, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1, 1);
INSERT INTO `product_sku` VALUES ('340', '245', '200g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 244, 2, 0.90, 493, '2021-05-10 09:56:09', '2023-01-26 06:26:50', 1, 0);
INSERT INTO `product_sku` VALUES ('341', '290', '100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 149, 2, 0.90, 500, '2021-05-10 09:56:09', '2023-01-23 20:26:18', 1, 0);
INSERT INTO `product_sku` VALUES ('342', '290', '200g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 149, 2, 0.90, 500, '2021-05-10 09:56:09', '2023-01-23 20:26:19', 1, 0);
INSERT INTO `product_sku` VALUES ('343', '290', '300g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 149, 2, 0.90, 500, '2021-05-10 09:56:09', '2023-01-23 20:26:24', 1, 0);
INSERT INTO `product_sku` VALUES ('344', '290', '400g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 149, 2, 0.90, 500, '2021-05-10 09:56:09', '2023-01-23 20:26:24', 1, 0);
INSERT INTO `product_sku` VALUES ('345', '290', '400g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 149, 2, 0.90, 500, '2021-05-10 09:56:09', '2023-01-23 20:19:34', 0, 0);
INSERT INTO `product_sku` VALUES ('44c77c5a-0d15-4d87-aed5-1f8e0d803827', '542fe357-283d-4732-8987-42d8ad7301fe', '200g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 244, 2, 0.90, 493, '2023-01-26 05:17:07', '2023-01-26 05:17:07', 1, 0);
INSERT INTO `product_sku` VALUES ('46fb0ca7-2f36-45e6-8c1c-36d1fc8f471f', 'dd4345ed-ae7b-46fb-ad7e-499b0be89a8b', '飞机1', NULL, NULL, 199, 195, 0.98, 100, '2023-01-25 20:27:29', '2023-01-25 20:27:29', 1, 1);
INSERT INTO `product_sku` VALUES ('47c706fd-b0de-42d7-ae49-8893742f22c5', 'ff7a8a72-0f9d-4769-b0de-2c478c722b70', '飞机*2电池', NULL, NULL, 200, 198, 0.99, 100, '2023-01-25 20:17:38', '2023-01-25 20:17:38', 1, 1);
INSERT INTO `product_sku` VALUES ('673c1445-8c18-49ad-8fd0-9d09c0940cc0', 'af88de9b-c450-440f-b74b-2794b5c426fe', '555', NULL, NULL, 1, 0, 0.99, 100, '2023-01-26 06:43:56', '2023-01-26 06:43:56', 1, 1);
INSERT INTO `product_sku` VALUES ('6f9775b9-7858-42ea-8dc8-e69de6ee07eb', '100', 'aaa1', NULL, NULL, 0, 0, 0.00, 0, '2023-01-26 12:08:01', '2023-01-28 03:50:18', 0, 0);
INSERT INTO `product_sku` VALUES ('72849142-e5b7-44ab-9751-3c41a8a0bee1', '2af1d5d1-f09f-42b7-8f27-304af55492f3', '1616', NULL, NULL, 11, 121, 11.00, 110, '2023-01-26 06:43:12', '2023-01-26 06:43:12', 0, 0);
INSERT INTO `product_sku` VALUES ('837ef0e6-a335-4756-9ac2-63a32218c077', '6b7a74b1-ee63-44dc-93cb-89eacee66c2c', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 80, '2023-01-26 05:12:23', '2023-01-26 05:12:23', 1, 1);
INSERT INTO `product_sku` VALUES ('86cfe4f3-ffe4-4395-adb4-e28274cccbf0', '241', '8+128G', NULL, NULL, 2699, 2699, 1.00, 0, '2023-01-27 22:17:36', '2023-01-27 22:20:44', 1, 0);
INSERT INTO `product_sku` VALUES ('8a8017d7-99a9-40fe-a9b9-fe1ec0da9bf2', '2af1d5d1-f09f-42b7-8f27-304af55492f3', '17', NULL, NULL, 11, 121, 11.00, 110, '2023-01-26 06:43:12', '2023-01-26 06:43:12', 0, 0);
INSERT INTO `product_sku` VALUES ('9515b193-344d-4c80-89d6-f3ca7c00472d', 'dd4345ed-ae7b-46fb-ad7e-499b0be89a8b', '飞机2', NULL, NULL, 299, 293, 0.98, 100, '2023-01-25 20:27:30', '2023-01-25 20:27:30', 0, 0);
INSERT INTO `product_sku` VALUES ('98c30efa-0682-44a7-a0ea-0c9e4c8390c2', '102d4ad1-ade3-4268-9398-7e636ffda775', '116', NULL, NULL, 11, 10, 0.99, 0, '2023-01-26 06:35:26', '2023-01-26 06:58:03', 1, 0);
INSERT INTO `product_sku` VALUES ('a77702ce-ab49-44a1-b4cc-0a889bffaf98', '2af1d5d1-f09f-42b7-8f27-304af55492f3', '89', NULL, NULL, 11, 121, 11.00, 110, '2023-01-26 06:43:13', '2023-01-26 06:43:13', 0, 0);
INSERT INTO `product_sku` VALUES ('ab6ed391-3ee2-4944-a4df-1c4f8949a802', 'f2daf683-ecfa-4fe6-a088-d76153406454', '1616', NULL, NULL, 10, 100, 10.00, 10, '2023-01-26 06:45:02', '2023-01-26 06:45:02', 1, 1);
INSERT INTO `product_sku` VALUES ('afbe9090-0ac1-4012-b190-09256fc6d806', 'ff7a8a72-0f9d-4769-b0de-2c478c722b70', '飞机*4电池', NULL, NULL, 400, 396, 0.99, 100, '2023-01-25 20:17:38', '2023-01-25 20:23:24', 1, 0);
INSERT INTO `product_sku` VALUES ('b32d213e-8ce5-4cc4-90b9-ae7f3ca95fe3', '2af1d5d1-f09f-42b7-8f27-304af55492f3', '789', NULL, NULL, 11, 121, 11.00, 110, '2023-01-26 06:43:12', '2023-01-26 06:43:12', 0, 0);
INSERT INTO `product_sku` VALUES ('b80bd2a7-322c-4637-bf74-c232a3aef41d', '102d4ad1-ade3-4268-9398-7e636ffda775', '飞机112', NULL, NULL, 199, 197, 0.99, 100, '2023-01-25 20:31:55', '2023-01-26 06:58:03', 1, 0);
INSERT INTO `product_sku` VALUES ('be8da954-965e-4558-9f98-0023be7d6095', '100', '101', NULL, NULL, 0, 0, 0.00, 0, '2023-01-26 12:03:39', '2023-01-28 03:50:19', 0, 0);
INSERT INTO `product_sku` VALUES ('d149fe6b-e634-4b3f-b34f-6e60688eae56', '100', '9494', NULL, NULL, 11, 10, 0.99, 99, '2023-01-26 12:01:09', '2023-01-28 03:52:35', 1, 0);
INSERT INTO `product_sku` VALUES ('d2194df2-e6b1-4d87-8b64-b0b79ba7102c', 'ff7a8a72-0f9d-4769-b0de-2c478c722b70', '飞机*6电池', NULL, NULL, 600, 594, 0.99, 100, '2023-01-25 20:17:38', '2023-01-25 20:23:25', 1, 0);
INSERT INTO `product_sku` VALUES ('e17c7baf-f872-450a-8f4a-8b7d1bbb5a1c', '2af1d5d1-f09f-42b7-8f27-304af55492f3', '1313', NULL, NULL, 0, 0, 0.00, 0, '2023-01-26 06:41:18', '2023-01-26 06:43:12', 1, 1);
INSERT INTO `product_sku` VALUES ('f7a395ae-987e-4ca4-b81e-86b0cc3bd138', '100', 'aaa', NULL, NULL, 0, 0, 0.00, 0, '2023-01-26 12:07:53', '2023-01-28 03:50:13', 0, 0);
INSERT INTO `product_sku` VALUES ('fd491580-3d28-4b56-884b-b05c5859904b', 'a873317d-9b92-42af-b3c4-324a998e40fc', '加力加 100g', 'jlj_1.png', '{口味:[\"原味\",\"微辣\",\"BT\"]}', 3, 2, 0.50, 80, '2023-01-26 05:12:14', '2023-01-26 05:12:14', 1, 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `cart_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品ID',
  `sku_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'skuID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `cart_num` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '购物车商品数量',
  `cart_time` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '添加购物车时间',
  `product_price` decimal(32, 8) NULL DEFAULT NULL COMMENT '添加购物车时商品价格',
  `sku_props` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '选择的套餐的属性',
  `checkbox` tinyint(1) NULL DEFAULT NULL COMMENT '是否勾选',
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `sku_id`(`sku_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`sku_id`) REFERENCES `product_sku` (`sku_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 308 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '购物车 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (275, '242', '339', 78, '8', 'Wed Jan 04 04:57:01 CST 2023', 1.50000000, NULL, 0);
INSERT INTO `shopping_cart` VALUES (276, '242', '24', 78, '2', 'Wed Jan 04 04:57:06 CST 2023', 2799.30000000, NULL, 0);
INSERT INTO `shopping_cart` VALUES (277, '241', '239', 78, '1', 'Wed Jan 04 04:57:57 CST 2023', 2324.25000000, NULL, 0);
INSERT INTO `shopping_cart` VALUES (279, '102', '102', 79, '2', 'Thu Jan 05 20:59:26 CST 2023', 1.50000000, NULL, 0);
INSERT INTO `shopping_cart` VALUES (280, '157', '154', 79, '1', 'Thu Jan 05 20:59:44 CST 2023', 1.50000000, NULL, 0);

-- ----------------------------
-- Table structure for user_addr
-- ----------------------------
DROP TABLE IF EXISTS `user_addr`;
CREATE TABLE `user_addr`  (
  `addr_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '地址主键id',
  `user_id` int NOT NULL COMMENT '用户ID',
  `receiver_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人姓名',
  `receiver_mobile` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人手机号',
  `province` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '城市',
  `area` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '区县',
  `addr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '详细地址',
  `post_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `status` int NULL DEFAULT NULL COMMENT '状态,1正常，0无效',
  `common_addr` int NULL DEFAULT NULL COMMENT '是否默认地址 1是 1:是  0:否',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`addr_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_addr_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户地址 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user_addr
-- ----------------------------
INSERT INTO `user_addr` VALUES ('1db539dc-f306-4b48-9776-0a69097cec15', 78, '黄琳盛', '17677275020', '广西壮族自治区', '来宾市', '兴宾区', '广西科技师范学院菜鸟驿站', NULL, NULL, NULL, '2022-12-11 10:28:55', '2022-12-11 10:28:55');
INSERT INTO `user_addr` VALUES ('538f137e-5844-4e20-bcf3-c269656ed537', 83, '黄先波', '13100000000', '台湾省', '高雄市', '新兴区', '湾仔码头海上花园11栋1102室', NULL, NULL, NULL, '2023-01-27 04:41:53', '2023-01-27 04:41:53');
INSERT INTO `user_addr` VALUES ('7e0bde57-0483-4e77-8a1a-f955095a2d22', 79, '黄sir', '17677275020', '广西壮族自治区', '钦州市', '钦南区', '菜鸟驿站', NULL, NULL, NULL, '2022-12-20 19:13:24', '2022-12-20 19:13:24');
INSERT INTO `user_addr` VALUES ('80fee9a3-0800-4e01-91f7-21fceb6f9462', 83, '何延卿', '100861314150', '广西壮族自治区', '来宾市', '兴宾区', '广西科技师范学院', NULL, NULL, NULL, '2023-03-04 21:15:19', '2023-03-04 21:15:19');
INSERT INTO `user_addr` VALUES ('8cf66e35-7536-4683-8742-f09361567195', 80, '啊', '17677275020', '北京市', '市辖区', '东城区', '啊啊啊', NULL, NULL, NULL, '2023-01-11 22:13:15', '2023-01-11 22:13:15');
INSERT INTO `user_addr` VALUES ('b01482bb-1cdf-4d6e-93c5-6b0b2df9bcc0', 78, '阿九阿九', '123456', '北京市', '市辖区', '东城区', '阿萨的', NULL, NULL, NULL, '2022-12-08 03:25:03', '2022-12-08 03:25:03');

-- ----------------------------
-- Table structure for user_chenck
-- ----------------------------
DROP TABLE IF EXISTS `user_chenck`;
CREATE TABLE `user_chenck`  (
  `user_checkid` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `expiration_time` datetime NULL DEFAULT NULL COMMENT '用户重新申请验证码的时间',
  PRIMARY KEY (`user_checkid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户发送短信码验证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_chenck
-- ----------------------------
INSERT INTO `user_chenck` VALUES (1, '17677275020', '4085', '2022-12-13 03:38:15', '2022-12-13 03:39:15');
INSERT INTO `user_chenck` VALUES (2, '19994645173', '3469', '2023-01-05 19:33:10', '2023-01-05 19:34:09');
INSERT INTO `user_chenck` VALUES (3, '19994645173', '6717', '2023-01-05 19:34:15', '2023-01-05 19:35:15');
INSERT INTO `user_chenck` VALUES (4, '17677275020', '2757', '2023-01-05 19:35:19', '2023-01-05 19:36:19');
INSERT INTO `user_chenck` VALUES (5, '17677275020', '3271', '2023-01-05 19:43:24', '2023-01-05 19:44:24');
INSERT INTO `user_chenck` VALUES (6, '17677275020', '6494', '2023-01-05 19:56:21', '2023-01-05 19:57:21');
INSERT INTO `user_chenck` VALUES (7, '17677275020', '6798', '2023-01-05 19:56:21', '2023-01-05 19:57:21');
INSERT INTO `user_chenck` VALUES (8, '17677275020', '1834', '2023-01-05 19:58:42', '2023-01-05 19:59:42');
INSERT INTO `user_chenck` VALUES (9, '17677275020', '8847', '2023-01-05 20:00:22', '2023-01-05 20:01:22');
INSERT INTO `user_chenck` VALUES (10, '17677275020', '4723', '2023-01-05 20:01:54', '2023-01-05 20:02:53');
INSERT INTO `user_chenck` VALUES (11, '17677275020', '8955', '2023-01-05 20:04:41', '2023-01-05 20:05:41');
INSERT INTO `user_chenck` VALUES (12, '17677275020', '8121', '2023-01-05 20:05:45', '2023-01-05 20:06:45');
INSERT INTO `user_chenck` VALUES (13, '17677275020', '8619', '2023-01-05 20:14:27', '2023-01-05 20:15:27');
INSERT INTO `user_chenck` VALUES (14, '17677275020', '8494', '2023-01-05 20:15:33', '2023-01-05 20:16:33');
INSERT INTO `user_chenck` VALUES (15, '17677275020', '4667', '2023-01-05 20:16:44', '2023-01-05 20:17:44');
INSERT INTO `user_chenck` VALUES (16, '17677275020', '8917', '2023-01-05 20:17:50', '2023-01-05 20:18:50');
INSERT INTO `user_chenck` VALUES (17, '17677275020', '4286', '2023-01-05 20:20:02', '2023-01-05 20:21:02');
INSERT INTO `user_chenck` VALUES (18, '17677275020', '6036', '2023-01-05 20:21:34', '2023-01-05 20:22:34');
INSERT INTO `user_chenck` VALUES (19, '17677275020', '4233', '2023-01-05 20:28:18', '2023-01-05 20:29:18');
INSERT INTO `user_chenck` VALUES (20, '17677275020', '6879', '2023-01-05 20:36:15', '2023-01-05 20:37:14');
INSERT INTO `user_chenck` VALUES (21, '17677275020', '3854', '2023-01-05 20:39:02', '2023-01-05 20:40:02');
INSERT INTO `user_chenck` VALUES (22, '17677275020', '5156', '2023-01-05 20:44:13', '2023-01-05 20:45:13');
INSERT INTO `user_chenck` VALUES (23, '17677275020', '3463', '2023-01-05 20:46:31', '2023-01-05 20:47:31');
INSERT INTO `user_chenck` VALUES (24, '17677275020', '5613', '2023-01-05 20:51:57', '2023-01-05 20:52:56');
INSERT INTO `user_chenck` VALUES (25, '13237796716', '8443', '2023-01-21 02:16:49', '2023-01-21 02:17:49');
INSERT INTO `user_chenck` VALUES (26, '13237796716', '9819', '2023-01-21 02:19:33', '2023-01-21 02:20:33');
INSERT INTO `user_chenck` VALUES (27, '17677275020', '2694', '2023-01-21 02:21:06', '2023-01-21 02:22:06');
INSERT INTO `user_chenck` VALUES (28, '17677275020', '6070', '2023-01-21 02:22:14', '2023-01-21 02:23:14');
INSERT INTO `user_chenck` VALUES (29, '17677275020', '7614', '2023-01-21 02:23:42', '2023-01-21 02:24:42');
INSERT INTO `user_chenck` VALUES (30, '17677275020', '5251', '2023-01-21 02:24:45', '2023-01-21 02:25:45');
INSERT INTO `user_chenck` VALUES (31, '17677275020', '7382', '2023-01-21 02:25:52', '2023-01-21 02:26:52');
INSERT INTO `user_chenck` VALUES (32, '17677275020', '9331', '2023-01-21 02:28:01', '2023-01-21 02:29:01');
INSERT INTO `user_chenck` VALUES (33, '17677275020', '1169', '2023-01-21 02:45:09', '2023-01-21 02:46:09');
INSERT INTO `user_chenck` VALUES (34, '13237796716', '7807', '2023-01-21 02:46:13', '2023-01-21 02:47:13');
INSERT INTO `user_chenck` VALUES (35, '17677275020', '9886', '2023-01-21 02:51:52', '2023-01-21 02:52:52');

-- ----------------------------
-- Table structure for user_collect
-- ----------------------------
DROP TABLE IF EXISTS `user_collect`;
CREATE TABLE `user_collect`  (
  `collect_id` int NOT NULL AUTO_INCREMENT COMMENT '收藏主键',
  `user_id` int NOT NULL COMMENT '用户主键',
  `category_id` int NOT NULL COMMENT '商品分类主键',
  `product_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品主键',
  `sku_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '库存主键',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存名字',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `isdelete` tinyint(1) NULL DEFAULT NULL COMMENT '阴影属性是否删除',
  PRIMARY KEY (`collect_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `sku_id`(`sku_id` ASC) USING BTREE,
  CONSTRAINT `user_collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_collect_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_collect_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_collect_ibfk_4` FOREIGN KEY (`sku_id`) REFERENCES `product_sku` (`sku_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_collect
-- ----------------------------
INSERT INTO `user_collect` VALUES (71, 78, 11, '242', '24', '加力加 100g', '2022-12-21 02:18:13', NULL);
INSERT INTO `user_collect` VALUES (79, 78, 11, '243', '240', '加力加 100g', '2022-12-21 22:32:53', NULL);
INSERT INTO `user_collect` VALUES (80, 78, 11, '241', '239', '加力加 100g', '2022-12-21 22:32:58', NULL);
INSERT INTO `user_collect` VALUES (82, 83, 11, '246', '243', '加力加 100g', '2023-01-28 17:22:37', NULL);
INSERT INTO `user_collect` VALUES (83, 83, 11, '242', '24', '加力加 100g', '2023-01-28 17:22:45', NULL);
INSERT INTO `user_collect` VALUES (84, 83, 11, '242', '339', '加力加 200g', '2023-01-28 17:22:46', NULL);

-- ----------------------------
-- Table structure for user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `user_login_history`;
CREATE TABLE `user_login_history`  (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `AREA` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地区',
  `COUNTRY` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '国家',
  `USER_ID` int NULL DEFAULT NULL COMMENT '用户id',
  `IP` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'IP',
  `LOGIN_TIME` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '时间',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `USER_ID`(`USER_ID` ASC) USING BTREE,
  CONSTRAINT `user_login_history_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '登录历史表 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user_login_history
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '主键id 用户id',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名 用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码 密码',
  `nickname` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称 昵称',
  `realname` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '真实姓名 真实姓名',
  `user_img` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '头像 头像',
  `user_mobile` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号 手机号',
  `user_email` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱地址 邮箱地址',
  `user_sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别 M(男) or F(女)',
  `user_birth` date NULL DEFAULT NULL COMMENT '生日 生日',
  `user_regtime` datetime NOT NULL COMMENT '注册时间 创建时间',
  `user_modtime` datetime NOT NULL COMMENT '更新时间 更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (78, '岛田源氏', '00c359ff62ed7c1e02a69007d20afbe8', NULL, NULL, 'img/user.jpg', '17677275021', NULL, NULL, NULL, '2022-12-01 03:00:54', '2022-12-01 03:00:54');
INSERT INTO `users` VALUES (79, '长岛冰茶', '00c359ff62ed7c1e02a69007d20afbe8', NULL, NULL, 'img/user.jpg', '17677275022', NULL, NULL, NULL, '2022-12-13 03:38:33', '2022-12-13 03:38:33');
INSERT INTO `users` VALUES (80, '长岛', '00c359ff62ed7c1e02a69007d20afbe8', NULL, NULL, 'img/user.jpg', '17677275023', NULL, NULL, NULL, '2023-01-05 20:52:19', '2023-01-05 20:52:19');
INSERT INTO `users` VALUES (81, '太极', '00c359ff62ed7c1e02a69007d20afbe8', NULL, NULL, 'img/user.jpg', '17677275024', NULL, NULL, NULL, '2023-01-21 02:45:26', '2023-01-21 02:45:26');
INSERT INTO `users` VALUES (82, '白雪公主', '00c359ff62ed7c1e02a69007d20afbe8', NULL, NULL, 'img/user.jpg', '13237796716', NULL, NULL, NULL, '2023-01-21 02:46:30', '2023-01-21 02:46:30');
INSERT INTO `users` VALUES (83, '测试', '00c359ff62ed7c1e02a69007d20afbe8', NULL, NULL, 'img/user.jpg', '17677275020', NULL, NULL, NULL, '2023-01-21 02:52:06', '2023-01-21 02:52:06');

SET FOREIGN_KEY_CHECKS = 1;
