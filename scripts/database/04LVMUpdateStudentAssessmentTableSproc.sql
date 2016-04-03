-- --------------------------------------------
-- 04LVMUpdateStudentAssessmentTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentAssessment table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentAssessmentTable;

DELIMITER //

CREATE PROCEDURE updateStudentAssessmentTable(
  `student` int, -- FK
  `date` date,
  `test` int, -- FK
  `result` varchar(255),
  `fedLevel` int, -- FK??
  `fedType` int, -- FK??
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentAssessment(
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
	`student`, 
    `date`,
    `test`,
	`result`,
	`fedLevel`,
    `fedType`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //