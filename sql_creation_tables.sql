CREATE  DATABASE IF NOT EXISTS `gestion_planeamiento`;

USE `gestion_planeamiento`;

CREATE TABLE IF NOT EXISTS `tb_usuarios`(
	`id_user` INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    `nombre` VARCHAR(100) NOT NULL, 
    `correo` VARCHAR(100), 
    `password` TEXT, 
    `descripcion` TEXT, 
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `tb_roles` (
	`id_roles` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `NOMBRE` VARCHAR(50) UNIQUE NOT NULL, 
    `id_user` INT NOT NULL,
     CONSTRAINT `fk_user_role` FOREIGN KEY(`id_user`) REFERENCES `tb_usuarios`(`id_user`)
) ENGINE = INNODB;



