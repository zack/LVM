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
		studentEthnicity int, -- FK
        hispanicOrLatino boolean,
		doeReferral int,  -- FK
		lvmReferral int,  -- FK
		doeEmployStatus int, -- FK
		doeOccupation int, -- FK
		dateAdded datetime,
		dateModified datetime,
        
        -- student table
        smarttID int,
        countryOfOrigin int, -- FK
        singleParent boolean,
        learningDisability boolean,
        physicalDisability boolean,
        emergencyContactName varchar(50),
		emergencyContactNumber varchar(10),
        
        -- contact info table
        okayToMail boolean,
        okayToEmail boolean,
        cellMsgOk boolean,
		homeMsgOk boolean,
        workMsgOk boolean,
        altMsgOk boolean,
        cellLVMOk boolean,
        homeLVMOk boolean,
        workLVMOk boolean,
        altLVMOk boolean,
        
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
        
        -- public assitance table
        TFADC bit,
		EAEDC bit,
		foodStamps bit,
		EA bit,
		SSI bit,
		noPA bit, -- none (public assistance)
		otherPA varchar(255), -- other (public assistance)
        
        -- student assessment table
        testDate date,
		testType int, -- FK
		testResult varchar(10),
		fedLevel int, -- NULL
		fedType int, -- NULL

        -- student goals table
        studentGoal int,
        dateGoalSet date,
        dateGoalMet date, -- null
        mainGoal boolean, -- if it is their main goal
        
        -- work experience table
        employer varchar(255),
        cityTown varchar(255),
        fullTime boolean,
        partTime boolean,
        multipleJobs boolean,
        tempJobs boolean,
        recentLayoff boolean,
        concernReLayoff boolean,
        
        -- computer skills table
        haveComputerAtHome boolean,
        useComputerAtHome boolean,
        useComputerAtLibrary boolean,
        useComputerAtWork boolean,
        useSmartphone boolean,
        useEmail boolean,
        useInternet boolean,
        
        -- diability table
        notRequiredToDisclose boolean,
		wishToDisclose boolean,
        understandEligibleForAccommodations boolean,
        wishToRequestAccommodations boolean,
        disabilityNotes varchar(2000),
        
        isTestData bit, -- enter 0 for all real data being entered
        
        OUT person int,
        OUT student int
  )

BEGIN

DECLARE personID int;
DECLARE studentID int;

DECLARE zipCodeID int;

SET zipCodeID = (SELECT ZIP_CODE_ID FROM ZipCodes WHERE ZipCodes.zip = zip LIMIT 1);

-- ----------------------- ADD TEST Person ---------------------------

CALL updatePersonTable(
		affiliate,
        doeID,
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
        nativeLanguage,
        studentEthnicity,
        hispanicOrLatino,
        doeReferral,
        lvmReferral,
        doeEmployStatus,
        doeOccupation,
        dateAdded,
        dateModified,
        isTestData);
        
SET personID = (SELECT max(id) FROM Person LIMIT 1);
SET person = personID;

-- ----------------------- ADD TEST Student --------------------------

CALL updateStudentTable(
        personID,
        smarttID,
        zipCodeID, -- FK
        countryOfOrigin, -- FK
        singleParent,
        learningDisability,
        physicalDisability,
        emergencyContactName,
		emergencyContactNumber,
        dateAdded,
        dateModified,
        isTestData);
        
SET studentID = (SELECT max(id) FROM Student WHERE personID = person LIMIT 1);
SET student = studentID;

-- --------------------- ADD StudentContactInfo ----------------------

CALL updateStudentContactInfoTable(
        studentID,
        okayToMail,
		okayToEmail,
		cellMsgOk,
        homeMsgOk,
        workMsgOk,
        altMsgOk,
        cellLVMOk,
        homeLVMOk,
        workLVMOk,
        altLVMOk,
        dateAdded,
        dateModified,
        isTestData);

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
        
-- --------------------- ADD StudentPublicAssistance ----------------------

CALL updateStudentPublicAssistanceTable(
        studentID,
        TFADC,
		EAEDC,
		foodStamps,
		EA,
		SSI,
		noPA,
		otherPA,
        dateAdded,
        dateModified,
        isTestData);
        

-- ------------------ ADD TEST StudentAssessment ---------------------

CALL updateStudentAssessmentTable(
		studentID,
        testDate,
		testType,
		testResult,
		fedLevel,
		fedType,
        dateAdded,
        dateModified,
        isTestData);

-- --------------------- ADD TEST StudentGoals -----------------------

CALL updateStudentGoalsTable(
		studentID,
        studentGoal,
        dateGoalSet,
        dateGoalMet,
        mainGoal,
        dateAdded,
        dateModified,
        isTestData);
        
CALL updateStudentWorkExperienceTable(
		studentID,
        doeOccupation,
        employer,
        cityTown,
        fullTime,
        partTime,
        multipleJobs,
        tempJobs,
        recentLayoff,
        concernReLayoff,
        dateAdded,
        dateModified,
        isTestData);

-- --------------------- ADD StudentComputerSkills ----------------------

CALL updateStudentComputerSkillsTable(
        studentID,
        haveComputerAtHome,
        useComputerAtHome,
        useComputerAtLibrary,
        useComputerAtWork,
        useSmartphone,
        useEmail,
        useInternet,
        dateAdded,
        dateModified,
        isTestData);
        
-- --------------------- ADD StudentDisabiltyAccommodations ----------------------

CALL updateStudentDisabiltyAccommodationsTable(
        studentID,
        notRequiredToDisclose,
		wishToDisclose,
        understandEligibleForAccommodations,
        wishToRequestAccommodations,
        disabilityNotes,
        dateAdded,
        dateModified,
        isTestData);
        

END //