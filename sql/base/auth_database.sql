/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.24 : Database - auth
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;
/*!40101 SET SQL_MODE=''*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `hasBoost` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Account System';

/*Table structure for table `account_access` */

DROP TABLE IF EXISTS `account_access`;

CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  `vipTime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vipComment` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `account_banned` */

DROP TABLE IF EXISTS `account_banned`;

CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

/*Data for the table `account_banned` */

/*Table structure for table `account_muted` */

DROP TABLE IF EXISTS `account_muted`;

CREATE TABLE `account_muted` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int(10) unsigned NOT NULL DEFAULT '0',
  `mutetime` int(10) unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mute List';

/*Data for the table `account_muted` */

/*Table structure for table `account_premium` */

DROP TABLE IF EXISTS `account_premium`;

CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL DEFAULT '0',
  `unsetdate` bigint(40) NOT NULL DEFAULT '0',
  `premium_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`setdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Premium Accounts';

/*Data for the table `account_premium` */

/*Table structure for table `account_punishment` */

DROP TABLE IF EXISTS `account_punishment`;

CREATE TABLE `account_punishment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(11) unsigned NOT NULL,
  `by` int(11) NOT NULL,
  `penalty_points` int(11) unsigned NOT NULL,
  `comment` varchar(255) NOT NULL,
  `time` bigint(20) unsigned NOT NULL,
  `active` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

/*Data for the table `account_punishment` */

/*Table structure for table `account_spell` */

DROP TABLE IF EXISTS `account_spell`;

CREATE TABLE `account_spell` (
  `accountId` int(11) NOT NULL,
  `spell` int(10) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountId`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account_spell` */

/*Table structure for table `account_strafe` */

DROP TABLE IF EXISTS `account_strafe`;

CREATE TABLE `account_strafe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(11) unsigned NOT NULL,
  `by` int(11) NOT NULL,
  `strafpunkte` int(11) unsigned NOT NULL,
  `comment` varchar(255) NOT NULL,
  `time` bigint(20) unsigned NOT NULL,
  `active` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

/*Data for the table `account_strafe` */

/*Table structure for table `account_tempban` */

DROP TABLE IF EXISTS `account_tempban`;

