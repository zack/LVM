-- --------------------------------------------
-- 04LVMUpdateStudentAnswersTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentAnswers table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentAnswersTable;

DELIMITER //

CREATE PROCEDURE updateStudentAnswersTable(
  `student` int,
  `question` int, -- FK
  `answer` varchar(2000),
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentAnswers(
  `student`,
  `question`,
  `answer`,
  `dateAdded`,
  `dateModified`,
  `isTestData`)
VALUES(
	`student`,
    `question`,
    `answer`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //