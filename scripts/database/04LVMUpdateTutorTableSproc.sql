-- --------------------------------------------
-- 04LVMUpdateTutorTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the tutor table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateTutorTable;


DELIMITER //

CREATE PROCEDURE updateTutorTable(
  `person` int,
  `occupation` varchar(255),
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO Tutor(
	person,
	occupation,
	dateAdded,
	dateModified,
    isTestData)
VALUES(
    `person`,
    `occupation`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //