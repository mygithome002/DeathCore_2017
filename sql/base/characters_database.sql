/*
Navicat MySQL Data Transfer

Source Server         : DeathCore
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : characters548

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-10-10 00:02:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_battle_pet`
-- ----------------------------
DROP TABLE IF EXISTS `account_battle_pet`;
CREATE TABLE `account_battle_pet` (
`id`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`accountId`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`species`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`nickname`  varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' ,
`timestamp`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`level`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`xp`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`health`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`maxHealth`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`power`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`speed`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`quality`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`breed`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`flags`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_bin

;

-- ----------------------------
-- Records of account_battle_pet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_battle_pet_slots`
-- ----------------------------
DROP TABLE IF EXISTS `account_battle_pet_slots`;
CREATE TABLE `account_battle_pet_slots` (
`accountId`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`slot1`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`slot2`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`slot3`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`flags`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`accountId`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_bin

;

-- ----------------------------
-- Records of account_battle_pet_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_data`
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data` (
`accountId`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier' ,
`type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`data`  blob NOT NULL ,
PRIMARY KEY (`accountId`, `type`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of account_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_instance_times`
-- ----------------------------
DROP TABLE IF EXISTS `account_instance_times`;
CREATE TABLE `account_instance_times` (
`accountId`  int(10) UNSIGNED NOT NULL ,
`instanceId`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`releaseTime`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`accountId`, `instanceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of account_instance_times
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `account_tutorial`
-- ----------------------------
DROP TABLE IF EXISTS `account_tutorial`;
CREATE TABLE `account_tutorial` (
`accountId`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier' ,
`tut0`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tut1`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tut2`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tut3`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tut4`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tut5`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tut6`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tut7`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`accountId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of account_tutorial
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `addons`
-- ----------------------------
DROP TABLE IF EXISTS `addons`;
CREATE TABLE `addons` (
`name`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`crc`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`name`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Addons'

;

-- ----------------------------
-- Records of addons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auctionhouse`
-- ----------------------------
DROP TABLE IF EXISTS `auctionhouse`;
CREATE TABLE `auctionhouse` (
`id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`auctioneerguid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`itemguid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`itemowner`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`buyoutprice`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`buyguid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`lastbid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`startbid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`deposit`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of auctionhouse
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `banned_addons`
-- ----------------------------
DROP TABLE IF EXISTS `banned_addons`;
CREATE TABLE `banned_addons` (
`Id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`Name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`Version`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`Timestamp`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`Id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of banned_addons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `blackmarket`
-- ----------------------------
DROP TABLE IF EXISTS `blackmarket`;
CREATE TABLE `blackmarket` (
`id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Identifier' ,
`templateId`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Reference to world.blackmarket_template' ,
`startTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Start time of the bid' ,
`bid`  bigint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Amount of the actual bid' ,
`bidder`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Player guid (highest bid)' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of blackmarket
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `bugreport`
-- ----------------------------
DROP TABLE IF EXISTS `bugreport`;
CREATE TABLE `bugreport` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifier' ,
`type`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Debug System'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of bugreport
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `calendar_events`
-- ----------------------------
DROP TABLE IF EXISTS `calendar_events`;
CREATE TABLE `calendar_events` (
`id`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`creator`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`type`  tinyint(1) UNSIGNED NOT NULL DEFAULT 4 ,
`dungeon`  int(10) NOT NULL DEFAULT '-1' ,
`eventtime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`flags`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`time2`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of calendar_events
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `calendar_invites`
-- ----------------------------
DROP TABLE IF EXISTS `calendar_invites`;
CREATE TABLE `calendar_invites` (
`id`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`event`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`invitee`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`sender`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`status`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`statustime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`rank`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 ,
`text`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of calendar_invites
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `channels`
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
`name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`team`  int(10) UNSIGNED NOT NULL ,
`announce`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`ownership`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`password`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bannedList`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`lastUsed`  int(10) UNSIGNED NOT NULL ,
PRIMARY KEY (`name`, `team`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Channel System'

;

-- ----------------------------
-- Records of channels
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_account_data`
-- ----------------------------
DROP TABLE IF EXISTS `character_account_data`;
CREATE TABLE `character_account_data` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`data`  blob NOT NULL ,
PRIMARY KEY (`guid`, `type`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_account_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_achievement`
-- ----------------------------
DROP TABLE IF EXISTS `character_achievement`;
CREATE TABLE `character_achievement` (
`guid`  int(10) UNSIGNED NOT NULL ,
`achievement`  smallint(5) UNSIGNED NOT NULL ,
`accountID`  int(10) NOT NULL DEFAULT 0 ,
`date`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `achievement`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_achievement
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_achievement_progress`
-- ----------------------------
DROP TABLE IF EXISTS `character_achievement_progress`;
CREATE TABLE `character_achievement_progress` (
`guid`  int(10) UNSIGNED NOT NULL ,
`criteria`  smallint(5) UNSIGNED NOT NULL ,
`counter`  bigint(20) UNSIGNED NOT NULL ,
`date`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `criteria`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_achievement_progress
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_action`
-- ----------------------------
DROP TABLE IF EXISTS `character_action`;
CREATE TABLE `character_action` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`spec`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`button`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`action`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `spec`, `button`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_action
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_arena_stats`
-- ----------------------------
DROP TABLE IF EXISTS `character_arena_stats`;
CREATE TABLE `character_arena_stats` (
`guid`  int(10) NOT NULL ,
`slot`  tinyint(3) NOT NULL ,
`matchMakerRating`  smallint(5) NOT NULL ,
PRIMARY KEY (`guid`, `slot`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_arena_stats
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_aura`
-- ----------------------------
DROP TABLE IF EXISTS `character_aura`;
CREATE TABLE `character_aura` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`caster_guid`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Full Global Unique Identifier' ,
`item_guid`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`spell`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
`effect_mask`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`recalculate_mask`  int(10) UNSIGNED NULL DEFAULT 0 ,
`stackcount`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`amount0`  int(11) NOT NULL DEFAULT 0 ,
`amount1`  int(11) NOT NULL DEFAULT 0 ,
`amount2`  int(11) NOT NULL DEFAULT 0 ,
`base_amount0`  int(11) NOT NULL DEFAULT 0 ,
`base_amount1`  int(11) NOT NULL DEFAULT 0 ,
`base_amount2`  int(11) NOT NULL DEFAULT 0 ,
`maxduration`  int(11) NOT NULL DEFAULT 0 ,
`remaintime`  int(11) NOT NULL DEFAULT 0 ,
`remaincharges`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `caster_guid`, `item_guid`, `spell`, `effect_mask`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_aura
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_aura_effect`
-- ----------------------------
DROP TABLE IF EXISTS `character_aura_effect`;
CREATE TABLE `character_aura_effect` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`slot`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`effect`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`baseamount`  int(11) NOT NULL DEFAULT 0 ,
`amount`  int(11) NOT NULL ,
PRIMARY KEY (`guid`, `slot`, `effect`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of character_aura_effect
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_banned`
-- ----------------------------
DROP TABLE IF EXISTS `character_banned`;
CREATE TABLE `character_banned` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`bandate`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`unbandate`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`bannedby`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`banreason`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`active`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
PRIMARY KEY (`guid`, `bandate`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Ban List'

;

-- ----------------------------
-- Records of character_banned
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_battleground_data`
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_data`;
CREATE TABLE `character_battleground_data` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`instanceId`  int(10) UNSIGNED NOT NULL COMMENT 'Instance Identifier' ,
`team`  smallint(5) UNSIGNED NOT NULL ,
`joinX`  float NOT NULL DEFAULT 0 ,
`joinY`  float NOT NULL DEFAULT 0 ,
`joinZ`  float NOT NULL DEFAULT 0 ,
`joinO`  float NOT NULL DEFAULT 0 ,
`joinMapId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier' ,
`taxiStart`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`taxiEnd`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`mountSpell`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_battleground_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_battleground_random`
-- ----------------------------
DROP TABLE IF EXISTS `character_battleground_random`;
CREATE TABLE `character_battleground_random` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_battleground_random
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_cuf_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `character_cuf_profiles`;
CREATE TABLE `character_cuf_profiles` (
`guid`  int(10) UNSIGNED NOT NULL COMMENT 'Character Guid' ,
`id`  tinyint(3) UNSIGNED NOT NULL COMMENT 'Profile Id (0-4)' ,
`name`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Profile Name' ,
`frameHeight`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Frame Height' ,
`frameWidth`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Frame Width' ,
`sortBy`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Frame Sort By' ,
`healthText`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Frame Health Text' ,
`boolOptions`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Many Configurable Bool Options' ,
`unk146`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int8' ,
`unk147`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int8' ,
`unk148`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int8' ,
`unk150`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int16' ,
`unk152`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int16' ,
`unk154`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Profile Unk Int16' ,
PRIMARY KEY (`guid`, `id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_cuf_profiles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_currency`
-- ----------------------------
DROP TABLE IF EXISTS `character_currency`;
CREATE TABLE `character_currency` (
`guid`  int(10) UNSIGNED NOT NULL ,
`currency`  smallint(5) UNSIGNED NOT NULL ,
`total_count`  int(10) UNSIGNED NOT NULL ,
`week_count`  int(10) UNSIGNED NOT NULL ,
`season_count`  int(10) UNSIGNED NOT NULL ,
`flags`  int(5) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `currency`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_currency
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_declinedname`
-- ----------------------------
DROP TABLE IF EXISTS `character_declinedname`;
CREATE TABLE `character_declinedname` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`genitive`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`dative`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`accusative`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`instrumental`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`prepositional`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_declinedname
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_equipmentsets`
-- ----------------------------
DROP TABLE IF EXISTS `character_equipmentsets`;
CREATE TABLE `character_equipmentsets` (
`guid`  int(10) NOT NULL DEFAULT 0 ,
`setguid`  bigint(20) NOT NULL AUTO_INCREMENT ,
`setindex`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`name`  varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`iconname`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ignore_mask`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item0`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item1`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item2`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item3`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item4`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item5`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item6`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item7`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item8`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item9`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item10`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item11`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item12`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item13`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item14`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item15`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item16`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item17`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
`item18`  int(11) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`setguid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of character_equipmentsets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_gifts`
-- ----------------------------
DROP TABLE IF EXISTS `character_gifts`;
CREATE TABLE `character_gifts` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`item_guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`entry`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`flags`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`item_guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_gifts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_glyphs`
-- ----------------------------
DROP TABLE IF EXISTS `character_glyphs`;
CREATE TABLE `character_glyphs` (
`guid`  int(10) UNSIGNED NOT NULL ,
`spec`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`glyph1`  smallint(5) UNSIGNED NULL DEFAULT 0 ,
`glyph2`  smallint(5) UNSIGNED NULL DEFAULT 0 ,
`glyph3`  smallint(5) UNSIGNED NULL DEFAULT 0 ,
`glyph4`  smallint(5) UNSIGNED NULL DEFAULT 0 ,
`glyph5`  smallint(5) UNSIGNED NULL DEFAULT 0 ,
`glyph6`  smallint(5) UNSIGNED NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `spec`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_glyphs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_homebind`
-- ----------------------------
DROP TABLE IF EXISTS `character_homebind`;
CREATE TABLE `character_homebind` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`mapId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier' ,
`zoneId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Zone Identifier' ,
`posX`  float NOT NULL DEFAULT 0 ,
`posY`  float NOT NULL DEFAULT 0 ,
`posZ`  float NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_homebind
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_instance`
-- ----------------------------
DROP TABLE IF EXISTS `character_instance`;
CREATE TABLE `character_instance` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`instance`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`permanent`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `instance`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_instance
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `character_inventory`;
CREATE TABLE `character_inventory` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`bag`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`slot`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`item`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Item Global Unique Identifier' ,
PRIMARY KEY (`item`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_inventory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_pet`
-- ----------------------------
DROP TABLE IF EXISTS `character_pet`;
CREATE TABLE `character_pet` (
`id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`entry`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`owner`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`modelid`  int(10) UNSIGNED NULL DEFAULT 0 ,
`CreatedBySpell`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
`PetType`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`level`  smallint(5) UNSIGNED NOT NULL DEFAULT 1 ,
`exp`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`Reactstate`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`name`  varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Pet' ,
`renamed`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`slot`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`curhealth`  int(10) UNSIGNED NOT NULL DEFAULT 1 ,
`curmana`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`savetime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`abdata`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`specialization`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Pet System'

;

-- ----------------------------
-- Records of character_pet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_pet_declinedname`
-- ----------------------------
DROP TABLE IF EXISTS `character_pet_declinedname`;
CREATE TABLE `character_pet_declinedname` (
`id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`owner`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`genitive`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`dative`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`accusative`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`instrumental`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`prepositional`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_pet_declinedname
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_queststatus`
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus`;
CREATE TABLE `character_queststatus` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`quest`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier' ,
`status`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`explored`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`timer`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `quest`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_queststatus
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_queststatus_daily`
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_daily`;
CREATE TABLE `character_queststatus_daily` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`quest`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier' ,
`time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `quest`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_queststatus_daily
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_queststatus_monthly`
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_monthly`;
CREATE TABLE `character_queststatus_monthly` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`quest`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier' ,
PRIMARY KEY (`guid`, `quest`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_queststatus_monthly
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_queststatus_objective`
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_objective`;
CREATE TABLE `character_queststatus_objective` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`objectiveId`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`amount`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`objectiveId`, `guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_queststatus_objective
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_queststatus_rewarded`
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_rewarded`;
CREATE TABLE `character_queststatus_rewarded` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`quest`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier' ,
`active`  tinyint(10) UNSIGNED NOT NULL DEFAULT 1 ,
PRIMARY KEY (`guid`, `quest`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_queststatus_rewarded
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_queststatus_seasonal`
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_seasonal`;
CREATE TABLE `character_queststatus_seasonal` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`quest`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier' ,
`event`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event Identifier' ,
PRIMARY KEY (`guid`, `quest`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_queststatus_seasonal
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_queststatus_weekly`
-- ----------------------------
DROP TABLE IF EXISTS `character_queststatus_weekly`;
CREATE TABLE `character_queststatus_weekly` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`quest`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quest Identifier' ,
PRIMARY KEY (`guid`, `quest`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_queststatus_weekly
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_rated_matchmaker_rating`
-- ----------------------------
DROP TABLE IF EXISTS `character_rated_matchmaker_rating`;
CREATE TABLE `character_rated_matchmaker_rating` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`matchmakerRating`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_rated_matchmaker_rating
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_rated_stats`
-- ----------------------------
DROP TABLE IF EXISTS `character_rated_stats`;
CREATE TABLE `character_rated_stats` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`slot`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`weekGames`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`weekWins`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`weekBest`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`seasonGames`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`seasonWins`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`seasonBest`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`personalRating`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_rated_stats
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_reputation`
-- ----------------------------
DROP TABLE IF EXISTS `character_reputation`;
CREATE TABLE `character_reputation` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`faction`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`standing`  int(11) NOT NULL DEFAULT 0 ,
`flags`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `faction`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_reputation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_research_digsites`
-- ----------------------------
DROP TABLE IF EXISTS `character_research_digsites`;
CREATE TABLE `character_research_digsites` (
`guid`  int(11) NOT NULL COMMENT 'Global Unique Identifier' ,
`digsiteId`  int(11) NOT NULL ,
`currentFindGUID`  int(11) NOT NULL DEFAULT 0 ,
`remainingFindCount`  tinyint(3) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `digsiteId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of character_research_digsites
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_research_history`
-- ----------------------------
DROP TABLE IF EXISTS `character_research_history`;
CREATE TABLE `character_research_history` (
`guid`  int(11) NOT NULL COMMENT 'Global Unique Identifier' ,
`projectId`  int(11) NOT NULL ,
`researchCount`  int(11) NOT NULL ,
`firstResearchTimestamp`  int(11) NOT NULL ,
PRIMARY KEY (`guid`, `projectId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of character_research_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_research_projects`
-- ----------------------------
DROP TABLE IF EXISTS `character_research_projects`;
CREATE TABLE `character_research_projects` (
`guid`  int(11) NOT NULL COMMENT 'Global Unique Identifier' ,
`projectId`  int(11) NOT NULL ,
PRIMARY KEY (`guid`, `projectId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of character_research_projects
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_skills`
-- ----------------------------
DROP TABLE IF EXISTS `character_skills`;
CREATE TABLE `character_skills` (
`guid`  int(10) UNSIGNED NOT NULL COMMENT 'Global Unique Identifier' ,
`skill`  smallint(5) UNSIGNED NOT NULL ,
`value`  smallint(5) UNSIGNED NOT NULL ,
`max`  smallint(5) UNSIGNED NOT NULL ,
PRIMARY KEY (`guid`, `skill`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_skills
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_social`
-- ----------------------------
DROP TABLE IF EXISTS `character_social`;
CREATE TABLE `character_social` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier' ,
`friend`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Friend Global Unique Identifier' ,
`flags`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Friend Flags' ,
`note`  varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Friend Note' ,
PRIMARY KEY (`guid`, `friend`, `flags`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_social
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_spell`
-- ----------------------------
DROP TABLE IF EXISTS `character_spell`;
CREATE TABLE `character_spell` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`spell`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier' ,
`active`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`disabled`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `spell`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of character_spell
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_spell_cooldown`
-- ----------------------------
DROP TABLE IF EXISTS `character_spell_cooldown`;
CREATE TABLE `character_spell_cooldown` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part' ,
`spell`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier' ,
`item`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Item Identifier' ,
`time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `spell`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_spell_cooldown
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_stats`
-- ----------------------------
DROP TABLE IF EXISTS `character_stats`;
CREATE TABLE `character_stats` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part' ,
`maxhealth`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`maxpower1`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`maxpower2`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`maxpower3`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`maxpower4`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`maxpower5`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`strength`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`agility`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`stamina`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`intellect`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`spirit`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`armor`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resHoly`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resFire`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resNature`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resFrost`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resShadow`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resArcane`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`blockPct`  float UNSIGNED NOT NULL DEFAULT 0 ,
`dodgePct`  float UNSIGNED NOT NULL DEFAULT 0 ,
`parryPct`  float UNSIGNED NOT NULL DEFAULT 0 ,
`critPct`  float UNSIGNED NOT NULL DEFAULT 0 ,
`rangedCritPct`  float UNSIGNED NOT NULL DEFAULT 0 ,
`spellCritPct`  float UNSIGNED NOT NULL DEFAULT 0 ,
`attackPower`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`rangedAttackPower`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`spellPower`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resilience`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_stats
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_talent`
-- ----------------------------
DROP TABLE IF EXISTS `character_talent`;
CREATE TABLE `character_talent` (
`guid`  int(10) UNSIGNED NOT NULL ,
`spell`  mediumint(8) UNSIGNED NOT NULL ,
`spec`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `spell`, `spec`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_talent
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `character_void_storage`
-- ----------------------------
DROP TABLE IF EXISTS `character_void_storage`;
CREATE TABLE `character_void_storage` (
`itemId`  bigint(20) UNSIGNED NOT NULL ,
`playerGuid`  int(10) UNSIGNED NOT NULL ,
`itemEntry`  mediumint(8) UNSIGNED NOT NULL ,
`slot`  tinyint(3) UNSIGNED NOT NULL ,
`creatorGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`randomProperty`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`suffixFactor`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`itemId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of character_void_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `characters`
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`account`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Account Identifier' ,
`name`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`slot`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`race`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`class`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`gender`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`level`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`xp`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`money`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`playerBytes`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`playerBytes2`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`playerFlags`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`position_x`  float NOT NULL DEFAULT 0 ,
`position_y`  float NOT NULL DEFAULT 0 ,
`position_z`  float NOT NULL DEFAULT 0 ,
`map`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier' ,
`instance_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`instance_mode_mask`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`orientation`  float NOT NULL DEFAULT 0 ,
`taximask`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`online`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`cinematic`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`totaltime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`leveltime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`logout_time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`is_logout_resting`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`rest_bonus`  float NOT NULL DEFAULT 0 ,
`resettalents_cost`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resettalents_time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`resetspecialization_cost`  int(10) NOT NULL DEFAULT 0 ,
`resetspecialization_time`  int(10) NOT NULL DEFAULT 0 ,
`talentTree`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0 0' ,
`trans_x`  float NOT NULL DEFAULT 0 ,
`trans_y`  float NOT NULL DEFAULT 0 ,
`trans_z`  float NOT NULL DEFAULT 0 ,
`trans_o`  float NOT NULL DEFAULT 0 ,
`transguid`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
`extra_flags`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`stable_slots`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`at_login`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`zone`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`death_expire_time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`taxi_path`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`totalKills`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`todayKills`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`yesterdayKills`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`chosenTitle`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`watchedFaction`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`drunk`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`health`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`power1`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`power2`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`power3`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`power4`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`power5`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`latency`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
`speccount`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`activespec`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`specialization1`  int(11) NOT NULL ,
`specialization2`  int(11) NOT NULL ,
`exploredZones`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`equipmentCache`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`knownTitles`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`actionBars`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`grantableLevels`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`guildId`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`deleteInfos_Account`  int(10) UNSIGNED NULL DEFAULT NULL ,
`deleteInfos_Name`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`deleteDate`  int(10) UNSIGNED NULL DEFAULT NULL ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'

;

-- ----------------------------
-- Records of characters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `corpse`
-- ----------------------------
DROP TABLE IF EXISTS `corpse`;
CREATE TABLE `corpse` (
`corpseGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier' ,
`posX`  float NOT NULL DEFAULT 0 ,
`posY`  float NOT NULL DEFAULT 0 ,
`posZ`  float NOT NULL DEFAULT 0 ,
`orientation`  float NOT NULL DEFAULT 0 ,
`mapId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Identifier' ,
`displayId`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`itemCache`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`bytes1`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`bytes2`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`flags`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`dynFlags`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`corpseType`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`instanceId`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier' ,
`phaseMask`  bigint(20) UNSIGNED NOT NULL ,
PRIMARY KEY (`corpseGuid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Death System'

;

-- ----------------------------
-- Records of corpse
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `corpse_phases`
-- ----------------------------
DROP TABLE IF EXISTS `corpse_phases`;
CREATE TABLE `corpse_phases` (
`Guid`  int(10) UNSIGNED NOT NULL ,
`PhaseId`  int(10) UNSIGNED NOT NULL ,
`OwnerGuid`  int(10) UNSIGNED NOT NULL ,
`Time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`CorpseType`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`Guid`, `PhaseId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of corpse_phases
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `creature_respawn`
-- ----------------------------
DROP TABLE IF EXISTS `creature_respawn`;
CREATE TABLE `creature_respawn` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`respawnTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`mapId`  smallint(10) UNSIGNED NOT NULL DEFAULT 0 ,
`instanceId`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier' ,
PRIMARY KEY (`guid`, `instanceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Grid Loading System'

;

-- ----------------------------
-- Records of creature_respawn
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `game_event_condition_save`
-- ----------------------------
DROP TABLE IF EXISTS `game_event_condition_save`;
CREATE TABLE `game_event_condition_save` (
`eventEntry`  tinyint(3) UNSIGNED NOT NULL ,
`condition_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`done`  float NULL DEFAULT 0 ,
PRIMARY KEY (`eventEntry`, `condition_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of game_event_condition_save
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `game_event_save`
-- ----------------------------
DROP TABLE IF EXISTS `game_event_save`;
CREATE TABLE `game_event_save` (
`eventEntry`  tinyint(3) UNSIGNED NOT NULL ,
`state`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`next_start`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`eventEntry`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of game_event_save
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `gameobject_respawn`
-- ----------------------------
DROP TABLE IF EXISTS `gameobject_respawn`;
CREATE TABLE `gameobject_respawn` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`respawnTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`mapId`  smallint(10) UNSIGNED NOT NULL DEFAULT 0 ,
`instanceId`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Instance Identifier' ,
PRIMARY KEY (`guid`, `instanceId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Grid Loading System'

;

-- ----------------------------
-- Records of gameobject_respawn
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `gm_subsurveys`
-- ----------------------------
DROP TABLE IF EXISTS `gm_subsurveys`;
CREATE TABLE `gm_subsurveys` (
`surveyId`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`subsurveyId`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`rank`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`comment`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`surveyId`, `subsurveyId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of gm_subsurveys
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `gm_surveys`
-- ----------------------------
DROP TABLE IF EXISTS `gm_surveys`;
CREATE TABLE `gm_surveys` (
`surveyId`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`mainSurvey`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`overallComment`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`surveyId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of gm_surveys
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `gm_tickets`
-- ----------------------------
DROP TABLE IF EXISTS `gm_tickets`;
CREATE TABLE `gm_tickets` (
`ticketId`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier of ticket creator' ,
`name`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Name of ticket creator' ,
`message`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`mapId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`posX`  float NOT NULL DEFAULT 0 ,
`posY`  float NOT NULL DEFAULT 0 ,
`posZ`  float NOT NULL DEFAULT 0 ,
`lastModifiedTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`closedBy`  int(10) NOT NULL DEFAULT 0 ,
`assignedTo`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'GUID of admin to whom ticket is assigned' ,
`comment`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`response`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`completed`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`escalated`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`viewed`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`haveTicket`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`ticketId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of gm_tickets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `group_instance`
-- ----------------------------
DROP TABLE IF EXISTS `group_instance`;
CREATE TABLE `group_instance` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`instance`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`permanent`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `instance`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of group_instance
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `group_member`
-- ----------------------------
DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member` (
`guid`  int(10) UNSIGNED NOT NULL ,
`memberGuid`  int(10) UNSIGNED NOT NULL ,
`memberFlags`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`subgroup`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`roles`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`memberGuid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Groups'

;

-- ----------------------------
-- Records of group_member
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
`guid`  int(10) UNSIGNED NOT NULL ,
`leaderGuid`  int(10) UNSIGNED NOT NULL ,
`lootMethod`  tinyint(3) UNSIGNED NOT NULL ,
`looterGuid`  int(10) UNSIGNED NOT NULL ,
`lootThreshold`  tinyint(3) UNSIGNED NOT NULL ,
`icon1`  int(10) UNSIGNED NOT NULL ,
`icon2`  int(10) UNSIGNED NOT NULL ,
`icon3`  int(10) UNSIGNED NOT NULL ,
`icon4`  int(10) UNSIGNED NOT NULL ,
`icon5`  int(10) UNSIGNED NOT NULL ,
`icon6`  int(10) UNSIGNED NOT NULL ,
`icon7`  int(10) UNSIGNED NOT NULL ,
`icon8`  int(10) UNSIGNED NOT NULL ,
`groupType`  tinyint(3) UNSIGNED NOT NULL ,
`difficulty`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`raiddifficulty`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Groups'

;

-- ----------------------------
-- Records of groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild`
-- ----------------------------
DROP TABLE IF EXISTS `guild`;
CREATE TABLE `guild` (
`guildid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`name`  varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`leaderguid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`EmblemStyle`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`EmblemColor`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`BorderStyle`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`BorderColor`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`BackgroundColor`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`motd`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`createdate`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`BankMoney`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`level`  int(10) UNSIGNED NULL DEFAULT 1 ,
`experience`  bigint(20) UNSIGNED NULL DEFAULT 0 ,
`todayExperience`  bigint(20) UNSIGNED NULL DEFAULT 0 ,
PRIMARY KEY (`guildid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Guild System'

;

-- ----------------------------
-- Records of guild
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_achievement`
-- ----------------------------
DROP TABLE IF EXISTS `guild_achievement`;
CREATE TABLE `guild_achievement` (
`guildId`  int(10) UNSIGNED NOT NULL ,
`achievement`  smallint(5) UNSIGNED NOT NULL ,
`date`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`guids`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`guildId`, `achievement`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of guild_achievement
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_achievement_progress`
-- ----------------------------
DROP TABLE IF EXISTS `guild_achievement_progress`;
CREATE TABLE `guild_achievement_progress` (
`guildId`  int(10) UNSIGNED NOT NULL ,
`criteria`  smallint(5) UNSIGNED NOT NULL ,
`counter`  bigint(20) UNSIGNED NOT NULL ,
`date`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`completedGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guildId`, `criteria`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of guild_achievement_progress
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_bank_eventlog`
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_eventlog`;
CREATE TABLE `guild_bank_eventlog` (
`guildid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild Identificator' ,
`LogGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Log record identificator - auxiliary column' ,
`TabId`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild bank TabId' ,
`EventType`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event type' ,
`PlayerGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`ItemOrMoney`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`ItemStackCount`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`DestTabId`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Destination Tab Id' ,
`TimeStamp`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event UNIX time' ,
PRIMARY KEY (`guildid`, `LogGuid`, `TabId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of guild_bank_eventlog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_bank_item`
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_item`;
CREATE TABLE `guild_bank_item` (
`guildid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`TabId`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`SlotId`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`item_guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guildid`, `TabId`, `SlotId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of guild_bank_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_bank_right`
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_right`;
CREATE TABLE `guild_bank_right` (
`guildid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`TabId`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`rid`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`gbright`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`SlotPerDay`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guildid`, `TabId`, `rid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of guild_bank_right
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_bank_tab`
-- ----------------------------
DROP TABLE IF EXISTS `guild_bank_tab`;
CREATE TABLE `guild_bank_tab` (
`guildid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`TabId`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`TabName`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`TabIcon`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`TabText`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`guildid`, `TabId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of guild_bank_tab
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_eventlog`
-- ----------------------------
DROP TABLE IF EXISTS `guild_eventlog`;
CREATE TABLE `guild_eventlog` (
`guildid`  int(10) UNSIGNED NOT NULL COMMENT 'Guild Identificator' ,
`LogGuid`  int(10) UNSIGNED NOT NULL COMMENT 'Log record identificator - auxiliary column' ,
`EventType`  tinyint(3) UNSIGNED NOT NULL COMMENT 'Event type' ,
`PlayerGuid1`  int(10) UNSIGNED NOT NULL COMMENT 'Player 1' ,
`PlayerGuid2`  int(10) UNSIGNED NOT NULL COMMENT 'Player 2' ,
`NewRank`  tinyint(3) UNSIGNED NOT NULL COMMENT 'New rank(in case promotion/demotion)' ,
`TimeStamp`  int(10) UNSIGNED NOT NULL COMMENT 'Event UNIX time' ,
PRIMARY KEY (`guildid`, `LogGuid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Guild Eventlog'

;

-- ----------------------------
-- Records of guild_eventlog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_finder_applicant`
-- ----------------------------
DROP TABLE IF EXISTS `guild_finder_applicant`;
CREATE TABLE `guild_finder_applicant` (
`guildId`  int(10) UNSIGNED NULL DEFAULT NULL ,
`playerGuid`  int(10) UNSIGNED NULL DEFAULT NULL ,
`availability`  tinyint(3) UNSIGNED NULL DEFAULT 0 ,
`classRole`  tinyint(3) UNSIGNED NULL DEFAULT 0 ,
`interests`  tinyint(3) UNSIGNED NULL DEFAULT 0 ,
`comment`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`submitTime`  int(10) UNSIGNED NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of guild_finder_applicant
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_finder_guild_settings`
-- ----------------------------
DROP TABLE IF EXISTS `guild_finder_guild_settings`;
CREATE TABLE `guild_finder_guild_settings` (
`guildId`  int(10) UNSIGNED NOT NULL ,
`availability`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`classRoles`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`interests`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`level`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`listed`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`comment`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
PRIMARY KEY (`guildId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of guild_finder_guild_settings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_member`
-- ----------------------------
DROP TABLE IF EXISTS `guild_member`;
CREATE TABLE `guild_member` (
`guildid`  int(10) UNSIGNED NOT NULL COMMENT 'Guild Identificator' ,
`guid`  int(10) UNSIGNED NOT NULL ,
`rank`  tinyint(3) UNSIGNED NOT NULL ,
`pnote`  varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`offnote`  varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`weekActivity`  bigint(20) UNSIGNED NULL DEFAULT 0 ,
`totalActivity`  bigint(20) UNSIGNED NULL DEFAULT 0 ,
`weekReputation`  int(10) UNSIGNED NULL DEFAULT 0 ,
`totalReputation`  int(10) UNSIGNED NULL DEFAULT 0 ,
`achievementPoints`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`firstSkillId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`firstSkillValue`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`firstSkillRank`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`secondSkillId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`secondSkillValue`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`secondSkillRank`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Guild System'

;

-- ----------------------------
-- Records of guild_member
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_member_withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `guild_member_withdraw`;
CREATE TABLE `guild_member_withdraw` (
`guid`  int(10) UNSIGNED NOT NULL ,
`tab0`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tab1`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tab2`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tab3`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tab4`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tab5`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tab6`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`tab7`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`money`  bigint(20) NOT NULL ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Guild Member Daily Withdraws'

;

-- ----------------------------
-- Records of guild_member_withdraw
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_newslog`
-- ----------------------------
DROP TABLE IF EXISTS `guild_newslog`;
CREATE TABLE `guild_newslog` (
`guildid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Guild Identificator' ,
`LogGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Log record identificator - auxiliary column' ,
`EventType`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event type' ,
`PlayerGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`Flags`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`Value`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`TimeStamp`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Event UNIX time' ,
PRIMARY KEY (`guildid`, `LogGuid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of guild_newslog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `guild_rank`
-- ----------------------------
DROP TABLE IF EXISTS `guild_rank`;
CREATE TABLE `guild_rank` (
`guildid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`rid`  tinyint(3) UNSIGNED NOT NULL ,
`rname`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
`rights`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
`BankMoneyPerDay`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guildid`, `rid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Guild System'

;

-- ----------------------------
-- Records of guild_rank
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `instance`
-- ----------------------------
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance` (
`id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`map`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`resettime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`difficulty`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`completedEncounters`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`data`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of instance
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `instance_reset`
-- ----------------------------
DROP TABLE IF EXISTS `instance_reset`;
CREATE TABLE `instance_reset` (
`mapid`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`difficulty`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`resettime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`mapid`, `difficulty`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of instance_reset
-- ----------------------------
BEGIN;
INSERT INTO `instance_reset` VALUES ('33', '2', '1476158400'), ('36', '2', '1476158400'), ('249', '3', '1476676800'), ('249', '4', '1476676800'), ('269', '2', '1476158400'), ('409', '9', '1476676800'), ('469', '9', '1476676800'), ('509', '3', '1476331200'), ('531', '9', '1476676800'), ('532', '3', '1476676800'), ('533', '3', '1476676800'), ('533', '4', '1476676800'), ('534', '4', '1476676800'), ('540', '2', '1476158400'), ('542', '2', '1476158400'), ('543', '2', '1476158400'), ('544', '4', '1476676800'), ('545', '2', '1476158400'), ('546', '2', '1476158400'), ('547', '2', '1476158400'), ('548', '4', '1476676800'), ('550', '4', '1476676800'), ('552', '2', '1476158400'), ('553', '2', '1476158400'), ('554', '2', '1476158400'), ('555', '2', '1476158400'), ('556', '2', '1476158400'), ('557', '2', '1476158400'), ('558', '2', '1476158400'), ('560', '2', '1476158400'), ('564', '4', '1476676800'), ('565', '4', '1476676800'), ('568', '2', '1476158400'), ('574', '2', '1476158400'), ('575', '2', '1476158400'), ('576', '2', '1476158400'), ('578', '2', '1476158400'), ('580', '4', '1476676800'), ('585', '2', '1476158400'), ('595', '2', '1476158400'), ('598', '2', '1476158400'), ('599', '2', '1476158400'), ('600', '2', '1476158400'), ('601', '2', '1476158400'), ('602', '2', '1476158400'), ('603', '3', '1476676800'), ('603', '4', '1476676800'), ('604', '2', '1476158400'), ('608', '2', '1476158400'), ('615', '3', '1476676800'), ('615', '4', '1476676800'), ('616', '3', '1476676800'), ('616', '4', '1476676800'), ('619', '2', '1476158400'), ('624', '3', '1476676800'), ('624', '4', '1476676800'), ('631', '3', '1476676800'), ('631', '4', '1476676800'), ('631', '5', '1476676800'), ('631', '6', '1476676800'), ('632', '2', '1476158400'), ('643', '2', '1476158400'), ('644', '2', '1476158400'), ('645', '2', '1476158400'), ('649', '3', '1476676800'), ('649', '4', '1476676800'), ('649', '5', '1476676800'), ('649', '6', '1476676800'), ('650', '2', '1476158400'), ('657', '2', '1476158400'), ('658', '2', '1476158400'), ('668', '2', '1476158400'), ('669', '3', '1476676800'), ('669', '4', '1476676800'), ('669', '5', '1476676800'), ('669', '6', '1476676800'), ('670', '2', '1476158400'), ('671', '3', '1476676800'), ('671', '4', '1476676800'), ('671', '5', '1476676800'), ('671', '6', '1476676800'), ('720', '3', '1476676800'), ('720', '4', '1476676800'), ('720', '5', '1476676800'), ('720', '6', '1476676800'), ('724', '3', '1476676800'), ('724', '4', '1476676800'), ('724', '5', '1476676800'), ('724', '6', '1476676800'), ('725', '2', '1476158400'), ('754', '3', '1476676800'), ('754', '4', '1476676800'), ('754', '5', '1476676800'), ('754', '6', '1476676800'), ('755', '2', '1476158400'), ('757', '3', '1476676800'), ('757', '4', '1476676800'), ('757', '5', '1476676800'), ('757', '6', '1476676800'), ('859', '2', '1476158400');
INSERT INTO `instance_reset` VALUES ('938', '2', '1476158400'), ('939', '2', '1476158400'), ('940', '2', '1476158400'), ('959', '2', '1476158400'), ('960', '2', '1476158400'), ('961', '2', '1476158400'), ('962', '2', '1476158400'), ('967', '3', '1476676800'), ('967', '4', '1476676800'), ('967', '5', '1476676800'), ('967', '6', '1476676800'), ('994', '2', '1476158400'), ('996', '3', '1476676800'), ('996', '4', '1476676800'), ('996', '5', '1476676800'), ('996', '6', '1476676800'), ('1001', '2', '1476158400'), ('1004', '2', '1476158400'), ('1007', '2', '1476158400'), ('1008', '3', '1476676800'), ('1008', '4', '1476676800'), ('1008', '5', '1476676800'), ('1008', '6', '1476676800'), ('1009', '3', '1476676800'), ('1009', '4', '1476676800'), ('1009', '5', '1476676800'), ('1009', '6', '1476676800'), ('1011', '2', '1476158400'), ('1098', '3', '1476676800'), ('1098', '4', '1476676800'), ('1098', '5', '1476676800'), ('1098', '6', '1476676800'), ('1136', '3', '1476676800'), ('1136', '4', '1476676800'), ('1136', '5', '1476676800'), ('1136', '6', '1476676800');
COMMIT;

-- ----------------------------
-- Table structure for `item_instance`
-- ----------------------------
DROP TABLE IF EXISTS `item_instance`;
CREATE TABLE `item_instance` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`itemEntry`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
`owner_guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`creatorGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`giftCreatorGuid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`count`  int(10) UNSIGNED NOT NULL DEFAULT 1 ,
`duration`  int(10) NOT NULL DEFAULT 0 ,
`charges`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`flags`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
`enchantments`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`randomPropertyId`  smallint(5) NOT NULL DEFAULT 0 ,
`reforgeID`  int(10) NOT NULL DEFAULT 0 ,
`transmogrifyId`  int(10) NOT NULL DEFAULT 0 ,
`durability`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`playedTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`text`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Item System'

;

-- ----------------------------
-- Records of item_instance
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `item_loot_items`
-- ----------------------------
DROP TABLE IF EXISTS `item_loot_items`;
CREATE TABLE `item_loot_items` (
`container_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'guid of container (item_instance.guid)' ,
`item_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'loot item entry (item_instance.itemEntry)' ,
`item_count`  int(10) NOT NULL DEFAULT 0 COMMENT 'stack size' ,
`follow_rules`  tinyint(1) NOT NULL DEFAULT 0 COMMENT 'follow loot rules' ,
`ffa`  tinyint(1) NOT NULL DEFAULT 0 COMMENT 'free-for-all' ,
`blocked`  tinyint(1) NOT NULL DEFAULT 0 ,
`counted`  tinyint(1) NOT NULL DEFAULT 0 ,
`under_threshold`  tinyint(1) NOT NULL DEFAULT 0 ,
`needs_quest`  tinyint(1) NOT NULL DEFAULT 0 COMMENT 'quest drop' ,
`rnd_prop`  int(10) NOT NULL DEFAULT 0 COMMENT 'random enchantment added when originally rolled' ,
`rnd_suffix`  int(10) NOT NULL DEFAULT 0 COMMENT 'random suffix added when originally rolled' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of item_loot_items
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `item_loot_money`
-- ----------------------------
DROP TABLE IF EXISTS `item_loot_money`;
CREATE TABLE `item_loot_money` (
`container_id`  int(10) NOT NULL DEFAULT 0 COMMENT 'guid of container (item_instance.guid)' ,
`money`  int(10) NOT NULL DEFAULT 0 COMMENT 'money loot (in copper)' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Records of item_loot_money
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `item_refund_instance`
-- ----------------------------
DROP TABLE IF EXISTS `item_refund_instance`;
CREATE TABLE `item_refund_instance` (
`item_guid`  int(10) UNSIGNED NOT NULL COMMENT 'Item GUID' ,
`player_guid`  int(10) UNSIGNED NOT NULL COMMENT 'Player GUID' ,
`paidMoney`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`paidExtendedCost`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`item_guid`, `player_guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Item Refund System'

;

-- ----------------------------
-- Records of item_refund_instance
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `item_soulbound_trade_data`
-- ----------------------------
DROP TABLE IF EXISTS `item_soulbound_trade_data`;
CREATE TABLE `item_soulbound_trade_data` (
`itemGuid`  int(10) UNSIGNED NOT NULL COMMENT 'Item GUID' ,
`allowedPlayers`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade' ,
PRIMARY KEY (`itemGuid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Item Refund System'

;

-- ----------------------------
-- Records of item_soulbound_trade_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `lag_reports`
-- ----------------------------
DROP TABLE IF EXISTS `lag_reports`;
CREATE TABLE `lag_reports` (
`reportId`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`lagType`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`mapId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`posX`  float NOT NULL DEFAULT 0 ,
`posY`  float NOT NULL DEFAULT 0 ,
`posZ`  float NOT NULL DEFAULT 0 ,
`latency`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`createTime`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`reportId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player System'
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of lag_reports
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `lfg_data`
-- ----------------------------
DROP TABLE IF EXISTS `lfg_data`;
CREATE TABLE `lfg_data` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`dungeon`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`state`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='LFG Data'

;

-- ----------------------------
-- Records of lfg_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `mail`
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
`id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Identifier' ,
`messageType`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`stationery`  tinyint(3) NOT NULL DEFAULT 41 ,
`mailTemplateId`  smallint(5) UNSIGNED NOT NULL DEFAULT 0 ,
`sender`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier' ,
`receiver`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier' ,
`subject`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`body`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`has_items`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
`expire_time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`deliver_time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`money`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`cod`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`checked`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Mail System'

;

-- ----------------------------
-- Records of mail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `mail_items`
-- ----------------------------
DROP TABLE IF EXISTS `mail_items`;
CREATE TABLE `mail_items` (
`mail_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`item_guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`receiver`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier' ,
PRIMARY KEY (`item_guid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of mail_items
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `pet_aura`
-- ----------------------------
DROP TABLE IF EXISTS `pet_aura`;
CREATE TABLE `pet_aura` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`caster_guid`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Full Global Unique Identifier' ,
`spell`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 ,
`effect_mask`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`recalculate_mask`  int(10) UNSIGNED NULL DEFAULT 0 ,
`stackcount`  tinyint(3) UNSIGNED NOT NULL DEFAULT 1 ,
`amount0`  mediumint(8) NOT NULL ,
`amount1`  mediumint(8) NOT NULL ,
`amount2`  mediumint(8) NOT NULL ,
`base_amount0`  mediumint(8) NOT NULL ,
`base_amount1`  mediumint(8) NOT NULL ,
`base_amount2`  mediumint(8) NOT NULL ,
`maxduration`  int(11) NOT NULL DEFAULT 0 ,
`remaintime`  int(11) NOT NULL DEFAULT 0 ,
`remaincharges`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `spell`, `effect_mask`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Pet System'

;

-- ----------------------------
-- Records of pet_aura
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `pet_spell`
-- ----------------------------
DROP TABLE IF EXISTS `pet_spell`;
CREATE TABLE `pet_spell` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier' ,
`spell`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier' ,
`active`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `spell`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Pet System'

;

-- ----------------------------
-- Records of pet_spell
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `pet_spell_cooldown`
-- ----------------------------
DROP TABLE IF EXISTS `pet_spell_cooldown`;
CREATE TABLE `pet_spell_cooldown` (
`guid`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part' ,
`spell`  mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Spell Identifier' ,
`time`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`guid`, `spell`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of pet_spell_cooldown
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `petition`
-- ----------------------------
DROP TABLE IF EXISTS `petition`;
CREATE TABLE `petition` (
`ownerguid`  int(10) UNSIGNED NOT NULL ,
`petitionguid`  int(10) UNSIGNED NULL DEFAULT 0 ,
`name`  varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`ownerguid`, `type`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Guild System'

;

-- ----------------------------
-- Records of petition
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `petition_sign`
-- ----------------------------
DROP TABLE IF EXISTS `petition_sign`;
CREATE TABLE `petition_sign` (
`ownerguid`  int(10) UNSIGNED NOT NULL ,
`petitionguid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`playerguid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`player_account`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`type`  tinyint(3) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`petitionguid`, `playerguid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Guild System'

;

-- ----------------------------
-- Records of petition_sign
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `pool_quest_save`
-- ----------------------------
DROP TABLE IF EXISTS `pool_quest_save`;
CREATE TABLE `pool_quest_save` (
`pool_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`quest_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
PRIMARY KEY (`pool_id`, `quest_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of pool_quest_save
-- ----------------------------
BEGIN;
INSERT INTO `pool_quest_save` VALUES ('348', '24636'), ('349', '14101'), ('350', '13905'), ('351', '13916'), ('352', '11379'), ('353', '11667'), ('354', '13424'), ('356', '11363'), ('357', '11389'), ('358', '25162'), ('359', '25156'), ('360', '29365'), ('361', '26235'), ('362', '29334'), ('363', '26192'), ('364', '29353'), ('365', '29314'), ('366', '26543'), ('367', '29345'), ('368', '29320'), ('369', '26488'), ('370', '29350'), ('371', '29325'), ('372', '28059'), ('372', '28130'), ('373', '27949'), ('373', '27992'), ('374', '27987'), ('374', '27991'), ('375', '27944'), ('375', '27948'), ('376', '28682'), ('376', '28685'), ('377', '28678'), ('377', '28681'), ('378', '28694'), ('378', '28697'), ('379', '28689'), ('379', '28692'), ('380', '12737'), ('381', '12761'), ('382', '12758'), ('383', '12759'), ('5662', '13674'), ('5663', '13764'), ('5664', '13770'), ('5665', '13773'), ('5666', '13780'), ('5667', '13784'), ('5668', '13670'), ('5669', '13616'), ('5670', '13741'), ('5671', '13746'), ('5672', '13758'), ('5673', '13753'), ('5674', '13101'), ('5675', '13114'), ('5676', '13830'), ('5677', '12961'), ('5678', '24579');
COMMIT;

-- ----------------------------
-- Table structure for `reserved_name`
-- ----------------------------
DROP TABLE IF EXISTS `reserved_name`;
CREATE TABLE `reserved_name` (
`name`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
PRIMARY KEY (`name`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Player Reserved Names'

;

-- ----------------------------
-- Records of reserved_name
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `warden_action`
-- ----------------------------
DROP TABLE IF EXISTS `warden_action`;
CREATE TABLE `warden_action` (
`wardenId`  smallint(5) UNSIGNED NOT NULL ,
`action`  tinyint(3) UNSIGNED NULL DEFAULT NULL ,
PRIMARY KEY (`wardenId`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of warden_action
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `worldstates`
-- ----------------------------
DROP TABLE IF EXISTS `worldstates`;
CREATE TABLE `worldstates` (
`entry`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`value`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`comment`  tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
PRIMARY KEY (`entry`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='Variable Saves'

;

-- ----------------------------
-- Records of worldstates
-- ----------------------------
BEGIN;
INSERT INTO `worldstates` VALUES ('3781', '9000000', null), ('3801', '0', null), ('3802', '1', null), ('20001', '1476612000', null), ('20002', '1476675959', null), ('20003', '1476093600', null), ('20006', '1476093600', null), ('20007', '1477972800', null), ('20050', '1', null);
COMMIT;

-- ----------------------------
-- Indexes structure for table auctionhouse
-- ----------------------------
CREATE UNIQUE INDEX `item_guid` ON `auctionhouse`(`itemguid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table banned_addons
-- ----------------------------
CREATE UNIQUE INDEX `idx_name_ver` ON `banned_addons`(`Name`, `Version`) USING BTREE ;

-- ----------------------------
-- Auto increment value for `banned_addons`
-- ----------------------------
ALTER TABLE `banned_addons` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `bugreport`
-- ----------------------------
ALTER TABLE `bugreport` AUTO_INCREMENT=1;

-- ----------------------------
-- Indexes structure for table character_cuf_profiles
-- ----------------------------
CREATE INDEX `index` ON `character_cuf_profiles`(`id`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_equipmentsets
-- ----------------------------
CREATE UNIQUE INDEX `idx_set` ON `character_equipmentsets`(`guid`, `setguid`, `setindex`) USING BTREE ;
CREATE INDEX `Idx_setindex` ON `character_equipmentsets`(`setindex`) USING BTREE ;

-- ----------------------------
-- Auto increment value for `character_equipmentsets`
-- ----------------------------
ALTER TABLE `character_equipmentsets` AUTO_INCREMENT=1;

-- ----------------------------
-- Indexes structure for table character_gifts
-- ----------------------------
CREATE INDEX `idx_guid` ON `character_gifts`(`guid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_instance
-- ----------------------------
CREATE INDEX `instance` ON `character_instance`(`instance`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_inventory
-- ----------------------------
CREATE UNIQUE INDEX `guid` ON `character_inventory`(`guid`, `bag`, `slot`) USING BTREE ;
CREATE INDEX `idx_guid` ON `character_inventory`(`guid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_pet
-- ----------------------------
CREATE INDEX `owner` ON `character_pet`(`owner`) USING BTREE ;
CREATE INDEX `idx_slot` ON `character_pet`(`slot`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_pet_declinedname
-- ----------------------------
CREATE INDEX `owner_key` ON `character_pet_declinedname`(`owner`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_queststatus_daily
-- ----------------------------
CREATE INDEX `idx_guid` ON `character_queststatus_daily`(`guid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_queststatus_monthly
-- ----------------------------
CREATE INDEX `idx_guid` ON `character_queststatus_monthly`(`guid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_queststatus_seasonal
-- ----------------------------
CREATE INDEX `idx_guid` ON `character_queststatus_seasonal`(`guid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_queststatus_weekly
-- ----------------------------
CREATE INDEX `idx_guid` ON `character_queststatus_weekly`(`guid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_social
-- ----------------------------
CREATE INDEX `friend` ON `character_social`(`friend`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table character_void_storage
-- ----------------------------
CREATE UNIQUE INDEX `idx_player_slot` ON `character_void_storage`(`playerGuid`, `slot`) USING BTREE ;
CREATE INDEX `idx_player` ON `character_void_storage`(`playerGuid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table characters
-- ----------------------------
CREATE INDEX `idx_account` ON `characters`(`account`) USING BTREE ;
CREATE INDEX `idx_online` ON `characters`(`online`) USING BTREE ;
CREATE INDEX `idx_name` ON `characters`(`name`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table corpse
-- ----------------------------
CREATE INDEX `idx_type` ON `corpse`(`corpseType`) USING BTREE ;
CREATE INDEX `idx_instance` ON `corpse`(`instanceId`) USING BTREE ;
CREATE INDEX `idx_player` ON `corpse`(`guid`) USING BTREE ;
CREATE INDEX `idx_time` ON `corpse`(`time`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table creature_respawn
-- ----------------------------
CREATE INDEX `idx_instance` ON `creature_respawn`(`instanceId`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table gameobject_respawn
-- ----------------------------
CREATE INDEX `idx_instance` ON `gameobject_respawn`(`instanceId`) USING BTREE ;

-- ----------------------------
-- Auto increment value for `gm_subsurveys`
-- ----------------------------
ALTER TABLE `gm_subsurveys` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `gm_surveys`
-- ----------------------------
ALTER TABLE `gm_surveys` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `gm_tickets`
-- ----------------------------
ALTER TABLE `gm_tickets` AUTO_INCREMENT=1;

-- ----------------------------
-- Indexes structure for table group_instance
-- ----------------------------
CREATE INDEX `instance` ON `group_instance`(`instance`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table groups
-- ----------------------------
CREATE INDEX `leaderGuid` ON `groups`(`leaderGuid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_bank_eventlog
-- ----------------------------
CREATE INDEX `guildid_key` ON `guild_bank_eventlog`(`guildid`) USING BTREE ;
CREATE INDEX `Idx_PlayerGuid` ON `guild_bank_eventlog`(`PlayerGuid`) USING BTREE ;
CREATE INDEX `Idx_LogGuid` ON `guild_bank_eventlog`(`LogGuid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_bank_item
-- ----------------------------
CREATE INDEX `guildid_key` ON `guild_bank_item`(`guildid`) USING BTREE ;
CREATE INDEX `Idx_item_guid` ON `guild_bank_item`(`item_guid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_bank_right
-- ----------------------------
CREATE INDEX `guildid_key` ON `guild_bank_right`(`guildid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_bank_tab
-- ----------------------------
CREATE INDEX `guildid_key` ON `guild_bank_tab`(`guildid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_eventlog
-- ----------------------------
CREATE INDEX `Idx_PlayerGuid1` ON `guild_eventlog`(`PlayerGuid1`) USING BTREE ;
CREATE INDEX `Idx_PlayerGuid2` ON `guild_eventlog`(`PlayerGuid2`) USING BTREE ;
CREATE INDEX `Idx_LogGuid` ON `guild_eventlog`(`LogGuid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_finder_applicant
-- ----------------------------
CREATE UNIQUE INDEX `guildId` ON `guild_finder_applicant`(`guildId`, `playerGuid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_member
-- ----------------------------
CREATE UNIQUE INDEX `guid_key` ON `guild_member`(`guid`) USING BTREE ;
CREATE INDEX `guildid_key` ON `guild_member`(`guildid`) USING BTREE ;
CREATE INDEX `guildid_rank_key` ON `guild_member`(`guildid`, `rank`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_newslog
-- ----------------------------
CREATE INDEX `guildid_key` ON `guild_newslog`(`guildid`) USING BTREE ;
CREATE INDEX `Idx_PlayerGuid` ON `guild_newslog`(`PlayerGuid`) USING BTREE ;
CREATE INDEX `Idx_LogGuid` ON `guild_newslog`(`LogGuid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table guild_rank
-- ----------------------------
CREATE INDEX `Idx_rid` ON `guild_rank`(`rid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table instance
-- ----------------------------
CREATE INDEX `map` ON `instance`(`map`) USING BTREE ;
CREATE INDEX `resettime` ON `instance`(`resettime`) USING BTREE ;
CREATE INDEX `difficulty` ON `instance`(`difficulty`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table instance_reset
-- ----------------------------
CREATE INDEX `difficulty` ON `instance_reset`(`difficulty`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table item_instance
-- ----------------------------
CREATE INDEX `idx_owner_guid` ON `item_instance`(`owner_guid`) USING BTREE ;

-- ----------------------------
-- Auto increment value for `lag_reports`
-- ----------------------------
ALTER TABLE `lag_reports` AUTO_INCREMENT=1;

-- ----------------------------
-- Indexes structure for table mail
-- ----------------------------
CREATE INDEX `idx_receiver` ON `mail`(`receiver`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table mail_items
-- ----------------------------
CREATE INDEX `idx_receiver` ON `mail_items`(`receiver`) USING BTREE ;
CREATE INDEX `idx_mail_id` ON `mail_items`(`mail_id`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table petition
-- ----------------------------
CREATE UNIQUE INDEX `index_ownerguid_petitionguid` ON `petition`(`ownerguid`, `petitionguid`) USING BTREE ;

-- ----------------------------
-- Indexes structure for table petition_sign
-- ----------------------------
CREATE INDEX `Idx_playerguid` ON `petition_sign`(`playerguid`) USING BTREE ;
CREATE INDEX `Idx_ownerguid` ON `petition_sign`(`ownerguid`) USING BTREE ;
