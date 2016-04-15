-- --------------------------------------------
-- 03LVMAlterTableScript
-- Date: MAR 24 2016
-- 
-- Alters the Tables in the LVM database
-- --------------------------------------------

USE lvm;

-- ------------------ ALTERING AssessmentTypes TABLE -------------------------

DROP PROCEDURE IF EXISTS alterTableAssessmentTypes;

DELIMITER //
CREATE PROCEDURE alterTableAssessmentTypes()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'AssessmentTypes' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
	IF _count = 0 THEN
    
		ALTER TABLE `AssessmentTypes` ADD PRIMARY KEY (`id`),
			MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

END IF ;
	INSERT IGNORE INTO `AssessmentTypes` (`id`, `type`) VALUES
		(1, 'READ'),
		(2, 'BEST Plus'),
		(3, 'ESLOA'),
		(4, 'TABE 7'),
		(5, 'TABE 8'),
		(6, 'MAPT'),
		(7, 'TABE 9'),
		(8, 'TABE 10'),
		(9, 'Math MAPT');
END//



-- ------------------ ALTERING EmploymentStatus TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableEmploymentStatus; //

DELIMITER //
CREATE PROCEDURE alterTableEmploymentStatus()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'EmploymentStatus' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `EmploymentStatus` ADD PRIMARY KEY (`id`),
						 MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

END IF ; 
	INSERT IGNORE INTO `EmploymentStatus` (`id`, `estatus`) VALUES
		(1, 'Employed'),
		(2, 'Homemaker'),
		(3, 'Student'),
		(4, 'Inmate'),
		(5, 'Unemployed and looking for work'),
		(6, 'Unemployed and not looking for work'),
		(7, 'Retired');
END//


-- ------------------ ALTERING Ethnicity TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableEthnicity; //

DELIMITER //
CREATE PROCEDURE alterTableEthnicity()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'Ethnicity' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `Ethnicity` ADD PRIMARY KEY (`id`),
						 MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

END IF ; 
	INSERT IGNORE INTO `Ethnicity` (`id`, `ethnicity`) VALUES
		(1, 'American Indian / Alaskan Native'),
		(2, 'Asian'),
		(3, 'Black'),
		(4, 'Cape Verdean'),
		(5, 'Hawaiian or Other Pacific Islander'),
		(6, 'Haitian'),
		(7, 'Hispanic or Latino'),
		(8, 'Indian Sub-Continent'),
		(9, 'White');
END//

-- ------------------ ALTERING Sites TABLE -------------------------
DELIMITER // 
DROP PROCEDURE IF EXISTS alterTableSites;//

DELIMITER //
CREATE PROCEDURE alterTableSites()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'Sites' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `Sites` ADD PRIMARY KEY (`id`),
						 MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
   
END IF ; 
	INSERT IGNORE INTO `Sites` (`id`, `name`) VALUES
		(5, 'Boston'),
		(10, 'Project Lighthouse'),
		(15, 'Fitchburg'),
		(20, 'Framingham'),
		(25, 'Lowell'),
		(30, 'Norwood'),
		(35, 'Orange-Athol'),
		(40, 'Pittsfield'),
		(45, 'Quaboag Valley'),
		(50, 'Quincy'),
		(60, 'Tri.Community'),
		(65, 'Stoughton'),
		(70, 'Worcester'),
		(75, 'Methuen');
END//


-- ------------------ ALTERING Student TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudent; //

