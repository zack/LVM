-- --------------------------------------------
-- 04LVMUpdateMeetingTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the Meeting table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateMeetingTable;

DELIMITER //

CREATE PROCEDURE updateMeetingTable(
  `matching` int, -- FK
  `date` date,
  `hours` int,
  `didNotMeet` boolean,
  `couldNotContact` boolean,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO Meeting(
	matching,
    date,
    hours,
    didNotMeet,
    couldNotContact,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`matching`,
    `date`,
    `hours`,
    `didNotMeet`,
    `couldNotContact`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //