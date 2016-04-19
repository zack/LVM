-- --------------------------------------------
-- 04LVMUpdateMatchesTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the matches table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateMatchesTable;

DELIMITER //

CREATE PROCEDURE updateMatchesTable(
  `site` int, -- FK
  `doeMatchID` int,
  `status` enum('Current','Dissolved'),
  `tutor` int, -- FK
  `student` int, -- FK
  `onHold` bit(1),
  `matchStart` date,
  `matchEnd` date,
  `primaryServiceType` enum('ABE','ESOL'),
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO Matches(
	site,
    doeMatchID,
    status,
    tutor,
    student,
    matchStart,
    matchEnd,
    primaryServiceType,
    dateAdded,
	dateModified,
    isTestData)
VALUES(
    `site`,
    `doeMatchID`,
    `status`,
    `tutor`,
    `student`,
    `matchStart`,
    `matchEnd`,
    `primaryServiceType`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //