-- --------------------------------------------
-- 04LVMUpdatePersonSproc
-- Date: APR 14 2016
-- 
-- Creates sproc to update data in the Person Table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updatePerson;

DELIMITER //

CREATE PROCEDURE updatePerson(
  `personID` int,
  `dateModified` datetime)

BEGIN

	UPDATE Person
	SET Person.status = 'Exited', person.dateModified = dateModified
	WHERE id = personID;

END //