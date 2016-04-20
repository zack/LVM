-- --------------------------------------------
-- 06LVMAddTestStudentTutor
-- Date: APRIL 1 2016
-- 
-- Creates sproc to inserts test students and tutors table
-- --------------------------------------------

DROP PROCEDURE IF EXISTS addTestPeople;

DELIMITER //

CREATE PROCEDURE addTestPeople()

BEGIN

DECLARE p1 int;
DECLARE p2 int;
DECLARE p3 int;
DECLARE p4 int;
DECLARE p5 int;
DECLARE p6 int;

DECLARE s1 int;
DECLARE s2 int;
DECLARE s3 int;

DECLARE t1 int;
DECLARE t2 int;
DECLARE t3 int;

-- TEST Tutors -- 
CALL addTutor(5,1,'Josephson','Bob','2013-10-04','1990-08-28','Male','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu',10,5,FALSE,1,2,3,4,curdate(),curdate(),1,curdate(),curdate(),'ESOL',1,0,0,1,1,0,0,1,1,0,0,1,'Hello here is a comment!',TRUE,NULL,@Person1,@Tutor1);
CALL addTutor(5,45,'Stuart','Max','2013-10-04','1985-08-28','Male','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu',10,5,FALSE,1,2,3,4,curdate(),curdate(),1,curdate(),curdate(),'ESOL',1,0,0,1,1,0,0,1,1,0,0,1,'Hello here is a comment!',TRUE,NULL,@Person2,@Tutor2);
CALL addTutor(5,12,'Maria','Ana','2013-10-04','1970-08-28','Female','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu',10,5,FALSE,1,2,3,4,curdate(),curdate(),1,curdate(),curdate(),'ESOL',1,0,0,1,1,0,0,1,1,0,0,1,'Hello here is a comment!',TRUE,NULL,@Person3,@Tutor3);

SET p1 = (SELECT @Person1);
SET p2 = (SELECT @Person2);
SET p3 = (SELECT @Person3);

SET t1 = (SELECT @Tutor1);
SET t2 = (SELECT @Tutor2);
SET t3 = (SELECT @Tutor3);

-- TEST STUDENT AVAILABILITY --

CALL updatePersonAvailability(p1,1,8,12,curdate(),curdate(),1);
CALL updatePersonAvailability(p1,3,12,5,curdate(),curdate(),1);
CALL updatePersonAvailability(p1,5,12,5,curdate(),curdate(),1);
CALL updatePersonAvailability(p1,6,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p2,1,8,12,curdate(),curdate(),1);
CALL updatePersonAvailability(p2,2,8,12,curdate(),curdate(),1);
CALL updatePersonAvailability(p2,4,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p2,5,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p3,1,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p3,6,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p3,7,12,5,curdate(),curdate(),1);
CALL updatePersonAvailability(p3,7,5,9,curdate(),curdate(),1);


-- TEST STUDENTS -- 
CALL addStudent(5,23,'Korolev','Anastasia','2013-10-04','1995-08-28','Female','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu',10,5,FALSE,1,2,3,4,curdate(),curdate(),28653,56,TRUE,TRUE,TRUE,'Vera','4164147622',True,False,True,False,True,False,True,False,True,False,1,0,0,0,0,1,1,0,0,1,1,1,'This is a Comment!',TRUE,NULL,0,0,0,0,0,1,NULL,curdate(),1,'50%',NULL,NULL,5,curdate(),NULL,TRUE,'NEU','Boston',TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,NULL,1,@Person4,@Student1);
CALL addStudent(5,5,'Stevenson','Jose','2013-10-04','1995-08-28','Male','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu',10,5,FALSE,1,2,3,4,curdate(),curdate(),28654,56,TRUE,TRUE,TRUE,'Vera','4164147622',True,False,True,False,True,False,True,False,True,False,1,0,0,0,0,1,1,0,0,1,1,1,'This is a Comment!',TRUE,NULL,0,0,0,0,0,1,NULL,curdate(),1,'50%',NULL,NULL,5,curdate(),NULL,TRUE,'NEU','Boston',TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,NULL,1,@Person5,@Student2);
CALL addStudent(5,10,'Roberts','Ana','2013-10-04','1995-08-28','Female','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu',10,5,FALSE,1,2,3,4,curdate(),curdate(),28655,56,TRUE,TRUE,TRUE,'Vera','4164147622',True,False,True,False,True,False,True,False,True,False,1,0,0,0,0,1,1,0,0,1,1,1,'This is a Comment!',TRUE,NULL,0,0,0,0,0,1,NULL,curdate(),1,'50%',NULL,NULL,5,curdate(),NULL,TRUE,'NEU','Boston',TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,NULL,1,@Person6,@Student3);

