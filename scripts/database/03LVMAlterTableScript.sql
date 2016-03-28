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
                         
   INSERT IGNORE INTO `EmploymentStatus` (`id`, `status`) VALUES
		(1, 'Employed'),
		(2, 'Homemaker'),
		(3, 'Student'),
		(4, 'Inmate'),
		(5, 'Unemployed and looking for work'),
		(6, 'Unemployed and not looking for work'),
		(7, 'Retired');

END IF ; 
	INSERT IGNORE INTO `EmploymentStatus` (`id`, `status`) VALUES
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


-- ------------------ ALTERING PublicAssistance TABLE -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTablePublicAssistance; //

DELIMITER //
CREATE PROCEDURE alterTablePublicAssistance()

BEGIN
	DECLARE _count int;
	SET _count = (SELECT COUNT(*) 
				FROM information_schema.TABLE_CONSTRAINTS 
                WHERE CONSTRAINT_SCHEMA = 'lvm' AND
					TABLE_NAME = 'PublicAssistance' AND
                    CONSTRAINT_TYPE   = 'PRIMARY KEY');
                    
	IF _count = 0 THEN
		ALTER TABLE `PublicAssistance` ADD PRIMARY KEY (`id`),
						 MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
   
END IF ; 
	INSERT IGNORE INTO `PublicAssistance` (`id`, `type`) VALUES
		(1, 'TFADC'),
		(2, 'EAEDC'),
		(3, 'Food Stamps'),
		(4, 'EA'),
		(5, 'SSI'),
		(6, 'None'),
		(7, 'Other');
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
		(70, 'Worcester');
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
                    ADD CONSTRAINT `FK_PubAssiss` FOREIGN KEY (`publicAssistance`) REFERENCES PublicAssistance (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
					ADD CONSTRAINT `FK_PersonS` FOREIGN KEY (`person`) REFERENCES Person (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
					ADD CONSTRAINT `FK_StudentG` FOREIGN KEY (`student`) REFERENCES Student (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

END IF ; 
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
				ADD UNIQUE KEY `person` (`person`),
                MODIFY `id` int NOT NULL AUTO_INCREMENT,
				ADD CONSTRAINT `FK_PersonT` FOREIGN KEY (`person`) REFERENCES Person (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
				ADD CONSTRAINT `FK_OccupationT` FOREIGN KEY (`occupation`) REFERENCES DOEOccupation (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
	INSERT IGNORE INTO `DOEExitReasons` (`id`, `reason`) values
			(1, 'Death'),
			(2, 'Did not comply with program policies'),
			(3, 'Entered college or training program'),
			(4, 'Entered employment'),
			(5, 'Entered other ABE program'),
			(6, 'Family problems'),
			(7, 'Illness/incapacity'),
			(8, 'Lack of dependent child care resources'),
			(9, 'Lack of interest'),
			(10, 'Lack of transportation resources'),
			(11, 'Met goal(s)'),
			(12, 'Moved'),
			(13, 'Personal Reasons'),
			(14, 'Prison sentence ended'),
			(15, 'Program did not meet student needs'),
			(16, 'Time and/or location of resources not feasible'),
			(17, 'Tutor ended the match'),
			(18, 'Unable to contact');
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


-- ------------------ CALLING ALL ALTER TABLE SPROCS -------------------------
DELIMITER //
DROP PROCEDURE IF EXISTS alterTableAll; //

DELIMITER //
CREATE PROCEDURE alterTableAll()

BEGIN
	CALL alterTableAssessmentTypes();

	CALL alterTableEmploymentStatus();

	CALL alterTableEthnicity();

	CALL alterTablePublicAssistance();

	CALL alterTableSites();
    
	CALL alterTableDOECountryOfOrigin();

	CALL alterTableDOEReferral();

	CALL alterTableDOENativeLanguage();

	CALL alterTableDOEExitReasons();

	CALL alterTableLVMExitReasons();

	CALL alterTableLVMReferral();
    
	CALL alterTablePerson();

	CALL alterTableStudent();

	CALL alterTableStudentAssessment();

	CALL alterTableStudentDependents();

	CALL alterTableStudentGoals();
    
	CALL alterTableTutor();
    
	CALL alterTableMatches();

	CALL alterTableMeeting();

	CALL alterTableExit();

END //

CALL alterTableAll();