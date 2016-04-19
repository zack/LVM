-- --------------------------------------------
-- LVMValidateAlterTableInsert
-- Date: MAR 28 2016
-- 
-- Validate that data was inserted after the alter table script
-- 
-- EXPECTED RESULTS:
-- -----------------
-- AssessmentTypes = 9
-- EmploymentStatus = 7
-- Ethnicity = 9
-- PublicAssistance = 7
-- Sites = 14
-- LVMExitReasons = 21
-- LVMReferral = 24
-- DOECountryOfOrigin = 210
-- DOEExitReasons = 43
-- DOENativeLanguage = 29
-- DOEReferral = 25
-- DOEGoals = 65
-- DOEOccupation = 1094
-- StudentQuestions = 18
--
-- --------------------------------------------

USE lvm;

SELECT COUNT(*) FROM AssessmentTypes;
SELECT COUNT(*) FROM EmploymentStatus;
SELECT COUNT(*) FROM Ethnicity;
SELECT COUNT(*) FROM Sites;

SELECT COUNT(*) FROM LVMExitReasons;
SELECT COUNT(*) FROM LVMReferral;
SELECT COUNT(*) FROM DOECountryOfOrigin;
SELECT COUNT(*) FROM DOEExitReasons;
SELECT COUNT(*) FROM DOENativeLanguage;
SELECT COUNT(*) FROM DOEReferral;
SELECT COUNT(*) FROM DOEGoals;
SELECT COUNT(*) FROM DOEOccupation;

SELECT COUNT(*) FROM StudentQuestions;