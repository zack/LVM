-- --------------------------------------------
-- 04LVMUpdatePersonTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the Person table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updatePersonTable;

DELIMITER //

CREATE PROCEDURE updatePersonTable(
  `site` int, -- FK
  `doeID` int,
  `lastName` varchar(255),
  `firstName` varchar(255),
  `intakeDate` date,
  `dob` date,
  `gender` enum('Male','Female'),
  `primaryServiceType` enum('ESOL','BL','Both ESOL/BL'),
  `status` enum('Current','Exited','Partial'),
  `address1` varchar(255),
  `address2` varchar(255),
  `city` varchar(255),
  `state` varchar(2),
  `zip` varchar(5),
  `zip+4` varchar(4), -- null
  `homePhone` varchar(10), -- null
  `workPhone` varchar(10), -- null
  `extension` varchar(10), -- null
  `cellPhone` varchar(10), -- null
  `email` varchar(255), -- null
  `nativeLanguage` int, -- FK
  `ethnicity` int, -- FK
  `hispanicOrLatino` boolean,
  `doeReferral` int,  -- FK
  `lvmReferral` int,  -- FK
  `doeEmployStatus` int, -- FK
  `doeOccupation` int, -- FK??
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO Person(
    site, -- FK
	doeID,
	lastName,
	firstName,
	intakeDate,
	dob,
	gender,
	primaryServiceType,
	status,
	address1,
    address2,
	city,
    state,
    zip,
    `zip+4`, 
	homePhone, 
	workPhone, 
	extension, 
	cellPhone, 
	email,
    nativeLanguage, -- FK
    ethnicity, -- FK
    hispanicOrLatino,
    doeReferral,  -- FK
    lvmReferral,  -- FK
    doeEmployStatus, -- FK
    doeOccupation, -- FK??
    dateAdded,
    dateModified,
    isTestData)
VALUES(
    `site`, -- FK
	`doeID`,
	`lastName`,
	`firstName`,
	`intakeDate`,
	`dob`,
	`gender`,
	`primaryServiceType`,
	`status`,
	`address1`,
    `address2`,
	`city`,
    `state`,
    `zip`,
    `zip+4`, 
	`homePhone`, 
	`workPhone`, 
	`extension`, 
	`cellPhone`, 
	`email`,
    `nativeLanguage`, -- FK
    `ethnicity`, -- FK
    `hispanicOrLatino`,
    `doeReferral`,  -- FK
    `lvmReferral`,  -- FK
    `doeEmployStatus`, -- FK
    `doeOccupation`, -- FK??
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //