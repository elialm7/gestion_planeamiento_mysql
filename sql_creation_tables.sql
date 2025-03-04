CREATE  DATABASE IF NOT EXISTS `gestion_planeamiento`;

USE `gestion_planeamiento`;

CREATE TABLE IF NOT EXISTS `tb_usuarios`(
	`id_user` INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    `nombre` VARCHAR(100) NOT NULL, 
    `correo` VARCHAR(100), 
    `password` TEXT
    


)engine = innodb;

