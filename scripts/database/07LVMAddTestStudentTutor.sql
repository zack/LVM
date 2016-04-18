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

-- TEST Tutors -- 
CALL addTutor('Boston',1,2014,'Josephson','Bob','2013-10-04','1990-08-28','Male','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu','Russian','White','Court','Other',3,17,'Student','Pipelayers',curdate(),curdate(),1);
CALL addTutor('Lowell',45,2014,'Stuart','Max','2013-10-04','1985-08-28','Male','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu','Russian','White','Court','Other',3,17,'Student','Pipelayers',curdate(),curdate(),1);
CALL addTutor('Quincy',12,2014,'Maria','Ana','2013-10-04','1970-08-28','Female','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu','Russian','White','Court','Other',3,17,'Student','Pipelayers',curdate(),curdate(),1);

-- TEST STUDENTS -- 
CALL addStudent('Boston',23,2014,'Korolev','Anastasia','2013-10-04','1995-08-28','Female','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu','Russian','White','Court','Other',3,17,'Student','Pipelayers',curdate(),curdate(),28653,TRUE,TRUE,TRUE,10,'Russian Federation',2,0,'None',True,True,False,1,0,0,0,1,1,0,1,0,1,1,1,'Open a Checking or Savings Account',curdate(),NULL,True,'2016-01-29','ESLOA','20%',34,97,True,1,0,0,0,0,0,1,1);
CALL addStudent('Boston',5,2014,'Stevenson','Jose','2013-10-04','1995-08-28','Male','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu','Russian','White','Court','Other',3,17,'Student','Pipelayers',curdate(),curdate(),28653,TRUE,TRUE,TRUE,10,'Russian Federation',2,0,'None',True,True,False,1,0,0,0,1,1,0,1,0,1,1,1,'Open a Checking or Savings Account',curdate(),NULL,True,'2016-01-29','ESLOA','20%',34,97,True,0,1,0,1,0,0,0,1);
CALL addStudent('Boston',10,2014,'Roberts','Ana','2013-10-04','1995-08-28','Female','BL','Current','1155 Tremont Street',NULL,'Roxbury Crossing','MA','02120',NULL,NULL,NULL,NULL,'6177842131','korolev.a@husky.neu.edu','Russian','White','Court','Other',3,17,'Student','Pipelayers',curdate(),curdate(),28653,TRUE,TRUE,TRUE,10,'Russian Federation',2,0,'None',True,True,False,1,0,0,0,1,1,0,1,0,1,1,1,'Open a Checking or Savings Account',curdate(),NULL,True,'2016-01-29','ESLOA','20%',34,97,True,0,0,0,0,0,1,0,1);

END//

CALL addTestPeople();

INSERT IGNORE INTO `Matches` (`id`, `site`, `doeMatchID`, `status`, `tutor`, `student`, `matchStart`, `matchEnd`, `onHold`, `dateAdded`, `dateModified`, `isTestData`) VALUES
         (1, 5, 6032, 'Current', 1, 1, CURDATE(), null, 0, CURDATE(), CURDATE(), 1),
         (2, 5, 6033, 'Current', 2, 2, CURDATE(), null, 1, CURDATE(), CURDATE(), 1),
         (3, 10, 6034, 'Current', 1, 3, CURDATE(), null, 0, CURDATE(), CURDATE(), 1),
         (4, 10, 6035, 'Dissolved', 2, 3, CURDATE(), CURDATE(), 0, CURDATE(), CURDATE(), 1),
         (5, 5, 6036, 'Dissolved', 3, 2, CURDATE(), CURDATE(), 1, CURDATE(), CURDATE(), 1) //