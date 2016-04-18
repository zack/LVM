-- --------------------------------------------
-- 04LVMUpdateStudentContactInfoTableSproc
-- Date: April 10 2016
-- 
-- Creates sproc to insert data into the StudentContactInfo table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentContactInfoTable;

DELIMITER //

CREATE PROCEDURE updateStudentContactInfoTable(
  `student` int,
  `okayToMail` boolean,
  `okayToEmail` boolean,
  `cellMsgOk` boolean,
  `homeMsgOk` boolean,
  `workMsgOk` boolean,
  `altMsgOk` boolean,
  `cellLVMOk` boolean,
  `homeLVMOk` boolean,
  `workLVMOk` boolean,
  `altLVMOk` boolean,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentContactInfo(
  `student`,
  `okayToMail`,
  `okayToEmail`,
  `cellMsgOk`,
  `homeMsgOk`,
  `workMsgOk`,
  `altMsgOk`,
  `cellLVMOk`,
  `homeLVMOk`,
  `workLVMOk`,
  `altLVMOk`,
  `dateAdded`,
  `dateModified`,
  `isTestData`)
VALUES(
	`student`,
    `okayToMail`,
	`okayToEmail`,
	`cellMsgOk`,
	`homeMsgOk`,
	`workMsgOk`,
	`altMsgOk`,
	`cellLVMOk`,
	`homeLVMOk`,
	`workLVMOk`,
	`altLVMOk`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //