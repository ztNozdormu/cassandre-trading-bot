-- =====================================================================================================================
-- create database.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE DATABASE `cassandre-database`  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- =====================================================================================================================
-- create STRATEGIES.
-- ----------------------------
-- Table structure for strategy
-- ----------------------------

DROP TABLE IF EXISTS `STRATEGIES`;
CREATE TABLE `STRATEGIES`  (
 `UID` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT ' Technical ID.',
 `STRATEGY_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT ' An identifier that uniquely identifies the strategy - Comes from the Java annotation. ',
 `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Strategy name - Comes from the Java annotation.',
 `CREATED_ON` datetime(0) NULL DEFAULT NULL COMMENT 'Data created on.',
 `UPDATED_ON` datetime(0) NULL DEFAULT NULL COMMENT 'Data updated on. ',
  PRIMARY KEY (`UID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;
-- Insert strategies.
INSERT INTO STRATEGIES (UID, STRATEGY_ID, NAME,CREATED_ON,UPDATED_ON)
VALUES (1, '01', 'My strategy',now(),now());

-- =====================================================================================================================
-- create ORDERS.
-- ----------------------------
-- Table structure for ORDERS
-- ----------------------------
DROP TABLE IF EXISTS `ORDERS`;
CREATE TABLE `ORDERS`  (
                          `UID` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Technical ID.',
                          `ORDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'An identifier set by the exchange that uniquely identifies the order.',
                          `TYPE` varchar(255) NULL DEFAULT NULL COMMENT ' Order type i.e. bid (buy) or ask (sell).',
                          `FK_STRATEGY_UID` bigint(0) NULL DEFAULT NULL COMMENT 'The strategy that created the order.',
                          `CURRENCY_PAIR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Currency pair. ',
                          `AMOUNT_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Amount value',
                          `AMOUNT_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Amount currency',
                          `AVERAGE_PRICE_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Weighted Average price of the fills in the order.',
                          `AVERAGE_PRICE_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Weighted Average price of the fills in the order.',
                          `LIMIT_PRICE_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Limit price.',
                          `LIMIT_PRICE_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Limit price. ',
                          `MARKET_PRICE_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Market price - The price Cassandre had when the order was created.',
                          `MARKET_PRICE_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Market price - The price Cassandre had when the order was created.',
                          `LEVERAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'The leverage to use for margin related to this order. ',
                          `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Order status. ',
                          `CUMULATIVE_AMOUNT_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Amount to be ordered/amount that has been matched against order on the order book/filled.',
                          `CUMULATIVE_AMOUNT_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Amount to be ordered/amount that has been matched against order on the order book/filled.',
                          `USER_REFERENCE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'An identifier provided by the user on placement that uniquely identifies the order.',
                          `TIMESTAMP` datetime(0) NULL DEFAULT NULL COMMENT 'The timestamp of the order.',
                          `CREATED_ON` datetime(0) NULL DEFAULT NULL COMMENT 'Data created on.',
                          `UPDATED_ON` datetime(0) NULL DEFAULT NULL COMMENT 'Data updated on. ',
                          PRIMARY KEY (`UID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- Insert orders.
INSERT INTO ORDERS (UID, ORDER_ID, TYPE, AMOUNT_VALUE, AMOUNT_CURRENCY, CURRENCY_PAIR, USER_REFERENCE, TIMESTAMP, STATUS,
                    CUMULATIVE_AMOUNT_VALUE, CUMULATIVE_AMOUNT_CURRENCY, AVERAGE_PRICE_VALUE, AVERAGE_PRICE_CURRENCY,
                    LEVERAGE, LIMIT_PRICE_VALUE, LIMIT_PRICE_CURRENCY, MARKET_PRICE_VALUE, MARKET_PRICE_CURRENCY, FK_STRATEGY_UID,CREATED_ON,UPDATED_ON)
VALUES -- Order BACKUP_ORDER_01 (useless).
       (1, 'BACKUP_ORDER_01', 'ASK', 0.000005, 'ETH', 'ETH/BTC', 'My reference 1', '2020-11-18', 'NEW', 0.000004, 'ETH',
        0.000003, 'BTC', 'LEVERAGE_1', 0.000001, 'BTC', 0.000033, 'KCS', 1,now(),now()),

       -- Order BACKUP_ORDER_02 (useless).
       (2, 'BACKUP_ORDER_02', 'BID', 0.000015, 'USDT', 'USDT/BTC', 'My reference 2', '2020-11-19', 'PENDING_NEW',
        0.000014, 'USDT', 0.000013, 'BTC', 'LEVERAGE_2', 0.000011, 'BTC', 0.000003, 'BTC', 1,now(),now()),

       -- For position 1 (OPENING).
       (3, 'BACKUP_OPENING_ORDER_01', 'BID', 10, 'BTC', 'BTC/USDT', '', '2020-11-20', 'NEW', 10, 'BTC', 1, 'USDT', '',
        1, 'USDT', 0.000003, 'BTC', 1,now(),now()),

       -- For position 2 (OPENED).
       (4, 'BACKUP_OPENING_ORDER_02', 'BID', 20, 'BTC', 'BTC/USDT', '', '2020-11-20', 'FILLED', 20, 'BTC', 1, 'USDT',
        '', 1, 'USDT', 0.000003, 'BTC', 1,now(),now()),

       -- For position 3 (CLOSING).
       (5, 'BACKUP_OPENING_ORDER_03', 'BID', 30, 'BTC', 'BTC/USDT', '', '2020-11-20', 'FILLED', 30, 'BTC', 1, 'USDT',
        '', 1, 'USDT', 0.000003, 'BTC', 1,now(),now()),
       (6, 'BACKUP_CLOSING_ORDER_01', 'ASK', 30, 'BTC', 'BTC/USDT', '', '2020-11-20', 'NEW', 30, 'BTC', 1, 'USDT', 1, 1,
        'USDT', 0.000003, 'BTC', 1,now(),now()),

       -- For position 4 (CLOSED).
       (7, 'BACKUP_OPENING_ORDER_04', 'BID', 40, 'BTC', 'BTC/USDT', '', '2020-11-20', 'FILLED', 40, 'BTC', 1, 'USDT',
        '', 1, 'USDT', 0.000003, 'BTC', 1,now(),now()),
       (8, 'BACKUP_CLOSING_ORDER_02', 'ASK', 40, 'BTC', 'BTC/USDT', '', '2020-11-20', 'FILLED', 40, 'BTC', 1, 'USDT',
        '', 1, 'USDT', 0.000003, 'BTC', 1,now(),now()),

       -- For position 4 (CLOSED).
       (9, 'BACKUP_OPENING_ORDER_05', 'BID', 50, 'ETH', 'ETH/USD', '', '2020-11-20', 'FILLED', 50, 'ETH', 1, 'ETH', '',
        1, 'USDT', 0.000003, 'BTC', 1,now(),now()),
       (10, 'BACKUP_CLOSING_ORDER_03', 'ASK', 50, 'ETH', 'ETH/USD', '', '2020-11-20', 'FILLED', 50, 'ETH', 1, 'ETH', '',
        1, 'USDT', 0.000003, 'BTC', 1,now(),now());

-- =====================================================================================================================
-- ----------------------------
-- Table structure for POSITIONS
-- ----------------------------
DROP TABLE IF EXISTS `POSITIONS`;
CREATE TABLE `POSITIONS`  (
                            `UID` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Technical ID.',
                            `POSITION_ID` bigint(0) NULL DEFAULT NULL COMMENT 'An identifier that uniquely identifies the position for a strategy.',
                            `TYPE` varchar(255) NULL DEFAULT NULL COMMENT 'Position type - Short or Long.',
                            `FK_STRATEGY_UID` bigint(0) NULL DEFAULT NULL COMMENT 'The strategy that created the position.',
                            `CURRENCY_PAIR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'The currency-pair.',
                            `BASE_CURRENCY_PRECISION` int(0) NULL DEFAULT NULL COMMENT 'Base currency precision (First part of the currency pair). ',
                            `QUOTE_CURRENCY_PRECISION` int(0) NULL DEFAULT NULL COMMENT 'Quote currency precision (Second part of the currency pair).',
                            `AMOUNT_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Amount that was ordered.',
                            `AMOUNT_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Amount that was ordered.',
                            `RULES_STOP_GAIN_PERCENTAGE` float(255, 0) NULL DEFAULT NULL COMMENT 'Position rules-stop gain percentage.',
                            `RULES_STOP_LOSS_PERCENTAGE` float(255, 0) NULL DEFAULT NULL COMMENT 'Position rules - stop loss percentage.',
                            `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Position status.',
                            `AUTO_CLOSE` tinyint(0) NULL DEFAULT NULL COMMENT 'Indicates if the position should be closed automatically by Cassandre. 0:false 1:true',
                            `FORCE_CLOSING` tinyint(0) NULL DEFAULT NULL COMMENT 'Indicates that the position must be closed no matter the rules.0:false 1:true',
                            `FK_OPENING_ORDER_UID` bigint(0) NULL DEFAULT NULL COMMENT 'The order created to open the position. ',
                            `FK_CLOSING_ORDER_UID` bigint(0) NULL DEFAULT NULL COMMENT 'The order created to close the position.',
                            `LOWEST_GAIN_PRICE_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT ' Price of the lowest gain reached by this position.',
                            `LOWEST_GAIN_PRICE_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Price of the lowest gain reached by this position.',
                            `HIGHEST_GAIN_PRICE_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Price of the highest gain reached by this position.',
                            `HIGHEST_GAIN_PRICE_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Price of the highest gain reached by this position.',
                            `LATEST_GAIN_PRICE_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Price of the latest gain price for this position.',
                            `LATEST_GAIN_PRICE_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Price of the latest gain price for this position.',
                            `CREATED_ON` datetime(0) NULL DEFAULT NULL COMMENT 'Data created on.',
                            `UPDATED_ON` datetime(0) NULL DEFAULT NULL COMMENT 'Data updated on. ',
                            PRIMARY KEY (`UID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- Insert positions.
INSERT INTO POSITIONS (UID, POSITION_ID, TYPE, STATUS, CURRENCY_PAIR, AMOUNT_VALUE, AMOUNT_CURRENCY,
                       RULES_STOP_GAIN_PERCENTAGE, RULES_STOP_LOSS_PERCENTAGE, FK_OPENING_ORDER_UID,
                       FK_CLOSING_ORDER_UID, LOWEST_GAIN_PRICE_VALUE, LOWEST_GAIN_PRICE_CURRENCY,
                       HIGHEST_GAIN_PRICE_VALUE, HIGHEST_GAIN_PRICE_CURRENCY, LATEST_GAIN_PRICE_VALUE,
                       LATEST_GAIN_PRICE_CURRENCY, FK_STRATEGY_UID,CREATED_ON,UPDATED_ON)
VALUES -- Position 1 : Opening, no rules, waiting for BACKUP_OPENING_ORDER_01 to arrive (but will not arrive).
       (1, 1, 'LONG', 'OPENING', 'BTC/USDT', 10, 'BTC', null, null, 3, null, null, null, null, null, null, null, 1,now(),now()),

       -- Position 2 : Opened position, 10% gain rule.
       (2, 2, 'LONG', 'OPENED', 'BTC/USDT', 20, 'BTC', 10, null, 4, null, 1, 'USDT', 2, 'USDT', 3, 'USDT', 1,now(),now()),

       -- Position 3 : Closing position, 20% loss rule, waiting for a not coming trade 'NON_EXISTING_TRADE'.
       (3, 3, 'LONG', 'CLOSING', 'BTC/USDT', 30, 'BTC', null, 20, 5, 6, 17, 'USDT', 68, 'USDT', 92, 'USDT', 1,now(),now()),

       -- Position 4 : Closed position, 30% gain & 40 % loss.
       (4, 4, 'LONG', 'CLOSED', 'BTC/USDT', 40, 'BTC', 30, 40, 7, 8, 17, 'USDT', 68, 'USDT', 93, 'USDT', 1,now(),now()),

       -- Position 5 : closed.
       (5, 5, 'LONG', 'CLOSED', 'ETH/USD', 50, 'ETH', 30, 40, 9, 10, 17, 'USD', 68, 'USD', 94, 'USD', 1,now(),now());

-- =====================================================================================================================

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `TRADES`;
CREATE TABLE `TRADES`  (
                          `UID` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Technical ID',
                          `TRADE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'An identifier set by the exchange that uniquely identifies the trade.',
                          `TYPE` varchar(255) NULL DEFAULT NULL COMMENT 'Trade type i.e. bid (buy) or ask (sell). 参考OrderTypeDTO枚举',
                          `FK_ORDER_UID` bigint(0) NULL DEFAULT NULL COMMENT 'The order responsible for this trade.',
                          `CURRENCY_PAIR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT ' Currency pair.',
                          `AMOUNT_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'Amount that was ordered.',
                          `AMOUNT_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Amount that was ordered.',
                          `PRICE_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'The price.',
                          `PRICE_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'The price.',
                          `FEE_VALUE` decimal(16, 8) NULL DEFAULT NULL COMMENT 'The fee that was charged by the exchange for this trade.',
                          `FEE_CURRENCY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'The fee that was charged by the exchange for this trade.',
                          `USER_REFERENCE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'An identifier provided by the user on placement that uniquely identifies the order of this trade.',
                          `TIMESTAMP` datetime(0) NULL DEFAULT NULL COMMENT 'The timestamp of the trade.',
                          `CREATED_ON` datetime(0) NULL DEFAULT NULL COMMENT 'Data created on.',
                          `UPDATED_ON` datetime(0) NULL DEFAULT NULL COMMENT 'Data updated on. ',
                          PRIMARY KEY (`UID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- Insert trades.
INSERT INTO TRADES (UID, TRADE_ID, FK_ORDER_UID, TYPE, AMOUNT_VALUE, AMOUNT_CURRENCY, CURRENCY_PAIR,
                    PRICE_VALUE, PRICE_CURRENCY, TIMESTAMP, FEE_VALUE, FEE_CURRENCY, USER_REFERENCE,CREATED_ON,UPDATED_ON)
VALUES -- note : No trade for order BACKUP_OPENING_ORDER_01 - This is why position 1 has the opening status.
       -- Order BACKUP_TRADE_01 - Trade from the order buying BACKUP_OPENING_ORDER_02.
       (1, 'BACKUP_TRADE_01', 4, 'BID', 20, 'BTC', 'BTC/USDT', 10, 'USDT', '2020-08-01', 1, 'USDT', 'Trade 01',now(),now()),

       -- Order BACKUP_TRADE_02 - Trade from the order buying BACKUP_OPENING_ORDER_03.
       (2, 'BACKUP_TRADE_02', 5, 'BID', 20, 'BTC', 'BTC/USDT', 20, 'USDT', '2020-08-02', 2, 'USDT', 'Trade 02',now(),now()),

       -- Order BACKUP_TRADE_03 - Trade from the order buying BACKUP_OPENING_ORDER_04.
       (3, 'BACKUP_TRADE_03', 7, 'BID', 40, 'BTC', 'BTC/USDT', 30, 'USDT', '2020-08-03', 3, 'USDT', 'Trade 03',now(),now()),

       -- Order BACKUP_TRADE_04 - Trade from the order selling BACKUP_OPENING_ORDER_04.
       (4, 'BACKUP_TRADE_04', 6, 'ASK', 20, 'BTC', 'BTC/USDT', 40, 'USDT', '2020-08-04', 4, 'USDT', 'Trade 04',now(),now()),

       -- Order BACKUP_TRADE_05 - Trade from the order selling BACKUP_OPENING_ORDER_05.
       (5, 'BACKUP_TRADE_05', 8, 'ASK', 40, 'ETH', 'ETH/USD', 40, 'USD', '2020-08-05', 5, 'USD', 'Trade 05',now(),now()),

       -- For position 5.
       (6, 'BACKUP_TRADE_06', 9, 'BID', 10, 'ETH', 'ETH/USD', 11, 'USD', '2020-08-05', 5, 'USD', 'Trade 06',now(),now()),
       (7, 'BACKUP_TRADE_07', 9, 'BID', 40, 'ETH', 'ETH/USD', 12, 'USD', '2020-08-06', 5, 'USD', 'Trade 07',now(),now()),
       (8, 'BACKUP_TRADE_08', 10, 'ASK', 15, 'ETH', 'ETH/USD', 13, 'USD', '2020-08-07', 5, 'USD', 'Trade 08',now(),now()),
       (9, 'BACKUP_TRADE_09', 10, 'ASK', 5, 'ETH', 'ETH/USD', 14, 'USD', '2020-08-08', 5, 'USD', 'Trade 09',now(),now()),
       (10, 'BACKUP_TRADE_10', 10, 'ASK', 30, 'ETH', 'ETH/USD', 15, 'USD', '2020-08-09', 5, 'USD', 'Trade 10',now(),now());