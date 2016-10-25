-- Added Suport for Cataclysm
-- By Bodeguero for FineWoWCore.

-- ----------------------------
-- Table structure for `account_premium`
-- ----------------------------
DROP TABLE IF EXISTS `account_premium`;
CREATE TABLE `account_premium` (
`id`  int(11) NOT NULL DEFAULT 0 COMMENT 'Account id' ,
`setdate`  bigint(40) NOT NULL DEFAULT 0 ,
`unsetdate`  bigint(40) NOT NULL DEFAULT 0 ,
`premium_type`  tinyint(4) UNSIGNED NOT NULL DEFAULT 1 ,
`active`  tinyint(4) NOT NULL DEFAULT 1 ,
PRIMARY KEY (`id`, `setdate`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Premium Accounts'

;

-- ----------------------------
-- Records of account_premium
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_punishment`
-- ----------------------------
DROP TABLE IF EXISTS `account_punishment`;
CREATE TABLE `account_punishment` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`account`  int(11) UNSIGNED NOT NULL ,
`by`  int(11) NOT NULL ,
`penalty_points`  int(11) UNSIGNED NOT NULL ,
`comment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`time`  bigint(20) UNSIGNED NOT NULL ,
`active`  tinyint(3) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=99

;

-- ----------------------------
-- Records of account_punishment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_strafe`
-- ----------------------------
DROP TABLE IF EXISTS `account_strafe`;
CREATE TABLE `account_strafe` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`account`  int(11) UNSIGNED NOT NULL ,
`by`  int(11) NOT NULL ,
`strafpunkte`  int(11) UNSIGNED NOT NULL ,
`comment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`time`  bigint(20) UNSIGNED NOT NULL ,
`active`  tinyint(3) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=99

;

-- ----------------------------
-- Records of account_strafe
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_tempban`
-- ----------------------------
DROP TABLE IF EXISTS `account_tempban`;
CREATE TABLE `account_tempban` (
`accountId`  int(11) NOT NULL ,
`reason`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`accountId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of account_tempban
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_verwarnung`
-- ----------------------------
DROP TABLE IF EXISTS `account_verwarnung`;
CREATE TABLE `account_verwarnung` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`accountId`  int(11) UNSIGNED NOT NULL ,
`by_account`  int(11) UNSIGNED NOT NULL ,
`comment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`time`  bigint(20) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=169

;

-- ----------------------------
-- Records of account_verwarnung
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_warning`
-- ----------------------------
DROP TABLE IF EXISTS `account_warning`;
CREATE TABLE `account_warning` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`accountId`  int(11) UNSIGNED NOT NULL ,
`by_account`  int(11) UNSIGNED NOT NULL ,
`comment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`time`  bigint(20) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=169

;

-- ----------------------------
-- Records of account_warning
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `accounts_to_delete`
-- ----------------------------
DROP TABLE IF EXISTS `accounts_to_delete`;
CREATE TABLE `accounts_to_delete` (
`id`  int(11) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Account System'

;

-- ----------------------------
-- Records of accounts_to_delete
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `bug_tickets`
-- ----------------------------
DROP TABLE IF EXISTS `bug_tickets`;
CREATE TABLE `bug_tickets` (
`ticketId`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`realm`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier of ticket creator' ,
`message`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`pool`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`mapId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`posX`  float NOT NULL DEFAULT 0 ,
`posY`  float NOT NULL DEFAULT 0 ,
`posZ`  float NOT NULL DEFAULT 0 ,
`closedBy`  int(10) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`ticketId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Support System'
AUTO_INCREMENT=310

;

-- ----------------------------
-- Records of bug_tickets
-- ----------------------------
BEGIN;
COMMIT;