DELIMITER //
CREATE PROCEDURE alterTableStudent()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'Student' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `Student` ADD PRIMARY KEY (`id`),
					ADD UNIQUE KEY `person` (`person`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_ConOrigin` FOREIGN KEY (`countryOfOrigin`) REFERENCES DOECountryOfOrigin (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
					ADD CONSTRAINT `FK_PersonS` FOREIGN KEY (`person`) REFERENCES Person (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
					ADD CONSTRAINT `FK_ZipCode` FOREIGN KEY (`zipCodeID`) REFERENCES ZipCodes (`ZIP_CODE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

END IF ; 
END//

-- ------------------ ALTERING StudentContactInfo TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentContactInfo; //

DELIMITER //
CREATE PROCEDURE alterTableStudentContactInfo()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentContactInfo' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentContactInfo` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentCI` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

END IF ; 
END//

-- ------------------ ALTERING PersonPreferences TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTablePersonPreferences; //

DELIMITER //
CREATE PROCEDURE alterTablePersonPreferences()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'PersonPreferences' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `PersonPreferences` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentP` FOREIGN KEY (`person`) REFERENCES Person (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


END IF ;
END//

-- ------------------ ALTERING StudentPublicAssistance TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentPublicAssistance; //

DELIMITER //
CREATE PROCEDURE alterTableStudentPublicAssistance()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentPublicAssistance' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentPublicAssistance` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentPA` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


END IF ;
END//

-- ------------------ ALTERING StudentAssessment TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentAssessment; //

DELIMITER //
CREATE PROCEDURE alterTableStudentAssessment()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentAssessment' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentAssessment` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentA` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
					ADD CONSTRAINT `FK_Test` FOREIGN KEY (`test`) REFERENCES AssessmentTypes (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

END IF ; 
END//


-- ------------------ ALTERING StudentDependents TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentDependents; //

DELIMITER //
CREATE PROCEDURE alterTableStudentDependents()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentDependents' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentDependents` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentD` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

END IF ; 
END//

-- ------------------ ALTERING StudentGoals TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentGoals; //

DELIMITER //
CREATE PROCEDURE alterTableStudentGoals()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentGoals' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentGoals` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentG` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
					ADD CONSTRAINT `FK_Goal` FOREIGN KEY (`goal`) REFERENCES DOEGoals (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


END IF ; 
END//

-- ------------------ ALTERING StudentWorkExperience TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentWorkExperience; //

DELIMITER //
CREATE PROCEDURE alterTableStudentWorkExperience()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentWorkExperience' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentWorkExperience` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentW` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
					ADD CONSTRAINT `FK_StudentO` FOREIGN KEY (`occupation`) REFERENCES DOEOccupation (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


END IF ; 
END//

-- ------------------ ALTERING StudentComputerSkills TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentComputerSkills; //

DELIMITER //
CREATE PROCEDURE alterTableStudentComputerSkills()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentComputerSkills' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentComputerSkills` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentCS` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

END IF ; 
END//

-- ------------------ ALTERING StudentDisabiltyAccommodations TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentDisabiltyAccommodations; //

DELIMITER //
CREATE PROCEDURE alterTableStudentDisabiltyAccommodations()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentDisabiltyAccommodations' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentDisabiltyAccommodations` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentDA` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

END IF ; 
END//

-- ------------------ ALTERING StudentQuestions TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentQuestions; //

DELIMITER //
CREATE PROCEDURE alterTableStudentQuestions()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentQuestions' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentQuestions` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT;

END IF ;
	INSERT IGNORE INTO `StudentQuestions` (`id`, `question`) VALUES
		(1, 'How did you hear about LVM?'),
		(2, 'Why did you choose LVM?'),
		(3, 'Do your parents read?'),
		(3, 'Did they read to you?'),
		(5, 'Last grade completed:'),
		(6, 'Completion date:'),
		(7, 'What was school like? When did you realize reading was difficult?'),
		(8, 'Are you now/where you ever in a reading/tutoring program?(If yes, where and when, and what did you like or dislike about your experience?'),
		(9, 'How will your life be different when your reading and writing improve?'),
		(10, 'Tell me about your work experience(Job title(s) and duration of employment; What job skills do you have; What did you like or dislike about past jobs?)'),
		(11, 'Have you attended any job-related training or earned any job-related certificates, licenses, etc?(If yes, what kind, where, when?)'),
		(12, 'Is there a special reason you are seeking help now? What goals would you like to work towards(E.G., GED, Driver''s license, help kids with homework, get a better job)?'),
		(13, 'Are there any factors that you think will make it especially challenging for you to reach your goals (housing, health, work, personal or family issues)?'),
        (14, 'V A K T Learning Strengths:'),
        (15, 'Hobbies (i.e. movies, exercise, gardening), interests and activities/community engagement:'),
        (16, 'What are you good at? What do you enjoy doing?'),
        (17, 'Things/topics interested in reading:'),
        (18, 'Is there anyting els eyou would like us to know about you?'),
        (19, 'Interviewer''s comments/other information');
END//

-- ------------------ ALTERING StudentAnswers TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableStudentAnswers; //

DELIMITER //
CREATE PROCEDURE alterTableStudentAnswers()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'StudentAnswers' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `StudentAnswers` ADD PRIMARY KEY (`id`),
					MODIFY `id` int NOT NULL AUTO_INCREMENT,
					ADD CONSTRAINT `FK_StudentAns` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
					ADD CONSTRAINT `FK_Question` FOREIGN KEY (`question`) REFERENCES StudentQuestions (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


END IF ;
END//

-- ------------------ ALTERING Availability TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableAvailability; //

DELIMITER //
CREATE PROCEDURE alterTableAvailability()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'PersonAvailability' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');

	IF _count = 0 THEN
		ALTER TABLE `PersonAvailability` ADD PRIMARY KEY (`id`),
			MODIFY `id` int NOT NULL AUTO_INCREMENT,
			ADD CONSTRAINT `FK_Availability` FOREIGN KEY (`person`) REFERENCES Person (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
	END IF ;
END//

-- ------------------ ALTERING DOEGoals TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableDOEGoals; //

DELIMITER //
CREATE PROCEDURE alterTableDOEGoals()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'DOEGoals' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `DOEGoals`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT;
                
END IF ; 
	INSERT IGNORE INTO `DOEGoals` (`id`, `goal`, `def`, `doc`, `section`, `category`, `followUp`) values
			(1,'Enter Employment','Currently unemployed student gets a job and earns wages one quarter after the goal has been set.','Survey student via Follow-Up Goals ''New For Month'' report','A',NULL,1),
			(2,'Retain New Employment','Student who gets a job continues to be employed in the third quarter after the Retain Employment goal has been met.','Survey student via Follow-Up Goals ''New For Month'' report','A',NULL,1),
			(3,'Retain Current Employment','Student who is currently employed continues to be employed in the third quarter after the Retain Current Employment goal has been set.','Survey student via Follow-Up Goals ''New For Month'' report','A',NULL,1),
			(4,'Obtain GED','Achieves score that qualifies for GED during enrollment; or up to 8/5 in prior fiscal year ending 6/30; or after 8/5 in current fiscal year up to 6/30','Data match regardless of whether or not SSN is provided','A',NULL,1),
			(5,'Complete some adult HS credits toward ADP/EDP','Achieves or successfully completes required high school course work for an Adult Diploma Program or External Diploma Program.','Transcript from adult high school','A',NULL,0),
			(6,'Obtain ADP/EDP','Achieves high school diploma or competency determination as granted by local school committee.','Survey student to obtain either: (1) copy of diploma; (2) student''s transcripts signed by the principal or director; (3) student''s permanent record card','A',NULL,1),
			(7,'Enter Post-Secondary Education','Enrolls as a matriculating student in a program leading to a certificate, certification, or Associates degree. A matriculating student has been formally admitted to an institution and is enrolled in a course of study leading to one of the above credentials.','Signed letter or other document on the school''s letterhead confirming enrollment','A',NULL,1),
			(8,'Retain in Post-Secondary Education','Continues to be actively enrolled in the post-secondary education program and maintains matriculating status for at least 6 months after enrollment.','Letter or other document signed by the student or the training program.','A',NULL,1),
			(9,'Enter Occupational Training Program','Enrolls in a program of 12 or more months in duration to develop occupational skills and abilities for a specific career; excludes post-secondary degree programs.','Letter or other document signed by the student or the training program and kept in the student''s file at the ABE program.','A',NULL,1),
			(10,'Retain Occupational Training','Continues to be actively enrolled for at least 3 months in a training program of 12 or more months in duration.','Letter or other document signed by the student or the training program and kept in the student''s file at the ABE program.','A',NULL,1),
			(11,'Complete Occupational Training','Successfully completes a training program of 12 or more months in duration. Meets the requirements for a certificate or other formal documentation of successful completion.','Copy of certificate, formal documentation, or letter of completion from the training program and kept in the student’s file at the ABE program.','A',NULL,1),
			(12,'Enter Transitional Education','Enrolls in a program specifically designed to enhance a student''s chance of succeeding in post-secondary education.','Copy of an acceptance letter or other written verification on the school''s letterhead.','A',NULL,1),
			(13,'Retain in Transitional Education','Continues to be actively enrolled in a transitional program for at least 3 months.','Letter or other document signed by the student or the training program.','A',NULL,1),
			(14,'Complete Transitional Education','Successfully completes a transitional program.','Copy of certificate or letter of completion from the training program.','A',NULL,1),
			(15,'Increase Earnings','Increase earnings between two quarterly wage-earning periods','Copies of pay stubs showing increase between two quarterly wage-earning periods.','A',NULL,0),
			(16,'Read, write, do mathematical problem-solving and/or help child with homework','Parent or adult caregiver engages a child in reading, writing, or math activities and/or homework for at least 30 minutes, twice per week, for at least four consecutive months.','Adult caregiver tracks work within a portfolio (at a minimum including a log of what materials are used/worked on, date and time duration of each interaction).','A',NULL,0),
			(17,'Apply for U.S. Citizenship','Complete eligibility worksheet and send Application for Naturalization to appropriate Service Center.','A copy of Application Receipt Notice kept in the student''s file at the ABE program.','A',NULL,0),
			(18,'Receive Appointment for Citizenship Interview','Schedule an oral interview and written exam on basic English reading and writing skills and knowledge of American history and current events.','A copy of Citizenship Interview Notice kept in the student''s file at the ABE program.','A',NULL,0),
			(19,'Pass Citizenship Exam','Receive ''Approval of Exam'' document from USCIS','A copy of Approval of Exam document kept in the student''s file at the ABE program.','A',NULL,0),
			(20,'Receive Certificate of Citizenship at Oath Ceremony','Candidate is sworn in as a naturalized citizen and receives Certificate of Citizenship.','Teacher verifies the student’s receipt of Certificate of Citizenship.','A',NULL,0),
			(21,'Get a learner’s permit to drive','Student completes requirements for obtaining a learner’s permit to drive','Copy of learner’s permit kept in student’s file at the ABE program. [NOTE: The social security number does not appear on the learner’s permit.]','B',NULL,0),
			(22,'Get a Driver''s License','Student completes requirements for obtaining a driver''s license.','Copy of driver''s license kept in student''s file at the ABE program. [NOTE: The social security number does not appear on the driver’s license.]','B',NULL,0),
			(23,'Get and Use Library Card','Student brings library card and materials withdrawn from library to program.','Teacher verifies checked-out library material; copy of library card kept in the student’s file','B',NULL,0),
			(24,'Register to Vote','Student completes requirements for registering to vote.','Copy of voter registration card or letter kept in the student''s file.','B',NULL,0),
			(25,'Vote in Federal, State, or Local Elections','Student completes requirements for voting in elections.','Based on student self-report.','B',NULL,0),
			(26,'Learn About or Use Community Organizations or Resources','Student gathers information about community organizations for informational or practical purposes (e.g., a needed support service, health agency, social service agency, financial workshop, child care agency, etc.)','Student demonstrates knowledge, skills, abilities gained by either (1) providing evidence of the experience in writing, on video and/or on audio tape; (2) delivering a presentation to students or other interested parties; (3) assembling a portfolio containing brochures/flyers or other descriptions','B',NULL,0),
			(27,'Volunteer in a Program, Community, School, Daycare','Student volunteers their time, skill or a needed service on a regular basis for at least three months','Letter of participation from the program, community organization, agency, school, daycare, etc. kept in student’s file at ABE program.','B',NULL,0),
			(28,'Participate in Community Activities','Student participates in an activity in their community (e.g., health fair, blood drive, food drive, election campaign, parade, public outreach or other information dissemination activities)','Student shows evidence of participation by either (1) submitting in writing, video, or audio tape a description of the activity; or (2) by delivering a presentation about the activity to students or other interested parties','B',NULL,0),
			(29,'Obtain More Satisfying/ Appropriate Employment','Student obtains a job that is better suited to the individual’s interests, skills, time schedule, prior training. Improved employment may also provide personal growth, career path, better or more healthy working conditions, etc.','Student documents this goal by demonstrating improved employment by either (1) providing evidence in writing, a portfolio, a video, an audio tape; (2) delivering a presentation about the improved employment to students or other interested parties','B',NULL,0),
			(30,'Get Industry Related Certificate or License','Student completes all requirements for license or certificate program','Copy of certificate or license.','B',NULL,0),
			(31,'Attain legal residency','Student obtains legal residency (“green card”)','Teacher verifies the student’s receipt of Legal Residency (“Green”) Card','B',NULL,0),
			(32,'Open a Checking or Savings Account','Student completes requirements for opening a checking and/or savings account.','Student provides copy of a blank check or deposit slip printed with student''s name and with the account number(s) blacked out.','B',NULL,0),
			(33,'Obtain Stable Housing','A student who lacks stable housing (e.g., homeless, residing in an institutional setting or in the domicile of a friend or relative) obtains a stable domicile for her/him self and/or family.','Oral or written report made by student while enrolled (or in response to a follow-up survey) completed by the student and kept in the student''s file at the ABE program.','B',NULL,0),
			(34,'Buy a Domicile','Student completes requirements for purchase of a home.','Student provides copy of appointment letter for closing; copy of letter confirming homeowners insurance; or copy of a water/sewer bill.','B',NULL,0),
			(35,'Start a Business','Student starts a new business or is a partner in the formation of a new business.','Copy of business tax identification number from Massachusetts Department of Revenue','B',NULL,0),
			(36,'Retain current job by meeting new requirements',NULL,NULL,'C','ECONOMIC',0),
			(37,'Be removed from public assistance',NULL,NULL,'C','ECONOMIC',0),
			(38,'Increase computer literacy skills',NULL,NULL,'C','EDUCATIONAL',0),
			(39,'Quit smoking',NULL,NULL,'C','HEALTH',0),
			(40,'Improve health of children',NULL,NULL,'C','HEALTH',0),
			(41,'Improve personal health',NULL,NULL,'C','HEALTH',0),
			(42,'Learn about nutrition',NULL,NULL,'C','HEALTH',0),
			(43,'Learn about effects of second hand smoke',NULL,NULL,'C','HEALTH',0),
			(44,'Learn about domestic violence',NULL,NULL,'C','HEALTH',0),
			(45,'Learn ways to reduce stress',NULL,NULL,'C','HEALTH',0),
			(46,'Learn about HIV / AIDS',NULL,NULL,'C','HEALTH',0),
			(47,'Learn about drug / alcohol dependence',NULL,NULL,'C','HEALTH',0),
			(48,'Increase participation in school activities',NULL,NULL,'C','PARENTING/FAMILY LITERACY/LEARNING',0),
			(49,'Join an organization at your child’s school',NULL,NULL,'C','PARENTING/FAMILY LITERACY/LEARNING',0),
			(50,'Have greater involvement in children’s schooling',NULL,NULL,'C','PARENTING/FAMILY LITERACY/LEARNING',0),
			(51,'Improve family communication',NULL,NULL,'C','PARENTING/FAMILY LITERACY/LEARNING',0),
			(52,'Enhance household management skills (interact with utility company, plumbers, electricians, etc.)',NULL,NULL,'C','SOCIETAL',0),
			(53,'Enhance financial management skills (interact with insurance companies, banks, etc.)',NULL,NULL,'C','SOCIETAL',0),
			(54,'Reconnect/reintegrate to community after institutionalization',NULL,NULL,'C','SOCIETAL',0),
			(55,'Mentoring/Leadership role (student council, advisory board, student speakers at a public event, student action health team, student leadership team, planning team, curriculum development)',NULL,NULL,'C','SOCIETAL',0),
			(56,'Learn about US culture',NULL,NULL,'C','SOCIETAL',0),
			(57,'Enter Military',NULL,NULL,'C','SOCIETAL',0),
			(58,'Create a resume',NULL,NULL,'C','EMPLOYMENT',0),
			(59,'Register at and/or visit a career center',NULL,NULL,'C','EMPLOYMENT',0),
			(60,'Go on a job interview',NULL,NULL,'C','EMPLOYMENT',0),
			(61,'Apply for a job',NULL,NULL,'C','EMPLOYMENT',0),
			(62,'Learn about financial planning',NULL,NULL,'C','FINANCIAL LITERACY',0),
			(63,'Learn about credit and debit card use',NULL,NULL,'C','FINANCIAL LITERACY',0),
			(64,'Learn about employee benefits packages',NULL,NULL,'C','FINANCIAL LITERACY',0),
			(65,'Develop a personal and/or a family budget',NULL,NULL,'C','FINANCIAL LITERACY',0);
END//


-- ------------------ ALTERING Tutor TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableTutor; //

DELIMITER //
CREATE PROCEDURE alterTableTutor()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'Tutor' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `Tutor` ADD PRIMARY KEY (`id`),
				ADD UNIQUE KEY `personT` (`person`),
                MODIFY `id` int NOT NULL AUTO_INCREMENT,
				ADD CONSTRAINT `FK_PersonT` FOREIGN KEY (`person`) REFERENCES Person (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_OccupationT` FOREIGN KEY (`occupation`) REFERENCES DOEOccupation (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

END IF ; 
END//

-- ------------------ ALTERING Tutor Hours TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableTutorHours; //

DELIMITER //
CREATE PROCEDURE alterTableTutorHours()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'TutorHours' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `TutorHours` ADD PRIMARY KEY (`id`),
                MODIFY `id` int NOT NULL AUTO_INCREMENT,
				ADD CONSTRAINT `FK_Tutor` FOREIGN KEY (`tutor`) REFERENCES Tutor (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


END IF ; 
END//


-- ------------------ ALTERING Matches TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableMatches; //

DELIMITER //
CREATE PROCEDURE alterTableMatches()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'Matches' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `Matches`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT,
				ADD CONSTRAINT `FK_TutorM` FOREIGN KEY (`tutor`) REFERENCES `Tutor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_StudentM` FOREIGN KEY (`student`) REFERENCES `Student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_SiteM` FOREIGN KEY (`site`) REFERENCES Sites (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

END IF ; 
END//


-- ------------------ ALTERING Meeting TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableMeeting; //

DELIMITER //
CREATE PROCEDURE alterTableMeeting()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'Meeting' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `Meeting`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT,
				ADD CONSTRAINT `FK_Match` FOREIGN KEY (`matching`) REFERENCES Matches (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
END IF ; 
END//


-- ------------------ ALTERING DOECountryOfOrigin TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableDOECountryOfOrigin; //

DELIMITER //
CREATE PROCEDURE alterTableDOECountryOfOrigin()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'DOECountryOfOrigin' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `DOECountryOfOrigin`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT;
                
END IF ; 
	INSERT IGNORE INTO `DOECountryOfOrigin` (`id`, `country`) values
			(1, 'USA'),
			(2, 'Afghanistan'),
			(3, 'Albania'),
			(4, 'Algeria'),
			(5, 'American Samoa'),
			(6, 'Andorra'),
			(7, 'Angola'),
			(8, 'Antigua and Barbuda'),
			(9, 'Argentina'),
			(10, 'Armenia'),
			(11, 'Australia'),
			(12, 'Austria'),
			(13, 'Azerbaijan'),
			(14, 'Bahamas'),
			(15, 'Bahrain'),
			(16, 'Bangladesh'),
			(17, 'Barbados'),
			(18, 'Belarus'),
			(19, 'Belgium'),
			(20, 'Belize'),
			(21, 'Benin'),
			(22, 'Bermuda'),
			(23, 'Bhutan'),
			(24, 'Bolivia'),
			(25, 'Bosnia and Herzegovina'),
			(26, 'Botswana'),
			(27, 'Brazil'),
			(28, 'Brunei Darussalam'),
			(29, 'Bulgaria'),
			(30, 'Burkina Faso'),
			(31, 'Burundi'),
			(32, 'Cambodia'),
			(33, 'Cameroon'),
			(34, 'Canada'),
			(35, 'Cape Verde'),
			(36, 'Central African Republic'),
			(37, 'Chad'),
			(38, 'Chile'),
			(39, 'China'),
			(40, 'Colombia'),
			(41, 'Comoros'),
			(42, 'Congo'),
			(43, 'Cook Islands'),
			(44, 'Costa Rica'),
			(45, 'Cote d''Ivoire'),
			(46, 'Croatia'),
			(47, 'Cuba'),
			(48, 'Cyprus'),
			(49, 'Czech Republic'),
			(50, 'Dem.Rep.of the Congo'),
			(51, 'Denmark'),
			(52, 'Djibouti'),
			(53, 'Dominica'),
			(54, 'Dominican Republic'),
			(55, 'East Timor'),
			(56, 'Ecuador'),
			(57, 'Egypt'),
			(58, 'El Salvador'),
			(59, 'Equatorial Guinea'),
			(60, 'Eritrea'),
			(61, 'Estonia'),
			(62, 'Ethiopia'),
			(63, 'Fiji'),
			(64, 'Finland'),
			(65, 'France'),
			(66, 'French Guiana'),
			(67, 'French Polynesia'),
			(68, 'Gabon'),
			(69, 'Gambia'),
			(70, 'Georgia'),
			(71, 'Germany'),
			(72, 'Ghana'),
			(73, 'Gibraltar'),
			(74, 'Greece'),
			(75, 'Grenada'),
			(76, 'Guadeloupe'),
			(77, 'Guam'),
			(78, 'Guatemala'),
			(79, 'Guinea'),
			(80, 'Guinea-Bissau'),
			(81, 'Guyana'),
			(82, 'Haiti'),
			(83, 'Honduras'),
			(84, 'Hong Kong S A R'),
			(85, 'Hungary'),
			(86, 'Iceland'),
			(87, 'India'),
			(88, 'Indonesia'),
			(89, 'Iran (Islamic Rep. Of)'),
			(90, 'Iraq'),
			(91, 'Ireland'),
			(92, 'Israel'),
			(93, 'Italy'),
			(94, 'Jamaica'),
			(95, 'Japan'),
			(96, 'Jordan'),
			(97, 'Kazakhstan'),
			(98, 'Kenya'),
			(99, 'Kiribati'),
			(100, 'Korea, Dem.People''s Rep.'),
			(101, 'Korea, Republic of'),
			(102, 'Kuwait'),
			(103, 'Kyrgyzstan'),
			(104, 'Lao People''s Dem. Rep.'),
			(105, 'Latvia'),
			(106, 'Lebanon'),
			(107, 'Lesotho'),
			(108, 'Liberia'),
			(109, 'Libyan Arab Jamahiriya'),
			(110, 'Liechtenstein'),
			(111, 'Lithuania'),
			(112, 'Luxembourg'),
			(113, 'Macao S A R'),
			(114, 'Madagascar'),
			(115, 'Malawi'),
			(116, 'Malaysia'),
			(117, 'Maldives'),
			(118, 'Mali'),
			(119, 'Malta'),
			(120, 'Marshall Islands'),
			(121, 'Martinique'),
			(122, 'Mauritania'),
			(123, 'Mauritius'),
			(124, 'Mexico'),
			(125, 'Micronesia, Fed. States of'),
			(126, 'Monaco'),
			(127, 'Mongolia'),
			(128, 'Morocco'),
			(129, 'Mozambique'),
			(130, 'Myanmar'),
			(131, 'Namibia'),
			(132, 'Nauru'),
			(133, 'Nepal'),
			(134, 'Netherlands'),
			(135, 'Netherlands Antilles'),
			(136, 'New Caledonia'),
			(137, 'New Zealand'),
			(138, 'Nicaragua'),
			(139, 'Niger'),
			(140, 'Nigeria'),
			(141, 'Northern Mariana Islands'),
			(142, 'Norway'),
			(143, 'Occ. Palestinian Territory'),
			(144, 'Oman'),
			(145, 'Pakistan'),
			(146, 'Palau'),
			(147, 'Panama'),
			(148, 'Papua New Guinea'),
			(149, 'Paraguay'),
			(150, 'Peru'),
			(151, 'Philippines'),
			(152, 'Poland'),
			(153, 'Puerto Rico'),
			(154, 'Qatar'),
			(155, 'Republic of Moldova'),
			(156, 'Reunion'),
			(157, 'Romania'),
			(158, 'Russian Federation'),
			(159, 'Rwanda'),
			(160, 'Saint Kitts and Nevis'),
			(161, 'Saint Lucia'),
			(162, 'Saint Vincent / Grenadines'),
			(163, 'Samoa'),
			(164, 'San Marino'),
			(165, 'Sao Tome and Principe'),
			(166, 'Saudi Arabia'),
			(167, 'Senegal'),
			(168, 'Seychelles'),
			(169, 'Sierra Leone'),
			(170, 'Singapore'),
			(171, 'Slovakia'),
			(172, 'Slovenia'),
			(173, 'Solomon Islands'),
			(174, 'Somalia'),
			(175, 'South Africa'),
			(176, 'Spain'),
			(177, 'Sri Lanka'),
			(178, 'Sudan'),
			(179, 'Suriname'),
			(180, 'Swaziland'),
			(181, 'Sweden'),
			(182, 'Switzerland'),
			(183, 'Syrian Arab Republic'),
			(184, 'Tajikistan'),
			(185, 'Thailand'),
			(186, 'The FYR of Macedonia'),
			(187, 'Togo'),
			(188, 'Tonga'),
			(189, 'Trinidad and Tobago'),
			(190, 'Tunisia'),
			(191, 'Turkey'),
			(192, 'Turkmenistan'),
			(193, 'Tuvalu'),
			(194, 'U.S. Virgin Islands'),
			(195, 'Uganda'),
			(196, 'Ukraine'),
			(197, 'United Arab Emirates'),
			(198, 'United Kingdom'),
			(199, 'United Rep. Of Tanzania'),
			(200, 'Uruguay'),
			(201, 'Uzbekistan'),
			(202, 'Vanuatu'),
			(203, 'Venezuela'),
			(204, 'Viet Nam'),
			(205, 'Western Sahara'),
			(206, 'Yemen'),
			(207, 'Yugoslavia'),
			(208, 'Zambia'),
			(209, 'Zimbabwe'),
			(210, 'Portugal');
END//


-- ------------------ ALTERING DOEReferral TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableDOEReferral; //

DELIMITER //
CREATE PROCEDURE alterTableDOEReferral()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'DOEReferral' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `DOEReferral`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT;
            
END IF ; 
	INSERT IGNORE INTO `DOEReferral` (`id`, `referral`) values
			(1, 'Career Center'),
            (2, 'Community Organization'),
            (3, 'Counselor'),
			(4, 'Court'),
			(5, 'Flier/Brochure/Poster'),
			(6, 'Head Start'),
			(7, 'JOBS'),
			(8, 'Job'),
			(9, 'Library'),
			(10, 'Literacy Hotline'),
			(11, 'Probation/parole officer'),
			(12, 'Recruiter'),
			(13, 'Social Service/MA rehab'),
			(14, 'Student (Current/Previous)'),
			(15, 'Unemployment Office'),
			(16, 'Waiting List'),
			(17, 'Walk-in (friend/relative)'),
			(18, 'Walk-in (newspaper)'),
			(19, 'Walk-in (radio)'),
			(20, 'Walk-in (school)'),
			(21, 'Walk-in (self)'),
			(22, 'Walk-in (television)'),
			(23, 'Welfare'),
			(24, 'Word of Mouth'),
			(25, 'Other');
END//


-- ------------------ ALTERING DOENativeLanguage TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableDOENativeLanguage; //

DELIMITER //
CREATE PROCEDURE alterTableDOENativeLanguage()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'DOENativeLanguage' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `DOENativeLanguage`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT;
		
END IF ; 
	INSERT IGNORE INTO `DOENativeLanguage` (`id`, `language`) values
			(1, 'English'),
			(2, 'Albanian'),
			(3, 'Arabic'),
			(4, 'Cambodian'),
			(5, 'CapeVerdean Creole'),
			(6, 'Chinese - Cantonese'),
			(7, 'Chinese - Mandarin'),
			(8, 'Chinese - Toisanese'),
			(9, 'Farsi'),
			(10, 'French'),
			(11, 'Gaelic'),
			(12, 'German'),
			(13, 'Greek'),
			(14, 'Haitian Creole'),
			(15, 'Hindi'),
			(16, 'Italian'),
			(17, 'Japanese'),
			(18, 'Korean'),
			(19, 'Laotian'),
			(20, 'Lebanese'),
			(21, 'Polish'),
			(22, 'Portuguese'),
			(23, 'Russian'),
			(24, 'Spanish'),
			(25, 'Syrian'),
			(26, 'Turkish'),
			(27, 'Urdu'),
			(28, 'Vietnamese'),
			(29, 'Other');
END//


-- ------------------ ALTERING DOEExitReasons TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableDOEExitReasons; //

DELIMITER //
CREATE PROCEDURE alterTableDOEExitReasons()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'DOEExitReasons' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `DOEExitReasons`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT;
                
END IF ; 
	INSERT IGNORE INTO `DOEExitReasons` (`id`, `type`, `reason`) values
			(1, 'student', 'Death'),
			(2, 'student', 'Did not comply with program policies'),
			(3, 'student', 'Entered college or training program'),
			(4, 'student', 'Entered employment'),
			(5, 'student', 'Entered other ABE program'),
			(6, 'student', 'Family problems'),
			(7, 'student', 'Illness/incapacity'),
			(8, 'student', 'Lack of dependent child care resources'),
			(9, 'student', 'Lack of interest'),
			(10, 'student', 'Lack of transportation resources'),
			(11, 'student', 'Met goal(s)'),
			(12, 'student', 'Moved'),
			(13, 'student', 'Personal Reasons'),
			(14, 'student', 'Prison sentence ended'),
			(15, 'student', 'Program did not meet student needs'),
			(16, 'student', 'Time and/or location of resources not feasible'),
			(17, 'student', 'Tutor ended the match'),
			(18, 'student', 'Unable to contact'),
            (19, 'tutor', 'Child care issues'),
			(20, 'tutor', 'Devote time to family matters'),
			(21, 'tutor', 'Illness'),
			(22, 'tutor', 'Increased responsibilities'),
			(23, 'tutor', 'Maternity leave'),
			(24, 'tutor', 'Moved'),
			(25, 'tutor', 'Promoted'),
			(26, 'tutor', 'Retired'),
			(27, 'tutor', 'Returned to school'),
			(28, 'tutor', 'Job/schedule conflict'),
			(29, 'tutor', 'Secured employment closer to home'),
			(30, 'tutor', 'Secured employment with benefits'),
			(31, 'tutor', 'Secured full time employment'),
			(32, 'tutor', 'Took a full time job in adult education'),
			(33, 'tutor', 'Took another job in related field'),
			(34, 'tutor', 'Took another job in unrelated field'),
			(35, 'tutor', 'Took another volunteer position'),
			(36, 'tutor', 'Took teaching position in K-12 area'),
			(37, 'tutor', 'Terminated'),
			(38, 'tutor', 'Deceased'),
			(39, 'tutor', 'Tutee/student achieved goal'),
			(40, 'tutor', 'Volunteer/student match not appropriate'),
			(41, 'tutor', 'Completed volunteer contract'),
			(42, 'tutor', 'Student left program/match dissolved'),
			(43, 'tutor', 'Other');

END//


-- ------------------ ALTERING LVMExitReasons TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableLVMExitReasons; //

DELIMITER //
CREATE PROCEDURE alterTableLVMExitReasons()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'LVMExitReasons' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `LVMExitReasons`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT;
		
END IF ;
	INSERT IGNORE INTO `LVMExitReasons` (`id`, `reason`) values
			(1, 'Cannot locate or contact'),
			(2, 'Completed volunteer contract'),
			(3, 'Deceased'),
			(4, 'Dissatisfied with experience'),
			(5, 'Employment - Got a job'),
			(6, 'Employment - Too busy'),
			(7, 'Family - Child care issues'),
			(8, 'Family - Devote time to family matters'),
			(9, 'Family - Maternity leave'),
			(10, 'Illness'),
			(11, 'Lack of interest'),
			(12, 'Lack of transportation'),
			(13, 'Moved'),
			(14, 'Not suited for tutoring'),
			(15, 'Personal reasons (not family, health, or work)'),
			(16, 'Retired'),
			(17, 'School - Returned to school'),
			(18, 'School - Too busy'),
			(19, 'Student - Left program'),
			(20, 'Student - Met goal'),
			(21, 'Volunteer inactive');
END//


-- ------------------ ALTERING LVMReferral TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableLVMReferral; //

DELIMITER //
CREATE PROCEDURE alterTableLVMReferral()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'LVMReferral' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `LVMReferral`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT;
		
END IF ;
	INSERT IGNORE INTO `LVMReferral` (`id`, `referral`) values
			(1, 'ABE Center'),
			(2, 'Brochure, Flyer, Poster'),
			(3, 'Church'),
			(4, 'Community Center / Meeting'),
			(5, 'Coordinator'),
			(6, 'Employer'),
			(7, 'Family'),
			(8, 'Friend'),
			(9, 'Hospital'),
			(10, 'Internet'),
			(11, 'Library'),
			(12, 'Magazine'),
			(13, 'Newspaper'),
			(14, 'Other Tutor'),
			(15, 'Phone Book'),
			(16, 'Presentation'),
			(17, 'Radio'),
			(18, 'School'),
			(19, 'Senior Center'),
			(20, 'State Agency'),
			(21, 'TV'),
			(22, 'United Way'),
			(23, 'Volunteer Fair'),
			(24, 'Other');
END//


-- ------------------ ALTERING Person TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTablePerson; //

DELIMITER //
CREATE PROCEDURE alterTablePerson()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'Person' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `Person`
				ADD PRIMARY KEY (`id`),
				ADD UNIQUE KEY `doeID` (`doeID`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT,
				ADD CONSTRAINT `FK_EmployStatus` FOREIGN KEY (`doeEmployStatus`) REFERENCES `EmploymentStatus` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_Ethnicity` FOREIGN KEY (`ethnicity`) REFERENCES `Ethnicity` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_Site` FOREIGN KEY (`site`) REFERENCES `Sites` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_NativeLang` FOREIGN KEY (`nativeLanguage`) REFERENCES `DOENativeLanguage` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
                ADD CONSTRAINT `FK_lvmReferral` FOREIGN KEY (`lvmReferral`) REFERENCES `DOEReferral` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
                ADD CONSTRAINT `FK_doeReferral` FOREIGN KEY (`doeReferral`) REFERENCES `LVMReferral` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_doeOccupation` FOREIGN KEY (`doeOccupation`) REFERENCES `DOEOccupation` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;


END IF ; 
END//


-- ------------------ ALTERING Exit TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableExit; //

DELIMITER //
CREATE PROCEDURE alterTableExit()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'Exit' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `Exit`
				ADD PRIMARY KEY (`id`),
				MODIFY `id` int NOT NULL AUTO_INCREMENT,
				ADD CONSTRAINT `FK_PersonE` FOREIGN KEY (`person`) REFERENCES `Person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_DOEReason` FOREIGN KEY (`doeReason`) REFERENCES `DOEExitReasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_LVMReason` FOREIGN KEY (`lvmReason`) REFERENCES `LVMExitReasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
END IF ; 
END//

-- ------------------ ALTERING ZipCodes TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableZipCodes; //

DELIMITER //
CREATE PROCEDURE alterTableZipCodes()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'ZipCodes' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `ZipCodes`
				ADD PRIMARY KEY (`ZIP_CODE_ID`),
				MODIFY `ZIP_CODE_ID` int NOT NULL AUTO_INCREMENT;
                
END IF ; 
END//

-- ------------------ CALLING ALL ALTER TABLE SPROCS -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableAll; //

DELIMITER //
CREATE PROCEDURE alterTableAll()

BEGIN
	CALL alterTableAssessmentTypes();

	CALL alterTableEmploymentStatus();

	CALL alterTableEthnicity();

	CALL alterTableSites();
    
	CALL alterTableDOECountryOfOrigin();

	CALL alterTableDOEReferral();

	CALL alterTableDOENativeLanguage();

	CALL alterTableDOEExitReasons();

	CALL alterTableDOEGoals();

	CALL alterTableLVMExitReasons();

	CALL alterTableLVMReferral();
    
    CALL alterTableZipCodes();
    
	CALL alterTablePerson();
    
	CALL alterTableStudent();
    
	CALL alterTablePersonPreferences();
    
    CALL alterTableAvailability();
    
    CALL alterTableStudentPublicAssistance();

	CALL alterTableStudentAssessment();

	CALL alterTableStudentDependents();

	CALL alterTableStudentGoals();
    
	CALL alterTableStudentWorkExperience();

	CALL alterTableStudentComputerSkills();

	CALL alterTableStudentDisabiltyAccommodations();
    
    CALL alterTableStudentContactInfo();
    
	CALL alterTableStudentQuestions();

	CALL alterTableStudentAnswers();
    
	CALL alterTableTutor();
    
    CALL alterTableTutorHours();
    
	CALL alterTableMatches();

	CALL alterTableMeeting();

	CALL alterTableExit();

END //

CALL alterTableAll();