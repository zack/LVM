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
SET Matches.status = 'Dissolved',
	Matches.matchEnd = matchEnd, 
	Matches.dateModified = dateModified
WHERE Matches.tutor = tutor AND
		Matches.student = student AND
        Matches.doeMatchID = doeMatchID;
    
END //