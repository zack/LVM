-- --------------------------------------------
-- 04LVMUpdateMatchesTableSproc
-- Date: MAR 24 2016
-- 
-- Creates sproc to insert data into the matches table
-- --------------------------------------------

USE lvm;

DROP PROCEDURE IF EXISTS updateMatchesTable;

DELIMITER //

CREATE PROCEDURE updateMatchesTable(
  `site` int, -- FK
  `doeMatchID` int,
  `status` enum('Current','Dissolved'),
  `tutor` int, -- FK
  `student` int, -- FK
  `matchStart` date,
  `matchEnd` date,
  `onHold` boolean,
  `dateAdded` datetime,
  `dateModified` datetime,
  `isTestData` bit)

BEGIN

INSERT INTO Matches(
	site,
    doeMatchID,
    status,
    tutor,
    student,
    matchStart,
    matchEnd,
    onHold,
    dateAdded,
	dateModified,
    isTestData)
VALUES(
    `site`,
    `doeMatchID`,
    `status`,
    `tutor`,
    `student`,
    `matchStart`,
    `matchEnd`,
    `onHold`,
    `dateAdded`,
    `dateModified`,
    `isTestData`);
    
END //

INSERT IGNORE INTO `Matches` (`id`, `site`, `doeMatchID`, `status`, `tutor`, `student`, `matchStart`, `matchEnd`, `onHold`, `dateAdded`, `dateModified`, `isTestData`) VALUES
         (1, 5, 6032, 'Current', 1, 1, CURDATE(), null, 0, CURDATE(), CURDATE(), 1),
         (2, 5, 6033, 'Current', 2, 2, CURDATE(), null, 1, CURDATE(), CURDATE(), 1),
         (3, 10, 6034, 'Current', 1, 3, CURDATE(), null, 0, CURDATE(), CURDATE(), 1),
         (4, 10, 6035, 'Dissolved', 2, 3, CURDATE(), CURDATE(), 0, CURDATE(), CURDATE(), 1),
         (5, 5, 6036, 'Dissolved', 3, 2, CURDATE(), CURDATE(), 1, CURDATE(), CURDATE(), 1) //