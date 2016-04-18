-- --------------------------------------------
-- 05LVMselect *TestData
-- Date: MAR 28 2116
-- 
-- SELECT *s all test data from the database
-- --------------------------------------------

USE lvm;

DELETE FROM Student WHERE isTestData = 1;
DELETE FROM StudentAssessment WHERE isTestData = 1;
DELETE FROM StudentGoals WHERE isTestData = 1;
DELETE FROM StudentComputerSkills WHERE isTestData = 1;
DELETE FROM StudentContactInfo WHERE isTestData = 1;
DELETE FROM StudentWorkExperience WHERE isTestData = 1;
DELETE FROM StudentDisabiltyAccommodations WHERE isTestData = 1;
DELETE FROM StudentPublicAssistance WHERE isTestData = 1;
DELETE FROM PersonPreferences WHERE isTestData = 1;

DELETE FROM Tutor WHERE isTestData = 1;
DELETE FROM Matches WHERE isTestData = 1;
DELETE FROM Meeting WHERE isTestData = 1;
DELETE FROM Person WHERE isTestData = 1;
DELETE FROM `Exit` WHERE isTestData = 1;