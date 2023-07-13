-- Active: 1688557522293@@localhost@3306@citas_medicas
CREATE DATABASE citas_medicas;
USE citas_medicas;
DROP TABLE especialidad;
CREATE TABLE tipo_documento(
    tipdoc_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tipdoc_nombre VARCHAR(20),
    tipdoc_abreviatura VARCHAR(20)
);
CREATE TABLE genero(
    gen_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    gen_nombre VARCHAR(20),
    gen_abreviatura VARCHAR(20)
);
CREATE TABLE acudiente(
    acu_codigo INTEGER AUTO_INCREMENT PRIMARY KEY,
    acu_nombreCompleto VARCHAR(100),
    acu_telefono INTEGER,
    acu_direccion VARCHAR(200)
);
CREATE TABLE usuario(
    usu_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    usu_nombre VARCHAR(50),
    usu_segdo_nombre VARCHAR(50),
    usu_primer_apellido_usar VARCHAR(50),
    usu_segdo_apellido_usar VARCHAR(50),
    usu_telefono INTEGER,
    usu_direccion VARCHAR(100),
    usu_email VARCHAR(100),
    usu_tipodoc INTEGER,
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
    esp_nombre VARCHAR(20)
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