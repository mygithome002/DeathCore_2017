-- Working for Dk Quests
-- By Bodeguero for DeathCore.

UPDATE `creature_template` SET `subname`='' WHERE (`entry`='56003');
UPDATE `creature_template` SET `name`='Sha of Anger' WHERE (`entry`='61523');
UPDATE `creature_template` SET `name`='Stone Guard Controller (7)' WHERE (`entry`='60091');
UPDATE `gameobject_template` SET `name`='Bamboo Rod' WHERE (`entry`='213746');
UPDATE `gameobject_template` SET `name`='Currents of Mazu' WHERE (`entry`='213302');
UPDATE `gameobject_template` SET `name`='Letters Box' WHERE (`entry`='210807');
UPDATE `gameobject_template` SET `name`='Narkk\'s Handbombs' WHERE (`entry`='204587');
UPDATE `gameobject_template` SET `name`='Celestial Control Console' WHERE (`entry`='211650');
UPDATE `gameobject_template` SET `name`='Door' WHERE (`entry`='214412');
UPDATE `gameobject_template` SET `name`='Wind Wall' WHERE (`entry`='215114');
UPDATE `gameobject_template` SET `name`='Rune' WHERE (`entry`='213955');
UPDATE `gameobject_template` SET `name`='Rune' WHERE (`entry`='213952');
UPDATE `gameobject_template` SET `name`='Rune' WHERE (`entry`='213948');
UPDATE `gameobject_template` SET `name`='Rune' WHERE (`entry`='213954');
UPDATE `gameobject_template` SET `name`='Rune' WHERE (`entry`='213949');
UPDATE `gameobject_template` SET `name`='Rune' WHERE (`entry`='213944');
DELETE FROM creature WHERE guid IN (129452,278311);
UPDATE `creature_template` SET `speed_walk`='2', `speed_run`='2', `InhabitType`='4' WHERE (`entry`='28670');
UPDATE `creature_template` SET `rank`='1' WHERE (`entry`='31099');
DELETE FROM gameobject WHERE guid IN (244362);
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12619';
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12679';
UPDATE `creature_template` SET `mechanic_immune_mask`='652951551' WHERE `entry`='28782';
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12698';
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12701';
UPDATE `quest_template` SET `RequiredNpcOrGoCount1`='100' WHERE `Id`='12701';
UPDATE `creature_template` SET `spell5`='0' WHERE `entry`='28833';
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12719';
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12720';
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`='39418' and`item`='39371';
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12724';
UPDATE `quest_template` SET `RequiredRaces`='32 ' WHERE `Id`='12739';
UPDATE `quest_template` SET `PrevQuestId`='12738', `ExclusiveGroup`='0' WHERE `Id`='28650';
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12754';
UPDATE `quest_template` SET `Method`='2' WHERE `Id`='12801';
UPDATE `creature_template` SET `unit_flags`='1074332672' WHERE `entry`='31094';