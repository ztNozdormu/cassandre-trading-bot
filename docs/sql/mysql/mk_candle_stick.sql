/*
 Navicat Premium Data Transfer

 Source Server         : 100
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 192.168.1.100:33060
 Source Schema         : pacs

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 18/09/2023 17:33:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for imported_candles
-- ----------------------------
DROP TABLE IF EXISTS `imported_candles`;
CREATE TABLE `imported_candles`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易对',
  `open` decimal(16, 8) NOT NULL,
  `high` decimal(16, 8) NULL DEFAULT NULL,
  `low` decimal(16, 8) NULL DEFAULT NULL,
  `close` decimal(16, 8) NULL DEFAULT NULL,
  `volume` decimal(16, 8) NULL DEFAULT NULL,
  `timestamp` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imported_candles
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
