-- --------------------------------------------
-- 04LVMAddTestStudentGoalsSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentGoals table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestStudentGoals;

DELIMITER //

CREATE PROCEDURE addTestStudentGoals(
  `id` int,
  `student` int, -- FK
  `goal` varchar(255),
  `dateSet` date,
  `dateMet` date,
  `main` boolean,
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO StudentGoals(
	id,
	student, 
    goal,
    dateSet,
    dateMet,
    main,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`id`,
	`student`, 
    `goal`,
    `dateSet`,
    `dateMet`,
    `main`,
    `dateAdded`,
    `dateModified`,
    1);
    
END //