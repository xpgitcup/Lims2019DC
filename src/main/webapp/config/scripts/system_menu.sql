/*
 Navicat Premium Data Transfer

 Source Server         : sample
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : lims2019db

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 23/04/2019 17:59:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_order` int(11) NOT NULL,
  `role_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `up_menu_item_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK8331mdhjkgmyxcfl4x9owm0xe`(`up_menu_item_id`) USING BTREE,
  CONSTRAINT `FK8331mdhjkgmyxcfl4x9owm0xe` FOREIGN KEY (`up_menu_item_id`) REFERENCES `system_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, 0, NULL, '系统维护', '对系统的菜单结构进行用户友好的维护', '#', 0, NULL, NULL);
INSERT INTO `system_menu` VALUES (2, 0, NULL, '路径维护', '对系统底层的数据路径进行维护', 'operation4DataRootPath/index', 40, NULL, 1);
INSERT INTO `system_menu` VALUES (3, 0, NULL, '菜单维护', '对系统的菜单用户进行用户友好的维护', 'Operation4SystemMenu/index', 20, NULL, 1);
INSERT INTO `system_menu` VALUES (4, 0, NULL, '权限维护', '对系统的用户属性进行用户友好的维护', 'Operation4SystemAttribute/index', 0, NULL, 1);
INSERT INTO `system_menu` VALUES (5, 0, NULL, '用户维护', '对系统的用户进行用户友好的维护', 'Operation4SystemUser/index', 10, NULL, 1);
INSERT INTO `system_menu` VALUES (6, 0, NULL, '查询维护', '对系统底层的查询语句进行维护', 'operation4QueryStatement/index', 40, NULL, 1);
INSERT INTO `system_menu` VALUES (7, 0, NULL, '基础维护', '维护基础数据', '#', 0, NULL, NULL);
INSERT INTO `system_menu` VALUES (8, 0, NULL, '人员类型', '维护人员的各种类型数据', 'Operation4PersonTitle/index', 0, NULL, 7);
INSERT INTO `system_menu` VALUES (9, 0, NULL, '任务圈维护', '任务与人员类别之间建立联系', 'Operation4ThingTypeCircle/index', 4, NULL, 7);
INSERT INTO `system_menu` VALUES (10, 0, NULL, '人员数据', '各种人员的基础数据', 'Operation4Person/index', 1, NULL, 7);
INSERT INTO `system_menu` VALUES (11, 0, NULL, '项目数据', '各种项目的基础数据', 'Operation4Thing/index', 3, NULL, 7);
INSERT INTO `system_menu` VALUES (12, 0, NULL, '通用计划', '通用计划管理', 'Operation4Plan/index', 3, NULL, 7);
INSERT INTO `system_menu` VALUES (13, 0, NULL, '项目类型', '维护各种项目的类型数据', 'Operation4ThingType/index', 2, NULL, 7);
INSERT INTO `system_menu` VALUES (14, 0, NULL, '用户服务', '从团队开始，用户在此完成全部操作', '#', 0, NULL, NULL);
INSERT INTO `system_menu` VALUES (15, 0, NULL, '教学任务', '各种项目的基础数据', 'Operation4Team/index?currentTask=教学任务', 0, NULL, 14);
INSERT INTO `system_menu` VALUES (16, 0, NULL, '科研任务', '各种项目的基础数据', 'Operation4Team/index?currentTask=科研任务', 0, NULL, 14);
INSERT INTO `system_menu` VALUES (17, 1, NULL, '初始化团队计划', '初始化格格团队的计划信息', 'Operation4ProjectPlan/checkAndInitProjectPlan', 0, NULL, 7);

SET FOREIGN_KEY_CHECKS = 1;
