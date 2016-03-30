-- --------------------------------------------
-- 03LVMAlterTableScript
-- Date: MAR 24 2016
-- 
-- Alters the Tables in the LVM database
-- --------------------------------------------

USE lvm;

-- ------------------ ALTERING DOEOccupation TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableDOEOccupation; //

DELIMITER //
CREATE PROCEDURE alterTableDOEOccupation()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'DOEOccupation' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `DOEOccupation`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT;
                
END IF ; 
	INSERT IGNORE INTO `DOEOccupation` (`id`, `occupation`) values
			(1, 'Death'),
			(2, 'Did not comply with program policies'),
			(3, 'Entered college or training program'),
			(4, 'Entered employment'),
			(5, 'Entered other ABE program'),
			(6, 'Family problems'),
			(7, 'Illness/incapacity'),
			(8, 'Lack of dependent child care resources'),
			(9, 'Lack of interest'),
			(10, 'Lack of transportation resources'),
			(11, 'Met goal(s)'),
			(12, 'Moved'),
			(13, 'Personal Reasons'),
			(14, 'Prison sentence ended'),
			(15, 'Program did not meet student needs'),
			(16, 'Time and/or location of resources not feasible'),
			(17, 'Tutor ended the match'),
			(18, 'Unable to contact');
END//


CALL alterTableDOEOccupation();
