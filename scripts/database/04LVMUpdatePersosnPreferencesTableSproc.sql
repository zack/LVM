-- --------------------------------------------
-- 04LVMUpdatePersonPreferencesTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the PersonPreferences table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updatePersonPreferencesTable;

DELIMITER //

CREATE PROCEDURE updatePersonPreferencesTable(
  `person` int,
  `maleTeen` bit,
  `femaleTeen` bit,
  `male20-25` bit,
  `female20-25` bit,
  `male26-35` bit,
  `female26-35` bit,
  `male36-45` bit,
  `female36-45` bit,
  `male46-65` bit,
  `female46-65` bit,
  `male66+` bit,
  `female66+` bit,
  `comments` varchar(2000), 
  `publicLibrary` boolean,
  `otherLocation` varchar(255),
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO PersonPreferences(
  `person`,
  `maleTeen`,
  `femaleTeen`,
  `male20-25`,
  `female20-25`,
  `male26-35`,
  `female26-35`,
  `male36-45`,
  `female36-45`,
  `male46-65`,
  `female46-65`,
  `male66+`,
  `female66+`,
  `comments`, 
  `publicLibrary`,
  `otherLocation`,
  `dateAdded`,
  `dateModified`,
  `isTestData`)
VALUES(
	`person`,
    `maleTeen`,
    `femaleTeen`,
    `male20-25`,
    `female20-25`,
    `male26-35`,
    `female26-35`,
    `male36-45`,
    `female36-45`,
    `male46-65`,
    `female46-65`,
    `male66+`,
    `female66+`,
    `comments`, 
    `publicLibrary`,
    `otherLocation`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //