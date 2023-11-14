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
-- Table structure for imported_candles Table used to store imported candles
-- ----------------------------
DROP TABLE IF EXISTS `IMPORTED_CANDLES`;
CREATE TABLE `IMPORTED_CANDLES`  (
  `UID` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Technical ID',
  `CURRENCY_PAIR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Defines the currency pair',
  `OPEN` decimal(16, 8) NOT NULL COMMENT 'Opening price (first trade) in the bucket interval',
  `HIGH` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Highest price during the bucket interval',
  `LOW` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Lowest price during the bucket interval',
  `CLOSE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Closing price (last trade) in the bucket interval',
  `VOLUME` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Volume of trading activity during the bucket interval',
  `TIMESTAMP` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'Bucket start time',
  PRIMARY KEY (`UID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- 创建索引  Index on IMPORTED_CANDLES (CURRENCY_PAIR/TIMESTAMP)
-- ----------------------------
CREATE INDEX IDX_IMPORTED_CANDLES_CURRENCY_PAIR_AND_TIMESTAMP  ON `IMPORTED_CANDLES` (`CURRENCY_PAIR`,`TIMESTAMP`)


SET FOREIGN_KEY_CHECKS = 1;


-- ------------------------------
-- Table structure for BACKTESTING_CANDLES Table used to store candles for backtesting
-- ----------------------------
DROP TABLE IF EXISTS `BACKTESTING_CANDLES`;
CREATE TABLE `BACKTESTING_CANDLES`  (
                                        `TEST_SESSION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT 'Test session id.',
                                        `RESPONSE_SEQUENCE_ID` bigint(0)  NOT NULL COMMENT 'Response sequence id.',
                                        `CURRENCY_PAIR` varchar(255)   CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Currency pair. ',
                                        `OPEN` decimal(16, 8) NOT NULL COMMENT 'Opening price (first trade) in the bucket interval',
                                        `HIGH` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Highest price during the bucket interval',
                                        `LOW` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Lowest price during the bucket interval',
                                        `CLOSE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Closing price (last trade) in the bucket interval',
                                        `VOLUME` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Volume of trading activity during the bucket interval',
                                        `TIMESTAMP` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'Bucket start time',
                                        PRIMARY KEY (`TEST_SESSION_ID`,`RESPONSE_SEQUENCE_ID`,`CURRENCY_PAIR`) USING BTREE,
                                        INDEX IDX_BACKTESTING_CANDLES_RESPONSE_SEQUENCE_ID (`TEST_SESSION_ID`,,`RESPONSE_SEQUENCE_ID`)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
-- ----------------------------
-- 创建索引
-- ----------------------------
CREATE INDEX IDX_BACKTESTING_CANDLES_RESPONSE_SEQUENCE_ID  ON `BACKTESTING_CANDLES` (`TEST_SESSION_ID`,`RESPONSE_SEQUENCE_ID`)