Running Database Scripts: 

Only Run 00LVMDropDBScript if necessary to re-create entire db

Run numbered scripts (00-03) to create database

To add test data to the database run all 04 and 05 scripts 

To validate if all data was entered properly in the alter table script run LVMValidateAlterTableInsert.sql 
(this is for tables with predefined datasets)

-- EXPECTED RESULTS:
-- ------------------
-- AssessmentTypes = 9
-- EmploymentStatus = 7
-- Ethnicity = 9
-- PublicAssistance = 7
-- Sites = 13
-- LVMExitReasons = 21
-- LVMReferral = 24
-- DOECountryOfOrigin = 210
-- DOEExitReasons = 18
-- DOENativeLanguage = 29
-- DOEReferral = 25

To Validate if all test data was entered properly run LVMValidateTestDataInsert.sql

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

LVMDeleteTestData.sql must be run if you need to reload all test data once it has already been loaded
otherwise duplicate PK's will cause insert test data script to fail