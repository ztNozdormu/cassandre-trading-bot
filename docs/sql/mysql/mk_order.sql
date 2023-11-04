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

 Date: 20/09/2023 17:52:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `strategy_id` bigint(0) NULL DEFAULT NULL,
  `order_type` tinyint(0) NULL DEFAULT NULL COMMENT '   /** Buying. */\r\n    BID,\r\n\r\n    /** Selling. */\r\n    ASK',
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cumulative_amount_value` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Amount value',
  `cumulative_amount_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Amount currency',
  `user_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'An identifier provided by the user on placement that uniquely identifies the order.',
  `timestamp` datetime(0) NULL DEFAULT NULL COMMENT ' The timestamp of the order.',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