CREATE TABLE `account_tempban` (
  `accountId` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `account_tempban` */

/*Table structure for table `account_verwarnung` */

DROP TABLE IF EXISTS `account_verwarnung`;

CREATE TABLE `account_verwarnung` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accountId` int(11) unsigned NOT NULL,
  `by_account` int(11) unsigned NOT NULL,
  `comment` varchar(255) NOT NULL,
  `time` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

/*Data for the table `account_verwarnung` */

/*Table structure for table `account_warning` */

DROP TABLE IF EXISTS `account_warning`;

CREATE TABLE `account_warning` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accountId` int(11) unsigned NOT NULL,
  `by_account` int(11) unsigned NOT NULL,
  `comment` varchar(255) NOT NULL,
  `time` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

/*Data for the table `account_warning` */

/*Table structure for table `accounts_to_delete` */

DROP TABLE IF EXISTS `accounts_to_delete`;

CREATE TABLE `accounts_to_delete` (
  `id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Account System';

/*Data for the table `accounts_to_delete` */

/*Table structure for table `autobroadcast` */

DROP TABLE IF EXISTS `autobroadcast`;

CREATE TABLE `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `autobroadcast` */

insert  into `autobroadcast`(`realmid`,`id`,`weight`,`text`) values (-1,1,1,'Bem Vindos ao DeathCore Servers Open Source Emulator');

/*Table structure for table `bug_tickets` */

DROP TABLE IF EXISTS `bug_tickets`;

CREATE TABLE `bug_tickets` (
  `ticketId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `realm` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `message` text NOT NULL,
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  `pool` varchar(32) NOT NULL,
  `mapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `closedBy` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketId`)
) ENGINE=MyISAM AUTO_INCREMENT=310 DEFAULT CHARSET=utf8 COMMENT='Support System';

/*Data for the table `bug_tickets` */

/*Table structure for table `ip2nation` */

DROP TABLE IF EXISTS `ip2nation`;

CREATE TABLE `ip2nation` (
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ip2nation` */

/*Table structure for table `ip2nationcountries` */

DROP TABLE IF EXISTS `ip2nationcountries`;

CREATE TABLE `ip2nationcountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ip2nationcountries` */

/*Table structure for table `ip_banned` */

DROP TABLE IF EXISTS `ip_banned`;

CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

/*Data for the table `ip_banned` */

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` varchar(250) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `logs` */

/*Table structure for table `logs_ip_actions` */

DROP TABLE IF EXISTS `logs_ip_actions`;

CREATE TABLE `logs_ip_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int(10) unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` int(10) unsigned NOT NULL COMMENT 'Character Guid',
  `type` tinyint(3) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text COMMENT 'Notes inserted by system',
  `unixtime` int(10) unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used to log ips of individual actions';

/*Data for the table `logs_ip_actions` */

/*Table structure for table `quest_completer` */

DROP TABLE IF EXISTS `quest_completer`;

CREATE TABLE `quest_completer` (
  `id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `quest_completer` */

/*Table structure for table `rbac_account_permissions` */

DROP TABLE IF EXISTS `rbac_account_permissions`;

CREATE TABLE `rbac_account_permissions` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`) USING BTREE,
  CONSTRAINT `rbac_account_permissions_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rbac_account_permissions_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Permission relation';

/*Data for the table `rbac_account_permissions` */

/*Table structure for table `rbac_default_permissions` */

DROP TABLE IF EXISTS `rbac_default_permissions`;

CREATE TABLE `rbac_default_permissions` (
  `secId` int(10) unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'permission id',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`) USING BTREE,
  CONSTRAINT `rbac_default_permissions_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default permission to assign to different account security levels';

/*Data for the table `rbac_default_permissions` */

insert  into `rbac_default_permissions`(`secId`,`permissionId`,`realmId`) values (4,190,-1),(3,191,-1),(2,192,-1),(1,193,-1),(0,194,-1);

/*Table structure for table `rbac_linked_permissions` */

DROP TABLE IF EXISTS `rbac_linked_permissions`;

CREATE TABLE `rbac_linked_permissions` (
  `id` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int(10) unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`) USING BTREE,
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`) USING BTREE,
  CONSTRAINT `rbac_linked_permissions_ibfk_1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rbac_linked_permissions_ibfk_2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission - Linked Permission relation';

/*Data for the table `rbac_linked_permissions` */

insert  into `rbac_linked_permissions`(`id`,`linkedId`) values (190,21),(190,42),(190,43),(190,191),(190,195),(190,787),(190,788),(190,789),(190,790),(190,791),(190,792),(190,793),(190,794),(190,795),(190,796),(190,835),(190,1001),(190,1002),(190,1003),(190,1004),(191,48),(191,192),(191,196),(191,1001),(191,1002),(192,1),(192,2),(192,11),(192,13),(192,14),(192,15),(192,16),(192,17),(192,18),(192,19),(192,20),(192,22),(192,23),(192,25),(192,26),(192,27),(192,28),(192,29),(192,30),(192,31),(192,32),(192,33),(192,34),(192,35),(192,36),(192,37),(192,38),(192,39),(192,40),(192,41),(192,44),(192,46),(192,47),(192,51),(192,193),(192,197),(192,632),(192,798),(192,1001),(192,1002),(193,194),(193,198),(193,1001),(193,1002),(194,3),(194,4),(194,5),(194,6),(194,24),(194,28),(194,49),(194,199),(194,1002),(195,200),(195,201),(195,226),(195,227),(195,230),(195,231),(195,233),(195,234),(195,235),(195,238),(195,239),(195,240),(195,241),(195,242),(195,243),(195,244),(195,245),(195,246),(195,247),(195,248),(195,249),(195,250),(195,251),(195,252),(195,253),(195,254),(195,255),(195,256),(195,257),(195,258),(195,259),(195,260),(195,261),(195,262),(195,264),(195,265),(195,266),(195,267),(195,268),(195,269),(195,270),(195,271),(195,272),(195,279),(195,280),(195,283),(195,287),(195,288),(195,289),(195,290),(195,291),(195,292),(195,293),(195,294),(195,295),(195,296),(195,297),(195,298),(195,299),(195,302),(195,303),(195,304),(195,305),(195,306),(195,307),(195,308),(195,309),(195,310),(195,313),(195,314),(195,319),(195,320),(195,321),(195,322),(195,323),(195,324),(195,325),(195,326),(195,327),(195,328),(195,329),(195,330),(195,331),(195,332),(195,333),(195,334),(195,335),(195,336),(195,337),(195,338),(195,339),(195,340),(195,341),(195,342),(195,343),(195,344),(195,345),(195,346),(195,347),(195,348),(195,349),(195,350),(195,351),(195,352),(195,353),(195,354),(195,355),(195,356),(195,357),(195,358),(195,359),(195,360),(195,361),(195,362),(195,363),(195,364),(195,365),(195,366),(195,373),(195,375),(195,400),(195,401),(195,402),(195,403),(195,404),(195,405),(195,406),(195,407),(195,417),(195,418),(195,419),(195,420),(195,421),(195,422),(195,423),(195,424),(195,425),(195,426),(195,427),(195,428),(195,429),(195,434),(195,435),(195,436),(195,437),(195,438),(195,439),(195,440),(195,441),(195,442),(195,443),(195,444),(195,445),(195,446),(195,447),(195,448),(195,449),(195,450),(195,451),(195,452),(195,453),(195,454),(195,455),(195,456),(195,457),(195,458),(195,459),(195,461),(195,463),(195,464),(195,465),(195,472),(195,473),(195,474),(195,475),(195,476),(195,477),(195,478),(195,488),(195,489),(195,491),(195,492),(195,493),(195,495),(195,497),(195,498),(195,499),(195,500),(195,502),(195,503),(195,505),(195,508),(195,511),(195,513),(195,514),(195,516),(195,519),(195,522),(195,523),(195,526),(195,527),(195,529),(195,530),(195,533),(195,535),(195,536),(195,537),(195,538),(195,539),(195,540),(195,541),(195,556),(195,581),(195,582),(195,592),(195,593),(195,596),(195,602),(195,603),(195,604),(195,605),(195,606),(195,607),(195,608),(195,609),(195,610),(195,611),(195,612),(195,613),(195,614),(195,615),(195,616),(195,617),(195,618),(195,619),(195,620),(195,621),(195,622),(195,623),(195,624),(195,625),(195,626),(195,627),(195,628),(195,629),(195,630),(195,633),(195,634),(195,635),(195,636),(195,637),(195,638),(195,639),(195,640),(195,641),(195,642),(195,643),(195,644),(195,645),(195,646),(195,647),(195,648),(195,649),(195,650),(195,651),(195,652),(195,653),(195,654),(195,655),(195,656),(195,657),(195,658),(195,659),(195,660),(195,661),(195,662),(195,663),(195,664),(195,665),(195,666),(195,667),(195,668),(195,669),(195,670),(195,671),(195,672),(195,673),(195,674),(195,675),(195,676),(195,677),(195,678),(195,679),(195,680),(195,681),(195,682),(195,683),(195,684),(195,685),(195,686),(195,687),(195,688),(195,689),(195,690),(195,691),(195,692),(195,693),(195,694),(195,695),(195,696),(195,697),(195,698),(195,699),(195,700),(195,701),(195,702),(195,703),(195,704),(195,705),(195,706),(195,707),(195,708),(195,709),(195,710),(195,711),(195,712),(195,713),(195,714),(195,715),(195,716),(195,717),(195,718),(195,719),(195,721),(195,722),(195,723),(195,724),(195,725),(195,726),(195,727),(195,728),(195,729),(195,730),(195,733),(195,734),(195,735),(195,736),(195,738),(195,739),(195,748),(195,753),(195,757),(195,773),(195,1001),(195,1002),(195,1003),(195,1004),(196,232),(196,236),(196,237),(196,273),(196,274),(196,275),(196,276),(196,277),(196,284),(196,285),(196,286),(196,301),(196,311),(196,387),(196,388),(196,389),(196,390),(196,391),(196,392),(196,393),(196,394),(196,395),(196,396),(196,397),(196,398),(196,399),(196,479),(196,480),(196,481),(196,482),(196,485),(196,486),(196,487),(196,494),(196,506),(196,509),(196,510),(196,517),(196,518),(196,521),(196,542),(196,543),(196,550),(196,558),(196,568),(196,571),(196,572),(196,573),(196,574),(196,575),(196,576),(196,577),(196,578),(196,579),(196,580),(196,583),(196,584),(196,585),(196,586),(196,587),(196,588),(196,589),(196,590),(196,591),(196,594),(196,595),(196,601),(196,743),(196,750),(196,758),(196,761),(196,762),(196,763),(196,764),(196,765),(196,766),(196,767),(196,768),(196,769),(196,770),(196,771),(196,772),(196,774),(196,836),(196,1001),(196,1002),(197,218),(197,300),(197,312),(197,315),(197,316),(197,317),(197,318),(197,367),(197,368),(197,369),(197,370),(197,371),(197,372),(197,374),(197,376),(197,377),(197,378),(197,379),(197,380),(197,381),(197,382),(197,383),(197,384),(197,385),(197,386),(197,408),(197,409),(197,410),(197,411),(197,412),(197,413),(197,414),(197,415),(197,416),(197,430),(197,431),(197,432),(197,433),(197,462),(197,466),(197,467),(197,468),(197,469),(197,470),(197,471),(197,483),(197,484),(197,490),(197,504),(197,512),(197,515),(197,520),(197,524),(197,528),(197,531),(197,532),(197,544),(197,545),(197,546),(197,547),(197,548),(197,549),(197,551),(197,552),(197,553),(197,554),(197,555),(197,557),(197,559),(197,560),(197,561),(197,562),(197,563),(197,564),(197,565),(197,566),(197,567),(197,569),(197,570),(197,597),(197,598),(197,599),(197,600),(197,737),(197,740),(197,741),(197,742),(197,744),(197,745),(197,746),(197,747),(197,749),(197,751),(197,752),(197,754),(197,755),(197,756),(197,759),(197,760),(197,1001),(197,1002),(198,631),(198,777),(198,778),(198,779),(198,780),(198,781),(198,782),(198,783),(198,784),(198,785),(198,786),(198,1001),(198,1002),(199,28),(199,217),(199,221),(199,222),(199,223),(199,225),(199,263),(199,496),(199,501),(199,507),(199,525),(199,534),(199,797),(199,1002);

/*Table structure for table `rbac_permissions` */

DROP TABLE IF EXISTS `rbac_permissions`;

CREATE TABLE `rbac_permissions` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';

/*Data for the table `rbac_permissions` */

insert  into `rbac_permissions`(`id`,`name`) values (1,'Instant logout'),(2,'Skip Queue'),(3,'Join Normal Battleground'),(4,'Join Random Battleground'),(5,'Join Arenas'),(6,'Join Dungeon Finder'),(11,'Log GM trades'),(13,'Skip Instance required bosses check'),(14,'Skip character creation team mask check'),(15,'Skip character creation class mask check'),(16,'Skip character creation race mask check'),(17,'Skip character creation reserved name check'),(18,'Skip character creation heroic min level check'),(19,'Skip needed requirements to use channel check'),(20,'Skip disable map check'),(21,'Skip reset talents when used more than allowed check'),(22,'Skip spam chat check'),(23,'Skip over-speed ping check'),(24,'Two side faction characters on the same account'),(25,'Allow say chat between factions'),(26,'Allow channel chat between factions'),(27,'Two side mail interaction'),(28,'See two side who list'),(29,'Add friends of other faction'),(30,'Save character without delay with .save command'),(31,'Use params with .unstuck command'),(32,'Can be assigned tickets with .assign ticket command'),(33,'Notify if a command was not found'),(34,'Check if should appear in list using .gm ingame command'),(35,'See all security levels with who command'),(36,'Filter whispers'),(37,'Use staff badge in chat'),(38,'Resurrect with full Health Points'),(39,'Restore saved gm setting states'),(40,'Allows to add a gm to friend list'),(41,'Use Config option START_GM_LEVEL to assign new character level'),(42,'Allows to use CMSG_WORLD_TELEPORT opcode'),(43,'Allows to use CMSG_WHOIS opcode'),(44,'Receive global GM messages/texts'),(45,'Join channels without announce'),(46,'Change channel settings without being channel moderator'),(47,'Enables lower security than target check'),(48,'Enable IP, Last Login and EMail output in pinfo'),(49,'Forces to enter the email for confirmation on password change'),(50,'Allow user to check his own email with .account'),(51,'Allow trading between factions'),(190,'Role: Sec Level Administrator'),(191,'Role: Sec Level Gamemaster'),(192,'Role: Sec Level Moderator'),(193,'Role: Sec Level Vip'),(194,'Role: Sec Level Player'),(195,'Role: Administrator Commands'),(196,'Role: Gamemaster Commands'),(197,'Role: Moderator Commands'),(198,'Role: Vip Commands'),(199,'Role: Player Commands'),(200,'Command: rbac'),(201,'Command: rbac account'),(202,'Command: rbac account list'),(203,'Command: rbac account grant'),(204,'Command: rbac account deny'),(205,'Command: rbac account revoke'),(206,'Command: rbac list'),(217,'Command: account'),(218,'Command: account addon'),(219,'Command: account create'),(220,'Command: account delete'),(221,'Command: account lock'),(222,'Command: account lock country'),(223,'Command: account lock ip'),(224,'Command: account onlinelist'),(225,'Command: account password'),(226,'Command: account set'),(227,'Command: account set addon'),(228,'Command: account set gmlevel'),(229,'Command: account set password'),(230,'Command: achievement'),(231,'Command: achievement add'),(232,'Command: arena'),(233,'Command: arena captain'),(234,'Command: arena create'),(235,'Command: arena disband'),(236,'Command: arena info'),(237,'Command: arena lookup'),(238,'Command: arena rename'),(239,'Command: ban'),(240,'Command: ban account'),(241,'Command: ban character'),(242,'Command: ban ip'),(243,'Command: ban playeraccount'),(244,'Command: baninfo'),(245,'Command: baninfo account'),(246,'Command: baninfo character'),(247,'Command: baninfo ip'),(248,'Command: banlist'),(249,'Command: banlist account'),(250,'Command: banlist character'),(251,'Command: banlist ip'),(252,'Command: unban'),(253,'Command: unban account'),(254,'Command: unban character'),(255,'Command: unban ip'),(256,'Command: unban playeraccount'),(257,'Command: bf'),(258,'Command: bf start'),(259,'Command: bf stop'),(260,'Command: bf switch'),(261,'Command: bf timer'),(262,'Command: bf enable'),(263,'Command: account email'),(264,'Command: account set sec'),(265,'Command: account set sec email'),(266,'Command: account set sec regmail'),(267,'Command: cast'),(268,'Command: cast back'),(269,'Command: cast dist'),(270,'Command: cast self'),(271,'Command: cast target'),(272,'Command: cast dest'),(273,'Command: character'),(274,'Command: character customize'),(275,'Command: character changefaction'),(276,'Command: character changerace'),(277,'Command: character deleted'),(279,'Command: character deleted list'),(280,'Command: character deleted restore'),(283,'Command: character level'),(284,'Command: character rename'),(285,'Command: character reputation'),(286,'Command: character titles'),(287,'Command: levelup'),(288,'Command: pdump'),(289,'Command: pdump load'),(290,'Command: pdump write'),(291,'Command: cheat'),(292,'Command: cheat casttime'),(293,'Command: cheat cooldown'),(294,'Command: cheat explore'),(295,'Command: cheat god'),(296,'Command: cheat power'),(297,'Command: cheat status'),(298,'Command: cheat taxi'),(299,'Command: cheat waterwalk'),(300,'Command: debug'),(301,'Command: debug anim'),(302,'Command: debug areatriggers'),(303,'Command: debug arena'),(304,'Command: debug bg'),(305,'Command: debug entervehicle'),(306,'Command: debug getitemstate'),(307,'Command: debug getitemvalue'),(308,'Command: debug getvalue'),(309,'Command: debug hostil'),(310,'Command: debug itemexpire'),(311,'Command: debug lootrecipient'),(312,'Command: debug los'),(313,'Command: debug mod32value'),(314,'Command: debug moveflags'),(315,'Command: debug play'),(316,'Command: debug play cinematics'),(317,'Command: debug play movie'),(318,'Command: debug play sound'),(319,'Command: debug send'),(320,'Command: debug send buyerror'),(321,'Command: debug send channelnotify'),(322,'Command: debug send chatmessage'),(323,'Command: debug send equiperror'),(324,'Command: debug send largepacket'),(325,'Command: debug send opcode'),(326,'Command: debug send qinvalidmsg'),(327,'Command: debug send qpartymsg'),(328,'Command: debug send sellerror'),(329,'Command: debug send setphaseshift'),(330,'Command: debug send spellfail'),(331,'Command: debug setaurastate'),(332,'Command: debug setbit'),(333,'Command: debug setitemvalue'),(334,'Command: debug setvalue'),(335,'Command: debug setvid'),(336,'Command: debug spawnvehicle'),(337,'Command: debug threat'),(338,'Command: debug update'),(339,'Command: debug uws'),(340,'Command: wpgps'),(341,'Command: deserter'),(342,'Command: deserter bg'),(343,'Command: deserter bg add'),(344,'Command: deserter bg remove'),(345,'Command: deserter instance'),(346,'Command: deserter instance add'),(347,'Command: deserter instance remove'),(348,'Command: disable'),(349,'Command: disable add'),(350,'Command: disable add achievement_criteria'),(351,'Command: disable add battleground'),(352,'Command: disable add map'),(353,'Command: disable add mmap'),(354,'Command: disable add outdoorpvp'),(355,'Command: disable add quest'),(356,'Command: disable add spell'),(357,'Command: disable add vmap'),(358,'Command: disable remove'),(359,'Command: disable remove achievement_criteria'),(360,'Command: disable remove battleground'),(361,'Command: disable remove map'),(362,'Command: disable remove mmap'),(363,'Command: disable remove outdoorpvp'),(364,'Command: disable remove quest'),(365,'Command: disable remove spell'),(366,'Command: disable remove vmap'),(367,'Command: event'),(368,'Command: event activelist'),(369,'Command: event start'),(370,'Command: event stop'),(371,'Command: gm'),(372,'Command: gm chat'),(373,'Command: gm fly'),(374,'Command: gm ingame'),(375,'Command: gm list'),(376,'Command: gm visible'),(377,'Command: go'),(378,'Command: go creature'),(379,'Command: go graveyard'),(380,'Command: go grid'),(381,'Command: go object'),(382,'Command: go taxinode'),(383,'Command: go ticket'),(384,'Command: go trigger'),(385,'Command: go xyz'),(386,'Command: go zonexy'),(387,'Command: gobject'),(388,'Command: gobject activate'),(389,'Command: gobject add'),(390,'Command: gobject add temp'),(391,'Command: gobject delete'),(392,'Command: gobject info'),(393,'Command: gobject move'),(394,'Command: gobject near'),(395,'Command: gobject set'),(396,'Command: gobject set phase'),(397,'Command: gobject set state'),(398,'Command: gobject target'),(399,'Command: gobject turn'),(400,'debug transport'),(401,'Command: guild'),(402,'Command: guild create'),(403,'Command: guild delete'),(404,'Command: guild invite'),(405,'Command: guild uninvite'),(406,'Command: guild rank'),(407,'Command: guild rename'),(408,'Command: honor'),(409,'Command: honor add'),(410,'Command: honor add kill'),(411,'Command: honor update'),(412,'Command: instance'),(413,'Command: instance listbinds'),(414,'Command: instance unbind'),(415,'Command: instance stats'),(416,'Command: instance savedata'),(417,'Command: learn'),(418,'Command: learn all'),(419,'Command: learn all my'),(420,'Command: learn all my class'),(421,'Command: learn all my pettalents'),(422,'Command: learn all my spells'),(423,'Command: learn all my talents'),(424,'Command: learn all gm'),(425,'Command: learn all crafts'),(426,'Command: learn all default'),(427,'Command: learn all lang'),(428,'Command: learn all recipes'),(429,'Command: unlearn'),(430,'Command: lfg'),(431,'Command: lfg player'),(432,'Command: lfg group'),(433,'Command: lfg queue'),(434,'Command: lfg clean'),(435,'Command: lfg options'),(436,'Command: list'),(437,'Command: list creature'),(438,'Command: list item'),(439,'Command: list object'),(440,'Command: list auras'),(441,'Command: list mail'),(442,'Command: lookup'),(443,'Command: lookup area'),(444,'Command: lookup creature'),(445,'Command: lookup event'),(446,'Command: lookup faction'),(447,'Command: lookup item'),(448,'Command: lookup itemset'),(449,'Command: lookup object'),(450,'Command: lookup quest'),(451,'Command: lookup player'),(452,'Command: lookup player ip'),(453,'Command: lookup player account'),(454,'Command: lookup player email'),(455,'Command: lookup skill'),(456,'Command: lookup spell'),(457,'Command: lookup spell id'),(458,'Command: lookup taxinode'),(459,'Command: lookup tele'),(460,'Command: lookup title'),(461,'Command: lookup map'),(462,'Command: announce'),(463,'Command: channel'),(464,'Command: channel set'),(465,'Command: channel set ownership'),(466,'Command: gmannounce'),(467,'Command: gmnameannounce'),(468,'Command: gmnotify'),(469,'Command: nameannounce'),(470,'Command: notify'),(471,'Command: whispers'),(472,'Command: group'),(473,'Command: group leader'),(474,'Command: group disband'),(475,'Command: group remove'),(476,'Command: group join'),(477,'Command: group list'),(478,'Command: group summon'),(479,'Command: pet'),(480,'Command: pet create'),(481,'Command: pet learn'),(482,'Command: pet unlearn'),(483,'Command: send'),(484,'Command: send items'),(485,'Command: send mail'),(486,'Command: send message'),(487,'Command: send money'),(488,'Command: additem'),(489,'Command: additemset'),(490,'Command: appear'),(491,'Command: aura'),(492,'Command: bank'),(493,'Command: bindsight'),(494,'Command: combatstop'),(495,'Command: cometome'),(496,'Command: commands'),(497,'Command: cooldown'),(498,'Command: damage'),(499,'Command: dev'),(500,'Command: die'),(501,'Command: dismount'),(502,'Command: distance'),(503,'Command: flusharenapoints'),(504,'Command: freeze'),(505,'Command: gps'),(506,'Command: guid'),(507,'Command: help'),(508,'Command: hidearea'),(509,'Command: itemmove'),(510,'Command: kick'),(511,'Command: linkgrave'),(512,'Command: listfreeze'),(513,'Command: maxskill'),(514,'Command: movegens'),(515,'Command: mute'),(516,'Command: neargrave'),(517,'Command: pinfo'),(518,'Command: playall'),(519,'Command: possess'),(520,'Command: recall'),(521,'Command: repairitems'),(522,'Command: respawn'),(523,'Command: revive'),(524,'Command: saveall'),(525,'Command: save'),(526,'Command: setskill'),(527,'Command: showarea'),(528,'Command: summon'),(529,'Command: unaura'),(530,'Command: unbindsight'),(531,'Command: unfreeze'),(532,'Command: unmute'),(533,'Command: unpossess'),(534,'Command: unstuck'),(535,'Command: wchange'),(536,'Command: mmap'),(537,'Command: mmap loadedtiles'),(538,'Command: mmap loc'),(539,'Command: mmap path'),(540,'Command: mmap stats'),(541,'Command: mmap testarea'),(542,'Command: morph'),(543,'Command: demorph'),(544,'Command: modify'),(545,'Command: modify arenapoints'),(546,'Command: modify bit'),(547,'Command: modify drunk'),(548,'Command: modify energy'),(549,'Command: modify faction'),(550,'Command: modify gender'),(551,'Command: modify honor'),(552,'Command: modify hp'),(553,'Command: modify mana'),(554,'Command: modify money'),(555,'Command: modify mount'),(556,'Command: modify phase'),(557,'Command: modify rage'),(558,'Command: modify reputation'),(559,'Command: modify runicpower'),(560,'Command: modify scale'),(561,'Command: modify speed'),(562,'Command: modify speed all'),(563,'Command: modify speed backwalk'),(564,'Command: modify speed fly'),(565,'Command: modify speed walk'),(566,'Command: modify speed swim'),(567,'Command: modify spell'),(568,'Command: modify standstate'),(569,'Command: modify talentpoints'),(570,'Command: npc'),(571,'Command: npc add'),(572,'Command: npc add formation'),(573,'Command: npc add item'),(574,'Command: npc add move'),(575,'Command: npc add temp'),(576,'Command: npc add delete'),(577,'Command: npc add delete item'),(578,'Command: npc add follow'),(579,'Command: npc add follow stop'),(580,'Command: npc set'),(581,'Command: npc set allowmove'),(582,'Command: npc set entry'),(583,'Command: npc set factionid'),(584,'Command: npc set flag'),(585,'Command: npc set level'),(586,'Command: npc set link'),(587,'Command: npc set model'),(588,'Command: npc set movetype'),(589,'Command: npc set phase'),(590,'Command: npc set spawndist'),(591,'Command: npc set spawntime'),(592,'Command: npc set data'),(593,'Command: npc info'),(594,'Command: npc near'),(595,'Command: npc move'),(596,'Command: npc playemote'),(597,'Command: npc say'),(598,'Command: npc textemote'),(599,'Command: npc whisper'),(600,'Command: npc yell'),(601,'Command: npc tame'),(602,'Command: quest'),(603,'Command: quest add'),(604,'Command: quest complete'),(605,'Command: quest remove'),(606,'Command: quest reward'),(607,'Command: reload'),(608,'Command: reload access_requirement'),(609,'Command: reload achievement_criteria_data'),(610,'Command: reload achievement_reward'),(611,'Command: reload all'),(612,'Command: reload all achievement'),(613,'Command: reload all area'),(614,'Command: broadcast_text'),(615,'Command: reload all gossips'),(616,'Command: reload all item'),(617,'Command: reload all locales'),(618,'Command: reload all loot'),(619,'Command: reload all npc'),(620,'Command: reload all quest'),(621,'Command: reload all scripts'),(622,'Command: reload all spell'),(623,'Command: reload areatrigger_involvedrelation'),(624,'Command: reload areatrigger_tavern'),(625,'Command: reload areatrigger_teleport'),(626,'Command: reload auctions'),(627,'Command: reload autobroadcast'),(628,'Command: reload command'),(629,'Command: reload conditions'),(630,'Command: reload config'),(631,'Command: .reload battleground_template'),(632,'Command: .mutehistory'),(633,'Command: reload creature_linked_respawn'),(634,'Command: reload creature_loot_template'),(635,'Command: reload creature_onkill_reputation'),(636,'Command: reload creature_questender'),(637,'Command: reload creature_queststarter'),(638,'Command: reload creature_summon_groups'),(639,'Command: reload creature_template'),(640,'Command: reload creature_text'),(641,'Command: reload disables'),(642,'Command: reload disenchant_loot_template'),(643,'Command: reload event_scripts'),(644,'Command: reload fishing_loot_template'),(645,'Command: reload game_graveyard_zone'),(646,'Command: reload game_tele'),(647,'Command: reload gameobject_questender'),(648,'Command: reload gameobject_loot_template'),(649,'Command: reload gameobject_queststarter'),(650,'Command: reload gm_tickets'),(651,'Command: reload gossip_menu'),(652,'Command: reload gossip_menu_option'),(653,'Command: reload item_enchantment_template'),(654,'Command: reload item_loot_template'),(655,'Command: reload item_set_names'),(656,'Command: reload lfg_dungeon_rewards'),(657,'Command: reload locales_achievement_reward'),(658,'Command: reload locales_creature'),(659,'Command: reload locales_creature_text'),(660,'Command: reload locales_gameobject'),(661,'Command: reload locales_gossip_menu_option'),(662,'Command: reload locales_item'),(663,'Command: reload locales_item_set_name'),(664,'Command: reload locales_npc_text'),(665,'Command: reload locales_page_text'),(666,'Command: reload locales_points_of_interest'),(667,'Command: reload locales_quest'),(668,'Command: reload mail_level_reward'),(669,'Command: reload mail_loot_template'),(670,'Command: reload milling_loot_template'),(671,'Command: reload npc_spellclick_spells'),(672,'Command: reload npc_trainer'),(673,'Command: reload npc_vendor'),(674,'Command: reload page_text'),(675,'Command: reload pickpocketing_loot_template'),(676,'Command: reload points_of_interest'),(677,'Command: reload prospecting_loot_template'),(678,'Command: reload quest_poi'),(679,'Command: reload quest_template'),(680,'Command: reload rbac'),(681,'Command: reload reference_loot_template'),(682,'Command: reload reserved_name'),(683,'Command: reload reputation_reward_rate'),(684,'Command: reload reputation_spillover_template'),(685,'Command: reload skill_discovery_template'),(686,'Command: reload skill_extra_item_template'),(687,'Command: reload skill_fishing_base_level'),(688,'Command: reload skinning_loot_template'),(689,'Command: reload smart_scripts'),(690,'Command: reload spell_required'),(691,'Command: reload spell_area'),(692,'Command: reload spell_bonus_data'),(693,'Command: reload spell_group'),(694,'Command: reload spell_learn_spell'),(695,'Command: reload spell_loot_template'),(696,'Command: reload spell_linked_spell'),(697,'Command: reload spell_pet_auras'),(698,'Command: reload spell_proc_event'),(699,'Command: reload spell_proc'),(700,'Command: reload spell_scripts'),(701,'Command: reload spell_target_position'),(702,'Command: reload spell_threats'),(703,'Command: reload spell_group_stack_rules'),(704,'Command: reload trinity_string'),(705,'Command: reload warden_action'),(706,'Command: reload waypoint_scripts'),(707,'Command: reload waypoint_data'),(708,'Command: reload vehicle_accessory'),(709,'Command: reload vehicle_template_accessory'),(710,'Command: reset'),(711,'Command: reset achievements'),(712,'Command: reset honor'),(713,'Command: reset level'),(714,'Command: reset spells'),(715,'Command: reset stats'),(716,'Command: reset talents'),(717,'Command: reset all'),(718,'Command: server'),(719,'Command: server corpses'),(720,'Command: server exit'),(721,'Command: server idlerestart'),(722,'Command: server idlerestart cancel'),(723,'Command: server idleshutdown'),(724,'Command: server idleshutdown cancel'),(725,'Command: server info'),(726,'Command: server plimit'),(727,'Command: server restart'),(728,'Command: server restart cancel'),(729,'Command: server set'),(730,'Command: server set closed'),(731,'Command: server set difftime'),(732,'Command: server set loglevel'),(733,'Command: server set motd'),(734,'Command: server shutdown'),(735,'Command: server shutdown cancel'),(736,'Command: server motd'),(737,'Command: tele'),(738,'Command: tele add'),(739,'Command: tele del'),(740,'Command: tele name'),(741,'Command: tele group'),(742,'Command: ticket'),(743,'Command: ticket assign'),(744,'Command: ticket close'),(745,'Command: ticket closedlist'),(746,'Command: ticket comment'),(747,'Command: ticket complete'),(748,'Command: ticket delete'),(749,'Command: ticket escalate'),(750,'Command: ticket escalatedlist'),(751,'Command: ticket list'),(752,'Command: ticket onlinelist'),(753,'Command: ticket reset'),(754,'Command: ticket response'),(755,'Command: ticket response append'),(756,'Command: ticket response appendln'),(757,'Command: ticket togglesystem'),(758,'Command: ticket unassign'),(759,'Command: ticket viewid'),(760,'Command: ticket viewname'),(761,'Command: titles'),(762,'Command: titles add'),(763,'Command: titles current'),(764,'Command: titles remove'),(765,'Command: titles set'),(766,'Command: titles set mask'),(767,'Command: wp'),(768,'Command: wp add'),(769,'Command: wp event'),(770,'Command: wp load'),(771,'Command: wp modify'),(772,'Command: wp unload'),(773,'Command: wp reload'),(774,'Command: wp show'),(777,'Command: .ticket bug'),(778,'Command: .ticket bug assign'),(779,'Command: .ticket bug close'),(780,'Command: .ticket bug closedlist'),(781,'Command: .ticket bug comment'),(782,'Command: .ticket bug delete'),(783,'Command: .ticket bug list'),(784,'Command: .ticket bug unassign'),(785,'Command: .ticket bug view'),(786,'Command: .ticket bug reset'),(787,'Command: ahbot ratio'),(788,'Command: ahbot ratio alliance'),(789,'Command: ahbot ratio horde'),(790,'Command: ahbot ratio neutral'),(791,'Command: ahbot rebuild'),(792,'Command: ahbot reload'),(793,'Command: ahbot status'),(794,'Command: .guild info'),(795,'Command: .instance setbossstate'),(796,'Command: instance getbossstate'),(797,'Command: pvpstats'),(798,'Command: .mod xp'),(835,'Command: debug loadcells'),(836,'Command: .debug boundary'),(1001,'Command Vip'),(1002,'Command Buff'),(1003,'Command Fake'),(1004,'Command Vips');

/*Table structure for table `realm_classes` */

DROP TABLE IF EXISTS `realm_classes`;

CREATE TABLE `realm_classes` (
  `realmId` int(11) NOT NULL,
  `class` tinyint(4) NOT NULL COMMENT 'Class Id',
  `expansion` tinyint(4) NOT NULL COMMENT 'Expansion for class activation',
  PRIMARY KEY (`realmId`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `realm_classes` */

insert  into `realm_classes`(`realmId`,`class`,`expansion`) values (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,5,0),(1,6,2),(1,7,0),(1,8,0),(1,9,0),(1,10,4),(1,11,0);

/*Table structure for table `realm_races` */

DROP TABLE IF EXISTS `realm_races`;

CREATE TABLE `realm_races` (
  `realmId` int(11) NOT NULL,
  `race` tinyint(4) NOT NULL COMMENT 'Race Id',
  `expansion` tinyint(4) NOT NULL COMMENT 'Expansion for race activation',
  PRIMARY KEY (`realmId`,`race`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `realm_races` */

insert  into `realm_races`(`realmId`,`race`,`expansion`) values (1,1,0),(1,2,0),(1,3,0),(1,4,0),(1,5,0),(1,6,0),(1,7,0),(1,8,0),(1,9,3),(1,10,1),(1,11,1),(1,22,3),(1,24,4),(1,25,4),(1,26,4);

/*Table structure for table `realmcharacters` */

DROP TABLE IF EXISTS `realmcharacters`;

CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

/*Data for the table `realmcharacters` */

insert  into `realmcharacters`(`realmid`,`acctid`,`numchars`) values (1,1,2),(1,2,1),(1,3,1),(1,4,1),(2,1,2),(44,1,1),(44,3,1);

/*Table structure for table `realmlist` */

DROP TABLE IF EXISTS `realmlist`;

CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT 'DeathCore',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Realm System';

/*Data for the table `realmlist` */

insert  into `realmlist`(`id`,`name`,`address`,`localAddress`,`localSubnetMask`,`port`,`icon`,`flag`,`timezone`,`allowedSecurityLevel`,`population`,`gamebuild`) values (1,'DeathCore 3.3.5','127.0.0.1','127.0.0.1','255.255.255.0',8085,0,0,5,0,0,12340),(2,'DeathCore 4.3.4','127.0.0.1','127.0.0.1','255.255.255.0',8086,0,0,1,0,0,15595),(3,'DeathCore 5.4.8','127.0.0.1','127.0.0.1','255.255.255.0',8087,0,0,1,0,0,18414);

/*Table structure for table `updates` */

DROP TABLE IF EXISTS `updates`;

CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all applied updates in this database.';

/*Data for the table `updates` */

insert  into `updates`(`name`,`hash`,`state`,`timestamp`,`speed`) values ('2014_11_10_00_auth.sql','0E3CB119442D09DD88E967015319BBC8DAFBBFE0','ARCHIVED','2015-03-21 17:44:12',0),('2014_11_10_01_auth.sql','327E77A1DA3546D5275AB249915DD57EDD6FDD3D','ARCHIVED','2015-03-21 17:44:12',0),('2014_12_10_00_auth.sql','821703A96D80F9080074852B5A46E2909C9562EA','ARCHIVED','2015-03-21 17:44:12',0),('2014_12_21_00_auth.sql','CE2E5D2CD82E79C25294539ADED27A1429105B43','ARCHIVED','2015-03-21 17:44:12',0),('2015_03_20_00_auth.sql','E8C5B74BB45F0F35DEC182C72BACF435C7066FB0','ARCHIVED','2015-03-21 17:44:12',0),('2015_03_20_01_auth.sql','862961815354DA2746F5F71FBC8155F57CBE75AB','ARCHIVED','2015-03-21 17:44:12',0),('2015_03_20_02_auth.sql','33E4F94086590768EF5D4855DD43D7DE7C06ADA4','ARCHIVED','2015-03-21 17:44:51',0),('2015_08_21_00_auth.sql','C31A9E1D28E11B60BE8F8198637DD51F6D75123F','ARCHIVED','2015-10-05 19:16:19',0),('2015_11_07_00_auth.sql','BAF9F6B8F97A30D04BDBBA8127A62A1720F9B904','ARCHIVED','2015-11-07 12:40:47',0),('2016_01_13_00_auth.sql','24615CC69B3CD7BB4699874647C35BA86E8A93FD','ARCHIVED','2016-01-12 21:00:00',0);

/*Table structure for table `updates_include` */

DROP TABLE IF EXISTS `updates_include`;

CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of directories where we want to include sql updates.';

/*Data for the table `updates_include` */

insert  into `updates_include`(`path`,`state`) values ('$/sql/updates/auth','RELEASED'),('$/sql/custom/auth','RELEASED'),('$/sql/old/3.3.5a/auth','ARCHIVED');

/*Table structure for table `uptime` */

DROP TABLE IF EXISTS `uptime`;

CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'DeathCore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

/*Data for the table `uptime` */

/*Table structure for table `vip_accounts` */

DROP TABLE IF EXISTS `vip_accounts`;

CREATE TABLE `vip_accounts` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `setdate` bigint(40) NOT NULL DEFAULT '0',
  `unsetdate` bigint(40) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`setdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='VIP Accounts';

/*Data for the table `vip_accounts` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
