-- --------------------------------------------
-- 04LVMUpdateMatchesTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to update data in the matches table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateMatches;

DELIMITER //

CREATE PROCEDURE updateMatches(
  `doeMatchID` int,
  `tutor` int, -- FK
  `student` int, -- FK
  `matchEnd` date,
  `dateModified` datetime)

BEGIN

UPDATE Matches 
SET matches.status = 'Dissolved',
	matches.matchEnd = matchEnd, 
	matches.dateModified = dateModified
WHERE matches.tutor = tutor AND
		matches.student = student AND
        matches.doeMatchID = doeMatchID;
    
END //