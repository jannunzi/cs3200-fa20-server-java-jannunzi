CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userAgreement` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_isa_person` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` VALUES (234,1);
