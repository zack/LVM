-- --------------------------------------------
-- 04LVMUpdateStudentWorkExperienceTableSproc
-- Date: April 10 2016
-- 
-- Creates sproc to insert data into the StudentWorkExperience table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentWorkExperienceTable;

DELIMITER //

CREATE PROCEDURE updateStudentWorkExperienceTable(
  `student` int,
  `occupation` int, -- FK
  `employer` varchar(255),
  `cityTown` varchar(255),
  `fullTime` boolean,
  `partTime` boolean,
  `multipleJobs` boolean,
  `tempJobs` boolean,
  `recentLayoff` boolean,
  `concernReLayoff` boolean,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentWorkExperience(
  `student`,
  `occupation`,
  `employer`,
  `cityTown`,
  `fullTime`,
  `partTime`,
  `multipleJobs`,
  `tempJobs`,
  `recentLayoff`,
  `concernReLayoff`,
  `dateAdded`,
  `dateModified`,
  `isTestData`)
VALUES(
	`student`,
    `occupation`,
	`employer`,
	`cityTown`,
	`fullTime`,
	`partTime`,
	`multipleJobs`,
	`tempJobs`,
	`recentLayoff`,
	`concernReLayoff`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //