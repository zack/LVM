-- --------------------------------------------
-- 04LVMUpdateStudentGoalsTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentGoals table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentGoalsTable;

DELIMITER //

CREATE PROCEDURE updateStudentGoalsTable(
  `student` int, -- FK
  `goal` varchar(255),
  `dateSet` date,
  `dateMet` date,
  `main` boolean,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentGoals(
	student, 
    goal,
    dateSet,
    dateMet,
    main,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`student`, 
    `goal`,
    `dateSet`,
    `dateMet`,
    `main`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //