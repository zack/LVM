-- --------------------------------------------
-- 04LVMUpdatePersonAvailabilityTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the PersonAvailability table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updatePersonAvailabilityTable;

DELIMITER //

CREATE PROCEDURE updatePersonAvailabilityTable(
  `person` int,
  `day` int,
  `startTime` int,
  `endTime` int,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO PersonAvailability(
  `person`,
  `day`,
  `startTime`,
  `endTime`,
  `dateAdded`,
  `dateModified`,
  `isTestData`)
VALUES(
	`person`,
    `day`,
    `startTime`,
    `endTime`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //