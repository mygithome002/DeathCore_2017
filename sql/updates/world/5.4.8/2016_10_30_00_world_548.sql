-- Some Fix
-- By Bodeguero for DeathCore.

DELETE FROM spell_script_names WHERE ScriptName='spell_mage_2p_pvp';
DELETE FROM spell_script_names WHERE ScriptName='spell_mage_blink';
INSERT INTO spell_script_names VALUES ('131618', 'spell_mage_2p_pvp');
INSERT INTO spell_script_names VALUES ('1953', 'spell_mage_blink');
DELETE FROM spell_script_names WHERE ScriptName='spell_mage_glyph_of_momentum';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (1953, 'spell_mage_glyph_of_momentum');
DELETE FROM spell_script_names WHERE ScriptName='spell_mage_illusion_glyph';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (63092, 'spell_mage_illusion_glyph');
DELETE FROM spell_script_names WHERE ScriptName = 'spell_mage_illusion_effect';
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (131784, 'spell_mage_illusion_effect');

