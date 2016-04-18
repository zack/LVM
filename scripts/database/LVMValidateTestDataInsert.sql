-- --------------------------------------------
-- LVMValidateTestDataInsert
-- Date: MAR 28 2016
-- 
-- Validate that test data was inserted into the DB
-- 
-- EXPECTED RESULTS:
-- -----------------
-- Student = 3
-- StudentPreferences = 3
-- StudentPublicAssistance = 3
-- StudentAssessment = 3
-- StudentDependents = 3
-- StudentGoals = 3
-- Tutor = 3
-- Matches = 0
-- Meeting = 0
-- Person = 6
-- Exit = 0
-- 
-- --------------------------------------------

USE lvm;

SELECT COUNT(*) FROM Student WHERE isTestData = 1;
SELECT COUNT(*) FROM StudentPreferences WHERE isTestData = 1;
SELECT COUNT(*) FROM StudentPublicAssistance WHERE isTestData = 1;
SELECT COUNT(*) FROM StudentAssessment WHERE isTestData = 1;
SELECT COUNT(*) FROM StudentDependents WHERE isTestData = 1;
SELECT COUNT(*) FROM StudentGoals WHERE isTestData = 1;

SELECT COUNT(*) FROM Tutor WHERE isTestData = 1;
SELECT COUNT(*) FROM Matches WHERE isTestData = 1;
SELECT COUNT(*) FROM Meeting WHERE isTestData = 1;
SELECT COUNT(*) FROM Person WHERE isTestData = 1;
SELECT COUNT(*) FROM `Exit` WHERE isTestData = 1;