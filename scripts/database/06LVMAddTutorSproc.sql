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
		-- person table
		affiliate int, -- FK
        doeID int, 
        lastname varchar(255), 
        firstname varchar(255),
        intakeDate date,
        dob date, 
        gender enum('Male','Female'),
        primaryServiceType enum('ESOL','BL','Both ESOL/BL'),
		`status` enum('Current','Exited','Partial'),
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
		nativeLanguage int, -- FK
		ethnicity int, -- FK
        hispanicOrLatino boolean,
		doeReferral int,  -- FK
		lvmReferral int,  -- FK
		doeEmployStatus int, -- FK
		doeOccupation int, -- FK
		dateAdded datetime,
		dateModified datetime,
        isTestData bit, -- enter 0 for all real data being entered
        
        -- tutor table
        orientation date,
		training date,
		trainingtype enum('ABE', 'ESOL'),
        
        -- preferences table
        mTeen bit ,
		fTeen bit ,
		`m20-25` bit ,
		`f20-25` bit ,
		`m26-35` bit ,
		`f26-35` bit ,
		`m36-45` bit ,
		`f36-45` bit ,
		`m46-65` bit ,
		`f46-65` bit ,
		`m66+` bit ,
		`f66+` bit,
        preferenceComments varchar(2000), 
		publicLibrary boolean,
		otherLocation varchar(255),
        
        OUT person int,
        OUT tutor int
  )

BEGIN

DECLARE personID int;
DECLARE tutorID int;


-- ----------------------- ADD Person ---------------------------

CALL updatePersonTable(
		affiliate , -- FK
        doeID , 
        lastname , 
        firstname ,
        intakeDate ,
        dob , 
        gender,
        primaryServiceType,
		`status` ,
		address1 ,
		address2 , -- null
		city ,
		state ,
		zip ,
		`zip+4` , -- null
		homePhone , -- null
		workPhone , -- null
		extension , -- null
		cellPhone , -- null
		email , -- null
		nativeLanguage , -- FK
		ethnicity , -- FK
        hispanicOrLatino ,
		doeReferral ,  -- FK
		lvmReferral ,  -- FK
		doeEmployStatus , -- FK
		doeOccupation , -- FK
		dateAdded ,
		dateModified ,
        isTestData);
        
SET personID = (SELECT max(id) FROM Person LIMIT 1);
SET person = personID;
-- ----------------------- ADD Tutor --------------------------

CALL updateTutorTable(
        personID,
        doeOccupation,
        orientation,
        training,
        trainingtype,
        dateAdded,
        dateModified,
        isTestData);
        
SET tutorID = (SELECT max(id) FROM Tutor WHERE personID = person LIMIT 1);
SET tutor = tutorID;

-- --------------------- ADD PersonPreferences ----------------------

CALL updatePersonPreferencesTable(
        personID,
        mTeen,
		fTeen,
		`m20-25`,
		`f20-25`,
		`m26-35`,
		`f26-35`,
		`m36-45`,
		`f36-45`,
		`m46-65`,
		`f46-65`,
		`m66+`  ,
		`f66+`,
        preferenceComments, 
		publicLibrary,
		otherLocation,
        dateAdded,
        dateModified,
        isTestData);

END //