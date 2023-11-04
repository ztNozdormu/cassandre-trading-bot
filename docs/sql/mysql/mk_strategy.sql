/*
 Navicat Premium Data Transfer

 Source Server         : 100-dev
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 192.168.1.100:3306
 Source Schema         : pacsdb

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 21/09/2023 10:39:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT ' Technical ID.',
  `strategy_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT ' An identifier that uniquely identifies the strategy - Comes from the Java annotation. ',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Strategy name - Comes from the Java annotation.',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
