-- --------------------------------------------
-- 04LVMAddTestSudentSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the student table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestStudent;

DELIMITER //

CREATE PROCEDURE addTestStudent(
  `id` int,
  `person` int, -- FK
  `smarttID` int,
  `okayToCall` boolean,
  `okayToMail` boolean,
  `okayToEmail` boolean,
  `zipCodeID` int,
  `countryOfOrigin` int,
  `publicAssistance` int,
  `singleParent` boolean,
  `learningDisability` boolean,
  `physicalDisability` boolean,
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO Student(
	id,
	person, 
    smarttID, 
    okayToCall, 
    okayToMail, 
    okayToEmail, 
    zipCodeID, 
    countryOfOrigin, 
    publicAssistance,
    singleParent,
    learningDisability,
    physicalDisability,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`id`,
	`person`, 
    `smarttID`, 
    `okayToCall`, 
    `okayToMail`, 
    `okayToEmail`, 
    `zipCodeID`, 
    `countryOfOrigin`, 
    `publicAssistance`,
    `singleParent`,
    `learningDisability`,
    `physicalDisability`,
    `dateAdded`,
    `dateModified`,
    1);
    
END //