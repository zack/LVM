-- --------------------------------------------
-- 05LVMAddTestDataSproc
-- Date: MAR 24 2016
-- 
-- Add test data into DB
-- --------------------------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS addTestData;
//

DELIMITER //

CREATE PROCEDURE addTestData()

BEGIN

DECLARE currentDate date;
DECLARE pastDate date;

SET currentDate = CURDATE();
SET pastDate = DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- ----------------------- ADD TEST Person ---------------------------

CALL addTestPerson(1,10,1,2013,'Strickland','Ron','2013-10-04','1999-01-22','Male','BL','Current','1155 Tremont St.','Boston','MA','02120',20,2,13,14,2,6,5,2,pastDate,currentDate);
CALL addTestPerson(2,15,2,2014,'Bush','Helen','2014-11-09','1995-08-28','Female','ESOL','Partial','1155 Tremont St.','Boston','MA','02120',20,2,13,14,2,6,5,6,pastDate,currentDate);
CALL addTestPerson(3,10,3,2013,'Lynch','Max','2013-05-04','1994-03-11','Male','BL','Current','1155 Tremont St.','Boston','MA','02120',20,2,13,14,2,6,5,15,pastDate,currentDate);
CALL addTestPerson(4,5,4,2015,'Henry','Kerry','2015-10-04','1996-10-22','Female','Both ESOL/BL','Partial','1155 Tremont St.','Boston','MA','02120',20,2,13,14,2,6,5,12,pastDate,currentDate);
CALL addTestPerson(5,10,5,2013,'Stevenson','Johnnie','2013-12-20','1999-01-22','Male','Both ESOL/BL','Current','1155 Tremont St.','Boston','MA','02120',20,2,13,14,2,6,5,3,pastDate,currentDate);
CALL addTestPerson(6,5,6,2014,'Cross','Margarita','2014-02-04','1999-01-22','Female','BL','Exited','1155 Tremont St.','Boston','MA','02120',20,2,13,14,2,6,5,9,pastDate,currentDate);
CALL addTestPerson(7,15,7,2015,'Bowers','Pat','2015-06-18','1999-01-22','Male','ESOL','Current','1155 Tremont St.','Boston','MA','02120',20,2,13,14,2,6,5,8,pastDate,currentDate);


-- ----------------------- ADD TEST Student --------------------------

CALL addTestStudent(1,1,1,true,true,true,02120,45,6,false,false,false,pastDate,currentDate);
CALL addTestStudent(2,2,2,true,true,true,02120,120,1,true,true,false,pastDate,currentDate);
CALL addTestStudent(3,3,3,true,true,true,02120,25,3,false,false,true,pastDate,currentDate);
CALL addTestStudent(4,4,4,true,true,true,02120,86,7,false,true,true,pastDate,currentDate);

-- ------------------ ADD TEST StudentAssessment ---------------------

CALL addTestStudentAssessment(1,1,'2016-01-20',1,'100%',1,1,pastDate, currentDate);
CALL addTestStudentAssessment(2,2,'2016-02-13',2,'90%',1,1,pastDate, currentDate);
CALL addTestStudentAssessment(3,3,'2016-03-02',3,'20%',1,1,pastDate, currentDate);
CALL addTestStudentAssessment(4,4,'2015-12-13',4,'45%',1,1,pastDate, currentDate);


-- ------------------ ADD TEST StudentDependents ---------------------

CALL addTestStudentDependents(1,1,1999,true,pastDate, currentDate);
CALL addTestStudentDependents(2,2,1995,false,pastDate, currentDate);
CALL addTestStudentDependents(3,3,1994,true,pastDate, currentDate);
CALL addTestStudentDependents(4,4,1996,false,pastDate, currentDate);

-- --------------------- ADD TEST StudentGoals -----------------------

CALL addTestStudentGoals(1,1,'Learn to write your name.','2015-05-20','2016-01-13',false,pastDate,currentDate);
CALL addTestStudentGoals(2,2,'Learn to tie my shoe','2016-01-20','2016-03-20',true,pastDate,currentDate);
CALL addTestStudentGoals(3,3,'Be able to write my own will.','2015-12-20','2016-01-10',false,pastDate,currentDate);
CALL addTestStudentGoals(4,4,'Be able to count to 20.','2015-08-20','2016-02-11',true,pastDate,currentDate);

-- ------------------------ ADD TEST Tutor ---------------------------

CALL addTestTutor(1,5,3,pastDate,currentDate);
CALL addTestTutor(2,6,9,pastDate,currentDate);
CALL addTestTutor(3,7,8,pastDate,currentDate);

-- ----------------------- ADD TEST Matches --------------------------

CALL addTestMatches(1,10,1,'current',1,1,'2015-02-20',NULL,false,pastDate,currentDate);
CALL addTestMatches(2,10,2,'current',1,3,'2016-02-20',NULL,false,pastDate,currentDate);
CALL addTestMatches(3,5,3,'dissolved',2,4,'2015-02-20','2016-03-01',false,pastDate,currentDate);
CALL addTestMatches(4,15,4,'current',3,2,'2015-12-01',NULL,true,pastDate,currentDate);

-- ----------------------- ADD TEST Meeting --------------------------

CALL addTestMeeting(1,1,'2016-02-15',1,false,false,pastDate,currentDate);
CALL addTestMeeting(2,1,'2016-03-17',0,true,true,pastDate,currentDate);
CALL addTestMeeting(3,2,'2016-01-05',2,false,false,pastDate,currentDate);
CALL addTestMeeting(4,3,'2015-10-30',0,true,false,pastDate,currentDate);
CALL addTestMeeting(5,4,'2015-05-15',3,false,false,pastDate,currentDate);

-- ------------------------ ADD TEST Exit ----------------------------

CALL addTestExit(1,4,'2016-03-25',1,1,currentDate,currentDate);

END //

CALL addTestData();