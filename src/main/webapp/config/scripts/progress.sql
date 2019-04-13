/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.16.50
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : 10.1.16.50:3306
 Source Schema         : lims2018bdb

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 13/04/2019 08:43:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for progress
-- ----------------------------
DROP TABLE IF EXISTS `progress`;
CREATE TABLE `progress`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `current_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `team_id` bigint(20) NOT NULL,
  `prev_progress_id` bigint(20) NULL DEFAULT NULL,
  `problem_encounter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `support_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contributor_id` bigint(20) NOT NULL,
  `reg_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9rdflrh05eu15ao9mldbr2eqg`(`team_id`) USING BTREE,
  INDEX `FKaegt6dto4gjcsiy0xhfy491dx`(`prev_progress_id`) USING BTREE,
  INDEX `FK3gfg3qw93o00sgybjd3nuy1v0`(`contributor_id`) USING BTREE,
  CONSTRAINT `FK3gfg3qw93o00sgybjd3nuy1v0` FOREIGN KEY (`contributor_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK9rdflrh05eu15ao9mldbr2eqg` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKaegt6dto4gjcsiy0xhfy491dx` FOREIGN KEY (`prev_progress_id`) REFERENCES `progress` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of progress
-- ----------------------------
INSERT INTO `progress` VALUES (1, 0, '已完成布站，且在TLNET内完成了三种算例的建模，今晚进行模拟校核。', 34, NULL, NULL, NULL, 114, '2019-03-04 10:04:00');
INSERT INTO `progress` VALUES (2, 0, '已完成基础数据计算，选择管径，确定流量，校核流态，已经计算出水力坡降，现在正在完成泵的选型进而确定布站位置', 32, NULL, '可能需要在已有站场之间加中间站', '12组课程设计计算数据.xlsx', 120, '2019-03-04 10:03:00');
INSERT INTO `progress` VALUES (3, 0, 'word版（未整理）', 34, 1, NULL, '课程设计111.docx', 114, '2019-03-04 10:06:00');
INSERT INTO `progress` VALUES (4, 0, '对所用软件进行调研', 42, NULL, NULL, NULL, 247, '2019-03-04 10:25:00');
INSERT INTO `progress` VALUES (5, 0, '已完成管径及壁厚计算，并已分组，三名成员各自进行水力计算、泵的选择及泵站布置，进行混油计算及SPS搭建讨论。', 30, NULL, '主要为开始阶段的变管径问题困扰，目前已解决', 'CA6A6EF4-F594-4031-86E7-5F061364AD0F.jpeg', 131, '2019-03-04 10:20:00');
INSERT INTO `progress` VALUES (6, 0, '已经根据雷诺数选取管径，计算出水力坡降，正在选泵和布站', 37, NULL, '暂无', NULL, 105, '2019-03-04 10:26:00');
INSERT INTO `progress` VALUES (7, 0, '已完成对大部分软件的调研，选择了LPS及TLNET软件来完成对工况的模拟', 17, NULL, '软件学习及安装具有一定的难度', NULL, 260, '2019-03-04 10:27:00');
INSERT INTO `progress` VALUES (8, 0, '已完成三种方案（管径、壁厚、变径）建立、混油情况、水力计算、成本计算、罐容计算、建立LPS和SPS模型对计算结果进行校核', 28, NULL, '一、泵型号凭经验选取，我组的解决办法是利用软件进行校核；二、LPS软件高程参数总自动变化，无法更改', '长输管道课程设计兰敏9组.xlsx', 107, '2019-03-04 09:54:00');
INSERT INTO `progress` VALUES (9, 0, '已完成管径的选取，摩阻的计算，正在进行选泵和布站，以及经济必选', 43, NULL, NULL, NULL, 125, '2019-03-04 10:34:00');
INSERT INTO `progress` VALUES (10, 0, '已完成三种方案（管径、壁厚、变径）建立、混油情况、水力计算、成本计算、罐容计算、建立LPS和SPS模型对计算结果进行校核', 28, 8, '一、泵型号凭经验选取，我组的解决办法是利用软件进行校核；二、LPS软件高程参数总自动变化，无法更改', '长输管道课程设计兰敏9组.docx', 107, '2019-03-04 10:35:00');
INSERT INTO `progress` VALUES (11, 0, '学习了LPS的使用，并按照说明书自己模拟了一遍，调研了一部分软件的信息，设置了自己组的一些站点数据', 20, NULL, 'LPS的瞬态模拟掌握的还不熟练，需要进一步学习', '地温高程站点总传热系数.rar', 265, '2019-03-04 10:29:00');
INSERT INTO `progress` VALUES (12, 0, '准备使用LPS和TLNET软件做模拟比较，模拟基础数据基本准备完毕。。', 33, NULL, NULL, NULL, 258, '2019-03-04 10:35:00');
INSERT INTO `progress` VALUES (13, 0, '已经进行了管径和壁厚的计算和选择，校核流态，进行了水力计算，正在做泵的选择以及泵站位置的 选定', 45, NULL, NULL, '二.xlsx', 119, '2019-03-04 10:32:00');
INSERT INTO `progress` VALUES (14, 0, '管道模拟软件的安装和学习', 18, NULL, NULL, NULL, 95, '2019-03-04 10:38:00');
INSERT INTO `progress` VALUES (15, 0, '完成了基础计算，并用matlab进行了水力计算，正在进行选泵和布站操作', 49, NULL, NULL, NULL, 133, '2019-03-04 10:40:00');
INSERT INTO `progress` VALUES (16, 0, '管径已经确定，站址位置已布好，目前正在三个方案用汽油进行校核', 22, NULL, NULL, '初稿.docx', 116, '2019-03-04 09:42:00');
INSERT INTO `progress` VALUES (17, 0, '测试1', 6, NULL, NULL, '华南项目工作周报-任亮20171019.docx', 224, '2019-03-04 10:42:00');
INSERT INTO `progress` VALUES (18, 0, '已经为完成三种方案的管径与壁厚选取，并分别进行了沿程摩阻计算，强度校核与稳定性校核，正在准备布站与选泵', 48, NULL, NULL, NULL, 102, '2019-03-04 10:49:00');
INSERT INTO `progress` VALUES (19, 0, '根据教程学习了LPS和realpipe 软件，并且建立了一条管线，确定了相关数据，并用LPS建立了模型。', 25, NULL, NULL, NULL, 90, '2019-03-04 10:48:00');
INSERT INTO `progress` VALUES (20, 0, '软件综述调研完成60%完成率，LPS的安装与学习，在进行数据的调试。', 24, NULL, '其他软件的学习不会', NULL, 252, '2019-03-04 10:49:00');
INSERT INTO `progress` VALUES (21, 0, '安装调试SPS和realpipe软件，同时进行综述整理工作', 26, NULL, NULL, NULL, 238, '2019-03-04 10:53:00');
INSERT INTO `progress` VALUES (22, 0, '初步了解软件调研，暂定使用LPS及TLNET进行工况模拟，进行软件的安装和学习', 27, NULL, NULL, NULL, 244, '2019-03-04 10:55:00');
INSERT INTO `progress` VALUES (23, 0, '已经为完成三种方案的管径与壁厚选取，三个队员对选取三种管径分别进行了沿程摩阻计算以及翻越点验证，正在进行布站', 46, NULL, NULL, '张  悦.docx', 136, '2019-03-04 10:59:00');
INSERT INTO `progress` VALUES (24, 0, '根据LPS教程学习并模拟克乌管线流程，也开始调研关于LPS软件的一些综述性材料', 19, NULL, '一位同学的LPS文件保存出现一点问题', NULL, 240, '2019-03-04 11:02:00');
INSERT INTO `progress` VALUES (25, 0, '完成基础数据计算，确定变径方案，校核流态，完成水力坡降计算，lps基础数据已录入，现在正在进行布站', 36, NULL, NULL, '水力计算.xlsx', 109, '2019-03-04 11:10:00');
INSERT INTO `progress` VALUES (26, 0, '基础数据准备，数字孪生软件的调研，以及LPS，pipephase软件的学习中', 31, NULL, NULL, NULL, 257, '2019-03-04 11:15:00');
INSERT INTO `progress` VALUES (27, 0, '中期汇报PPT', 3, NULL, NULL, '4_长治单管项目中期汇报12.5.pptx', 48, '2019-03-04 17:02:00');
INSERT INTO `progress` VALUES (28, 0, '投标文件', 8, NULL, NULL, '管道积液模拟试验投标文件.docx', 48, '2019-03-04 17:04:00');
INSERT INTO `progress` VALUES (29, 0, '会议纪要', 4, NULL, NULL, '会议纪要.docx', 48, '2019-03-04 17:09:00');
INSERT INTO `progress` VALUES (30, 0, '第一周作业', 52, NULL, NULL, '第一周作业.docx', 84, '2019-03-04 18:24:00');
INSERT INTO `progress` VALUES (31, 0, '汇报2018.5.15', 4, NULL, NULL, '汇报5.15.pptx', 61, '2019-03-04 18:26:00');
INSERT INTO `progress` VALUES (32, 0, '汇报2018.5.22', 4, NULL, NULL, '汇报5.22.pptx', 61, '2019-03-04 18:30:00');
INSERT INTO `progress` VALUES (33, 0, '汇报2018.6.22', 4, NULL, NULL, '汇报6.22.pptx', 61, '2019-03-04 18:30:00');
INSERT INTO `progress` VALUES (34, 0, '汇报2018.7.25', 4, NULL, NULL, '汇报7.25.pptx', 61, '2019-03-04 18:31:00');
INSERT INTO `progress` VALUES (35, 0, '汇报2018.8.15', 4, NULL, NULL, '汇报8.15.pptx', 61, '2019-03-04 18:31:00');
INSERT INTO `progress` VALUES (36, 0, '汇报2018.11.12', 4, NULL, NULL, '汇报11.12.pptx', 61, '2019-03-04 18:32:00');
INSERT INTO `progress` VALUES (37, 0, '汇报2018.11.19', 4, NULL, NULL, '汇报11.19.pptx', 61, '2019-03-04 18:32:00');
INSERT INTO `progress` VALUES (38, 0, '汇报2018.11.19', 4, NULL, NULL, '汇报11.19.pptx', 61, '2019-03-04 18:32:00');
INSERT INTO `progress` VALUES (39, 0, '汇报2018.11.19', 4, NULL, NULL, '汇报11.19.pptx', 61, '2019-03-04 18:32:00');
INSERT INTO `progress` VALUES (40, 0, '汇报2018.11.26', 4, NULL, NULL, '汇报11.26.pptx', 61, '2019-03-04 18:35:00');
INSERT INTO `progress` VALUES (41, 0, '汇报2018.12.3', 4, NULL, NULL, '汇报12.3.pptx', 61, '2019-03-04 18:36:00');
INSERT INTO `progress` VALUES (42, 0, '汇报2019.1.7', 4, NULL, NULL, '汇报2019.1.7.pptx', 61, '2019-03-04 18:36:00');
INSERT INTO `progress` VALUES (43, 0, '汇报2019.1.14', 4, NULL, NULL, '汇报2019.1.14.pptx', 61, '2019-03-04 18:36:00');
INSERT INTO `progress` VALUES (44, 0, '管网项目中期汇报12.11', 4, NULL, NULL, '长治集输管网项目中期汇报12.11.pptx', 61, '2019-03-04 18:38:00');
INSERT INTO `progress` VALUES (45, 0, '长治管网项目中期总结12.5', 4, NULL, NULL, '长治管网项目中期总结12.5.docx', 61, '2018-12-05 20:32:00');
INSERT INTO `progress` VALUES (46, 0, '完成SCADA第一次作业--设想大数据的应用场景', 54, NULL, NULL, '刘胜男 崔雪萌 周建伟--大数据应用场景.pptx', 97, '2019-03-04 23:31:00');
INSERT INTO `progress` VALUES (47, 0, '汇报2019.3.5', 4, NULL, NULL, '汇报2019.3.5.pptx', 61, '2019-03-05 10:13:00');
INSERT INTO `progress` VALUES (48, 0, '2018.1.7研究记录册', 4, NULL, NULL, '1.7研究记录册.docx', 61, '2018-01-07 10:14:00');
INSERT INTO `progress` VALUES (49, 0, '华南软件源代码', 6, NULL, NULL, 'EasyPipe2017B-华南-2.6.zip', 263, '2019-03-05 13:08:00');
INSERT INTO `progress` VALUES (50, 0, '温老师程序', 6, NULL, NULL, 'XSHN_Data_Transfer.zip', 49, '2019-03-05 15:51:00');
INSERT INTO `progress` VALUES (51, 0, '华南软件源代码', 6, NULL, NULL, 'EasyPipe2017B-华南-2.6.zip', 49, '2019-03-05 15:54:00');
INSERT INTO `progress` VALUES (52, 0, '已完成汇报ppt', 41, NULL, NULL, 'SCADA第一次汇报.pptx', 260, '2019-03-05 19:01:00');
INSERT INTO `progress` VALUES (53, 0, '完成', 53, NULL, NULL, '第一次作业.rar', 264, '2019-03-05 19:37:00');
INSERT INTO `progress` VALUES (54, 0, '完成第一周大数据应用设想作业', 51, NULL, NULL, '大数据智慧化生活设想.docx', 82, '2019-03-05 21:08:00');
INSERT INTO `progress` VALUES (55, 0, '完成 智慧管道设想', 50, NULL, NULL, '智慧管道.pptx', 95, '2019-03-06 15:26:00');
INSERT INTO `progress` VALUES (56, 0, '继续完善各阶段所用软件的工作简介', 42, 4, NULL, NULL, 247, '2019-03-06 16:51:00');
INSERT INTO `progress` VALUES (57, 0, '数字双生所涉及的软件综述文献查阅中，LPS软件进一步学习中', 31, NULL, NULL, NULL, 257, '2019-03-06 17:00:00');
INSERT INTO `progress` VALUES (58, 0, 'Lps模拟完毕，正在学习新软件。', 33, NULL, NULL, NULL, 258, '2019-03-06 16:56:00');
INSERT INTO `progress` VALUES (59, 0, '数字双生相关软件文献查阅进行中，前两个阶段基本完成，LPS软件进一步学习中', 31, NULL, NULL, NULL, 257, '2019-03-06 16:57:00');
INSERT INTO `progress` VALUES (60, 0, '学习了TLNET和LPS的运用，成员完成分工，确定了流程模拟的基础数据', 27, NULL, NULL, NULL, 243, '2019-03-06 17:06:00');
INSERT INTO `progress` VALUES (61, 0, '检索油气储运生产设计全过程相关软件', 18, NULL, NULL, '勘察.wps', 95, '2019-03-06 17:07:00');
INSERT INTO `progress` VALUES (62, 0, '已完成LPS软件模型的建立和稳态计算', 17, NULL, '无', NULL, 260, '2019-03-06 17:12:00');
INSERT INTO `progress` VALUES (63, 0, '使用LPS进行了稳态和瞬态的一种工况计算，查阅了相关文献，写了部分综述。', 25, NULL, NULL, NULL, 90, '2019-03-06 17:15:00');
INSERT INTO `progress` VALUES (64, 0, '综述完成度60%；已确定建模数据，模拟实验收集数据', 26, NULL, NULL, NULL, 238, '2019-03-06 19:31:00');
INSERT INTO `progress` VALUES (65, 0, '查阅了有关勘察类软件和设计类的软件，并总结了一些常用软件的介绍、使用特点、应用场合、使用技巧。并进行了这些软件的对比。', 27, NULL, NULL, NULL, 243, '2019-03-08 11:41:00');
INSERT INTO `progress` VALUES (66, 0, '已完成', 22, NULL, NULL, '3组长输管道课程设计.docx', 116, '2019-03-09 18:37:00');
INSERT INTO `progress` VALUES (67, 0, '已完成', 22, NULL, NULL, '3组课设答辩.pptx', 116, '2019-03-09 18:42:00');
INSERT INTO `progress` VALUES (68, 0, '已完成', 22, 67, NULL, '茂名站工艺流程图.dwg', 116, '2019-03-09 19:27:00');
INSERT INTO `progress` VALUES (69, 0, '报告终版及PPT', 34, 3, NULL, '长距离成品油管道工艺课程设计答辩（第四组）.ppt', 114, '2019-03-09 23:49:00');
INSERT INTO `progress` VALUES (70, 0, '报告终版（计算文档过多 不方便上传）', 34, 69, NULL, '长输管道课程设计 储运15-1班 4组.docx', 114, '2019-03-09 23:58:00');
INSERT INTO `progress` VALUES (71, 0, '已完成报告', 37, NULL, '无', '课设报告', 105, '2019-03-09 06:44:00');
INSERT INTO `progress` VALUES (72, 0, '已完成首站流程图', 37, NULL, '无', '二组茂名站工艺流程图.dwg', 105, '2019-03-09 06:46:00');
INSERT INTO `progress` VALUES (73, 0, '已完成计算', 37, NULL, '无', '二组课设计算文档.xlsx', 105, '2019-03-10 06:47:00');
INSERT INTO `progress` VALUES (74, 0, '已完成汇报PPT', 37, NULL, '无', '二组报告.pptx', 105, '2019-03-09 06:49:00');
INSERT INTO `progress` VALUES (75, 0, '修改ppt', 37, 74, '字体不够清晰', '二组报告.pptx', 105, '2019-03-10 07:15:00');
INSERT INTO `progress` VALUES (76, 0, '完成报告撰写 基本完成任务', 28, NULL, 'SPS无法生成报告 校核与初始计算情况差异较大', '第九组报告终极版.docx', 107, '2019-03-10 08:19:00');
INSERT INTO `progress` VALUES (77, 0, '汇报PPT', 28, 8, 'SPS无法生成报告 校核与初始计算情况差异较大', '输油答辩.pptx', 107, '2019-03-10 08:23:00');
INSERT INTO `progress` VALUES (78, 0, '整体计算文档', 28, NULL, NULL, '九组长输管道课程设计.xlsx', 107, '2019-03-10 08:25:00');
INSERT INTO `progress` VALUES (79, 0, '最终结果', 49, NULL, NULL, '2019长输管道设计-15-1第八组.zip', 133, '2019-03-10 08:44:00');
INSERT INTO `progress` VALUES (80, 0, '完成设计', 36, NULL, '不能熟练运用编程软件', '5组.ppt', 110, '2019-03-10 09:24:00');
INSERT INTO `progress` VALUES (81, 0, '完成设计', 36, 80, '不能熟练运用编程软件', '成品油计算表格.xlsx', 110, '2019-03-10 09:25:00');
INSERT INTO `progress` VALUES (82, 0, '完成设计', 36, 81, '不能熟练运用编程软件', '成品油首站流程图2010.dwg', 110, '2019-03-10 09:26:00');
INSERT INTO `progress` VALUES (83, 0, '完成设计', 36, 82, '不能熟练运用编程软件', '成品油长输管道工艺方案设计报告.pdf', 110, '2019-03-10 09:27:00');
INSERT INTO `progress` VALUES (84, 0, '更正格式', 37, 71, NULL, '第二组报告.docx', 105, '2019-03-10 07:03:00');
INSERT INTO `progress` VALUES (85, 0, '完成软件校核，混油计算，经济比选，首站工艺设计', 48, 18, 'LPS软件模拟存在一点超压和欠压的情况', '包括报告、ppt、计算、cad画图.rar', 102, '2019-03-10 10:06:00');
INSERT INTO `progress` VALUES (86, 0, '完成', 43, NULL, NULL, '第7组油气储运工程长输管道课程设计.dwg', 125, '2019-03-10 10:10:00');
INSERT INTO `progress` VALUES (87, 0, '完成', 43, 86, NULL, '第7组油气储运工程长输管道课程设计.docx', 125, '2019-03-10 10:12:00');
INSERT INTO `progress` VALUES (88, 0, '第二组CAD首站图', 37, NULL, NULL, '二组茂名站工艺流程图.dwg', 105, '2019-03-10 10:13:00');
INSERT INTO `progress` VALUES (89, 0, '完成', 43, NULL, NULL, '第7组油气储运工程长输管道课程设计.ppt', 125, '2019-03-10 10:13:00');
INSERT INTO `progress` VALUES (90, 0, '报告文档', 28, NULL, NULL, '第九组报告终极版.docx', 107, '2019-03-10 10:14:00');
INSERT INTO `progress` VALUES (91, 0, '流程图', 28, NULL, NULL, '第九组流程图.pdf', 107, '2019-03-10 10:14:00');
INSERT INTO `progress` VALUES (92, 0, '对三种管径进行了布站，小组成员对泵站进行了泵型的选择，对三种管径进行了混油段的计算，通过经营成本，建设成本，流动资金成本进行了经济比选，软件校核进出站压力，静水压力校核，动水压力校核，绘制首站工艺流程图，制作PPT', 46, NULL, NULL, '第10组课程设计.zip', 136, '2019-03-10 11:00:00');
INSERT INTO `progress` VALUES (93, 0, '最终成果', 30, NULL, NULL, '课设文件.zip', 131, '2019-03-10 17:17:00');
INSERT INTO `progress` VALUES (94, 0, '报告、ppt、计算文档', 45, NULL, NULL, '11组课设.zip', 119, '2019-03-11 13:39:00');
INSERT INTO `progress` VALUES (95, 0, '报告、ppt、计算文档', 45, NULL, NULL, '11组课设.zip', 119, '2019-03-11 14:41:00');
INSERT INTO `progress` VALUES (96, 0, '完成课程设计', 32, NULL, 'LPS水力计算模拟摩阻计算偏大', '12组成品油长输管道课程设计.rar', 120, '2019-03-12 10:24:00');
INSERT INTO `progress` VALUES (97, 0, '“油气储运数字化”应用场景设想—第二次作业', 53, NULL, NULL, '“油气储运数字化”应用场景设想—第二次作业.rar', 66, '2019-03-12 22:30:00');
INSERT INTO `progress` VALUES (98, 0, '第二次设想', 51, NULL, NULL, '智慧化设想2.0.rar', 82, '2019-03-12 23:24:00');
INSERT INTO `progress` VALUES (99, 0, '管道安全助手', 50, 55, NULL, '管道.pptx', 95, '2019-03-13 09:59:00');
INSERT INTO `progress` VALUES (100, 0, '故事上传', 50, NULL, NULL, '管道安全助手.docx', 95, '2019-03-13 10:00:00');
INSERT INTO `progress` VALUES (101, 0, '综述已完成90%；整理最终版数据排版', 26, NULL, NULL, NULL, 238, '2019-03-13 13:23:00');
INSERT INTO `progress` VALUES (102, 0, '第二周作业', 52, 30, NULL, '第二周小说.docx', 84, '2019-03-13 15:20:00');
INSERT INTO `progress` VALUES (103, 0, '第二周汇报PPT', 52, NULL, NULL, 'to be，or not to be？.pptx', 84, '2019-03-13 15:22:00');
INSERT INTO `progress` VALUES (104, 0, 'SCADA第一次作业--设想大数据的应用场景', 54, NULL, NULL, '油气储运未来设想.docx', 97, '2019-03-14 22:00:00');
INSERT INTO `progress` VALUES (105, 0, 'SCADA第二次作业PPT', 54, 104, NULL, '鲨鱼科技.ppt', 97, '2019-03-14 22:03:00');
INSERT INTO `progress` VALUES (106, 0, '综述做补充部分；软件分析已做完；总体进度90%', 26, NULL, NULL, NULL, 238, '2019-03-15 10:52:00');
INSERT INTO `progress` VALUES (107, 0, 'GIS简介', 51, NULL, NULL, 'gis简介 .pptx', 82, '2019-03-19 21:08:00');
INSERT INTO `progress` VALUES (108, 0, '第三次作业—GIS系统浅析', 53, NULL, NULL, '20190319 GIS.ppt', 66, '2019-03-19 21:20:00');
INSERT INTO `progress` VALUES (109, 0, 'SCADA第三次作业GIS', 54, NULL, '缺乏联想', '鲨鱼.pptx', 97, '2019-03-20 09:31:00');
INSERT INTO `progress` VALUES (110, 0, '处理优化模型最近进展', 5, NULL, NULL, '优化模型3.25版.pptx', 59, '2019-03-25 10:54:00');
INSERT INTO `progress` VALUES (111, 0, '处理优化模型求解程序', 5, NULL, NULL, '调用gurobi.mlx', 59, '2019-03-25 10:55:00');
INSERT INTO `progress` VALUES (112, 0, '第三周汇报PPT', 52, NULL, NULL, 'GIS北京市第三区学委队.pptx', 84, '2019-03-26 13:32:00');
INSERT INTO `progress` VALUES (113, 0, '数字化油田', 51, NULL, NULL, '数字化油田.pptx', 82, '2019-03-26 22:21:00');
INSERT INTO `progress` VALUES (114, 0, '初步完成了报告', 17, NULL, NULL, '2019软件概论-第十组.zip', 260, '2019-03-27 08:41:00');
INSERT INTO `progress` VALUES (115, 0, '竞标方案', 54, NULL, NULL, '鲨鱼3.27.pptx', 97, '2019-03-27 08:49:00');
INSERT INTO `progress` VALUES (116, 0, '第四次汇报', 41, NULL, NULL, '格兰芬多公司投标书.pdf', 260, '2019-03-27 08:49:00');
INSERT INTO `progress` VALUES (117, 0, '第一次汇报', 41, NULL, NULL, 'SCADA第一次汇报.pptx', 260, '2019-03-06 08:51:00');
INSERT INTO `progress` VALUES (118, 0, '第一次汇报', 41, NULL, NULL, 'SCADA第一次汇报.pptx', 260, '2019-03-06 08:51:00');
INSERT INTO `progress` VALUES (119, 0, '第二次汇报', 41, NULL, NULL, '第二次汇报.pptx', 260, '2019-03-13 08:52:00');
INSERT INTO `progress` VALUES (120, 0, '第三次汇报', 41, NULL, NULL, '格兰芬多第三次汇报.pptx', 260, '2019-03-20 08:54:00');
INSERT INTO `progress` VALUES (121, 0, '完成', 53, NULL, NULL, '陌上人潮 竞标.ppt', 264, '2019-03-27 10:17:00');
INSERT INTO `progress` VALUES (122, 0, '完成所有任务', 31, NULL, NULL, '工作软件对比.docx', 257, '2019-03-27 10:20:00');
INSERT INTO `progress` VALUES (123, 0, '完成所有任务', 31, NULL, NULL, '软件概论2019.3.20.doc', 257, '2019-03-27 10:22:00');
INSERT INTO `progress` VALUES (124, 0, '完成所有任务', 31, NULL, NULL, '软件台总账作业部分2019.3.21.xls', 257, '2019-03-27 10:22:00');
INSERT INTO `progress` VALUES (125, 0, '完成软件的调研报告和不同软件实际应用的对比报告', 24, 20, '软件应用不熟练，不同软件的模拟效果相差较大', '软件概要.zip', 252, '2019-03-27 12:33:00');
INSERT INTO `progress` VALUES (126, 0, '液体管道模拟', 18, NULL, NULL, '液体管道模拟.docx', 95, '2019-03-27 13:07:00');
INSERT INTO `progress` VALUES (127, 0, '投标', 50, NULL, NULL, '起源.pptx', 95, '2019-03-27 13:08:00');
INSERT INTO `progress` VALUES (128, 0, 'GIS', 50, NULL, NULL, '起源.pptx', 95, '2019-03-27 13:14:00');
INSERT INTO `progress` VALUES (129, 0, '完成LPS和TLNET对一条原油管道的稳态和瞬态模拟计算，并对计算结果进行对比分析，完成软件概要报告初稿', 19, 24, NULL, '软件概要报告.docx', 240, '2019-03-27 13:38:00');
INSERT INTO `progress` VALUES (130, 0, '完成了两个软件的模拟并且分析了误差以及数字双生软件查询，最后完成了两个报告的撰写。', 25, NULL, NULL, '软件概论作业.docx', 90, '2019-03-27 14:01:00');
INSERT INTO `progress` VALUES (131, 0, '软件对比初稿', 33, NULL, NULL, '软件报告.docx', 258, '2019-03-27 14:05:00');
INSERT INTO `progress` VALUES (132, 0, '初版', 18, NULL, NULL, '软件概论.docx', 94, '2019-03-27 14:22:00');
INSERT INTO `progress` VALUES (133, 0, '初版', 18, NULL, NULL, '软件概论.xlsx', 94, '2019-03-27 14:25:00');
INSERT INTO `progress` VALUES (134, 0, '提交初稿', 42, NULL, NULL, '第三组油气储运工程软件概要.rar', 247, '2019-03-27 14:53:00');
INSERT INTO `progress` VALUES (135, 0, '初步完成软件综述', 42, 4, NULL, '油气储运工程软件概要.rar', 247, '2019-03-27 14:54:00');
INSERT INTO `progress` VALUES (136, 0, '软件概论报告初版', 27, NULL, '无', '董小钰 陶冰星 崔雪萌模拟.docx', 93, '2019-03-27 14:58:00');
INSERT INTO `progress` VALUES (137, 0, '初稿', 20, NULL, '另外一个软件模拟还不完善', '第二组数字孪生报告（钟思源 周冰 陈汉）.docx', 265, '2019-03-27 15:16:00');
INSERT INTO `progress` VALUES (138, 0, '已完成', 26, NULL, NULL, '第6组.rar', 238, '2019-03-27 17:51:00');
INSERT INTO `progress` VALUES (139, 0, '3.27为已完成初版，完整版稍后提交', 26, 138, NULL, NULL, 238, '2019-03-27 20:41:00');
INSERT INTO `progress` VALUES (140, 0, '周报', 5, NULL, NULL, '2017214069 4.22.ppt', 80, '2019-03-28 13:04:00');
INSERT INTO `progress` VALUES (141, 0, '周报', 5, 140, NULL, '2017214069 5.3.ppt', 80, '2019-03-28 13:05:00');
INSERT INTO `progress` VALUES (142, 0, '周报', 5, 141, NULL, '2017214069 5.7.ppt', 80, '2019-03-28 13:06:00');
INSERT INTO `progress` VALUES (143, 0, '周报', 5, 142, NULL, '2017214069 5.14.ppt', 80, '2019-03-28 13:07:00');
INSERT INTO `progress` VALUES (144, 0, '周报', 5, 143, NULL, '2017214069 5.21  狄国佳 未修改版.ppt', 80, '2019-03-28 13:08:00');
INSERT INTO `progress` VALUES (145, 0, '周报', 5, 144, NULL, '2017214069 8.1.ppt', 80, '2019-03-28 13:09:00');
INSERT INTO `progress` VALUES (146, 0, '周报', 5, 145, NULL, '2017214069 8.15.ppt', 80, '2019-03-28 13:10:00');
INSERT INTO `progress` VALUES (147, 0, '周报', 5, 146, NULL, '2017214069 狄国佳 11.12.ppt', 80, '2019-03-28 13:11:00');
INSERT INTO `progress` VALUES (148, 0, '实验数据', 60, NULL, '无', '气固两相流冲蚀实验3.28.xlsx', 165, '2019-03-28 18:58:00');
INSERT INTO `progress` VALUES (149, 0, '已完成最终修改稿', 26, NULL, NULL, '第6组-3.29.rar', 238, '2019-03-29 21:11:00');
INSERT INTO `progress` VALUES (150, 0, '实验数据', 60, NULL, '无', '气固两相流冲蚀实验3.29.xlsx', 165, '2019-03-29 01:06:00');
INSERT INTO `progress` VALUES (151, 0, '实验数据', 60, NULL, '无', '气固两相流冲蚀实验3.30.xlsx', 165, '2019-03-30 21:53:00');
INSERT INTO `progress` VALUES (152, 0, '初稿', 20, NULL, 'tlnet的瞬态模拟掌握不好', '软件概论陈汉周冰钟思源-.rar', 265, '2019-03-30 22:37:00');
INSERT INTO `progress` VALUES (153, 0, '翻译文献', 57, NULL, NULL, '邰昊翻译 多产品管道经济节能减排潜力预测：以中国为例.docx', 162, '2019-03-28 17:36:00');
INSERT INTO `progress` VALUES (154, 0, '资料收集', 57, NULL, NULL, '论文集.tar', 162, '2019-03-28 17:38:00');
INSERT INTO `progress` VALUES (155, 0, '文献翻译（原文）', 61, NULL, NULL, '郑衣珍翻译-A three-stage stochastic programming method for LNG supply system infrastructure development and inventory routing in demanding countries.pdf', 185, '2019-03-31 19:19:00');
INSERT INTO `progress` VALUES (156, 0, '文献翻译（译文）', 61, NULL, NULL, '郑衣珍翻译-A three-stage stochastic programming method for LNG supply system infrastructure development and inventory routing in demanding countries.docx', 185, '2019-03-31 19:22:00');
INSERT INTO `progress` VALUES (157, 0, '管网流向图', 61, NULL, NULL, '12.jpg', 185, '2019-03-31 19:24:00');
INSERT INTO `progress` VALUES (158, 0, '实验数据', 60, NULL, NULL, '气固两相流冲蚀实验3.31.xlsx', 165, '2019-03-31 19:53:00');
INSERT INTO `progress` VALUES (159, 0, '提交前期成果', 56, NULL, NULL, '何毅-毕业设计.zip', 151, '2019-03-31 20:21:00');
INSERT INTO `progress` VALUES (160, 0, '了解相关毕设的期刊', 58, NULL, NULL, '不停输实现中哈原油管道阿拉山口计量站计量系统改造.pdf', 211, '2019-04-01 10:00:00');
INSERT INTO `progress` VALUES (161, 0, '了解相关毕设的期刊', 58, 160, '油品的物性在首末两站不一致', '中哈原油管道流量计运行质量分析与评估.pdf', 211, '2019-04-01 10:01:00');
INSERT INTO `progress` VALUES (162, 0, '了解相关毕设的期刊', 58, 160, NULL, '典型跨国原油管道交接计量对比述评.pdf', 211, '2019-04-01 10:02:00');
INSERT INTO `progress` VALUES (163, 0, '了解相关毕设的期刊', 58, 160, NULL, '康迪翻译.pdf', 211, '2019-04-01 10:03:00');
INSERT INTO `progress` VALUES (164, 0, '了解相关毕设的期刊', 58, 160, NULL, '中哈管道上下游原有品质比对研究.pdf', 211, '2019-04-01 10:03:00');
INSERT INTO `progress` VALUES (165, 0, '了解相关毕设的期刊', 58, 160, '与实际管线相比毕设中泵站数略多', '中哈跨国石油管道的.pdf', 211, '2019-04-01 10:03:00');
INSERT INTO `progress` VALUES (166, 0, '准备设计数据', 58, 161, '缺少关于工艺流程图的信息', 'GB 50251-2015 输气管道工程设计规范.pdf', 211, '2019-04-01 10:05:00');
INSERT INTO `progress` VALUES (167, 0, '初稿', 20, NULL, '进一步完善综述，tlnet瞬态掌握不好', '软件概论陈汉周冰钟思源-.rar', 265, '2019-04-01 11:45:00');
INSERT INTO `progress` VALUES (168, 0, '完善了TLNET的瞬态模拟', 20, NULL, '存在误差', '软件概论陈汉周冰钟思源.rar', 265, '2019-04-02 14:23:00');
INSERT INTO `progress` VALUES (169, 0, 'gis应用', 51, NULL, NULL, 'QGIS.pptx', 82, '2019-04-02 21:02:00');
INSERT INTO `progress` VALUES (170, 0, 'SCADA第五次作业-GIS软件应用', 54, NULL, NULL, '鲨鱼4.2.pptx', 97, '2019-04-03 08:24:00');
INSERT INTO `progress` VALUES (171, 0, '第五次汇报', 41, NULL, NULL, 'SCADA第五次汇报.pptx', 260, '2019-04-03 08:41:00');
INSERT INTO `progress` VALUES (172, 0, '实验数据', 60, NULL, NULL, '气固两相流冲蚀实验4.2.xlsx', 165, '2019-04-02 20:43:00');
INSERT INTO `progress` VALUES (173, 0, '第四次作业', 52, NULL, NULL, '学委队.pptx', 84, '2019-03-27 14:01:00');
INSERT INTO `progress` VALUES (174, 0, '第五次作业', 52, NULL, NULL, '北京市第三区学委队.pptx', 84, '2019-04-03 14:03:00');
INSERT INTO `progress` VALUES (175, 0, '利用TLNET进行了模拟计算，并进行了对比分析', 24, NULL, '结果误差仍较大，方法把握有待提升', '软件模拟对比报告2.docx', 252, '2019-04-03 20:13:00');
INSERT INTO `progress` VALUES (176, 0, '实验数据', 60, NULL, NULL, '气固两相流冲蚀实验4.3.xlsx', 165, '2019-04-03 22:40:00');
INSERT INTO `progress` VALUES (177, 0, '英语文献翻译', 60, NULL, NULL, '翻译文献-徐帜.docx', 165, '2019-04-03 22:40:00');
INSERT INTO `progress` VALUES (178, 0, '实验数据', 60, NULL, NULL, '气固两相流冲蚀实验4.5.xlsx', 165, '2019-04-06 11:29:00');
INSERT INTO `progress` VALUES (179, 0, '参考文献', 60, NULL, NULL, '高产气井排砂管汇极限放喷能力研究及其安全性评价_明鑫（数值模拟）.caj', 165, '2019-04-06 11:40:00');
INSERT INTO `progress` VALUES (180, 0, '参考文献', 60, NULL, NULL, '参考文献.zip', 165, '2019-04-06 11:42:00');
INSERT INTO `progress` VALUES (181, 0, '实验数据', 60, NULL, NULL, '气固两相流冲蚀实验4.7.xlsx', 165, '2019-04-07 19:02:00');
INSERT INTO `progress` VALUES (182, 0, '集合站选址程序1', 61, NULL, NULL, '集合站选址的程序.docx', 185, '2019-04-07 20:47:00');
INSERT INTO `progress` VALUES (183, 0, '工艺计算', 58, 166, NULL, '计算.xlsx', 211, '2019-04-08 13:30:00');
INSERT INTO `progress` VALUES (184, 0, '工艺计算', 58, 183, NULL, '加热输油管道工程设计.docx', 211, '2019-04-08 13:31:00');
INSERT INTO `progress` VALUES (185, 0, '部分规范', 57, NULL, NULL, '规范.tar', 162, '2019-04-05 13:39:00');
INSERT INTO `progress` VALUES (186, 0, '论文初步', 57, NULL, NULL, '毕业论文-邰昊.doc', 162, '2019-04-05 13:40:00');
INSERT INTO `progress` VALUES (187, 0, '实验数据', 60, NULL, NULL, '气固两相流冲蚀实验4.8.xlsx', 165, '2019-04-08 19:17:00');
INSERT INTO `progress` VALUES (188, 0, '成稿', 18, NULL, NULL, '液体管道模拟.docx', 94, '2019-04-09 19:25:00');
INSERT INTO `progress` VALUES (189, 0, '成稿', 18, NULL, NULL, '数字双生报告.docx', 94, '2019-04-09 19:26:00');
INSERT INTO `progress` VALUES (190, 0, '附录', 18, NULL, NULL, '数字双生报告软件附录.xlsx', 94, '2019-04-09 19:27:00');
INSERT INTO `progress` VALUES (191, 0, '软件初步设想', 51, NULL, NULL, '软件初步设想.pptx', 82, '2019-04-09 21:32:00');
INSERT INTO `progress` VALUES (192, 0, '实验数据', 60, NULL, NULL, '气固两相流冲蚀实验4.10.xlsx', 165, '2019-04-10 21:24:00');
INSERT INTO `progress` VALUES (193, 0, '模型文献', 56, NULL, NULL, '2010年程为.pdf', 151, '2019-04-12 18:49:00');
INSERT INTO `progress` VALUES (194, 0, '模型文献', 56, 193, NULL, '流型模型.zip', 151, '2019-04-12 18:57:00');
INSERT INTO `progress` VALUES (195, 0, '混合粘度计算模型', 56, 194, NULL, '混合粘度计算模型.zip', 151, '2019-04-12 19:01:00');
INSERT INTO `progress` VALUES (196, 0, '反相模型', 56, 195, NULL, '反相模型.zip', 151, '2019-04-12 19:19:00');
INSERT INTO `progress` VALUES (197, 0, '摩擦因子模型', 56, 196, NULL, 'Frictor.zip', 151, '2019-04-12 19:21:00');
INSERT INTO `progress` VALUES (198, 0, '混合粘度文献汇集', 56, 197, NULL, '混合粘度文献汇集.zip', 151, '2019-04-12 19:24:00');
INSERT INTO `progress` VALUES (199, 0, '摩擦因子文献汇集', 56, 198, NULL, '摩擦因子文献汇集.zip', 151, '2019-04-12 19:25:00');

SET FOREIGN_KEY_CHECKS = 1;
