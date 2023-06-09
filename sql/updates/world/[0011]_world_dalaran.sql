UPDATE `creature_template` SET `AIName` = "SmartAI", `ScriptName` = "" WHERE `entry` IN (34520, 34519);
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|536870912 WHERE `entry` = 34519;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (34520, 34519, -315778, -315779, -315780) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-315778,0,0,1,1,0,100,0,15000,20000,15000,20000,11,65611,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Cast 'Throw Ragdoll'"),
(-315778,0,1,0,61,0,100,0,0,0,0,0,28,65617,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Remove Aura 'Hold Ragdoll State'"),
(-315778,0,2,4,8,0,100,0,65614,0,0,0,75,65617,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - On Spellhit (Throw Ragdoll) - Cast 'Hold Ragdoll State'"),
(-315778,0,3,0,1,0,100,0,5000,20000,15000,30000,10,53,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Random Emote"),
(-315778,0,4,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,34519,0,0,0,0,0,0,"Wolver Orphan - On Spellhit (Throw Ragdoll) - Set Data 1 1"),

(-315779,0,0,1,1,0,100,0,15000,20000,15000,20000,11,65613,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Cast 'Throw Ragdoll'"),
(-315779,0,1,0,61,0,100,0,0,0,0,0,28,65617,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Remove Aura 'Hold Ragdoll State'"),
(-315779,0,2,4,8,0,100,0,65611,0,0,0,75,65617,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - On Spellhit (Throw Ragdoll) - Cast 'Hold Ragdoll State'"),
(-315779,0,3,0,1,0,100,0,5000,20000,15000,30000,10,53,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Random Emote"),
(-315779,0,4,0,61,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,34519,0,0,0,0,0,0,"Wolver Orphan - On Spellhit (Throw Ragdoll) - Set Data 2 2"),

(-315780,0,0,1,1,0,100,0,15000,20000,15000,20000,11,65614,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Cast 'Throw Ragdoll'"),
(-315780,0,1,0,61,0,100,0,0,0,0,0,28,65617,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Remove Aura 'Hold Ragdoll State'"),
(-315780,0,2,4,8,0,100,0,65613,0,0,0,75,65617,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - On Spellhit (Throw Ragdoll) - Cast 'Hold Ragdoll State'"),
(-315780,0,3,0,1,0,100,0,5000,20000,15000,30000,10,53,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wolver Orphan - OOC - Random Emote"),
(-315780,0,4,0,61,0,100,0,0,0,0,0,45,3,3,0,0,0,0,19,34519,0,0,0,0,0,0,"Wolver Orphan - On Spellhit (Throw Ragdoll) - Set Data 3 3"),

(34519,0,0,0,1,0,100,0,5000,20000,45000,90000,1,0,8000,0,0,0,0,19,34520,0,0,0,0,0,0,"Oracle Orphan - OOC - Say Text Line 0"),
(34519,0,1,0,52,0,100,0,0,34520,0,0,1,0,8000,0,0,0,0,1,0,0,0,0,0,0,0,"Oracle Orphan - On Text Over Line 0 (Wolvar) - Say Text Line 0"),
(34519,0,2,0,52,0,100,0,0,34519,0,0,1,1,7000,0,0,0,0,1,0,0,0,0,0,0,0,"Oracle Orphan - On Text Over Line 0 - Say Text Line 1"),
(34519,0,3,0,52,0,100,0,1,34519,0,0,1,2,7000,0,0,0,0,1,0,0,0,0,0,0,0,"Oracle Orphan - On Text Over Line 1 - Say Text Line 2"),
(34519,0,4,0,52,0,100,0,2,34519,0,0,1,0,7000,0,0,0,0,19,34365,0,0,0,0,0,0,"Oracle Orphan - On Text Over Line 2 - Say Text Line 0 (Matron)"),
(34519,0,5,0,38,0,100,0,1,1,0,0,69,1,0,0,1,0,0,10,315778,34520,0,0,0,0,0,"Oracle Orphan - On Data Set 1 1 - Move To Position"),
(34519,0,6,0,38,0,100,0,2,2,0,0,69,2,0,0,1,0,0,10,315779,34520,0,0,0,0,0,"Oracle Orphan - On Data Set 2 2 - Move To Position"),
(34519,0,7,0,38,0,100,0,3,3,0,0,69,3,0,0,1,0,0,10,315780,34520,0,0,0,0,0,"Oracle Orphan - On Data Set 3 3 - Move To Position");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13, 17) AND `SourceEntry` IN (65611, 65613, 65614);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 65611, 0, 0, 31, 0, 3, 34520, 315779, 0, 0, 0, "", "Wolvar Orphan"),
(13, 1, 65613, 0, 0, 31, 0, 3, 34520, 315780, 0, 0, 0, "", "Wolvar Orphan"),
(13, 1, 65614, 0, 0, 31, 0, 3, 34520, 315778, 0, 0, 0, "", "Wolvar Orphan");

DELETE FROM `creature_text` WHERE `entry` IN (34519, 34520, 34365);
INSERT INTO `creature_text` (`entry`, `text_group`, `id`, `text`, `text_female`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `text_range`, `comment`) VALUES 
(34519, 0, 0, "Give toy back!", "", 12, 0, 100, 1, 0, 0, 0, "Oracle Orphan"),
(34519, 1, 0, "Stop!", "", 12, 0, 100, 1, 0, 0, 0, "Oracle Orphan"),
(34519, 2, 0, "We tell orphan matron on you!", "", 12, 0, 100, 1, 0, 0, 0, "Oracle Orphan"),

(34520, 0, 0, "If you want, go get, big-tongue baby!", "", 12, 0, 100, 0, 0, 0, 0, "Wolvar Orphan"),

(34365, 0, 0, "", "Children, please behave yourselves! No one will want to adopt you if you keep acting like that!", 12, 0, 100, 5, 0, 0, 0, "Orphan Matron Aria");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (34520, -315778, -315779, -315780);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, -315778, 0, 0, 1, 1, 65617, 0, 0, 0, 0, 0, "", "Wolver Orphan only run SAI if has aura 'Hold Ragdoll State'"),
(22, 1, -315779, 0, 0, 1, 1, 65617, 0, 0, 0, 0, 0, "", "Wolver Orphan only run SAI if has aura 'Hold Ragdoll State'"),
(22, 1, -315780, 0, 0, 1, 1, 65617, 0, 0, 0, 0, 0, "", "Wolver Orphan only run SAI if has aura 'Hold Ragdoll State'");

DELETE FROM `game_event_creature` WHERE `eventEntry` = 10 AND `guid` BETWEEN 315778 AND 315781;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES 
(10, 315778),
(10, 315779),
(10, 315780),
(10, 315781);

DELETE FROM `disables` WHERE `entry` = 34519 AND `sourceType` = 10;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(10, 34519, 1, "", "", "Oracle Orphan - MMAP");

UPDATE `creature` SET `wander_distance` = 0, `movement_type` = 0 WHERE `guid` IN (87282, 87281);
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` IN (29777, 29780, 29781, 29782, 29783, 29784, 29785, 29802);

DELETE FROM `creature_template_addon` WHERE `entry` = 34244;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `ai_anim_kit`, `movement_anim_kit`, `melee_anim_kit`, `auras`) VALUES
(34244, 0, 22471, 0, 1, 0, 0, 0, 0, "63500");

-- Dalaran Visitors
DELETE FROM `creature` WHERE `id` IN (32596, 32597, 32598, 32600, 32601, 32602);
DELETE FROM `creature_addon` WHERE `guid` IN (87278, 87279, 87284, 87286, 87288, 87291, 352262, 352267, 352265, 352316, 352310, 352317, 352309, 352304,
                                              352286, 352285, 352284, 352283, 352282, 352281, 352277, 352276, 352272, 352266, 352264, 352263, 352318);
DELETE FROM `waypoint_data` WHERE `id` IN (87278, 87279, 87284, 87286, 87288, 352316, 352310, 352317, 352309, 352304, 352286, 352285, 352284, 352283,
                                           352282, 352281, 352277, 352276, 352272, 352266, 352264, 352263, 352318);

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `movement_type`) VALUES
(87278, 32596, 571, 1, 1, 0, 0, 5866.54, 252.983, 680.473, 1.81671, 70, 0, 8225, 7809, 0),
(87279, 32597, 571, 1, 1, 0, 0, 5818.53, 225.184, 678.642, 1.60465, 151, 0, 8225, 7809, 0),
(87284, 32598, 571, 1, 1, 0, 0, 5729.43, 217.839, 682.97, 1.24336, 118, 0, 8508, 7981, 0),
(87286, 32600, 571, 1, 1, 0, 0, 5792.87, 226.099, 681.705, 1.38473, 135, 0, 10080, 8814, 0),
(87288, 32601, 571, 1, 1, 0, 0, 5684.8, 293.537, 678.417, 1.05486, 170, 0, 8800, 8139, 0),
(87291, 32602, 571, 1, 1, 0, 0, 5849.65, 230.232, 672.463, 1.92272, 93, 0, 9740, 8636, 0);

UPDATE `creature_template` SET `unit_flags` = 32768|768, `flags_extra` = 2, `InhabitType` = 3, `AIName` = "SmartAI", `ScriptName` = "" WHERE `entry` IN (32596, 32597, 32598, 32600, 32601, 32602);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (32596, 32597, 32598, 32600, 32601, 32602) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 32596*100 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(32596, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Can Fly"),
(32596, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 204, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Override IT To 4"),
(32596, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Active"),
(32596, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 32596, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Start WP"),
(32596, 0, 4, 5, 40, 0, 100, 0, 8, 0, 0, 0, 60, 0, 100, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Set Can Fly false"),
(32596, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 32596*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Run Script"),
(32596, 0, 6, 0, 36, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Active"),
(32596, 0, 7, 0, 11, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Respawn - Set Visible False"),
(32596, 0, 8, 0, 60, 0, 100, 1, 300, 300, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Visible True"),

(32597, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Can Fly"),
(32597, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 204, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Override IT To 4"),
(32597, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Active"),
(32597, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 32597, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Start WP"),
(32597, 0, 4, 5, 40, 0, 100, 0, 8, 0, 0, 0, 60, 0, 100, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Set Can Fly false"),
(32597, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 32596*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Run Script"),
(32597, 0, 6, 0, 36, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Active"),
(32597, 0, 7, 0, 11, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Respawn- Set Visible False"),
(32597, 0, 8, 0, 60, 0, 100, 1, 300, 300, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Visible True"),

(32598, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Can Fly"),
(32598, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 204, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Override IT To 4"),
(32598, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Active"),
(32598, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 32598, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Start WP"),
(32598, 0, 4, 5, 40, 0, 100, 0, 8, 0, 0, 0, 60, 0, 100, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Set Can Fly false"),
(32598, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 32596*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Run Script"),
(32598, 0, 6, 0, 36, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Active"),
(32598, 0, 7, 0, 11, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Respawn - Set Visible False"),
(32598, 0, 8, 0, 60, 0, 100, 1, 300, 300, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Visible True"),

(32600, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Can Fly"),
(32600, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 204, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Override IT To 4"),
(32600, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Active"),
(32600, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 32600, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Start WP"),
(32600, 0, 4, 5, 40, 0, 100, 0, 7, 0, 0, 0, 60, 0, 100, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Set Can Fly false"),
(32600, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 32596*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Run Script"),
(32600, 0, 6, 0, 36, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Active"),
(32600, 0, 7, 0, 11, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Respawn - Set Visible False"),
(32600, 0, 8, 0, 60, 0, 100, 1, 300, 300, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Visible True"),

(32601, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Can Fly"),
(32601, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 204, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Override IT To 4"),
(32601, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Active"),
(32601, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 32601, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Start WP"),
(32601, 0, 4, 5, 40, 0, 100, 0, 8, 0, 0, 0, 60, 0, 100, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Set Can Fly false"),
(32601, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 32596*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Run Script"),
(32601, 0, 6, 0, 36, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Active"),
(32601, 0, 7, 0, 11, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Respawn - Set Visible False"),
(32601, 0, 8, 0, 60, 0, 100, 1, 300, 300, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Visible True"),

(32602, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Can Fly"),
(32602, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 204, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Override IT To 4"),
(32602, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Set Active"),
(32602, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 32602, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Reset - Start WP"),
(32602, 0, 4, 5, 40, 0, 100, 0, 6, 0, 0, 0, 60, 0, 100, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Set Can Fly false"),
(32602, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 32596*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On WP Reached - Run Script"),
(32602, 0, 6, 0, 36, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Active"),
(32602, 0, 7, 0, 11, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Respawn - Set Visible False"),
(32602, 0, 8, 0, 60, 0, 100, 1, 300, 300, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Corpse Removed - Set Visible True"),

(32596*100, 9, 0, 0, 0, 0, 100, 0, 100, 100, 0, 0, 204, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Script - Override IT To 3"),
(32596*100, 9, 1, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 43, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Script - Dismount"),
(32596*100, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 5830.49, 513.89, 657.75, 0, "Dalaran Visitor - On Script - Move To Position"),
(32596*100, 9, 3, 0, 0, 0, 100, 0, 11000, 11000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dalaran Visitor - On Script - Despawn");

DELETE FROM `waypoints` WHERE `entry` IN (32596, 32597, 32598, 32600, 32601, 32602);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(32596, 1, 5863.84, 263.72, 679.786, "Dalaran Visitor"),
(32596, 2, 5849.81, 297.062, 679.055, "Dalaran Visitor"),
(32596, 3, 5838.59, 326.429, 677.155, "Dalaran Visitor"),
(32596, 4, 5825.01, 353.455, 675.249, "Dalaran Visitor"),
(32596, 5, 5811.08, 379.017, 673.138, "Dalaran Visitor"),
(32596, 6, 5803.46, 400.867, 670.357, "Dalaran Visitor"),
(32596, 7, 5800.55, 423.251, 664.603, "Dalaran Visitor"),
(32596, 8, 5800.01, 437.574, 658.823, "Dalaran Visitor"),

(32597, 1, 5817.67, 250.508, 680.734, "Dalaran Visitor"),
(32597, 2, 5816.19, 285.423, 678.864, "Dalaran Visitor"),
(32597, 3, 5815.88, 294.706, 678.238, "Dalaran Visitor"),
(32597, 4, 5818.04, 328.345, 675.613, "Dalaran Visitor"),
(32597, 5, 5822.43, 386.194, 669.118, "Dalaran Visitor"),
(32597, 6, 5823.11, 404.667, 666.354, "Dalaran Visitor"),
(32597, 7, 5823.56, 417.179, 663.648, "Dalaran Visitor"),
(32597, 8, 5823.93, 427.31, 658.912, "Dalaran Visitor"),

(32598, 1, 5729.43, 217.839, 682.97, "Dalaran Visitor"),
(32598, 2, 5740.12, 251.148, 681.958, "Dalaran Visitor"),
(32598, 3, 5755.97, 293.67, 679.579, "Dalaran Visitor"),
(32598, 4, 5798.92, 349.589, 674.791, "Dalaran Visitor"),
(32598, 5, 5813.64, 373.246, 672.24, "Dalaran Visitor"),
(32598, 6, 5822.62, 398.153, 668.902, "Dalaran Visitor"),
(32598, 7, 5820.71, 418.575, 664.116, "Dalaran Visitor"),
(32598, 8, 5811.2, 432.381, 658.771, "Dalaran Visitor"),

(32600, 1, 5792.87, 226.099, 681.705, "Dalaran Visitor"),
(32600, 2, 5797.38, 291.058, 676.097, "Dalaran Visitor"),
(32600, 3, 5795.82, 326.001, 674.99, "Dalaran Visitor"),
(32600, 4, 5792.52, 360.816, 673.748, "Dalaran Visitor"),
(32600, 5, 5798.06, 412.453, 668.894, "Dalaran Visitor"),
(32600, 6, 5806.63, 424.174, 664.422, "Dalaran Visitor"),
(32600, 7, 5819.52, 434.388, 658.769, "Dalaran Visitor"),

(32601, 1, 5684.8, 293.537, 678.417, "Dalaran Visitor"),
(32601, 2, 5684.8, 293.537, 678.417, "Dalaran Visitor"),
(32601, 3, 5747.12, 324.974, 673.387, "Dalaran Visitor"),
(32601, 4, 5789.12, 356.173, 672.099, "Dalaran Visitor"),
(32601, 5, 5802.1, 371.188, 671.09, "Dalaran Visitor"),
(32601, 6, 5823.94, 406.387, 666.15, "Dalaran Visitor"),
(32601, 7, 5829.2, 430.961, 660.949, "Dalaran Visitor"),
(32601, 8, 5827.39, 436.338, 659.402, "Dalaran Visitor"),

(32602, 1, 5843.6, 249.131, 671.836, "Dalaran Visitor"),
(32602, 2, 5834.95, 283.034, 670.949, "Dalaran Visitor"),
(32602, 3, 5826.04, 316.863, 669.909, "Dalaran Visitor"),
(32602, 4, 5816.48, 350.5, 668.479, "Dalaran Visitor"),
(32602, 5, 5802.57, 402.222, 664.969, "Dalaran Visitor"),
(32602, 6, 5804.38, 425.957, 658.787, "Dalaran Visitor");

UPDATE `creature_template` SET `AIName` = "", `ScriptName` = "npc_archmage_landalock" WHERE `entry` = 20735;
DELETE FROM `creature` WHERE `id` IN (37849, 37850, 37851, 37853, 37854, 37855, 37856, 37858, 37859, 37861, 37862, 37864, 31619);
UPDATE `creature_template` SET `unit_flags` = `unit_flags`|33555200, `InhabitType` = 4 WHERE `entry` IN (37849, 37850, 37851, 37853, 37854, 37855, 37856, 37858, 37859, 37861, 37862, 37864);

DELETE FROM `creature` WHERE `guid` IN (54462, 54527, 54528, 54531, 54532, 54553);
UPDATE `creature_template` SET `ScriptName` = "npc_minigob_manabonk" WHERE `entry` = 32838;

DELETE FROM `game_event` WHERE `eventEntry` = 118;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `description`, `announce`) VALUES
(118, "2011-03-22 00:10:00", "2030-12-31 23:59:00", 30, 5, "Dalaran: Minigob", 2);

DELETE FROM `game_event_creature` WHERE `guid` = 44457 AND `eventEntry` = 118;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(118, 44457);
