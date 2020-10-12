DROP TABLE IF EXISTS `priviledges`;
CREATE TABLE `priviledges` (
  `priviledge` varchar(45) NOT NULL,
  PRIMARY KEY (`priviledge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `priviledges` VALUES ('delete'),('read'),('update'),('write');
