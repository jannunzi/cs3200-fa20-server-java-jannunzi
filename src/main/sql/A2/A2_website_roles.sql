DROP TABLE IF EXISTS `website_roles`;
CREATE TABLE `website_roles` (
  `id` int(11) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `website_id` int(11) DEFAULT NULL,
  `developer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_role_enumeration_idx` (`role`),
  KEY `developer_website_role_idx` (`developer_id`),
  KEY `website_role_idx` (`website_id`),
  CONSTRAINT `developer_role` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `website_role` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `website_role_enumeration` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `website_roles` VALUES (123,'admin',123,123),(234,'reviewer',234,123);

DELIMITER ;;
/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `A2`.`website_roles_AFTER_INSERT` AFTER INSERT ON `website_roles` FOR EACH ROW
BEGIN
  IF NEW.role = 'admin' OR NEW.role = 'owner' THEN
    INSERT INTO website_priviledges VALUES (null, 'write', NEW.website_id, NEW.developer_id);
    INSERT INTO website_priviledges VALUES (null, 'update', NEW.website_id, NEW.developer_id);
    INSERT INTO website_priviledges VALUES (null, 'delete', NEW.website_id, NEW.developer_id);
    INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
  END IF;
  IF NEW.role = 'reviewer' THEN
    INSERT INTO website_priviledges VALUES (null, 'read', NEW.website_id, NEW.developer_id);
  END IF;
END */;;
DELIMITER ;
