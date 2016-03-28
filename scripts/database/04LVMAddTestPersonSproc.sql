-- --------------------------------------------
-- 04LVMAddTestPersonSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the Person table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestPerson;

DELIMITER //

CREATE PROCEDURE addTestPerson(
  `id` int,
  `site` int, -- FK
  `doeID` int,
  `newForFY` int,
  `lastName` varchar(255),
  `firstName` varchar(255),
  `intakeDate` date,
  `dob` date,
  `gender` enum('Male','Female'),
  `primaryServiceType` enum('ESOL','BL','Both ESOL/BL'),
  `status` enum('Current','Exited','Partial'),
  `address1` varchar(255),
  `city` varchar(255),
  `state` varchar(2),
  `zip` varchar(5),
  `nativeLanguage` int, -- FK
  `ethnicity` int, -- FK
  `doeReferral` int,  -- FK
  `lvmReferral` int,  -- FK
  `yearsUS` int,
  `yearsForeign` int,
  `doeEmployStatus` int, -- FK
  `doeOccupation` int, -- FK??
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO Person(
	id,
    site, -- FK
	doeID,
	newForFY,
	lastName,
	firstName,
	intakeDate,
	dob,
	gender,
	primaryServiceType,
	status,
	address1,
	city,
    state,
    zip,
    nativeLanguage, -- FK
    ethnicity, -- FK
    doeReferral,  -- FK
    lvmReferral,  -- FK
    yearsUS,
    yearsForeign,
    doeEmployStatus, -- FK
    doeOccupation, -- FK??
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`id`,
    `site`, -- FK
	`doeID`,
	`newForFY`,
	`lastName`,
	`firstName`,
	`intakeDate`,
	`dob`,
	`gender`,
	`primaryServiceType`,
	`status`,
	`address1`,
	`city`,
    `state`,
    `zip`,
    `nativeLanguage`, -- FK
    `ethnicity`, -- FK
    `doeReferral`,  -- FK
    `lvmReferral`,  -- FK
    `yearsUS`,
    `yearsForeign`,
    `doeEmployStatus`, -- FK
    `doeOccupation`, -- FK??
    `dateAdded`,
    `dateModified`,
    1);
    
END //