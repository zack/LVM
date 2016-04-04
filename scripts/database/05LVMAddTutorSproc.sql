-- --------------------------------------------
-- 06LVMAddTutorSproc
-- Date: April 1 2016
-- 
-- Add tutor into database and update all necessary tables
-- --------------------------------------------
USE lvm;

DROP PROCEDURE IF EXISTS addTutor;


DELIMITER //

-- ones marked with null can be null 

CREATE PROCEDURE addTutor(
		affiliate varchar(255), -- FK
        doeID int, 
        newForFY int, 
        lastname varchar(255), 
        firstname varchar(255),
        intakeDate date,
        dob date, 
        gender enum('Male','Female'),
        primaryServiceType enum('ESOL','BL','Both ESOL/BL'),
		status enum('Current','Exited','Partial'),
		address1 varchar(255),
		address2 varchar(255), -- null
		city varchar(255),
		state varchar(2),
		zip varchar(5),
		`zip+4` varchar(4), -- null
		homePhone varchar(10), -- null
		workPhone varchar(10), -- null
		extension varchar(10), -- null
		cellPhone varchar(10), -- null
		email varchar(255), -- null
		nativeLanguage varchar(255), -- FK
		studentEthnicity varchar(255), -- FK
		doeReferral varchar(255),  -- FK
		lvmReferral varchar(255),  -- FK
		yearsUS int,
		yearsForeign int,
		doeEmployStatus varchar(255), -- FK
		doeOccupation varchar(255), -- FK
		dateAdded datetime,
		dateModified datetime,
        isTestData bit -- enter 0 for all real data being entered
  )

BEGIN

DECLARE personID int;
DECLARE tutorID int;
DECLARE affiliateID int;
DECLARE languageID int; 
DECLARE ethnicityID int;
DECLARE doeReferralID int;
DECLARE lvmReferralID int;
DECLARE employStatusID int;
DECLARE occupationID int;


                    
SET affiliateID = (SELECT id FROM Sites WHERE name = affiliate);
SET languageID = (SELECT id FROM DOENativeLanguage WHERE nativeLanguage = language);
SET ethnicityID = (SELECT id FROM Ethnicity WHERE ethnicity = studentEthnicity);
SET doeReferralID = (SELECT id FROM DOEReferral WHERE referral = doeReferral);
SET lvmReferralID = (SELECT id FROM LVMReferral WHERE referral = lvmReferral);
SET employStatusID = (SELECT id FROM EmploymentStatus WHERE estatus = doeEmployStatus);
SET occupationID = (SELECT id FROM DOEOccupation WHERE occupation = doeOccupation);


-- ----------------------- ADD Person ---------------------------

CALL updatePersonTable(
		affiliateID,
        doeID,
        newForFY,
        lastname,
        firstname,
        intakeDate,
        dob,
        gender,
        primaryServiceType,
        status,
        address1,
        address2,
        city,
        state,
        zip,
        `zip+4`,
        homePhone,
        workPhone,
        extension,
        cellPhone,
        email,
        languageID,
        ethnicityID,
        doeReferralID,
        lvmReferralID,
        yearsUS,
        yearsForeign,
        employStatusID,
        occupationID,
        dateAdded,
        dateModified,
        isTestData);
        
SET personID = (SELECT max(id) FROM Person WHERE firstName = firstname AND lastName = lastname LIMIT 1);

-- ----------------------- ADD Tutor --------------------------

CALL updateTutorTable(
        personID,
        occupationID,
        dateAdded,
        dateModified,
        isTestData);
        
SET tutorID = (SELECT max(id) FROM Tutor WHERE personID = person LIMIT 1);


END //