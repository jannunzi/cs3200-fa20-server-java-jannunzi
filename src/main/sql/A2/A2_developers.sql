DROP TABLE IF EXISTS `developers`;
CREATE TABLE `developers` (
  `id` int(11) NOT NULL,
  `developerKey` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `developer_is_person` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `developers` VALUES (123,'DEVEKEY1234');
