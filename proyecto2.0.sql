-- MySQL Script generated by MySQL Workbench
-- Fri Mar 15 17:16:27 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
-- Creación de la tabla Estado
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
use `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
-- Creación de la tabla Estado
CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `detalles` VARCHAR(250) NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Creación de la tabla TipoUsuario
CREATE TABLE IF NOT EXISTS `mydb`.TipoUsuario (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipoUsuario` VARCHAR(30) NOT NULL,
   `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_TipoUsuario_Estado`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Creación de la tabla TipoDocumento
CREATE TABLE IF NOT EXISTS `mydb`.`TipoDocumento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipoDocumento` VARCHAR(45) NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_TipoDocumento_Estado`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla usuario
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `primerApellido` VARCHAR(45) NOT NULL,
  `segundoApellido` VARCHAR(45) NOT NULL,
  `documento` VARCHAR(45) NOT NULL,
   `estado` INT NOT null,
   `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `TipoUsuario_id` INT NOT NULL,
  `TipoDocumento_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  
  CONSTRAINT `fk_usuario_TipoUsuario`
    FOREIGN KEY (`TipoUsuario_id`)
    REFERENCES `mydb`.`TipoUsuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_TipoDocumento1`
    FOREIGN KEY (`TipoDocumento_id`)
    REFERENCES `mydb`.`TipoDocumento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Horario
CREATE TABLE IF NOT EXISTS `mydb`.`Horario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `horario` VARCHAR(45) NOT NULL,
  `horaInicio` TIME NULL,
  `horaFinal` TIME NULL,
  `detalles` VARCHAR(250) NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Horario_Estado`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

select*from Usuario;
-- Creación de la tabla TipoCurso
CREATE TABLE IF NOT EXISTS `mydb`.`TipoCurso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipoCurso` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_TipoCurso_Estado`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Curso
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `programa` VARCHAR(255) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `TipoCurso_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Curso_TipoCurso1`
    FOREIGN KEY (`TipoCurso_id`)
    REFERENCES `mydb`.`TipoCurso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla CursoAbierto
