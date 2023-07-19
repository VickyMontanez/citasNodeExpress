-- Active: 1688557522293@@localhost@3306@citas_medicas
CREATE DATABASE citas_medicas;
USE citas_medicas;
DROP DATABASE citas_medicas;
CREATE TABLE tipo_documento(
    tipdoc_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tipdoc_nombre VARCHAR(20),
    tipdoc_abreviatura VARCHAR(20)
);
SELECT * FROM usuario;
CREATE TABLE genero(
    gen_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    gen_nombre VARCHAR(20),
    gen_abreviatura VARCHAR(20)
);
CREATE TABLE acudiente(
    acu_codigo INTEGER AUTO_INCREMENT PRIMARY KEY,
    acu_nombreCompleto VARCHAR(100),
    acu_telefono VARCHAR(20),
    acu_direccion VARCHAR(200)
);
CREATE TABLE usuario(
    usu_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usu_nombre VARCHAR(50) NOT NULL,
    usu_segdo_nombre VARCHAR(50),
    usu_primer_apellido_usuar VARCHAR(50) NOT NULL,
    usu_segdo_apellido_usuar VARCHAR(50),
    usu_telefono VARCHAR(20) NOT NULL,
    usu_direccion VARCHAR(100) NOT NULL,
    usu_email VARCHAR(100),
    usu_tipodoc INTEGER NOT NULL,
    FOREIGN KEY (usu_tipodoc) REFERENCES tipo_documento(tipdoc_id),
    usu_genero INTEGER,
    FOREIGN KEY (usu_genero) REFERENCES genero(gen_id),
    usu_acudiente INTEGER,
    FOREIGN KEY (usu_acudiente) REFERENCES acudiente(acu_codigo)
);
CREATE TABLE estado_cita(
    estcita_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    estcita_nombre VARCHAR(20)
);
CREATE TABLE especialidad(
    esp_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    esp_nombre VARCHAR(200)
);
CREATE TABLE consultorio(
    cons_codigo INTEGER AUTO_INCREMENT PRIMARY KEY,
    cons_nombre VARCHAR(50)
);

CREATE TABLE medico(
    med_nroMatriculaProsional INTEGER AUTO_INCREMENT primary KEY,
    med_nombreCompleto VARCHAR(120),
    med_consultorio INTEGER,
    FOREIGN KEY (med_consultorio) REFERENCES consultorio(cons_codigo),
    med_especialidad INTEGER,
    FOREIGN KEY (med_especialidad) REFERENCES especialidad(esp_id)
);
CREATE TABLE cita(
    cit_codigo INTEGER AUTO_INCREMENT PRIMARY KEY,
    cit_fecha DATE,
    cit_datosUsuario INTEGER,
    FOREIGN KEY (cit_datosUsuario) REFERENCES usuario(usu_id),
    cit_medico INTEGER,
    FOREIGN KEY(cit_medico) REFERENCES medico(med_nroMatriculaProsional),
    cit_estadoCita INTEGER,
    FOREIGN KEY (cit_estadoCita) REFERENCES estado_cita(estcita_id)
);



/* ------------------------------------------------------------TIPO DE DOCUMENTO-------------------------------------------------------------------- */
INSERT INTO tipo_documento(tipdoc_id,tipdoc_nombre,tipdoc_abreviatura) 
VALUES 
(1, "Cédula de Ciudadania", "CC"),
(2, "Cédula Digital", "CC DIG"),
(3, "Cédula de Extranjeria", "CE"),
(4, "Tarjeta de Identidad", "TI"),
(5, "Registro Civil", "RC"),
(6, "Número de Identificación Personal", "NIP"),
(7, "Número Único de Identificación personal", "NUIP"),
(8, "Número de Secretaría", "NES"),
(9, "Pasaporte", "PA"),
(10,"Carnet Diplomático", "CD");

/* ------------------------------------------------------------ GENEROS-------------------------------------------------------------------- */
INSERT INTO genero(gen_id,gen_nombre,gen_abreviatura)
VALUES
(1, "Masculino", "M"),
(2, "Femenino", "F"),
(3, "Otro", "OTRO");

/* ----------------------------------------------USUARIOS------------------------------------------------------------------------------------ */
/* -------MAYORES DE EDAD------- */
INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente) VALUES 
('532','Andres','Santiago','Carvajal','Peliño','3154784596','Bucaramanga','santiagoyo@gmail.com',1,1,null),
('323','Fabio','Alberto','Morales','Petriño','3174578496','Giron','fabio478@outlook.es',1,1,null),
('332','Alejandra','Señora','Mantilla','Garcia','3007845647','Lebrija','aleja78@outlook.es',2,2,null),
('123','Andres','Santiago','Carvajal','Peliño','3154784596','Bucaramanga','santiagoyo@gmail.com',1,1, null),
('321','Fabio','Alberto','Morales','Petriño','3174578496','Giron','fabio478@outlook.es',1,1,null),
('74','Alejandra','Señora','Mantilla','Garcia','3007845647','Lebrija','aleja78@outlook.es',2,2,null);

/* ------MENORES DE EDAD-------*/
INSERT INTO usuario (usu_id, usu_nombre, usu_segdo_nombre, usu_primer_apellido_usuar, usu_segdo_apellido_usuar, usu_telefono, usu_direccion, usu_email, usu_tipodoc, usu_genero, usu_acudiente)  VALUES
('12','Vanessa','Daniella','Montañez','Molina','36878233','Floridablanca','vvvvvvv@outlook.es',4,2,123),
('24','Leidy','Alejandra','Mantilla','Rovira','3223456778','Lebrija','aleja78@gmail.com',4,2,321),
('55','Daniel','Santigo','Roa','Molina',null,'Bucaramanga',null,5,1,35),
('67','Juan','Diego','Arguello','Molina',null,'Piedecuesta',null,5,1,90);


/* ----------------------------------------------------------------------ACUDIENTES----------------------------------------------------------- */
INSERT INTO acudiente(acu_codigo,acu_nombreCompleto ,acu_telefono,acu_direccion) VALUES
(123, 'Jose Tierra Puertas','32227222','Floridablanca'),
(321, 'Andrea Garcia Rovira','3223456778','Lebrija'),
(35, 'Marlene Molina Salcedo','30152178','Bucaramanga'),
(90,'Marlene Molina Salcedo', '6774344','Piedecuesta');

/* ------------------------------------------------------------ ESPECIALIDADES -------------------------------------------------------------------- */
INSERT INTO especialidad( esp_id, esp_nombre) VALUES 
(1,"Cardiología"),
(2,'Neumología'),
(3,'Geriatría'),
(4,'Hematología y hemoterapia'),
(5,'Nefrología'),
(6,'Neurología'),
(7,'Pediatría '),
(8,'Psiquiatría'),
(9,'Rehabilitación'),
(10,'Reumatología chloride'),
(11,'Neurocirugía');

/* ------------------------------------------------------------ CONSULTORIOS -------------------------------------------------------------------- */
INSERT INTO  consultorio (cons_codigo,cons_nombre) VALUES 
(1,'Recepción 1'),
(2,'Recepción 2'), 
(3,'Recepción 3'),
(4,'Pediatria'),
(5,'Pediatria prem'),
(6,'Odontología'),
(7,'Rehabilitación'),
(8,'Neurología'),
(9,'Urgencias'),
(10,'Psiquiatría');

/* ---------------------------------------------------------------MEDICOS-------------------------------------------------------------------- */
INSERT INTO medico (med_nroMatriculaProsional, med_nombreCompleto, med_consultorio, med_especialidad) VALUES 
(123456, 'Dr. Juan Pérez', 1, 1),
(234567, 'Dra. Ana Rodríguez', 2, 2),
(345678, 'Dr. Luis Martínez', 3, 3),
(456789, 'Dra. Laura Gómez', 4, 4),
(567890, 'Dr. Carlos Sánchez', 5, 5);


/* --------------------------------------------------------ESTADO CITA---------------------------------------------------------------------- */

INSERT INTO estado_cita (estcita_id, estcita_nombre) VALUES 
(1, 'Pendiente'),
(2, 'Confirmada'),
(3, 'Cancelada'),
(4, 'Realizada'),
(5, 'Ausente');

/* --------------------------------------------------------CITAS------------------------------------------------------------------------------- */
INSERT INTO cita (cit_codigo, cit_fecha, cit_datosUsuario, cit_medico, cit_estadoCita) VALUES 
(1, '2023-07-13', 532, 123456, 1),
(2, '2023-07-14', 323, 234567, 2),
(3, '2023-07-15', 332, 345678, 3),
(4, '2023-07-16', 123, 456789, 4),
(5, '2023-07-17', 321, 567890, 5),
(6, '2023-07-14', 74, 234567, 2),
(7, '2023-07-15', 12, 345678, 3),
(8, '2023-07-16', 24, 456789, 4),
(9, '2023-07-17', 55, 567890, 5),
(10, '2023-07-17', 67, 567890, 5);
