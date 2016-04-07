-- --------------------------------------------
-- 06LVMAddStudentSproc
-- Date: MAR 24 2016
-- 
-- Add student into database and update all necessary tables
-- --------------------------------------------

DROP PROCEDURE IF EXISTS addStudent;


DELIMITER //

-- ones marked with null can be null 

CREATE PROCEDURE addStudent(
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
        smarttID int,
        okayToCall boolean,
        okayToMail boolean,
        okayToEmail boolean,
        zipCodeID int,
        countryOfOrigin varchar(255), -- FK
        timeInJobMonths int, -- null
        timeInJobYears int, -- null
        publicAssistance varchar(255), -- FK
        singleParent boolean,
        learningDisability boolean,
        physicalDisability boolean,
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
        studentGoal varchar(255),
        dateGoalSet date,
        dateGoalMet date, -- null
        mainGoal boolean, -- if it is their main goal
        testDate date,
		testType varchar(255), -- FK
		testResult varchar(255),
		fedLevel int,
		fedType int,
        inSchool boolean,
        TFADC bit,
		EAEDC bit,
		foodStamps bit,
		EA bit,
		SSI bit,
		noPA bit, -- none (public assistance)
		otherPA bit, -- other (public assistance)
        isTestData bit -- enter 0 for all real data being entered
  )

BEGIN

DECLARE personID int;
DECLARE studentID int;
DECLARE affiliateID int;
DECLARE languageID int; 
DECLARE ethnicityID int;
DECLARE doeReferralID int;
DECLARE lvmReferralID int;
DECLARE employStatusID int;
DECLARE occupationID int;
DECLARE countryID int;
DECLARE publicAssistanceID int;
DECLARE goalID int;
DECLARE testID int;


                    
SET affiliateID = (SELECT id FROM Sites WHERE name = affiliate);
SET languageID = (SELECT id FROM DOENativeLanguage WHERE nativeLanguage = language);
SET ethnicityID = (SELECT id FROM Ethnicity WHERE ethnicity = studentEthnicity);
SET doeReferralID = (SELECT id FROM DOEReferral WHERE referral = doeReferral);
SET lvmReferralID = (SELECT id FROM LVMReferral WHERE referral = lvmReferral);
SET employStatusID = (SELECT id FROM EmploymentStatus WHERE estatus = doeEmployStatus);
SET occupationID = (SELECT id FROM DOEOccupation WHERE occupation = doeOccupation);
SET countryID = (SELECT id FROM DOECountryOfOrigin WHERE country = countryOfOrigin);
SET publicAssistanceID = (SELECT id FROM PublicAssistance WHERE type = publicAssistance);
SET goalID = (SELECT id FROM DOEGoals WHERE goal = studentGoal);
SET testID = (SELECT id FROM AssessmentTypes WHERE type = testType);





-- ----------------------- ADD TEST Person ---------------------------

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
        
SET personID = (SELECT max(id) FROM Person LIMIT 1);

-- ----------------------- ADD TEST Student --------------------------

CALL updateStudentTable(
        personID,
        smarttID,
        okayToCall,
        okayToMail,
        okayToEmail,
        zipCodeID,
        countryID, -- FK
        timeInJobMonths, -- null
        timeInJobYears, -- null
        publicAssistanceID, -- FK
        singleParent,
        learningDisability,
        physicalDisability,
        dateAdded,
        dateModified,
        isTestData);
        
SET studentID = (SELECT max(id) FROM Student WHERE personID = person LIMIT 1);

-- ------------------ ADD TEST StudentAssessment ---------------------

CALL updateStudentAssessmentTable(
		studentID,
        testDate,
		testID,
		testResult,
		fedLevel,
		fedType,
        dateAdded,
        dateModified,
        isTestData);


-- ------------------ ADD TEST StudentDependents ---------------------

CALL updateStudentDependentsTable(
		studentID,
        year(dob),
        inSchool,
        dateAdded,
        dateModified,
        isTestData);
-- --------------------- ADD TEST StudentGoals -----------------------

CALL updateStudentGoalsTable(
		studentID,
        goalID,
        dateGoalSet,
        dateGoalMet,
        mainGoal,
        dateAdded,
        dateModified,
        isTestData);

-- --------------------- ADD StudentPreferences ----------------------

CALL updateStudentPreferencesTable(
        studentID,
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
        dateAdded,
        dateModified,
        isTestData);

-- --------------------- ADD StudentPublicAssistance ----------------------

CALL updateStudentPublicAssistanceTable(
        studentID,
        TFADC,
		EAEDC,
		foodStamps,
		EA,
		SSI,
		noPA,
		otherPA ,
        dateAdded,
        dateModified,
        isTestData);

END //