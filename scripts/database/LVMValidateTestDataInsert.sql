-- --------------------------------------------
-- LVMValidateTestDataInsert
-- Date: MAR 28 2016
-- 
-- Validate that test data was inserted into the DB
-- 
-- EXPECTED RESULTS:
-- -----------------
-- Student = 4
-- StudentAssessment = 4
-- StudentDependents = 4
-- StudentGoals = 4
-- Tutor = 3
-- Matches = 4
-- Meeting = 5
-- Person = 7
-- Exit = 1
-- 
-- --------------------------------------------

USE lvm;

SELECT COUNT(*) FROM Student WHERE isTestData = 1;
SELECT COUNT(*) FROM StudentAssessment WHERE isTestData = 1;
SELECT COUNT(*) FROM StudentDependents WHERE isTestData = 1;
SELECT COUNT(*) FROM StudentGoals WHERE isTestData = 1;
SELECT COUNT(*) FROM Tutor WHERE isTestData = 1;
SELECT COUNT(*) FROM Matches WHERE isTestData = 1;
SELECT COUNT(*) FROM Meeting WHERE isTestData = 1;
SELECT COUNT(*) FROM Person WHERE isTestData = 1;
SELECT COUNT(*) FROM `Exit` WHERE isTestData = 1;