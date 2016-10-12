//Department Tables 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";






CREATE TABLE IF NOT EXISTS `department` (
  `dname` varchar(10) NOT NULL,
  `dnumber` int(11) NOT NULL,
  `mgrssn` int(3) NOT NULL,
  `mgrstartdate` date NOT NULL,
  PRIMARY KEY (`dnumber`),
  UNIQUE KEY `mgrssn` (`mgrssn`),
  UNIQUE KEY `dnumber` (`dnumber`),
  FULLTEXT KEY `dname` (`dname`)
)






CREATE TABLE IF NOT EXISTS `employee` (
  `fname` varchar(10) NOT NULL,
  `lname` varchar(10) NOT NULL,
  `ssn` int(9) NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `ssn` (`ssn`)
)





CREATE TABLE IF NOT EXISTS `project` (
  `dnum` int(11) NOT NULL,
  `mgrssn` int(9) NOT NULL,
  `plocation` varchar(10) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pid` (`pid`),
  UNIQUE KEY `mgrssn` (`mgrssn`),
  UNIQUE KEY `dnum` (`dnum`)
)



CREATE TABLE IF NOT EXISTS `recipe` (
  `RecipeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Rating` int(11) NOT NULL,
  PRIMARY KEY (`RecipeID`)
)




