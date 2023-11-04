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

 Date: 21/09/2023 10:39:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Technical ID',
  `trade_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'An identifier set by the exchange that uniquely identifies the trade.',
  `order_type` tinyint(0) NULL DEFAULT NULL COMMENT 'Trade type i.e. bid (buy) or ask (sell). 参考OrderTypeDTO枚举',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT 'The order responsible for this trade.',
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT ' Currency pair.',
  `user_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'userReference',
  `timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'The timestamp of the trade.',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
