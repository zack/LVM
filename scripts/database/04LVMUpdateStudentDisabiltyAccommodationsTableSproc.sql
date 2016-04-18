-- --------------------------------------------
-- 04LVMUpdateStudentDisabiltyAccommodationsTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the StudentDisabiltyAccommodations table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateStudentDisabiltyAccommodationsTable;

DELIMITER //

CREATE PROCEDURE updateStudentDisabiltyAccommodationsTable(
  `student` int,
  `notRequiredToDisclose` boolean,
  `wishToDisclose` boolean,
  `understandEligibleForAccommodations` boolean,
  `wishToRequestAccommodations` boolean,
  `notes` varchar(2000),
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO StudentDisabiltyAccommodations(
  `student`,
  `notRequiredToDisclose`,
  `wishToDisclose`,
  `understandEligibleForAccommodations`,
  `wishToRequestAccommodations`,
  `notes`,
  `dateAdded`,
  `dateModified`,
  `isTestData`)
VALUES(
	`student`,
    `notRequiredToDisclose`,
    `wishToDisclose`,
    `understandEligibleForAccommodations`,
    `wishToRequestAccommodations`,
    `notes`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //