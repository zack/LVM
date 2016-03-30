-- --------------------------------------------
-- 04LVMAddTestMatchSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the match table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestMatches;

DELIMITER //

CREATE PROCEDURE addTestMatches(
  `id` int,
  `site` int, -- FK
  `doeMatchID` int,
  `status` enum('Current','Dissolved'),
  `tutor` int, -- FK
  `student` int, -- FK
  `matchStart` date,
  `matchEnd` date,
  `onHold` boolean,
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO Matches(
	id,
	site,
    doeMatchID,
    status,
    tutor,
    student,
    matchStart,
    matchEnd,
    onHold,
    dateAdded,
	dateModified,
    isTestData)
VALUES(
	`id`,
    `site`,
    `doeMatchID`,
    `status`,
    `tutor`,
    `student`,
    `matchStart`,
    `matchEnd`,
    `onHold`,
    `dateAdded`,
    `dateModified`,
    1);
    
END //