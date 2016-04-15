-- --------------------------------------------
-- 06LVMAddMeetingSproc
-- Date: April 1 2016
-- 
-- Add Meeting into database and update all necessary tables
-- --------------------------------------------
USE lvm;

DROP PROCEDURE IF EXISTS addMeeting;


DELIMITER //

-- ones marked with null can be null 

CREATE PROCEDURE addMeeting(

		-- meeting table
		matching int, -- FK
		`date` date,
        hours int,
        didNotMeet boolean,
        couldNotContact boolean,
        dateAdded datetime,
        dateModified datetime,
        isTestData bit -- enter 0 for all real data being entered
  )

BEGIN


-- ----------------------- ADD Match ---------------------------

CALL updateMeetingTable(
		matching,
		`date`,
		hours,
		didNotMeet,
		couldNotContact,
		dateAdded,
		dateModified,
		isTestData);


END //