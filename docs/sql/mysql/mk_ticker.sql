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

 Date: 18/09/2023 17:33:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for imported_tickers
-- ----------------------------
DROP TABLE IF EXISTS `imported_tickers`;
CREATE TABLE `imported_tickers`  (
  `id` bigint(0) NOT NULL,
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `open` decimal(16, 8) NULL DEFAULT NULL,
  `last` decimal(16, 8) NULL DEFAULT NULL,
  `bid` decimal(16, 8) NULL DEFAULT NULL,
  `ask` decimal(16, 8) NULL DEFAULT NULL,
  `high` decimal(16, 8) NULL DEFAULT NULL,
  `low` decimal(16, 8) NULL DEFAULT NULL,
  `vwap` decimal(16, 8) NULL DEFAULT NULL,
  `volume` decimal(16, 8) NULL DEFAULT NULL,
  `quote_volume` decimal(16, 8) NULL DEFAULT NULL,
  `bid_size` decimal(16, 8) NULL DEFAULT NULL,
  `ask_size` decimal(16, 8) NULL DEFAULT NULL,
  `timestamp` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imported_tickers
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
