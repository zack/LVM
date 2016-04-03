-- --------------------------------------------
-- 04LVMUpdateStudentPublicAssistanceTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentPublicAssistance table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentPublicAssistance;

DELIMITER //

CREATE PROCEDURE updateStudentPublicAssistanceTable(
  `student` int,
  `TFADC` bit,
  `EAEDC` bit,
  `Food Stamps` bit,
  `EA` bit,
  `SSI` bit,
  `None` bit,
  `Other` bit,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentPublicAssistance(
  `student`,
  `TFADC`,
  `EAEDC`,
  `Food Stamps`,
  `EA`,
  `SSI`,
  `None`,
  `Other`,
  `dateAdded`,
  `dateModified`,
  `isTestData`)
VALUES(
	`student`,
    `TFADC`,
	`EAEDC`,
	`Food Stamps`,
	`EA`,
	`SSI`,
	`None`,
	`Other`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //