//Table about books and authors







SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";





CREATE TABLE IF NOT EXISTS `author` (
  `ISBN` char(14) NOT NULL,
  `Author` varchar(50) NOT NULL,
  PRIMARY KEY (`ISBN`,`Author`)
)








CREATE TABLE IF NOT EXISTS `book` (
  `ISBN` char(14) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Cost` decimal(5,2) NOT NULL,
  `IsReserved` tinyint(1) NOT NULL,
  `Edition` int(11) NOT NULL,
  `PubliPlace` varchar(30) DEFAULT NULL,
  `Publisher` varchar(30) NOT NULL,
  `CopyYr` decimal(4,0) NOT NULL,
  `ShelfID` int(11) DEFAULT NULL,
  `SubName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `ShelfID` (`ShelfID`),
  KEY `SubName` (`SubName`)
)








CREATE TABLE IF NOT EXISTS `bookcopy` (
  `ISBN` char(14) NOT NULL,
  `CopyID` int(11) NOT NULL,
  `IsChecked` tinyint(1) NOT NULL DEFAULT '0',
  `IsHold` tinyint(1) NOT NULL DEFAULT '0',
  `IsDamaged` tinyint(1) NOT NULL DEFAULT '0',
  `FuRequester` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ISBN`,`CopyID`)
)





CREATE TABLE IF NOT EXISTS `floor` (
  `FloorID` int(11) NOT NULL,
  `NumAssistant` int(11) NOT NULL,
  `NumCopier` int(11) NOT NULL,
  PRIMARY KEY (`FloorID`)
)




CREATE TABLE IF NOT EXISTS `issue` (
  `Username` varchar(15) NOT NULL,
  `ISBN` char(14) NOT NULL,
  `CopyID` int(11) NOT NULL,
  `IssueID` int(4) NOT NULL,
  `ExtenDate` date DEFAULT NULL,
  `IssueDate` date NOT NULL,
  `ReturnDate` date NOT NULL,
  `NumExten` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Username`,`ISBN`,`CopyID`),
  UNIQUE KEY `IssueID` (`IssueID`),
  KEY `ISBN` (`ISBN`),
  KEY `issue_ibfk_2` (`ISBN`,`CopyID`)
)






CREATE TABLE IF NOT EXISTS `keyword` (
  `SName` varchar(30) NOT NULL,
  `Keyword` varchar(25) NOT NULL,
  PRIMARY KEY (`SName`,`Keyword`)
)




CREATE TABLE IF NOT EXISTS `shelf` (
  `ShelfID` int(11) NOT NULL,
  `FloorID` int(11) NOT NULL,
  `AisleID` int(11) NOT NULL,
  PRIMARY KEY (`ShelfID`),
  KEY `FloorID` (`FloorID`)
)




CREATE TABLE IF NOT EXISTS `staff` (
  `Username` varchar(15) NOT NULL,
  PRIMARY KEY (`Username`)
)



CREATE TABLE IF NOT EXISTS `student_faculty` (
  `Username` varchar(15) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Email` varchar(30) NOT NULL,
  `IsDebarred` tinyint(1) NOT NULL DEFAULT '0',
  `Gender` char(1) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `IsFaculty` tinyint(1) NOT NULL,
  `Penalty` decimal(5,2) NOT NULL DEFAULT '0.00',
  `Dept` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Username`)
)



CREATE TABLE IF NOT EXISTS `subject` (
  `SubName` varchar(30) NOT NULL,
  `FloorID` int(11) NOT NULL,
  `NumJournal` int(11) NOT NULL,
  PRIMARY KEY (`SubName`),
  KEY `FloorID` (`FloorID`)
) 




CREATE TABLE IF NOT EXISTS `user` (
  `Username` varchar(15) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`Username`)
)




Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`ShelfID`) REFERENCES `shelf` (`ShelfID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`SubName`) REFERENCES `subject` (`SubName`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `bookcopy`
--
ALTER TABLE `bookcopy`
  ADD CONSTRAINT `bookcopy_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issue`
--
ALTER TABLE `issue`
  ADD CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `student_faculty` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issue_ibfk_2` FOREIGN KEY (`ISBN`, `CopyID`) REFERENCES `bookcopy` (`ISBN`, `CopyID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keyword`
--
ALTER TABLE `keyword`
  ADD CONSTRAINT `keyword_ibfk_1` FOREIGN KEY (`SName`) REFERENCES `subject` (`SubName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shelf`
--
ALTER TABLE `shelf`
  ADD CONSTRAINT `shelf_ibfk_1` FOREIGN KEY (`FloorID`) REFERENCES `floor` (`FloorID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_faculty`
--
ALTER TABLE `student_faculty`
  ADD CONSTRAINT `student_faculty_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`FloorID`) REFERENCES `floor` (`FloorID`) ON DELETE CASCADE ON UPDATE CASCADE;