SET p4 = (SELECT @Person4);
SET p5 = (SELECT @Person5);
SET p6 = (SELECT @Person6);

SET s1 = (SELECT @Student1);
SET s2 = (SELECT @Student2);
SET s3 = (SELECT @Student3);

-- TEST STUDENT DEPENDENTS -- 

CALL updateStudentDependentsTable(s1,1995,FALSE,TRUE,'Comment',curdate(),curdate(),1);
CALL updateStudentDependentsTable(s1,1997,TRUE,TRUE,'Comment',curdate(),curdate(),1);
CALL updateStudentDependentsTable(s1,1999,TRUE,TRUE,'Comment',curdate(),curdate(),1);
CALL updateStudentDependentsTable(s1,2001,FALSE,TRUE,'Comment',curdate(),curdate(),1);
CALL updateStudentDependentsTable(s2,2000,TRUE,TRUE,'Comment',curdate(),curdate(),1);
CALL updateStudentDependentsTable(s2,2001,FALSE,TRUE,'Comment',curdate(),curdate(),1);

-- TEST STUDENT AVAILABILITY --

CALL updatePersonAvailability(p4,1,8,12,curdate(),curdate(),1);
CALL updatePersonAvailability(p4,3,12,5,curdate(),curdate(),1);
CALL updatePersonAvailability(p4,5,12,5,curdate(),curdate(),1);
CALL updatePersonAvailability(p4,6,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p5,1,8,12,curdate(),curdate(),1);
CALL updatePersonAvailability(p5,2,8,12,curdate(),curdate(),1);
CALL updatePersonAvailability(p5,4,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p5,5,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p6,1,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p6,6,5,9,curdate(),curdate(),1);
CALL updatePersonAvailability(p6,7,12,5,curdate(),curdate(),1);
CALL updatePersonAvailability(p6,7,5,9,curdate(),curdate(),1);

-- TEST STUDENT ANSWERS --

CALL updateStudentAnswersTable(s1,1,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s1,7,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s1,10,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s1,12,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s2,3,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s2,9,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s2,5,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s2,11,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s3,1,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s3,2,'Test Answer!',curdate(),curdate(),1);
CALL updateStudentAnswersTable(s3,3,'Test Answer!',curdate(),curdate(),1);

-- TEST MATCH
CALL addMatch(5,1,1,2,curdate(),NULL,'ESOL',0,curdate(),curdate(),1);
CALL addMatch(5,2,2,3,curdate(),NULL,'ESOL',0,curdate(),curdate(),1);
CALL addMatch(5,3,3,1,curdate(),NULL,'ESOL',0,curdate(),curdate(),1);

-- TEST MEETING
CALL addMeeting(1,curdate(),6,FALSE,FALSE,curdate(),curdate(),1);
CALL addMeeting(2,curdate(),0,TRUE,TRUE,curdate(),curdate(),1);
CALL addMeeting(3,curdate(),2,FALSE,FALSE,curdate(),curdate(),1);
CALL addMeeting(2,curdate(),8,FALSE,FALSE,curdate(),curdate(),1);

-- TEST EXIT
CALL addExitRemoveMatch(TRUE,TRUE,1,2,3,4,5,1,1,2,curdate(),curdate(),curdate(),1);

END//

CALL addTestPeople();

INSERT IGNORE INTO `Matches` (`id`, `site`, `doeMatchID`, `status`, `tutor`, `student`, `matchStart`, `matchEnd`, `onHold`, `dateAdded`, `dateModified`, `primaryServiceType`, `isTestData`) VALUES
         (1, 5, 6032, 'Current', 1, 1, CURDATE(), null, 0, CURDATE(), CURDATE(), 'ESOL', 1),
         (2, 5, 6033, 'Current', 2, 2, CURDATE(), null, 1, CURDATE(), CURDATE(), 'ESOL', 1),
         (3, 10, 6034, 'Current', 1, 3, CURDATE(), null, 0, CURDATE(), CURDATE(), 'ESOL', 1),
         (4, 10, 6035, 'Dissolved', 2, 3, CURDATE(), CURDATE(), 0, CURDATE(), CURDATE(), 'ESOL', 1),
         (5, 5, 6036, 'Dissolved', 3, 2, CURDATE(), CURDATE(), 1, CURDATE(), CURDATE(), 'ESOL', 1) //