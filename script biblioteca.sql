create table biblioteca;

use biblioteca;

CREATE TABLE `suscription_type` (
  `suscription_type_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  PRIMARY KEY (`suscription_type_id`)
) 

LOCK TABLES `suscription_type` WRITE;
INSERT INTO `suscription_type` VALUES (2,'Suscripción anual','ANUAL'),(3,'Suscripción mensual','MENSUAL'),(4,'Suscripción por día','DIA');
UNLOCK TABLES;

CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `photo` blob,
  `suscription_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_FK_1` (`suscription_type_id`),
  CONSTRAINT `user_FK_1` FOREIGN KEY (`suscription_type_id`) REFERENCES `suscription_type` (`suscription_type_id`)
) 