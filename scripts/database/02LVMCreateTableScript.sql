-- --------------------------------------------
-- 02LVMCreateTableScript
-- Date: MAR 24 2016
-- 
-- Creates tables for LVM database
-- --------------------------------------------

USE lvm;


CREATE TABLE IF NOT EXISTS AssessmentTypes (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS EmploymentStatus (
  `id` int NOT NULL,
  `estatus` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS Ethnicity (
  `id` int NOT NULL,
  `ethnicity` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS Meeting (
  `id` int NOT NULL,
  `matching` int NOT NULL, -- FK
  `date` date NOT NULL,
  `hours` int NOT NULL,
  `didNotMeet` boolean NOT NULL,
  `couldNotContact` boolean NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS PublicAssistance (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS Sites (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS Student (
  `id` int NOT NULL,
  `person` int NOT NULL, -- FK
  `smarttID` int NOT NULL,
  `okayToCall` boolean NOT NULL,
  `okayToMail` boolean NOT NULL,
  `okayToEmail` boolean NOT NULL,
  `zipCodeID` int NOT NULL,
  `countryOfOrigin` int NOT NULL, -- FK
  `timeInJobMonths` int DEFAULT NULL,
  `timeInJobYears` int DEFAULT NULL,
  `publicAssistance` int NOT NULL, -- FK
  `singleParent` boolean NOT NULL,
  `learningDisability` boolean NOT NULL,
  `physicalDisability` boolean NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS StudentPreferences (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `maleTeen` bit DEFAULT 0,
  `femaleTeen` bit DEFAULT 0,
  `male20-25` bit DEFAULT 0,
  `female20-25` bit DEFAULT 0,
  `male26-35` bit DEFAULT 0,
  `female26-35` bit DEFAULT 0,
  `male36-45` bit DEFAULT 0,
  `female36-45` bit DEFAULT 0,
  `male46-65` bit DEFAULT 0,
  `female46-65` bit DEFAULT 0,
  `male66+` bit DEFAULT 0,
  `female66+` bit DEFAULT 0,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit DEFAULT 0
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS StudentPublicAssistance (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `TFADC` bit DEFAULT 0,
  `EAEDC` bit DEFAULT 0,
  `Food Stamps` bit DEFAULT 0,
  `EA` bit DEFAULT 0,
  `SSI` bit DEFAULT 0,
  `None` bit DEFAULT 0,
  `Other` bit DEFAULT 0,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit DEFAULT 0
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS StudentAssessment (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `date` date NOT NULL,
  `test` int NOT NULL, -- FK
  `result` varchar(255) NOT NULL,
  `fedLevel` int NOT NULL, -- FK??
  `fedType` int NOT NULL, -- FK??
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS StudentDependents (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `yearOfBirth` int NOT NULL,
  `inSchool` boolean NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS StudentGoals (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `goal` int NOT NULL, -- FK
  `dateSet` date NOT NULL, 
  `dateMet` date DEFAULT NULL,
  `main` boolean NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS DOEGoals (
  `id` int NOT NULL,
  `goal` varchar(255) NOT NULL,
  `def` varchar(500) DEFAULT NULL,
  `doc` varchar(255) DEFAULT NULL,
  `section` varchar(20) NOT NULL,
  `category`varchar(50) DEFAULT NULL,
  `followUp` bit DEFAULT 0
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS DOEOccupation (
  `id` int NOT NULL,
  `code` varchar(15) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `category` varchar(500) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS Tutor (
  `id` int NOT NULL,
  `person` int NOT NULL, -- FK
  `occupation` int NOT NULL, -- FK
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS Matches (
  `id` int NOT NULL,
  `site` int NOT NULL, -- FK
  `doeMatchID` int NOT NULL,
  `status` enum('Current','Dissolved') NOT NULL,
  `tutor` int NOT NULL, -- FK
  `student` int NOT NULL, -- FK
  `matchStart` date NOT NULL,
  `matchEnd` date DEFAULT NULL,
  `onHold` boolean NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS DOECountryOfOrigin (
  `id` int NOT NULL,
  `country` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS DOEReferral (
  `id` int NOT NULL,
  `referral` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS DOENativeLanguage (
  `id` int NOT NULL,
  `language` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS DOEExitReasons (
  `id` int NOT NULL,
  `type` enum('student','tutor') NOT NULL,
  `reason` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS LVMExitReasons (
  `id` int NOT NULL,
  `reason` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS LVMReferral (
  `id` int NOT NULL,
  `referral` varchar(255) NOT NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS Person (
  `id` int NOT NULL,
  `site` int NOT NULL, -- FK
  `doeID` int NOT NULL,
  `newForFY` int NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `intakeDate` date NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `primaryServiceType` enum('ESOL','BL','Both ESOL/BL') NOT NULL,
  `status` enum('Current','Exited','Partial') NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `zip+4` varchar(4) DEFAULT NULL,
  `homePhone` varchar(10) DEFAULT NULL,
  `workPhone` varchar(10) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `cellPhone` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nativeLanguage` int NOT NULL, -- FK
  `ethnicity` int NOT NULL, -- FK
  `doeReferral` int NOT NULL,  -- FK
  `lvmReferral` int NOT NULL,  -- FK
  `yearsUS` int NOT NULL,
  `yearsForeign` int NOT NULL,
  `doeEmployStatus` int NOT NULL, -- FK
  `doeOccupation` int NOT NULL, -- FK??
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS `Exit` (
  `id` int NOT NULL,
  `person` int NOT NULL, -- FK
  `date` date NOT NULL,
  `doeReason` int NOT NULL, -- FK
  `lvmReason` int NOT NULL, -- FK
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0 NULL
);