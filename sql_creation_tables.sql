create database if not exists `gestion_planeamiento`;

use `gestion_planeamiento`;

-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestion_planeamiento
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_grado`
--

DROP TABLE IF EXISTS `tb_grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grado` (
  `id_grado` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_grado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_grado_seccion`
--

DROP TABLE IF EXISTS `tb_grado_seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grado_seccion` (
  `id_grado_fk` bigint(20) DEFAULT NULL,
  `id_grado_seccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_seccion_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_grado_seccion`),
  KEY `FKctp6anr9rq75ynu9fm1jif2f7` (`id_grado_fk`),
  KEY `FK7w6mucq40l6myd6r964b3lxna` (`id_seccion_fk`),
  CONSTRAINT `FK7w6mucq40l6myd6r964b3lxna` FOREIGN KEY (`id_seccion_fk`) REFERENCES `tb_seccion` (`id_seccion`),
  CONSTRAINT `FKctp6anr9rq75ynu9fm1jif2f7` FOREIGN KEY (`id_grado_fk`) REFERENCES `tb_grado` (`id_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_horario`
--

DROP TABLE IF EXISTS `tb_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_horario` (
  `horario_fin` time(6) DEFAULT NULL,
  `horario_inicio` time(6) DEFAULT NULL,
  `grado_seccion_id` bigint(20) DEFAULT NULL,
  `id_horario` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_materia` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `dia` enum('JUEVES','LUNES','MARTES','MIERCOLES','VIERNES') DEFAULT NULL,
  `turno` enum('MANIANA','TARDE') DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  UNIQUE KEY `UKrqev3v1a3s5os353lgtq8te9v` (`grado_seccion_id`),
  UNIQUE KEY `UK7gvusmh3sfyasyc7ebbj87od1` (`id_materia`),
  KEY `FKtaghfbi9innns4c33aho7rppy` (`user_id`),
  CONSTRAINT `FK8bog3ulpue11lvaoiyt36epy0` FOREIGN KEY (`grado_seccion_id`) REFERENCES `tb_grado_seccion` (`id_grado_seccion`),
  CONSTRAINT `FKm3vg0u61cxcr4pwn0rb1sf6lq` FOREIGN KEY (`id_materia`) REFERENCES `tb_materia` (`id_materia`),
  CONSTRAINT `FKtaghfbi9innns4c33aho7rppy` FOREIGN KEY (`user_id`) REFERENCES `tb_usuarios` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_materia`
--

DROP TABLE IF EXISTS `tb_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_materia` (
  `id_materia` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_permisos`
--

DROP TABLE IF EXISTS `tb_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_permisos` (
  `id_permiso` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion_permiso` varchar(255) DEFAULT NULL,
  `nombre_permiso` varchar(255) NOT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `UKh1f9o3y7vrpsfx59c2n0enmqm` (`nombre_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_planeamiento`
--

DROP TABLE IF EXISTS `tb_planeamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_planeamiento` (
  `grado_seccion_id` bigint(20) DEFAULT NULL,
  `id_planeamiento` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) DEFAULT NULL,
  `materia_id` bigint(20) DEFAULT NULL,
  `plan_detalle_id` bigint(20) DEFAULT NULL,
  `raw_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_planeamiento`),
  UNIQUE KEY `UKsbw4ktv3y423s6ntbxx1pmhn0` (`grado_seccion_id`),
  UNIQUE KEY `UKgko7vmyqf4p7ol72hr62b2vfa` (`materia_id`),
  UNIQUE KEY `UKcgd08yr17uq3cmpvon22ls5bb` (`plan_detalle_id`),
  KEY `FK63iiy3yr0v0pc6mdyatpcy0id` (`id_user`),
  CONSTRAINT `FK11x04t17f5rn88so6doe4on7v` FOREIGN KEY (`plan_detalle_id`) REFERENCES `tb_planeamiento_detalle` (`id_planeamiento_detalle`),
  CONSTRAINT `FK63iiy3yr0v0pc6mdyatpcy0id` FOREIGN KEY (`id_user`) REFERENCES `tb_usuarios` (`id_user`),
  CONSTRAINT `FK6nljvtg7de3l54v6kx47cuoxk` FOREIGN KEY (`materia_id`) REFERENCES `tb_materia` (`id_materia`),
  CONSTRAINT `FKd5b07u9ylpyup2k8b90q0nmvp` FOREIGN KEY (`grado_seccion_id`) REFERENCES `tb_grado_seccion` (`id_grado_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_planeamiento_actividades`
--

DROP TABLE IF EXISTS `tb_planeamiento_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_planeamiento_actividades` (
  `id_plan_act` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_planeamiento_fk` bigint(20) DEFAULT NULL,
  `actividad` varchar(255) DEFAULT NULL,
  `desarrollo_directo` varchar(255) DEFAULT NULL,
  `actividad_pertenece_tipo` enum('ALUMNO','DOCENTE','NINGUNO') DEFAULT NULL,
  `actividad_realiza_tipo` enum('APERTURA','CIERRE','DESARROLLO','SIMPLE') DEFAULT NULL,
  PRIMARY KEY (`id_plan_act`),
  KEY `FKqgtyuh9dxo2lmn7jwyy4canrq` (`id_planeamiento_fk`),
  CONSTRAINT `FKqgtyuh9dxo2lmn7jwyy4canrq` FOREIGN KEY (`id_planeamiento_fk`) REFERENCES `tb_planeamiento` (`id_planeamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_planeamiento_capacidades`
--

DROP TABLE IF EXISTS `tb_planeamiento_capacidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_planeamiento_capacidades` (
  `id_plan_cap` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_planeamiento_fk` bigint(20) NOT NULL,
  `capacidad` varchar(255) NOT NULL,
  PRIMARY KEY (`id_plan_cap`),
  KEY `FKj23ik5kjulmdwik68p2bl7tq3` (`id_planeamiento_fk`),
  CONSTRAINT `FKj23ik5kjulmdwik68p2bl7tq3` FOREIGN KEY (`id_planeamiento_fk`) REFERENCES `tb_planeamiento` (`id_planeamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_planeamiento_comentario`
--

DROP TABLE IF EXISTS `tb_planeamiento_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_planeamiento_comentario` (
  `id_planeamiento_comentario` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_planeamiento_fk` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_planeamiento_comentario`),
  KEY `FKrnx7pbqfuddytejmapplfn8sk` (`id_planeamiento_fk`),
  KEY `FKgtk1cxrtba1my3e4oej7gfind` (`id_user`),
  CONSTRAINT `FKgtk1cxrtba1my3e4oej7gfind` FOREIGN KEY (`id_user`) REFERENCES `tb_usuarios` (`id_user`),
  CONSTRAINT `FKrnx7pbqfuddytejmapplfn8sk` FOREIGN KEY (`id_planeamiento_fk`) REFERENCES `tb_planeamiento` (`id_planeamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_planeamiento_detalle`
--

DROP TABLE IF EXISTS `tb_planeamiento_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_planeamiento_detalle` (
  `fecha_desarrollo` date DEFAULT NULL,
  `id_planeamiento_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `observacion` varchar(255) DEFAULT NULL,
  `recursos` varchar(255) DEFAULT NULL,
  `unidad_tematica` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_planeamiento_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_planeamiento_indicadores`
--

DROP TABLE IF EXISTS `tb_planeamiento_indicadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_planeamiento_indicadores` (
  `id_plan_indicadores` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_planeamiento_fk` bigint(20) NOT NULL,
  `indicador` varchar(255) NOT NULL,
  PRIMARY KEY (`id_plan_indicadores`),
  KEY `FK10cc4uj7enhp1c4w9mwo1itgu` (`id_planeamiento_fk`),
  CONSTRAINT `FK10cc4uj7enhp1c4w9mwo1itgu` FOREIGN KEY (`id_planeamiento_fk`) REFERENCES `tb_planeamiento` (`id_planeamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_rol_permisos`
--

DROP TABLE IF EXISTS `tb_rol_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rol_permisos` (
  `id_permiso_fk` bigint(20) NOT NULL,
  `id_rol_fk` bigint(20) NOT NULL,
  KEY `FKqm8dkiqcnr1g6hyk9ded5kll1` (`id_permiso_fk`),
  KEY `FKfxv7lboxt4wo1lhg200xpwsn0` (`id_rol_fk`),
  CONSTRAINT `FKfxv7lboxt4wo1lhg200xpwsn0` FOREIGN KEY (`id_rol_fk`) REFERENCES `tb_roles` (`id_rol`),
  CONSTRAINT `FKqm8dkiqcnr1g6hyk9ded5kll1` FOREIGN KEY (`id_permiso_fk`) REFERENCES `tb_permisos` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_roles`
--

DROP TABLE IF EXISTS `tb_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_roles` (
  `id_rol` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `UKrpo073uy62kh8noi4km44n9gm` (`nombre_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_seccion`
--

DROP TABLE IF EXISTS `tb_seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_seccion` (
  `id_seccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_seccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_tokens`
--

DROP TABLE IF EXISTS `tb_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tokens` (
  `activo` bit(1) DEFAULT NULL,
  `expiracion` date DEFAULT NULL,
  `id_token` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario_fk` bigint(20) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `tipo_token` enum('GOOGLE','JWT') DEFAULT NULL,
  PRIMARY KEY (`id_token`),
  UNIQUE KEY `UK2wikb4oog6jq4h6est1maw7e0` (`token`),
  KEY `FKf4vul91w29glbs347m701e40c` (`id_usuario_fk`),
  CONSTRAINT `FKf4vul91w29glbs347m701e40c` FOREIGN KEY (`id_usuario_fk`) REFERENCES `tb_usuarios` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios` (
  `id_rol_fk` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `FKft557lcqfm80y0m089jvjrvvo` (`id_rol_fk`),
  CONSTRAINT `FKft557lcqfm80y0m089jvjrvvo` FOREIGN KEY (`id_rol_fk`) REFERENCES `tb_roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-18  0:59:18
