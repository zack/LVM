-- --------------------------------------------
-- 04LVMUpdateExitTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the Exit table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateExitTable;

DELIMITER //

CREATE PROCEDURE updateExitTable(
  `person` int, -- FK
  `date` date,
  `doeReason` int,
  `lvmReason` int,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO `Exit`(
	person, 
    date,
    doeReason,
    lvmReason,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`person`, 
    `date`,
    `doeReason`,
    `lvmReason`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //