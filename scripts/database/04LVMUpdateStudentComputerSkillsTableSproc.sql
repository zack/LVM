-- --------------------------------------------
-- 04LVMUpdateStudentComputerSkillsTableSproc
-- Date: April 10 2016
-- 
-- Creates sproc to insert data into the StudentComputerSkills table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentComputerSkillsTable;

DELIMITER //

CREATE PROCEDURE updateStudentComputerSkillsTable(
  `student` int,
  `haveComputerAtHome` boolean,
  `useComputerAtHome` boolean,
  `useComputerAtLibrary` boolean,
  `useComputerAtWork` boolean,
  `useSmartphone` boolean,
  `useEmail` boolean,
  `useInternet` boolean,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentComputerSkills(
  `student`,
  `haveComputerAtHome`,
  `useComputerAtHome`,
  `useComputerAtLibrary`,
  `useComputerAtWork`,
  `useSmartphone`,
  `useEmail`,
  `useInternet`,
  `dateAdded`,
  `dateModified`,
  `isTestData`)
VALUES(
	`student`,
    `haveComputerAtHome`,
    `useComputerAtHome`,
	`useComputerAtLibrary`,
	`useComputerAtWork`,
	`useSmartphone`,
	`useEmail`,
	`useInternet`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //