-- Creación de base de datos
DROP DATABASE IF EXISTS portfolio;
CREATE DATABASE portfolio;
USE portfolio;

DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS inicio;
DROP TABLE IF EXISTS sobre;
DROP TABLE IF EXISTS barra_habilidades;
DROP TABLE IF EXISTS trabajos;
DROP TABLE IF EXISTS curriculum;

-- Creación de tablas
-- Tabla de usuario
CREATE TABLE usuario (
	usuario_id INT,
    nombre VARCHAR(50),
    email VARCHAR(50),
    contrasena VARCHAR(30),
    CONSTRAINT PK_USUARIO PRIMARY KEY (usuario_id)
);

-- Tabla sección inicio de portfolio
CREATE TABLE inicio (
	inicio_id INT,
	usuario_id INT,
    nombre VARCHAR(50),
    texto_inicio VARCHAR(50),
    imagen_inicio LONGBLOB DEFAULT NULL,
    CONSTRAINT PK_INICIO PRIMARY KEY (inicio_id)
);

-- Tabla sección sobre mí de portfolio
CREATE TABLE sobre (
	sobre_id INT,
	usuario_id INT,
    nombre VARCHAR(50),
    texto VARCHAR(1000),
    CONSTRAINT PK_SOBRE_USUARIO PRIMARY KEY (sobre_id)
);

-- Tabla sección barras de habilidades de portfolio
CREATE TABLE barra_habilidades (
	habilidad_id INT,
    usuario_id INT,
    habilidad_usuario VARCHAR(50),
    porcentaje_hablidad INT,
    CONSTRAINT PK_HABILIDADES_USUARIO PRIMARY KEY (habilidad_id)
);

-- Tabla sección trabajos de portfolio
CREATE TABLE trabajos (
	trabajo_id INT,
    usuario_id INT,
    imagen_trabajo LONGBLOB DEFAULT NULL,
    titulo_trabajo VARCHAR(50),
    CONSTRAINT PK_TRABAJOS_USUARIO PRIMARY KEY (trabajo_id)
);

-- Tabla sección curriculum de portfolio
CREATE TABLE curriculum (
	curriculum_id INT,
	usuario_id INT,
    imagen_cv LONGBLOB DEFAULT NULL,
    CONSTRAINT PK_CV_USUARIO PRIMARY KEY (curriculum_id)
);

-- FOREIGN KEY
-- Referencia: FK_USUARIO_INICIO (Tabla: usuario)
ALTER TABLE inicio ADD CONSTRAINT FK_USUARIO_INICIO
FOREIGN KEY FK_USUARIO_INICIO (usuario_id) REFERENCES usuario (usuario_id);

-- Referencia: FK_USUARIO_SOBRE (Tabla: usuario)
ALTER TABLE sobre ADD CONSTRAINT FK_USUARIO_SOBRE
FOREIGN KEY FK_USUARIO_SOBRE (usuario_id) REFERENCES usuario (usuario_id);

-- Referencia: FK_USUARIO_HABILIDAD (Tabla: usuario)
ALTER TABLE barra_habilidades ADD CONSTRAINT FK_USUARIO_HABILIDAD
FOREIGN KEY FK_USUARIO_HABILIDAD (usuario_id) REFERENCES usuario (usuario_id);

-- Referencia: FK_USUARIO_TRABAJO (Tabla: usuario)
ALTER TABLE trabajos ADD CONSTRAINT FK_USUARIO_TRABAJO
FOREIGN KEY FK_USUARIO_TRABAJO (usuario_id) REFERENCES usuario (usuario_id);

-- Referencia: FK_USUARIO_CURRICULUM (Tabla: usuario)
ALTER TABLE curriculum ADD CONSTRAINT FK_USUARIO_CURRICULUM
FOREIGN KEY FK_USUARIO_CURRICULUM (usuario_id) REFERENCES usuario (usuario_id);

-- Inserción de datos
/*Sección de inserción 
de datos en las tablas correspondientes*/

INSERT INTO usuario VALUES (1, "Gonzalo", "gonzalodiez97@gmail.com", "Paton@2001");

INSERT INTO inicio VALUES (1, 1, "Gonzalo", "Desarrollador Front End", NULL);

INSERT INTO sobre VALUES (1, 1, "Gonzalo", "Y soy un desarrollador web especializado en Front End, me gusta leer libros y el cine y practicar jiu jitsu.");

INSERT INTO barra_habilidades VALUES (1, 1, "HTML5", 95),
(2, 1, "CSS3", 85),
(3, 1, "JAVASCRIPT", 80),
(4, 1, "REACT", 75),
(5, 1, "MySQL", 60);

INSERT INTO trabajos VALUES (1, 1, NULL, "App Libreria"),
(2, 1, NULL, "Calculadora JS"),
(3, 1, NULL, "Tateti JS");

INSERT INTO curriculum VALUES (1, 1, NULL);

-- Creación de usuario
CREATE USER gonzalodiez@localhost IDENTIFIED BY "gonzalo";

-- Permisos de usuario
GRANT SELECT, UPDATE, INSERT, DELETE ON *.* TO gonzalodiez@localhost;