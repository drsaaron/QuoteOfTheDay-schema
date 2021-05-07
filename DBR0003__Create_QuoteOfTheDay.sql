CREATE TABLE `QuoteOfTheDay` (
  `QotdNum` int unsigned NOT NULL AUTO_INCREMENT,
  `QuoteDate` date NOT NULL,
  `QuoteNum` int unsigned NOT NULL,
  PRIMARY KEY (`QotdNum`),
  UNIQUE KEY `RunDate` (`QuoteDate`),
  KEY `TheQuote` (`QuoteNum`),
  CONSTRAINT `FK_QuoteOfTheDay_Quote` FOREIGN KEY (`QuoteNum`) REFERENCES `Quote` (`QuoteNum`),
  CONSTRAINT `FKfm0engfvcabjhnc6prrnu1ug7` FOREIGN KEY (`QuoteNum`) REFERENCES `Quote` (`QuoteNum`)
) ENGINE=InnoDB AUTO_INCREMENT=10039080 DEFAULT CHARSET=latin1;
