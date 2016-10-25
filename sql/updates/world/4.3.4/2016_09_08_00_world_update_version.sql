-- Update Version DC-DB
-- By Bodeguero for DeathCore.

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `version`
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `core_version` varchar(120) NOT NULL DEFAULT '' COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) DEFAULT NULL,
  `db_version` varchar(120) DEFAULT NULL COMMENT 'Version of world DB.',
  `cache_id` int(11) DEFAULT '0',
  PRIMARY KEY (`core_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Version Notes';

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('DeathCore rev. 07-09-2016 19:24:00 +4.3.4 (Arquivado) (Win32, Release)', 'Arquivado', 'DC-DB 434.13', '1');
