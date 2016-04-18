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
  `isTestData` bit default 0
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
  `zipCodeID` int NOT NULL,
  `countryOfOrigin` int NOT NULL, -- FK
  `singleParent` boolean NOT NULL,
  `learningDisability` boolean NOT NULL,
  `physicalDisability` boolean NOT NULL,
  `emergencyContactName` varchar(50) DEFAULT NULL,
  `emergencyContactNumber` varchar(10) DEFAULT NULL, 
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
);

CREATE TABLE IF NOT EXISTS StudentContactInfo (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `okayToMail` boolean NOT NULL,
  `okayToEmail` boolean NOT NULL,
  `cellMsgOk` boolean DEFAULT NULL,
  `homeMsgOk` boolean DEFAULT NULL,
  `workMsgOk` boolean DEFAULT NULL,
  `altMsgOk` boolean DEFAULT NULL,
  `cellLVMOk` boolean DEFAULT NULL,
  `homeLVMOk` boolean DEFAULT NULL,
  `workLVMOk` boolean DEFAULT NULL,
  `altLVMOk` boolean DEFAULT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS PersonPreferences (
  `id` int NOT NULL,
  `person` int NOT NULL, -- FK
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
  `comments` varchar(2000) DEFAULT NULL, 
  `publicLibrary` boolean NOT NULL,
  `otherLocation` varchar(255) DEFAULT NULL,
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
  `Other` varchar(255) DEFAULT NULL,
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
  `result` varchar(10) NOT NULL,
  `fedLevel` int DEFAULT NULL, -- FK??
  `fedType` int DEFAULT NULL, -- FK??
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS StudentDependents (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `yearOfBirth` int NOT NULL,
  `inSchool` boolean NOT NULL,
  `sameHouse` boolean NOT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
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
  `isTestData` bit default 0
);

CREATE TABLE IF NOT EXISTS StudentWorkExperience (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `occupation` int NOT NULL, -- FK
  `employer` varchar(255) DEFAULT NULL,
  `cityTown` varchar(255) DEFAULT NULL,
  `fullTime` boolean NOT NULL,
  `partTime` boolean NOT NULL,
  `multipleJobs` boolean NOT NULL,
  `tempJobs` boolean NOT NULL,
  `recentLayoff` boolean DEFAULT NULL,
  `concernReLayoff` boolean DEFAULT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
);

CREATE TABLE IF NOT EXISTS StudentComputerSkills (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `haveComputerAtHome` boolean DEFAULT NULL,
  `useComputerAtHome` boolean DEFAULT NULL,
  `useComputerAtLibrary` boolean DEFAULT NULL,
  `useComputerAtWork` boolean DEFAULT NULL,
  `useSmartphone` boolean DEFAULT NULL,
  `useEmail` boolean DEFAULT NULL,
  `useInternet` boolean DEFAULT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
);

CREATE TABLE IF NOT EXISTS StudentDisabiltyAccommodations (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `notRequiredToDisclose` boolean NOT NULL,
  `wishToDisclose` boolean NOT NULL,
  `understandEligibleForAccommodations` boolean NOT NULL,
  `wishToRequestAccommodations` boolean NOT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS StudentQuestions (
  `id` int NOT NULL,
  `question` varchar(255)
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS StudentAnswers (
  `id` int NOT NULL,
  `student` int NOT NULL, -- FK
  `question` int NOT NULL, -- FK
  `answer` varchar(2000) NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
);

-- -------------------------------------------
-- STUDENT/TUTOR AVAILABILITY INFORMATION
-- -------------------------------------------
CREATE TABLE IF NOT EXISTS PersonAvailability (
  `id` int NOT NULL,
  `person` int NOT NULL, -- FK
  `day` int NOT NULL,
  `startTime` int NOT NULL,
  `endTime` int NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
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
  `orientation` date DEFAULT NULL,
  `training` date DEFAULT NULL,
  `trainingtype` enum('ABE', 'ESOL') DEFAULT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
);

-- -------------------------------------------
CREATE TABLE IF NOT EXISTS TutorHours (
  `id` int NOT NULL,
  `matchID` int NOT NULL,
  `student` int NOT NULL,
  `tutor` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `hours` int NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
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
  `primaryServiceType` enum('ABE','ESOL') DEFAULT NULL,
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
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
  `hispanicOrLatino` boolean NOT NULL,
  `doeReferral` int NOT NULL,  -- FK
  `lvmReferral` int NOT NULL,  -- FK
  `doeEmployStatus` int NOT NULL, -- FK
  `doeOccupation` int NOT NULL, -- FK??
  `dateAdded` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `isTestData` bit default 0
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
  `isTestData` bit default 0
);
