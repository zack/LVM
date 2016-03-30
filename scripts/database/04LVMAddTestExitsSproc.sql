-- --------------------------------------------
-- 04LVMAddTestExitsSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the Exits table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestExit;

DELIMITER //

CREATE PROCEDURE addTestExit(
  `id` int,
  `person` int, -- FK
  `date` date,
  `doeReason` int,
  `lvmReason` int,
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO `Exit`(
	id,
	person, 
    date,
    doeReason,
    lvmReason,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`id`,
	`person`, 
    `date`,
    `doeReason`,
    `lvmReason`,
    `dateAdded`,
    `dateModified`,
    1);
    
END //