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
  `zipCodeID` int,
  `countryOfOrigin` int, -- FK
  `singleParent` boolean,
  `learningDisability` boolean,
  `physicalDisability` boolean,
  `emergencyContactName` varchar(50),
  `emergencyContactNumber` varchar(10),
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO Student(
	person, 
    smarttID,
    zipCodeID, 
    countryOfOrigin,
    singleParent,
    learningDisability,
    physicalDisability,
    emergencyContactName,
    emergencyContactNumber,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`person`, 
    `smarttID`, 
    `zipCodeID`, 
    `countryOfOrigin`,
    `singleParent`,
    `learningDisability`,
    `physicalDisability`,
    `emergencyContactName`,
    `emergencyContactNumber`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //