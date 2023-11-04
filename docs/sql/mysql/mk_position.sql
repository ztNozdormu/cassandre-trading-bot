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

 Date: 20/09/2023 17:52:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `POSITION_ID` bigint(0) NULL DEFAULT NULL,
  `position_type` tinyint(0) NULL DEFAULT NULL COMMENT ' Position type - Short or Long.参考枚举:PositionTypeDTO',
  `strategy_id` bigint(0) NULL DEFAULT NULL COMMENT 'The strategy that created the position.',
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'The currency-pair.',
  `base_currency_precision` int(0) NULL DEFAULT NULL COMMENT 'Base currency precision (First part of the currency pair). ',
  `quote_currency_precision` int(0) NULL DEFAULT NULL COMMENT 'Quote currency precision (Second part of the currency pair).',
  `cumulative_amount_value` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Amount value',
  `cumulative_amount_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Amount currency',
  `rules_stop_gain_percentage` float(255, 0) NULL DEFAULT NULL COMMENT 'Position rules - stop loss percentage.',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Position status.参考枚举PositionStatusDTO',
  `auto_close` tinyint(0) NULL DEFAULT NULL COMMENT '0:false 1:true',
  `force_closing` tinyint(0) NULL DEFAULT NULL COMMENT '0:false 1:true',
  `opening_order_id` bigint(0) NULL DEFAULT NULL COMMENT 'The order created to open the position. ',
  `closing_order_id` bigint(0) NULL DEFAULT NULL COMMENT 'The order created to close the position.',
  `lowest_gain_price_value` decimal(16, 8) NULL DEFAULT NULL COMMENT ' Price of the lowest gain reached by this position.',
  `highest_gain_price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT ' Price of the lowest gain reached by this position.',
  `latest_gain_price_value` decimal(16, 8) NULL DEFAULT NULL COMMENT ' Price of the latest gain price for this position.',
  `latest_gain_price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT ' Price of the latest gain price for this position.',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of positions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
