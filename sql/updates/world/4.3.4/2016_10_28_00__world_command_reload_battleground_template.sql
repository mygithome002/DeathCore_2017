-- Added Command .reload battleground_template
-- By Bodeguero for DeathCore.

DELETE FROM `command` WHERE `name` IN
("reload battleground_template");

REPLACE INTO `command` (`name`, `security`, `help`) VALUES
("reload battleground_template", 4, "Syntax: .reload battleground_template\r\nReload Battleground Templates.");
