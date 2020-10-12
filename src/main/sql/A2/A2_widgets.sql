CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `dtype` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `shareable` tinyint(1) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  `html` varchar(45) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `widgets` VALUES (123,'YouTube','DBB Lecture',123,'http://video1',1,NULL,NULL,NULL),(234,'Image','UML Diagram',234,NULL,NULL,'http://image234',NULL,NULL);
