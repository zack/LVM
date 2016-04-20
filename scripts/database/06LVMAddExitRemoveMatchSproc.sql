-- --------------------------------------------
-- 06LVMaddExitRemoveMatchSproc
-- Date: April 1 2016
-- 
-- Add Exit into database and update all necessary tables
-- and dissolve match in database and update necessary tables
-- --------------------------------------------
USE lvm;

DROP PROCEDURE IF EXISTS addExitRemoveMatch;


DELIMITER //

-- ones marked with null can be null 

CREATE PROCEDURE addExitRemoveMatch(

		-- IS THERE AN EXIT?
        isTutorExit boolean,
        isStudentExit boolean,
        
		-- exit table -- can be all null if both tutor and student are not exiting
        doeExitReasonT int, 
        lvmExitReasonT int,
        doeExitReasonS int,
        lvmExitReasonS int,
        
		-- match table
		affiliate int,
		doeMatchID int,	
        tutor int,
		student int,
		endDate date, -- MUST ENTER THIS FIELD
        dateAdded datetime,
		dateModified datetime,
        isTestData bit
  )

BEGIN

DECLARE personT int;
DECLARE personS int;

SET personT = (select person from Tutor where id = tutor);
SET personS = (select person from Student where id = student);


-- ----------------------- Remove Match ---------------------------

CALL updateMatches(
		doeMatchID,
        tutor,
        student,
        endDate,
        dateModified); 
        
-- ----------------------- ADD Exit For Student And Update Person Table -----------------------------
IF (isTutorExit = TRUE)
THEN CALL updateExitTable(
		personT,
        endDate,
        doeExitReasonT,
        lvmExitReasonT,
        dateAdded,
		dateModified,
		isTestData);
	CALL updatePerson(
		personT,
        dateModified);

END IF;

-- ----------------------- ADD Exit For Student And Update Person Table -----------------------------

IF (isStudentExit = TRUE)
THEN CALL updateExitTable(
		personS,
        endDate,
        doeExitReasonS,
        lvmExitReasonS,
        dateAdded,
		dateModified,
		isTestData);
	CALL updatePerson(
		personS,
        dateModified);

END IF;


END //