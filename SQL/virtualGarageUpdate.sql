/*
	Only use this sql file if you are updating from a previous version.
	Use SQL\virtualGarage.sql if you are starting fresh.
*/
/* Remove comments if you are upgrading from the previous authors version. (i.e TheDuke)
ALTER TABLE `garage` ADD `Name` VARCHAR(50) NOT NULL DEFAULT '' AFTER `PlayerUID`;
ALTER TABLE `garage` ADD `displayName` VARCHAR(50) NOT NULL DEFAULT '' AFTER `Name`;
*/

--UPDATE `garage` SET Inventory = '[[[],[]],[[],[]],[[],[]]]' WHERE Inventory = '[]';

--ALTER TABLE `garage` ADD `DateStored` varchar(10) NOT NULL DEFAULT 'old' AFTER `Datestamp`;

ALTER TABLE `garage` ADD `serverKey` varchar(10) NOT NULL DEFAULT 'old' AFTER `Colour2`;
ALTER TABLE `garage` ADD `ObjUID` varchar(20) NOT NULL DEFAULT 'old' AFTER `serverKey`;
ALTER TABLE `garage` ADD `StorageCounts` varchar(30) NOT NULL DEFAULT '[0,0,0]' AFTER `CharacterID`;
DROP EVENT IF EXISTS `RemoveOldVG`;