-- --------------------------------------------
-- 04LVMUpdateTutorTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the tutor table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateTutorHoursTable;


DELIMITER //

CREATE PROCEDURE updateTutorHoursTable(
  `matchID` int,
  `student` int,
  `tutor` int,
  `month` int,
  `year` int,
  `hours` int,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO TutorHours(
	matchID,
	student,
	tutor,
	`month`,
	`year`,
	hours,
	dateAdded,
	dateModified,
    isTestData)
VALUES(
    `matchID`,
	`student`,
	`tutor`,
	`month`,
	`year`,
	`hours`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //