-- --------------------------------------------
-- 04LVMUpdateSudentTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the student table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentTable;

DELIMITER //

CREATE PROCEDURE updateStudentTable(
  `person` int, -- FK
  `smarttID` int,
  `okayToCall` boolean,
  `okayToMail` boolean,
  `okayToEmail` boolean,
  `zipCodeID` int,
  `countryOfOrigin` int,
  `timeInJobMonths` int,
  `timeInJobYears` int,
  `publicAssistance` int,
  `singleParent` boolean,
  `learningDisability` boolean,
  `physicalDisability` boolean,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO Student(
	person, 
    smarttID, 
    okayToCall, 
    okayToMail, 
    okayToEmail, 
    zipCodeID, 
    countryOfOrigin, 
    timeInJobMonths,
    timeInJobYears,
    publicAssistance,
    singleParent,
    learningDisability,
    physicalDisability,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`person`, 
    `smarttID`, 
    `okayToCall`, 
    `okayToMail`, 
    `okayToEmail`, 
    `zipCodeID`, 
    `countryOfOrigin`,
    `timeInJobMonths`,
	`timeInJobYears`,
    `publicAssistance`,
    `singleParent`,
    `learningDisability`,
    `physicalDisability`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //