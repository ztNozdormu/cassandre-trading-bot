/*
 Navicat Premium Data Transfer

 Source Server         : 100-dev
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 192.168.1.100:3306
 Source Schema         : cassandre-database

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 24/11/2023 15:37:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for backtesting_candles
-- ----------------------------
DROP TABLE IF EXISTS `backtesting_candles`;
CREATE TABLE `backtesting_candles`  (
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `response_sequence_id` bigint(0) NOT NULL,
  `test_session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `close` decimal(16, 8) NULL DEFAULT NULL,
  `high` decimal(16, 8) NULL DEFAULT NULL,
  `low` decimal(16, 8) NULL DEFAULT NULL,
  `open` decimal(16, 8) NULL DEFAULT NULL,
  `timestamp` datetime(0) NULL DEFAULT NULL,
  `volume` decimal(16, 8) NULL DEFAULT NULL,
  PRIMARY KEY (`currency_pair`, `response_sequence_id`, `test_session_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of backtesting_candles
-- ----------------------------
INSERT INTO `backtesting_candles` VALUES ('BTC/USDT', 1, '50f7996a-b37c-44bf-94cb-7fa397e1535e', 10000.00000000, 10000.00000000, 10000.00000000, 10000.00000000, '2017-10-19 08:00:00', 10000.00000000);
INSERT INTO `backtesting_candles` VALUES ('BTC/USDT', 2, '50f7996a-b37c-44bf-94cb-7fa397e1535e', 20000.00000000, 20000.00000000, 20000.00000000, 20000.00000000, '2017-10-20 08:00:00', 20000.00000000);
INSERT INTO `backtesting_candles` VALUES ('BTC/USDT', 3, '50f7996a-b37c-44bf-94cb-7fa397e1535e', 50000.00000000, 50000.00000000, 50000.00000000, 50000.00000000, '2017-10-24 08:00:00', 50000.00000000);
INSERT INTO `backtesting_candles` VALUES ('BTC/USDT', 4, '50f7996a-b37c-44bf-94cb-7fa397e1535e', 30000.00000000, 30000.00000000, 30000.00000000, 30000.00000000, '2017-10-24 08:00:01', 30000.00000000);
INSERT INTO `backtesting_candles` VALUES ('BTC/USDT', 5, '50f7996a-b37c-44bf-94cb-7fa397e1535e', 40000.00000000, 40000.00000000, 40000.00000000, 40000.00000000, '2017-10-24 08:00:02', 40000.00000000);
INSERT INTO `backtesting_candles` VALUES ('BTC/USDT', 6, '50f7996a-b37c-44bf-94cb-7fa397e1535e', 70000.00000000, 70000.00000000, 70000.00000000, 70000.00000000, '2017-10-24 08:00:03', 70000.00000000);
INSERT INTO `backtesting_candles` VALUES ('BTC/USDT', 7, '50f7996a-b37c-44bf-94cb-7fa397e1535e', 25000.00000000, 25000.00000000, 25000.00000000, 25000.00000000, '2017-10-24 08:00:04', 25000.00000000);

-- ----------------------------
-- Table structure for imported_candles
-- ----------------------------
DROP TABLE IF EXISTS `imported_candles`;
CREATE TABLE `imported_candles`  (
  `uid` bigint(0) NOT NULL,
  `close` decimal(16, 8) NULL DEFAULT NULL,
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `high` decimal(16, 8) NULL DEFAULT NULL,
  `low` decimal(16, 8) NULL DEFAULT NULL,
  `open` decimal(16, 8) NULL DEFAULT NULL,
  `timestamp` datetime(0) NULL DEFAULT NULL,
  `volume` decimal(16, 8) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imported_candles
-- ----------------------------

-- ----------------------------
-- Table structure for imported_tickers
-- ----------------------------
DROP TABLE IF EXISTS `imported_tickers`;
CREATE TABLE `imported_tickers`  (
  `uid` bigint(0) NOT NULL,
  `ask` decimal(16, 8) NULL DEFAULT NULL,
  `ask_size` decimal(16, 8) NULL DEFAULT NULL,
  `bid` decimal(16, 8) NULL DEFAULT NULL,
  `bid_size` decimal(16, 8) NULL DEFAULT NULL,
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `high` decimal(16, 8) NULL DEFAULT NULL,
  `last` decimal(16, 8) NULL DEFAULT NULL,
  `low` decimal(16, 8) NULL DEFAULT NULL,
  `open` decimal(16, 8) NULL DEFAULT NULL,
  `quote_volume` decimal(16, 8) NULL DEFAULT NULL,
  `timestamp` datetime(0) NULL DEFAULT NULL,
  `volume` decimal(16, 8) NULL DEFAULT NULL,
  `vwap` decimal(16, 8) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imported_tickers
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `uid` bigint(0) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(0) NOT NULL,
  `updated_on` datetime(0) NOT NULL,
  `amount_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount_value` decimal(19, 2) NULL DEFAULT NULL,
  `average_price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `average_price_value` decimal(19, 2) NULL DEFAULT NULL,
  `cumulative_amount_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cumulative_amount_value` decimal(19, 2) NULL DEFAULT NULL,
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `leverage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `limit_price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `limit_price_value` decimal(19, 2) NULL DEFAULT NULL,
  `market_price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `market_price_value` decimal(19, 2) NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `timestamp` datetime(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fk_strategy_uid` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `FK3r8g8milikxgjuaqxddgt7hwd`(`fk_strategy_uid`) USING BTREE,
  CONSTRAINT `FK3r8g8milikxgjuaqxddgt7hwd` FOREIGN KEY (`fk_strategy_uid`) REFERENCES `strategies` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions`  (
  `uid` bigint(0) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(0) NOT NULL,
  `updated_on` datetime(0) NOT NULL,
  `amount_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount_value` decimal(19, 2) NULL DEFAULT NULL,
  `auto_close` bit(1) NULL DEFAULT NULL,
  `base_currency_precision` int(0) NULL DEFAULT NULL,
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `force_closing` bit(1) NULL DEFAULT NULL,
  `highest_gain_price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `highest_gain_price_value` decimal(19, 2) NULL DEFAULT NULL,
  `latest_gain_price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `latest_gain_price_value` decimal(19, 2) NULL DEFAULT NULL,
  `lowest_gain_price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lowest_gain_price_value` decimal(19, 2) NULL DEFAULT NULL,
  `position_id` bigint(0) NULL DEFAULT NULL,
  `quote_currency_precision` int(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rules_stop_gain_percentage` float NULL DEFAULT NULL,
  `rules_stop_loss_percentage` float NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fk_closing_order_uid` bigint(0) NULL DEFAULT NULL,
  `fk_opening_order_uid` bigint(0) NULL DEFAULT NULL,
  `fk_strategy_uid` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `FK475a7l983ourf2y5xmtf4skcl`(`fk_closing_order_uid`) USING BTREE,
  INDEX `FKns3ehwhayatetm98x050crn4l`(`fk_opening_order_uid`) USING BTREE,
  INDEX `FKscxw9krnka029m6hb0hkmysq6`(`fk_strategy_uid`) USING BTREE,
  CONSTRAINT `FK475a7l983ourf2y5xmtf4skcl` FOREIGN KEY (`fk_closing_order_uid`) REFERENCES `orders` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKns3ehwhayatetm98x050crn4l` FOREIGN KEY (`fk_opening_order_uid`) REFERENCES `orders` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKscxw9krnka029m6hb0hkmysq6` FOREIGN KEY (`fk_strategy_uid`) REFERENCES `strategies` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of positions
-- ----------------------------

-- ----------------------------
-- Table structure for strategies
-- ----------------------------
DROP TABLE IF EXISTS `strategies`;
CREATE TABLE `strategies`  (
  `uid` bigint(0) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_on` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `strategy_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategies
-- ----------------------------
INSERT INTO `strategies` VALUES (1, '2023-11-21 17:34:56', '2023-11-21 17:34:56', 'Simple strategy', '1');

-- ----------------------------
-- Table structure for trades
-- ----------------------------
DROP TABLE IF EXISTS `trades`;
CREATE TABLE `trades`  (
  `uid` bigint(0) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(0) NOT NULL,
  `updated_on` datetime(0) NOT NULL,
  `amount_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount_value` decimal(19, 2) NULL DEFAULT NULL,
  `currency_pair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fee_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fee_value` decimal(19, 2) NULL DEFAULT NULL,
  `price_currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price_value` decimal(19, 2) NULL DEFAULT NULL,
  `timestamp` datetime(0) NULL DEFAULT NULL,
  `trade_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fk_order_uid` bigint(0) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `FKf8gd5mulff2golpl53yw5l519`(`fk_order_uid`) USING BTREE,
  CONSTRAINT `FKf8gd5mulff2golpl53yw5l519` FOREIGN KEY (`fk_order_uid`) REFERENCES `orders` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trades
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
