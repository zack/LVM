-- --------------------------------------------
-- 04LVMAddTestMeetingSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the Meeting table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS addTestMeeting;

DELIMITER //

CREATE PROCEDURE addTestMeeting(
  `id` int,
  `matching` int, -- FK
  `date` date,
  `hours` int,
  `didNotMeet` boolean,
  `couldNotContact` boolean,
  `dateAdded` datetime,
  `dateModified` datetime)

BEGIN

INSERT INTO Meeting(
	id,
	matching,
    date,
    hours,
    didNotMeet,
    couldNotContact,
    dateAdded,
    dateModified,
    isTestData)
VALUES(
	`id`,
	`matching`,
    `date`,
    `hours`,
    `didNotMeet`,
    `couldNotContact`,
    `dateAdded`,
    `dateModified`,
    1);
    
END //