CREATE TABLE IF NOT EXISTS `mydb`.`CursoAbierto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inicioInscripcion` DATETIME NOT NULL,
  `inicioCurso` DATETIME NOT NULL,
  `finalizacionInscripcion` DATETIME NOT NULL,
  `finalizacionCurso` DATETIME NOT NULL,
  `pagoInicial` DECIMAL NOT NULL,
  `costoTotal` DECIMAL NOT NULL,
   `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Horario_id` INT NOT NULL,
  `Curso_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_CursoAbierto_Horario1`
    FOREIGN KEY (`Horario_id`)
    REFERENCES `mydb`.`Horario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CursoAbierto_Curso1`
    FOREIGN KEY (`Curso_id`)
    REFERENCES `mydb`.`Curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CursoAbierto_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla PlanPago
CREATE TABLE IF NOT EXISTS `mydb`.`PlanPago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `planPago` VARCHAR(45) NOT NULL,
  `detalles` VARCHAR(255) NULL,
  `pago` INT(2) NOT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_PlanPago_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Inscripcion`
-- -----------------------------------------------------
-- Creación de la tabla Inscripcion
CREATE TABLE IF NOT EXISTS `mydb`.`Inscripcion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comentario` TEXT NULL,
  `usuario_id` INT NOT NULL,
  `CursoAbierto_id` INT NOT NULL,
  `PlanPago_id` INT NOT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Inscripcion_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inscripcion_CursoAbierto1`
    FOREIGN KEY (`CursoAbierto_id`)
    REFERENCES `mydb`.`CursoAbierto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inscripcion_PlanPago1`
    FOREIGN KEY (`PlanPago_id`)
    REFERENCES `mydb`.`PlanPago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inscripcion_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Asignatura
CREATE TABLE IF NOT EXISTS `mydb`.`Asignatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `asignatura` VARCHAR(45) NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Asignatura_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla AsignaturaCurso
CREATE TABLE IF NOT EXISTS `mydb`.`AsignaturaCurso` (
  `Asignatura_id` INT NOT NULL,
  `CursoAbierto_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`Asignatura_id`, `CursoAbierto_id`),
  CONSTRAINT `fk_AsignaturaCurso_Asignatura1`
    FOREIGN KEY (`Asignatura_id`)
    REFERENCES `mydb`.`Asignatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsignaturaCurso_CursoAbierto1`
    FOREIGN KEY (`CursoAbierto_id`)
    REFERENCES `mydb`.`CursoAbierto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsignaturaCurso_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla AsignaturaDocente
CREATE TABLE IF NOT EXISTS `mydb`.`AsignaturaDocente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idDocente` INT NOT NULL,
  `idAsignatura` INT NOT NULL,
  `CursoAbierto_id` INT NOT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_AsignaturaDocente_usuario1`
    FOREIGN KEY (`idDocente`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsignaturaDocente_Asignatura1`
    FOREIGN KEY (`idAsignatura`)
    REFERENCES `mydb`.`Asignatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsignaturaDocente_CursoAbierto1`
    FOREIGN KEY (`CursoAbierto_id`)
    REFERENCES `mydb`.`CursoAbierto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsignaturaDocente_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Actividad
CREATE TABLE IF NOT EXISTS `mydb`.`Actividad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fechaInicio` DATETIME NOT NULL,
  `fechaVencimiento` DATETIME NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CursoAbierto_id` INT NOT NULL,
  `AsignaturaCurso_Asignatura_id` INT NOT NULL,
  `AsignaturaCurso_CursoAbierto_id` INT NOT NULL,
  `AsignaturaDocente_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Actividad_CursoAbierto1`
    FOREIGN KEY (`CursoAbierto_id`)
    REFERENCES `mydb`.`CursoAbierto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_AsignaturaCurso1`
    FOREIGN KEY (`AsignaturaCurso_Asignatura_id` , `AsignaturaCurso_CursoAbierto_id`)
    REFERENCES `mydb`.`AsignaturaCurso` (`Asignatura_id` , `CursoAbierto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_AsignaturaDocente1`
    FOREIGN KEY (`AsignaturaDocente_id`)
    REFERENCES `mydb`.`AsignaturaDocente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Estudiante
CREATE TABLE IF NOT EXISTS `mydb`.`Estudiante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `actividad` TEXT NOT NULL,
  `comentario` TEXT NULL,
   `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Inscripcion_id` INT NOT NULL,
  `Actividad_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Estudiante_Inscripcion1`
    FOREIGN KEY (`Inscripcion_id`)
    REFERENCES `mydb`.`Inscripcion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_Actividad1`
    FOREIGN KEY (`Actividad_id`)
    REFERENCES `mydb`.`Actividad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Calificacion
CREATE TABLE IF NOT EXISTS `mydb`.`Calificacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombreGrado` VARCHAR(45) NOT NULL,
  `numeroGrado` DECIMAL(3,2) NOT NULL,
  `Estudiante_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Calificacion_Estudiante1`
    FOREIGN KEY (`Estudiante_id`)
    REFERENCES `mydb`.`Estudiante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calificacion_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Periodo
CREATE TABLE IF NOT EXISTS `mydb`.`Periodo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `periodo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(250) NULL,
  `fechaInicio` DATETIME NOT NULL,
  `fechaVencimiento` DATETIME NOT NULL,
  `fechaFinal` DATETIME NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Periodo_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Resporte`
-- -----------------------------------------------------
-- Creación de la tabla Reporte
CREATE TABLE IF NOT EXISTS `mydb`.`Reporte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grado` DECIMAL NOT NULL,
  `gComentario` VARCHAR(45) NULL,
  `ausencias` DECIMAL NOT NULL,
  `aComentario` VARCHAR(45) NULL,
  `comentario` VARCHAR(250) NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `idDocente` INT NOT NULL,
  `Inscripcion_id` INT NOT NULL,
  `CursoAbierto_id` INT NOT NULL,
  `Asignatura_id` INT NOT NULL,
  `Periodo_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Reporte_usuario1`
    FOREIGN KEY (`idDocente`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reporte_Inscripcion1`
    FOREIGN KEY (`Inscripcion_id`)
    REFERENCES `mydb`.`Inscripcion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reporte_CursoAbierto1`
    FOREIGN KEY (`CursoAbierto_id`)
    REFERENCES `mydb`.`CursoAbierto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reporte_Asignatura1`
    FOREIGN KEY (`Asignatura_id`)
    REFERENCES `mydb`.`Asignatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reporte_Periodo1`
    FOREIGN KEY (`Periodo_id`)
    REFERENCES `mydb`.`Periodo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reporte_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Evento
CREATE TABLE IF NOT EXISTS `mydb`.`Evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `evento` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Periodo_id` INT NOT NULL,
  `Horario_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Evento_Periodo1`
    FOREIGN KEY (`Periodo_id`)
    REFERENCES `mydb`.`Periodo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_Horario1`
    FOREIGN KEY (`Horario_id`)
    REFERENCES `mydb`.`Horario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla EventoCurso
CREATE TABLE IF NOT EXISTS `mydb`.`EventoCurso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CursoAbierto_id` INT NOT NULL,
  `Evento_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_EventoCurso_CursoAbierto1`
    FOREIGN KEY (`CursoAbierto_id`)
    REFERENCES `mydb`.`CursoAbierto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EventoCurso_Evento1`
    FOREIGN KEY (`Evento_id`)
    REFERENCES `mydb`.`Evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EventoCurso_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Noticias
CREATE TABLE IF NOT EXISTS `mydb`.`Noticias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `etiqueta` VARCHAR(30) NOT NULL,
  `noticia` TEXT NOT NULL,
  `imagen` TEXT NOT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `usuario_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Noticias_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Noticias_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla TipoRegistro
CREATE TABLE IF NOT EXISTS `mydb`.`TipoRegistro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipoRegistro` VARCHAR(45) NOT NULL,
  `descripcionRegistro` TEXT NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_TipoRegistro_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Registro
CREATE TABLE IF NOT EXISTS `mydb`.`Registro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `detalle` TIMESTAMP NOT NULL,
  `usuario_id` INT NOT NULL,
  `TipoRegistro_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Registro_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_TipoRegistro1`
    FOREIGN KEY (`TipoRegistro_id`)
    REFERENCES `mydb`.`TipoRegistro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Objetivo`
-- -----------------------------------------------------
-- Creación de la tabla Objetivo
CREATE TABLE IF NOT EXISTS `mydb`.`Objetivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(140) NOT NULL,
  `descripcion` TINYTEXT NOT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Asignatura_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Objetivo_Asignatura1`
    FOREIGN KEY (`Asignatura_id`)
    REFERENCES `mydb`.`Asignatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Objetivo_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Pregunta
CREATE TABLE IF NOT EXISTS `mydb`.`Pregunta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pregunta` VARCHAR(45) NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Pregunta_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Cuenta
CREATE TABLE IF NOT EXISTS `mydb`.`Cuenta` (
  `usuario_id` INT NOT NULL,
  `cuenta` VARCHAR(45) NOT NULL,
  `apodo` VARCHAR(45) NOT NULL,
  `imagen` TEXT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Pregunta_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `fk_Cuenta_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cuenta_Pregunta1`
    FOREIGN KEY (`Pregunta_id`)
    REFERENCES `mydb`.`Pregunta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Responsable
CREATE TABLE IF NOT EXISTS `mydb`.`Responsable` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idSupervisor` INT NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Responsable_usuario1`
    FOREIGN KEY (`idSupervisor`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Responsable_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Contraseña
CREATE TABLE IF NOT EXISTS `mydb`.`Contraseña` (
  `idUsuario` INT NOT NULL,
  `salt` BINARY(90) NOT NULL,
  `hash` BINARY(90) NOT NULL,
  `respuesta` BINARY(90) NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `fk_Contraseña_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Notificacion
CREATE TABLE IF NOT EXISTS `mydb`.`Notificacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado` INT(1) NOT NULL,
  `detalle` TEXT NOT NULL,
  `idNotificador` INT NOT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Notificacion_usuario1`
    FOREIGN KEY (`idNotificador`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Notificacion_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Correo
CREATE TABLE IF NOT EXISTS `mydb`.`Correo` (
  `idUsuario` INT NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `alteral` VARCHAR(45) NULL,
  `cPuntaje` INT(2) NULL,
   `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `fk_Correo_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Telefono
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `idUsuario` INT NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `alterar` VARCHAR(45) NULL,
  `whatsApp` INT(1) NOT NULL,
  `telegram` INT(1) NOT NULL,
  `otro` VARCHAR(45) NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_Telefono_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Descuento
CREATE TABLE IF NOT EXISTS `mydb`.`Descuento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descuento` VARCHAR(45) NOT NULL,
  `tipoDescuento` INT(1) NOT NULL,
  `monto` DECIMAL(9,2) NOT NULL,
  `descripcion` VARCHAR(250) NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Descuento_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DescuentoInscripcion`
-- -----------------------------------------------------
-- Creación de la tabla DescuentoInscripcion
CREATE TABLE IF NOT EXISTS `mydb`.`DescuentoInscripcion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `detalles` VARCHAR(255) NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Inscripcion_id` INT NOT NULL,
  `Descuento_id` INT NOT NULL,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_DescuentoInscripcion_Inscripcion1`
    FOREIGN KEY (`Inscripcion_id`)
    REFERENCES `mydb`.`Inscripcion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DescuentoInscripcion_Descuento1`
    FOREIGN KEY (`Descuento_id`)
    REFERENCES `mydb`.`Descuento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DescuentoInscripcion_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla TipoPago
CREATE TABLE IF NOT EXISTS `mydb`.`TipoPago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipoPago` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_TipoPago_Estado1`
    FOREIGN KEY (`Estado_id`)
    REFERENCES `mydb`.`Estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla Pago
CREATE TABLE IF NOT EXISTS `mydb`.`Pago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `monto` DECIMAL(9,2) NOT NULL,
  `comprobante` TEXT NOT NULL,
  `descripcion` TINYTEXT NULL,
 `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `TipoPago_id` INT NOT NULL,
  `Inscripcion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Pago_TipoPago1`
    FOREIGN KEY (`TipoPago_id`)
    REFERENCES `mydb`.`TipoPago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pago_Inscripcion1`
    FOREIGN KEY (`Inscripcion_id`)
    REFERENCES `mydb`.`Inscripcion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- Creación de la tabla HistorialEstudiante
CREATE TABLE IF NOT EXISTS `mydb`.`HistorialEstudiante` (
  `Inscripcion_id` INT NOT NULL,
  `registro` TEXT NOT NULL,
  `creado` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `modificado` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Inscripcion_id`),
  CONSTRAINT `fk_HistorialEstudiante_Inscripcion1`
    FOREIGN KEY (`Inscripcion_id`)
    REFERENCES `mydb`.`Inscripcion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




-- -------------------------------------
-- tipos de usuario activos 
-- ---------------------------------------
-- SELECT tu.id, 
   --    CASE e.estado
     --      WHEN 'activo' THEN 'Activo'
       --    ELSE 'Inactivo'
    --   END AS estado,
      -- tu.tipoUsuario
-- FROM TipoUsuario tu
-- INNER JOIN Estado e ON tu.Estado_id = e.id; 
