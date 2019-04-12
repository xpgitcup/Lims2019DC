/*
 Navicat Premium Data Transfer

 Source Server         : sample
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : lims2019db

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 12/04/2019 21:36:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `person_title_id` bigint(20) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `major_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_4gr67lk0t9mc9aoqfbo9mdmtw`(`code`) USING BTREE,
  INDEX `FKgp5bmxhm3l9bb8l2oymygnfed`(`person_title_id`) USING BTREE,
  INDEX `FKfj7yapqul1e9v1e0e79x6yqmi`(`major_id`) USING BTREE,
  INDEX `FK3e0iqc4bmiwmp8ltecavkc7d8`(`supervisor_id`) USING BTREE,
  CONSTRAINT `FK3e0iqc4bmiwmp8ltecavkc7d8` FOREIGN KEY (`supervisor_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKfj7yapqul1e9v1e0e79x6yqmi` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKgp5bmxhm3l9bb8l2oymygnfed` FOREIGN KEY (`person_title_id`) REFERENCES `person_title` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES (1, 0, 3, '2151', '李晓平', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (2, 0, 10, '1552', '宫敬', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (3, 0, 4, '1102', '吴海浩', 'cn.edu.cup.basic.Teacher', NULL, NULL, NULL);
INSERT INTO `person` VALUES (4, 0, 15, '2014314014', '石国赟', 'cn.edu.cup.basic.Student', '2014', 1, 2);
INSERT INTO `person` VALUES (5, 0, 15, '2014314013', '丁麟', 'cn.edu.cup.basic.Student', '2014', 1, 2);
INSERT INTO `person` VALUES (6, 0, 15, '2015314019', '虞维超', 'cn.edu.cup.basic.Student', '2015', 1, 2);
INSERT INTO `person` VALUES (7, 0, 15, '2015314016', '马千里', 'cn.edu.cup.basic.Student', '2015', 1, 2);
INSERT INTO `person` VALUES (8, 0, 15, '2015314022', '靳航', 'cn.edu.cup.basic.Student', '2015', 1, 2);
INSERT INTO `person` VALUES (9, 0, 15, '2015314023', '柳扬', 'cn.edu.cup.basic.Student', '2015', 1, 2);
INSERT INTO `person` VALUES (10, 0, 15, '2015314017', '宋尚飞', 'cn.edu.cup.basic.Student', '2015', 1, 2);
INSERT INTO `person` VALUES (11, 0, 15, '2016314026', '康琦', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (12, 0, 15, '2016314018', '洪炳沅', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (13, 0, 15, '2016314025', '黄辉荣', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (14, 0, 15, '2016314019', '王丹', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (15, 0, 15, '2016314017', '李昂', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (16, 0, 15, '2017314026', '樊迪', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (17, 0, 15, '2017314015', '齐雪宇', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (18, 0, 15, '2017314023', '于志鹏', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (19, 0, 15, '2017314013', '陈玉川', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (20, 0, 15, '2017314014', '李熠辰', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (21, 0, 15, '2017314024', '张盛楠', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (22, 0, 15, '2018314016', '段旭', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (23, 0, 15, '2018314015', '陈思杭', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (24, 0, 15, '2018314026', '彭泽恒', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (25, 0, 15, '2018314025', '李楷', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (26, 0, 17, '2015214549', '金浩', 'cn.edu.cup.basic.Student', '2015', 2, 2);
INSERT INTO `person` VALUES (27, 0, 17, '2015214571', '马晓旭', 'cn.edu.cup.basic.Student', '2015', 2, 2);
INSERT INTO `person` VALUES (28, 0, 17, '2015214557', '朱梦琪', 'cn.edu.cup.basic.Student', '2015', 2, 2);
INSERT INTO `person` VALUES (29, 0, 17, '2016214568', '陈新果', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (30, 0, 17, '2016214090', '陈怡鸣', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (31, 0, 17, '2016214554', '陈影', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (32, 0, 17, '2016214555', '崔可心', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (33, 0, 17, '2016214536', '丁凯', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (34, 0, 17, '2016214091', '甘东英', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (35, 0, 17, '2016214537', '高航', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (36, 0, 17, '2016214541', '韩庆龙', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (37, 0, 17, '2016214538', '黄璞', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (38, 0, 17, '2016214539', '李梦瑶', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (39, 0, 17, '2016214086', '李莎', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (40, 0, 17, '2016214556', '李愚', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (41, 0, 17, '2016214544', '王传硕', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (42, 0, 17, '2016214543', '任亮', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (43, 0, 17, '2016214060', '沈伟伟', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (44, 0, 17, '2016214092', '沈允', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (45, 0, 17, '2016214076', '苏越', 'cn.edu.cup.basic.Student', '2016', 1, 1);
INSERT INTO `person` VALUES (46, 0, 17, '2016214557', '万洋洋', 'cn.edu.cup.basic.Student', '2016', 2, 1);
INSERT INTO `person` VALUES (47, 0, 17, '2016214558', '王茀玺', 'cn.edu.cup.basic.Student', '2016', 2, 2);
INSERT INTO `person` VALUES (48, 0, 17, '2016214057', '王君傲', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (49, 0, 17, '2016214093', '吴停', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (50, 0, 17, '2016214096', '夏子杰', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (51, 0, 17, '2015214064', '许洁', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (52, 0, 17, '2016214063', '张若晨', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (53, 0, 17, '2016214065', '赵云鹏', 'cn.edu.cup.basic.Student', '2016', 1, 2);
INSERT INTO `person` VALUES (54, 0, 17, '2016214560', '周艳红', 'cn.edu.cup.basic.Student', '2016', 2, 1);
INSERT INTO `person` VALUES (55, 0, 17, '2017214552', '邓坤', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (56, 0, 17, '2017214564', '高晶晶', 'cn.edu.cup.basic.Student', '2017', 2, 1);
INSERT INTO `person` VALUES (57, 0, 17, '2017214553', '高振宇', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (58, 0, 17, '2017214565', '何卓', 'cn.edu.cup.basic.Student', '2017', 2, 1);
INSERT INTO `person` VALUES (59, 0, 17, '2017214554', '胡杰', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (60, 0, 17, '2017214558', '兰文萍', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (61, 0, 17, '2017214584', '李根', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (62, 0, 17, '2017214050', '李金潮', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (63, 0, 17, '2017214052', '李立', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (64, 0, 17, '2017214555', '林聿明', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (65, 0, 17, '2017214053', '吕鹏飞', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (66, 0, 17, '2017214054', '孙小喆', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (67, 0, 17, '2017214081', '王振威', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (68, 0, 17, '2017214078', '肖亚琪', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (69, 0, 17, '2017214070', '谢平', 'cn.edu.cup.basic.Student', '2017', 1, 1);
INSERT INTO `person` VALUES (70, 0, 17, '2017214082', '薛一菡', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (71, 0, 17, '2017214570', '杨克', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (72, 0, 17, '2017214566', '禹亚峰', 'cn.edu.cup.basic.Student', '2017', 2, 1);
INSERT INTO `person` VALUES (73, 0, 17, '2017214556', '张昊', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (74, 0, 17, '2017214055', '张杰', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (75, 0, 17, '2017214557', '张蒙丽', 'cn.edu.cup.basic.Student', '2017', 2, 2);
INSERT INTO `person` VALUES (76, 0, 17, '2017214056', '张佩颖', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (77, 0, 17, '2017214069', '狄国佳', 'cn.edu.cup.basic.Student', '2017', 1, 2);
INSERT INTO `person` VALUES (78, 0, 17, '2018214052', '丁陈陈', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (79, 0, 17, '2018214053', '纪晨秋', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (80, 0, 17, '2018214054', '廖清云', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (81, 0, 17, '2018214055', '刘鹏', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (82, 0, 17, '2018214056', '刘轩章', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (83, 0, 17, '2018214051', '李国豪', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (84, 0, 17, '2018214075', '林德才', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (85, 0, 17, '2018214078', '葛运通', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (86, 0, 17, '2018214079', '杨晓鹏', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (87, 0, 17, '2018214544', '冯兴', 'cn.edu.cup.basic.Student', '2018', 2, 2);
INSERT INTO `person` VALUES (88, 0, 17, '2018214545', '王昕楚', 'cn.edu.cup.basic.Student', '2018', 2, 2);
INSERT INTO `person` VALUES (89, 0, 17, '2018214546', '王靖怡', 'cn.edu.cup.basic.Student', '2018', 2, 2);
INSERT INTO `person` VALUES (90, 0, 17, '2018214553', '崔雪萌', 'cn.edu.cup.basic.Student', '2018', 2, 2);
INSERT INTO `person` VALUES (91, 0, 17, '2018214554', '都兆楠', 'cn.edu.cup.basic.Student', '2018', 2, 2);
INSERT INTO `person` VALUES (92, 0, 17, '2018214555', '谭遥', 'cn.edu.cup.basic.Student', '2018', 2, 1);
INSERT INTO `person` VALUES (93, 0, 17, '2018214084', '周建伟', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (94, 0, 17, '2018214068', '刘胜男', 'cn.edu.cup.basic.Student', '2018', 1, 1);
INSERT INTO `person` VALUES (95, 0, 17, '2018214080', '喻伟婕', 'cn.edu.cup.basic.Student', '2018', 1, 2);
INSERT INTO `person` VALUES (96, 0, 17, '2018214081', '张璐瑶', 'cn.edu.cup.basic.Student', '2018', 1, 2);

SET FOREIGN_KEY_CHECKS = 1;
