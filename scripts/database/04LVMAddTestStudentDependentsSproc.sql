-- --------------------------------------------
-- 04LVMAddTestStudentDependentsSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentDependents table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestStudentDependents;

DELIMITER //

CREATE PROCEDURE addTestStudentDependents(
  `id` int,
  `student` int, -- FK
  `yearOfBirth` int,
  `inSchool` boolean,
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO StudentDependents(
	id,
	student, 
    yearOfBirth,
    inSchool,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`id`,
	`student`, 
    `yearOfBirth`,
    `inSchool`,
    `dateAdded`,
    `dateModified`,
    1);
    
END //