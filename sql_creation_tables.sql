CREATE  DATABASE IF NOT EXISTS `gestion_planeamiento`;

USE `gestion_planeamiento`;
/*
  Creacion de la tabla usuarios
*/
CREATE TABLE IF NOT EXISTS `tb_usuarios`(
	`id_user` INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    `nombre` VARCHAR(100) NOT NULL, 
    `correo` VARCHAR(100), 
    `password` TEXT, 
    `descripcion` TEXT, 
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE = INNODB;

/*
  Creacion de la tabla roles, 
  La relacion entre roles y usuarios es de uno a uno
  usuarios(1) -> roles(1)
*/
CREATE TABLE IF NOT EXISTS `tb_roles` (
	`id_roles` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `NOMBRE` VARCHAR(50) UNIQUE NOT NULL, 
    `id_user` INT UNIQUE NOT NULL,
     CONSTRAINT `fk_user_role` FOREIGN KEY(`id_user`) REFERENCES `tb_usuarios`(`id_user`)
) ENGINE = INNODB;



