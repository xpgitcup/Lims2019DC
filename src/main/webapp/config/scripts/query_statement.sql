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

 Date: 16/04/2019 19:06:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for query_statement
-- ----------------------------
DROP TABLE IF EXISTS `query_statement`;
CREATE TABLE `query_statement`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `params_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hql` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `issql` bit(1) NULL DEFAULT NULL,
  `need_to_query` bit(1) NOT NULL,
  `key_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_iejb2adhrl11w1nanxv8r9hql`(`key_string`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_statement
-- ----------------------------
INSERT INTO `query_statement` VALUES (1, 0, NULL, 'select count(*) from QueryStatement queryStatement', b'0', b'1', 'count.operation4QueryStatement.查询配置', NULL);
INSERT INTO `query_statement` VALUES (2, 0, NULL, 'from QueryStatement queryStatement order by keyString', b'0', b'1', 'list.operation4QueryStatement.查询配置', 'listQueryStatement');
INSERT INTO `query_statement` VALUES (3, 0, NULL, 'select count(*) from SystemAttribute systemAttribute where upAttribute is null', b'0', b'1', 'count.operation4SystemAttribute.系统属性', NULL);
INSERT INTO `query_statement` VALUES (4, 0, NULL, 'from SystemAttribute systemAttribute where upAttribute is null', b'0', b'1', 'list.operation4SystemAttribute.系统属性', 'listSystemAttribute');
INSERT INTO `query_statement` VALUES (5, 0, NULL, 'select count(*) from SystemUser systemUser', b'0', b'1', 'count.operation4SystemUser.系统用户', NULL);
INSERT INTO `query_statement` VALUES (6, 0, NULL, 'from SystemUser systemUser', b'0', b'1', 'list.operation4SystemUser.系统用户', 'listSystemUser');
INSERT INTO `query_statement` VALUES (7, 0, NULL, 'select count(*) from SystemMenu systemMenu where upMenuItem is null', b'0', b'1', 'count.operation4SystemMenu.系统菜单', NULL);
INSERT INTO `query_statement` VALUES (8, 0, NULL, 'from SystemMenu systemMenu where upMenuItem is null', b'0', b'1', 'list.operation4SystemMenu.系统菜单', 'listSystemMenu');
INSERT INTO `query_statement` VALUES (9, 0, NULL, 'select count(*) from SystemLog systemLog', b'0', b'1', 'count.operation4SystemLog.系统日志', NULL);
INSERT INTO `query_statement` VALUES (10, 0, NULL, 'from SystemLog systemLog', b'0', b'1', 'list.operation4SystemLog.系统日志', 'listSystemLog');
INSERT INTO `query_statement` VALUES (11, 0, NULL, 'from Teacher teacher', b'0', b'1', 'list.operation4Person.教师', 'listTeacher');
INSERT INTO `query_statement` VALUES (12, 0, NULL, 'from Student student order by personTitle, supervisor, gradeName,  major, code', b'0', b'1', 'list.operation4Person.学生', 'listStudent');
INSERT INTO `query_statement` VALUES (13, 0, NULL, 'from Major major order by name', b'0', b'1', 'list.operation4Person.专业', 'listMajor');
INSERT INTO `query_statement` VALUES (14, 0, NULL, 'select count(*) from Teacher teacher', b'0', b'1', 'count.operation4Person.教师', NULL);
INSERT INTO `query_statement` VALUES (15, 0, NULL, 'select count(*) from Student student', b'0', b'1', 'count.operation4Person.学生', NULL);
INSERT INTO `query_statement` VALUES (16, 0, NULL, 'select count(*) from Major major', b'0', b'1', 'count.operation4Person.专业', NULL);
INSERT INTO `query_statement` VALUES (17, 0, NULL, 'select count(*) from ThingType thingType where upType is null', b'0', b'1', 'count.operation4ThingType.项目类型', NULL);
INSERT INTO `query_statement` VALUES (18, 0, NULL, 'select count(*) from PersonTitle personTitle where upTitle is null', b'0', b'1', 'count.operation4PersonTitle.人员类型', NULL);
INSERT INTO `query_statement` VALUES (19, 0, NULL, 'from Project project order by name', b'0', b'1', 'list.operation4Thing.科研', 'listProject');
INSERT INTO `query_statement` VALUES (20, 0, NULL, 'select count(*) from Project project', b'0', b'1', 'count.operation4Thing.科研', NULL);
INSERT INTO `query_statement` VALUES (21, 0, NULL, 'from Course course order by name', b'0', b'1', 'list.operation4Thing.教学', 'listCourse');
INSERT INTO `query_statement` VALUES (22, 0, NULL, 'select count(*) from Course course', b'0', b'1', 'count.operation4Thing.教学', NULL);
INSERT INTO `query_statement` VALUES (23, 0, NULL, 'select count(*) from ThingTypeCircle thingTypeCircle', b'0', b'1', 'count.operation4ThingTypeCircle.任务分配', NULL);
INSERT INTO `query_statement` VALUES (24, 0, NULL, 'from ThingTypeCircle thingTypeCircle order by thingType', b'0', b'1', 'list.operation4ThingTypeCircle.任务分配', 'listThingTypeCircle');
INSERT INTO `query_statement` VALUES (25, 0, 'thingTypeList', 'from Thing thing where thing.thingType in :thingTypeList', b'0', b'1', 'list.operation4Team.可选题目.thingTypeList', 'listThing');
INSERT INTO `query_statement` VALUES (26, 0, 'thingTypeList', 'select count(*) from Thing thing where thing.thingType in :thingTypeList', b'0', b'1', 'count.operation4Team.可选题目.thingTypeList', NULL);
INSERT INTO `query_statement` VALUES (27, 0, NULL, 'select count(*) from QueryStatement queryStatement where queryStatement.hql is null', b'0', b'1', 'count.operation4QueryStatement.filter.查询配置', NULL);
INSERT INTO `query_statement` VALUES (30, 0, 'currentThing', 'select count(*) from Team team where team.thing=:currentThing', b'0', b'1', 'count.operation4Team.currentThing.相关团队', NULL);
INSERT INTO `query_statement` VALUES (31, 0, 'myself', 'from Team team where team.leader=:myself', b'0', b'1', 'list.operation4Progress.我领导的.myself', 'listTeam');
INSERT INTO `query_statement` VALUES (32, 0, 'myself', 'select count(*) from Team team where team.leader=:myself', b'0', b'1', 'count.operation4Progress.我领导的.myself', 'listTeam');
INSERT INTO `query_statement` VALUES (33, 0, 'myself', 'select team_members_id  from team_person where person_id=:myself', b'1', b'1', 'list.operation4Progress.我参与的.myself', 'listTeam');
INSERT INTO `query_statement` VALUES (34, 0, 'myself', 'select count(*) from team_person where person_id=:myself', b'1', b'1', 'count.operation4Progress.我参与的.myself', NULL);
INSERT INTO `query_statement` VALUES (35, 0, 'currentTeam', 'from Progress progress where progress.team=:currentTeam order by progress.regDate desc', b'0', b'1', 'list.operation4Progress.currentTeam.进度查看', 'listProgress');
INSERT INTO `query_statement` VALUES (36, 0, 'currentTeam', 'select count(*) from Progress progress where progress.team=:currentTeam', b'0', b'1', 'count.operation4Progress.currentTeam.进度查看', 'listProgress');
INSERT INTO `query_statement` VALUES (37, 0, 'currentProgress', 'from Evaluate evaluate where evaluate.progress=:currentProgress', b'0', b'1', 'list.operation4Progress.currentProgress.反馈信息', 'listEvaluate');
INSERT INTO `query_statement` VALUES (38, 0, NULL, 'from QueryStatement queryStatement where queryStatement.hql is null  order by keyString', b'0', b'1', 'list.operation4QueryStatement.filter.查询配置', 'listQueryStatement');
INSERT INTO `query_statement` VALUES (39, 0, 'currentThing', 'from Team team where team.thing=:currentThing', b'0', b'1', 'list.operation4Team.currentThing.相关团队', 'listTeam');
INSERT INTO `query_statement` VALUES (40, 0, NULL, 'SELECT DISTINCT person.grade_name FROM person WHERE person.grade_name IS NOT NULL limit %d,%d', b'1', b'1', 'list.operation4Person.年级', 'listGradeName');
INSERT INTO `query_statement` VALUES (41, 0, 'thingTypeList', 'from Team team where team.thing in :thingTypeList order by team.thing', b'0', b'1', 'list.operation4Progress.我管理的.thingTypeList', 'listTeam');
INSERT INTO `query_statement` VALUES (42, 0, 'thingTypeList', 'select count(*) from Team team where team.thing in :thingTypeList', b'0', b'1', 'count.operation4Progress.我管理的.thingTypeList', NULL);
INSERT INTO `query_statement` VALUES (43, 0, NULL, NULL, b'0', b'0', 'list.operation4Team.队员列表', NULL);
INSERT INTO `query_statement` VALUES (44, 0, NULL, NULL, b'0', b'0', 'list.operation4Team.currentTeam.队员列表', NULL);
INSERT INTO `query_statement` VALUES (45, 0, 'keyString', 'select count(*) from QueryStatement queryStatement where queryStatement.keyString like :keyString', b'0', b'1', 'count.operation4QueryStatement.查询配置.keyString', NULL);
INSERT INTO `query_statement` VALUES (46, 0, 'keyString', 'from QueryStatement queryStatement where queryStatement.keyString like :keyString', b'0', b'1', 'list.operation4QueryStatement.查询配置.keyString', 'listQueryStatement');
INSERT INTO `query_statement` VALUES (47, 0, 'thingTypeId', 'from Plan plan  where plan.thingType.id=cast(:thingTypeId as integer) order by updateDate desc', b'0', b'1', 'list.operation4Plan.通用计划.thingTypeId', 'listPlan');
INSERT INTO `query_statement` VALUES (48, 0, 'currentProgress', 'select count(*) from Evaluate evaluate where evaluate.progress=:currentProgress', b'0', b'1', 'count.operation4Progress.currentProgress.反馈信息', NULL);
INSERT INTO `query_statement` VALUES (49, 0, NULL, 'SELECT Count(DISTINCT person.grade_name) FROM person WHERE person.grade_name IS NOT NULL', b'1', b'1', 'count.operation4Person.年级', NULL);
INSERT INTO `query_statement` VALUES (50, 0, 'thingTypeList', 'from Team team where team.thing in :thingTypeList order by team.thing', b'0', b'1', 'list.operation4ProjectPlan.进度归档.myself', 'listTeam');
INSERT INTO `query_statement` VALUES (51, 0, 'thingTypeList', 'select count(*) from Team team where team.thing in :thingTypeList', b'0', b'1', 'count.operation4ProjectPlan.进度归档.thingTypeList', NULL);
INSERT INTO `query_statement` VALUES (52, 0, 'thingTypeList', 'from Team team where team.thing in :thingTypeList order by team.thing', b'0', b'1', 'list.operation4ProjectPlan.进度归档.thingTypeList', 'listTeam');
INSERT INTO `query_statement` VALUES (53, 0, 'currentTeam', 'from Progress progress where progress.team=:currentTeam order by progress.regDate desc', b'0', b'1', 'list.operation4ProjectPlan.currentTeam.进度列表', 'listProgress');
INSERT INTO `query_statement` VALUES (54, 0, 'currentTeam', 'select count(*) from Progress progress where progress.team=:currentTeam', b'0', b'1', 'count.operation4ProjectPlan.currentTeam.进度列表', NULL);
INSERT INTO `query_statement` VALUES (55, 1, 'thingTypeList', 'from Thing thing where thing.thingType in :thingTypeList', b'0', b'1', 'index.Operation4Team.currentTask.可选题目.thingTypeList', 'listThing');
INSERT INTO `query_statement` VALUES (56, 1, 'thingTypeList', 'from Thing thing where thing.thingType in :thingTypeList', b'0', b'1', 'list.Operation4Team.currentTask.可选题目.thingTypeList', 'listTeam');
INSERT INTO `query_statement` VALUES (57, 1, 'thingTypeList', 'select count(*) from Thing thing where thing.thingType in :thingTypeList', b'0', b'1', 'count.Operation4Team.currentTask.可选题目.thingTypeList', NULL);
INSERT INTO `query_statement` VALUES (58, 0, 'thingTypeId', 'select count(*) from Plan plan where plan.thingType.id=cast(:thingTypeId as integer)', b'0', b'1', 'count.operation4Plan.通用计划.thingTypeId', NULL);
INSERT INTO `query_statement` VALUES (59, 0, 'thingTypeList', 'select count(*) from Team team where team.thing in :thingTypeList', b'0', b'1', 'count.operation4ProjectPlan.进度归档.myself', NULL);
INSERT INTO `query_statement` VALUES (60, 1, 'thingTypeList,myself', 'from Team team where team.thing.thingType in :thingTypeList and team.leader=:myself', b'0', b'1', 'list.operation4Team.我领导的.myself.thingTypeList', 'listTeamRight');
INSERT INTO `query_statement` VALUES (61, 2, 'thingTypeList,myself', 'select count(*) from Team team where team.leader=:myself and team.thing.thingType in :thingTypeList', b'0', b'1', 'count.operation4Team.我领导的.myself.thingTypeList', NULL);
INSERT INTO `query_statement` VALUES (62, 7, 'myself,thingTypeList', 'SELECT\r\nteam_person.team_members_id\r\nFROM\r\nteam_person\r\nINNER JOIN team ON team_person.team_members_id = team.id\r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE\r\nteam_person.person_id=:myself AND\r\nthing.thing_type_id IN (:thingTypeList)', b'1', b'1', 'list.operation4Team.我参与的.myself.thingTypeList', 'listTeamRight');
INSERT INTO `query_statement` VALUES (63, 9, 'myself,thingTypeList', 'SELECT\r\ncount(*)\r\nFROM\r\nteam_person\r\nINNER JOIN team ON team_person.team_members_id = team.id\r\nINNER JOIN thing ON team.thing_id = thing.id\r\nINNER JOIN thing_type ON thing.thing_type_id = thing_type.id\r\nWHERE\r\nteam_person.person_id=:myself  AND\r\nthing.thing_type_id IN (:thingTypeList)', b'1', b'1', 'count.operation4Team.我参与的.myself.thingTypeList', NULL);
INSERT INTO `query_statement` VALUES (64, 0, NULL, NULL, b'0', b'1', 'count.operation4Team.currentTeam.队员列表', NULL);

SET FOREIGN_KEY_CHECKS = 1;
