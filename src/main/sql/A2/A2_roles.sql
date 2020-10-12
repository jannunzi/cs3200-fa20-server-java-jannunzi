DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `roles` VALUES ('admin'),('editor'),('owner'),('reviewer'),('writer');
