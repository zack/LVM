-- --------------------------------------------
-- 06LVMAddMatchSproc
-- Date: April 1 2016
-- 
-- Add Match into database and update all necessary tables
-- --------------------------------------------
USE lvm;

DROP PROCEDURE IF EXISTS addMatch;


DELIMITER //

-- ones marked with null can be null 

CREATE PROCEDURE addMatch(

		-- match table
		affiliate int,
		doeMatchID int,
        tutor int,
		student int,
		matchStart date,
		matchEnd date, -- NULL
		primaryServiceType enum('ABE','ESOL'), -- NULL
		dateAdded datetime,
		dateModified datetime,
		isTestData bit -- enter 0 for all real data being entered
  )

BEGIN


-- ----------------------- ADD Match ---------------------------

CALL updateMatchesTable(
		affiliate,
		doeMatchID,
		'Current',
        tutor,
		student,
		matchStart,
		matchEnd,
		primaryServiceType,
		dateAdded,
		dateModified,
		isTestData);


END //