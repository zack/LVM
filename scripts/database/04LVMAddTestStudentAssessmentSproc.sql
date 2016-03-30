-- --------------------------------------------
-- 04LVMAddTestStudentAssessmentSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentAssessment table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestStudentAssessment;

DELIMITER //

CREATE PROCEDURE addTestStudentAssessment(
  `id` int,
  `student` int, -- FK
  `date` date,
  `test` int, -- FK
  `result` varchar(255),
  `fedLevel` int, -- FK??
  `fedType` int, -- FK??
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO StudentAssessment(
	id,
	student, 
    date,
    test,
	result,
	fedLevel,
    fedType,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`id`,
	`student`, 
    `date`,
    `test`,
	`result`,
	`fedLevel`,
    `fedType`,
    `dateAdded`,
    `dateModified`,
    1);
    
END //