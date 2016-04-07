-- --------------------------------------------
-- 04LVMUpdateStudentDependentsTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentDependents table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentDependentsTable;

DELIMITER //

CREATE PROCEDURE updateStudentDependentsTable(
  `student` int, -- FK
  `yearOfBirth` int,
  `inSchool` boolean,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentDependents(
	student, 
    yearOfBirth,
    inSchool,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`student`, 
    `yearOfBirth`,
    `inSchool`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //