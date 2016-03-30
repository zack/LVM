-- --------------------------------------------
-- 04LVMAddTestTutorSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the tutor table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestTutor;


DELIMITER //

CREATE PROCEDURE addTestTutor(
  `id` int,
  `person` int,
  `occupation` varchar(255),
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO Tutor(
	id,
	person,
	occupation,
	dateAdded,
	dateModified,
    isTestData)
VALUES(
	`id`,
    `person`,
    `occupation`,
    `dateAdded`,
    `dateModified`,
    1);
    
END //