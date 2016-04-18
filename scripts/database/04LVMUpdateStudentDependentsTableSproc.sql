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
  `sameHouse` boolean,
  `comment` varchar(2000),
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentDependents(
	student, 
    yearOfBirth,
    inSchool,
    sameHouse,
    comment,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`student`, 
    `yearOfBirth`,
    `inSchool`,
    `sameHouse`,
    `comment`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //