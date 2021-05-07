CREATE TABLE Quote (
  `QuoteNum` int unsigned NOT NULL AUTO_INCREMENT,
  `SrcCde` int unsigned NOT NULL,
  `QuoteTxt` text NOT NULL,
  `CanUse` enum('Y','N') NOT NULL,
  PRIMARY KEY (`QuoteNum`),
  KEY `Source` (`SrcCde`),
  KEY `Usable` (`CanUse`),
  CONSTRAINT `FK_Quote_Source` FOREIGN KEY (`SrcCde`) REFERENCES `SrcVal` (`SrcCde`),
  CONSTRAINT `FKsdd3fetugmcvuew3cy4r6tis3` FOREIGN KEY (`SrcCde`) REFERENCES `SrcVal` (`SrcCde`)
) ENGINE=InnoDB AUTO_INCREMENT=1437 DEFAULT CHARSET=latin1;
